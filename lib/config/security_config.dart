class SecurityConfig {
  // 🔒 Never store encryption keys in code - use secure storage
  static const String encryptionKey =
      'your-32-char-encryption-key-here'; // ⚠️ REMOVE THIS

  // API timeouts
  static const int apiTimeoutSeconds = 30;
  static const int socketTimeoutSeconds = 60;

  // Rate limiting - Enhanced values
  static const int maxMessagesPerMinute = 10;
  static const int maxConnectionAttempts = 3;
  static const int maxHideRequestsPerMinute = 5; // ✅ ADDED
  static const int maxRatingRequestsPerMinute = 10; // ✅ ADDED

  // Validation - Enhanced constraints
  static const int maxMessageLength = 1000;
  static const int minMessageLength = 1;
  static const int maxIdLength = 100; // ✅ ADDED
  static const int maxFeedbackLength = 500; // ✅ ADDED

  // Security headers - Enhanced
  static const Map<String, String> secureHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'X-Content-Type-Options': 'nosniff', // ✅ ADDED
    'X-Frame-Options': 'DENY', // ✅ ADDED
    'X-XSS-Protection': '1; mode=block', // ✅ ADDED
    'Strict-Transport-Security':
        'max-age=31536000; includeSubDomains', // ✅ ADDED
  };

  // ✅ ADDED: Input validation patterns
  static final RegExp safeIdPattern = RegExp(r'^[a-zA-Z0-9\-_]+$');
  static final RegExp safeTextPattern = RegExp(
    r'^[\p{L}\p{N}\p{P}\p{Z}\p{S}]*$',
    unicode: true,
  );

  // ✅ ADDED: Cooldown durations
  static const Duration hideActionCooldown = Duration(seconds: 2);
  static const Duration ratingCooldown = Duration(seconds: 1);

  // ✅ ADDED: Retry configuration
  static const int maxRetryAttempts = 2;
  static const Duration retryDelay = Duration(seconds: 1);

  // ✅ ADDED: Rating-specific security

  static const int minFeedbackLength = 1;
  static const int maxRatingValue = 3;
  static const int minRatingValue = 1;

  // ✅ ADDED: Rate limiting for ratings

  static const int maxFeedbackRequestsPerMinute = 5;

  // ✅ ADDED: Cooldown periods

  static const Duration feedbackCooldown = Duration(seconds: 2);
}
