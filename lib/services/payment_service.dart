import 'dart:convert';
import '../config/environment.dart';
import 'http_service.dart';
import '../utils/error_handler.dart';
import '../utils/app_logger.dart';

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  PaymentService._internal();

  // Use FULL URLs with the base URL
  String get _balanceEndpoint =>
      '${Environment.baseUrl}/api/questionspayment/balance';

  Future<int> getQuestionBalance(String token) async {
    try {
      AppLogger.info('🔄 Calling balance endpoint: $_balanceEndpoint');
      final response = await HttpService().get(_balanceEndpoint);

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
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching question balance',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow; // just propagate the error
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
