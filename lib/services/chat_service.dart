import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/message.dart';
import 'package:web_socket_channel/io.dart';

class SecureChatService with ChangeNotifier {
  final List<Message> _messages = [];
  String? _currentUserId;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // WebSocket
  IOWebSocketChannel? _channel; // ✅ use IOWebSocketChannel
  StreamSubscription? _channelSub;
  bool _connected = false;

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

  String? get currentUserId => _currentUserId;
  List<Message> get messages => List.unmodifiable(_messages);
  bool get isConnected => _connected;

  SecureChatService(this._authToken);

  // Update token dynamically
  void updateToken(String newToken) {
    _authToken = newToken;
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

    // Validate URL
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

      // New
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

      debugPrint('WebSocket connected securely');
      notifyListeners();
    } catch (e) {
      _handleError('Connection failed: $e');
      _scheduleReconnect();
    }
  }

  /// Validate WebSocket URL
  bool _isValidWebSocketUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return (uri.scheme == 'wss' || uri.scheme == 'ws') && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Secure message sending with validation
  void sendMessage(Message message) {
    // Validate message before sending
    if (!_isValidMessage(message)) {
      _handleError('Invalid message format');
      return;
    }

    // Add temporary message
    final tempMessage = Message(
      id: message.id,
      mongoId: null,
      text: _sanitizeText(message.text),
      isMe: true,
      isSending: true,
      createdAt: DateTime.now(), // ✅ correct
    );

    addMessage(tempMessage);

    // Send to backend via WebSocket
    if (_connected && _channel != null) {
      try {
        final payload = _createSecurePayload(tempMessage);
        _channel!.sink.add(jsonEncode(payload));
      } catch (e) {
        _handleError('Failed to send message: $e');
        // Mark message as failed
        _updateMessageStatus(tempMessage.id!, false);
      }
    } else {
      _handleError('Not connected to server');
      _updateMessageStatus(tempMessage.id!, false);
    }
  }

  /// Validate message before sending
  bool _isValidMessage(Message message) {
    if (message.text.isEmpty || message.text.length > _maxMessageLength) {
      return false;
    }

    // Check for potentially dangerous content
    if (_containsMaliciousContent(message.text)) {
      return false;
    }

    return message.id != null && message.id!.isNotEmpty;
  }

  /// Sanitize message text
  String _sanitizeText(String text) {
    // Remove excessive whitespace
    var sanitized = text.trim().replaceAll(RegExp(r'\s+'), ' ');

    // Basic XSS prevention (expand based on your needs)
    sanitized = sanitized
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;');

    return sanitized;
  }

  /// Check for potentially malicious content
  bool _containsMaliciousContent(String text) {
    final maliciousPatterns = [
      RegExp(r'<script.*?>', caseSensitive: false),
      RegExp(r'javascript:', caseSensitive: false),
      RegExp(r'on\w+\s*=', caseSensitive: false),
      // Add more patterns based on your security requirements
    ];

    return maliciousPatterns.any((pattern) => pattern.hasMatch(text));
  }

  /// Create secure payload with additional metadata
  Map<String, dynamic> _createSecurePayload(Message message) {
    return {
      ...message.toJson(),
      'client_timestamp': DateTime.now().toIso8601String(),
      'auth_token': _authToken, // Consider if this is needed
      'user_id': _currentUserId,
    };
  }

  /// Secure message handling with validation
  void _handleIncomingData(dynamic data) {
    try {
      // Validate data type and size
      if (data is! String || data.length > _maxMessageLength * 2) {
        throw FormatException('Invalid message data');
      }

      final Map<String, dynamic> payload = jsonDecode(data);

      // Validate payload structure
      if (!_isValidPayload(payload)) {
        throw FormatException('Invalid message payload');
      }

      _handleIncomingMessage(payload);
    } catch (e) {
      debugPrint('Security: Invalid message received - $e');
      // Consider disconnecting malicious clients after multiple failures
      _handleSecurityViolation('Invalid message format');
    }
  }

  /// Validate incoming payload structure
  bool _isValidPayload(Map<String, dynamic> payload) {
    // Required fields
    if (payload['text'] == null || payload['text'] is! String) {
      return false;
    }

    // Validate text content
    final text = payload['text'] as String;
    if (text.isEmpty || text.length > _maxMessageLength) {
      return false;
    }

    // Check for malicious content
    if (_containsMaliciousContent(text)) {
      return false;
    }

    return true;
  }

  /// Handle security violations
  void _handleSecurityViolation(String reason) {
    debugPrint('Security violation: $reason');
    // Implement security measures like:
    // - Temporary blocking
    // - Reporting to backend
    // - Forced reconnection
  }

  /// Handle incoming message with security checks
  void _handleIncomingMessage(Map<String, dynamic> json) {
    try {
      final incomingMsg = Message.fromJson(json);

      // Additional server-side validation
      if (!_isValidMessage(incomingMsg)) {
        throw FormatException('Invalid message from server');
      }

      // If we have a temporary message with same client id, replace it
      if (incomingMsg.id != null) {
        final tempIndex = _messages.indexWhere(
          (m) => m.id == incomingMsg.id && m.isSending,
        );
        if (tempIndex != -1) {
          _messages[tempIndex] = incomingMsg;
          notifyListeners();
          return;
        }
      }

      // Otherwise, add normally
      addMessage(incomingMsg);
    } catch (e) {
      debugPrint('Failed to process incoming message: $e');
    }
  }

  void refreshToken(String newToken) {
    _authToken = newToken;
    if (_connected) {
      disconnectWebSocket();
      if (_lastUrl != null && _currentUserId != null) {
        connectWebSocket(_lastUrl!, _currentUserId!);
      }
    }
  }

  /// Enhanced message addition with limits
  void addMessage(Message message) {
    _messages.insert(0, message);

    // Enforce message limit for memory management
    if (_messages.length > _maxMessages) {
      // You might want to persist old messages or notify about removal
      debugPrint('Message limit reached, removed oldest message');
    }

    listKey.currentState?.insertItem(0, duration: _animationDuration);
    notifyListeners();
  }

  /// Auto-reconnect implementation
  void _scheduleReconnect() {
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      debugPrint('Max reconnection attempts reached');
      return;
    }

    _reconnectTimer = Timer(_reconnectDelay, () {
      if (!_connected && _lastUrl != null && _currentUserId != null) {
        _reconnectAttempts++;
        debugPrint(
          'Attempting to reconnect... ($_reconnectAttempts/$_maxReconnectAttempts)',
        );
        connectWebSocket(_lastUrl!, _currentUserId!);
      }
    });
  }

  /// Enhanced error handling
  void _handleWebSocketError(dynamic error) {
    debugPrint('WebSocket error: $error');
    _connected = false;
    _scheduleReconnect();
    notifyListeners();
  }

  void _handleWebSocketDone() {
    debugPrint('WebSocket disconnected');
    _connected = false;
    _scheduleReconnect();
    notifyListeners();
  }

  void _handleError(String message) {
    debugPrint('ChatService Error: $message');
    // You could add error state management here
  }

  /// Update message status (success/failure)
  void _updateMessageStatus(String messageId, bool success) {
    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      final oldMsg = _messages[index];
      _messages[index] = oldMsg.copyWith(isSending: false, hasFailed: !success);
      notifyListeners();
    }
  }

  /// Secure cleanup
  @override
  void dispose() {
    _channelSub?.cancel();
    _channel?.sink.close();
    _reconnectTimer?.cancel();
    super.dispose();
  }

  // ... rest of your existing methods (removeMessageById, setMessages, etc.)
  // Keep all your existing methods but they'll now benefit from the security foundation

  /// Remove message by client or mongo ID
  void removeMessageById(String id) {
    final index = _messages.indexWhere((m) => m.id == id || m.mongoId == id);
    if (index == -1) return;

    final removedMsg = _messages.removeAt(index);

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
            removedMsg.text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
    notifyListeners();
  }

  /// Replace current messages with a new list
  void setMessages(List<Message> newMessages) {
    clearMessages(immediate: true);

    final reversedMessages = newMessages.reversed.toList();
    for (var i = 0; i < reversedMessages.length; i++) {
      _messages.add(reversedMessages[i]);
      listKey.currentState?.insertItem(i, duration: Duration.zero);
    }

    notifyListeners();
  }

  /// Clear all messages
  void clearMessages({bool immediate = false}) {
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

  /// Update rating & feedback for user messages
  void updateMessageRating(String messageId, int rating, String? feedback) {
    final index = _messages.indexWhere(
      (m) => (m.id == messageId || m.mongoId == messageId) && !m.isMe,
    );
    if (index == -1) return;

    final oldMsg = _messages[index];
    _messages[index] = oldMsg.copyWith(rating: rating, feedback: feedback);
    notifyListeners();
  }

  /// Update rating & feedback for advice messages
  void updateAdviceRating(String adviceId, int rating, String? feedback) {
    final index = _messages.indexWhere(
      (m) => (m.id == adviceId || m.mongoId == adviceId) && m.isAdvice,
    );
    if (index == -1) return;

    final oldMsg = _messages[index];
    _messages[index] = oldMsg.copyWith(rating: rating, feedback: feedback);
    notifyListeners();
  }

  /// Enhanced disconnect with cleanup
  void disconnectWebSocket() {
    _reconnectTimer?.cancel();
    _channelSub?.cancel();
    _channel?.sink.close();
    _connected = false;
    _reconnectAttempts = 0;
    notifyListeners();
  }

  /// Rate limiting helper (implement based on your needs)
}
