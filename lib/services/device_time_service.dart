import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../providers/profile_provider.dart'; // import your profile provider
import 'package:kundali/config/environment.dart';

class DeviceTimeService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  final String userId;
  final http.Client? httpClient; // For dependency injection and testing
  Timer? _timer;
  String? _lastTimeZone;
  DateTime? _lastSentTime;
  bool _isRunning = false;

  // Configuration
  static const Duration _defaultInterval = Duration(minutes: 1);
  static const Duration _timeoutDuration = Duration(seconds: 10);
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 2);

  DeviceTimeService(this.userId, {http.Client? httpClient})
    : httpClient = httpClient ?? http.Client() {
    _validateUserId();
  }

  void _validateUserId() {
    if (userId.isEmpty) {
      throw ArgumentError('User ID cannot be empty');
    }
  }

  /// Get timezone with UTC offset (e.g., UTC+05:30)
  String get _currentTimeZone {
    try {
      final now = DateTime.now();
      final offset = now.timeZoneOffset;
      final hours = offset.inHours.abs().toString().padLeft(2, '0');
      final minutes = (offset.inMinutes % 60).toString().padLeft(2, '0');
      final sign = offset.isNegative ? '-' : '+';

      return 'UTC${sign}${hours}:${minutes}';
    } catch (e) {
      _logger.e('Failed to get current timezone', error: e);
      return 'UTC+00:00'; // Fallback
    }
  }

  /// Starts the device time monitoring service
  void start({Duration interval = _defaultInterval}) {
    if (_isRunning) {
      _logger.w('DeviceTimeService is already running for user: $userId');
      return;
    }

    if (interval < Duration(seconds: 30)) {
      _logger.w('Interval too short, using minimum of 30 seconds');
      interval = Duration(seconds: 30);
    }

    _logger.i('🚀 DeviceTimeService started for user: $userId');

    _isRunning = true;
    _timer = Timer.periodic(interval, (_) => _sendDeviceTimeIfChanged());

    // Send immediately on start
    _sendDeviceTimeIfChanged();
  }

  /// Stops the device time monitoring service
  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    httpClient?.close();
    _logger.i('🛑 DeviceTimeService stopped for user: $userId');
  }

  /// Disposes the service and releases all resources
  void dispose() {
    stop();
    _lastTimeZone = null;
    _lastSentTime = null;
  }

  Future<void> _sendDeviceTimeIfChanged() async {
    if (!_isRunning) {
      _logger.w('Service is not running, skipping device time update');
      return;
    }

    try {
      final timeZone = _currentTimeZone;
      final now = DateTime.now().toUtc(); // Use UTC for consistency

      _logger.d(
        'Checking timezone changes: LastTZ=$_lastTimeZone, CurrentTZ=$timeZone',
      );

      // Check if we need to send update (timezone changed or first time)
      final bool shouldSend =
          _lastTimeZone != timeZone ||
          _lastSentTime == null ||
          _lastSentTime!.isBefore(
            DateTime.now().toUtc().subtract(Duration(hours: 1)),
          );

      if (shouldSend) {
        _logger.i('📤 Sending device time update to backend');
        await _sendDeviceTimeWithRetry(now, timeZone);
      } else {
        _logger.d('⏭️ No significant changes, skipping send');
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Unexpected error in device time update',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _sendDeviceTimeWithRetry(
    DateTime deviceTime,
    String timeZone, {
    int retryCount = 0,
  }) async {
    try {
      final response = await httpClient!
          .post(
            Uri.parse('${Environment.baseUrl}/api/device-time'),
            headers: _buildHeaders(),
            body: jsonEncode(_buildRequestBody(deviceTime, timeZone)),
          )
          .timeout(_timeoutDuration);

      _handleResponse(response, deviceTime, timeZone);
    } on TimeoutException {
      _logger.w('Request timeout while sending device time');
      await _handleRetry(deviceTime, timeZone, retryCount, 'Timeout');
    } on http.ClientException catch (e) {
      _logger.w('Client exception: $e');
      await _handleRetry(
        deviceTime,
        timeZone,
        retryCount,
        'ClientException: $e',
      );
    } catch (e) {
      _logger.e('Unexpected error sending device time', error: e);
      // Don't retry on unknown errors
    }
  }

  Map<String, String> _buildHeaders() {
    final token = ProfileProvider().token; // Singleton instance
    return {
      ...Environment.securityHeaders,
      'User-Agent': 'FlutterApp/${Environment.appVersion}',
      if (token != null)
        'Authorization': 'Bearer $token', // add token if exists
    };
  }

  Map<String, dynamic> _buildRequestBody(DateTime deviceTime, String timeZone) {
    return {
      'userId': userId,
      'deviceTime': deviceTime.toIso8601String(),
      'timeZone': timeZone,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }

  void _handleResponse(
    http.Response response,
    DateTime deviceTime,
    String timeZone,
  ) {
    _logger.d('📥 Response: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      _logger.i('✅ Device time updated successfully: $timeZone at $deviceTime');
      _lastTimeZone = timeZone;
      _lastSentTime = deviceTime;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      _logger.e('❌ Client error: ${response.statusCode} - ${response.body}');
      // Don't retry on client errors
    } else {
      _logger.e('❌ Server error: ${response.statusCode} - ${response.body}');
      throw http.ClientException(
        'Server responded with ${response.statusCode}',
      );
    }
  }

  Future<void> _handleRetry(
    DateTime deviceTime,
    String timeZone,
    int retryCount,
    String error,
  ) async {
    if (retryCount < _maxRetries) {
      _logger.w(
        'Retrying device time update ($retryCount/$_maxRetries) after $_retryDelay',
      );
      await Future.delayed(_retryDelay);
      await _sendDeviceTimeWithRetry(
        deviceTime,
        timeZone,
        retryCount: retryCount + 1,
      );
    } else {
      _logger.e(
        'Max retries reached for device time update. Last error: $error',
      );
    }
  }

  /// Manual trigger for testing or immediate updates
  Future<void> sendNow() async {
    _logger.i('Manual device time update triggered');
    await _sendDeviceTimeIfChanged();
  }

  /// Get current service status
  Map<String, dynamic> get status {
    return {
      'isRunning': _isRunning,
      'userId': userId,
      'lastTimeZone': _lastTimeZone,
      'lastSentTime': _lastSentTime?.toIso8601String(),
      'currentTimeZone': _currentTimeZone,
    };
  }
}
