import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart'; // Add this package to pubspec.yaml
import 'dart:math' as math; // Add this line
import '../config/environment.dart';

// Import your app files
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'profile_settings_screen.dart';
import '../services/chat_service.dart';
import '../widgets/chat_bubble.dart';
import '../providers/profile_provider.dart';
import '../models/message.dart' as chat_model;
import '../providers/notification_provider.dart';
import '../providers/dictionary_provider.dart';
import 'dailyHoroscope_Screen.dart';
import '../utils/pending_notification_navigation.dart';
import 'horoscope_detail_screen.dart';
import 'notifications_screen.dart';
import 'how_to_ask_screen.dart';
import 'question_store_screen.dart';
import '../providers/horoscope_provider.dart';
import 'astroDictionary_Screen.dart';
import 'package:kundali/widgets/bouncing_dots.dart';
import 'package:kundali/screens/CustomerSupportPage.dart';
import 'package:kundali/screens/AboutUsPage.dart';
import '../l10n/app_localizations.dart';
import '../models/astro_term.dart' as models;

bool verifyCertificate(X509Certificate cert, List<String> allowedFingerprints) {
  // Get DER bytes directly from the certificate
  final derBytes = cert.der;

  // SHA-256 hash of the DER bytes
  final hash = sha256.convert(derBytes);

  // Base64 encode the hash to get fingerprint
  final fingerprint = base64.encode(hash.bytes);

  return allowedFingerprints.contains(fingerprint);
}

// ==================== PAYMENT SECURITY CLASSES ====================

class PaymentException implements Exception {
  final String message;
  final String code;
  final DateTime timestamp;

  PaymentException(this.message, this.code) : timestamp = DateTime.now();

  @override
  String toString() => 'PaymentException[$code]: $message';
}

class PaymentResult {
  final bool success;
  final String paymentIntentId;
  final double amount;
  final String currency;

  PaymentResult({
    required this.success,
    required this.paymentIntentId,
    required this.amount,
    this.currency = 'usd',
  });
}

class PaymentAnalytics {
  static void trackPaymentEvent({
    required String event,
    required String userId,
    required String status,
    String? errorCode,
    String? paymentIntentId,
    double? amount,
  }) {
    AppLogger.security(
      'Payment event: $event - $status',
      userId: userId,
      feature: 'payment_analytics',
    );

    AnalyticsService.trackPaymentFlow(event, status == 'success');
  }
}

class PaymentSecurity {
  static String generateIdempotencyKey(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = math.Random().nextInt(100000);
    return '${userId}_${timestamp}_${random}';
  }
}

class SecurePaymentService {
  static const Duration _paymentTimeout = Duration(seconds: 60);
  static const int _maxRetries = 2;

  static Future<PaymentResult> processQuestionPayment({
    required String userId,
    required String questionText,
    required BuildContext context,
  }) async {
    // Validate session first
    if (!SessionManager.isSessionValid(userId)) {
      throw PaymentException('Session expired', 'SESSION_EXPIRED');
    }

    // Rate limiting for payments
    if (RateLimiter.isRateLimited(userId, isPayment: true)) {
      throw PaymentException('Too many payment attempts', 'RATE_LIMITED');
    }

    // Biometric authentication for all payments
    final biometricResult = await BiometricAuthService.authenticate(
      reason: 'Confirm payment for your question',
    );

    if (!biometricResult) {
      throw PaymentException('Authentication required', 'BIOMETRIC_FAILED');
    }

    return await _executePaymentWithRetry(
      userId: userId,
      questionText: questionText,
    );
  }

  static Future<PaymentResult> _executePaymentWithRetry({
    required String userId,
    required String questionText,
  }) async {
    for (int attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        return await _executePayment(
          userId: userId,
          questionText: questionText,
        );
      } catch (e) {
        if (attempt == _maxRetries - 1) rethrow;
        await Future.delayed(Duration(seconds: 1 * (attempt + 1)));
      }
    }
    throw PaymentException('Payment failed after retries', 'RETRY_EXHAUSTED');
  }

  static Future<PaymentResult> _executePayment({
    required String userId,
    required String questionText,
  }) async {
    final idempotencyKey = PaymentSecurity.generateIdempotencyKey(userId);
    final token = await SecureStorage.getAuthToken();
    print("🔑 Auth Token: $token");

    if (token == null) {
      throw PaymentException('Authentication token not found', 'NO_TOKEN');
    }

    final response = await SecureApiClient.post(
      url: "${ChatConstants.baseUrl}/api/secure-question-payment",
      body: {
        'userId': userId,
        'questionText': questionText,
        'idempotencyKey': idempotencyKey,
        'platform': Platform.operatingSystem,
        'appVersion': Environment.appVersion,
        'timestamp': DateTime.now().toIso8601String(),
      },
      token: token,
      additionalHeaders: {
        'Idempotency-Key': idempotencyKey,
        'X-Client-Version': Environment.appVersion,
        'X-Device-Id': await _getDeviceId(),
      },
    ).timeout(_paymentTimeout);

    if (response.statusCode == 200) {
      return _handlePaymentSuccess(response.body, userId, questionText);
    } else {
      throw PaymentException(
        'Payment processing failed: HTTP ${response.statusCode}',
        'HTTP_${response.statusCode}',
      );
    }
  }

  static Future<String> _getDeviceId() async {
    // Use a combination of device info that's relatively stable
    final deviceInfo = {
      'platform': Platform.operatingSystem,
      'version': Platform.operatingSystemVersion,
      'localized': Platform.localeName,
    };
    return sha256.convert(utf8.encode(json.encode(deviceInfo))).toString();
  }

  static PaymentResult _handlePaymentSuccess(
    String responseBody,
    String userId,
    String questionText,
  ) {
    try {
      final data = json.decode(responseBody);
      final clientSecret = data['clientSecret'] as String?;

      if (clientSecret == null) {
        throw PaymentException('Invalid payment response', 'INVALID_RESPONSE');
      }

      // Extract payment intent ID from client secret
      // client_secret format: pi_XXX_secret_YYY
      final parts = clientSecret.split('_');
      final paymentIntentId = parts.length > 1 ? 'pi_${parts[1]}' : 'unknown';

      AppLogger.info(
        'Payment intent created: $paymentIntentId',
        feature: 'payment_processing',
      );

      return PaymentResult(
        success: true,
        paymentIntentId: paymentIntentId,
        amount: 50.00, // Default amount - server should determine this
        currency: 'usd',
      );
    } catch (e) {
      throw PaymentException(
        'Failed to process payment response: $e',
        'RESPONSE_PARSING_ERROR',
      );
    }
  }
}

class PaymentVerificationService {
  static Future<bool> verifyPaymentCompletion(
    String paymentIntentId,
    String userId,
  ) async {
    try {
      final token = await SecureStorage.getAuthToken();
      print("🔑 Auth Token: $token");
      if (token == null) {
        AppLogger.error('No auth token for payment verification', null);
        return false;
      }

      final response = await SecureApiClient.post(
        url: '${ChatConstants.baseUrl}/api/verify-payment',
        body: {
          'paymentIntentId': paymentIntentId,
          'userId': userId,
          'verificationToken': await _generateVerificationToken(),
        },
        token: token,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final status = data['status'];
        final verified = data['verified'];

        // Log verification result
        AppLogger.security(
          'Payment verification result: $status',
          userId: userId,
          feature: 'payment_verification',
        );

        return verified == true && status == 'succeeded';
      }
      return false;
    } catch (e) {
      AppLogger.error('Payment verification failed', e);
      return false;
    }
  }

  static Future<String> _generateVerificationToken() async {
    final deviceId = await _getDeviceId();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final data = '$deviceId$timestamp${Environment.appVersion}';
    return sha256.convert(utf8.encode(data)).toString();
  }

  static Future<String> _getDeviceId() async {
    final deviceInfo = {
      'platform': Platform.operatingSystem,
      'version': Platform.operatingSystemVersion,
      'localized': Platform.localeName,
    };
    return sha256.convert(utf8.encode(json.encode(deviceInfo))).toString();
  }
}

class SecureStripeConfig {
  static Future<void> initialize() async {
    try {
      // Fetch publishable key from server (never hardcode)
      final publishableKey = await _fetchPublishableKeyFromServer();

      Stripe.publishableKey = publishableKey;

      // Configure Stripe with enhanced security
      await Stripe.instance.applySettings();

      AppLogger.info(
        'Stripe configured successfully',
        feature: 'stripe_config',
      );
    } catch (e) {
      AppLogger.error(
        'Stripe configuration failed',
        e,
        feature: 'stripe_config',
      );
      rethrow;
    }
  }

  static Future<String> _fetchPublishableKeyFromServer() async {
    try {
      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/stripe-config',
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final publishableKey = data['publishableKey'] as String?;

        if (publishableKey == null || publishableKey.isEmpty) {
          throw Exception('Invalid publishable key from server');
        }

        return publishableKey;
      }
      throw Exception(
        'Failed to fetch Stripe configuration: HTTP ${response.statusCode}',
      );
    } catch (e) {
      AppLogger.error('Failed to fetch Stripe publishable key', e);
      rethrow;
    }
  }
}

// Add business metrics tracking
class AnalyticsService {
  static void trackMessageSent(bool success, String? error) {
    // Track to your analytics service (Firebase, Mixpanel, etc.)
  }

  static void trackPaymentFlow(String step, bool success) {
    // Track payment funnel
  }

  static void trackUserEngagement(String action) {
    // Track user behavior
  }
}

// FIXED: Add missing import and fix pow usage
class RetryManager {
  static Future<T> withRetry<T>(
    Future<T> Function() action, {
    int maxRetries = 3,
  }) async {
    for (int i = 0; i < maxRetries; i++) {
      try {
        return await action();
      } catch (e) {
        if (i == maxRetries - 1) rethrow;
        // FIXED: Use math.pow instead of pow
        await Future.delayed(Duration(seconds: math.pow(2, i).toInt()));
      }
    }
    throw Exception('Max retries exceeded');
  }
}

// Add performance tracking
class PerformanceMonitor {
  static final _instance = PerformanceMonitor._();
  factory PerformanceMonitor() => _instance;
  PerformanceMonitor._();

  void trackMessageLoadTime(Duration duration) {
    if (duration > const Duration(seconds: 2)) {
      AppLogger.error(
        'Slow message loading',
        Exception('Took ${duration.inMilliseconds}ms'),
      );
    }
  }

  void trackSocketReconnect(int attemptCount) {
    if (attemptCount > 3) {
      AppLogger.error(
        'Excessive socket reconnects',
        Exception('$attemptCount attempts'),
      );
    }
  }
}

Map<String, models.AstroTerm> _convertToAstroTermMap(
  Map<String, dynamic> dictionaryMap,
) {
  final Map<String, models.AstroTerm> result = {};

  dictionaryMap.forEach((key, value) {
    if (value is models.AstroTerm) {
      result[key] = value;
    } else if (value is Map<String, dynamic>) {
      // Use the correct constructor parameters
      result[key] = models.AstroTerm(
        id: value['id'] ?? key, // Use key as fallback ID
        term: value['term'] ?? key,
        meaning: value['meaning'] ?? value['definition'] ?? value.toString(),
        meaningNepali: value['meaningNepali'],
      );
    } else if (value is String) {
      // Create AstroTerm with required fields
      result[key] = models.AstroTerm(
        id: key, // Use key as ID
        term: key,
        meaning: value,
      );
    } else {
      // Fallback for any other type
      result[key] = models.AstroTerm(
        id: key,
        term: key,
        meaning: value.toString(),
      );
    }
  });

  return result;
}

class AstroTerm {
  final String term;
  final String definition;

  const AstroTerm({required this.term, required this.definition});

  @override
  String toString() => 'AstroTerm(term: $term, definition: $definition)';
}
// ==================== SECURITY CONFIGURATION ====================

class ChatConstants {
  static String get baseUrl => Environment.baseUrl;
  static String get socketUrl => Environment.socketUrl;
  static int get freeQuota => Environment.freeQuota;
  static const Duration socketTimeout = Duration(seconds: 5);
  static const Duration reconnectDelay = Duration(milliseconds: 2000);
  static const int maxReconnectionAttempts = 5;
  static const Duration scrollDuration = Duration(milliseconds: 300);
  static const Duration messageSendTimeout = Duration(seconds: 30);
  static const int maxMessageLength = 1000;
  static const int maxRequestsPerMinute = 10;
  static const int biometricAuthAmountThreshold = 5000; // $50.00
}

/// 2. Secure Storage for sensitive data
class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _userIdKey = 'secure_user_id';
  static const String _authTokenKey = 'secure_auth_token';

  static Future<void> storeUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  static Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  static Future<void> storeAuthToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  static Future<String?> getAuthToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

/// 3. Professional Logging System
class AppLogger {
  static void info(String message, {String? feature}) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage =
        'ℹ️ [$timestamp] ${feature != null ? '[$feature] ' : ''}$message';

    if (kDebugMode) {
      print(logMessage);
    }
    // In production, send to logging service (Sentry, Firebase Analytics, etc.)
    _sendToAnalytics('info', message, feature);
  }

  static void error(
    String message,
    dynamic error, {
    String? feature,
    StackTrace? stackTrace,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage =
        '❌ [$timestamp] ${feature != null ? '[$feature] ' : ''}$message: $error';

    if (kDebugMode) {
      print(logMessage);
      if (stackTrace != null) print('Stack trace: $stackTrace');
    }
    // Send to error tracking service
    _sendToAnalytics('error', '$message: $error', feature);
  }

  static void warning(String message, {String? feature}) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage =
        '⚠️ [$timestamp] ${feature != null ? '[$feature] ' : ''}$message';

    if (kDebugMode) {
      print(logMessage);
    }
    // In production, send to logging service
    _sendToAnalytics('warning', message, feature);
  }

  static void security(String message, {String? userId, String? feature}) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage =
        '🔒 SECURITY [$timestamp] ${feature != null ? '[$feature] ' : ''}$message';

    // Always log security issues
    print(logMessage);
    _sendToAnalytics('security', message, feature, userId: userId);
  }

  static void network(String message, {String? endpoint, int? statusCode}) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage =
        '🌐 [$timestamp] ${endpoint != null ? '[$endpoint] ' : ''}$message';

    if (kDebugMode) {
      print(logMessage);
    }
    _sendToAnalytics('network', message, endpoint);
  }

  static void _sendToAnalytics(
    String level,
    String message,
    String? feature, {
    String? userId,
  }) {
    // Integrate with your analytics service (Sentry, Firebase, etc.)
    // Example: Sentry.captureMessage('$level: $message');
  }
}

/// 4. Rate Limiting System
class RateLimiter {
  static final Map<String, List<DateTime>> _userRequests = {};
  static final Map<String, List<DateTime>> _paymentRequests = {};

  static bool isRateLimited(String userId, {bool isPayment = false}) {
    final now = DateTime.now();
    final requestMap = isPayment ? _paymentRequests : _userRequests;
    final maxRequests =
        isPayment
            ? 3
            : ChatConstants.maxRequestsPerMinute; // Stricter for payments

    requestMap.putIfAbsent(userId, () => []);
    final userRequests = requestMap[userId]!;

    // Remove requests older than 1 minute
    userRequests.removeWhere(
      (time) => now.difference(time) > const Duration(minutes: 1),
    );

    if (userRequests.length >= maxRequests) {
      AppLogger.security(
        'Rate limit exceeded for user $userId',
        userId: userId,
        feature: 'rate_limiter',
      );
      return true;
    }

    userRequests.add(now);
    return false;
  }

  static void clearUserRequests(String userId) {
    _userRequests.remove(userId);
    _paymentRequests.remove(userId);
  }
}

/// 5. Input Validation & Sanitization
class InputValidator {
  static ValidationResult validateMessage(String text) {
    if (text.isEmpty) {
      return ValidationResult(false, 'Message cannot be empty');
    }

    if (text.length > ChatConstants.maxMessageLength) {
      return ValidationResult(
        false,
        'Message too long. Maximum ${ChatConstants.maxMessageLength} characters allowed.',
      );
    }

    final sanitizedText = _sanitizeText(text);
    if (sanitizedText != text) {
      AppLogger.security(
        'Potentially dangerous input detected and sanitized',
        feature: 'input_validation',
      );
      return ValidationResult(
        false,
        'Invalid characters in message. Please remove special characters.',
      );
    }

    // Check for excessive repetition (spam detection)
    if (_hasExcessiveRepetition(text)) {
      return ValidationResult(false, 'Message contains excessive repetition');
    }

    return ValidationResult(true, sanitizedText);
  }

  static String _sanitizeText(String text) {
    // Remove potentially dangerous characters/scripts
    // Allow only letters, numbers, basic punctuation, and whitespace
    final allowedPattern = RegExp(
      r'[a-zA-Z0-9\s\.,!?@#$%^&*()_+\-=\[\]{}|;:",./<>?`~]',
    );
    final sanitized =
        text.split('').where((char) => allowedPattern.hasMatch(char)).join();

    // Trim excessive whitespace
    return sanitized.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  static bool _hasExcessiveRepetition(String text) {
    // Simple repetition detection - can be enhanced
    final words = text.split(' ');
    if (words.length < 3) return false;

    final wordCount = <String, int>{};
    for (final word in words) {
      wordCount[word] = (wordCount[word] ?? 0) + 1;
      if (wordCount[word]! > 5) {
        // Same word repeated more than 5 times
        return true;
      }
    }

    return false;
  }

  static bool isValidUserId(String userId) {
    if (userId.isEmpty || userId.length > 100) return false;
    final validPattern = RegExp(r'^[a-zA-Z0-9_-]+$');
    return validPattern.hasMatch(userId);
  }
}

class ValidationResult {
  final bool isValid;
  final String message;

  ValidationResult(this.isValid, this.message);
}

class SecureApiClient {
  static final Map<String, List<String>> _pinnedCertificates = {
    'chat-backend-rvk9.onrender.com': [
      'YbyJ1Eh0uiylRob7aoiVhoYLgn7Jjs1HniXUDtpcVXA=', // old
      'drJ7gKWAJ9w88dpo2sFwEO2TmX0LYD4vrb6FASSTtac=', // new
    ],
  };

  // Generate unique request ID for tracing
  static String _generateRequestId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${math.Random().nextInt(100000)}';
  }

  /// Create secure HttpClient with certificate pinning
  static HttpClient _createSecureHttpClient() {
    final client = HttpClient(context: SecurityContext());

    client.badCertificateCallback = (
      X509Certificate cert,
      String host,
      int port,
    ) {
      try {
        final allowedFingerprints = _pinnedCertificates[host];
        if (allowedFingerprints == null) {
          debugPrint('No pinned certificates for host: $host');
          return false;
        }

        // Get DER bytes from the certificate
        final derBytes = cert.der;

        // SHA-256 hash of the DER bytes
        final hash = sha256.convert(derBytes);

        // Base64 encode to get the fingerprint
        final fingerprint = base64.encode(hash.bytes);

        final isValid = allowedFingerprints.contains(fingerprint);

        if (!isValid) {
          debugPrint(
            'Certificate pinning failure for $host. '
            'Expected: $allowedFingerprints, Got: $fingerprint',
          );
        }

        return isValid;
      } catch (e, stackTrace) {
        debugPrint('Certificate validation error: $e\n$stackTrace');
        return false;
      }
    };

    return client;
  }

  /// GET request
  static Future<http.Response> get({
    required String url,
    String? token,
    Map<String, String>? additionalHeaders,
  }) async {
    return await _makeRequest(
      method: 'GET',
      url: url,
      token: token,
      additionalHeaders: additionalHeaders,
    );
  }

  /// POST request
  static Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    Map<String, String>? additionalHeaders,
  }) async {
    return await _makeRequest(
      method: 'POST',
      url: url,
      body: body,
      token: token,
      additionalHeaders: additionalHeaders,
    );
  }

  /// Internal request executor
  static Future<http.Response> _makeRequest({
    required String method,
    required String url,
    Map<String, dynamic>? body,
    String? token,
    Map<String, String>? additionalHeaders,
  }) async {
    HttpClient? client;
    try {
      final uri = Uri.parse(url);
      client = _createSecureHttpClient();

      final headers = <String, String>{
        'Content-Type': 'application/json',
        'User-Agent': 'AstroChatApp/1.0',
        'X-App-Version': '1.0',
        'X-Platform': Platform.operatingSystem,
        'X-Timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        'X-Request-ID': _generateRequestId(),
        if (token != null) 'Authorization': 'Bearer $token',
        ...?additionalHeaders,
      };

      late http.Response response;

      if (method == 'GET') {
        final request = await client.getUrl(uri);
        headers.forEach((key, value) => request.headers.set(key, value));
        final httpResponse = await request.close().timeout(
          const Duration(seconds: 15),
        );
        final bodyString = await httpResponse.transform(utf8.decoder).join();
        response = http.Response(bodyString, httpResponse.statusCode);
      } else if (method == 'POST') {
        final request = await client.postUrl(uri);
        headers.forEach((key, value) => request.headers.set(key, value));
        request.write(json.encode(body));
        final httpResponse = await request.close().timeout(
          const Duration(seconds: 15),
        );
        final bodyString = await httpResponse.transform(utf8.decoder).join();
        response = http.Response(bodyString, httpResponse.statusCode);
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }

      debugPrint('Response ${response.statusCode} from $url');
      return response;
    } on TimeoutException catch (e) {
      debugPrint('Request timeout to $url: $e');
      rethrow;
    } on SocketException catch (e) {
      debugPrint('Network error to $url: $e');
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('Unexpected error to $url: $e\n$stackTrace');
      rethrow;
    } finally {
      client?.close();
    }
  }
}

/// 7. Biometric Authentication
class BiometricAuthService {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> get isAvailable async {
    try {
      final canAuthenticate = await _auth.canCheckBiometrics;
      final isDeviceSupported = await _auth.isDeviceSupported();
      return canAuthenticate && isDeviceSupported;
    } catch (e) {
      AppLogger.error('Error checking biometric availability', e);
      return false;
    }
  }

  static Future<bool> authenticate({required String reason}) async {
    try {
      final canAuthenticate = await isAvailable;

      if (!canAuthenticate) {
        AppLogger.info('Biometric not available, allowing continuation');
        return true; // Allow if biometrics not available
      }

      final result = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true, // Only biometrics, no device PIN
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      AppLogger.security(
        'Biometric authentication result: $result',
        feature: 'biometric_auth',
      );

      return result;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Biometric authentication failed',
        e,
        feature: 'biometric_auth',
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}

/// 8. Session Management
class SessionManager {
  static final Map<String, DateTime> _userSessions = {};
  static const Duration _sessionTimeout = Duration(hours: 24);

  static bool isSessionValid(String userId) {
    final lastActivity = _userSessions[userId];
    if (lastActivity == null) return false;

    final isValid = DateTime.now().difference(lastActivity) < _sessionTimeout;
    if (!isValid) {
      AppLogger.security(
        'Session expired for user $userId',
        userId: userId,
        feature: 'session_manager',
      );
      _userSessions.remove(userId);
    }

    return isValid;
  }

  static void updateSession(String userId) {
    _userSessions[userId] = DateTime.now();
  }

  static void clearSession(String userId) {
    _userSessions.remove(userId);
    AppLogger.security(
      'Session cleared for user $userId',
      userId: userId,
      feature: 'session_manager',
    );
  }
}

// ==================== CHAT SCREEN IMPLEMENTATION ====================

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class ChatScreen extends StatefulWidget {
  final String? chatId;
  final String? initialMessageId;

  const ChatScreen({super.key, required this.chatId, this.initialMessageId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  // Controllers and Focus
  late final AnimationController _animationController;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _showButtonNotifier = ValueNotifier<bool>(false);

  // State variables
  String? userId;
  bool _isSocketConnected = false;
  Completer<void>? _socketConnectionCompleter;
  bool _isSending = false;
  bool _isReinitializing = false;
  String? currentUserId;
  Timer? _refreshTimer;
  bool _isInputEnabled = true;

  // Socket instance
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      AppLogger.error(
        'Flutter error',
        details.exception,
        stackTrace: details.stack,
        feature: 'flutter_error',
      );
      // Report to crash analytics
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      AppLogger.error('Platform error', error, stackTrace: stack);
      return true;
    };
    AppLogger.info('ChatScreen initialized', feature: 'chat_screen');
    _initializeChat();
  }

  void _initializeChat() {
    WidgetsBinding.instance.addObserver(this);

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();

    // Initialize socket with secure configuration
    _initializeSocketWithSecurity();

    // Load initial data
    _loadInitialData();

    // Set up scroll listener
    _scrollController.addListener(_handleScroll);

    // Handle deep links if any
    _handleDeepLink();
  }

  void _initializeSocketWithSecurity() {
    AppLogger.info('Initializing secure socket connection', feature: 'socket');

    socket = IO.io(
      ChatConstants.socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setReconnectionAttempts(ChatConstants.maxReconnectionAttempts)
          .setReconnectionDelay(ChatConstants.reconnectDelay.inMilliseconds)
          .setTimeout(ChatConstants.socketTimeout.inMilliseconds)
          // Security headers
          .setExtraHeaders({
            'User-Agent': 'AstroChatApp/${Environment.appVersion}',
            'X-App-Version': Environment.appVersion,
            'X-Platform': Platform.operatingSystem,
          })
          .build(),
    );

    _setupSocketEventHandlers();
    socket.connect();
  }

  void _setupSocketEventHandlers() {
    _socketConnectionCompleter = Completer<void>();
    _isSocketConnected = false;

    socket.onConnect((_) {
      AppLogger.info('Socket connected: ${socket.id}', feature: 'socket');
      _isSocketConnected = true;
      _socketConnectionCompleter?.complete();

      // Join user room if userId is available
      if (userId != null && userId!.isNotEmpty) {
        socket.emit('join_room', {'room': userId});
        AppLogger.info(
          'Joined socket room for user: $userId',
          feature: 'socket',
        );
      }
    });

    socket.onDisconnect((_) {
      AppLogger.info('Socket disconnected', feature: 'socket');
      _isSocketConnected = false;
    });

    socket.onConnectError((error) {
      AppLogger.error('Socket connection error', error, feature: 'socket');
      _isSocketConnected = false;
      _socketConnectionCompleter?.completeError(error);
    });

    socket.onError((error) {
      AppLogger.error('Socket error', error, feature: 'socket');
    });

    // Message event handlers
    _setupMessageHandlers();
  }

  void _setupMessageHandlers() {
    socket.off('new_question');
    socket.off('new_answer');
    socket.off('new_clarification');
    socket.off('new_advice');
    socket.off('payment_required');

    socket.on('new_question', (data) {
      try {
        _validateSocketMessage(data);
        AppLogger.info(
          'Received new_question event',
          feature: 'socket_messages',
        );
        _handleNewQuestion(data);
      } catch (e, stackTrace) {
        AppLogger.error(
          // ✅ FIXED: Use error() not security()
          'Invalid socket message rejected: $e',
          e,
          feature: 'socket_validation',
          stackTrace: stackTrace,
        );
      }
    });

    socket.on('new_answer', (data) {
      try {
        if (data['questionId'] == null || data['answerTranslated'] == null) {
          throw Exception('Invalid answer structure');
        }
        _validateSocketMessage({'text': data['answerTranslated']});
        AppLogger.info('Received new_answer event', feature: 'socket_messages');
        _handleNewAnswer(data);
      } catch (e, stackTrace) {
        AppLogger.error(
          // ✅ FIXED
          'Invalid socket message rejected: $e',
          e,
          feature: 'socket_validation',
          stackTrace: stackTrace,
        );
      }
    });

    socket.on('new_clarification', (data) {
      try {
        // ✅ ADDED VALIDATION
        if (data['questionId'] == null ||
            data['clarificationMessage'] == null) {
          throw Exception('Invalid clarification structure');
        }
        _validateSocketMessage({'text': data['clarificationMessage']});
        AppLogger.info(
          'Received new_clarification event',
          feature: 'socket_messages',
        );
        _handleNewClarification(data);
      } catch (e, stackTrace) {
        AppLogger.error(
          // ✅ FIXED
          'Invalid socket message rejected: $e',
          e,
          feature: 'socket_validation',
          stackTrace: stackTrace,
        );
      }
    });

    socket.on('new_advice', (data) {
      try {
        // ✅ ADDED VALIDATION
        if (data['adviceTranslated'] == null) {
          throw Exception('Invalid advice structure');
        }
        _validateSocketMessage({'text': data['adviceTranslated']});
        AppLogger.info('Received new_advice event', feature: 'socket_messages');
        _handleNewAdvice(data);
      } catch (e, stackTrace) {
        AppLogger.error(
          // ✅ FIXED
          'Invalid socket message rejected: $e',
          e,
          feature: 'socket_validation',
          stackTrace: stackTrace,
        );
      }
    });

    socket.on('payment_required', (data) {
      try {
        // ✅ ADDED VALIDATION
        if (data['message'] == null) {
          throw Exception('Invalid payment required structure');
        }
        AppLogger.info(
          'Received payment_required event',
          feature: 'socket_payments',
        );
        _handlePaymentRequired(data);
      } catch (e, stackTrace) {
        AppLogger.error(
          // ✅ FIXED
          'Invalid socket message rejected: $e',
          e,
          feature: 'socket_validation',
          stackTrace: stackTrace,
        );
      }
    });
  }

  void _handleNewQuestion(Map<String, dynamic> data) {
    try {
      // ✅ FIX: Comprehensive data validation
      if (data['text'] == null) {
        throw Exception('Missing text field in new_question data');
      }

      final questionText = data['text'] as String;
      final serverQuestionId = data['_id'] ?? data['id'];
      final createdAt = data['createdAt'];

      if (serverQuestionId == null) {
        throw Exception('Missing id field in new_question data');
      }
      if (createdAt == null) {
        throw Exception('Missing createdAt field in new_question data');
      }

      // Convert to proper types
      final questionIdString = serverQuestionId.toString();
      final createdAtString = createdAt.toString();

      // Parse datetime safely
      DateTime parsedDate;
      try {
        parsedDate = DateTime.parse(createdAtString);
      } catch (e) {
        AppLogger.warning(
          'Invalid date format, using current time',
          feature: 'socket_messages',
        );
        parsedDate = DateTime.now();
      }

      // Create the message
      final message = chat_model.Message(
        id: questionIdString,
        text: questionText,
        isMe: true,
        createdAt: parsedDate,
      );

      // Add to chat
      _addMessage(message);

      AppLogger.info(
        'Successfully processed new_question: $questionIdString',
        feature: 'socket_messages',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to process new_question event',
        e,
        feature: 'socket_messages',
        stackTrace: stackTrace,
      );

      // Optional: Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error receiving message: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleNewAnswer(Map<String, dynamic> data) {
    final message = chat_model.Message(
      id: data['questionId'],
      text: data['answerTranslated'],
      isMe: false,
      adminId: data['adminId'],
      adminName: data['adminName'],
      answeredAt: DateTime.parse(data['answeredAt']),
    );

    _addMessage(message);
  }

  void _handleNewClarification(Map<String, dynamic> data) {
    final message = chat_model.Message(
      id: data['questionId'],
      text: data['clarificationMessage'],
      isMe: false,
      isClarification: true,
      adminId: data['adminId'],
      adminName: data['adminName'],
      clarificatedAt: DateTime.parse(data['clarificatedAt']),
    );

    _addMessage(message);
  }

  void _handleNewAdvice(Map<String, dynamic> data) {
    final message = chat_model.Message(
      id: data['_id'] ?? data['id'] ?? data['questionId'],
      text: data['adviceTranslated'],
      isMe: false,
      adminId: data['adminId'],
      adminName: data['adminName'],
      answeredAt: DateTime.parse(data['advisedAt']),
      isAdvice: true,
    );

    _addMessage(message);
  }

  void _handlePaymentRequired(Map<String, dynamic> data) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message'] ?? 'Payment required to send question'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  Future<void> _loadInitialData() async {
    try {
      await loadUserId();
      await _initializeNotifications();
      await _fetchInitialData();

      // Set up periodic refresh
      _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
        _fetchInitialData();
      });

      // Handle any pending navigation
      _handlePendingNavigation();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error loading initial data',
        e,
        feature: 'chat_initialization',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> loadUserId() async {
    try {
      // Try secure storage first
      userId = await SecureStorage.getUserId();

      // Fallback to provider
      if (userId == null) {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        await profileProvider.loadUserId();
        userId = profileProvider.userId;

        // Store in secure storage for future
        if (userId != null) {
          await SecureStorage.storeUserId(userId!);
        }
      }

      if (userId != null) {
        SessionManager.updateSession(userId!);
        AppLogger.info('Loaded userId: $userId', feature: 'user_management');
      } else {
        AppLogger.info('No userId found', feature: 'user_management');
      }

      setState(() {});
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error loading userId',
        e,
        feature: 'user_management',
        stackTrace: stackTrace,
      );
    }
  }

  void _handleScroll() {
    if (_scrollController.hasClients) {
      final shouldShow = _scrollController.offset > 100;
      if (shouldShow != _showButtonNotifier.value) {
        _showButtonNotifier.value = shouldShow;
      }
    }
  }

  void _handleDeepLink() {
    if (widget.initialMessageId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToMessage(widget.initialMessageId!);
      });
    }
  }

  void _scrollToMessage(String messageId) {
    // Implementation for scrolling to specific message
    AppLogger.info('Scrolling to message: $messageId', feature: 'deep_linking');
  }

  void _handlePendingNavigation() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );

        // Ensure token is loaded
        if (profileProvider.userId != null && profileProvider.token == null) {
          await profileProvider.loadToken();
        }

        // Handle pending notification navigation
        final payload = pendingNavigation.payload;
        if (payload != null) {
          final data = jsonDecode(payload);
          if (data['type'] == 'horoscope') {
            final id = data['id'];
            if (mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HoroscopeDetailScreen(horoscopeId: id),
                ),
              );
            }
          }
          pendingNavigation.payload = null;
        }
      } catch (e, stackTrace) {
        AppLogger.error(
          'Error handling pending navigation',
          e,
          feature: 'navigation',
          stackTrace: stackTrace,
        );
      }
    });
  }

  Future<void> _initializeNotifications() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      const androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      const iosSettings = DarwinInitializationSettings();
      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await flutterLocalNotificationsPlugin.initialize(initSettings);

      // Request notification permissions
      await _requestNotificationPermissions();

      AppLogger.info(
        'Notifications initialized successfully',
        feature: 'notifications',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error initializing notifications',
        e,
        feature: 'notifications',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _requestNotificationPermissions() async {
    try {
      if (Platform.isAndroid) {
        final status = await Permission.notification.status;
        if (!status.isGranted) {
          await Permission.notification.request();
        }
      }

      if (Platform.isIOS) {
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      }

      AppLogger.info(
        'Notification permissions requested',
        feature: 'notifications',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error requesting notification permissions',
        e,
        feature: 'notifications',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchInitialData() async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      await profileProvider.loadUserId();
      final String currentUserId = profileProvider.userId ?? '';

      if (currentUserId.isEmpty) {
        AppLogger.info(
          'No userId available for fetching data',
          feature: 'data_fetching',
        );
        return;
      }

      // Validate session
      if (!SessionManager.isSessionValid(currentUserId)) {
        AppLogger.security(
          'Session invalid during data fetch',
          userId: currentUserId,
          feature: 'session_validation',
        );
        _showErrorSnackbar('Session expired. Please restart the app.');
        return;
      }

      final chatService = Provider.of<ChatService>(context, listen: false);

      // Fetch questions, answers, and advices in parallel for better performance
      await Future.wait([
        _fetchQuestionsAndAnswers(currentUserId, chatService),
        _fetchAdvices(currentUserId, chatService),
      ]);

      AppLogger.info(
        'Initial data fetched successfully',
        feature: 'data_fetching',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching initial data',
        e,
        feature: 'data_fetching',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchQuestionsAndAnswers(
    String userId,
    ChatService chatService,
  ) async {
    try {
      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/questions/previous/$userId',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<chat_model.Message> messages = [];

        for (var item in data) {
          _processQuestionItem(item, messages);
        }

        // Sort messages chronologically
        messages.sort((a, b) {
          final dateA =
              a.createdAt ??
              a.answeredAt ??
              a.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          final dateB =
              b.createdAt ??
              b.answeredAt ??
              b.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          return dateA.compareTo(dateB);
        });

        chatService.setMessages(messages);
        AppLogger.info(
          'Fetched ${messages.length} questions and answers',
          feature: 'data_fetching',
        );
      } else {
        AppLogger.error(
          'Failed to fetch questions',
          Exception('HTTP ${response.statusCode}: ${response.body}'),
          feature: 'data_fetching',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching questions and answers',
        e,
        feature: 'data_fetching',
        stackTrace: stackTrace,
      );
    }
  }

  void _processQuestionItem(
    Map<String, dynamic> item,
    List<chat_model.Message> messages,
  ) {
    final questionId = item['_id'] ?? item['id'];

    // Add question
    messages.add(
      chat_model.Message(
        id: questionId,
        text: item['text'],
        isMe: true,
        createdAt: DateTime.parse(item['createdAt']),
      ),
    );

    // Add answer if exists
    if (item['answerTranslated'] != null) {
      messages.add(
        chat_model.Message(
          id: questionId,
          text: item['answerTranslated'],
          isMe: false,
          adminId: item['adminId'],
          adminName: item['adminName'],
          answeredAt: DateTime.parse(item['answeredAt']),
          rating: item['rating'],
          feedback: item['feedback'],
        ),
      );
    }

    // Add clarifications if any
    if (item['isClarified'] == true && item['clarificationMessages'] != null) {
      for (var clarification in item['clarificationMessages']) {
        if (clarification['clarificationHide'] == true) continue;
        messages.add(
          chat_model.Message(
            id: questionId,
            text: clarification['clarificationMessage'],
            isMe: false,
            isClarification: true,
            adminId: clarification['adminId'],
            adminName: clarification['adminName'],
            clarificatedAt: DateTime.parse(clarification['clarificatedAt']),
          ),
        );
      }
    }

    // Add advice if exists
    if (item['adviceTranslated'] != null && item['advisedAt'] != null) {
      messages.add(
        chat_model.Message(
          id: questionId,
          text: item['adviceTranslated'],
          isMe: false,
          adminId: item['adminId'],
          adminName: item['adminName'],
          answeredAt: DateTime.parse(item['advisedAt']),
          isAdvice: true,
          rating: item['rating'],
          feedback: item['feedback'],
        ),
      );
    }
  }

  Future<void> _fetchAdvices(String userId, ChatService chatService) async {
    try {
      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/advices/$userId',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<chat_model.Message> advices = [];

        for (var item in data) {
          if (item['text'] != null && item['createdAt'] != null) {
            advices.add(
              chat_model.Message(
                id: item['_id'],
                text: item['text'],
                isMe: false,
                isAdvice: true,
                adminId: item['adminId'] ?? '',
                adminName: item['adminName'] ?? '',
                answeredAt: DateTime.parse(item['createdAt']),
                rating: item['rating'],
                feedback: item['feedback'],
              ),
            );
          }
        }

        // Merge with existing messages
        final existingMessages =
            chatService.messages.where((m) => !m.isAdvice).toList();
        final allMessages = [...existingMessages, ...advices];

        allMessages.sort((a, b) {
          final dateA =
              a.createdAt ??
              a.answeredAt ??
              a.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          final dateB =
              b.createdAt ??
              b.answeredAt ??
              b.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          return dateA.compareTo(dateB);
        });

        chatService.setMessages(allMessages);
        AppLogger.info(
          'Fetched ${advices.length} advices',
          feature: 'data_fetching',
        );
      } else {
        AppLogger.error(
          'Failed to fetch advices',
          Exception('HTTP ${response.statusCode}: ${response.body}'),
          feature: 'data_fetching',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error fetching advices',
        e,
        feature: 'data_fetching',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profileProvider = Provider.of<ProfileProvider>(context);
    final newUserId = profileProvider.userId;

    if (newUserId != null && newUserId != currentUserId) {
      currentUserId = newUserId;
      Future.microtask(() => _reinitializeForUserId(newUserId));
    }
  }

  Future<void> _reinitializeForUserId(String newUserId) async {
    if (_isReinitializing) return;

    _isReinitializing = true;
    AppLogger.info(
      'Reinitializing for new user: $newUserId',
      feature: 'user_management',
    );

    try {
      // Clear existing socket connection
      await _disposeSocket();

      // Clear old messages
      Provider.of<ChatService>(context, listen: false).clearMessages();

      // Update userId in secure storage
      userId = newUserId;
      await SecureStorage.storeUserId(newUserId);
      SessionManager.updateSession(newUserId);

      // Reinitialize socket for new user
      await _initializeSocket();

      // Fetch new data
      await _fetchInitialData();

      setState(() {});
      AppLogger.info(
        'Reinitialization completed for user: $newUserId',
        feature: 'user_management',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error reinitializing for user',
        e,
        feature: 'user_management',
        stackTrace: stackTrace,
      );
    } finally {
      _isReinitializing = false;
    }
  }

  Future<void> _disposeSocket() async {
    try {
      socket.clearListeners();
      if (socket.connected) {
        final completer = Completer<void>();
        socket.once('disconnect', (_) => completer.complete());
        socket.disconnect();
        await completer.future.timeout(const Duration(seconds: 2));
      }
      AppLogger.info('Socket disposed successfully', feature: 'socket');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error disposing socket',
        e,
        feature: 'socket',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _initializeSocket() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    final currentUserId = profileProvider.userId ?? '';

    if (currentUserId.isEmpty) {
      AppLogger.info('Missing userId for socket connection', feature: 'socket');
      return;
    }

    // Validate session
    if (!SessionManager.isSessionValid(currentUserId)) {
      AppLogger.security(
        'Session invalid during socket initialization',
        userId: currentUserId,
        feature: 'session_validation',
      );
      return;
    }

    // Reinitialize socket with current user ID
    _initializeSocketWithSecurity();

    // Wait for connection with timeout
    try {
      await _socketConnectionCompleter?.future.timeout(
        ChatConstants.socketTimeout,
      );
      AppLogger.info('Socket initialization completed', feature: 'socket');
    } catch (e) {
      AppLogger.error('Socket connection timeout', e, feature: 'socket');
    }
  }

  void _addMessage(chat_model.Message message) {
    if (!mounted) return;

    final chatService = Provider.of<ChatService>(context, listen: false);
    chatService.addMessage(message);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_scrollController.hasClients) {
        await Future.delayed(const Duration(milliseconds: 100));
        _scrollToBottom();
      }
    });
  }

  // Enhanced message sending with comprehensive error handling and security
  Future<void> handleSendMessage() async {
    final text = _controller.text.trim();

    // Input validation
    final validation = InputValidator.validateMessage(text);
    if (!validation.isValid) {
      _showErrorSnackbar(validation.message);
      return;
    }

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final currentUserId = profileProvider.userId;

    // Validate user ID
    if (currentUserId == null || currentUserId.isEmpty) {
      _showErrorSnackbar(
        'User ID not found. Please login or set your profile.',
      );
      return;
    }

    // Validate user ID format
    if (!InputValidator.isValidUserId(currentUserId)) {
      AppLogger.security(
        'Invalid user ID format detected',
        userId: currentUserId,
        feature: 'input_validation',
      );
      _showErrorSnackbar('Invalid user ID. Please contact support.');
      return;
    }

    // Rate limiting check
    if (RateLimiter.isRateLimited(currentUserId)) {
      _showErrorSnackbar('Too many requests. Please wait a moment.');
      return;
    }

    // Session validation
    if (!SessionManager.isSessionValid(currentUserId)) {
      _showErrorSnackbar('Session expired. Please restart the app.');
      return;
    }

    // ✅ DISABLE INPUT WHILE SENDING
    setState(() {
      _isSending = true;
      _isInputEnabled = false; // Disable text field
    });

    try {
      await _sendMessageWithValidation(validation.message, currentUserId);
      AppLogger.info('Message sent successfully', feature: 'message_sending');

      // ✅ Controller clearing is now handled in _sendFreeQuestion and _sendPaidQuestion
      // This ensures it only clears after successful send
    } catch (e) {
      _handleSendError(e);
      // Don't clear controller on error - let user retry
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
          _isInputEnabled = true; // Re-enable text field
        });
      }
    }
  }

  Future<void> _sendMessageWithValidation(
    String text,
    String currentUserId,
  ) async {
    try {
      // Check eligibility first
      final eligibility = await _checkQuestionEligibility(currentUserId);

      AppLogger.info(
        '🎯 Final eligibility result: ${eligibility.isFreeEligible}, Clarification: ${eligibility.isFreeByClarification}',
        feature: 'message_sending',
      );

      if (eligibility.isFreeEligible) {
        // ✅ Send free question with clarification flag
        await _sendFreeQuestion(
          text,
          currentUserId,
          eligibility.remainingFreeQuestions,
          isClarificationFree:
              eligibility.isFreeByClarification, // ✅ PASS THIS FLAG
        );

        // ✅ Reset clarification flag ONLY if it was used
        if (eligibility.isFreeByClarification) {
          await SecureApiClient.get(
            url:
                '${ChatConstants.baseUrl}/api/reset-clarification-free/$currentUserId',
          );
          AppLogger.info(
            '🔄 Clarification free question used and reset',
            feature: 'clarification',
          );
        }
        return;
      }

      // Check paid balance
      final hasPaidBalance = await _checkPaidBalance(currentUserId);
      if (hasPaidBalance) {
        await _sendPaidQuestion(text, currentUserId);
        return;
      }

      // No balance left, show payment dialog
      _showPaymentDialog(context, currentUserId, text);
    } catch (e) {
      AppLogger.error(
        'Error in message validation',
        e,
        feature: 'message_validation',
      );
      rethrow;
    }
  }

  Future<QuestionEligibility> _checkQuestionEligibility(String userId) async {
    bool isFreeByClarification = false; // ✅ Declare outside try-catch

    try {
      // ✅ NEW: Check clarification eligibility directly from questions
      final clarificationRes = await SecureApiClient.get(
        url:
            '${ChatConstants.baseUrl}/api/check-clarification-eligibility/$userId',
      );

      if (clarificationRes.statusCode == 200) {
        final data = json.decode(clarificationRes.body);
        final isFreeByClarification = data['isFreeByClarification'] ?? false;
        final remainingFree = data['remainingFreeQuestions'] ?? 0;

        AppLogger.info(
          'Clarification eligibility: $isFreeByClarification, Remaining: $remainingFree',
          feature: 'eligibility_debug',
        );

        if (isFreeByClarification) {
          AppLogger.info(
            '🎯 USER ELIGIBLE BY CLARIFICATION - $remainingFree questions available',
            feature: 'eligibility_debug',
          );
          return QuestionEligibility(
            isFreeEligible: true,
            remainingFreeQuestions: remainingFree,
            isFirstTime: false,
            isFreeByClarification: true,
          );
        }
      }
      AppLogger.info(
        '❌ User NOT eligible by clarification, checking other methods...',
        feature: 'eligibility_debug',
      );
      // 2️⃣ Check first-time login free quota
      final firstTimeResponse = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/check-first-time/$userId',
      );

      if (firstTimeResponse.statusCode == 200) {
        final data = json.decode(firstTimeResponse.body);
        final isFirstTime = data['isFirstTime'] ?? false;
        final remainingFree = data['remainingFreeQuestions'] ?? 0;

        if (isFirstTime && remainingFree > 0) {
          return QuestionEligibility(
            isFreeEligible: true,
            remainingFreeQuestions: remainingFree,
            isFirstTime: true,
          );
        }
      }

      // 3️⃣ Check regular eligibility for returning users
      final eligibilityResponse = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/check-question-eligibility/$userId',
      );

      if (eligibilityResponse.statusCode == 200) {
        final data = json.decode(eligibilityResponse.body);
        return QuestionEligibility(
          isFreeEligible: data['isFreeEligible'] ?? false,
          remainingFreeQuestions: data['remainingFreeQuestions'] ?? 0,
          isFirstTime: false,
        );
      }

      // 4️⃣ Fallback to count-based check
      AppLogger.error(
        'Eligibility check failed',
        Exception('HTTP ${eligibilityResponse.statusCode}'),
        feature: 'eligibility_check',
      );
      return await _checkQuestionCountFallback(userId);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error checking eligibility',
        e,
        feature: 'eligibility_check',
        stackTrace: stackTrace,
      );

      // ✅ Now accessible here
      AppLogger.info(
        'Clarification eligibility: $isFreeByClarification',
        feature: 'eligibility_debug',
      );

      return await _checkQuestionCountFallback(userId);
    }
  }

  Future<QuestionEligibility> _checkQuestionCountFallback(String userId) async {
    try {
      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/user-question-count/$userId',
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final count = data['count'] ?? 0;
        final freeQuota = data['freeQuota'] ?? ChatConstants.freeQuota;

        return QuestionEligibility(
          isFreeEligible: count < freeQuota,
          remainingFreeQuestions: freeQuota - count,
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error in count fallback',
        e,
        feature: 'eligibility_check',
        stackTrace: stackTrace,
      );
    }

    return QuestionEligibility(
      isFreeEligible: false,
      remainingFreeQuestions: 0,
    );
  }

  Future<bool> _checkPaidBalance(String userId) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final token = profileProvider.token;

      if (token == null) {
        AppLogger.info(
          'No auth token available for balance check',
          feature: 'balance_check',
        );
        return false;
      }

      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/questionspayment/balance',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final remainingBalance = data['remaining'] ?? 0;
        AppLogger.info(
          'Paid balance check: $remainingBalance',
          feature: 'balance_check',
        );
        return remainingBalance > 0;
      } else {
        AppLogger.error(
          'Balance check failed',
          Exception('HTTP ${response.statusCode}'),
          feature: 'balance_check',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error checking paid balance',
        e,
        feature: 'balance_check',
        stackTrace: stackTrace,
      );
    }
    return false;
  }

  Future<void> _sendFreeQuestion(
    String text,
    String userId,
    int remaining, {
    bool isClarificationFree = false, // ✅ ADD THIS PARAMETER
  }) async {
    try {
      // ✅ PASS THE CLARIFICATION FLAG TO SOCKET
      await sendQuestionToSocket(
        text,
        userId,
        isClarificationFree: isClarificationFree,
      );

      _controller.clear();
      _scrollToBottom();

      if (remaining > 0) {
        final message =
            isClarificationFree
                ? 'Clarification free question sent!'
                : '$remaining free questions remaining';
        _showSuccessSnackbar(message);
      }

      SessionManager.updateSession(userId);

      AppLogger.info(
        '✅ Free question sent successfully. Clarification: $isClarificationFree',
        feature: 'message_sending',
      );
    } catch (e) {
      AppLogger.error(
        'Error sending free question',
        e,
        feature: 'message_sending',
      );
      rethrow;
    }
  }

  void _showPaymentDialog(BuildContext context, String userId, String text) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: Text(l10n.paymentRequired),
            content: Text(l10n.paymentRequiredMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.cancelButton),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  startStripePayment(userId, text);
                },
                child: Text(l10n.payNowButton),
              ),
            ],
          ),
    );
  }

  Future<void> _sendPaidQuestion(String text, String userId) async {
    try {
      await sendQuestionToSocket(text, userId, paid: true);

      // ✅ FIX: Clear controller after successful send
      _controller.clear();
      _scrollToBottom();

      _showSuccessSnackbar('Question sent using paid balance');

      // Update session
      SessionManager.updateSession(userId);

      AppLogger.info(
        'Paid question sent successfully',
        feature: 'message_sending',
      );
    } catch (e) {
      AppLogger.error(
        'Error sending paid question',
        e,
        feature: 'message_sending',
      );
      // Don't clear controller on error
      rethrow;
    }
  }

  void _handleSendError(dynamic error) {
    AppLogger.error(
      'Error sending question',
      error,
      feature: 'message_sending',
    );

    String errorMessage = 'Failed to send question';
    if (error is SocketException) {
      errorMessage = 'Network error. Please check your connection.';
    } else if (error is TimeoutException) {
      errorMessage = 'Request timeout. Please try again.';
    } else if (error is http.ClientException) {
      errorMessage = 'Network error. Please try again.';
    }

    _showErrorSnackbar(errorMessage);
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _showSuccessSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // Enhanced socket message sending with fallback and security
  Future<void> sendQuestionToSocket(
    String text,
    String userId, {
    bool paid = false,
    int? amount,
    bool isClarificationFree = false, // ✅ ADD THIS
    String? paymentIntentId, // ✅ ADD THIS PARAMETER
  }) async {
    // Rate limiting for payments
    if (paid && RateLimiter.isRateLimited(userId, isPayment: true)) {
      throw Exception('Too many payment requests. Please wait.');
    }

    // Ensure socket is connected
    if (!socket.connected) {
      AppLogger.info(
        'Socket not connected - attempting reconnect...',
        feature: 'socket',
      );
      await _initializeSocket();
    }

    if (socket.connected) {
      final completer = Completer<void>();
      final questionId = 'temp_${DateTime.now().millisecondsSinceEpoch}';

      // Set up timeout
      final timeoutTimer = Timer(ChatConstants.messageSendTimeout, () {
        if (!completer.isCompleted) {
          completer.completeError(TimeoutException('Socket send timeout'));
        }
      });

      void Function(dynamic)? eventListener;

      try {
        // Add temporary message immediately for better UX
        final tempMessage = chat_model.Message(
          id: questionId,
          text: text,
          isMe: true,
          createdAt: DateTime.now(),
          isTemporary: true,
        );

        final chatService = Provider.of<ChatService>(context, listen: false);
        chatService.addMessage(tempMessage);
        _scrollToBottom();

        // Listen for server response
        eventListener = (data) {
          try {
            final receivedQuestionId = data['_id'] ?? data['id'];
            final receivedText = data['text'];

            // Check if this is our question
            if (receivedText == text) {
              AppLogger.info(
                '✅ Received server confirmation for question: $receivedQuestionId',
                feature: 'socket',
              );
              if (!completer.isCompleted) {
                completer.complete();
              }
              chatService.removeMessageById(questionId);
            }
          } catch (e) {
            AppLogger.error('Error processing new_question acknowledgment', e);
          }
        };

        socket.once('new_question', eventListener);

        // ✅ ENHANCED: Send clarification free flag to server
        final questionData = {
          'text': text,
          'userId': userId,
          'paid': paid,
          'isClarificationFree':
              isClarificationFree, // ✅ TELL SERVER THIS IS FREE BY CLARIFICATION
          'paymentIntentId': paymentIntentId, // ✅ ADD THIS
          'createdAt': DateTime.now().toIso8601String(),
        };

        AppLogger.info(
          '📤 Emitting question to socket: ${json.encode(questionData)}',
          feature: 'socket',
        );

        socket.emit('send_question', questionData);

        AppLogger.info(
          '⏳ Waiting for server confirmation...',
          feature: 'socket',
        );

        // Wait for acknowledgment or timeout
        await completer.future;

        AppLogger.info(
          '✅ Question sent via socket successfully',
          feature: 'socket',
        );
      } finally {
        timeoutTimer.cancel();
        socket.off('new_question', eventListener);
      }
    } else {
      AppLogger.info(
        'Socket not connected - using HTTP fallback',
        feature: 'socket',
      );
      await _sendQuestionViaHttp(
        text,
        userId,
        paid: paid,
        isClarificationFree: isClarificationFree,
      );
    }
  }

  Future<void> _sendQuestionViaHttp(
    String text,
    String userId, {
    bool paid = false,
    bool isClarificationFree = false,
  }) async {
    try {
      final response = await SecureApiClient.post(
        url: '${ChatConstants.baseUrl}/questions/create',
        body: {
          'text': text,
          'userId': userId,
          'paid': paid,
          'isClarificationFree': isClarificationFree, // ✅ ADD THIS
        },
      );

      if (response.statusCode == 200) {
        AppLogger.info('✅ HTTP fallback succeeded', feature: 'http_fallback');
      } else {
        throw HttpException('HTTP ${response.statusCode}: ${response.body}');
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'HTTP fallback error',
        e,
        feature: 'http_fallback',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> startStripePayment(String userId, String questionText) async {
    if (mounted) {
      setState(() {
        _isInputEnabled = false;
      });
    }

    try {
      // ✅ 1. Initialize Stripe first
      await SecureStripeConfig.initialize();

      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final token = await SecureStorage.getAuthToken() ?? profileProvider.token;
      print("🔑 Auth Token: $token");

      if (token == null) {
        _showErrorSnackbar("Authentication required.");
        return;
      }

      // ✅ 2. BIOMETRIC AUTHENTICATION (optional - you can remove if causing issues)
      final biometricAvailable = await BiometricAuthService.isAvailable;
      if (biometricAvailable) {
        final biometricResult = await BiometricAuthService.authenticate(
          reason: 'Confirm payment for your astrology question',
        );
        if (!biometricResult) {
          _showErrorSnackbar('Authentication required for payment.');
          return;
        }
      }

      // ✅ 3. GET PAYMENT INTENT FROM SERVER
      AppLogger.info('Creating payment intent...', feature: 'payment_flow');

      final response = await SecureApiClient.post(
        url: "${ChatConstants.baseUrl}/api/secure-question-payment",
        body: {
          'userId': userId,
          'questionText': questionText,
          'platform': Platform.operatingSystem,
          'appVersion': Environment.appVersion,
          'timestamp': DateTime.now().toIso8601String(),
          'idempotencyKey': PaymentSecurity.generateIdempotencyKey(userId),
        },
        token: token,
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final clientSecret = jsonResponse['clientSecret'];
        final serverAmount = jsonResponse['amount'];
        final currency = jsonResponse['currency'];
        final paymentIntentId = jsonResponse['paymentIntentId'];

        if (clientSecret == null || clientSecret.isEmpty) {
          throw PaymentException(
            'Invalid payment response from server',
            'INVALID_CLIENT_SECRET',
          );
        }

        // Show payment amount
        final amountInDollars = (serverAmount / 100).toStringAsFixed(2);
        _showInfoSnackbar("Payment amount: $amountInDollars $currency");

        // ✅ 4. CONFIGURE STRIPE PAYMENT SHEET
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'Astro Chat App',
            customerId: userId,
            style: ThemeMode.light,
            // Add these for better UX
            customFlow: false,
            allowsDelayedPaymentMethods: false,
          ),
        );

        // ✅ 5. PRESENT PAYMENT SHEET
        AppLogger.info('Presenting payment sheet...', feature: 'payment_flow');
        await Stripe.instance.presentPaymentSheet();

        // ✅ 6. VERIFY PAYMENT COMPLETION SERVER-SIDE
        AppLogger.info(
          'Payment sheet completed, verifying...',
          feature: 'payment_flow',
        );

        final paymentVerified = await _verifyPaymentServerSide(
          paymentIntentId,
          userId,
        );

        if (!paymentVerified) {
          throw PaymentException(
            'Payment not confirmed by server',
            'PAYMENT_NOT_VERIFIED',
          );
        }

        // ✅ 7. PROCESS THE PAID QUESTION
        final questionResponse = await SecureApiClient.post(
          url: "${ChatConstants.baseUrl}/api/process-paid-question",
          body: {
            'userId': userId,
            'questionText': questionText,
            'paymentIntentId': paymentIntentId,
          },
          token: token,
        );

        if (questionResponse.statusCode == 200) {
          final questionData = json.decode(questionResponse.body);
          AppLogger.info(
            'Paid question created via API: ${questionData['questionId']}',
            feature: 'payment_flow',
          );

          // ✅ 8. CLEAR INPUT AFTER SUCCESS
          if (mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _controller.clear();
            });
          }

          _showSuccessSnackbar("✅ Payment successful! Question sent");

          // ✅ 9. UPDATE SESSION
          SessionManager.updateSession(userId);

          AppLogger.info(
            'Payment completed successfully - Question created via API',
            feature: 'payment_flow',
          );
        } else {
          throw PaymentException(
            'Failed to create paid question: HTTP ${questionResponse.statusCode}',
            'QUESTION_CREATION_FAILED',
          );
        }
      } else {
        final errorBody = json.decode(response.body);
        throw PaymentException(
          errorBody['error'] ??
              'Failed to create payment intent: HTTP ${response.statusCode}',
          'PAYMENT_INTENT_CREATION_FAILED',
        );
      }
    } catch (e) {
      _handlePaymentError(e);
    } finally {
      if (mounted) {
        setState(() {
          _isInputEnabled = true;
        });
      }
    }
  }

  Future<bool> _verifyPaymentServerSide(
    String paymentIntentId,
    String userId,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final token = profileProvider.token ?? await SecureStorage.getAuthToken();

      if (token == null) return false;

      final response = await SecureApiClient.post(
        url: '${ChatConstants.baseUrl}/api/verify-payment',
        body: {'paymentIntentId': paymentIntentId, 'userId': userId},
        token: token,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['verified'] == true;
      } else {
        AppLogger.error(
          'Payment verification failed with status: ${response.statusCode}',
          null,
          feature: 'payment_flow',
        );

        return false;
      }
    } catch (e) {
      AppLogger.error('Payment verification failed', e);
      return false;
    }
  }

  // ✅ CORRECTED ERROR HANDLING METHOD
  void _handlePaymentError(dynamic error) {
    AppLogger.error('Payment failed', error, feature: 'payment_flow');

    String errorMessage = "Payment failed";

    if (error is StripeException) {
      final stripeError = error.error;

      // More specific Stripe error handling
      switch (stripeError.code) {
        case FailureCode.Failed:
          errorMessage = "Payment failed. Please try another payment method.";
          break;
        case FailureCode.Canceled:
          errorMessage = "Payment was cancelled.";
          return; // Don't show error for cancellations
        case FailureCode.Unknown:
          errorMessage = "An unknown error occurred.";
          break;
        default:
          errorMessage =
              "Payment error: ${stripeError.message ?? 'Please try again'}";
      }
    } else if (error is TimeoutException) {
      errorMessage = "Payment timeout. Please try again.";
    } else if (error is PaymentException) {
      errorMessage = error.message;
    } else if (error is SocketException) {
      errorMessage = "Network error. Please check your connection.";
    } else if (error is HttpException) {
      errorMessage = "Server error. Please try again later.";
    }

    // Only show error if it's not a user cancellation
    if (!errorMessage.contains('cancelled') &&
        !errorMessage.contains('canceled')) {
      _showErrorSnackbar("❌ $errorMessage");
    }

    // Log the specific error for debugging
    AppLogger.error('Payment Error Details', error, feature: 'payment_flow');
  }

  // ✅ HELPER METHOD FOR INFO SNACKBARS
  void _showInfoSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.blue,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> debugPayment(String paymentIntentId) async {
    try {
      final token = await SecureStorage.getAuthToken();
      print("🔑 Auth Token: $token");
      final response = await SecureApiClient.get(
        url: '${ChatConstants.baseUrl}/api/debug-payment/$paymentIntentId',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        AppLogger.info('Payment Debug Info: $data', feature: 'payment_debug');
      }
    } catch (e) {
      AppLogger.error('Debug payment failed', e, feature: 'payment_debug');
    }
  }

  void showPaymentDialog(BuildContext context, String userId, String text) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: Text(l10n.paymentRequired),
            content: Text(l10n.paymentRequiredMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.cancelButton),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  startStripePayment(userId, text);
                },
                child: Text(l10n.payNowButton),
              ),
            ],
          ),
    );
  }

  // Rating functions with security
  Future<void> _rateAnswer(
    String questionId,
    int rating,
    String? feedback,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final String userId = profileProvider.userId ?? '';

      if (userId.isEmpty) {
        _showErrorSnackbar('Please set your User ID first');
        return;
      }

      // Session validation
      if (!SessionManager.isSessionValid(userId)) {
        _showErrorSnackbar('Session expired. Please restart the app.');
        return;
      }

      // Input validation for feedback
      if (feedback != null && feedback.isNotEmpty) {
        final validation = InputValidator.validateMessage(feedback);
        if (!validation.isValid) {
          _showErrorSnackbar(validation.message);
          return;
        }
        feedback = validation.message;
      }

      final response = await SecureApiClient.post(
        url: '${ChatConstants.baseUrl}/questions/rate',
        body: {
          'questionId': questionId,
          'rating': rating,
          'userId': userId,
          if (feedback != null && feedback.isNotEmpty) 'feedback': feedback,
        },
      );

      if (response.statusCode == 200) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).updateMessageRating(questionId, rating, feedback);

        _showSuccessSnackbar(
          rating == 1 ? 'Thank you for your feedback!' : 'Rating submitted!',
        );

        AppLogger.info('Rating submitted successfully', feature: 'rating');
      } else {
        throw Exception('Failed to submit rating');
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Rating error',
        e,
        feature: 'rating',
        stackTrace: stackTrace,
      );
      _showErrorSnackbar('Failed to submit rating');
    }
  }

  Future<void> _rateAdvice(String id, int rating, String? feedback) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId ?? '';

      if (userId.isEmpty) {
        _showErrorSnackbar('Please set your User ID first');
        return;
      }

      // Session validation
      if (!SessionManager.isSessionValid(userId)) {
        _showErrorSnackbar('Session expired. Please restart the app.');
        return;
      }

      // Input validation for feedback
      if (feedback != null && feedback.isNotEmpty) {
        final validation = InputValidator.validateMessage(feedback);
        if (!validation.isValid) {
          _showErrorSnackbar(validation.message);
          return;
        }
        feedback = validation.message;
      }

      final response = await SecureApiClient.post(
        url: '${ChatConstants.baseUrl}/advices/$id/rate',
        body: {
          'rating': rating,
          'userId': userId,
          if (feedback != null && feedback.isNotEmpty) 'feedback': feedback,
        },
      );

      if (response.statusCode == 200) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).updateAdviceRating(id, rating, feedback);

        AppLogger.info(
          'Advice rating submitted successfully',
          feature: 'rating',
        );
      } else {
        throw Exception('Failed to submit rating');
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Advice rating error',
        e,
        feature: 'rating',
        stackTrace: stackTrace,
      );
      _showErrorSnackbar('Failed to submit rating');
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: ChatConstants.scrollDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Refresh data when app comes to foreground
      AppLogger.info('App resumed, refreshing data', feature: 'lifecycle');
      Provider.of<NotificationProvider>(
        context,
        listen: false,
      ).reloadUnreadCount();
      _fetchInitialData();
    } else if (state == AppLifecycleState.paused) {
      // Clean up when app goes to background
      AppLogger.info('App paused, cleaning up', feature: 'lifecycle');
    }
  }

  @override
  void dispose() {
    _cleanupOldMessages();
    AppLogger.info('ChatScreen disposed', feature: 'chat_screen');

    _refreshTimer?.cancel();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    _showButtonNotifier.dispose();

    if (socket.connected) {
      socket.disconnect();
    }
    socket.dispose();

    // Clear rate limiting for this user
    if (userId != null) {
      RateLimiter.clearUserRequests(userId!);
    }

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _buildAppBar(l10n),
      drawer: _buildDrawer(l10n),
      body: _buildChatBody(l10n),
    );
  }

  AppBar _buildAppBar(AppLocalizations l10n) {
    return AppBar(
      title: Text(l10n.chatTitle),

      leading: Consumer<HoroscopeProvider>(
        builder: (context, horoscopeProvider, _) {
          final hasUnread = horoscopeProvider.unreadCount > 0;
          return Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              if (hasUnread)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      actions: [
        Icon(
          _isSocketConnected ? Icons.circle : Icons.circle_outlined,
          color: _isSocketConnected ? Colors.green : Colors.red,
          size: 12,
        ),
        IconButton(
          icon: const Icon(Icons.lightbulb_outline),
          onPressed: _openHowToAskScreen,
        ),
        _buildNotificationIcon(),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return Consumer<NotificationProvider>(
      builder: (context, provider, _) {
        return IconButton(
          icon:
              provider.unreadCount > 0
                  ? badges.Badge(
                    badgeContent: Text(
                      provider.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: const Icon(Icons.notifications),
                    badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
                  )
                  : const Icon(Icons.notifications),
          onPressed: _openNotificationsScreen,
        );
      },
    );
  }

  void _openHowToAskScreen() async {
    AppLogger.info('Opening HowToAskScreen', feature: 'navigation');

    final selectedQuestion = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HowToAskScreen()),
    );

    if (selectedQuestion != null && selectedQuestion is String) {
      setState(() {
        _controller.text = selectedQuestion;
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        FocusScope.of(context).requestFocus(_focusNode);
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
      });
    }
  }

  // Add socket message validation
  void _validateSocketMessage(Map<String, dynamic> data) {
    // Validate message structure
    if (data['text'] == null || data['text'] is! String) {
      throw Exception('Invalid message structure');
    }

    // Validate message size
    if (data['text'].length > ChatConstants.maxMessageLength * 2) {
      throw Exception('Message too large');
    }

    // Sanitize incoming data
    final validation = InputValidator.validateMessage(data['text']);
    if (!validation.isValid) {
      throw Exception('Invalid message content');
    }
  }

  void _openNotificationsScreen() {
    AppLogger.info('Opening NotificationsScreen', feature: 'navigation');

    Provider.of<NotificationProvider>(
      context,
      listen: false,
    ).clearUnreadCount();

    final userId =
        Provider.of<ProfileProvider>(context, listen: false).userId ?? '';

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotificationsScreen(userId: userId)),
    ).then((_) {
      Provider.of<NotificationProvider>(
        context,
        listen: false,
      ).clearUnreadCount();
    });
  }

  void _cleanupOldMessages() {
    final chatService = Provider.of<ChatService>(context, listen: false);
    final messages = chatService.messages;

    // Keep only last 100 messages in memory
    if (messages.length > 100) {
      final recentMessages = messages.sublist(messages.length - 100);
      chatService.setMessages(recentMessages);
    }
  }

  Widget _buildDrawer(AppLocalizations l10n) {
    final userId = Provider.of<ProfileProvider>(context, listen: false).userId;

    return Consumer<HoroscopeProvider>(
      builder: (context, horoscopeProvider, _) {
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                        Icons.person,
                        l10n.drawerAstroProfile,
                        ProfileScreen(userId: userId ?? ''),
                      ),
                      _buildDrawerItem(
                        Icons.auto_awesome,
                        l10n.drawerDailyHoroscope,
                        DailyHoroscopeScreen(userId: userId),
                        badge:
                            horoscopeProvider.unreadCount > 0
                                ? _buildBadge(horoscopeProvider.unreadCount)
                                : null,
                      ),
                      _buildDrawerItem(
                        Icons.shopping_cart,
                        l10n.drawerBuyQuestions,
                        const QuestionStoreScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.menu_book,
                        l10n.drawerAstroDictionary,
                        const AstroDictionaryScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.settings,
                        l10n.drawerSettings,
                        const SettingsScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.support_agent,
                        l10n.drawerCustomerSupport,
                        const CustomerSupportPage(),
                      ),
                      _buildDrawerItem(
                        Icons.info_outline,
                        l10n.drawerAbout,
                        const AboutUsPage(),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                _buildDrawerItem(
                  Icons.settings_suggest,
                  l10n.drawerProfileSettings,
                  const ProfileSettingsScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    Widget screen, {
    Widget? badge,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Row(
        children: [
          Text(title),
          if (badge != null) ...[const SizedBox(width: 6), badge],
        ],
      ),
      onTap: () {
        AppLogger.info('Navigating to $title', feature: 'navigation');
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }

  Widget _buildChatBody(AppLocalizations l10n) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Consumer2<ChatService, DictionaryProvider>(
                builder: (context, chatService, dictProvider, _) {
                  final dictionaryMap = dictProvider.dictionaryMap;

                  if (chatService.messages.isEmpty) {
                    return _buildEmptyState(l10n);
                  }

                  return _buildMessageList(chatService, dictionaryMap);
                },
              ),
            ),
            _buildMessageInput(l10n),
          ],
        ),
        _buildScrollToBottomButton(),
      ],
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            l10n.noMessagesYet,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.startChatting,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(
    ChatService chatService,
    Map<String, dynamic> dictionaryMap,
  ) {
    return ListView.builder(
      reverse: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: chatService.messages.length,
      itemBuilder: (context, index) {
        final message = chatService.messages[index];
        return ChatBubble(
          key: ValueKey('${message.id}_${message.rating}_${message.feedback}'),
          message: message,
          onRateAnswer: _rateAnswer,
          onRateAdvice: _rateAdvice,
          chatService: chatService,
          dictionaryMap: _convertToAstroTermMap(dictionaryMap),
        );
      },
    );
  }

  Widget _buildMessageInput(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: _isInputEnabled, // ✅ CONTROL ENABLE/DISABLE STATE
              decoration: InputDecoration(
                hintText: l10n.typeYourQuestionHint,
                hintStyle: TextStyle(
                  color:
                      _isInputEnabled
                          ? Colors
                              .grey
                              .shade600 // Normal color when enabled
                          : Colors.grey.shade400, // Lighter color when disabled
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor:
                    _isInputEnabled
                        ? Colors
                            .grey
                            .shade100 // Normal background when enabled
                        : Colors
                            .grey
                            .shade50, // Lighter background when disabled
              ),
              minLines: 1,
              maxLines: 3,
              style: TextStyle(
                color:
                    _isInputEnabled
                        ? Colors
                            .black // Normal text color when enabled
                        : Colors
                            .grey
                            .shade500, // Lighter text color when disabled
              ),
              onChanged: (value) {
                // Real-time input validation could be added here
              },
            ),
          ),
          const SizedBox(width: 8),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildSendButton() {
    return _isSending
        ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const BouncingDots(color: Colors.black, size: 8),
        )
        : IconButton(
          icon: const Icon(Icons.send, color: Colors.blue),
          onPressed: handleSendMessage,
          tooltip: 'Send message',
        );
  }

  Widget _buildScrollToBottomButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showButtonNotifier,
      builder: (context, showButton, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: showButton ? 80 : -50,
          right: 16,
          child: GestureDetector(
            onTap: _scrollToBottom,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Helper class for question eligibility
class QuestionEligibility {
  final bool isFreeEligible;
  final int remainingFreeQuestions;
  final bool isFirstTime; // ✅ add this
  final bool isFreeByClarification; // ✅ new

  QuestionEligibility({
    required this.isFreeEligible,
    required this.remainingFreeQuestions,
    this.isFirstTime = false, // ✅ default to false
    this.isFreeByClarification = false,
  });
}

// Extension for localization (add these keys to your AppLocalizations)
extension ChatLocalizations on AppLocalizations {
  String get noMessagesYet => 'No messages yet';
  String get startChatting => 'Start chatting by sending your first question!';
}
