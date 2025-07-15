import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HoroscopeService {
  static final HoroscopeService _instance = HoroscopeService._internal();
  factory HoroscopeService() => _instance;
  HoroscopeService._internal();

  IO.Socket? _socket;
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  DateTime? _lastMessageTime;

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
      final now = DateTime.now();
      if (_lastMessageTime != null &&
          now.difference(_lastMessageTime!).inSeconds < 3) {
        print('🛑 Skipped duplicate horoscope notification');
        return;
      }
      _lastMessageTime = now;

      print('🔮 Received horoscope: $data');
      final title = data['title'] ?? 'New Horoscope';
      final content = data['text'] ?? '';

      await _notificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch % 100000,
        "🔮 $title",
        content,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'horoscope_channel',
            'Horoscope Notifications',
            channelDescription: 'Notifications for new daily horoscopes',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
      );
    });

    _socket!.onDisconnect((_) => print('🔌 Horoscope socket disconnected'));
    _socket!.connect();
  }

  void dispose() {
    _socket?.disconnect();
    _socket = null;
  }
}
