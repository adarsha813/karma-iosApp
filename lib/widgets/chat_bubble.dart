import 'package:flutter/material.dart';
import '../models/message.dart';
import 'rating_bubble.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../services/chat_service.dart'; // adjust path if needed
import 'dart:convert';
import 'package:kundali/providers/profile_provider.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;
  final Future<void> Function(String, int, String?)? onRateAdvice; // ✅ Added

  const ChatBubble({
    super.key,
    required this.message,
    this.onRateAnswer,
    this.onRateAdvice,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

void _showHideOptions(BuildContext context, Message message) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: Wrap(
          children: [
            if (message.isMe) // Question bubble
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Delete Question"),
                onTap: () {
                  _hideItem(
                    context,
                    '/questions/${message.id}/hide-question',
                    message.id,
                  );
                },
              ),

            if (!message.isMe &&
                !message.isAdvice &&
                !message.isClarification) // Answer bubble
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Delete Answer"),
                onTap: () {
                  _hideItem(
                    context,
                    '/questions/${message.id}/hide-answer',
                    message.id,
                  );
                },
              ),

            if (message.isAdvice) // Advice bubble
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Delete Advice"),
                onTap: () {
                  _hideItem(context, '/advices/${message.id}/hide', message.id);
                },
              ),

            if (message.isClarification) // Clarification bubble
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Hide Clarification"),
                onTap: () {
                  _hideItem(
                    context,
                    '/questions/${message.id}/clarification/${message.clarificationId}/hide',
                    message.id,
                  );
                },
              ),
          ],
        ),
      );
    },
  );
}

Future<void> _hideItem(
  BuildContext context,
  String endpoint,
  String? messageId,
) async {
  if (messageId == null || messageId.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Message ID not found.")));
    return;
  }

  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  final userId = profileProvider.userId;

  if (userId == null || userId.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
    return;
  }

  final baseUrl = 'https://your-api-url.com'; // change to your actual API URL
  final url = Uri.parse('$baseUrl$endpoint');

  try {
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${profileProvider.token}', // if you have auth
      },
      body: jsonEncode({'userId': userId, 'hide': true}),
    );

    if (response.statusCode == 200) {
      Provider.of<ChatService>(
        context,
        listen: false,
      ).removeMessageById(messageId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message hidden successfully.")),
      );
      Navigator.pop(context); // close bottom sheet
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to hide message: ${response.body}")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  void didUpdateWidget(covariant ChatBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.rating != widget.message.rating ||
        oldWidget.message.feedback != widget.message.feedback) {
      debugPrint("🔄 ChatBubble updated: ${widget.message.id}");
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    debugPrint(
      "💬 ChatBubble: id=${message.id}, rating=${message.rating}, feedback=${message.feedback}",
    );

    // 🟣 Setup custom bubble color and label for advice
    Color bubbleColor =
        message.isMe
            ? Colors.blueAccent
            : message.isClarification
            ? Colors.orangeAccent
            : message.isAdvice
            ? Colors.purple.shade100
            : Colors.grey[300]!;

    IconData? icon;
    String? label;

    if (message.isAdvice) {
      icon = Icons.tips_and_updates;
      label = "Advice";
    }

    return Align(
      alignment:
          message.isAdvice
              ? Alignment.center
              : message.isMe
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () => _showHideOptions(context, message),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius:
                message.isAdvice
                    ? BorderRadius.circular(20)
                    : BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft:
                          message.isMe
                              ? const Radius.circular(16)
                              : const Radius.circular(0),
                      bottomRight:
                          message.isMe
                              ? const Radius.circular(0)
                              : const Radius.circular(16),
                    ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1 * 255).round()),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                message.isAdvice
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,

            children: [
              // Show label and icon if message is advice
              if (label != null && icon != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Row(
                    children: [
                      Icon(icon, size: 16, color: Colors.deepPurple),
                      const SizedBox(width: 4),
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),

              // Main message content (HTML supported)
              Html(
                data: message.text,
                style: {
                  "body": Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    color: message.isMe ? Colors.white : Colors.black,
                    fontSize: FontSize(16),
                  ),
                  "p": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                  "ul": Style(
                    margin: Margins.only(left: 16),
                    padding: HtmlPaddings.zero,
                    color: message.isMe ? Colors.white : Colors.black,
                  ),
                  "li": Style(margin: Margins.symmetric(vertical: 4)),
                },
              ),

              // Admin name
              if (message.adminName != null || message.adminId != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Admin: ${message.adminName} (${message.adminId})',
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),

              // Created time
              if (message.createdAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Asked at: ${_formatDateTime(message.createdAt!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),

              // Answered time
              if (message.answeredAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Answered at: ${_formatDateTime(message.answeredAt!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),

              // Clarified time
              if (message.clarificatedAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Clarified at: ${_formatDateTime(message.clarificatedAt!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: message.isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),

              // Rating bubble
              if ((!widget.message.isMe &&
                      widget.onRateAnswer != null &&
                      widget.message.answeredAt != null) ||
                  widget.message.isAdvice)
                Consumer<Message>(
                  builder: (_, msg, __) {
                    return RatingBubble(
                      key: ValueKey(
                        'rating_${msg.id}_${msg.rating}_${msg.feedback}',
                      ),
                      questionId: msg.id ?? '',
                      initialRating: msg.rating,
                      initialFeedback: msg.feedback,
                      isAdvice: msg.isAdvice, // ✅ Added this
                      onRatingSubmitted: (id, rating, feedback) async {
                        msg.updateRating(rating, feedback); // Local update
                        if (widget.message.isAdvice) {
                          await widget.onRateAdvice!(id, rating, feedback);
                        } else {
                          await widget.onRateAnswer!(id, rating, feedback);
                        }
                      },
                    );
                  },
                ),

              // Loading indicator for temp messages
              if (message.id?.startsWith('temp_') == true)
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
