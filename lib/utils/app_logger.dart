import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void info(String message, {String? feature}) {
    _logger.i('[${feature ?? 'General'}] $message');
  }

  static void warning(String message, {String? feature}) {
    _logger.w('[${feature ?? 'General'}] $message');
  }

  static void error(
    String message, {
    String? feature,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(
      '[${feature ?? 'General'}] $message',
      error: error,
      stackTrace: stackTrace,
    );
  }

  // ✅ New security logger
  static void security(
    String message, {
    String? feature,
    String? userId, // ✅ add this
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.wtf(
      '[SECURITY${feature != null ? ' - $feature' : ''}]${userId != null ? ' [User: $userId]' : ''} $message',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
