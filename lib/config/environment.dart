/// environment.dart
/// Centralized environment configuration

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
}
