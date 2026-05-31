import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void d(String message, {String? feature}) {
    _logger.d('[${feature ?? 'General'}] $message');
  }

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

  static void security(
    String message, {
    String? feature,
    String? userId,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.f(
      '[SECURITY${feature != null ? ' - $feature' : ''}]${userId != null ? ' [User: $userId]' : ''} $message',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
