// utils/logger.dart
import 'dart:developer' as developer;

class Logger {
  final String name;
  static const int _maxLogLength = 2000;

  const Logger(this.name);

  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _log('INFO', message, error, stackTrace);
  }

  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log('WARNING', message, error, stackTrace);
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log('ERROR', message, error, stackTrace);
  }

  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    assert(() {
      _log('DEBUG', message, error, stackTrace);
      return true;
    }());
  }

  void _log(
    String level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final truncatedMessage =
        message.length > _maxLogLength
            ? '${message.substring(0, _maxLogLength)}...'
            : message;

    developer.log(
      '$level: $truncatedMessage',
      name: name,
      error: error,
      stackTrace: stackTrace,
      level: _getLogLevelValue(level),
    );
  }

  int _getLogLevelValue(String level) {
    switch (level) {
      case 'ERROR':
        return 1000;
      case 'WARNING':
        return 900;
      case 'INFO':
        return 800;
      case 'DEBUG':
        return 700;
      default:
        return 800;
    }
  }
}
