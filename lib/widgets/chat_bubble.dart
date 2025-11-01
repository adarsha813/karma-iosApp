import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math'; // <-- needed for min()
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
import '../screens/AstrologerDetailPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;
  final Future<void> Function(String, int, String?)? onRateAdvice;
  final SecureChatService chatService;
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

  bool _isHiding = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    Timer.periodic(Duration(minutes: 30), (_) => _cleanupExpiredCache());
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

  void _logSecurityEvent(String message, [Map<String, dynamic>? data]) {
    debugPrint('Security event: $message, data: ${data ?? {}}');
  }

  void _showHideOptions(BuildContext context, Message message) {
    // Debug the rate limiting
    _rateLimiter.debugActionState('hideItem', _hideActionCooldown);

    final isAllowed = _rateLimiter.isActionAllowed(
      'hideItem',
      _hideActionCooldown,
    );
    debugPrint('🎯 Hide action allowed: $isAllowed');

    if (!isAllowed) {
      debugPrint('⏰ Rate limited - showing wait message');
      _showSnackBar(context, 'Please wait before performing another action');
      return;
    }

    _logSecurityEvent('HideOptionsShown', {'messageId': message.id});
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _buildHideOptionsDialog(context, message),
    );
  }

  Widget _buildHideOptionsDialog(BuildContext context, Message message) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildProfessionalHideOptionItems(context, message),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildProfessionalHideOptionItems(
    BuildContext context,
    Message message,
  ) {
    final items = <Widget>[];

    Widget buildProfessionalOptionItem(
      IconData icon,
      String text,
      Color color,
      VoidCallback onTap,
    ) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[50],
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 18),
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (message.isMe) {
      items.add(
        buildProfessionalOptionItem(
          Icons.delete_outline,
          'Delete Question',
          const Color(0xFFDC2626),
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
        buildProfessionalOptionItem(
          Icons.delete_outline,
          'Delete Answer',
          const Color(0xFFDC2626),
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
        buildProfessionalOptionItem(
          Icons.tips_and_updates_outlined,
          'Delete Advice',
          const Color(0xFFD97706),
          () => _hideItem(
            context,
            '/advices/${message.id}/hide',
            message.id,
            isAdvice: true,
          ),
        ),
      );
    }

    if (message.isClarification && message.clarificationId != null) {
      items.add(
        buildProfessionalOptionItem(
          Icons.help_outline,
          'Delete Clarification',
          const Color(0xFF2563EB),
          () => _hideItem(
            context,
            '/questions/${message.id}/clarification/${message.clarificationId}/hide',
            message.id,
          ),
        ),
      );
    }

    // Add spacing between items
    for (int i = 0; i < items.length - 1; i++) {
      items.insert(i + 1, const SizedBox(height: 8));
    }

    return items;
  }

  Future<void> _hideItem(
    BuildContext context,
    String endpoint,
    String? messageId, {
    bool isAdvice = false,
  }) async {
    _debugChatServiceState(); // ← here
    // Set hiding state immediately
    if (mounted) {
      setState(() {
        _isHiding = true;
      });
    }
    debugPrint(
      '🎯 _hideItem called - endpoint: $endpoint, messageId: $messageId',
    );

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

    // ✅ IMMEDIATE UI UPDATE - Remove message from local list FIRST
    _removeMessageInstantly(messageId!);

    // ✅ Then call backend async
    await _performHideRequest(
      context,
      endpoint,
      messageId,
      userId!,
      token!,
      isAdvice,
    );

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isHiding = false;
        });
      }
    });
  }

  void _debugChatServiceState() {
    final chatService = Provider.of<SecureChatService>(context, listen: false);
    debugPrint('📊 ChatService state:');
    debugPrint('   Total messages: ${chatService.messages.length}');
    debugPrint(
      '   Messages: ${chatService.messages.map((m) => '${m.id}: ${m.text.substring(0, min(20, m.text.length))}').toList()}',
    );
  }

  void _removeMessageInstantly(String messageId) {
    try {
      debugPrint('🚀 Removing message instantly from UI: $messageId');

      final chatService = Provider.of<SecureChatService>(
        context,
        listen: false,
      );

      // Remove from service immediately
      chatService.removeMessageById(messageId);

      // Show immediate feedback
      _showSnackBar(context, 'Message Deleted');

      _debugChatServiceState(); // ← here to see the state after removal

      debugPrint('✅ Message removed instantly from UI: $messageId');
    } catch (e, stackTrace) {
      debugPrint('❌ Error removing message from UI: $e');
      ErrorReportingService.recordError(e, stackTrace);
    }
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
      debugPrint('🌐 Sending hide request to backend: $endpoint');

      final secureClient = SecureHttpClient();
      final url = Uri.parse('${Environment.baseUrl}$endpoint');
      final response = await secureClient.sendAuthenticatedRequest(
        url: url,
        method: 'PATCH',
        token: token,
        headers: {'Content-Type': 'application/json'},
        body: isAdvice ? jsonEncode({'userId': userId, 'hide': true}) : null,
        timeout: const Duration(seconds: 10),
      );

      // Process response in next frame to ensure UI stability
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleHideResponse(context, response, messageId);
      });
    } catch (error, stackTrace) {
      debugPrint('❌ Hide request failed: $error');
      if (mounted) {
        await _handleHideError(context, error, stackTrace, messageId);
      }

      // Show error but don't add the message back (better UX)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showSnackBar(context, 'Deleted locally (sync failed)');
        }
      });

      ErrorReportingService.recordError(error, stackTrace);
    }
  }

  Future<void> _handleHideResponse(
    BuildContext context,
    http.Response response,
    String messageId,
  ) async {
    if (response.statusCode == 200) {
      _logSecurityEvent('MessageHidden', {'messageId': messageId});
      debugPrint('✅ Message successfully Deleted on server: $messageId');

      // No need to update UI again - it was already removed instantly
      // Just show success confirmation
      if (mounted) {
        _showSnackBar(context, '✓ Deleted successfully');
      }
    } else {
      _logSecurityEvent('HideMessageFailed', {
        'messageId': messageId,
        'statusCode': response.statusCode,
      });

      debugPrint('❌ Server Delete failed: ${response.statusCode}');

      // Optionally: You could add the message back if server hide failed
      // But usually better UX to keep it hidden locally
      if (mounted) {
        _showSnackBar(context, 'Delete locally (server sync failed)');
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

    // Only show snackbar if widget is still mounted
    if (mounted) {
      _showSnackBar(context, 'Network error. Please try again.');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    // Double-check if we can safely show the snackbar
    try {
      if (mounted && ScaffoldMessenger.of(context).mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error showing snackbar: $e');
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
    String? type;
    String? title;

    if (message.isMe) {
      bubbleColor = const Color.fromARGB(255, 106, 145, 211);
    } else if (message.isClarification) {
      bubbleColor = const Color.fromARGB(255, 227, 196, 156);
    } else if (message.isAdvice) {
      bubbleColor = const Color.fromARGB(255, 182, 206, 178);
      icon = Icons.tips_and_updates_outlined;

      type = message.type; // top line
      title = message.title; // bottom line
    } else {
      bubbleColor = Colors.grey[300]!;
    }
    return BubbleConfig(
      color: bubbleColor,
      icon: icon,
      type: type,
      title: title,
    );
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
    if (_isHiding) {
      return _buildHidingState();
    }
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
          if ((config.type != null || config.title != null) &&
              config.icon != null)
            _buildMessageLabel(config),

          _buildMessageContent(),

          if (message.adminName != null || message.adminId != null)
            _buildAdminInfo(),

          // Advice: show Created at
          if (message.createdAt != null)
            _buildTimestamp(
              '${message.isAdvice ? 'Created' : 'Asked'} at: ${_formatDateTime(message.createdAt!)}',
            ),

          // Regular answers: show Answered at
          if (!message.isAdvice && message.answeredAt != null)
            _buildTimestamp(
              'Answered at: ${_formatDateTime(message.answeredAt!)}',
            ),

          // Always show when question was asked

          // Clarifications
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

  Widget _buildHidingState() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Hiding...', style: TextStyle(color: Colors.grey)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (config.type != null && config.icon != null)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(config.icon, size: 16, color: Colors.deepPurple),
                  const SizedBox(width: 4),
                  Text(
                    config.type!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          if (config.title != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  config.title!,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 96, 65, 148),
                  ),
                ),
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

    // Early return if no admin data
    if ((message.adminName == null || message.adminName!.isEmpty) &&
        (message.adminId == null || message.adminId!.isEmpty)) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<Map<String, dynamic>?>(
      future: _fetchAstrologerIfNeeded(message),
      builder: (context, snapshot) {
        final bool isLoading =
            snapshot.connectionState == ConnectionState.waiting;
        final bool hasError = snapshot.hasError;
        final bool hasData = snapshot.data != null;

        final String adminImage = _getAdminImage(snapshot.data, message);
        final String adminName = message.adminName ?? 'Astrologer';

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _buildAdminCard(
            context: context,
            message: message,
            adminImage: adminImage,
            adminName: adminName,
            isLoading: isLoading,
            hasError: hasError,
            hasData: hasData,
            onTap: () => _navigateToAstrologerDetail(context, message),
          ),
        );
      },
    );
  }

  String _getAdminImage(Map<String, dynamic>? data, Message message) {
    // Priority: 1. Fetched data, 2. Message adminImage, 3. Fallback
    return data?['image']?.toString() ??
        message.adminImage ??
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80';
  }

  Widget _buildAdminCard({
    required BuildContext context,
    required Message message,
    required String adminImage,
    required String adminName,
    required bool isLoading,
    required bool hasError,
    required bool hasData,
    required VoidCallback onTap,
  }) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color textColor =
        message.isMe
            ? Colors.white70
            : isDarkMode
            ? Colors.white70
            : Colors.black54;
    final Color backgroundColor =
        message.isMe
            ? Colors.white.withOpacity(0.15)
            : Colors.grey.withOpacity(0.1);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withOpacity(0.1),
        highlightColor: Colors.blue.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  message.isMe
                      ? Colors.white.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar with loading states
              _buildAdminAvatar(
                adminImage: adminImage,
                isLoading: isLoading,
                hasError: hasError,
                adminName: adminName,
              ),

              const SizedBox(width: 10),

              // Admin info
              _buildAdminInfoText(
                adminName: adminName,
                textColor: textColor,
                isLoading: isLoading,
              ),

              // Chevron icon for navigation hint
              if (!isLoading &&
                  message.adminId != null &&
                  message.adminId!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: textColor.withOpacity(0.6),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminAvatar({
    required String adminImage,
    required bool isLoading,
    required bool hasError,
    required String adminName,
  }) {
    if (isLoading) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
        ),
      );
    }

    if (hasError) {
      return Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.person_outline_rounded,
          size: 16,
          color: Colors.white,
        ),
      );
    }

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: adminImage,
          fit: BoxFit.cover,
          placeholder:
              (context, url) => Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
          errorWidget:
              (context, url, error) => Container(
                color: Colors.grey.shade300,
                child: Icon(
                  Icons.person_rounded,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ),
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }

  Widget _buildAdminInfoText({
    required String adminName,
    required Color textColor,
    required bool isLoading,
  }) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 1),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child:
                isLoading
                    ? Container(
                      width: 80,
                      height: 9,
                      decoration: BoxDecoration(
                        color: textColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                    : Text(
                      adminName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        decorationThickness: 1.2,
                      ),
                    ),
          ),
        ],
      ),
    );
  }

  void _navigateToAstrologerDetail(BuildContext context, Message message) {
    if (message.adminId == null || message.adminId!.isEmpty) return;

    // Haptic feedback for better UX
    _triggerHapticFeedback();

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                AstrologerDetailPage(astrologerId: message.adminId!),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  void _triggerHapticFeedback() {
    // For haptic feedback (requires haptic_feedback package)
    // HapticFeedback.lightImpact();
  }

  Future<Map<String, dynamic>?> _fetchAstrologerIfNeeded(
    Message message,
  ) async {
    // Early returns for optimization
    if (message.adminImage != null && message.adminImage!.isNotEmpty) {
      return {'image': message.adminImage};
    }

    if (message.adminId == null || message.adminId!.isEmpty) return null;

    // Memory cache check with TTL (Time To Live)
    final cachedData = _getCachedAstrologerData(message.adminId!);
    if (cachedData != null) return cachedData;

    try {
      final url = Uri.parse(
        '${Environment.baseUrl}/api/councillor/${message.adminId}',
      );

      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Accept': 'application/json',
              'Cache-Control': 'max-age=300', // 5 minutes cache
            },
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        if (data['success'] == true && data['data'] != null) {
          final astrologerData = data['data'] as Map<String, dynamic>;

          // Cache the result with timestamp
          _cacheAstrologerData(message.adminId!, astrologerData);

          return astrologerData;
        }
      } else if (response.statusCode >= 500) {
        // Log server errors but don't crash
        debugPrint(
          '🚨 Server error fetching astrologer: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      debugPrint('🌐 Network error fetching astrologer: $e');
    } on TimeoutException catch (e) {
      debugPrint('⏰ Timeout fetching astrologer: $e');
    } catch (e, stackTrace) {
      debugPrint('⚠️ Unexpected error fetching astrologer: $e');
      print('Stack trace: $stackTrace');
      // Report to your error tracking service
      // ErrorReportingService.recordError(e, stackTrace);
    }

    return null;
  }

  // Enhanced caching with TTL
  final Map<String, MapEntry<Map<String, dynamic>, DateTime>> _astrologerCache =
      {};
  Duration _cacheTTL = Duration(minutes: 30); // Cache for 30 minutes

  Map<String, dynamic>? _getCachedAstrologerData(String adminId) {
    final entry = _astrologerCache[adminId];
    if (entry != null) {
      if (DateTime.now().difference(entry.value) < _cacheTTL) {
        return entry.key; // Return cached data if not expired
      } else {
        _astrologerCache.remove(adminId); // Remove expired cache
      }
    }
    return null;
  }

  void _cacheAstrologerData(String adminId, Map<String, dynamic> data) {
    _astrologerCache[adminId] = MapEntry(data, DateTime.now());
  }

  // Cache cleanup method (call periodically if needed)
  void _cleanupExpiredCache() {
    final now = DateTime.now();
    _astrologerCache.removeWhere(
      (key, value) => now.difference(value.value) > _cacheTTL,
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

  final String? type; // top line
  final String? title; // bottom line

  BubbleConfig({required this.color, this.icon, this.type, this.title});
}
