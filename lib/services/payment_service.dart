import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import '../config/environment_dev.dart'; // Import the concrete implementation
import 'http_service.dart';
import '../utils/error_handler.dart';

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
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/verify-payment'; // Add this
  Future<int> getQuestionBalance(String token) async {
    try {
      print('🔄 Calling balance endpoint: $_balanceEndpoint'); // Debug
      final response = await HttpService.get(
        _balanceEndpoint, // This should now be full URL
        token: token,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final balance = jsonData['balance'] as int? ?? 0;

        //final usageStats = jsonData['usageStats'] as Map<String, dynamic>?;

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

  Future<List<Map<String, dynamic>>> getOffers() async {
    try {
      print('🔄 Calling offers endpoint: $_offersEndpoint');
      final response = await HttpService.get(_offersEndpoint);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Extract the "packages" array
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

  // 🆕 NEW: Verify payment method
  Future<Map<String, dynamic>> verifyPackagePayment({
    required String token,
    required String paymentIntentId,
  }) async {
    try {
      print('🔄 Verifying payment: $paymentIntentId');

      final response = await HttpService.post(
        _verifyPaymentEndpoint,
        token: token,
        body: {'paymentIntentId': paymentIntentId},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
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

  Future<void> initializeStripe() async {
    try {
      print(
        '🔄 Initializing Stripe with key: ${DevelopmentEnvironment.stripePublishableKey}',
      );
      Stripe.publishableKey = DevelopmentEnvironment.stripePublishableKey;

      if (DevelopmentEnvironment.isProduction) {
        Stripe.merchantIdentifier = 'your.merchant.identifier';
      }

      await Stripe.instance.applySettings();
      print('✅ Stripe initialized successfully');
    } catch (e) {
      print('❌ Stripe initialization error: $e');
      throw ErrorHandler.handleStripeError(e);
    }
  }
}
