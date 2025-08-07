import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../providers/notification_provider.dart';
import 'notification_handler.dart';
import '../models/notification_model.dart';
import '../main.dart'; // or wherever you define navigatorKey

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  String? userId;
  bool _listenersSet = false; // <-- Add this line
  factory SocketService() => _instance;

  SocketService._internal();

  /// Initialize the socket with userId and BuildContext (for Provider access)
  void initialize(String userId, BuildContext context) {
    this.userId = userId;

    if (_listenersSet) {
      dispose(); // clean up existing socket first
    }

    socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableReconnection()
          .setReconnectionDelay(3000)
          .setQuery({'userId': userId})
          .build(),
    );

    _setupEventListeners();
    socket.connect();
  }

  void _setupEventListeners() {
    if (_listenersSet) return;
    _listenersSet = true;

    socket.onConnect((_) {
      print('✅ Socket connected for user: $userId');
      socket.emit('joinRoom', userId);
    });

    socket.on('newNotification', (data) {
      print('📡 Socket notification received: $data');

      final context = navigatorKey.currentContext;
      if (context == null) {
        print('⚠️ Global context is null');
        return;
      }

      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      final notification = NotificationModel.fromJson(data);
      print(
        '🧠 Before check: isNotificationScreenOpen = '
        '${notificationProvider.isNotificationScreenOpen}',
      );

      notificationProvider.addNotification(
        notification,
      ); // Update notification list

      if (!notificationProvider.isNotificationScreenOpen) {
        notificationProvider
            .incrementUnreadCount(); // Increment badge only if user NOT viewing
        print('📡 NotificationProvider unreadCount incremented');
      } else {
        print('🚫 Screen is open, count not incremented');
      }

      // Show system notification via your handler if needed
      NotificationHandler.showSystemNotification(data);
    });
  }

  void dispose() {
    socket.disconnect();
    socket.dispose();
    _listenersSet = false;
  }
}
