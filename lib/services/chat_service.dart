import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/message.dart';
import 'package:web_socket_channel/io.dart';
import '../config/environment.dart';
import 'package:kundali/services/http_service.dart';
import '../services/message_cache_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/app_logger.dart';

class SecureChatService with ChangeNotifier {
  final List<Message> _messages = [];
  String? _currentUserId;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final Connectivity _connectivity = Connectivity();
  bool _isOnline = true;
  // WebSocket
  IOWebSocketChannel? _channel;
  StreamSubscription? _channelSub;
  bool _connected = false;
  bool get isOnline => _isOnline;

  // Security & Production fields
  String _authToken;
  Timer? _reconnectTimer;
  String? _lastUrl;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const int _maxMessages = 1000;
  static const int _maxMessageLength = 5000;
  static const Duration _reconnectDelay = Duration(seconds: 3);
  static const Duration _animationDuration = Duration(milliseconds: 300);

  // Cache service
  final MessageCacheService _cacheService = MessageCacheService();
  bool _isOffline = false;
  bool _isSyncing = false;

  // Callbacks for UI
  Function(bool isOffline)? onOfflineStatusChanged;
  Function(int pendingCount)? onPendingMessagesChanged;

  String? get currentUserId => _currentUserId;
  List<Message> get messages => List.unmodifiable(_messages);
  bool get isConnected => _connected;
  bool get isOffline => _isOffline;

  SecureChatService(this._authToken) {
    _initConnectivityMonitoring();
  }
  void _initConnectivityMonitoring() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final wasOnline = _isOnline;
      _isOnline = result != ConnectivityResult.none;

      if (!wasOnline && _isOnline) {
        _handleComingOnline();
      }

      if (_isOnline != wasOnline) {
        onOfflineStatusChanged?.call(!_isOnline);
      }
    });

    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _isOnline = results != ConnectivityResult.none;
    onOfflineStatusChanged?.call(!_isOnline);
  }

  Future<void> _handleComingOnline() async {
    // Sync pending messages first
    await syncPendingMessages();

    // Notify listeners to refresh UI with server data
    notifyListeners();
  }

  // Add method to force refresh from server
  Future<void> refreshFromServer(String userId) async {
    if (!_isOnline) {
      return;
    }

    try {
      final httpService = HttpService();
      final response = await httpService
          .get(
            '${Environment.baseUrl}/messages/user/$userId',
            requiresAuth: true,
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Message> serverMessages = [];

        for (var item in data) {
          serverMessages.add(Message.fromJson(item));
        }

        // Update messages with server data
        setMessages(serverMessages, forceClearCache: true);
      }
    } catch (e) {
      AppLogger.error('❌ Failed to refresh from server: $e');
    }
  }

  // Initialize with cache
  // In SecureChatService class
  Future<void> initializeWithCache() async {
    await _cacheService.init();

    // Load cached messages first (instant display)
    if (await _cacheService.hasCachedMessages()) {
      final cachedMessages =
          await _cacheService.loadMessages(); // This now returns oldest first
      _messages.clear(); // Clear any existing
      _messages.addAll(cachedMessages);
      notifyListeners();

      // Scroll to bottom after loading (show most recent)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // You'll need to expose a way to scroll to bottom
        // Or handle this in your ChatScreen
      });
    }

    // Check for pending messages
    final pendingCount = (await _cacheService.getPendingMessages()).length;
    if (pendingCount > 0) {
      _isOffline = true;
      onOfflineStatusChanged?.call(true);
      onPendingMessagesChanged?.call(pendingCount);
    }
  }

  // Update token dynamically
  void updateToken(String newToken) {
    _authToken = newToken;
    if (_connected) {
      _reconnectWithNewToken();
    }
  }

  void updateMessagesWithDiff(List<Message> oldList, List<Message> newList) {
    final stopwatch = Stopwatch()..start();

    final oldMap = {for (var m in oldList) m.id: m};
    final newMap = {for (var m in newList) m.id: m};

    // 1. Remove messages that are no longer present
    final toRemove =
        oldMap.keys.where((id) => !newMap.containsKey(id)).toList();
    for (var id in toRemove) {
      final index = _messages.indexWhere((m) => m.id == id);
      if (index != -1) {
        _messages.removeAt(index);
      }
    }

    // 2. Add new messages and update existing ones
    for (var newMsg in newList) {
      final existingIndex = _messages.indexWhere((m) => m.id == newMsg.id);
      if (existingIndex != -1) {
        _messages[existingIndex] = newMsg;
      } else {
        _messages.add(newMsg);
      }
    }

    // 3. Resort by date (oldest first)
    _messages.sort(
      (a, b) => _getMessageDateTime(a).compareTo(_getMessageDateTime(b)),
    );

    // 4. Notify listeners
    notifyListeners();

    stopwatch.stop();
  }

  DateTime _getMessageDateTime(Message m) =>
      m.createdAt ?? m.answeredAt ?? m.clarificatedAt ?? DateTime(0);

  Future<void> replaceCache(List<Message> messages) async {
    await _cacheService.clearCache();
    await _cacheService.saveMessages(messages);
  }

  /// Reconnect with new token
  Future<void> _reconnectWithNewToken() async {
    if (_lastUrl != null && _currentUserId != null) {
      disconnectWebSocket();
      await Future.delayed(const Duration(milliseconds: 500));
      connectWebSocket(_lastUrl!, _currentUserId!);
    }
  }

  /// Set current user id
  void setCurrentUserId(String id) {
    if (_currentUserId != id) {
      _currentUserId = id;
      notifyListeners();
    }
  }

  /// Secure WebSocket connection with authentication
  void connectWebSocket(String url, String userId) {
    _lastUrl = url;

    if (!_isValidWebSocketUrl(url)) {
      _handleError('Invalid WebSocket URL');
      return;
    }

    try {
      final headers = {
        'Authorization': 'Bearer $_authToken',
        'X-User-Id': userId,
        'X-Client-Version': '1.0.0',
      };

      _channel = IOWebSocketChannel.connect(
        Uri.parse(url),
        protocols: ['chat-v1'],
        headers: headers,
      );

      _connected = true;
      _reconnectAttempts = 0;

      if (_reconnectTimer != null) {
        _reconnectTimer!.cancel();
        _reconnectTimer = null;
      }

      _channelSub = _channel!.stream.listen(
        _handleIncomingData,
        onError: _handleWebSocketError,
        onDone: _handleWebSocketDone,
        cancelOnError: true,
      );

      notifyListeners();
    } catch (e) {
      _handleError('Connection failed: $e');
      _scheduleReconnect();
    }
  }

  bool _isValidWebSocketUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return (uri.scheme == 'wss' || uri.scheme == 'ws') && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Secure message sending with cache integration
  Future<void> sendMessage(Message message) async {
    if (!_isValidMessage(message)) {
      _handleError('Invalid message format');
      return;
    }

    final tempMessage = Message(
      id: message.id,
      text: _sanitizeText(message.text),
      isMe: true,
      isSending: true,
      createdAt: DateTime.now(),
    );

    addMessage(tempMessage);
    await _cacheService.saveMessage(tempMessage);

    final isOnline = await _checkConnectivity();

    if (!isOnline) {
      await _cacheService.storePendingMessage(tempMessage);
      _isOffline = true;
      onOfflineStatusChanged?.call(true);

      // Update message status to show it's pending
      final index = _messages.indexWhere((m) => m.id == tempMessage.id);
      if (index != -1) {
        _messages[index] = tempMessage.copyWith(
          hasFailed: true,
          isSending: false,
        );
        notifyListeners();
      }
      return;
    }

    try {
      if (_connected && _channel != null) {
        final payload = _createSecurePayload(tempMessage);
        _channel!.sink.add(jsonEncode(payload));
        await _sendViaHttpBackup(tempMessage);
        await _cacheService.removePendingMessage(tempMessage.id!);
      } else {
        throw Exception('Not connected');
      }
    } catch (e) {
      await _cacheService.storePendingMessage(tempMessage);
      _isOffline = true;
      onOfflineStatusChanged?.call(true);

      final index = _messages.indexWhere((m) => m.id == tempMessage.id);
      if (index != -1) {
        _messages[index] = tempMessage.copyWith(
          hasFailed: true,
          isSending: false,
        );
        notifyListeners();
      }
    }
  }

  /// Sync pending messages when back online
  Future<void> syncPendingMessages() async {
    if (_isSyncing) return;

    final pendingMessages = await _cacheService.getPendingMessages();
    if (pendingMessages.isEmpty) {
      if (_isOffline) {
        _isOffline = false;
        onOfflineStatusChanged?.call(false);
      }
      return;
    }

    final isOnline = await _checkConnectivity();
    if (!isOnline) return;

    _isSyncing = true;

    int syncedCount = 0;
    AppLogger.info('Synced messages: $syncedCount', feature: 'SYNC');
    for (final pending in pendingMessages) {
      try {
        final message = Message(
          id: pending['id'],
          text: pending['text'],
          isMe: true,
          createdAt: DateTime.parse(pending['timestamp']),
        );

        if (_connected && _channel != null) {
          final payload = _createSecurePayload(message);
          _channel!.sink.add(jsonEncode(payload));
          await _cacheService.removePendingMessage(message.id!);

          // Update UI to show success
          final index = _messages.indexWhere((m) => m.id == message.id);
          if (index != -1) {
            _messages[index] = _messages[index].copyWith(hasFailed: false);
            notifyListeners();
          }
          syncedCount++;
        }
      } catch (e) {
        AppLogger.error('Failed to sync message: $e');
      }
    }

    _isSyncing = false;

    final remaining = await _cacheService.getPendingMessages();
    if (remaining.isEmpty) {
      _isOffline = false;
      onOfflineStatusChanged?.call(false);
    }
  }

  /// Connectivity check
  Future<bool> _checkConnectivity() async {
    try {
      final httpService = HttpService();
      final response = await httpService
          .get('${Environment.baseUrl}/health', requiresAuth: false)
          .timeout(const Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  /*
  Future<bool> _ensureValidToken() async {
    if (_authToken.isEmpty) return false;
    try {
      final parts = _authToken.split('.');
      if (parts.length == 3) {
        final payload = jsonDecode(
          utf8.decode(base64.decode(base64.normalize(parts[1]))),
        );
        final exp = payload['exp'] as int?;
        if (exp != null) {
          final expiryTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
          if (DateTime.now().isAfter(expiryTime)) {
            return false;
          }
        }
      }
    } catch (e) {
      // Token validation error
    }
    return true;
  }
  */

  Future<void> _sendViaHttpBackup(Message message) async {
    try {
      final httpService = HttpService();
      await httpService.post(
        '${Environment.baseUrl}/messages/send',
        body: message.toJson(),
        requiresAuth: true,
      );
    } catch (e) {
      // Backup failed - ignore
    }
  }

  bool _isValidMessage(Message message) {
    if (message.text.isEmpty || message.text.length > _maxMessageLength) {
      return false;
    }
    if (_containsMaliciousContent(message.text)) {
      return false;
    }
    return message.id != null && message.id!.isNotEmpty;
  }

  String _sanitizeText(String text) {
    var sanitized = text.trim().replaceAll(RegExp(r'\s+'), ' ');
    sanitized = sanitized
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;');
    return sanitized;
  }

  bool _containsMaliciousContent(String text) {
    final maliciousPatterns = [
      RegExp(r'<script.*?>', caseSensitive: false),
      RegExp(r'javascript:', caseSensitive: false),
      RegExp(r'on\w+\s*=', caseSensitive: false),
    ];
    return maliciousPatterns.any((pattern) => pattern.hasMatch(text));
  }

  Map<String, dynamic> _createSecurePayload(Message message) {
    return {
      ...message.toJson(),
      'client_timestamp': DateTime.now().toIso8601String(),
      'auth_token': _authToken,
      'user_id': _currentUserId,
    };
  }

  void _handleIncomingData(dynamic data) {
    try {
      if (data is! String || data.length > _maxMessageLength * 2) {
        throw FormatException('Invalid message data');
      }
      final Map<String, dynamic> payload = jsonDecode(data);
      if (!_isValidPayload(payload)) {
        throw FormatException('Invalid message payload');
      }
      _handleIncomingMessage(payload);
    } catch (e) {
      _handleSecurityViolation('Invalid message format');
    }
  }

  bool _isValidPayload(Map<String, dynamic> payload) {
    if (payload['text'] == null || payload['text'] is! String) {
      return false;
    }
    final text = payload['text'] as String;
    if (text.isEmpty || text.length > _maxMessageLength) {
      return false;
    }
    if (_containsMaliciousContent(text)) {
      return false;
    }
    return true;
  }

  void _handleSecurityViolation(String reason) {
    // Log security violation
  }

  void _handleIncomingMessage(Map<String, dynamic> json) {
    try {
      final incomingMsg = Message.fromJson(json);

      if (!_isValidMessage(incomingMsg)) {
        throw FormatException('Invalid message from server');
      }

      // Save to cache
      _cacheService.saveMessage(incomingMsg);

      // Remove from pending if exists
      if (incomingMsg.id != null) {
        _cacheService.removePendingMessage(incomingMsg.id!);
      }

      // Replace temporary message if exists
      if (incomingMsg.id != null) {
        final tempIndex = _messages.indexWhere(
          (m) => m.id == incomingMsg.id && m.isSending,
        );
        if (tempIndex != -1) {
          _messages[tempIndex] = incomingMsg;
          _cacheService.updateMessage(incomingMsg);
          notifyListeners();
          return;
        }
      }

      addMessage(incomingMsg);
    } catch (e) {
      AppLogger.error('Failed to process incoming message: $e');
    }
  }

  void refreshToken(String newToken) {
    _authToken = newToken;
    if (_connected) {
      _reconnectWithNewToken();
    }
  }

  // Add this method to SecureChatService class
  Future<void> saveMessageToCache(Message message) async {
    await _cacheService.saveMessage(message);
  }

  // In SecureChatService - ensure messages are added in correct order
  // In SecureChatService - Update addMessage
  void addMessage(Message message) {
    // Add to local list
    _messages.add(message);

    // ✅ CRITICAL: Save to cache immediately
    _cacheService.saveMessage(message);

    // Enforce message limit
    if (_messages.length > _maxMessages) {
      final removed = _messages.removeAt(0);
      if (removed.id != null) {
        _cacheService.removeMessage(removed.id!);
      } else {
        // Use safeId or just skip – but this should not happen for real messages
        _cacheService.removeMessage(removed.safeId);
      }
    }
    // Insert at the end of the animated list
    listKey.currentState?.insertItem(
      _messages.length - 1,
      duration: _animationDuration,
    );
    notifyListeners();
  }

  void _scheduleReconnect() {
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      return;
    }
    _reconnectTimer = Timer(_reconnectDelay, () {
      if (!_connected && _lastUrl != null && _currentUserId != null) {
        _reconnectAttempts++;
        connectWebSocket(_lastUrl!, _currentUserId!);
      }
    });
  }

  void _handleWebSocketError(dynamic error) {
    _connected = false;
    _scheduleReconnect();
    notifyListeners();
  }

  void _handleWebSocketDone() {
    _connected = false;
    _scheduleReconnect();
    notifyListeners();
  }

  void _handleError(String message) {
    // Handle error
  }
  /*
  void _updateMessageStatus(
    String messageId,
    bool success, {
    bool isOffline = false,
  }) {
    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      final oldMsg = _messages[index];
      _messages[index] = oldMsg.copyWith(isSending: false, hasFailed: !success);
      notifyListeners();
    }
  }
*/
  void removeMessageById(String id) {
    final index = _messages.indexWhere((m) => m.id == id || m.mongoId == id);
    if (index == -1) return;

    _messages.removeAt(index);

    // Also remove from cache
    _cacheService.removeMessage(id);

    try {
      listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _messages.isNotEmpty && index < _messages.length
                  ? _messages[index].text
                  : '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 300),
      );
    } catch (e) {
      // Animation error - ignore
    }
    notifyListeners();
  }

  // In your SecureChatService, modify setMessages to not clear if not needed:

  void setMessages(List<Message> newMessages, {bool forceClearCache = true}) {
    // ✅ FIX: Don't clear if newMessages is empty
    if (newMessages.isEmpty) {
      return; // ← ADD THIS EARLY RETURN
    }

    clearMessages(immediate: true);

    // Only save to cache if we have messages AND forceClearCache is true
    if (forceClearCache && newMessages.isNotEmpty) {
      _cacheService.saveMessages(newMessages);
    }

    final reversedMessages = newMessages.reversed.toList();
    for (var i = 0; i < reversedMessages.length; i++) {
      _messages.add(reversedMessages[i]);
      listKey.currentState?.insertItem(i, duration: Duration.zero);
    }
    notifyListeners();
  }

  // Add this method to your SecureChatService class
  Future<bool> hasCachedMessages() async {
    return await _cacheService.hasCachedMessages();
  }

  void clearMessages({bool immediate = false, bool clearCache = true}) {
    if (clearCache) {
      _cacheService.clearCache();
      _cacheService.clearPendingMessages();
    }

    final length = _messages.length;
    for (var i = length - 1; i >= 0; i--) {
      listKey.currentState?.removeItem(
        i,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: immediate ? const SizedBox.shrink() : Container(),
        ),
        duration: immediate ? Duration.zero : const Duration(milliseconds: 300),
      );
    }
    _messages.clear();
    notifyListeners();
  }

  void updateMessageRating(String messageId, int rating, String? feedback) {
    final index = _messages.indexWhere(
      (m) => (m.id == messageId || m.mongoId == messageId) && !m.isMe,
    );
    if (index == -1) return;

    final oldMsg = _messages[index];
    final updatedMsg = oldMsg.copyWith(rating: rating, feedback: feedback);
    _messages[index] = updatedMsg;

    // Update in cache
    _cacheService.updateMessage(updatedMsg);

    notifyListeners();
    _syncRatingToBackend(messageId, rating, feedback);
  }

  void updateAdviceRating(String adviceId, int rating, String? feedback) {
    final index = _messages.indexWhere(
      (m) => (m.id == adviceId || m.mongoId == adviceId) && m.isAdvice,
    );
    if (index == -1) return;

    final oldMsg = _messages[index];
    final updatedMsg = oldMsg.copyWith(rating: rating, feedback: feedback);
    _messages[index] = updatedMsg;

    // Update in cache
    _cacheService.updateMessage(updatedMsg);

    notifyListeners();
    _syncRatingToBackend(adviceId, rating, feedback);
  }

  Future<void> _syncRatingToBackend(
    String id,
    int rating,
    String? feedback,
  ) async {
    try {
      final httpService = HttpService();
      await httpService.post(
        '${Environment.baseUrl}/messages/rate',
        body: {'messageId': id, 'rating': rating, 'feedback': feedback},
        requiresAuth: true,
      );
    } catch (e) {
      // Failed to sync - will retry later
    }
  }

  void disconnectWebSocket() {
    _reconnectTimer?.cancel();
    _channelSub?.cancel();
    _channel?.sink.close();
    _connected = false;
    _reconnectAttempts = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    _channelSub?.cancel();
    _channel?.sink.close();
    _reconnectTimer?.cancel();
    _cacheService.dispose();
    super.dispose();
  }
}
