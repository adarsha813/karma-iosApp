class NotificationModel {
  final String id;
  final String message;
  final bool read;

  NotificationModel({
    required this.id,
    required this.message,
    this.read = false,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      read: json['read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'message': message, 'read': read};
}
