import 'package:logger/logger.dart';

class ProductionLogger {
  static final Logger _logger = Logger();

  static void i(String message) => _logger.i(message);
  static void e(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
  static void w(String message) => _logger.w(message);
  static void warning(String message) => _logger.w(message); // alias
}
