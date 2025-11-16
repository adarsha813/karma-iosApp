import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import '../config/environment.dart';
import 'dart:io';
import '../utils/app_logger.dart';
import 'package:crypto/crypto.dart'; // for sha256
import '../providers/profile_provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentException implements Exception {
  final String message;
  final String code; // optional error code

  PaymentException(this.message, [this.code = 'UNKNOWN']);

  @override
  String toString() => 'PaymentException(code: $code, message: $message)';
}

class EnterprisePaymentService {
  static final _client = http.Client();
  static bool _isPaymentSheetInitialized = false;
  static Completer<void>? _initializationCompleter;

  static Future<void> _ensurePaymentSheetInitialized(
    String clientSecret,
  ) async {
    if (_isPaymentSheetInitialized) return;

    if (_initializationCompleter != null) {
      // Initialization already in progress, wait for it
      await _initializationCompleter!.future;
      return;
    }

    _initializationCompleter = Completer<void>();

    try {
      AppLogger.info(
        '🔄 Initializing payment sheet with client secret...',
        feature: 'payment_sheet_init',
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Astro Chat App',
          customerId: await _getCustomerId(),
          style: ThemeMode.light,
          customFlow: false,
          allowsDelayedPaymentMethods: false,
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            currencyCode: 'USD',
            testEnv: kDebugMode,
          ),
          // 🛡️ ADD SECURITY CONFIGURATION
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Colors.blue,
              background: Colors.white,
              componentBackground: Colors.grey.shade50,
              componentBorder: Colors.grey.shade300,
              componentDivider: Colors.grey.shade200,
              placeholderText: Colors.grey, // 👈 optional
            ),
          ),
        ),
      );

      _isPaymentSheetInitialized = true;
      _initializationCompleter!.complete();

      AppLogger.info(
        '✅ Payment sheet initialized successfully',
        feature: 'payment_sheet_init',
      );
    } catch (e) {
      _isPaymentSheetInitialized = false;
      _initializationCompleter!.completeError(e);
      _initializationCompleter = null;
      rethrow;
    }
  }

  // 🛡️ MAKE THIS METHOD STATIC
  static Future<String?> _getCustomerId() async {
    try {
      final profileProvider = ProfileProvider();
      await profileProvider.ensureInitialized();
      return profileProvider.userId;
    } catch (e) {
      AppLogger.error(
        'Failed to get customer ID',
        error: e,
        feature: 'payment_customer_id',
      );
      return null;
    }
  }

  // 🛡️ RESET INITIALIZATION STATE
  static void _resetInitializationState() {
    _isPaymentSheetInitialized = false;
    _initializationCompleter = null;
  }

  // 🛡️ Enhanced security headers
  static Map<String, String> _getSecurityHeaders(String? token) {
    final headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'AstroChatApp/${Environment.appVersion}',
      'X-Platform': Platform.operatingSystem,
      'X-Client-Version': Environment.appVersion,
      'X-Timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      'X-Request-ID': _generateRequestId(),
      'X-Device-ID': '', // Will be set dynamically
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return headers;
  }

  // 🛡️ Generate secure request ID
  static String _generateRequestId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(999999);
    return 'req_${timestamp}_${random}';
  }

  // 🛡️ Enhanced payment initialization
  static Future<PaymentIntentResult> initializeQuestionPayment({
    required String userId,
    required String questionText,
    required String clientIp,
    required String userAgent,
  }) async {
    final startTime = DateTime.now();

    try {
      // 🛡️ 0. Ensure ProfileProvider is initialized FIRST
      final profileProvider = ProfileProvider();
      await profileProvider.ensureInitialized();
      // 🛡️ 1. Pre-validation
      final validation = _validatePaymentRequest(questionText);
      if (!validation.isValid) {
        throw PaymentException(validation.message, 'VALIDATION_FAILED');
      }

      // 🛡️ 2. Get auth token securely

      final token = await _getSecureAuthTokenWithRetry();
      if (token == null) {
        throw PaymentException('Authentication required', 'AUTH_MISSING');
      }
      // 🛡️ 3. Generate idempotency key
      final idempotencyKey = _generateIdempotencyKey(userId);

      // 🛡️ 4. Create payment intent with enhanced security
      final paymentData = await _createPaymentIntent(
        userId: userId,
        questionText: questionText,
        token: token,
        idempotencyKey: idempotencyKey,
        clientIp: clientIp,
        userAgent: userAgent,
      );

      // 🛡️ 5. Configure Stripe with security settings
      await _configureStripeSecurely();

      return PaymentIntentResult(
        success: true,
        clientSecret: paymentData['clientSecret'],
        paymentIntentId: paymentData['paymentIntentId'],
        amount: paymentData['amount'],
        currency: paymentData['currency'],
        requiresAction: paymentData['requiresAction'] ?? false,
        processingTime: DateTime.now().difference(startTime),
      );
    } catch (e) {
      _logPaymentError('initializeQuestionPayment', e, userId);
      rethrow;
    }
  }

  // 🛡️ Enhanced token retrieval with retry and fallback - FIXED VERSION
  static Future<String?> _getSecureAuthTokenWithRetry({
    int maxRetries = 3,
    Duration retryDelay = const Duration(milliseconds: 500),
  }) async {
    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      final token = await _getSecureAuthToken();
      if (token != null) return token;

      if (attempt < maxRetries) {
        AppLogger.info(
          'Token not found, attempt ${attempt + 1}/$maxRetries',
          feature: 'token_management',
        );

        // Wait and try to refresh token through ProfileProvider
        await Future.delayed(retryDelay);
        await _attemptTokenRefresh();
      }
    }

    AppLogger.error(
      'All token retrieval attempts failed',

      feature: 'token_management',
    );
    return null;
  }

  // 🛡️ Attempt to refresh token through ProfileProvider - FIXED VERSION
  static Future<void> _attemptTokenRefresh() async {
    try {
      final profileProvider = ProfileProvider();
      await profileProvider.ensureInitialized();

      if (profileProvider.userId != null) {
        AppLogger.info(
          'Attempting to fetch new token for user: ${profileProvider.userId}',
          feature: 'token_management',
        );
        await profileProvider.fetchAndSaveToken(profileProvider.userId!);

        // Verify token was saved
        if (profileProvider.token != null) {
          AppLogger.info(
            '✅ Token refresh successful',
            feature: 'token_management',
          );
        } else {
          AppLogger.warning(
            'Token refresh completed but token is still null',
            feature: 'token_management',
          );
        }
      } else {
        AppLogger.warning(
          'No user ID available for token refresh',
          feature: 'token_management',
        );
      }
    } catch (e) {
      AppLogger.error(
        'Token refresh attempt failed',
        feature: 'token_management',
      );
    }
  }

  // 🛡️ Secure payment execution
  // 🛡️ Secure payment execution - ADD NULL CHECKS
  // 🛡️ Enhanced payment execution with polling
  static Future<PaymentResult> executePayment({
    required String clientSecret,
    required String paymentIntentId,
    required String userId,
    required String questionText,
  }) async {
    try {
      // 🛡️ 1. Validate required parameters
      if (clientSecret.isEmpty) {
        throw PaymentException(
          'Client secret is required',
          'CLIENT_SECRET_MISSING',
        );
      }

      // 🛡️ 2. Initialize payment sheet
      await _ensurePaymentSheetInitialized(clientSecret);
      await Future.delayed(const Duration(milliseconds: 500));

      // 🛡️ 3. Present payment sheet
      AppLogger.info(
        '🔄 Presenting payment sheet...',
        feature: 'payment_execution',
      );

      await Stripe.instance.presentPaymentSheet();

      AppLogger.info(
        '✅ Payment sheet completed, verifying payment...',
        feature: 'payment_execution',
      );

      // 🛡️ 4. Verify payment with retry logic (for asynchronous payments)
      PaymentVerification? verification;
      for (int attempt = 0; attempt < 3; attempt++) {
        verification = await _verifyPaymentServerSide(
          paymentIntentId: paymentIntentId,
          userId: userId,
        );

        if (verification.verified) {
          break;
        }

        // If payment is still processing, wait and retry
        if (verification.status == 'processing' && attempt < 2) {
          AppLogger.info(
            'Payment processing, retrying in 2 seconds...',
            feature: 'payment_verification',
          );
          await Future.delayed(const Duration(seconds: 2));
          continue;
        }

        // If payment failed, break immediately
        break;
      }

      final finalVerification = verification!;

      if (!finalVerification.verified) {
        throw PaymentException(
          'Payment verification failed: ${finalVerification.error ?? "Unknown error"}',
          'VERIFICATION_FAILED',
        );
      }

      // 🛡️ 5. Validate verification data
      if (finalVerification.amount == null ||
          finalVerification.currency == null) {
        throw PaymentException(
          'Invalid verification data received',
          'INVALID_VERIFICATION_DATA',
        );
      }

      // 🛡️ 6. Process the paid question
      final questionResult = await _processPaidQuestion(
        userId: userId,
        questionText: questionText,
        paymentIntentId: paymentIntentId,
      );

      // 🛡️ 7. Reset initialization state for next payment
      _resetInitializationState();

      return PaymentResult(
        success: true,
        paymentIntentId: paymentIntentId,
        amount: finalVerification.amount!,
        currency: finalVerification.currency!,
        questionId: questionResult['questionId']?.toString(),
      );
    } catch (e) {
      // 🛡️ Reset state on error
      _resetInitializationState();
      _logPaymentError('executePayment', e, userId);
      rethrow;
    }
  }

  // 🛡️ Enhanced payment verification with better error handling
  static Future<PaymentVerification> _verifyPaymentServerSide({
    required String paymentIntentId,
    required String userId,
  }) async {
    try {
      final token = await _getSecureAuthToken();

      // 🛡️ Validate token exists
      if (token == null) {
        throw PaymentException(
          'Authentication token not available for verification',
          'TOKEN_MISSING',
        );
      }

      final headers = _getSecurityHeaders(token);
      final verificationToken = await _generateVerificationToken();

      AppLogger.info(
        '🔄 Verifying payment: $paymentIntentId for user: $userId',
        feature: 'payment_verification',
      );

      final response = await _client
          .post(
            Uri.parse('${Environment.baseUrl}/api/verify-payment'),
            headers: headers,
            body: json.encode({
              'paymentIntentId': paymentIntentId,
              'userId': userId,
              'verificationToken': verificationToken,
              'timestamp': DateTime.now().toIso8601String(),
            }),
          )
          .timeout(const Duration(seconds: 30));

      final responseBody = response.body;
      AppLogger.info(
        '🔍 Verification response: ${response.statusCode} - $responseBody',
        feature: 'payment_verification',
      );

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);

        // 🛡️ Handle both success and failure cases properly
        final bool verified = data['success'] ?? false;
        final dynamic responseData = data['data'];

        if (verified && responseData != null) {
          // 🛡️ Success case with data
          return PaymentVerification(
            verified: true,
            paymentIntentId:
                responseData['paymentIntentId']?.toString() ?? paymentIntentId,
            status: responseData['status']?.toString() ?? 'succeeded',
            amount: (responseData['amount'] as num?)?.toDouble(),
            currency: responseData['currency']?.toString() ?? 'usd',
          );
        } else {
          // 🛡️ Verification failed case
          final errorMessage =
              data['message'] ??
              responseData?['error'] ??
              'Payment verification failed';
          final errorCode = data['code'] ?? 'VERIFICATION_FAILED';

          AppLogger.error(
            'Payment verification failed: $errorMessage',
            error: Exception(errorCode),
            feature: 'payment_verification',
          );

          return PaymentVerification(
            verified: false,
            paymentIntentId: paymentIntentId,
            status: data['status']?.toString() ?? 'failed',
            error: errorMessage,
          );
        }
      } else {
        // 🛡️ HTTP error case
        final errorData = json.decode(responseBody);
        final errorMessage =
            errorData['message'] ??
            'Verification failed: HTTP ${response.statusCode}';

        throw PaymentException(
          errorMessage,
          'VERIFICATION_HTTP_${response.statusCode}',
        );
      }
    } catch (e) {
      _logPaymentError('_verifyPaymentServerSide', e, userId);
      rethrow;
    }
  }

  // 🛡️ Enhanced payment intent creation
  // 🛡️ Enhanced payment intent creation with better validation
  static Future<Map<String, dynamic>> _createPaymentIntent({
    required String userId,
    required String questionText,
    required String token,
    required String idempotencyKey,
    required String clientIp,
    required String userAgent,
  }) async {
    final headers = _getSecurityHeaders(token);
    headers['Idempotency-Key'] = idempotencyKey;
    headers['X-Client-IP'] = clientIp;
    headers['X-User-Agent'] = userAgent;

    final response = await _client
        .post(
          Uri.parse('${Environment.baseUrl}/api/secure-question-payment'),
          headers: headers,
          body: json.encode({
            'userId': userId,
            'questionText': questionText,
            'idempotencyKey': idempotencyKey,
            'platform': Platform.operatingSystem,
            'appVersion': Environment.appVersion,
            'timestamp': DateTime.now().toIso8601String(),
            'clientIp': clientIp,
            'userAgent': userAgent,
          }),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // 🛡️ ENHANCED DEBUG: Log the complete response
      AppLogger.info(
        '🔍 COMPLETE PAYMENT RESPONSE: ${json.encode(data)}',
        feature: 'payment_debug',
      );

      // 🛡️ CORRECTED: Access the nested data object
      final responseData = data['data'];
      if (responseData == null) {
        AppLogger.error(
          'No data object in payment response',
          error: Exception('Response keys: ${data.keys.join(', ')}'),
          feature: 'payment_validation',
        );
        throw PaymentException(
          'Invalid payment response structure - missing data object',
          'INVALID_RESPONSE',
        );
      }

      final clientSecret = responseData['clientSecret'];
      if (clientSecret == null || clientSecret.isEmpty) {
        AppLogger.error(
          'Missing client secret in payment response',
          error: Exception('Available keys: ${responseData.keys.join(', ')}'),
          feature: 'payment_validation',
        );
        throw PaymentException(
          'Payment initialization failed - no client secret received',
          'CLIENT_SECRET_MISSING',
        );
      }

      return {
        'clientSecret': clientSecret,
        'paymentIntentId': responseData['paymentIntentId'],
        'amount': responseData['amount'],
        'currency': responseData['currency'],
        'requiresAction': responseData['requiresAction'] ?? false,
      };
    } else {
      final errorData = json.decode(response.body);
      AppLogger.error(
        'Payment creation HTTP error',
        error: Exception('HTTP ${response.statusCode}: ${response.body}'),
        feature: 'payment_validation',
      );
      throw PaymentException(
        errorData['error'] ?? 'Payment creation failed',
        errorData['code'] ?? 'PAYMENT_CREATION_FAILED',
      );
    }
  }

  // 🛡️ Enhanced Stripe configuration
  static Future<void> _configureStripeSecurely() async {
    try {
      // 🛡️ Get configuration from server
      await _getStripeConfig();

      await Stripe.instance.applySettings();

      AppLogger.info('Stripe configured securely', feature: 'payment_config');
    } catch (e) {
      AppLogger.error(
        'Stripe configuration failed',
        error: e,
        feature: 'payment_config',
      );
      rethrow;
    }
  }

  // 🛡️ Process paid question with transaction safety
  static Future<Map<String, dynamic>> _processPaidQuestion({
    required String userId,
    required String questionText,
    required String paymentIntentId,
    int maxRetries = 2,
  }) async {
    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      try {
        final token = await _getSecureAuthToken();

        if (token == null) {
          throw PaymentException(
            'Authentication token not available for question processing',
            'TOKEN_MISSING',
          );
        }

        final headers = _getSecurityHeaders(token);

        AppLogger.info(
          '🔄 Processing paid question (attempt ${attempt + 1}/${maxRetries + 1})',
          feature: 'question_processing',
        );

        final response = await _client
            .post(
              Uri.parse('${Environment.baseUrl}/api/process-paid-question'),
              headers: headers,
              body: json.encode({
                'userId': userId,
                'questionText': questionText,
                'paymentIntentId': paymentIntentId,
                'timestamp': DateTime.now().toIso8601String(),
                'attempt': attempt + 1,
              }),
            )
            .timeout(const Duration(seconds: 30));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          AppLogger.info(
            '✅ Paid question processed successfully',
            feature: 'question_processing',
          );

          return {
            'questionId': data['questionId']?.toString(),
            'paymentIntentId':
                data['paymentIntentId']?.toString() ?? paymentIntentId,
            'success': data['success'] ?? false,
          };
        } else if (response.statusCode == 500 && attempt < maxRetries) {
          // Retry on server errors
          AppLogger.warning(
            'Server error, retrying in ${2 * (attempt + 1)} seconds...',
            feature: 'question_processing',
          );
          await Future.delayed(Duration(seconds: 2 * (attempt + 1)));
          continue;
        } else {
          final errorData = json.decode(response.body);
          throw PaymentException(
            errorData['message'] ??
                'Question processing failed: HTTP ${response.statusCode}',
            errorData['code'] ?? 'QUESTION_PROCESSING_FAILED',
          );
        }
      } catch (e) {
        if (attempt == maxRetries) rethrow;
        // Wait and retry on network errors
        await Future.delayed(Duration(seconds: 1 * (attempt + 1)));
      }
    }

    throw PaymentException(
      'Question processing failed after $maxRetries retries',
      'MAX_RETRIES_EXCEEDED',
    );
  }

  // 🛡️ Enhanced validation
  static ValidationResult _validatePaymentRequest(String questionText) {
    if (questionText.isEmpty) {
      return ValidationResult(false, 'Question text cannot be empty');
    }

    if (questionText.length < 10) {
      return ValidationResult(false, 'Question must be at least 10 characters');
    }

    if (questionText.length > 1000) {
      return ValidationResult(false, 'Question too long (max 1000 characters)');
    }

    // 🛡️ XSS prevention
    final xssPattern = RegExp(r'<script|javascript:|on\w+\s*=');
    if (xssPattern.hasMatch(questionText.toLowerCase())) {
      return ValidationResult(false, 'Invalid characters in question');
    }

    return ValidationResult(true, 'Valid');
  }

  // 🛡️ Secure token management - FIXED VERSION
  static Future<String?> _getSecureAuthToken() async {
    try {
      // ✅ FIX: Get token directly from ProfileProvider instead of secure storage
      final profileProvider = ProfileProvider();
      await profileProvider.ensureInitialized();

      final token = profileProvider.token;

      if (token == null) {
        AppLogger.warning(
          'No auth token found in ProfileProvider',
          feature: 'token_management',
        );
      } else {
        AppLogger.info(
          '✅ Token retrieved from ProfileProvider',
          feature: 'token_management',
        );
      }

      return token;
    } catch (e) {
      AppLogger.error(
        'Token retrieval failed',
        error: e,
        feature: 'token_management',
      );
      return null;
    }
  }

  // 🛡️ Enhanced idempotency key generation
  static String _generateIdempotencyKey(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1000000);
    final hash = _generateHash('$userId$timestamp$random');
    return 'payment_${userId}_${timestamp}_${hash.substring(0, 16)}';
  }

  // 🛡️ Verification token generation
  static Future<String> _generateVerificationToken() async {
    final deviceId = await _getDeviceId();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final data = '$deviceId$timestamp${Environment.appVersion}';
    return _generateHash(data);
  }

  // 🛡️ Secure hashing
  static String _generateHash(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // 🛡️ Device ID generation
  static Future<String> _getDeviceId() async {
    final deviceInfo = {
      'platform': Platform.operatingSystem,
      'version': Platform.operatingSystemVersion,
      'localized': Platform.localeName,
      'appVersion': Environment.appVersion,
    };
    return _generateHash(json.encode(deviceInfo));
  }

  // 🛡️ Get Stripe configuration from server
  static Future<Map<String, dynamic>> _getStripeConfig() async {
    final response = await _client
        .get(
          Uri.parse('${Environment.baseUrl}/api/stripe-config'),
          headers: _getSecurityHeaders(null),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch Stripe configuration');
    }
  }

  // 🛡️ Secure error logging
  // 🛡️ Secure error logging - FIX NULL SAFETY ISSUES
  static void _logPaymentError(String method, dynamic error, String userId) {
    try {
      // 🛡️ Handle null error safely
      final errorMessage = error?.toString() ?? 'Unknown error';
      final errorCode =
          (error is PaymentException) ? error.code : 'UNKNOWN_ERROR';

      AppLogger.error(
        'Payment error in $method: $errorMessage (code: $errorCode)',
        error: error,
        feature: 'payment_service',
      );

      // 🛡️ Don't expose sensitive error details
      if (error is StripeException) {
        final stripeError = error.error;
        final stripeCode = stripeError.code.toString();
        AppLogger.security(
          'Stripe payment error: $stripeCode',
          userId: userId,
          feature: 'stripe_errors',
        );
      }
    } catch (loggingError) {
      // 🛡️ Fallback logging if the main logging fails
      debugPrint('CRITICAL: Payment logging failed: $loggingError');
    }
  }
}

// 🛡️ Enhanced data models - MAKE NULL-SAFE
class PaymentIntentResult {
  final bool success;
  final String clientSecret;
  final String paymentIntentId;
  final int amount;
  final String currency;
  final bool requiresAction;
  final Duration processingTime;

  PaymentIntentResult({
    required this.success,
    required this.clientSecret,
    required this.paymentIntentId,
    required this.amount,
    required this.currency,
    required this.requiresAction,
    required this.processingTime,
  });
}

class PaymentResult {
  final bool success;
  final String paymentIntentId;
  final double amount;
  final String currency;
  final String? questionId;

  PaymentResult({
    required this.success,
    required this.paymentIntentId,
    required this.amount,
    required this.currency,
    this.questionId,
  });
}

class PaymentVerification {
  final bool verified;
  final String paymentIntentId;
  final String status;
  final double? amount;
  final String? currency;
  final String? error;

  PaymentVerification({
    required this.verified,
    required this.paymentIntentId,
    required this.status,
    this.amount,
    this.currency,
    this.error,
  });
}

class ValidationResult {
  final bool isValid;
  final String message;

  ValidationResult(this.isValid, this.message);
}
