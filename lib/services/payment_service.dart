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
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/offers';
  String get _paymentIntentEndpoint =>
      '${DevelopmentEnvironment.baseUrl}/api/questionspayment/create-payment-intent';

  Future<int> getQuestionBalance(String token) async {
    try {
      print('🔄 Calling balance endpoint: $_balanceEndpoint'); // Debug
      final response = await HttpService.get(
        _balanceEndpoint, // This should now be full URL
        token: token,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['remaining'] ?? 0;
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
      print('🔄 Calling offers endpoint: $_offersEndpoint'); // Debug
      final response = await HttpService.get(
        _offersEndpoint, // This should now be full URL
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List;
        return jsonData.cast<Map<String, dynamic>>();
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
    required int questions,
  }) async {
    try {
      final response = await HttpService.post(
        _paymentIntentEndpoint,
        token: token,
        body: {'questions': questions},
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
