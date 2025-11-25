import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import '../config/environment_dev.dart';
import 'http_service.dart';
import '../utils/error_handler.dart';
import 'package:flutter/foundation.dart';

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  PaymentService._internal();

  // Use FULL URLs with the base URL
  String get _balanceEndpoint =>
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/balance';
  String get _offersEndpoint =>
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/packages';
  String get _paymentIntentEndpoint =>
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/create-payment';
  String get _verifyPaymentEndpoint =>
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/verify-payment';

  Future<int> getQuestionBalance(String token) async {
    try {
      debugPrint('🔄 Calling balance endpoint: $_balanceEndpoint');
      final response = await HttpService.get(_balanceEndpoint, token: token);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final balance = jsonData['balance'] as int? ?? 0;
        return balance;
      } else {
        throw ApiException(
          'Failed to load balance: ${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      throw ErrorHandler.handlePaymentError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getOffers(String token) async {
    try {
      debugPrint('🔄 Calling offers endpoint: $_offersEndpoint');
      final response = await HttpService.get(_offersEndpoint, token: token);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final packages = jsonData['packages'] as List;
        return packages.cast<Map<String, dynamic>>();
      } else {
        throw ApiException(
          'Failed to load offers: ${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      throw ErrorHandler.handlePaymentError(e);
    }
  }

  Future<String> createPaymentIntent({
    required String token,
    required String packageId,
  }) async {
    try {
      final response = await HttpService.post(
        _paymentIntentEndpoint,
        token: token,
        body: {'packageId': packageId},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['clientSecret'];
      } else {
        throw ApiException(
          'Failed to create payment intent: ${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      throw ErrorHandler.handlePaymentError(e);
    }
  }

  // 🆕 ENHANCED: Verify payment with webhook status
  Future<PaymentVerificationResult> verifyPackagePayment({
    required String token,
    required String paymentIntentId,
  }) async {
    try {
      debugPrint('🔄 Verifying payment: $paymentIntentId');

      final response = await HttpService.post(
        _verifyPaymentEndpoint,
        token: token,
        body: {'paymentIntentId': paymentIntentId},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Handle the new response structure
        if (jsonResponse['verified'] == true) {
          if (jsonResponse['alreadyProcessed'] == true) {
            return PaymentVerificationResult.completed(
              questions: jsonResponse['questions'] as int,
              amount: (jsonResponse['amount'] as num).toDouble(),
              packageId: jsonResponse['packageId'] as String,
              paymentIntentId: paymentIntentId,
            );
          } else {
            return PaymentVerificationResult.awaitingWebhook(
              questions: jsonResponse['questions'] as int,
              amount: (jsonResponse['amount'] as num).toDouble(),
              packageId: jsonResponse['packageId'] as String,
              paymentIntentId: paymentIntentId,
            );
          }
        } else {
          return PaymentVerificationResult.failed(
            error:
                jsonResponse['error'] as String? ??
                'Payment verification failed',
            errorCode: jsonResponse['code'] as String?,
          );
        }
      } else {
        throw ApiException(
          'Failed to verify payment: ${response.statusCode}',
          response.statusCode,
        );
      }
    } catch (e) {
      throw ErrorHandler.handlePaymentError(e);
    }
  }

  // 🆕 NEW: Poll for webhook completion
  Future<PaymentVerificationResult> pollForWebhookCompletion({
    required String token,
    required String paymentIntentId,
    int maxAttempts = 12,
    int intervalSeconds = 2,
  }) async {
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      debugPrint(
        '⏳ Polling for webhook completion (attempt $attempt/$maxAttempts)',
      );

      await Future.delayed(Duration(seconds: intervalSeconds));

      try {
        final result = await verifyPackagePayment(
          token: token,
          paymentIntentId: paymentIntentId,
        );

        if (result.isCompleted) {
          return result;
        }

        // If still awaiting webhook, continue polling
        if (result.isAwaitingWebhook) {
          continue;
        }

        // If failed, return the failure
        if (result.isFailed) {
          return result;
        }
      } catch (e) {
        debugPrint('❌ Polling attempt $attempt failed: $e');
        // Continue polling on network errors
        if (attempt == maxAttempts) {
          return PaymentVerificationResult.failed(
            error:
                'Webhook processing timeout. Your questions will be added shortly.',
            errorCode: 'WEBHOOK_TIMEOUT',
          );
        }
      }
    }

    return PaymentVerificationResult.failed(
      error: 'Payment is processing. Your questions will be added shortly.',
      errorCode: 'PROCESSING_TIMEOUT',
    );
  }

  Future<void> initializeStripe() async {
    try {
      debugPrint(
        '🔄 Initializing Stripe with key: ${DevelopmentEnvironment.stripePublishableKey}',
      );
      Stripe.publishableKey = DevelopmentEnvironment.stripePublishableKey;

      if (DevelopmentEnvironment.isProduction) {
        Stripe.merchantIdentifier = 'your.merchant.identifier';
      }

      await Stripe.instance.applySettings();
      debugPrint('✅ Stripe initialized successfully');
    } catch (e) {
      debugPrint('❌ Stripe initialization error: $e');
      throw ErrorHandler.handleStripeError(e);
    }
  }
}

// 🆕 Enhanced result class for better type handling
class PaymentVerificationResult {
  final bool isVerified;
  final bool isCompleted;
  final bool isAwaitingWebhook;
  final bool isFailed;
  final String? error;
  final String? errorCode;
  final int? questions;
  final double? amount;
  final String? packageId;
  final String? paymentIntentId;

  PaymentVerificationResult._({
    required this.isVerified,
    required this.isCompleted,
    required this.isAwaitingWebhook,
    required this.isFailed,
    this.error,
    this.errorCode,
    this.questions,
    this.amount,
    this.packageId,
    this.paymentIntentId,
  });

  factory PaymentVerificationResult.completed({
    required int questions,
    required double amount,
    required String packageId,
    required String paymentIntentId,
  }) {
    return PaymentVerificationResult._(
      isVerified: true,
      isCompleted: true,
      isAwaitingWebhook: false,
      isFailed: false,
      questions: questions,
      amount: amount,
      packageId: packageId,
      paymentIntentId: paymentIntentId,
    );
  }

  factory PaymentVerificationResult.awaitingWebhook({
    required int questions,
    required double amount,
    required String packageId,
    required String paymentIntentId,
  }) {
    return PaymentVerificationResult._(
      isVerified: true,
      isCompleted: false,
      isAwaitingWebhook: true,
      isFailed: false,
      questions: questions,
      amount: amount,
      packageId: packageId,
      paymentIntentId: paymentIntentId,
    );
  }

  factory PaymentVerificationResult.failed({
    required String error,
    String? errorCode,
  }) {
    return PaymentVerificationResult._(
      isVerified: false,
      isCompleted: false,
      isAwaitingWebhook: false,
      isFailed: true,
      error: error,
      errorCode: errorCode,
    );
  }
}
