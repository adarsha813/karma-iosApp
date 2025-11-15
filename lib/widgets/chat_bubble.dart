import 'dart:async';
import 'package:flutter/material.dart';
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
import '../services/astrologerdataService.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ChatBubble extends StatefulWidget {
  final Message message;
  final Future<void> Function(String, int, String?)? onRateAnswer;
  final Future<void> Function(String, int, String?)? onRateAdvice;
  final SecureChatService chatService;
  final Map<String, AstroTerm> dictionaryMap;
  final AstroDetail? cachedAstrologer; // ✅ ADD THIS
  final String?
  relatedQuestionText; // ✅ ADD THIS - The question text to show above answer
  const ChatBubble({
    super.key,
    required this.message,
    this.onRateAnswer,
    this.onRateAdvice,
    required this.chatService,
    required this.dictionaryMap,
    this.cachedAstrologer, // ✅ ADD THIS
    this.relatedQuestionText, // ✅ ADD THIS
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
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;
    final token = profileProvider.token;

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
            userId: userId,
            token: token,
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
            userId: userId,
            token: token,
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
            userId: userId,
            token: token,
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
            userId: userId,
            token: token,
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
    required String? userId,
    required String? token,
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
    if (userId == null || userId.isEmpty) {
      debugPrint('❌ Hide action: User ID is null or empty');
      return false;
    }

    if (token == null || token.isEmpty) {
      debugPrint('❌ Hide action: Token is null or empty');
      return false;
    }

    if (userId.length > SecurityConfig.maxIdLength) {
      debugPrint('❌ Hide action: User ID too long');
      return false;
    }

    return true;
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
        headers: {
          'Content-Type': 'application/json',
          'X-User-ID':
              userId, // Include user ID in headers if needed by backend
        },
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
      child: Column(
        crossAxisAlignment: _getCrossAxisAlignment(message),
        children: [
          // ✅ ADDED: Show related question above answer bubble
          if (_shouldShowRelatedQuestion()) _buildRelatedQuestionPreview(),

          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
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

                if (message.id?.startsWith('temp_') == true)
                  _buildLoadingIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // In _shouldShowRelatedQuestion method, add debug prints:
  bool _shouldShowRelatedQuestion() {
    final shouldShow =
        !widget.message.isMe &&
        !widget.message.isAdvice &&
        !widget.message.isClarification &&
        widget.relatedQuestionText != null &&
        widget.relatedQuestionText!.isNotEmpty;

    debugPrint('🔍 Related Question Debug:');
    debugPrint('   - Message ID: ${widget.message.id}');
    debugPrint('   - isMe: ${widget.message.isMe}');
    debugPrint('   - isAdvice: ${widget.message.isAdvice}');
    debugPrint('   - isClarification: ${widget.message.isClarification}');
    debugPrint(
      '   - Related text provided: ${widget.relatedQuestionText != null}',
    );
    debugPrint(
      '   - Related text length: ${widget.relatedQuestionText?.length ?? 0}',
    );
    debugPrint('   - Should show: $shouldShow');

    return shouldShow;
  }

  // ✅ ADDED: Build the related question preview
  Widget _buildRelatedQuestionPreview() {
    final questionText = widget.relatedQuestionText!;
    final maxLength = 60;

    String displayText;
    if (questionText.length > maxLength) {
      displayText = '${questionText.substring(0, maxLength)}...';
    } else {
      displayText = questionText;
    }

    displayText = _stripHtmlTags(displayText);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 6.0, left: 8.0, right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.reply, // Replaced with reply arrow icon
            size: 14,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              displayText,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ ADDED: Helper to strip HTML tags
  String _stripHtmlTags(String htmlText) {
    final regex = RegExp(r'<[^>]*>');
    return htmlText.replaceAll(regex, '');
  }

  // Enhanced version with better error handling
  Widget _buildProfessionalGreeting(Message message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Professional salutation with error boundary
          _buildCustomerGreeting(),
          const SizedBox(height: 4),

          // Subtle separator
        ],
      ),
    );
  }

  Widget _buildCustomerGreeting() {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final customerName = _getCustomerName(profileProvider);

      return Text('Dear $customerName,', style: const TextStyle(fontSize: 14));
    } catch (e) {
      debugPrint('Error building customer greeting: $e');
      // Fallback greeting
      return const Text(
        'Dear Valued Customer,',
        style: TextStyle(fontSize: 14),
      );
    }
  }

  String _getCustomerName(ProfileProvider profileProvider) {
    // Check if profile provider is initialized and has data
    if (!profileProvider.isInitialized) {
      return 'Valued Customer';
    }

    final userName = profileProvider.name;

    // Validate the name
    if (userName == null || userName.isEmpty) {
      return 'Valued Customer';
    }

    // Check if it's the default name
    if (userName == 'User' || userName.toLowerCase().contains('user')) {
      return 'Valued Customer';
    }

    // Check name length and content
    if (userName.length < 2 || userName.length > 50) {
      return 'Valued Customer';
    }

    // Skip regex validation for now to fix the syntax error
    return _capitalizeName(userName);
  }

  // Add the missing _capitalizeName method
  String _capitalizeName(String name) {
    if (name.isEmpty) return name;

    // Split by spaces and capitalize each word
    final words = name.split(' ');
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });

    return capitalizedWords.join(' ');
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
    final message = widget.message;

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
          if (message.isAdvice) _buildProfessionalGreeting(message),
        ],
      ),
    );
  }

  // In your _buildBubble method, wrap the message content:
  Widget _buildMessageContent() {
    final message = widget.message;

    return Container(child: _buildHtmlWithDictionaryHighlighting(message));
  }

  Widget _buildHtmlWithDictionaryHighlighting(Message message) {
    try {
      // Parse HTML and apply dictionary highlighting
      final textSpans = _parseHtmlWithDictionary(message.text, message.isMe);

      return RichText(text: TextSpan(children: textSpans));
    } catch (e) {
      debugPrint('❌ HTML parsing error: $e');
      // Fallback: Show HTML without dictionary highlighting
      return HtmlWidget(
        message.text,
        textStyle: TextStyle(
          color: message.isMe ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      );
    }
  }

  List<TextSpan> _parseHtmlWithDictionary(String html, bool isMe) {
    final List<TextSpan> spans = [];

    // Use a simple HTML parser that only handles colors, bold, and paragraphs
    final regex = RegExp(r'(<[^>]+>|[^<]+)');
    final matches = regex.allMatches(html);

    TextStyle currentStyle = TextStyle(
      color: isMe ? Colors.white : Colors.black,
      fontSize: 14,
    );

    for (final match in matches) {
      final content = match.group(0)!;

      if (content.startsWith('<') && content.endsWith('>')) {
        // HTML tag - update current style
        currentStyle = _updateStyleFromTag(currentStyle, content, isMe);
      } else if (content.trim().isNotEmpty) {
        // Text content - apply dictionary highlighting with current style
        final textSpan = DictionaryHighlighter.highlightText(
          context,
          content,
          widget.dictionaryMap,
          currentStyle,
        );

        spans.add(textSpan);
      }

      // Add line break after paragraphs
      if (content == '</p>') {
        spans.add(TextSpan(text: '\n\n'));
      }
    }

    return spans;
  }

  TextStyle _updateStyleFromTag(TextStyle currentStyle, String tag, bool isMe) {
    TextStyle newStyle = currentStyle;

    // Handle bold (ONLY this formatting)
    if (tag.startsWith('<strong') || tag.startsWith('<b')) {
      newStyle = newStyle.copyWith(fontWeight: FontWeight.bold);
    }

    // Handle closing bold tags
    if (tag == '</strong>' || tag == '</b>') {
      newStyle = newStyle.copyWith(fontWeight: FontWeight.normal);
    }

    // Handle span with color styles (ONLY colors)
    if (tag.startsWith('<span')) {
      final styleMatch = RegExp(r'style="([^"]*)"').firstMatch(tag);
      if (styleMatch != null) {
        newStyle = _applyColorStylesOnly(newStyle, styleMatch.group(1)!, isMe);
      }
    }

    // Handle closing span - reset to base color
    if (tag == '</span>') {
      newStyle = newStyle.copyWith(color: isMe ? Colors.white : Colors.black);
    }

    // Reset to base style for paragraph breaks
    if (tag == '<p>') {
      newStyle = TextStyle(
        color: isMe ? Colors.white : Colors.black,
        fontSize: 14,
      );
    }

    return newStyle;
  }

  TextStyle _applyColorStylesOnly(
    TextStyle baseStyle,
    String style,
    bool isMe,
  ) {
    TextStyle result = baseStyle;

    // Parse colors (existing code)
    final rgbMatch = RegExp(
      r'color:\s*rgb\((\d+),\s*(\d+),\s*(\d+)\)',
    ).firstMatch(style);
    if (rgbMatch != null) {
      final r = int.parse(rgbMatch.group(1)!);
      final g = int.parse(rgbMatch.group(2)!);
      final b = int.parse(rgbMatch.group(3)!);
      result = result.copyWith(color: Color.fromRGBO(r, g, b, 1));
    }

    final hexMatch = RegExp(r'color:\s*#([0-9a-fA-F]{6})').firstMatch(style);
    if (hexMatch != null) {
      final hexColor = hexMatch.group(1)!;
      result = result.copyWith(color: Color(int.parse('0xFF$hexColor')));
    }

    return result;
  }

  // Update the _buildAdminInfo method
  // ✅ SIMPLIFY _buildAdminInfo - No FutureBuilder!
  Widget _buildAdminInfo() {
    final message = widget.message;
    debugPrint('🔍 Admin Info Debug:');
    debugPrint('   - adminId: ${message.adminId}');
    debugPrint('   - adminName: ${message.adminName}');
    debugPrint('   - cachedAstrologer: ${widget.cachedAstrologer?.name}');

    // Early return if no admin data
    if ((message.adminName == null || message.adminName!.isEmpty) &&
        (message.adminId == null || message.adminId!.isEmpty)) {
      return const SizedBox.shrink();
    }

    // Use cached data if available
    final astroData = widget.cachedAstrologer;
    // ✅ SMART FIX: Use cached data only if it has a real, non-generic name
    final bool hasValidCachedData =
        astroData != null &&
        astroData.name.isNotEmpty &&
        astroData.name != 'Councillor' &&
        astroData.name != 'Astrologer';
    final String adminImage =
        astroData?.image ??
        message.adminImage ??
        'https://cdn-icons-png.flaticon.com/512/4139/4139981.png'; // generic male avatar

    final String adminName =
        hasValidCachedData
            ? astroData.name
            : (message.adminName?.isNotEmpty == true
                ? message.adminName!
                : 'Councillor');

    debugPrint('🎯 Final admin name: $adminName');

    return _buildAdminCard(
      adminImage: adminImage,
      adminName: adminName,
      isLoading: false, // ✅ No loading state since we preload
      hasError: false,
      hasData: hasValidCachedData || message.adminImage != null,
    );
  }

  // Updated _buildAdminCard method
  Widget _buildAdminCard({
    required String adminImage,
    required String adminName,
    required bool isLoading,
    required bool hasError,
    required bool hasData,
  }) {
    final message = widget.message;
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
        onTap: () => _navigateToAstrologerDetail(context, widget.message),
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
              _buildAdminAvatar(
                adminImage: adminImage,
                isLoading: isLoading,
                hasError: hasError,
                adminName: adminName,
              ),
              const SizedBox(width: 10),
              _buildAdminInfoText(
                adminName: adminName,
                textColor: textColor,
                isLoading: isLoading,
              ),
              if (!isLoading &&
                  widget.message.adminId != null &&
                  widget.message.adminId!.isNotEmpty)
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

  // Keep your existing _buildAdminAvatar method
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

  // Keep your existing _buildAdminInfoText method
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

  // Enhanced caching with TTL
  final Map<String, MapEntry<Map<String, dynamic>, DateTime>> _astrologerCache =
      {};
  final Duration _cacheTTL = const Duration(minutes: 30);

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
