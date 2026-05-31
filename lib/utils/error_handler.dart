import 'package:flutter/material.dart';
import '../utils/app_logger.dart';

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
  static void recordError(
    Object error, {
    StackTrace? stackTrace,
    String? context,
  }) {
    AppLogger.info('❌ Error in $context: $error');
    if (stackTrace != null) AppLogger.info('Stack: $stackTrace');
  }

  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  static void showSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
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
