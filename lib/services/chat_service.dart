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
    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      final oldMsg = _messages[index];
      if (oldMsg.rating == rating && oldMsg.feedback == feedback) return;
      print('✅ Updated message: ${_messages[index]}');
      print('📊 Current messages:');
      _messages[index].updateRating(rating, feedback);

      notifyListeners();
    }
  }
}
