import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../providers/notification_provider.dart';
import '../models/notification_model.dart';
import '../main.dart';
import '../config/environment.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late io.Socket socket;
  String? userId;
  bool _listenersSet = false;
  bool _isInitialized = false;
  bool _isDisposed = false;

  factory SocketService() => _instance;

  SocketService._internal();

  /// Initialize the socket with userId and BuildContext
  void initialize(String userId, BuildContext context) {
    if (_isInitialized && this.userId == userId) {
      //AppLogger.info('🔄 SocketService already initialized for user: $userId');
      return;
    }

    _validateEnvironment();
    _isDisposed = false;
    this.userId = userId;

    if (_listenersSet) {
      _cleanupSocket();
    }

    try {
      socket = io.io(
        Environment.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableReconnection()
            .setReconnectionDelay(Environment.socketReconnectionDelay)
            .setReconnectionAttempts(Environment.socketReconnectionAttempts)
            .setTimeout(Environment.socketConnectionTimeout)
            .setQuery({'userId': userId})
            .enableAutoConnect()
            .build(),
      );

      _setupEventListeners(context);
      _setupErrorHandlers();

      socket.connect();
      _isInitialized = true;

      //AppLogger.info('✅ SocketService initialized for user: $userId');
    } catch (error) {
      //AppLogger.info('❌ Socket initialization error: $error');
      //AppLogger.info('Stack trace: $stackTrace');
      _handleInitializationError(error);
    }
  }

  void _validateEnvironment() {
    assert(Environment.socketUrl.isNotEmpty, 'Socket URL must be configured');
    assert(
      Environment.socketReconnectionDelay > 0,
      'Reconnection delay must be positive',
    );
    assert(
      Environment.socketReconnectionAttempts > 0,
      'Reconnection attempts must be positive',
    );
    assert(
      Environment.socketConnectionTimeout > 0,
      'Connection timeout must be positive',
    );
  }

  void _setupEventListeners(BuildContext context) {
    if (_listenersSet) return;
    _listenersSet = true;

    socket.onConnect((_) {
      //AppLogger.info('✅ Socket connected for user: $userId');
      _sendJoinRoom();
    });

    socket.onDisconnect((reason) {
      //AppLogger.info('❌ Socket disconnected: $reason');
      _handleDisconnection(reason);
    });

    socket.onConnectError((error) {
      //AppLogger.info('⚠️ Socket connection error: $error');
      _handleConnectionError(error);
    });

    socket.onReconnectAttempt((attempt) {
      //AppLogger.info('🔄 Reconnect attempt: $attempt');
    });

    socket.onReconnect((attempt) {
      //AppLogger.info('✅ Socket reconnected after $attempt attempts');
      _sendJoinRoom();
    });

    socket.onReconnectError((error) {
      //AppLogger.info('⚠️ Reconnect error: $error');
    });

    socket.onReconnectFailed((_) {
      //AppLogger.info('❗ Reconnect failed - maximum attempts reached');
      _handleReconnectionFailed();
    });

    socket.on('newNotification', (data) {
      _handleNewNotification(data);
    });

    // Add ping/pong for connection health monitoring
    socket.on('pong', (_) {
      //AppLogger.info('❤️  Socket heartbeat received');
    });
  }

  void _setupErrorHandlers() {
    socket.onError((error) {
      //AppLogger.info('💥 Socket error: $error');
    });
  }

  void _sendJoinRoom() {
    if (userId != null && socket.connected) {
      try {
        socket.emit('joinRoom', userId);
        //AppLogger.info('📨 Join room event sent for user: $userId');
      } catch (error) {
        //AppLogger.info('❌ Error sending joinRoom: $error');
      }
    }
  }

  void _handleNewNotification(dynamic data) {
    //AppLogger.info('📡 Socket notification received: $data');

    try {
      final context = navigatorKey.currentContext;
      if (context == null) {
        //AppLogger.info(  '⚠️ Global context is null - notification queued for later processing',);
        _queueNotification(data);
        return;
      }

      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      final notification = NotificationModel.fromJson(data);

      // Validate notification data
      if (!_isValidNotification(notification)) {
        //AppLogger.info('⚠️ Invalid notification data received');
        return;
      }

      notificationProvider.addNotification(notification);

      //AppLogger.info('✅ Notification processed successfully');
    } catch (error, stackTrace) {
      //AppLogger.info('❌ Error processing notification: $error');
      //AppLogger.info('Stack trace: $stackTrace');
      _logError('NotificationProcessing', error, stackTrace);
    }
  }

  bool _isValidNotification(NotificationModel notification) {
    return notification.message.isNotEmpty ||
        (notification.originalMessage?.isNotEmpty ?? false);
  }

  void _queueNotification(dynamic data) {
    // Implement notification queuing logic here
    // This could store notifications in local storage when context is unavailable
    // and process them when the app becomes available again
    //AppLogger.info('📦 Notification queued for later processing: $data');
  }

  void _handleDisconnection(String reason) {
    //AppLogger.info('🔌 Socket disconnected: $reason');
    // Implement reconnection logic or app state updates here
  }

  void _handleConnectionError(dynamic error) {
    //AppLogger.info('🔌 Socket connection error: $error');
    // Implement error reporting or fallback strategies
  }

  void _handleReconnectionFailed() {
    //AppLogger.info('🔌 Maximum reconnection attempts reached');
    // Implement fallback strategies or user notification
  }

  void _handleInitializationError(dynamic error) {
    //AppLogger.info('🔌 Socket initialization failed: $error');
    // Implement error reporting or alternative communication methods
  }

  void _logError(String type, dynamic error, StackTrace stackTrace) {
    // Implement your error logging service here
    // This could integrate with Sentry, Firebase Crashlytics, etc.
    //AppLogger.info('🚨 ERROR [$type]: $error');
  }

  void _cleanupSocket() {
    try {
      if (socket.connected) {
        socket.disconnect();
      }
      socket.dispose();
      _listenersSet = false;
      _isInitialized = false;
    } catch (error) {
      //AppLogger.info('⚠️ Error during socket cleanup: $error');
    }
  }

  /// Public method to check socket connection status
  bool isConnected() {
    return _isInitialized && socket.connected;
  }

  /// Public method to get current connection status
  String getConnectionStatus() {
    if (!_isInitialized) return 'Not Initialized';
    if (_isDisposed) return 'Disposed';
    return socket.connected ? 'Connected' : 'Disconnected';
  }

  /// Manual reconnection trigger
  void reconnect() {
    if (_isDisposed) {
      //AppLogger.info('⚠️ Cannot reconnect - SocketService is disposed');
      return;
    }

    if (socket.connected) {
      socket.disconnect();
    }

    socket.connect();
  }

  /// Safe disposal method
  void dispose() {
    if (_isDisposed) return;

    _isDisposed = true;
    _isInitialized = false;
    _cleanupSocket();
    //AppLogger.info('♻️ SocketService disposed successfully');
  }

  /// Send a heartbeat/ping to the server
  void sendHeartbeat() {
    if (isConnected()) {
      try {
        socket.emit('ping');
        //AppLogger.info('❤️ Heartbeat sent');
      } catch (error) {
        //AppLogger.info('❌ Error sending heartbeat: $error');
      }
    }
  }
}
