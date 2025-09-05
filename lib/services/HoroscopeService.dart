import 'package:socket_io_client/socket_io_client.dart' as IO;

class HoroscopeService {
  static final HoroscopeService _instance = HoroscopeService._internal();
  factory HoroscopeService() => _instance;
  HoroscopeService._internal();

  IO.Socket? _socket;

  DateTime? _lastMessageTime;

  // ✅ Add this
  bool notificationsEnabled = true;

  void initSocket(String userId) {
    if (_socket != null) return;

    _socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': userId})
          .disableAutoConnect()
          .build(),
    );

    _socket!.onConnect((_) {
      print('✅ Horoscope socket connected with userId: $userId');
    });

    _socket!.on('new_horoscope', (data) async {
      if (!notificationsEnabled) {
        print('🚫 Notifications disabled, skipping.');
        return; // ✅ Skip showing notifications
      }

      final now = DateTime.now();
      if (_lastMessageTime != null &&
          now.difference(_lastMessageTime!).inSeconds < 3) {
        print('🛑 Skipped duplicate horoscope notification');
        return;
      }
      _lastMessageTime = now;
    });

    _socket!.onDisconnect((_) => print('🔌 Horoscope socket disconnected'));
    _socket!.connect();
  }

  void dispose() {
    _socket?.disconnect();
    _socket = null;
  }

  // ✅ Optional helper to update setting dynamically
  void setNotificationsEnabled(bool enabled) {
    notificationsEnabled = enabled;
    print('🔔 HoroscopeService notificationsEnabled: $enabled');
  }
}
