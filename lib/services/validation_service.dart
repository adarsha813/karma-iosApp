import '../config/security_config.dart'; // Add this import

class ValidationService {
  static String? validateMessage(String? message) {
    if (message == null || message.isEmpty) {
      return 'Message cannot be empty';
    }

    if (message.length < SecurityConfig.minMessageLength) {
      return 'Message is too short';
    }

    if (message.length > SecurityConfig.maxMessageLength) {
      return 'Message is too long';
    }

    // Check for potentially malicious content
    if (_containsMaliciousContent(message)) {
      return 'Message contains invalid content';
    }

    return null;
  }

  static bool _containsMaliciousContent(String text) {
    final maliciousPatterns = [
      RegExp(r'<script.*?>.*?</script>', caseSensitive: false),
      RegExp(r'javascript:', caseSensitive: false),
      RegExp(r'on\w+=', caseSensitive: false), // onEvent handlers
      RegExp(r'expression\(', caseSensitive: false), // CSS expressions
    ];

    return maliciousPatterns.any((pattern) => pattern.hasMatch(text));
  }

  static String? validateUserId(String? userId) {
    if (userId == null || userId.isEmpty) {
      return 'User ID is required';
    }

    // Validate UUID format or your user ID format
    final uuidRegex = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
    );
    if (!uuidRegex.hasMatch(userId)) {
      return 'Invalid user ID format';
    }

    return null;
  }
}
