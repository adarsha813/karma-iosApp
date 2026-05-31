import 'dart:async';
import 'package:flutter/material.dart';
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
import '../screens/astrologerdetail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/astrologerdata_service.dart';

import 'package:kundali/utils/app_colors.dart';
import '../providers/theme_provider.dart'; // Add this import

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
    //AppLogger.info('Security event: $message, data: ${data ?? {}}');
  }

  void _showHideOptions(BuildContext context, Message message) {
    // Debug the rate limiting
    _rateLimiter.debugActionState('hideItem', _hideActionCooldown);

    final isAllowed = _rateLimiter.isActionAllowed(
      'hideItem',
      _hideActionCooldown,
    );
    //AppLogger.info('🎯 Hide action allowed: $isAllowed');

    if (!isAllowed) {
      //AppLogger.info('⏰ Rate limited - showing wait message');
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
                    color: color.withAlpha((0.1 * 255).toInt()),
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
    //AppLogger.info( '🎯 _hideItem called - endpoint: $endpoint, messageId: $messageId',);

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
    //AppLogger.info('📊 ChatService state:');
    //AppLogger.info('   Total messages: ${chatService.messages.length}');
    //AppLogger.info('   Messages: ${chatService.messages.map((m) => '${m.id}: ${m.text.substring(0, min(20, m.text.length))}').toList()}',);
  }

  void _removeMessageInstantly(String messageId) {
    try {
      //AppLogger.info('🚀 Removing message instantly from UI: $messageId');

      final chatService = Provider.of<SecureChatService>(
        context,
        listen: false,
      );

      // Remove from service immediately
      chatService.removeMessageById(messageId);

      // Show immediate feedback
      _showSnackBar(context, 'Message Deleted');

      _debugChatServiceState(); // ← here to see the state after removal

      //AppLogger.info('✅ Message removed instantly from UI: $messageId');
    } catch (e, stackTrace) {
      //AppLogger.info('❌ Error removing message from UI: $e');
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
      //AppLogger.info('❌ Hide action: User ID is null or empty');
      return false;
    }

    if (token == null || token.isEmpty) {
      //AppLogger.info('❌ Hide action: Token is null or empty');
      return false;
    }

    if (userId.length > SecurityConfig.maxIdLength) {
      //AppLogger.info('❌ Hide action: User ID too long');
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
    final localContext = context; // Capture context safely
    try {
      final secureClient = SecureHttpClient();
      final url = Uri.parse('${Environment.baseUrl}$endpoint');
      final response = await secureClient.sendAuthenticatedRequest(
        url: url,
        method: 'PATCH',
        token: token,
        headers: {'Content-Type': 'application/json', 'X-User-ID': userId},
        body: isAdvice ? jsonEncode({'userId': userId, 'hide': true}) : null,
        timeout: const Duration(seconds: 10),
      );

      // Use context safely after async gap
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleHideResponse(localContext, response, messageId);
      });
    } catch (error, stackTrace) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _handleHideError(localContext, error, stackTrace, messageId);
        _showSnackBar(localContext, 'Deleted locally (sync failed)');
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
      //AppLogger.info('✅ Message successfully Deleted on server: $messageId');

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

      //AppLogger.info('❌ Server Delete failed: ${response.statusCode}');

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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    try {
      if (mounted && ScaffoldMessenger.of(context).mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: theme.colorScheme.surface,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      //AppLogger.info('Error showing snackbar: $e');
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
      //AppLogger.info('🔄 ChatBubble updated: ${widget.message.id}');
    }
  }

  String _formatDateTime(DateTime dateTime) {
    // Convert UTC to local time zone
    final localDateTime = dateTime.toLocal();

    // Format with AM/PM for better readability
    final hour = localDateTime.hour;
    final minute = localDateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

    return '${localDateTime.day}/${localDateTime.month}/${localDateTime.year} $hour12:${minute.toString().padLeft(2, '0')} $period';
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Message not available',
        style: TextStyle(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          fontSize: 14,
        ),
      ),
    );
  }

  BubbleConfig _getBubbleConfig(Message message) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);
    final isDark = theme.brightness == Brightness.dark;

    Color bubbleColor;
    IconData? icon;
    String? type;
    String? title;

    if (message.isMe) {
      // User messages - use theme primary color
      bubbleColor =
          isDark ? AppColors.userBubble : AppColors.userBubbleLightMode;
    } else if (message.isClarification) {
      // Clarification messages - use theme colors
      bubbleColor =
          isDark
              ? AppColors.clarificationBubble
              : AppColors.clarificationBubbleLightMode;
    } else if (message.isAdvice) {
      // Advice messages - use theme colors
      bubbleColor =
          isDark ? AppColors.adviceBubble : AppColors.adviceBubbleLightMode;
      icon = Icons.tips_and_updates_outlined;
      type = message.type;
      title = message.title;
    } else {
      // AI/System messages - use theme colors
      bubbleColor = isDark ? AppColors.aiBubble : AppColors.aiBubbleLightMode;
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
        maxWidth: MediaQuery.of(context).size.width * 0.86,
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
                  blurRadius: 1,
                  spreadRadius: 0.5,
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

    return shouldShow;
  }

  Widget _buildRelatedQuestionPreview() {
    final questionText = widget.relatedQuestionText!;
    final maxLength = 60;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

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
            Icons.reply,
            size: 14,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              displayText,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
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

  Widget _buildProfessionalGreeting(Message message) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Professional salutation with error boundary
          _buildCustomerGreeting(theme),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildCustomerGreeting(ThemeData theme) {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final customerName = _getCustomerName(profileProvider);

      return Text(
        'Dear $customerName,',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      );
    } catch (e) {
      //AppLogger.info('Error building customer greeting: $e');
      // Fallback greeting
      return Text(
        'Dear Valued Customer,',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      );
    }
  }

  String _getCustomerName(ProfileProvider profileProvider) {
    // Check if profile provider is properly initialized and has data
    if (!profileProvider.isInitialized) {
      //AppLogger.info('🔄 ProfileProvider not initialized yet');
      return 'Valued Customer';
    }

    final userName = profileProvider.name;
    //AppLogger.info('👤 Current user name from provider: "$userName"');

    // If name is null or empty, use fallback
    if (userName == null || userName.isEmpty) {
      //AppLogger.info('❌ User name is null or empty');
      return 'Valued Customer';
    }

    // Check if it's a default/generic name (be less strict)
    final lowerName = userName.toLowerCase();
    if (lowerName == 'user' ||
        lowerName.contains('user') ||
        lowerName == 'valued customer' ||
        lowerName == 'default user') {
      //AppLogger.info('⚠️ Using generic name: "$userName"');
      return 'Valued Customer';
    }

    // More reasonable length check
    if (userName.isEmpty || userName.length > 100) {
      //AppLogger.info('❌ User name length invalid: ${userName.length}');
      return 'Valued Customer';
    }

    // Allow more characters in names (international names, etc.)
    final validNameRegex = RegExp(r"^[\p{L}\p{M}\s.\-']+$", unicode: true);
    if (!validNameRegex.hasMatch(userName)) {
      //AppLogger.info('❌ User name contains invalid characters: "$userName"');
      return 'Valued Customer';
    }

    //AppLogger.info('✅ Using valid user name: "$userName"');
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'deleting...',
            style: TextStyle(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

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
                  Icon(config.icon, size: 16, color: theme.colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    config.type!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
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
                    color: theme.colorScheme.primary,
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

    try {
      final textSpans = _parseHtmlWithDictionaryHighlighting(message);
      return RichText(text: TextSpan(children: textSpans));
    } catch (e) {
      //AppLogger.info('❌ HTML parsing error: $e');
      return _buildFallbackWithHighlighting(message);
    }
  }

  List<TextSpan> _parseHtmlWithDictionaryHighlighting(Message message) {
    final List<TextSpan> spans = [];
    final textColor = _getTextColor(message);

    // Stack to manage nested styles
    final styleStack = <TextStyle>[
      TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.normal),
    ];

    final regex = RegExp(r'(<[^>]+>|[^<]+)');
    final matches = regex.allMatches(message.text);

    for (final match in matches) {
      final content = match.group(0)!;

      if (content.startsWith('<') && content.endsWith('>')) {
        // Handle HTML tags
        if (content.startsWith('</')) {
          // Closing tag - pop style
          if (styleStack.length > 1) {
            styleStack.removeLast();
          }
        } else {
          // Opening tag - push new style
          final newStyle = _getStyleForHtmlTag(styleStack.last, content);
          styleStack.add(newStyle);
        }
      } else if (content.trim().isNotEmpty) {
        // Text content - apply dictionary highlighting with current style
        final currentStyle = styleStack.last;
        final textSpan = DictionaryHighlighter.highlightText(
          context,
          content,
          widget.dictionaryMap,
          currentStyle,
        );
        spans.add(textSpan);
      }

      // Add line breaks for paragraphs
      if (content == '</p>') {
        spans.add(const TextSpan(text: '\n\n'));
      } else if (content == '<br>') {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return spans;
  }

  TextStyle _getStyleForHtmlTag(TextStyle currentStyle, String tag) {
    TextStyle newStyle = currentStyle;

    // Handle opening tags only (ignore closing tags here)
    if (!tag.startsWith('</')) {
      // Bold tags
      if (tag == '<strong>' ||
          tag == '<b>' ||
          tag.startsWith('<strong ') ||
          tag.startsWith('<b ')) {
        newStyle = newStyle.copyWith(fontWeight: FontWeight.bold);
      }
      // Italic tags
      else if (tag == '<em>' ||
          tag == '<i>' ||
          tag.startsWith('<em ') ||
          tag.startsWith('<i ')) {
        newStyle = newStyle.copyWith(fontStyle: FontStyle.italic);
      }
      // Underline tags
      else if (tag == '<u>' || tag.startsWith('<u ')) {
        newStyle = newStyle.copyWith(decoration: TextDecoration.underline);
      }
      // Strikethrough tags
      else if (tag == '<s>' ||
          tag == '<strike>' ||
          tag.startsWith('<s ') ||
          tag.startsWith('<strike ')) {
        newStyle = newStyle.copyWith(decoration: TextDecoration.lineThrough);
      }
      // Code/monospace tags
      else if (tag == '<code>' ||
          tag == '<tt>' ||
          tag.startsWith('<code ') ||
          tag.startsWith('<tt ')) {
        newStyle = newStyle.copyWith(
          fontFamily: 'monospace',
          backgroundColor: Colors.grey[100],
        );
      }
      // Heading tags (h1-h6)
      else if (tag.startsWith('<h1') || tag == '<h1>') {
        newStyle = newStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
      } else if (tag.startsWith('<h2') || tag == '<h2>') {
        newStyle = newStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);
      } else if (tag.startsWith('<h3') || tag == '<h3>') {
        newStyle = newStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold);
      } else if (tag.startsWith('<h4') || tag == '<h4>') {
        newStyle = newStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold);
      } else if (tag.startsWith('<h5') || tag == '<h5>') {
        newStyle = newStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold);
      } else if (tag.startsWith('<h6') || tag == '<h6>') {
        newStyle = newStyle.copyWith(fontSize: 12, fontWeight: FontWeight.bold);
      }
      // Span tags with color
      else if (tag.startsWith('<span')) {
        // Force normal weight for spans unless explicitly styled otherwise
        newStyle = newStyle.copyWith(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        );

        final styleMatch = RegExp(r'style="([^"]*)"').firstMatch(tag);
        if (styleMatch != null) {
          newStyle = _applyAllSpanStyles(newStyle, styleMatch.group(1)!);
        }
      }
      // Paragraph - reset to base style
      else if (tag == '<p>') {
        newStyle = TextStyle(
          color: _getTextColor(widget.message),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
        );
      }
      // Blockquote
      else if (tag == '<blockquote>' || tag.startsWith('<blockquote')) {
        newStyle = newStyle.copyWith(
          fontStyle: FontStyle.italic,
          color: _getTextColor(widget.message).withValues(alpha: 0.7),
        );
      }
      // Line break - no style change
      else if (tag == '<br>' || tag == '<br/>' || tag == '<br />') {
        // No style change
      }
      // Other tags that should not affect style
      else if (tag == '<ul>' ||
          tag == '<ol>' ||
          tag == '<li>' ||
          tag == '<hr>' ||
          tag == '<hr/>' ||
          tag == '<hr />') {
        // No style change
      }
      // Comments - no style change
      else if (tag.startsWith('<!--')) {
        // No style change
      }
    }
    // Handle closing tags
    else {
      if (tag == '</strong>' || tag == '</b>') {
        newStyle = newStyle.copyWith(fontWeight: FontWeight.normal);
      } else if (tag == '</em>' || tag == '</i>') {
        newStyle = newStyle.copyWith(fontStyle: FontStyle.normal);
      } else if (tag == '</u>') {
        newStyle = newStyle.copyWith(decoration: TextDecoration.none);
      } else if (tag == '</s>' || tag == '</strike>') {
        newStyle = newStyle.copyWith(decoration: TextDecoration.none);
      } else if (tag == '</code>' || tag == '</tt>') {
        newStyle = newStyle.copyWith(fontFamily: null, backgroundColor: null);
      } else if (tag == '</h1>' ||
          tag == '</h2>' ||
          tag == '</h3>' ||
          tag == '</h4>' ||
          tag == '</h5>' ||
          tag == '</h6>') {
        // Reset to base style after headings
        newStyle = TextStyle(
          color: _getTextColor(widget.message),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        );
      } else if (tag == '</span>') {
        newStyle = newStyle.copyWith(
          color: _getTextColor(widget.message),
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none,
        );
      } else if (tag == '</blockquote>') {
        newStyle = newStyle.copyWith(
          fontStyle: FontStyle.normal,
          color: _getTextColor(widget.message),
        );
      }
    }

    return newStyle;
  }

  TextStyle _applyAllSpanStyles(TextStyle baseStyle, String style) {
    TextStyle result = baseStyle;

    // Extract and apply multiple CSS properties from span style
    final properties = style.split(';');

    for (final property in properties) {
      final trimmed = property.trim();
      if (trimmed.isEmpty) continue;

      final parts = trimmed.split(':');
      if (parts.length != 2) continue;

      final propName = parts[0].trim();
      final propValue = parts[1].trim();

      switch (propName) {
        case 'color':
          final color = _extractColorFromStyle(propValue);
          if (color != null) {
            result = result.copyWith(color: color);
          }
          break;
        case 'font-weight':
          if (propValue == 'bold' ||
              propValue == 'bolder' ||
              propValue == '700') {
            result = result.copyWith(fontWeight: FontWeight.bold);
          } else if (propValue == 'normal' || propValue == '400') {
            result = result.copyWith(fontWeight: FontWeight.normal);
          }
          break;
        case 'font-style':
          if (propValue == 'italic') {
            result = result.copyWith(fontStyle: FontStyle.italic);
          } else if (propValue == 'normal') {
            result = result.copyWith(fontStyle: FontStyle.normal);
          }
          break;
        case 'text-decoration':
          if (propValue == 'underline') {
            result = result.copyWith(decoration: TextDecoration.underline);
          } else if (propValue == 'line-through') {
            result = result.copyWith(decoration: TextDecoration.lineThrough);
          } else if (propValue == 'none') {
            result = result.copyWith(decoration: TextDecoration.none);
          }
          break;
        case 'background-color':
          final bgColor = _extractColorFromStyle(propValue);
          if (bgColor != null) {
            result = result.copyWith(backgroundColor: bgColor);
          }
          break;
        case 'font-size':
          // Basic font size support (you can enhance this)
          if (propValue.endsWith('px')) {
            final size = double.tryParse(propValue.replaceAll('px', ''));
            if (size != null) {
              result = result.copyWith(fontSize: size);
            }
          }
          break;
      }
    }

    return result;
  }

  Color? _extractColorFromStyle(String style) {
    // Parse RGB color
    final rgbMatch = RegExp(
      r'color:\s*rgb\((\d+),\s*(\d+),\s*(\d+)\)',
    ).firstMatch(style);
    if (rgbMatch != null) {
      final r = int.parse(rgbMatch.group(1)!);
      final g = int.parse(rgbMatch.group(2)!);
      final b = int.parse(rgbMatch.group(3)!);
      return Color.fromRGBO(r, g, b, 1);
    }

    // Parse HEX color
    final hexMatch = RegExp(r'color:\s*#([0-9a-fA-F]{6})').firstMatch(style);
    if (hexMatch != null) {
      final hexColor = hexMatch.group(1)!;
      return Color(int.parse('0xFF$hexColor'));
    }

    return null;
  }

  Widget _buildFallbackWithHighlighting(Message message) {
    final plainText = _stripHtmlTags(message.text);
    final baseStyle = TextStyle(
      color: _getTextColor(message),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

    final highlightedText = DictionaryHighlighter.highlightText(
      context,
      plainText,
      widget.dictionaryMap,
      baseStyle,
    );

    return RichText(text: highlightedText);
  }

  // Update the _buildAdminInfo method
  // ✅ SIMPLIFY _buildAdminInfo - No FutureBuilder!
  Widget _buildAdminInfo() {
    final message = widget.message;

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

    return _buildAdminCard(
      adminImage: adminImage,
      adminName: adminName,
      isLoading: false, // ✅ No loading state since we preload
      hasError: false,
      hasData: hasValidCachedData || message.adminImage != null,
    );
  }

  Widget _buildAdminCard({
    required String adminImage,
    required String adminName,
    required bool isLoading,
    required bool hasError,
    required bool hasData,
  }) {
    final message = widget.message;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    final Color textColor =
        message.isMe
            ? theme.colorScheme.onPrimary.withValues(alpha: 0.7)
            : _getSecondaryTextColor(message);

    final Color backgroundColor =
        message.isMe
            ? theme.colorScheme.onPrimary.withValues(alpha: 0.15)
            : theme.colorScheme.surfaceContainerHighest;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToAstrologerDetail(context, widget.message),
        borderRadius: BorderRadius.circular(12),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  message.isMe
                      ? theme.colorScheme.onPrimary.withValues(alpha: 0.2)
                      : theme.dividerColor,
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
                    color: textColor.withValues(alpha: 0.6),
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    if (isLoading) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      );
    }

    if (hasError) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_outline_rounded,
          size: 16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      );
    }

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.colorScheme.onPrimary.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
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
                color: theme.colorScheme.surfaceContainerHighest,
                child: Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
          errorWidget:
              (context, url, error) => Container(
                color: theme.colorScheme.surfaceContainerHighest,
                child: Icon(
                  Icons.person_rounded,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

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
                        color: textColor.withAlpha((0.3 * 255).toInt()),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                    : Text(
                      adminName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
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

  Color _getTextColor(Message message) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);
    final isDark = theme.brightness == Brightness.dark;

    if (message.isMe) {
      // User bubble - ensure good contrast with both dark and light backgrounds
      return isDark ? Colors.white : AppColors.textPrimaryLight;
    } else if (message.isAdvice) {
      // Advice bubble - gold-themed, use dark text for better readability
      return isDark ? AppColors.textPrimary : Color(0xFF1C1C1C);
    } else if (message.isClarification) {
      // Clarification bubble
      return isDark ? AppColors.textPrimary : AppColors.textPrimaryLight;
    } else {
      // AI bubble
      return isDark ? AppColors.textPrimary : AppColors.textPrimaryLight;
    }
  }

  Color _getSecondaryTextColor(Message message) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);
    final isDark = theme.brightness == Brightness.dark;

    if (message.isMe) {
      return isDark
          ? Colors.white.withValues(alpha: 0.8)
          : AppColors.textSecondaryLight;
    } else {
      return isDark ? AppColors.textSecondary : AppColors.textSecondaryLight;
    }
  }

  Widget _buildTimestamp(String text) {
    final message = widget.message;
    final textColor = _getSecondaryTextColor(message);

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(text, style: TextStyle(fontSize: 12, color: textColor)),
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
