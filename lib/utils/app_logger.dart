import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void info(String message, {String? feature}) {
    _logger.i('[$feature] $message');
  }

  static void warning(String message, {String? feature}) {
    _logger.w('[$feature] $message');
  }

  static void error(String message, {String? feature}) {
    _logger.e('[$feature] $message');
  }
}
