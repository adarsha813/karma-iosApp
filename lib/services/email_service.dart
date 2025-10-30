// lib/services/email_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:kundali/config/environment.dart';
import 'dart:async'; // ✅ Add this line

class EmailService {
  static final Logger _logger = Logger();

  // Use your existing environment configuration
  static String get serviceId => Environment.emailJsServiceId;
  static String get templateId => Environment.emailJsTemplateId;
  static String get publicKey => Environment.emailJsPublicKey;

  static const String _baseUrl = "https://api.emailjs.com/api/v1.0/email/send";

  // HTTP client with production settings
  static final http.Client _client = http.Client();

  // Timeout durations
  static const Duration _connectTimeout = Duration(seconds: 15);
  static const Duration _receiveTimeout = Duration(seconds: 30);

  static Future<EmailResult> sendEmail({
    required String name,
    required String email,
    required String message,
    Map<String, dynamic>? additionalParams,
  }) async {
    final Uri uri = Uri.parse(_baseUrl);

    _logger.i('EmailService: Sending email to $email');

    // Input validation
    final validationError = _validateInputs(name, email, message);
    if (validationError != null) {
      _logger.e('EmailService: Validation failed - $validationError');
      return EmailResult(
        success: false,
        error: validationError,
        statusCode: 400,
      );
    }

    // Check if service is properly configured
    if (!isConfigured()) {
      _logger.e('EmailService: Not properly configured');
      return EmailResult(
        success: false,
        error: 'Email service not configured',
        statusCode: 500,
      );
    }

    try {
      final Map<String, dynamic> templateParams = {
        "user_name": name.trim(),
        "user_email": email.trim(),
        "user_message": message.trim(),
        ...?additionalParams,
      };

      final Map<String, dynamic> requestBody = {
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": publicKey,
        "template_params": templateParams,
      };

      final response = await _client
          .post(uri, headers: _buildHeaders(), body: json.encode(requestBody))
          .timeout(_connectTimeout + _receiveTimeout);

      _logger.i('EmailService: Response ${response.statusCode}');

      if (response.statusCode == 200) {
        _logger.d('EmailService: Email sent successfully to $email');
        return EmailResult(
          success: true,
          statusCode: response.statusCode,
          message: 'Email sent successfully',
        );
      } else {
        final error = _handleEmailError(response.statusCode, response.body);
        _logger.e('EmailService: Failed to send email - $error');
        return EmailResult(
          success: false,
          error: error,
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      _logger.e('EmailService: Network error - $e');
      return EmailResult(
        success: false,
        error: 'No internet connection',
        statusCode: 0,
      );
    } on http.ClientException catch (e) {
      _logger.e('EmailService: HTTP client error - $e');
      return EmailResult(
        success: false,
        error: 'Failed to connect to email service',
        statusCode: 0,
      );
    } on TimeoutException catch (e) {
      _logger.e('EmailService: Request timeout - $e');
      return EmailResult(
        success: false,
        error: 'Email service timeout',
        statusCode: 0,
      );
    } on FormatException catch (e) {
      _logger.e('EmailService: JSON format error - $e');
      return EmailResult(
        success: false,
        error: 'Invalid response format',
        statusCode: 0,
      );
    } catch (e) {
      _logger.e('EmailService: Unexpected error - $e');
      return EmailResult(
        success: false,
        error: 'An unexpected error occurred',
        statusCode: 0,
      );
    }
  }

  static String? _validateInputs(String name, String email, String message) {
    if (name.isEmpty) return 'Name is required';
    if (email.isEmpty) return 'Email is required';
    if (message.isEmpty) return 'Message is required';

    // Basic email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }

    // Length validations
    if (name.length > 100) return 'Name too long (max 100 characters)';
    if (email.length > 255) return 'Email too long (max 255 characters)';
    if (message.length > 10000)
      return 'Message too long (max 10000 characters)';
    if (message.length < 10) return 'Message too short (min 10 characters)';

    return null;
  }

  static Map<String, String> _buildHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "User-Agent": "AstroApp/${Environment.appVersion}",
      // Use your app's actual domain or a generic one for EmailJS
      "Origin": "https://yourapp.com", // Replace with your actual domain
      ...Environment.securityHeaders,
    };
  }

  static String _handleEmailError(int statusCode, String body) {
    switch (statusCode) {
      case 400:
        return 'Invalid request parameters';
      case 401:
        return 'Email service authentication failed';
      case 403:
        return 'Email service access denied';
      case 429:
        return 'Too many email requests. Please try again later.';
      case 500:
      case 502:
      case 503:
        return 'Email service temporarily unavailable';
      default:
        return 'Failed to send email (Error: $statusCode)';
    }
  }

  // Method to verify service configuration
  static bool isConfigured() {
    return serviceId.isNotEmpty &&
        templateId.isNotEmpty &&
        publicKey.isNotEmpty;
  }

  // Cleanup method
  static void dispose() {
    _client.close();
    _logger.d('EmailService disposed');
  }
}

// Result class for better response handling
class EmailResult {
  final bool success;
  final String? error;
  final int statusCode;
  final String? message;

  EmailResult({
    required this.success,
    this.error,
    required this.statusCode,
    this.message,
  });

  @override
  String toString() {
    return 'EmailResult(success: $success, statusCode: $statusCode, error: $error, message: $message)';
  }
}
