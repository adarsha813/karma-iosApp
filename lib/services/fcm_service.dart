// lib/services/fcm_token_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:kundali/config/environment.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:kundali/services/http_service.dart'; // ✅ Import HttpService

class FCMTokenService {
  static final Logger _logger = Logger();

  // ✅ Remove HTTP client - HttpService manages its own
  // ✅ Remove timeout constants - HttpService has its own

  // Backward compatibility - keep the old function name for your existing code
  static Future<bool> sendFcmTokenToBackend(
    String? userId,
    String? token,
  ) async {
    if (userId == null || token == null) {
      _logger.w('FCMTokenService: UserId or token is null');
      return false;
    }

    final result = await registerFCMToken(userId: userId, token: token);
    return result.success;
  }

  static Future<FCMTokenResult> registerFCMToken({
    required String userId,
    required String token,
    String? deviceId,
    String? deviceType,
  }) async {
    // Input validation
    final validationError = _validateInputs(userId, token);
    if (validationError != null) {
      _logger.e('FCMTokenService: Validation failed - $validationError');
      return FCMTokenResult(
        success: false,
        error: validationError,
        statusCode: 400,
      );
    }

    // Additional FCM token validation
    if (!_isValidFcmToken(token)) {
      _logger.e('FCMTokenService: Invalid FCM token format');
      return FCMTokenResult(
        success: false,
        error: 'Invalid FCM token format',
        statusCode: 400,
      );
    }

    _logger.i('FCMTokenService: Registering token for user $userId');

    try {
      final Map<String, dynamic> requestBody = {
        'userId': userId,
        'token': token,
        'deviceId': deviceId ?? await _getDeviceId(),
        'deviceType': deviceType ?? _getDeviceType(),
        'appVersion': Environment.appVersion,
        'timestamp': DateTime.now().toIso8601String(),
        'platform': _getPlatform(),
      };

      // ✅ Use HttpService instead of direct HTTP client
      final response = await HttpService().post(
        '${Environment.baseUrl}/api/register-fcm-token',
        body: requestBody,
        requiresAuth: true, // This endpoint needs authentication
      );

      _logger.i('FCMTokenService: Response ${response.statusCode}');

      if (response.statusCode == 200) {
        _logger.d(
          'FCMTokenService: Token registered successfully for user $userId',
        );

        // Store registration timestamp for tracking
        await _storeRegistrationTimestamp(userId);

        return FCMTokenResult(
          success: true,
          statusCode: response.statusCode,
          message: 'FCM token registered successfully',
        );
      } else {
        final error = _handleError(response.statusCode, response.body);
        _logger.e('FCMTokenService: Failed to register token - $error');
        return FCMTokenResult(
          success: false,
          error: error,
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      _logger.e('FCMTokenService: Network error - $e');
      return FCMTokenResult(
        success: false,
        error: 'No internet connection',
        statusCode: 0,
      );
    } on TimeoutException catch (e) {
      _logger.e('FCMTokenService: Request timeout - $e');
      return FCMTokenResult(
        success: false,
        error: 'Request timed out',
        statusCode: 0,
      );
    } on FormatException catch (e) {
      _logger.e('FCMTokenService: JSON format error - $e');
      return FCMTokenResult(
        success: false,
        error: 'Invalid response format',
        statusCode: 0,
      );
    } catch (e) {
      _logger.e('FCMTokenService: Unexpected error - $e');
      return FCMTokenResult(
        success: false,
        error: 'An unexpected error occurred',
        statusCode: 0,
      );
    }
  }

  static Future<FCMTokenResult> unregisterFCMToken({
    required String userId,
    String? deviceId,
    String? token,
  }) async {
    if (userId.isEmpty) {
      return FCMTokenResult(
        success: false,
        error: 'User ID is required',
        statusCode: 400,
      );
    }

    _logger.i('FCMTokenService: Unregistering token for user $userId');

    try {
      final Map<String, dynamic> requestBody = {
        'userId': userId,
        'deviceId': deviceId ?? await _getDeviceId(),
        'timestamp': DateTime.now().toIso8601String(),
        if (token != null) 'token': token,
      };

      // ✅ Use HttpService instead of direct HTTP client
      final response = await HttpService().post(
        '${Environment.baseUrl}/api/unregister-fcm-token',
        body: requestBody,
        requiresAuth: true,
      );

      _logger.i('FCMTokenService: Unregister response ${response.statusCode}');

      if (response.statusCode == 200) {
        _logger.d(
          'FCMTokenService: Token unregistered successfully for user $userId',
        );

        // Clear registration timestamp
        await _clearRegistrationTimestamp(userId);

        return FCMTokenResult(
          success: true,
          statusCode: response.statusCode,
          message: 'FCM token unregistered successfully',
        );
      } else {
        final error = _handleError(response.statusCode, response.body);
        _logger.e('FCMTokenService: Failed to unregister token - $error');
        return FCMTokenResult(
          success: false,
          error: error,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logger.e('FCMTokenService: Error unregistering token - $e');
      return FCMTokenResult(
        success: false,
        error: 'Failed to unregister token',
        statusCode: 0,
      );
    }
  }

  /// ✅ NEW: Refresh FCM token endpoint
  static Future<FCMTokenResult> refreshFCMToken({
    required String userId,
    required String oldToken,
    required String newToken,
  }) async {
    _logger.i('FCMTokenService: Refreshing token for user $userId');

    try {
      final response = await HttpService().post(
        '${Environment.baseUrl}/api/refresh-fcm-token',
        body: {
          'userId': userId,
          'oldToken': oldToken,
          'newToken': newToken,
          'deviceId': await _getDeviceId(),
          'timestamp': DateTime.now().toIso8601String(),
        },
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        _logger.d('FCMTokenService: Token refreshed successfully');
        await _storeRegistrationTimestamp(userId);
        return FCMTokenResult(
          success: true,
          statusCode: response.statusCode,
          message: 'FCM token refreshed successfully',
        );
      } else {
        return FCMTokenResult(
          success: false,
          error: _handleError(response.statusCode, response.body),
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logger.e('FCMTokenService: Error refreshing token - $e');
      return FCMTokenResult(
        success: false,
        error: 'Failed to refresh token',
        statusCode: 0,
      );
    }
  }

  /// ✅ NEW: Get token status
  static Future<Map<String, dynamic>> getTokenStatus(String userId) async {
    try {
      final response = await HttpService().get(
        '${Environment.baseUrl}/api/fcm-token-status?userId=$userId',
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
      return {};
    } catch (e) {
      _logger.e('FCMTokenService: Error getting token status - $e');
      return {};
    }
  }

  // Enhanced FCM token validation
  static bool _isValidFcmToken(String token) {
    if (token.isEmpty) return false;

    // Basic FCM token validation patterns
    final patterns = [
      r'^[a-zA-Z0-9_-]+:[a-zA-Z0-9_-]+$', // Standard FCM format
      r'^[a-zA-Z0-9]{100,}$', // Long alphanumeric
    ];

    return patterns.any((pattern) => RegExp(pattern).hasMatch(token));
  }

  static String? _validateInputs(String userId, String token) {
    if (userId.isEmpty) return 'User ID is required';
    if (token.isEmpty) return 'FCM token is required';

    if (userId.length > 100) return 'User ID too long';
    if (token.length > 1000) return 'FCM token too long';

    // Enhanced user ID validation matching your SecurityUtils
    if (!RegExp(r'^[a-zA-Z0-9_-]{3,100}$').hasMatch(userId)) {
      return 'User ID must be 3-100 characters (letters, numbers, _, -)';
    }

    return null;
  }

  // ✅ Remove _buildHeaders - HttpService handles headers

  static String _handleError(int statusCode, String body) {
    _logger.d('FCMTokenService: Error response body: $body');

    try {
      final errorData = json.decode(body);
      if (errorData is Map && errorData['error'] != null) {
        return errorData['error'].toString();
      }
    } catch (e) {
      // If JSON parsing fails, use status code based messages
    }

    switch (statusCode) {
      case 400:
        return 'Invalid request parameters';
      case 401:
        return 'Authentication required';
      case 403:
        return 'Access denied';
      case 404:
        return 'Endpoint not found';
      case 409:
        return 'Token already registered';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
      case 502:
      case 503:
        return 'Server temporarily unavailable';
      default:
        return 'Failed to register token (Error: $statusCode)';
    }
  }

  static Future<String> _getDeviceId() async {
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id; // ANDROID_ID
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ??
            'ios_device_${DateTime.now().millisecondsSinceEpoch}';
      }

      return 'unknown_device_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      _logger.e('FCMTokenService: Error getting device ID - $e');
      return 'error_device_${DateTime.now().millisecondsSinceEpoch}';
    }
  }

  static String _getDeviceType() {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    return 'unknown';
  }

  static String _getPlatform() {
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }

  // Store registration timestamp for tracking
  static Future<void> _storeRegistrationTimestamp(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'fcm_registration_$userId',
        DateTime.now().toIso8601String(),
      );
    } catch (e) {
      _logger.e('FCMTokenService: Error storing registration timestamp - $e');
    }
  }

  // Clear registration timestamp
  static Future<void> _clearRegistrationTimestamp(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('fcm_registration_$userId');
    } catch (e) {
      _logger.e('FCMTokenService: Error clearing registration timestamp - $e');
    }
  }

  // Get last registration time
  static Future<DateTime?> getLastRegistrationTime(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final timestamp = prefs.getString('fcm_registration_$userId');
      return timestamp != null ? DateTime.parse(timestamp) : null;
    } catch (e) {
      _logger.e('FCMTokenService: Error getting registration timestamp - $e');
      return null;
    }
  }

  // Check if token needs refresh (e.g., if last registration was > 7 days ago)
  static Future<bool> needsTokenRefresh(String userId) async {
    try {
      final lastRegistration = await getLastRegistrationTime(userId);
      if (lastRegistration == null) return true;

      final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
      return lastRegistration.isBefore(sevenDaysAgo);
    } catch (e) {
      _logger.e('FCMTokenService: Error checking token refresh - $e');
      return true;
    }
  }

  // Retry mechanism for temporary failures
  static Future<FCMTokenResult> registerWithRetry({
    required String userId,
    required String token,
    int maxRetries = 3,
    Duration initialDelay = const Duration(seconds: 1),
  }) async {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      final result = await registerFCMToken(userId: userId, token: token);

      if (result.success) {
        return result;
      }

      // Don't retry on client errors (4xx)
      if (result.statusCode >= 400 && result.statusCode < 500) {
        return result;
      }

      if (attempt < maxRetries) {
        final delay = initialDelay * attempt;
        _logger.w('FCMTokenService: Retry $attempt after ${delay.inSeconds}s');
        await Future.delayed(delay);
      }
    }

    return FCMTokenResult(
      success: false,
      error: 'Failed after $maxRetries attempts',
      statusCode: 0,
    );
  }

  // Batch token operations for multiple users (if needed in future)
  static Future<List<FCMTokenResult>> registerMultipleTokens({
    required List<Map<String, String>> tokens,
  }) async {
    final results = <FCMTokenResult>[];

    for (final tokenData in tokens) {
      final result = await registerFCMToken(
        userId: tokenData['userId']!,
        token: tokenData['token']!,
      );
      results.add(result);
    }

    return results;
  }

  // ✅ Remove dispose method - HttpService manages its own client
  // HttpService is a singleton, so we don't need to dispose it manually
}

// Result class for better response handling
class FCMTokenResult {
  final bool success;
  final String? error;
  final int statusCode;
  final String? message;
  final Map<String, dynamic>? data;

  FCMTokenResult({
    required this.success,
    this.error,
    required this.statusCode,
    this.message,
    this.data,
  });

  @override
  String toString() {
    return 'FCMTokenResult(success: $success, statusCode: $statusCode, error: $error, message: $message)';
  }
}
