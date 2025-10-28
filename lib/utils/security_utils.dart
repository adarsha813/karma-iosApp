class SecurityUtils {
  // Sanitize input by removing potentially dangerous characters
  static String sanitizeInput(String input) {
    if (input.isEmpty) return input;

    // Remove potentially dangerous characters but keep basic punctuation
    final sanitized = input.replaceAll(RegExp(r'[<>{}]'), '');

    // Trim and limit length
    return sanitized.trim();
  }

  // Check for suspicious patterns (SQL injection, XSS attempts, etc.)
  static bool containsSuspiciousPatterns(String input) {
    final suspiciousPatterns = [
      RegExp(
        r'\b(select|insert|update|delete|drop|union|exec)\b',
        caseSensitive: false,
      ),
      RegExp(r'\b(alert\s*\(|prompt\s*\(|confirm\s*\()', caseSensitive: false),
      RegExp(r'<script[^>]*>.*?</script>', caseSensitive: false),
      RegExp(r'javascript:', caseSensitive: false),
      RegExp(r'on\w+\s*='), // onEvent handlers
      RegExp(r'&lt;script|&lt;iframe|&lt;object'), // HTML encoded tags
    ];

    for (final pattern in suspiciousPatterns) {
      if (pattern.hasMatch(input)) {
        return true;
      }
    }

    return false;
  }

  static bool isValidFileType(String fileName, List<String> allowedExtensions) {
    final extension = fileName.toLowerCase().split('.').last;
    return allowedExtensions.contains(extension);
  }

  static bool isPasswordStrong(String password) {
    if (password.length < 8) return false;

    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
    final hasDigits = RegExp(r'\d').hasMatch(password);
    final hasSpecialChars = RegExp(
      r'[!@#$%^&*(),.?":{}|<>]',
    ).hasMatch(password);

    return hasUpperCase && hasLowerCase && hasDigits && hasSpecialChars;
  }
}
