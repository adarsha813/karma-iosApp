import 'package:flutter_stripe/flutter_stripe.dart' hide Card;

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' ($statusCode)' : ''}';
}

class PaymentException implements Exception {
  final String message;
  final String? code;

  PaymentException(this.message, [this.code]);

  @override
  String toString() =>
      'PaymentException: $message${code != null ? ' ($code)' : ''}';
}

class ErrorHandler {
  static Exception handlePaymentError(dynamic error) {
    if (error is ApiException) {
      return error;
    } else if (error is StripeException) {
      return PaymentException(
        error.error.localizedMessage ?? 'Payment failed',
        error.error.code.name,
      );
    } else if (error is Exception) {
      return PaymentException('Payment processing failed: ${error.toString()}');
    } else {
      return PaymentException('An unexpected error occurred');
    }
  }

  static Exception handleStripeError(dynamic error) {
    if (error is StripeException) {
      return PaymentException(
        'Stripe initialization failed: ${error.error.localizedMessage}',
        error.error.code.name,
      );
    } else {
      return PaymentException('Failed to initialize payment system');
    }
  }

  static String getUserFriendlyMessage(Exception error) {
    if (error is ApiException) {
      switch (error.statusCode) {
        case 401:
          return 'Authentication failed. Please log in again.';
        case 403:
          return 'You do not have permission to perform this action.';
        case 404:
          return 'Service temporarily unavailable.';
        case 500:
          return 'Server error. Please try again later.';
        default:
          return 'Network error: ${error.message}';
      }
    } else if (error is PaymentException) {
      return error.message;
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }
}
