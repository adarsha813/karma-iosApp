import 'package:flutter/material.dart';
import '../models/message.dart';

class ChatService with ChangeNotifier {
  List<Message> _messages = [];
  String? _currentUserId;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  String? get currentUserId => _currentUserId;

  void setCurrentUserId(String id) {
    _currentUserId = id;
    notifyListeners();
  }

  List<Message> get messages => _messages;
  void addMessage(Message message) {
    _messages.insert(0, message); // insert at start
    listKey.currentState?.insertItem(
      0, // always 0 because reverse: true
      duration: const Duration(milliseconds: 300),
    );
    notifyListeners();
  }

  void removeMessageById(String id) {
    final index = _messages.indexWhere((msg) => msg.id == id);
    if (index != -1) {
      final removedMsg = _messages.removeAt(index);
      listKey.currentState?.removeItem(index, (context, animation) {
        // Replace this with a simple animated container
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
              removedMsg.text, // Use the text from the Message
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 300));
      notifyListeners();
    }
  }

  void setMessages(List<Message> newMessages) {
    // First clear existing messages with animation
    clearMessages();

    // Add new messages without animation
    for (var i = 0; i < newMessages.length; i++) {
      _messages.add(newMessages[i]);
      listKey.currentState?.insertItem(
        i,
        duration: Duration.zero, // No animation for initial load
      );
    }
    _messages = messages.reversed.toList();
    notifyListeners();
  }

  void clearMessages() {
    final int length = _messages.length;
    for (var i = length - 1; i >= 0; i--) {
      listKey.currentState?.removeItem(
        i,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(), // Empty container during removal
        ),
        duration: const Duration(milliseconds: 300),
      );
    }
    _messages.clear();
    notifyListeners();
  }

  void updateMessageRating(String messageId, int rating, String? feedback) {
    final index = _messages.indexWhere((m) => m.id == messageId && !m.isMe);
    if (index == -1) return;

    final oldMsg = _messages[index];
    final updatedMsg = oldMsg.copyWith(rating: rating, feedback: feedback);

    _messages[index] = updatedMsg;
    notifyListeners();
  }

  void updateAdviceRating(String adviceId, int rating, String? feedback) {
    final index = _messages.indexWhere((m) => m.id == adviceId && m.isAdvice);
    if (index == -1) return;

    final oldMsg = _messages[index];
    final updatedMsg = oldMsg.copyWith(rating: rating, feedback: feedback);

    _messages[index] = updatedMsg;
    notifyListeners();
  }
}
