// socket_service.dart
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'notification_handler.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  String? userId;

  factory SocketService() => _instance;

  SocketService._internal();

  void initialize(String userId) {
    this.userId = userId;
    socket = IO.io('https://chat-backend-rvk9.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'query': {'userId': userId},
    });

    _setupEventListeners();
    socket.connect();
  }

  void _setupEventListeners() {
    socket.onConnect((_) {
      print('Global Socket connected');
      socket.emit('joinRoom', userId);
    });

    socket.on('newNotification', (data) {
      print('Global socket received: $data');
      // This will trigger notifications globally
      NotificationHandler.showSystemNotification(data);
    });
  }

  void dispose() {
    socket.disconnect();
    socket.dispose();
  }
}
