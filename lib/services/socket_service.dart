import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../providers/notification_provider.dart';
import 'notification_handler.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  String? userId;
  BuildContext? _context;

  factory SocketService() => _instance;

  SocketService._internal();

  /// Initialize the socket with userId and BuildContext (for Provider access)
  void initialize(String userId, BuildContext context) {
    _context = context;
    this.userId = userId;

    socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder().setTransports(['websocket']).setQuery({
        'userId': userId,
      }).build(),
    );

    _setupEventListeners();
    socket.connect();
  }

  void _setupEventListeners() {
    socket.onConnect((_) {
      print('✅ Socket connected for user: $userId');
      socket.emit('joinRoom', userId);
    });

    socket.on('newNotification', (data) {
      print('📡 Socket notification received: $data');

      if (_context != null) {
        try {
          final provider = Provider.of<NotificationProvider>(
            _context!,
            listen: false,
          );
          provider.incrementUnreadCount();
          print('📡 NotificationProvider unreadCount incremented');
        } catch (e) {
          print('⚠️ Error incrementing unreadCount: $e');
        }
      } else {
        print(
          '⚠️ SocketService context is null, cannot update NotificationProvider',
        );
      }

      // Also show system notification via your handler if needed
      NotificationHandler.showSystemNotification(data);
    });
  }

  void dispose() {
    socket.disconnect();
    socket.dispose();
  }
}
