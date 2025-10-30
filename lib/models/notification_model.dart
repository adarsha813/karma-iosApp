// models/notification_model.dart
class NotificationModel {
  final String id;
  final String message;
  final String category;
  final bool read;
  final DateTime createdAt;
  final Map<String, dynamic>? translations;
  final String? originalMessage;

  NotificationModel({
    required this.id,
    required this.message,
    required this.category,
    required this.read,
    required this.createdAt,
    this.translations,
    this.originalMessage,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      category: (json['category'] ?? 'general').toString().toLowerCase(),
      read: json['read'] == true,
      createdAt:
          json['createdAt'] != null
              ? DateTime.parse(json['createdAt'].toString())
              : DateTime.now(),
      translations:
          json['translations'] is Map
              ? Map<String, dynamic>.from(json['translations'])
              : null,
      originalMessage: json['originalMessage']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'message': message,
      'category': category,
      'read': read,
      'createdAt': createdAt.toIso8601String(),
      'translations': translations,
      'originalMessage': originalMessage,
    };
  }
}
