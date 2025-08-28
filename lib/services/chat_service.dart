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
    _messages.add(message); // add at end
    listKey.currentState?.insertItem(
      _messages.length - 1,
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
    // Clear current messages without animation
    _messages.clear();
    notifyListeners();

    // Add historical messages one by one without animation
    for (var i = 0; i < newMessages.length; i++) {
      _messages.add(newMessages[i]);
      listKey.currentState?.insertItem(
        i,
        duration: const Duration(
          milliseconds: 0,
        ), // no animation for old messages
      );
    }
  }

  void clearMessages() {
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
