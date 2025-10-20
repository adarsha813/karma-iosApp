import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class ErrorReportingService {
  static final Logger _logger = Logger();

  static Future<void> init() async {
    // Initialize your error reporting service (Sentry, Crashlytics, etc.)
    if (kDebugMode) {
      _logger.i('Error reporting service initialized in debug mode');
    } else {
      // Production error reporting setup
      // await Sentry.init((options) => options.dsn = 'YOUR_SENTRY_DSN');
      _logger.i('Error reporting service initialized in production mode');
    }
  }

  static void recordError(
    dynamic error,
    StackTrace? stackTrace, {
    String? context,
  }) {
    _logger.e('Error: $error', error: error, stackTrace: stackTrace);

    // Report to your error reporting service
    if (!kDebugMode) {
      // await Sentry.captureException(error, stackTrace: stackTrace);
    }

    // You can also add custom context
    if (context != null) {
      _logger.w('Error context: $context');
    }
  }

  static void recordFlutterError(FlutterErrorDetails details) {
    _logger.e(
      'Flutter error: ${details.exception}',
      error: details.exception,
      stackTrace: details.stack,
    );

    if (!kDebugMode) {
      // await Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  }

  static void logMessage(String message, {LogLevel level = LogLevel.info}) {
    switch (level) {
      case LogLevel.debug:
        _logger.d(message);
        break;
      case LogLevel.info:
        _logger.i(message);
        break;
      case LogLevel.warning:
        _logger.w(message);
        break;
      case LogLevel.error:
        _logger.e(message);
        break;
      case LogLevel.fatal:
        _logger.f(message);
        break;
    }
  }
}

enum LogLevel { debug, info, warning, error, fatal }
