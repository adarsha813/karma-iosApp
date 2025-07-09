import 'package:flutter/foundation.dart';

class Message extends ChangeNotifier {
  final String? id;
  final String text;
  final bool isMe;
  final bool isClarification;
  final String? adminId;
  final String? adminName;
  final DateTime? createdAt;
  final DateTime? answeredAt;
  final DateTime? clarificatedAt;

  int? _rating;
  String? _feedback;

  Message({
    this.id,
    required this.text,
    this.isMe = true,
    this.isClarification = false,
    this.adminId,
    this.adminName,
    this.createdAt,
    this.answeredAt,
    this.clarificatedAt,
    int? rating,
    String? feedback,
  }) : _rating = rating,
       _feedback = feedback;

  int? get rating => _rating;
  String? get feedback => _feedback;

  void updateRating(int newRating, String? newFeedback) {
    if (_rating != newRating || _feedback != newFeedback) {
      _rating = newRating;
      _feedback = newFeedback;
      notifyListeners();
    }
  }

  Message copyWith({
    String? id,
    String? text,
    bool? isMe,
    bool? isClarification,
    String? adminId,
    String? adminName,
    DateTime? createdAt,
    DateTime? answeredAt,
    DateTime? clarificatedAt,
    int? rating,
    String? feedback,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      isClarification: isClarification ?? this.isClarification,
      adminId: adminId ?? this.adminId,
      adminName: adminName ?? this.adminName,
      createdAt: createdAt ?? this.createdAt,
      answeredAt: answeredAt ?? this.answeredAt,
      clarificatedAt: clarificatedAt ?? this.clarificatedAt,
      rating: rating ?? _rating,
      feedback: feedback ?? _feedback,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'] ?? '',
      isMe: json['isMe'] ?? true,
      isClarification: json['isClarification'] ?? false,
      adminId: json['adminId'],
      adminName: json['adminName'],
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
      answeredAt:
          json['answeredAt'] != null
              ? DateTime.tryParse(json['answeredAt'])
              : null,
      clarificatedAt:
          json['clarificatedAt'] != null
              ? DateTime.tryParse(json['clarificatedAt'])
              : null,
      rating: json['rating'],
      feedback: json['feedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isMe': isMe,
      'isClarification': isClarification,
      'adminId': adminId,
      'adminName': adminName,
      'createdAt': createdAt?.toIso8601String(),
      'answeredAt': answeredAt?.toIso8601String(),
      'clarificatedAt': clarificatedAt?.toIso8601String(),
      'rating': _rating,
      'feedback': _feedback,
    };
  }

  @override
  bool operator ==(Object other) {
    return other is Message &&
        other.id == id &&
        other.text == text &&
        other.isMe == isMe &&
        other.isClarification == isClarification &&
        other.adminId == adminId &&
        other.adminName == adminName &&
        other.createdAt == createdAt &&
        other.answeredAt == answeredAt &&
        other.clarificatedAt == clarificatedAt &&
        other.rating == _rating &&
        other.feedback == _feedback;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        isMe.hashCode ^
        isClarification.hashCode ^
        adminId.hashCode ^
        adminName.hashCode ^
        createdAt.hashCode ^
        answeredAt.hashCode ^
        clarificatedAt.hashCode ^
        _rating.hashCode ^
        _feedback.hashCode;
  }

  @override
  String toString() {
    return 'Message{id: $id, text: $text, rating: $_rating, feedback: $_feedback}';
  }
}
