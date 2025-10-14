import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeviceTimeService {
  final String userId;
  Timer? _timer;
  String? _lastTimeZone;
  DateTime? _lastSentTime;

  DeviceTimeService(this.userId);

  /// Get timezone with UTC offset (e.g., UTC+05:30)
  String get _currentTimeZone {
    final now = DateTime.now();
    final offset = now.timeZoneOffset;
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';

    return 'UTC${sign}${hours}:${minutes}';
  }

  void start({Duration interval = const Duration(seconds: 60)}) {
    print("🚀 DeviceTimeService started for user: $userId");
    _timer = Timer.periodic(interval, (_) => _sendDeviceTimeIfChanged());
    // Send immediately on start
    _sendDeviceTimeIfChanged();
  }

  void stop() {
    _timer?.cancel();
    print("🛑 DeviceTimeService stopped");
  }

  Future<void> _sendDeviceTimeIfChanged() async {
    try {
      final timeZone = _currentTimeZone;
      final now = DateTime.now();

      print("🔍 Checking: LastTZ=$_lastTimeZone, CurrentTZ=$timeZone");

      if (_lastTimeZone != timeZone || _lastSentTime == null) {
        print("📤 Sending update to backend...");

        final response = await http
            .post(
              Uri.parse(
                'https://chat-backend-rvk9.onrender.com/api/device-time',
              ),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'userId': userId,
                'deviceTime': now.toIso8601String(),
                'timeZone': timeZone,
              }),
            )
            .timeout(Duration(seconds: 10));

        print("📥 Response: ${response.statusCode} - ${response.body}");

        if (response.statusCode == 200) {
          print("✅ Success: $timeZone at $now");
          _lastTimeZone = timeZone;
          _lastSentTime = now;
        } else {
          print("❌ Failed: ${response.body}");
        }
      } else {
        print("⏭️ No changes, skipping send");
      }
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  // Manual trigger for testing
  Future<void> sendNow() async {
    await _sendDeviceTimeIfChanged();
  }
}
