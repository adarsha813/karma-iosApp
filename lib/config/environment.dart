class Environment {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://chat-backend-rvk9.onrender.com',
  );

  static const String socketUrl = String.fromEnvironment(
    'SOCKET_URL',
    defaultValue: 'wss://chat-backend-rvk9.onrender.com',
  );

  static const int freeQuota = int.fromEnvironment(
    'FREE_QUOTA',
    defaultValue: 2,
  );

  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );

  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue:
        'pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG',
  );

  static const bool isProduction = bool.fromEnvironment(
    'IS_PRODUCTION',
    defaultValue: false,
  );

  // ✅ Location IQ
  static const String locationIqApiKey = String.fromEnvironment(
    'LOCATIONIQ_API_KEY',
    defaultValue: 'pk.2371ae85bf85964bfb986332dcc74851',
  );

  static const String locationIqBaseUrl = String.fromEnvironment(
    'LOCATIONIQ_BASE_URL',
    defaultValue: 'https://api.locationiq.com/v1',
  );

  // ✅ Timezone DB
  static const String timezoneDbApiKey = String.fromEnvironment(
    'TIMEZONE_DB_API_KEY',
    defaultValue: 'PRCEAEL0H149',
  );

  static const String timezoneDbBaseUrl = String.fromEnvironment(
    'TIMEZONE_DB_BASE_URL',
    defaultValue: 'http://api.timezonedb.com/v2.1/get-time-zone',
  );

  static Map<String, String> get securityHeaders {
    return {
      'Content-Type': 'application/json',
      'X-Client-Version': '1.0.0',
      'X-Platform': 'flutter',
    };
  }

  static const int paymentTimeout = int.fromEnvironment(
    'PAYMENT_TIMEOUT',
    defaultValue: 30,
  );
  // EmailJS Configuration
  static const String emailJsServiceId = String.fromEnvironment(
    'EMAILJS_SERVICE_ID',
    defaultValue: "service_2vhpf9d",
  );

  static const String emailJsTemplateId = String.fromEnvironment(
    'EMAILJS_TEMPLATE_ID',
    defaultValue: "template_ipikvr9",
  );

  static const String emailJsPublicKey = String.fromEnvironment(
    'EMAILJS_PUBLIC_KEY',
    defaultValue: "YlsX0perbEKZWwWhP",
  );

  static const String emailJsAccessToken = String.fromEnvironment(
    'EMAILJS_ACCESS_TOKEN',
    defaultValue: "",
  );

  static const int socketReconnectionDelay = int.fromEnvironment(
    'SOCKET_RECONNECTION_DELAY',
    defaultValue: 3000,
  );

  static const int socketReconnectionAttempts = int.fromEnvironment(
    'SOCKET_RECONNECTION_ATTEMPTS',
    defaultValue: 9999,
  );

  static const int socketConnectionTimeout = int.fromEnvironment(
    'SOCKET_CONNECTION_TIMEOUT',
    defaultValue: 20000,
  );

  static const String pinnedCertPrimary = String.fromEnvironment(
    'PINNED_CERT_PRIMARY',
    defaultValue: 'drJ7gKWAJ9w88dpo2sFwEO2TmX0LYD4vrb6FASSTtac=',
  );

  static const String pinnedCertBackup = String.fromEnvironment(
    'D3788D482D4F24C5F8420E480EEEDCBE586CCE40E6EE837360AA2087010D88AF',
    defaultValue: '',
  );
}
