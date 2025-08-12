import 'package:flutter/material.dart';
import '../models/message.dart';

class ChatService with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  void setMessages(List<Message> newMessages) {
    _messages = List.from(newMessages);
    notifyListeners();
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
