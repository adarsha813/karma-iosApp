import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static bool _isLoaded = false;

  // Call this in main.dart before using any Environment values
  static Future<void> load() async {
    if (_isLoaded) return;
    await dotenv.load(fileName: ".env");
    _isLoaded = true;
    if (kDebugMode) {
      print('✅ Environment loaded from .env file');
    }
  }

  // Backend URLs
  static String get baseUrl {
    return _getRequiredEnv('BASE_URL');
  }

  static String get socketUrl {
    return _getRequiredEnv('SOCKET_URL');
  }

  // App Configuration
  static int get freeQuota {
    return int.tryParse(dotenv.env['FREE_QUOTA'] ?? '2') ?? 2;
  }

  static String get appVersion => '1.0.0';

  static bool get isProduction {
    return dotenv.env['IS_PRODUCTION']?.toLowerCase() == 'true';
  }

  // Location IQ
  static String get locationIqApiKey {
    return _getRequiredEnv('LOCATIONIQ_API_KEY');
  }

  static String get locationIqBaseUrl {
    // Use the same BASE_URL for location services
    return '$baseUrl/locationiq/v1';
  }

  static const String ipApiUrl = 'https://api.ipify.org?format=json';

  // Timezone DB
  static String get timezoneDbApiKey {
    return _getRequiredEnv('TIMEZONE_DB_API_KEY');
  }

  static String get timezoneDbBaseUrl {
    // Use your backend's base URL + timezone endpoint
    return '$baseUrl/api/timezonedb/v2.1/get-time-zone';
  }

  // EmailJS Configuration
  static String get emailJsServiceId {
    return _getRequiredEnv('EMAILJS_SERVICE_ID');
  }

  static String get emailJsTemplateId {
    return _getRequiredEnv('EMAILJS_TEMPLATE_ID');
  }

  static String get emailJsPublicKey {
    return _getRequiredEnv('EMAILJS_PUBLIC_KEY');
  }

  static String get emailJsAccessToken {
    return dotenv.env['EMAILJS_ACCESS_TOKEN'] ?? '';
  }

  // Socket Configuration
  static int get socketReconnectionDelay {
    return int.tryParse(dotenv.env['SOCKET_RECONNECTION_DELAY'] ?? '3000') ??
        3000;
  }

  static int get socketReconnectionAttempts {
    return int.tryParse(dotenv.env['SOCKET_RECONNECTION_ATTEMPTS'] ?? '9999') ??
        9999;
  }

  static int get socketConnectionTimeout {
    return int.tryParse(dotenv.env['SOCKET_CONNECTION_TIMEOUT'] ?? '20000') ??
        20000;
  }

  // SSL Pinning
  static String get pinnedCertPrimary {
    return _getRequiredEnv('PINNED_CERT_PRIMARY');
  }

  static String get pinnedCertBackup {
    return dotenv.env['PINNED_CERT_BACKUP'] ?? '';
  }

  static int get paymentTimeout {
    return int.tryParse(dotenv.env['PAYMENT_TIMEOUT'] ?? '30') ?? 30;
  }

  // Firebase Configuration
  static String get firebaseApiKey {
    return _getRequiredEnv('FIREBASE_API_KEY');
  }

  static String get firebaseAppId {
    return _getRequiredEnv('FIREBASE_APP_ID');
  }

  static String get firebaseSenderId {
    return _getRequiredEnv('FIREBASE_SENDER_ID');
  }

  static String get firebaseProjectId {
    return _getRequiredEnv('FIREBASE_PROJECT_ID');
  }

  static String get firebaseStorageBucket {
    return _getRequiredEnv('FIREBASE_STORAGE_BUCKET');
  }

  // Security Headers
  static Map<String, String> get securityHeaders {
    return {
      'Content-Type': 'application/json',
      'X-Client-Version': appVersion,
      'X-Platform': 'flutter',
      'X-Environment': isProduction ? 'production' : 'development',
    };
  }

  // Helper method to get required env vars with clear error messages
  static String _getRequiredEnv(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw StateError(
        '❌ $key is not defined in .env file.\n'
        'Please add $key to your .env file and restart the app.',
      );
    }
    return value;
  }

  // Optional: Helper to check if all required env vars are present
  static List<String> validateRequiredEnv() {
    const requiredKeys = [
      'BASE_URL',
      'SOCKET_URL',
      'LOCATIONIQ_API_KEY',
      'TIMEZONE_DB_API_KEY',
      'EMAILJS_SERVICE_ID',
      'EMAILJS_TEMPLATE_ID',
      'EMAILJS_PUBLIC_KEY',
      'PINNED_CERT_PRIMARY',
      'FIREBASE_API_KEY',
      'FIREBASE_APP_ID',
      'FIREBASE_SENDER_ID',
      'FIREBASE_PROJECT_ID',
      'FIREBASE_STORAGE_BUCKET',
    ];

    final missing = <String>[];
    for (final key in requiredKeys) {
      final value = dotenv.env[key];
      if (value == null || value.isEmpty) {
        missing.add(key);
      }
    }
    return missing;
  }
}
