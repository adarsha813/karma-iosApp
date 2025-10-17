class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  void logEvent(String eventName, Map<String, dynamic> parameters) {
    print('📊 ANALYTICS: $eventName - $parameters');
  }

  void logPaymentInitiated(int questions, double amount) {
    logEvent('payment_initiated', {
      'questions': questions,
      'amount': amount,
      'currency': 'USD',
    });
  }

  void logPaymentSuccess(String paymentIntentId, int questions, double amount) {
    logEvent('payment_successful', {
      'payment_intent_id': paymentIntentId,
      'questions': questions,
      'amount': amount,
      'currency': 'USD',
    });
  }

  void logPaymentFailed(String error, int questions, double amount) {
    logEvent('payment_failed', {
      'error': error,
      'questions': questions,
      'amount': amount,
    });
  }

  void logPaymentCancelled(int questions, double amount) {
    logEvent('payment_cancelled', {'questions': questions, 'amount': amount});
  }
}
