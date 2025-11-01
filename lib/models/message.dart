import 'package:flutter/foundation.dart';

class Message extends ChangeNotifier {
  final String? id; // Local/client id (optional)
  final String? mongoId; // MongoDB ObjectId as String
  final String text;

  final bool isMe;
  final bool isClarification;
  final String? adminId;
  final String? adminName;
  final String? adminImage; // <-- add this

  final DateTime? createdAt;
  final DateTime? answeredAt;
  final DateTime? clarificatedAt;
  bool hasFailed;

  final bool isAdvice;
  final String? clarificationId;
  final String? type; // <-- new
  final String? title; // <-- new
  bool isSending; // Client-only state
  bool isTemporary; // Client-only state

  bool isQuestionHidden;
  bool isAnswerHidden;
  bool isClarificationHidden;
  bool isAdviceHidden;

  int? _rating;
  String? _feedback;

  Message({
    this.id,
    this.mongoId,
    required this.text,
    this.isMe = true,
    this.isClarification = false,
    this.adminId,
    this.adminName,
    this.createdAt,
    this.answeredAt,
    this.clarificatedAt,
    this.isAdvice = false,
    this.clarificationId,
    this.type, // <-- new
    this.title, // <-- new
    this.isSending = false,
    this.isTemporary = false,
    this.hasFailed = false,
    this.isQuestionHidden = false,
    this.isAnswerHidden = false,
    this.isClarificationHidden = false,
    this.isAdviceHidden = false,
    this.adminImage,
    int? rating,
    String? feedback,
  }) : _rating = rating,
       _feedback = feedback;

  int? get rating => _rating;
  String? get feedback => _feedback;

  /// Updates feedback but only triggers UI refresh if changed
  void updateRating(int newRating, String? newFeedback) {
    if (_rating != newRating || _feedback != newFeedback) {
      _rating = newRating;
      _feedback = newFeedback;
      notifyListeners();
    }
  }

  /// Hide methods are UI-specific
  void hideQuestion() {
    if (!isQuestionHidden) {
      isQuestionHidden = true;
      notifyListeners();
    }
  }

  void hideAnswer() {
    if (!isAnswerHidden) {
      isAnswerHidden = true;
      notifyListeners();
    }
  }

  void hideClarification() {
    if (!isClarificationHidden) {
      isClarificationHidden = true;
      notifyListeners();
    }
  }

  void hideAdvice() {
    if (!isAdviceHidden) {
      isAdviceHidden = true;
      notifyListeners();
    }
  }

  /// MongoDB compatible date parsing
  static DateTime? parseDate(dynamic value) {
    if (value == null) return null;

    if (value is String) return DateTime.tryParse(value);

    if (value is Map && value.containsKey("\$date")) {
      final dateValue = value["\$date"];

      // If dateValue is a string timestamp
      if (dateValue is String) {
        final millis = int.tryParse(dateValue);
        if (millis != null) return DateTime.fromMillisecondsSinceEpoch(millis);
        return DateTime.tryParse(dateValue);
      }

      // If dateValue is an int
      if (dateValue is int) {
        return DateTime.fromMillisecondsSinceEpoch(dateValue);
      }

      // If dateValue is a map with $numberLong
      if (dateValue is Map && dateValue.containsKey("\$numberLong")) {
        final numberLong = dateValue["\$numberLong"];
        int? millis;

        if (numberLong is String) {
          millis = int.tryParse(numberLong);
        } else if (numberLong is int) {
          millis = numberLong;
        }

        if (millis != null) {
          return DateTime.fromMillisecondsSinceEpoch(millis);
        }
      }
    }

    return null;
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    print('📥 Raw JSON for message: $json'); // <- make sure this prints
    String? parsedMongoId;

    final rawId = json["_id"];
    if (rawId is Map && rawId.containsKey("\$oid")) {
      parsedMongoId = rawId["\$oid"];
    } else if (rawId != null) {
      parsedMongoId = rawId.toString();
    }

    // ----- Clarification ID extraction -----
    String? clarificationId;

    // Case 1: Direct field on parent
    if (json["clarificationId"] != null) {
      clarificationId = json["clarificationId"].toString();
    }
    // Case 2: From first element in clarificationMessages array
    else if (json["clarificationMessages"] is List &&
        (json["clarificationMessages"] as List).isNotEmpty) {
      final firstClar = (json["clarificationMessages"] as List).first;
      if (firstClar["clarificationId"] != null) {
        clarificationId = firstClar["clarificationId"].toString();
      }
    }
    // Case 3: Fallback: if message itself is clarification
    else if (json["isClarification"] == true && rawId != null) {
      clarificationId = parsedMongoId;
    }
    final adminId = json["adminId"] ?? json["councillorId"];
    final adminName = json["adminName"] ?? json["councillorName"];

    debugPrint(
      '✅ Message ID: ${json["id"]} | Clarification ID: $clarificationId',
    );

    debugPrint('✅ clarificationId extracted: $clarificationId');
    // ---------------------------------------

    return Message(
      id: json["id"],
      mongoId: parsedMongoId,
      text: json["text"] ?? "",
      clarificationId: clarificationId,
      isMe: json["isMe"] ?? true,
      isClarification: json["isClarification"] ?? false,
      isAdvice: json["isAdvice"] ?? false,
      adminId: adminId,
      adminName: adminName,
      createdAt: Message.parseDate(json["createdAt"] ?? json["scheduledFor"]),
      answeredAt: Message.parseDate(json["answeredAt"]),
      clarificatedAt: Message.parseDate(json["clarificatedAt"]),
      adminImage: json['image'] ?? json['adminImage'],

      rating:
          json["rating"] is String
              ? int.tryParse(json["rating"])
              : json["rating"],
      feedback: json["feedback"],
      isQuestionHidden: json["isQuestionHidden"] ?? false,
      isAnswerHidden: json["isAnswerHidden"] ?? false,
      isClarificationHidden: json["isClarificationHidden"] ?? false,
      isAdviceHidden: json["isAdviceHidden"] ?? false,
      type: json["type"], // <-- map from backend
      title: json["title"], // <-- map from backend
      isSending: false,
      isTemporary: false,
    );
  }

  /// Client-only flags & hidden fields are excluded
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "mongoId": mongoId,
      "text": text,
      "isMe": isMe,
      "isClarification": isClarification,
      "isAdvice": isAdvice,
      "adminId": adminId,
      "adminName": adminName,
      "createdAt": createdAt?.toIso8601String(),
      "answeredAt": answeredAt?.toIso8601String(),
      "clarificatedAt": clarificatedAt?.toIso8601String(),
      "clarificationId": clarificationId,
      "rating": _rating,
      "feedback": _feedback,
      "type": type, // <-- include in JSON
      "title": title, // <-- include in JSON
    };
  }

  /// Full state-safe cloning
  Message copyWith({
    String? id,
    String? mongoId,
    String? text,
    bool? isMe,
    bool? isClarification,
    bool? isAdvice,
    String? adminId,
    String? adminName,
    DateTime? createdAt,
    DateTime? answeredAt,
    DateTime? clarificatedAt,
    String? clarificationId,
    bool? isSending,
    bool? isTemporary,
    bool? hasFailed,
    bool? isQuestionHidden,
    bool? isAnswerHidden,
    bool? isClarificationHidden,
    bool? isAdviceHidden,
    int? rating,
    String? feedback,
  }) {
    return Message(
      id: id ?? this.id,
      mongoId: mongoId ?? this.mongoId,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      hasFailed: hasFailed ?? this.hasFailed,
      isClarification: isClarification ?? this.isClarification,
      isAdvice: isAdvice ?? this.isAdvice,
      adminId: adminId ?? this.adminId,
      adminName: adminName ?? this.adminName,
      createdAt: createdAt ?? this.createdAt,
      answeredAt: answeredAt ?? this.answeredAt,
      clarificatedAt: clarificatedAt ?? this.clarificatedAt,
      clarificationId: clarificationId ?? this.clarificationId,
      isSending: isSending ?? this.isSending,
      isTemporary: isTemporary ?? this.isTemporary,
      isQuestionHidden: isQuestionHidden ?? this.isQuestionHidden,
      isAnswerHidden: isAnswerHidden ?? this.isAnswerHidden,
      isClarificationHidden:
          isClarificationHidden ?? this.isClarificationHidden,
      isAdviceHidden: isAdviceHidden ?? this.isAdviceHidden,
      rating: rating ?? _rating,
      feedback: feedback ?? _feedback,
    );
  }
}
