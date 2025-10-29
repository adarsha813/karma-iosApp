// utils/security_utils.dart
import 'dart:convert';

class SecurityUtils {
  static final _uuidRegex = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
    caseSensitive: false,
  );
  static final _userIdRegex = RegExp(r'^[a-zA-Z0-9_-]{1,64}$');
  static final _suspiciousPatterns = [
    RegExp(r'<script', caseSensitive: false),
    RegExp(r'javascript:', caseSensitive: false),
    RegExp(r'on\w+=', caseSensitive: false),
    RegExp(r'vbscript:', caseSensitive: false),
    RegExp(r'expression\(', caseSensitive: false),
  ];

  bool isValidUserId(String id) {
    return _userIdRegex.hasMatch(id) && id.length >= 1 && id.length <= 64;
  }

  bool isValidMessageId(String id) {
    return _uuidRegex.hasMatch(id);
  }

  bool detectInjectionAttempt(String input) {
    for (final pattern in _suspiciousPatterns) {
      if (pattern.hasMatch(input)) {
        return true;
      }
    }

    // Check for potential SQL injection
    final sqlPatterns = [
      ' OR ',
      ' AND ',
      ' UNION ',
      ' SELECT ',
      ' INSERT ',
      ' DELETE ',
      ' UPDATE ',
      ' DROP ',
    ];
    final upperInput = input.toUpperCase();
    for (final pattern in sqlPatterns) {
      if (upperInput.contains(pattern)) {
        return true;
      }
    }

    return false;
  }

  String sanitizeInput(String input) {
    // Remove control characters except newline and tab
    var sanitized = input.replaceAll(
      RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]'),
      '',
    );

    // Escape HTML characters
    sanitized = const HtmlEscape().convert(sanitized);

    return sanitized;
  }

  String maskSensitiveData(String data) {
    if (data.length <= 8) return '***';
    return '${data.substring(0, 4)}***${data.substring(data.length - 4)}';
  }

  Future<ContentValidationResult> validateContent(String content) async {
    if (content.isEmpty) {
      return ContentValidationResult(false, 'Content is empty');
    }

    if (content.length > 5000) {
      return ContentValidationResult(false, 'Content too long');
    }

    if (detectInjectionAttempt(content)) {
      return ContentValidationResult(
        false,
        'Potential security threat detected',
      );
    }

    // Check for excessive repetition (potential spam)
    if (_hasExcessiveRepetition(content)) {
      return ContentValidationResult(false, 'Excessive repetition detected');
    }

    return ContentValidationResult(true, 'Valid');
  }

  bool _hasExcessiveRepetition(String content) {
    if (content.length < 10) return false;

    // Check for repeated characters or words
    final words = content.split(' ');
    final wordCount = <String, int>{};

    for (final word in words) {
      if (word.length > 3) {
        // Only consider words longer than 3 chars
        wordCount[word] = (wordCount[word] ?? 0) + 1;
        if (wordCount[word]! > 5) {
          // More than 5 repetitions
          return true;
        }
      }
    }

    return false;
  }
}

class ContentValidationResult {
  final bool isValid;
  final String reason;

  const ContentValidationResult(this.isValid, this.reason);
}
