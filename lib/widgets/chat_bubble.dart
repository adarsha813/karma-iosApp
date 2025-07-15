import 'package:flutter/material.dart';
import '../models/message.dart';
import 'rating_bubble.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;

  const ChatBubble({super.key, required this.message, this.onRateAnswer});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
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
            if (!widget.message.isMe &&
                widget.onRateAnswer != null &&
                widget.message.answeredAt != null)
              Consumer<Message>(
                builder: (_, msg, __) {
                  return RatingBubble(
                    key: ValueKey(
                      'rating_${msg.id}_${msg.rating}_${msg.feedback}',
                    ),
                    questionId: msg.id ?? '',
                    initialRating: msg.rating,
                    initialFeedback: msg.feedback,
                    onRatingSubmitted: (id, rating, feedback) async {
                      msg.updateRating(rating, feedback); // Local update
                      await widget.onRateAnswer!(
                        id,
                        rating,
                        feedback,
                      ); // Backend update
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
    );
  }
}
