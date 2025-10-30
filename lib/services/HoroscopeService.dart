// services/horoscope_service.dart
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:logger/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import '../config/environment.dart';

/// Production-level horoscope service with enterprise-grade features
class HoroscopeService {
  // Singleton pattern
  static final HoroscopeService _instance = HoroscopeService._internal();
  factory HoroscopeService() => _instance;
  HoroscopeService._internal() {
    _initializeService();
  }

  // Logger with production configuration
  final Logger _logger = Logger(
    level: Environment.isProduction ? Level.warning : Level.debug,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  // Dependencies
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  // Socket and state management
  IO.Socket? _socket;
  String? _currentUserId;

  // Connection state
  bool _isConnected = false;
  bool _isConnecting = false;
  bool _isInitialized = false;

  // Configuration
  static const Duration _reconnectDelay = Duration(seconds: 3);
  static const Duration _duplicateThreshold = Duration(seconds: 3);
  static const Duration _connectionTimeout = Duration(seconds: 30);
  static const int _maxReconnectAttempts = 5;
  int _reconnectAttempts = 0;
  Timer? _connectionTimeoutTimer;

  // Event listeners
  final List<Function(Map<String, dynamic>)> _horoscopeListeners = [];
  final List<Function(HoroscopeConnectionState)> _connectionListeners = [];
  final List<Function(HoroscopeError)> _errorListeners = [];

  // Public interface
  bool notificationsEnabled = true;
  DateTime? _lastMessageTime;

  /// Initialize service (called once in constructor)
  void _initializeService() {
    _setupConnectivityMonitoring();
    _logger.i('🚀 HoroscopeService initialized');
  }

  /// Set up connectivity monitoring
  void _setupConnectivityMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        _handleConnectivityChange(result);
      },
      onError: (error, stackTrace) {
        _logger.e(
          'Connectivity monitoring error',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  /// Handle connectivity changes
  void _handleConnectivityChange(ConnectivityResult result) {
    _logger.d('📡 Connectivity changed: $result');

    if (result == ConnectivityResult.none) {
      _updateConnectionState(HoroscopeConnectionState.disconnected);
      _logger.w('🌐 No internet connection');
    } else if (!_isConnected && _currentUserId != null) {
      _logger.i('🌐 Internet connection restored - attempting reconnect');
      _scheduleReconnect();
    }
  }

  /// Initialize socket connection with comprehensive error handling
  Future<void> initSocket(String userId) async {
    if (_isConnecting) {
      _logger.w('🔄 Socket connection already in progress');
      return;
    }

    try {
      _isConnecting = true;
      _currentUserId = userId;
      _updateConnectionState(HoroscopeConnectionState.connecting);

      await _validateConnectionPrerequisites(userId);
      await _cleanupExistingConnection();
      await _createAndConnectSocket(userId);

      _isInitialized = true;
      _logger.i('✅ HoroscopeService socket initialized for user: $userId');
    } catch (e, stackTrace) {
      await _handleInitializationError(e, stackTrace);
      rethrow;
    } finally {
      _isConnecting = false;
    }
  }

  /// Validate prerequisites for socket connection
  Future<void> _validateConnectionPrerequisites(String userId) async {
    // Validate user ID
    if (userId.isEmpty) {
      throw HoroscopeError(
        'User ID cannot be empty',
        HoroscopeErrorType.validation,
        Severity.high,
      );
    }

    // Check connectivity
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw HoroscopeError(
        'No internet connection available',
        HoroscopeErrorType.network,
        Severity.medium,
      );
    }

    _logger.d('✅ Connection prerequisites validated');
  }

  /// Clean up any existing connection
  Future<void> _cleanupExistingConnection() async {
    if (_socket != null) {
      _logger.d('🧹 Cleaning up existing socket connection');
      _socket!.disconnect();
      _socket!.destroy();
      _socket = null;
    }
    _isConnected = false;
    _reconnectAttempts = 0;
    _connectionTimeoutTimer?.cancel();
  }

  /// Create and connect new socket
  Future<void> _createAndConnectSocket(String userId) async {
    _logger.d('🔌 Creating new socket connection');

    _socket = IO.io(
      Environment.socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({
            'userId': userId,
            'clientType': 'flutter',
            'version': Environment.appVersion,
            'platform': 'mobile',
          })
          .disableAutoConnect()
          .setTimeout(_connectionTimeout.inMilliseconds)
          .enableReconnection()
          .setReconnectionAttempts(_maxReconnectAttempts)
          .setReconnectionDelay(_reconnectDelay.inMilliseconds)
          .setReconnectionDelayMax(10000)
          .build(),
    );

    _setupSocketEventHandlers();
    _startConnectionTimer();
    _socket!.connect();
  }

  /// Set up comprehensive socket event handlers
  void _setupSocketEventHandlers() {
    // Connection events
    _socket!.onConnect((_) => _handleSocketConnect());
    _socket!.onDisconnect((_) => _handleSocketDisconnect());
    _socket!.onConnectError(_handleSocketConnectError);
    _socket!.onError(_handleSocketError);
    _socket!.onReconnect(_handleSocketReconnect);
    _socket!.onReconnectAttempt(
      (dynamic attempt) => _handleSocketReconnectAttempt(attempt),
    );
    _socket!.onReconnectError(_handleSocketReconnectError);
    _socket!.onReconnectFailed(_handleSocketReconnectFailed);

    // Application events
    _socket!.on('new_horoscope', _handleNewHoroscope);
    _socket!.on('horoscope_error', _handleHoroscopeError);
    _socket!.on('connection_ack', _handleConnectionAck);
    _socket!.on('ping', _handlePing);
  }

  /// Start connection timeout timer
  void _startConnectionTimer() {
    _connectionTimeoutTimer?.cancel();
    _connectionTimeoutTimer = Timer(_connectionTimeout, () {
      if (!_isConnected) {
        _logger.e('⏰ Socket connection timeout');
        _handleConnectionTimeout();
      }
    });
  }

  /// Handle successful socket connection
  void _handleSocketConnect() {
    _connectionTimeoutTimer?.cancel();
    _isConnected = true;
    _isConnecting = false;
    _reconnectAttempts = 0;

    _logger.i('✅ Socket connected successfully');
    _updateConnectionState(HoroscopeConnectionState.connected);

    // Log analytics event
    _logAnalyticsEvent('socket_connected', {
      'user_id': _currentUserId,
      'reconnect_attempts': _reconnectAttempts,
    });
  }

  /// Handle socket disconnection
  void _handleSocketDisconnect() {
    _isConnected = false;
    _logger.w('🔌 Socket disconnected');
    _updateConnectionState(HoroscopeConnectionState.disconnected);

    _logAnalyticsEvent('socket_disconnected', {'user_id': _currentUserId});
  }

  /// Handle socket connection error
  void _handleSocketConnectError(dynamic data) {
    _connectionTimeoutTimer?.cancel();
    _isConnecting = false;

    _logger.e('❌ Socket connection error: $data');
    _updateConnectionState(HoroscopeConnectionState.error);

    final error = HoroscopeError(
      'Socket connection failed: $data',
      HoroscopeErrorType.connection,
      Severity.high,
    );
    _notifyErrorListeners(error);

    _logAnalyticsEvent('socket_connection_error', {
      'user_id': _currentUserId,
      'error': data.toString(),
    });
  }

  /// Handle socket general error
  void _handleSocketError(dynamic data) {
    _logger.e('❌ Socket error: $data');

    final error = HoroscopeError(
      'Socket error: $data',
      HoroscopeErrorType.socket,
      Severity.medium,
    );
    _notifyErrorListeners(error);
  }

  /// Handle socket reconnection
  void _handleSocketReconnect(dynamic data) {
    _isConnected = true;
    _logger.i('🔄 Socket reconnected successfully');
    _updateConnectionState(HoroscopeConnectionState.connected);

    _logAnalyticsEvent('socket_reconnected', {
      'user_id': _currentUserId,
      'reconnect_attempts': _reconnectAttempts,
    });
  }

  /// Handle socket reconnection attempt
  void _handleSocketReconnectAttempt(int attempt) {
    _reconnectAttempts = attempt;
    _logger.i('🔄 Socket reconnection attempt $attempt/$_maxReconnectAttempts');
    _updateConnectionState(HoroscopeConnectionState.reconnecting);
  }

  /// Handle socket reconnection error
  void _handleSocketReconnectError(dynamic error) {
    _logger.e('❌ Socket reconnection error: $error');

    final horoscopeError = HoroscopeError(
      'Socket reconnection failed: $error',
      HoroscopeErrorType.reconnection,
      Severity.medium,
    );
    _notifyErrorListeners(horoscopeError);
  }

  /// Handle socket reconnection failure
  void _handleSocketReconnectFailed(dynamic _) {
    _logger.e(
      '💥 Socket reconnection failed after $_maxReconnectAttempts attempts',
    );
    _updateConnectionState(HoroscopeConnectionState.error);

    final error = HoroscopeError(
      'Maximum reconnection attempts exceeded',
      HoroscopeErrorType.reconnection,
      Severity.high,
    );
    _notifyErrorListeners(error);
  }

  /// Handle connection timeout
  void _handleConnectionTimeout() {
    _isConnecting = false;
    _logger.e('⏰ Socket connection timeout exceeded');
    _updateConnectionState(HoroscopeConnectionState.error);

    final error = HoroscopeError(
      'Connection timeout',
      HoroscopeErrorType.timeout,
      Severity.high,
    );
    _notifyErrorListeners(error);
  }

  /// Handle connection acknowledgement
  void _handleConnectionAck(dynamic data) {
    _logger.d('📨 Connection acknowledged: $data');
  }

  /// Handle ping from server
  void _handlePing(dynamic data) {
    _logger.d('🏓 Ping received from server');
    // Optionally send pong back
    _socket?.emit('pong', {'timestamp': DateTime.now().millisecondsSinceEpoch});
  }

  /// Handle new horoscope data with validation and duplicate prevention
  void _handleNewHoroscope(dynamic data) {
    try {
      // Check if notifications are enabled
      if (!notificationsEnabled) {
        _logger.d('🚫 Notifications disabled, skipping horoscope');
        return;
      }

      // Duplicate prevention with timestamp check
      final now = DateTime.now();
      if (_lastMessageTime != null &&
          now.difference(_lastMessageTime!) < _duplicateThreshold) {
        _logger.w('🛑 Skipped duplicate horoscope (rate limit)');
        return;
      }
      _lastMessageTime = now;

      // Validate data format
      if (data is! Map<String, dynamic>) {
        throw HoroscopeError(
          'Invalid horoscope data format: expected Map',
          HoroscopeErrorType.format,
          Severity.medium,
        );
      }

      final horoscopeData = Map<String, dynamic>.from(data);

      // Validate required fields
      _validateHoroscopeData(horoscopeData);

      _logger.i('📨 Received new horoscope: ${horoscopeData['_id']}');

      // Notify all listeners
      _notifyHoroscopeListeners(horoscopeData);

      // Log analytics
      _logAnalyticsEvent('horoscope_received', {
        'horoscope_id': horoscopeData['_id'],
        'has_title': horoscopeData['title'] != null,
        'timestamp': now.toIso8601String(),
      });
    } catch (e, stackTrace) {
      _logger.e('Error processing horoscope', error: e, stackTrace: stackTrace);

      if (e is! HoroscopeError) {
        final error = HoroscopeError(
          'Failed to process horoscope: $e',
          HoroscopeErrorType.processing,
          Severity.medium,
        );
        _notifyErrorListeners(error);
      }
    }
  }

  /// Validate horoscope data structure
  void _validateHoroscopeData(Map<String, dynamic> data) {
    if (data['_id'] == null) {
      throw HoroscopeError(
        'Horoscope missing required field: _id',
        HoroscopeErrorType.validation,
        Severity.medium,
      );
    }

    if (data['text'] == null && data['horoscopeTranslated'] == null) {
      throw HoroscopeError(
        'Horoscope missing content fields',
        HoroscopeErrorType.validation,
        Severity.low,
      );
    }
  }

  /// Handle horoscope-specific errors from server
  void _handleHoroscopeError(dynamic data) {
    _logger.e('🚨 Server horoscope error: $data');

    final error = HoroscopeError(
      'Server error: $data',
      HoroscopeErrorType.server,
      Severity.medium,
    );
    _notifyErrorListeners(error);

    _logAnalyticsEvent('horoscope_server_error', {
      'error_data': data.toString(),
    });
  }

  /// Handle initialization errors
  Future<void> _handleInitializationError(
    dynamic error,
    StackTrace stackTrace,
  ) async {
    _isConnecting = false;
    _updateConnectionState(HoroscopeConnectionState.error);

    _logger.e(
      '💥 Socket initialization failed',
      error: error,
      stackTrace: stackTrace,
    );

    if (error is HoroscopeError) {
      _notifyErrorListeners(error);
    } else {
      final horoscopeError = HoroscopeError(
        'Initialization failed: $error',
        HoroscopeErrorType.initialization,
        Severity.high,
      );
      _notifyErrorListeners(horoscopeError);
    }

    _logAnalyticsEvent('socket_initialization_failed', {
      'error': error.toString(),
      'user_id': _currentUserId,
    });
  }

  // Public API Methods

  /// Add horoscope data listener
  void addHoroscopeListener(Function(Map<String, dynamic>) listener) {
    if (!_horoscopeListeners.contains(listener)) {
      _horoscopeListeners.add(listener);
      _logger.d(
        '➕ Added horoscope listener, total: ${_horoscopeListeners.length}',
      );
    }
  }

  /// Remove horoscope data listener
  void removeHoroscopeListener(Function(Map<String, dynamic>) listener) {
    _horoscopeListeners.remove(listener);
    _logger.d(
      '➖ Removed horoscope listener, total: ${_horoscopeListeners.length}',
    );
  }

  /// Add connection state listener
  void addConnectionListener(Function(HoroscopeConnectionState) listener) {
    if (!_connectionListeners.contains(listener)) {
      _connectionListeners.add(listener);
      _logger.d(
        '➕ Added connection listener, total: ${_connectionListeners.length}',
      );
    }
  }

  /// Remove connection state listener
  void removeConnectionListener(Function(HoroscopeConnectionState) listener) {
    _connectionListeners.remove(listener);
    _logger.d(
      '➖ Removed connection listener, total: ${_connectionListeners.length}',
    );
  }

  /// Add error listener
  void addErrorListener(Function(HoroscopeError) listener) {
    if (!_errorListeners.contains(listener)) {
      _errorListeners.add(listener);
      _logger.d('➕ Added error listener, total: ${_errorListeners.length}');
    }
  }

  /// Remove error listener
  void removeErrorListener(Function(HoroscopeError) listener) {
    _errorListeners.remove(listener);
    _logger.d('➖ Removed error listener, total: ${_errorListeners.length}');
  }

  /// Notify all horoscope listeners safely
  void _notifyHoroscopeListeners(Map<String, dynamic> horoscopeData) {
    for (final listener in List.from(_horoscopeListeners)) {
      try {
        listener(horoscopeData);
      } catch (e, stackTrace) {
        _logger.e(
          'Error in horoscope listener',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }
  }

  /// Update connection state and notify listeners
  void _updateConnectionState(HoroscopeConnectionState state) {
    for (final listener in List.from(_connectionListeners)) {
      try {
        listener(state);
      } catch (e, stackTrace) {
        _logger.e(
          'Error in connection listener',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }
  }

  /// Notify error listeners
  void _notifyErrorListeners(HoroscopeError error) {
    for (final listener in List.from(_errorListeners)) {
      try {
        listener(error);
      } catch (e, stackTrace) {
        _logger.e('Error in error listener', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Get current connection state
  HoroscopeConnectionState get connectionState {
    if (_isConnected) return HoroscopeConnectionState.connected;
    if (_isConnecting) return HoroscopeConnectionState.connecting;
    return HoroscopeConnectionState.disconnected;
  }

  /// Check if socket is connected
  bool get isConnected => _isConnected;

  /// Check if service is initialized
  bool get isInitialized => _isInitialized;

  /// Get current user ID
  String? get currentUserId => _currentUserId;

  /// Manually reconnect socket
  Future<void> reconnect() async {
    if (_currentUserId != null && !_isConnected && !_isConnecting) {
      _logger.i('🔄 Manual reconnection triggered');
      await initSocket(_currentUserId!);
    }
  }

  /// Schedule reconnection with backoff
  void _scheduleReconnect() {
    if (!_isConnecting && _currentUserId != null) {
      Future.delayed(_reconnectDelay, () => reconnect());
    }
  }

  /// Update notifications setting
  void setNotificationsEnabled(bool enabled) {
    notificationsEnabled = enabled;
    _logger.i('🔔 Horoscope notifications ${enabled ? 'enabled' : 'disabled'}');

    _logAnalyticsEvent('notifications_toggled', {'enabled': enabled});
  }

  /// Send custom event to server (if needed)
  void sendEvent(String eventName, [dynamic data]) {
    if (_isConnected) {
      _socket?.emit(eventName, data);
      _logger.d('📤 Sent event: $eventName');
    } else {
      _logger.w('⚠️ Cannot send event - socket not connected');
    }
  }

  /// Log analytics events
  void _logAnalyticsEvent(String event, [Map<String, dynamic>? params]) {
    if (Environment.isProduction) {
      _logger.d('📊 Analytics: $event - ${params ?? {}}');
      // Integrate with your analytics service
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  /// Clean up all resources
  void dispose() {
    _logger.i('🧹 Disposing HoroscopeService');

    // Clear listeners
    _horoscopeListeners.clear();
    _connectionListeners.clear();
    _errorListeners.clear();

    // Cancel connectivity subscription
    _connectivitySubscription?.cancel();

    // Cancel timeout timer
    _connectionTimeoutTimer?.cancel();

    // Disconnect and destroy socket
    if (_socket != null) {
      _socket!.disconnect();
      _socket!.destroy();
      _socket = null;
    }

    // Reset state
    _isConnected = false;
    _isConnecting = false;
    _isInitialized = false;
    _currentUserId = null;
    _reconnectAttempts = 0;

    _logger.i('✅ HoroscopeService disposed');
  }
}

/// Connection state enum
enum HoroscopeConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
}

/// Horoscope error with severity levels
class HoroscopeError implements Exception {
  final String message;
  final HoroscopeErrorType type;
  final Severity severity;
  final DateTime timestamp;

  HoroscopeError(this.message, this.type, this.severity)
    : timestamp = DateTime.now();

  @override
  String toString() => 'HoroscopeError[$type|$severity]: $message';
}

/// Error type enum
enum HoroscopeErrorType {
  network,
  validation,
  connection,
  socket,
  reconnection,
  timeout,
  format,
  processing,
  server,
  initialization,
  unknown,
}

/// Error severity levels
enum Severity {
  low, // Non-critical issues
  medium, // Important but recoverable
  high, // Critical issues affecting functionality
}
