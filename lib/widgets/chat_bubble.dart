import 'package:flutter/material.dart';
import '../models/message.dart';
import 'rating_bubble.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../services/chat_service.dart'; // adjust path if needed
import 'dart:convert';
import 'package:kundali/providers/profile_provider.dart';
import '../models/astro_term.dart';
import '../utils/dictionary_highlighter.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;
  final Future<void> Function(String, int, String?)? onRateAdvice; // ✅ Added
  final ChatService chatService; // <--- Add this
  final Map<String, AstroTerm> dictionaryMap;

  const ChatBubble({
    super.key,
    required this.message,
    this.onRateAnswer,
    this.onRateAdvice,
    required this.chatService, // <--- Add this
    required this.dictionaryMap, // ✅ pass from parent
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  void _showHideOptions(BuildContext context, Message message) {
    print("🛠️ _showHideOptions called for message id=${message.id}");

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(12),
          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              if (message.isMe)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _hideItem(
                      context,
                      '/questions/${message.id}/hide-question',
                      message.id,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.delete, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Delete Question",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              if (!message.isMe &&
                  !message.isAdvice &&
                  !message.isClarification)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _hideItem(
                      context,
                      '/questions/${message.id}/hide-answer',
                      message.id,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.delete, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Delete Answer",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              if (message.isAdvice)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _hideItem(
                      context,
                      '/advices/${message.id}/hide',
                      message.id,
                      isAdvice: true,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.delete, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Delete Advice",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              if (message.isClarification)
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _hideItem(
                      context,
                      '/questions/${message.id}/clarification/${message.clarificationId}/hide',
                      message.id,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.delete, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Hide Clarification",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
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
    String? messageId, {
    bool isAdvice = false,
  }) async {
    debugPrint(
      "🚀 _hideItem called for endpoint=$endpoint, messageId=$messageId, isAdvice=$isAdvice  🚀 _hideItem called for messageId=$messageId, endpoint=$endpoint",
    );

    if (messageId == null || messageId.isEmpty) {
      debugPrint("❌ Message ID not found");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Message ID not found.")));
      return;
    }

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;
    final token = profileProvider.token;

    debugPrint("👤 userId=$userId, token=${token != null ? 'found' : 'null'}");

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Token not found.")));
      return;
    }

    final baseUrl = 'https://chat-backend-rvk9.onrender.com';
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final http.Request request;
      if (isAdvice) {
        request = http.Request('PATCH', url);
        request.headers['Content-Type'] = 'application/json';
        request.headers['Authorization'] = 'Bearer $token';
        request.body = jsonEncode({'userId': userId, 'hide': true});
        debugPrint("📤 PATCH body for advice: ${request.body}");
      } else {
        request = http.Request('PATCH', url);
        request.headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.Response.fromStream(await request.send());

      debugPrint(
        "📥 Response statusCode=${response.statusCode}, body=${response.body}",
      );

      if (response.statusCode == 200) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).removeMessageById(messageId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message hidden successfully.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to hide message: ${response.body}")),
        );
      }
    } catch (e) {
      debugPrint("⚠️ Error hiding message: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.99, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Slide animation: right for own messages, left for others
    _slideAnimation = Tween<Offset>(
      begin:
          widget.message.isMe
              ? const Offset(0.05, 0.0)
              : const Offset(-0.05, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            ? const Color.fromARGB(255, 106, 145, 211)
            : message.isClarification
            ? const Color.fromARGB(255, 227, 196, 156)
            : message.isAdvice
            ? const Color.fromARGB(255, 182, 206, 178)
            : Colors.grey[300]!;

    IconData? icon;
    String? label;

    if (message.isAdvice) {
      icon = Icons.tips_and_updates;
      label = "Advice";
    }
    Widget animatedBubble = SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: _buildBubble(bubbleColor, label, icon),
      ),
    );
    widget.message.isMe || message.isAdvice
        ? ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildBubble(bubbleColor, label, icon),
          ),
        )
        : SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildBubble(bubbleColor, label, icon),
          ),
        );
    return Align(
      alignment:
          message.isMe
              ? Alignment.centerRight
              : message.isAdvice
              ? Alignment.center
              : Alignment.centerLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () => _showHideOptions(context, message),
        child: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {}, // pass events through
          child: animatedBubble,
        ),
      ),
    );
  }

  Widget _buildBubble(Color bubbleColor, String? label, IconData? icon) {
    final message = widget.message;
    return Container(
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
            extensions: [
              TagExtension(
                tagsToExtend: {"p", "span", "body", "li", "strong", "em"},
                builder: (extensionContext) {
                  final rawText = extensionContext.element?.text ?? "";

                  if (rawText.trim().isEmpty) {
                    return const SizedBox.shrink();
                  }
                  if (rawText.trim().isEmpty) {
                    return const SizedBox.shrink();
                  }

                  // ✅ Base style coming from flutter_html
                  TextStyle baseStyle =
                      extensionContext.styledElement?.style
                          .generateTextStyle() ??
                      DefaultTextStyle.of(context).style;

                  // ✅ Apply extra styles if <strong> or <em>
                  final isStrong =
                      extensionContext.element?.localName == "strong";
                  final isEm = extensionContext.element?.localName == "em";

                  if (isStrong) {
                    baseStyle = baseStyle.copyWith(fontWeight: FontWeight.bold);
                  }
                  if (isEm) {
                    baseStyle = baseStyle.copyWith(fontStyle: FontStyle.italic);
                  }

                  return RichText(
                    text: DictionaryHighlighter.highlightText(
                      extensionContext.buildContext ?? context,
                      rawText,
                      widget.dictionaryMap,
                      baseStyle, // pass parent style
                    ),
                  );
                },
              ),
            ],
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
            RatingBubble(
              key: ValueKey(
                'rating_${widget.message.id}_${widget.message.rating}_${widget.message.feedback}',
              ),
              questionId: widget.message.id ?? '',
              initialRating: widget.message.rating,
              initialFeedback: widget.message.feedback,
              isAdvice: widget.message.isAdvice,
              onRatingSubmitted: (id, rating, feedback) async {
                setState(() {
                  widget.message.updateRating(
                    rating,
                    feedback,
                  ); // update locally
                });
                if (widget.message.isAdvice) {
                  await widget.onRateAdvice!(id, rating, feedback);
                } else {
                  await widget.onRateAnswer!(id, rating, feedback);
                }
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
    );
  }
}
