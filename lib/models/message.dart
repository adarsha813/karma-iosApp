import 'package:flutter/foundation.dart';

class Message extends ChangeNotifier {
  final String? id;
  final String? mongoId; // <-- NEW: real MongoDB ObjectId
  final String text;
  final bool isMe;
  final bool isClarification;
  final String? adminId;
  final String? adminName;
  final DateTime? createdAt;
  final DateTime? answeredAt;
  final DateTime? clarificatedAt;
  final bool isAdvice;
  final String? clarificationId; // Add this field
  final bool isSending; // 👈 NEW FLAG
  final bool isTemporary;

  bool isQuestionHidden;
  bool isAnswerHidden;
  bool isClarificationHidden;
  bool isAdviceHidden;

  int? _rating;
  String? _feedback;

  Message({
    this.id,
    this.mongoId, // <-- Add in constructor
    this.clarificationId, // Add this in constructor
    required this.text,
    this.isMe = true,
    this.isClarification = false,
    this.adminId,
    this.adminName,
    this.createdAt,
    this.answeredAt,
    this.clarificatedAt,
    this.isAdvice = false,
    this.isQuestionHidden = false,
    this.isAnswerHidden = false,
    this.isClarificationHidden = false,
    this.isAdviceHidden = false,
    this.isSending = false,
    this.isTemporary = false, // Add this
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

  void hideQuestion() {
    isQuestionHidden = true;
    notifyListeners();
  }

  void hideAnswer() {
    isAnswerHidden = true;
    notifyListeners();
  }

  void hideClarification() {
    isClarificationHidden = true;
    notifyListeners();
  }

  void hideAdvice() {
    isAdviceHidden = true;
    notifyListeners();
  }

  Message copyWith({
    String? id,
    String? text,
    bool? isMe,
    bool? isClarification,
    bool? isAdvice,
    String? adminId,
    String? adminName,
    DateTime? createdAt,
    DateTime? answeredAt,
    DateTime? clarificatedAt,
    int? rating,
    String? feedback,
    bool? isQuestionHidden,
    bool? isAnswerHidden,
    bool? isClarificationHidden,
    bool? isAdviceHidden,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      isClarification: isClarification ?? this.isClarification,
      isAdvice: isAdvice ?? this.isAdvice,
      adminId: adminId ?? this.adminId,
      adminName: adminName ?? this.adminName,
      createdAt: createdAt ?? this.createdAt,
      answeredAt: answeredAt ?? this.answeredAt,
      clarificatedAt: clarificatedAt ?? this.clarificatedAt,
      rating: rating ?? _rating,
      feedback: feedback ?? _feedback,
      isQuestionHidden: isQuestionHidden ?? this.isQuestionHidden,
      isAnswerHidden: isAnswerHidden ?? this.isAnswerHidden,
      isClarificationHidden:
          isClarificationHidden ?? this.isClarificationHidden,
      isAdviceHidden: isAdviceHidden ?? this.isAdviceHidden,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      mongoId: json['_id'], // <-- NEW: MongoDB _id
      text: json['text'] ?? '',
      clarificationId: json['clarificationId'], // Add this
      isMe: json['isMe'] ?? true,
      isClarification: json['isClarification'] ?? false,
      isAdvice: json['isAdvice'] ?? false,
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
      isQuestionHidden: json['isQuestionHidden'] ?? false,
      isAnswerHidden: json['isAnswerHidden'] ?? false,
      isClarificationHidden: json['isClarificationHidden'] ?? false,
      isAdviceHidden: json['isAdviceHidden'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mongoId': mongoId, // <-- include Mongo _id
      'text': text,
      'isMe': isMe,
      'isClarification': isClarification,
      'isAdvice': isAdvice,
      'adminId': adminId,
      'adminName': adminName,
      'createdAt': createdAt?.toIso8601String(),
      'answeredAt': answeredAt?.toIso8601String(),
      'clarificatedAt': clarificatedAt?.toIso8601String(),
      'rating': _rating,
      'feedback': _feedback,
      'isQuestionHidden': isQuestionHidden,
      'isAnswerHidden': isAnswerHidden,
      'isClarificationHidden': isClarificationHidden,
      'isAdviceHidden': isAdviceHidden,
      'clarificationId': clarificationId, // Add this
    };
  }
}
