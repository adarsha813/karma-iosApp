// models/hive_message.dart
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import 'message.dart';

part 'hive_message.g.dart';

@HiveType(typeId: 0)
class HiveMessage extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final bool isMe;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final String? adminId;

  @HiveField(5)
  final String? adminName;

  @HiveField(6)
  final String? adminImage;

  @HiveField(7)
  final DateTime? answeredAt;

  @HiveField(8)
  final DateTime? clarificatedAt;

  @HiveField(9)
  final bool isAdvice;

  @HiveField(10)
  final bool isClarification;

  @HiveField(11)
  final int? rating;

  @HiveField(12)
  final String? feedback;

  @HiveField(13)
  final String? clarificationId;

  @HiveField(14)
  final String? type;

  @HiveField(15)
  final String? title;

  @HiveField(16)
  final bool isSending;

  @HiveField(17)
  final bool hasFailed;

  @HiveField(18)
  final bool isTemporary;

  @HiveField(19) // ← ADD NEW FIELD
  final String? questionId; // ← ADD THIS

  const HiveMessage({
    required this.id,
    required this.text,
    required this.isMe,
    required this.createdAt,
    this.adminId,
    this.adminName,
    this.adminImage,
    this.answeredAt,
    this.clarificatedAt,
    this.isAdvice = false,
    this.isClarification = false,
    this.rating,
    this.feedback,
    this.clarificationId,
    this.type,
    this.title,
    this.isSending = false,
    this.hasFailed = false,
    this.isTemporary = false,
    this.questionId,
  });

  // Convert from your existing Message model
  // In hive_message.dart - FIXED fromMessage
  factory HiveMessage.fromMessage(Message message) {
    // ✅ CRITICAL FIX: Ensure we have a valid ID
    final validId = message.id ?? message.mongoId;

    if (validId == null || validId.isEmpty) {
      // Generate a fallback ID if both are null
      final fallbackId =
          'temp_${DateTime.now().millisecondsSinceEpoch}_${message.text.hashCode.abs()}';

      return HiveMessage(
        id: fallbackId,
        text: message.text,
        isMe: message.isMe,
        createdAt: message.createdAt ?? DateTime.now(),
        adminId: message.adminId,
        adminName: message.adminName,
        adminImage: message.adminImage,
        answeredAt: message.answeredAt,
        clarificatedAt: message.clarificatedAt,
        isAdvice: message.isAdvice,
        isClarification: message.isClarification,
        rating: message.rating,
        feedback: message.feedback,
        clarificationId: message.clarificationId,
        type: message.type,
        title: message.title,
        isSending: message.isSending,
        hasFailed: message.hasFailed,
        isTemporary: message.isTemporary,
        questionId: message.questionId,
      );
    }

    return HiveMessage(
      id: validId,
      text: message.text,
      isMe: message.isMe,
      createdAt: message.createdAt ?? DateTime.now(),
      adminId: message.adminId,
      adminName: message.adminName,
      adminImage: message.adminImage,
      answeredAt: message.answeredAt,
      clarificatedAt: message.clarificatedAt,
      isAdvice: message.isAdvice,
      isClarification: message.isClarification,
      rating: message.rating,
      feedback: message.feedback,
      clarificationId: message.clarificationId,
      type: message.type,
      title: message.title,
      isSending: message.isSending,
      hasFailed: message.hasFailed,
      isTemporary: message.isTemporary,
      questionId: message.questionId,
    );
  }
  // Convert back to your Message model
  Message toMessage() {
    return Message(
      id: id,
      text: text,
      isMe: isMe,
      createdAt: createdAt,
      adminId: adminId,
      adminName: adminName,
      adminImage: adminImage,
      answeredAt: answeredAt,
      clarificatedAt: clarificatedAt,
      isAdvice: isAdvice,
      isClarification: isClarification,
      rating: rating,
      feedback: feedback,
      clarificationId: clarificationId,
      type: type,
      title: title,
      isSending: isSending,
      hasFailed: hasFailed,
      isTemporary: isTemporary,
      questionId: questionId,
    );
  }

  @override
  List<Object?> get props => [
    id,
    text,
    isMe,
    createdAt,
    adminId,
    adminName,
    adminImage,
    answeredAt,
    clarificatedAt,
    isAdvice,
    isClarification,
    rating,
    feedback,
    clarificationId,
    type,
    title,
    isSending,
    hasFailed,
    isTemporary,
    questionId,
  ];
}
