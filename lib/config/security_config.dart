class SecurityConfig {
  // Encryption keys (should be stored in secure storage)
  static const String encryptionKey = 'your-32-char-encryption-key-here';

  // API timeouts
  static const int apiTimeoutSeconds = 30;
  static const int socketTimeoutSeconds = 60;

  // Rate limiting
  static const int maxMessagesPerMinute = 10;
  static const int maxConnectionAttempts = 3;

  // Validation
  static const int maxMessageLength = 1000;
  static const int minMessageLength = 1;

  // Security headers
  static const Map<String, String> secureHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };
}
