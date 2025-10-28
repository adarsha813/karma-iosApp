import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/message.dart';
import '../models/astro_term.dart';
import '../services/chat_service.dart';
import '../services/secure_http_client.dart';
import '../services/error_reporting_service.dart';
import '../services/rate_limiting_service.dart';
import '../providers/profile_provider.dart';
import '../utils/dictionary_highlighter.dart';
import '../config/environment.dart';
import '../config/security_config.dart';
import 'rating_bubble.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;
  final Future<void> Function(String, int, String?)? onRateAdvice;
  final ChatService chatService;
  final Map<String, AstroTerm> dictionaryMap;

  const ChatBubble({
    super.key,
    required this.message,
    this.onRateAnswer,
    this.onRateAdvice,
    required this.chatService,
    required this.dictionaryMap,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  // Security & rate limiting
  final RateLimitingService _rateLimiter = RateLimitingService();
  static const Duration _hideActionCooldown = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = Tween<double>(begin: 0.99, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

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

  void _showHideOptions(BuildContext context, Message message) {
    // Rate limiting for hide options
    if (_rateLimiter.isActionAllowed('hideItem', _hideActionCooldown)) {
      _showSnackBar(context, 'Please wait before performing another action');
      return;
    }

    _logSecurityEvent('HideOptionsShown', {'messageId': message.id});

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return _buildHideOptionsDialog(context, message);
      },
    );
  }

  Widget _buildHideOptionsDialog(BuildContext context, Message message) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildHideOptionItems(context, message),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }

  List<Widget> _buildHideOptionItems(BuildContext context, Message message) {
    final items = <Widget>[];

    if (message.isMe) {
      items.add(
        _buildHideOptionItem(
          context,
          Icons.delete,
          'Delete Question',
          Colors.red,
          () => _hideItem(
            context,
            '/questions/${message.id}/hide-question',
            message.id,
          ),
        ),
      );
    }

    if (!message.isMe && !message.isAdvice && !message.isClarification) {
      items.add(
        _buildHideOptionItem(
          context,
          Icons.delete,
          'Delete Answer',
          Colors.red,
          () => _hideItem(
            context,
            '/questions/${message.id}/hide-answer',
            message.id,
          ),
        ),
      );
    }

    if (message.isAdvice) {
      items.add(
        _buildHideOptionItem(
          context,
          Icons.delete,
          'Delete Advice',
          Colors.red,
          () => _hideItem(
            context,
            '/advices/${message.id}/hide',
            message.id,
            isAdvice: true,
          ),
        ),
      );
    }

    if (message.isClarification) {
      items.add(
        _buildHideOptionItem(
          context,
          Icons.delete,
          'Hide Clarification',
          Colors.red,
          () => _hideItem(
            context,
            '/questions/${message.id}/clarification/${message.clarificationId}/hide',
            message.id,
          ),
        ),
      );
    }

    return items;
  }

  Widget _buildHideOptionItem(
    BuildContext context,
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(text, style: TextStyle(color: color, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Future<void> _hideItem(
    BuildContext context,
    String endpoint,
    String? messageId, {
    bool isAdvice = false,
  }) async {
    // Rate limiting
    if (_rateLimiter.isActionAllowed('hideItem', _hideActionCooldown)) {
      _showSnackBar(context, 'Please wait before hiding another message');
      return;
    }

    Navigator.pop(context); // Close dialog

    if (!_validateHideParameters(messageId)) {
      _showSnackBar(context, 'Invalid message parameters');
      return;
    }

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;
    final token = profileProvider.token;

    if (!_validateUserCredentials(userId, token)) {
      _showSnackBar(context, 'Authentication required');
      return;
    }

    await _performHideRequest(
      context,
      endpoint,
      messageId!,
      userId!,
      token!,
      isAdvice,
    );
  }

  bool _validateHideParameters(String? messageId) {
    return messageId != null &&
        messageId.isNotEmpty &&
        messageId.length <= SecurityConfig.maxIdLength;
  }

  bool _validateUserCredentials(String? userId, String? token) {
    return userId != null &&
        userId.isNotEmpty &&
        userId.length <= SecurityConfig.maxIdLength &&
        token != null &&
        token.isNotEmpty;
  }

  Future<void> _performHideRequest(
    BuildContext context,
    String endpoint,
    String messageId,
    String userId,
    String token,
    bool isAdvice,
  ) async {
    try {
      final secureClient = SecureHttpClient();
      final url = Uri.parse('${Environment.baseUrl}$endpoint');
      final response = await secureClient.sendAuthenticatedRequest(
        url: url,
        method: isAdvice ? 'PATCH' : 'PATCH',
        token: token,
        body: isAdvice ? jsonEncode({'userId': userId, 'hide': true}) : null,
        timeout: const Duration(seconds: 10),
      );

      await _handleHideResponse(context, response, messageId);
    } catch (error, stackTrace) {
      await _handleHideError(context, error, stackTrace, messageId);
    }
  }

  Future<void> _handleHideResponse(
    BuildContext context,
    http.Response response,
    String messageId,
  ) async {
    if (response.statusCode == 200) {
      _logSecurityEvent('MessageHidden', {'messageId': messageId});

      // Update UI
      if (mounted) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).removeMessageById(messageId);
        _showSnackBar(context, 'Message hidden successfully');
      }
    } else {
      _logSecurityEvent('HideMessageFailed', {
        'messageId': messageId,
        'statusCode': response.statusCode,
      });

      if (mounted) {
        _showSnackBar(
          context,
          'Failed to hide message: ${response.statusCode}',
        );
      }
    }
  }

  Future<void> _handleHideError(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
    String messageId,
  ) async {
    _logSecurityEvent('HideMessageError', {
      'messageId': messageId,
      'error': error.toString(),
    });

    // Report error
    ErrorReportingService.recordError(error, stackTrace);

    if (mounted) {
      _showSnackBar(context, 'Network error. Please try again.');
    }
  }

  void _logSecurityEvent(String event, Map<String, dynamic> params) {
    // Log security-related events
    debugPrint('🔒 Security Event: $event - $params');

    // In production, send to your analytics/security monitoring
    // AnalyticsService.logEvent(event, parameters: params);
  }

  void _showSnackBar(BuildContext context, String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
      debugPrint('🔄 ChatBubble updated: ${widget.message.id}');
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    // Security: Validate message data
    if (!_validateMessageData(message)) {
      return _buildErrorFallback();
    }

    final bubbleConfig = _getBubbleConfig(message);
    final animatedBubble = _buildAnimatedBubble(bubbleConfig);

    return Align(
      alignment: _getMessageAlignment(message),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () => _showHideOptions(context, message),
        child: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {}, // Pass events through
          child: animatedBubble,
        ),
      ),
    );
  }

  bool _validateMessageData(Message message) {
    // Basic validation for message data
    if (message.text.isEmpty ||
        message.text.length > SecurityConfig.maxMessageLength) {
      _logSecurityEvent('InvalidMessageData', {
        'messageId': message.id,
        'textLength': message.text.length,
      });
      return false;
    }
    return true;
  }

  Widget _buildErrorFallback() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Message not available',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  BubbleConfig _getBubbleConfig(Message message) {
    Color bubbleColor;
    IconData? icon;
    String? label;

    if (message.isMe) {
      bubbleColor = const Color.fromARGB(255, 106, 145, 211);
    } else if (message.isClarification) {
      bubbleColor = const Color.fromARGB(255, 227, 196, 156);
    } else if (message.isAdvice) {
      bubbleColor = const Color.fromARGB(255, 182, 206, 178);
      icon = Icons.tips_and_updates;
      label = "Advice";
    } else {
      bubbleColor = Colors.grey[300]!;
    }

    return BubbleConfig(color: bubbleColor, icon: icon, label: label);
  }

  Alignment _getMessageAlignment(Message message) {
    if (message.isMe) return Alignment.centerRight;
    if (message.isAdvice) return Alignment.center;
    return Alignment.centerLeft;
  }

  Widget _buildAnimatedBubble(BubbleConfig config) {
    final message = widget.message;

    final bubble = _buildBubble(config);

    if (message.isMe || message.isAdvice) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: bubble),
      );
    } else {
      return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: bubble),
      );
    }
  }

  Widget _buildBubble(BubbleConfig config) {
    final message = widget.message;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      decoration: BoxDecoration(
        color: config.color,
        borderRadius: _getBorderRadius(message),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: _getCrossAxisAlignment(message),
        children: [
          if (config.label != null && config.icon != null)
            _buildMessageLabel(config),

          _buildMessageContent(),

          if (message.adminName != null || message.adminId != null)
            _buildAdminInfo(),

          if (message.createdAt != null)
            _buildTimestamp('Asked at: ${_formatDateTime(message.createdAt!)}'),

          if (message.answeredAt != null)
            _buildTimestamp(
              'Answered at: ${_formatDateTime(message.answeredAt!)}',
            ),

          if (message.clarificatedAt != null)
            _buildTimestamp(
              'Clarified at: ${_formatDateTime(message.clarificatedAt!)}',
            ),

          if (_shouldShowRatingBubble()) _buildRatingBubble(),

          if (message.id?.startsWith('temp_') == true) _buildLoadingIndicator(),
        ],
      ),
    );
  }

  BorderRadius _getBorderRadius(Message message) {
    if (message.isAdvice) {
      return BorderRadius.circular(20);
    }

    return BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft:
          message.isMe ? const Radius.circular(16) : const Radius.circular(0),
      bottomRight:
          message.isMe ? const Radius.circular(0) : const Radius.circular(16),
    );
  }

  CrossAxisAlignment _getCrossAxisAlignment(Message message) {
    return message.isAdvice
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
  }

  Widget _buildMessageLabel(BubbleConfig config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(config.icon, size: 16, color: Colors.deepPurple),
          const SizedBox(width: 4),
          Text(
            config.label!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent() {
    final message = widget.message;

    return Html(
      data: message.text,
      style: _getHtmlStyles(message),
      extensions: [
        TagExtension(
          tagsToExtend: {"p", "span", "body", "li", "strong", "em"},
          builder: (extensionContext) {
            return _buildRichText(extensionContext);
          },
        ),
      ],
    );
  }

  Map<String, Style> _getHtmlStyles(Message message) {
    final textColor = message.isMe ? Colors.white : Colors.black;

    return {
      "body": Style(
        margin: Margins.zero,
        padding: HtmlPaddings.zero,
        color: textColor,
        fontSize: FontSize(16),
      ),
      "p": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
      "ul": Style(
        margin: Margins.only(left: 16),
        padding: HtmlPaddings.zero,
        color: textColor,
      ),
      "li": Style(margin: Margins.symmetric(vertical: 4)),
    };
  }

  Widget _buildRichText(extensionContext) {
    final rawText = extensionContext.element?.text ?? "";

    if (rawText.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    TextStyle baseStyle =
        extensionContext.styledElement?.style.generateTextStyle() ??
        DefaultTextStyle.of(context).style;

    final isStrong = extensionContext.element?.localName == "strong";
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
        baseStyle,
      ),
    );
  }

  Widget _buildAdminInfo() {
    final message = widget.message;

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        'Admin: ${message.adminName} (${message.adminId})',
        style: TextStyle(
          fontSize: 12,
          color: message.isMe ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }

  Widget _buildTimestamp(String text) {
    final message = widget.message;

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: message.isMe ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }

  bool _shouldShowRatingBubble() {
    return (!widget.message.isMe &&
            widget.onRateAnswer != null &&
            widget.message.answeredAt != null) ||
        widget.message.isAdvice;
  }

  Widget _buildRatingBubble() {
    return RatingBubble(
      key: ValueKey(
        'rating_${widget.message.id}_${widget.message.rating}_${widget.message.feedback}',
      ),
      questionId: widget.message.id ?? '',
      initialRating: widget.message.rating,
      initialFeedback: widget.message.feedback,
      isAdvice: widget.message.isAdvice,
      onRatingSubmitted: (id, rating, feedback) async {
        if (mounted) {
          setState(() {
            widget.message.updateRating(rating, feedback);
          });
        }

        try {
          if (widget.message.isAdvice) {
            await widget.onRateAdvice!(id, rating, feedback);
          } else {
            await widget.onRateAnswer!(id, rating, feedback);
          }
        } catch (error, stackTrace) {
          ErrorReportingService.recordError(
            error,
            stackTrace,
          ); // <-- change here
          if (mounted) {
            _showSnackBar(context, 'Failed to submit rating');
          }
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: SizedBox(
        width: 12,
        height: 12,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class BubbleConfig {
  final Color color;
  final IconData? icon;
  final String? label;

  BubbleConfig({required this.color, this.icon, this.label});
}
