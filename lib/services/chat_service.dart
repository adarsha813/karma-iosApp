import 'package:flutter/material.dart';
import '../models/message.dart';
import '../services/error_reporting_service.dart';
import '../services/rate_limiting_service.dart';
import '../config/security_config.dart';

class ChatService with ChangeNotifier {
  List<Message> _messages = [];
  String? _currentUserId;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // 🔒 Security & Performance
  final RateLimitingService _rateLimiter = RateLimitingService();
  static const Duration _messageOperationCooldown = Duration(milliseconds: 100);
  static const int _maxMessages = 1000; // Prevent memory exhaustion
  bool _isProcessingBatch = false;

  String? get currentUserId => _currentUserId;

  List<Message> get messages =>
      List.unmodifiable(_messages); // 🔒 Immutable access

  void setCurrentUserId(String id) {
    if (!_validateUserId(id)) {
      _logSecurityEvent('InvalidUserIdSet', {'id': id});
      return;
    }

    _currentUserId = id;
    _notifySafely();
  }

  // 🔒 Message Operations with Security
  void addMessage(Message message) {
    if (!_canPerformMessageOperation('addMessage')) {
      _logSecurityEvent('RateLimitedAddMessage', {'messageId': message.id});
      return;
    }

    if (!_validateMessage(message)) {
      _logSecurityEvent('InvalidMessageAddAttempt', {'messageId': message.id});
      return;
    }

    if (_messages.length >= _maxMessages) {
      _evictOldMessages();
    }

    _performMessageAddition(message);
  }

  void _performMessageAddition(Message message) {
    try {
      _messages.insert(0, message); // insert at start

      listKey.currentState?.insertItem(
        0,
        duration: const Duration(milliseconds: 300),
      );

      _notifySafely();

      _logSecurityEvent('MessageAdded', {
        'messageId': message.id,
        'type':
            message.isMe
                ? 'user'
                : message.isAdvice
                ? 'advice'
                : message.isClarification
                ? 'clarification'
                : 'admin',
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (error, stackTrace) {
      _handleOperationError('addMessage', error, stackTrace, {
        'messageId': message.id,
      });
    }
  }

  void removeMessageById(String id) {
    if (!_canPerformMessageOperation('removeMessage')) {
      _logSecurityEvent('RateLimitedRemoveMessage', {'messageId': id});
      return;
    }

    if (!_validateMessageId(id)) {
      _logSecurityEvent('InvalidMessageRemoveAttempt', {'messageId': id});
      return;
    }

    _performMessageRemoval(id);
  }

  void _performMessageRemoval(String id) {
    try {
      final index = _messages.indexWhere((msg) => msg.id == id);
      if (index == -1) {
        _logSecurityEvent('MessageNotFoundForRemoval', {'messageId': id});
        return;
      }

      final removedMsg = _messages.removeAt(index);

      listKey.currentState?.removeItem(index, (context, animation) {
        return _buildRemovedMessageWidget(removedMsg, animation);
      }, duration: const Duration(milliseconds: 300));

      _notifySafely();

      _logSecurityEvent('MessageRemoved', {
        'messageId': id,
        'index': index,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (error, stackTrace) {
      _handleOperationError('removeMessage', error, stackTrace, {
        'messageId': id,
      });
    }
  }

  Widget _buildRemovedMessageWidget(
    Message removedMsg,
    Animation<double> animation,
  ) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _truncateMessageText(removedMsg.text),
          style: const TextStyle(color: Colors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // 🔒 Batch Operations
  void setMessages(List<Message> newMessages) {
    if (_isProcessingBatch) {
      _logSecurityEvent('BatchOperationInProgress', {});
      return;
    }

    if (!_validateMessagesBatch(newMessages)) {
      _logSecurityEvent('InvalidMessagesBatch', {'count': newMessages.length});
      return;
    }

    _performBatchOperation(newMessages);
  }

  void _performBatchOperation(List<Message> newMessages) {
    _isProcessingBatch = true;

    try {
      // Clear existing messages with animation
      _clearMessagesAnimated();

      // Add new messages without animation for performance
      final messagesToAdd =
          newMessages.length > _maxMessages
              ? newMessages.sublist(0, _maxMessages)
              : newMessages;

      for (var i = 0; i < messagesToAdd.length; i++) {
        _messages.add(messagesToAdd[i]);
        listKey.currentState?.insertItem(
          i,
          duration: Duration.zero, // No animation for initial load
        );
      }

      _messages = _messages.reversed.toList();
      _notifySafely();

      _logSecurityEvent('MessagesBatchSet', {
        'count': messagesToAdd.length,
        'totalMessages': _messages.length,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (error, stackTrace) {
      _handleOperationError('setMessages', error, stackTrace, {
        'batchSize': newMessages.length,
      });
    } finally {
      _isProcessingBatch = false;
    }
  }

  void _clearMessagesAnimated() {
    final int length = _messages.length;
    for (var i = length - 1; i >= 0; i--) {
      listKey.currentState?.removeItem(
        i,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: const SizedBox.shrink(), // More efficient than empty container
        ),
        duration: const Duration(milliseconds: 300),
      );
    }
    _messages.clear();
  }

  void clearMessages() {
    if (!_canPerformMessageOperation('clearMessages')) {
      _logSecurityEvent('RateLimitedClearMessages', {});
      return;
    }

    _clearMessagesAnimated();
    _notifySafely();

    _logSecurityEvent('MessagesCleared', {
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 🔒 Rating Operations
  void updateMessageRating(String messageId, int rating, String? feedback) {
    _updateRating(
      messageId: messageId,
      rating: rating,
      feedback: feedback,
      isAdvice: false,
      validator: (m) => m.id == messageId && !m.isMe,
    );
  }

  void updateAdviceRating(String adviceId, int rating, String? feedback) {
    _updateRating(
      messageId: adviceId,
      rating: rating,
      feedback: feedback,
      isAdvice: true,
      validator: (m) => m.id == adviceId && m.isAdvice,
    );
  }

  void _updateRating({
    required String messageId,
    required int rating,
    required String? feedback,
    required bool isAdvice,
    required bool Function(Message) validator,
  }) {
    if (!_canPerformMessageOperation('updateRating')) {
      _logSecurityEvent('RateLimitedRatingUpdate', {'messageId': messageId});
      return;
    }

    if (!_validateRatingInput(rating, feedback)) {
      _logSecurityEvent('InvalidRatingUpdate', {
        'messageId': messageId,
        'rating': rating,
        'feedbackLength': feedback?.length,
      });
      return;
    }

    _performRatingUpdate(messageId, rating, feedback, validator, isAdvice);
  }

  void _performRatingUpdate(
    String messageId,
    int rating,
    String? feedback,
    bool Function(Message) validator,
    bool isAdvice,
  ) {
    try {
      final index = _messages.indexWhere(validator);
      if (index == -1) {
        _logSecurityEvent('MessageNotFoundForRating', {
          'messageId': messageId,
          'isAdvice': isAdvice,
        });
        return;
      }

      final oldMsg = _messages[index];
      final updatedMsg = oldMsg.copyWith(rating: rating, feedback: feedback);

      _messages[index] = updatedMsg;
      _notifySafely();

      _logSecurityEvent('RatingUpdated', {
        'messageId': messageId,
        'rating': rating,
        'hasFeedback': feedback != null,
        'isAdvice': isAdvice,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (error, stackTrace) {
      _handleOperationError('updateRating', error, stackTrace, {
        'messageId': messageId,
        'rating': rating,
      });
    }
  }

  // 🔒 Validation Methods
  bool _validateUserId(String id) {
    return id.isNotEmpty &&
        id.length <= SecurityConfig.maxIdLength &&
        SecurityConfig.safeIdPattern.hasMatch(id);
  }

  bool _validateMessage(Message message) {
    return message.id != null &&
        message.id!.isNotEmpty &&
        message.id!.length <= SecurityConfig.maxIdLength &&
        message.text.isNotEmpty &&
        message.text.length <= SecurityConfig.maxMessageLength &&
        SecurityConfig.safeIdPattern.hasMatch(message.id!) &&
        SecurityConfig.safeTextPattern.hasMatch(message.text);
  }

  bool _validateMessageId(String id) {
    return id.isNotEmpty &&
        id.length <= SecurityConfig.maxIdLength &&
        SecurityConfig.safeIdPattern.hasMatch(id);
  }

  bool _validateMessagesBatch(List<Message> messages) {
    if (messages.length > _maxMessages) {
      _logSecurityEvent('BatchSizeExceeded', {
        'received': messages.length,
        'maxAllowed': _maxMessages,
      });
      return false;
    }

    for (final message in messages) {
      if (!_validateMessage(message)) {
        return false;
      }
    }

    return true;
  }

  bool _validateRatingInput(int rating, String? feedback) {
    final isRatingValid =
        rating >= SecurityConfig.minRatingValue &&
        rating <= SecurityConfig.maxRatingValue;

    final isFeedbackValid =
        feedback == null ||
        (feedback.isNotEmpty &&
            feedback.length <= SecurityConfig.maxFeedbackLength);

    return isRatingValid && isFeedbackValid;
  }

  // 🔒 Performance & Memory Management
  void _evictOldMessages() {
    final messagesToRemove = _messages.length - _maxMessages;
    if (messagesToRemove > 0) {
      _messages.removeRange(_maxMessages, _messages.length);
      _logSecurityEvent('MessagesEvicted', {'count': messagesToRemove});
    }
  }

  String _truncateMessageText(String text) {
    const maxDisplayLength = 100;
    if (text.length <= maxDisplayLength) return text;
    return '${text.substring(0, maxDisplayLength)}...';
  }

  // 🔒 Rate Limiting
  bool _canPerformMessageOperation(String operation) {
    return _rateLimiter.isActionAllowed(operation, _messageOperationCooldown);
  }

  // 🔒 Safe Notifications
  void _notifySafely() {
    if (!_isProcessingBatch) {
      try {
        notifyListeners();
      } catch (error, stackTrace) {
        _handleOperationError('notifyListeners', error, stackTrace, {});
      }
    }
  }

  // 🔒 Error Handling
  void _handleOperationError(
    String operation,
    dynamic error,
    StackTrace stackTrace,
    Map<String, dynamic> context,
  ) {
    _logSecurityEvent('OperationFailed', {
      'operation': operation,
      'error': error.toString(),
      ...context,
    });

    ErrorReportingService.recordError(
      error,
      stackTrace,
      extra: {
        'operation': operation,
        ...context,
        'currentUserId': _currentUserId,
        'messageCount': _messages.length,
      },
    );
  }

  // 🔒 Security Logging
  void _logSecurityEvent(String event, Map<String, dynamic> params) {
    debugPrint('🔒 ChatService Security: $event - $params');

    // In production, send to analytics/security monitoring
    // AnalyticsService.logEvent('chat_service_$event', parameters: params);
  }

  // 🔒 Diagnostic Information (for debugging)
  Map<String, dynamic> get debugInfo {
    return {
      'messageCount': _messages.length,
      'currentUserId': _currentUserId,
      'hasListKey': listKey.currentState != null,
      'isProcessingBatch': _isProcessingBatch,
      'memoryUsage': '${_messages.length}/$_maxMessages',
    };
  }

  // 🔒 Dispose pattern for cleanup
  void disposeService() {
    _messages.clear();
    _currentUserId = null;
    super.dispose();
  }
}
