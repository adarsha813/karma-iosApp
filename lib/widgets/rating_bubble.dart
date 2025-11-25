import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this
import '../config/security_config.dart';
import '../services/error_reporting_service.dart';
import '../services/rate_limiting_service.dart';
import '../providers/theme_provider.dart'; // Add this import

class RatingBubble extends StatefulWidget {
  final String questionId;
  final int? initialRating;
  final bool isAdvice;
  final String? initialFeedback;
  final Future<void> Function(String questionId, int rating, String? feedback)
  onRatingSubmitted;

  const RatingBubble({
    super.key,
    required this.questionId,
    required this.initialRating,
    required this.initialFeedback,
    required this.onRatingSubmitted,
    required this.isAdvice,
  });

  @override
  RatingBubbleState createState() => RatingBubbleState();
}

class RatingBubbleState extends State<RatingBubble>
    with TickerProviderStateMixin {
  late int? _selectedRating;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String? _feedback;
  final TextEditingController _feedbackController = TextEditingController();
  bool _isSubmitting = false;
  bool _hasSubmittedFeedback = false;

  // 🔒 Security & Rate Limiting
  final RateLimitingService _rateLimiter = RateLimitingService();
  static const Duration _ratingCooldown = Duration(seconds: 1);
  final FocusNode _feedbackFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeState();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _initializeState() {
    _selectedRating = widget.initialRating;
    _feedback = widget.initialFeedback;
    _hasSubmittedFeedback =
        widget.initialFeedback != null && widget.initialFeedback!.isNotEmpty;

    if (_feedback != null) {
      _feedbackController.text = _feedback!;
    }
  }

  @override
  void didUpdateWidget(covariant RatingBubble oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialRating != oldWidget.initialRating ||
        widget.initialFeedback != oldWidget.initialFeedback) {
      _updateStateFromWidget();
    }
  }

  void _updateStateFromWidget() {
    if (mounted) {
      setState(() {
        _selectedRating = widget.initialRating;
        _feedback = widget.initialFeedback;
        if (_feedback != null) {
          _feedbackController.text = _feedback!;
        }
        _hasSubmittedFeedback = _feedback?.isNotEmpty ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return Container(
      margin: const EdgeInsets.only(top: 1),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStarRatingRow(theme),
          if (_shouldShowFeedbackSection()) ..._buildFeedbackSection(),
        ],
      ),
    );
  }

  Widget _buildStarRatingRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [1, 2, 3].map((star) => _buildStar(star, theme)).toList(),
    );
  }

  Widget _buildStar(int star, ThemeData theme) {
    return GestureDetector(
      onTap: () => _handleStarTap(star),
      child: ScaleTransition(
        scale:
            _selectedRating == star
                ? _scaleAnimation
                : const AlwaysStoppedAnimation(1.0),
        child: Icon(Icons.star, size: 32, color: _getStarColor(star, theme)),
      ),
    );
  }

  Color _getStarColor(int star, ThemeData theme) {
    if (_selectedRating != null && star <= _selectedRating!) {
      return theme
          .colorScheme
          .primary; // Use theme primary color for selected stars
    }
    return theme.colorScheme.onSurface.withOpacity(
      0.3,
    ); // Use theme color for unselected stars
  }

  bool _shouldShowFeedbackSection() {
    return _selectedRating == 1 && !_hasSubmittedFeedback;
  }

  List<Widget> _buildFeedbackSection() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return [
      const SizedBox(height: 12),
      _buildFeedbackPrompt(theme),
      const SizedBox(height: 8),
      _buildFeedbackTextField(theme),
      const SizedBox(height: 8),
      _buildSubmitButton(theme),
    ];
  }

  Widget _buildFeedbackPrompt(ThemeData theme) {
    return Text(
      "We're sorry you didn't like this answer. Please tell us how we can improve:",
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildFeedbackTextField(ThemeData theme) {
    return TextField(
      controller: _feedbackController,
      focusNode: _feedbackFocusNode,
      maxLines: 3,
      maxLength: SecurityConfig.maxFeedbackLength,
      decoration: InputDecoration(
        hintText: 'Your feedback...',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        fillColor: theme.colorScheme.surfaceVariant,
        filled: true,
        counterText: '',
        counterStyle: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
      onChanged: _onFeedbackChanged,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _submitFeedback(),
    );
  }

  Widget _buildSubmitButton(ThemeData theme) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            theme
                .colorScheme
                .error, // Use theme error color for negative feedback
        foregroundColor: theme.colorScheme.onError,
        minimumSize: const Size(double.infinity, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: _isSubmitting ? null : _submitFeedback,
      child:
          _isSubmitting
              ? _buildLoadingIndicator(theme)
              : Text(
                'Submit Feedback',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onError,
                ),
              ),
    );
  }

  Widget _buildLoadingIndicator(ThemeData theme) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: theme.colorScheme.onError,
      ),
    );
  }

  void _onFeedbackChanged(String value) {
    _feedback = value.trim();
  }

  void _handleStarTap(int star) {
    // 🔒 Rate limiting
    if (!_rateLimiter.isActionAllowed('starRating', _ratingCooldown)) {
      _showSnackBar('Please wait before rating again');
      return;
    }

    if (!_validateRatingInput(star)) {
      _logSecurityEvent('InvalidRatingAttempt', {'star': star});
      return;
    }

    _updateRatingState(star);
    _triggerStarAnimation();

    if (star != 1 || _hasSubmittedFeedback) {
      _submitRating(star);
    }
  }

  bool _validateRatingInput(int star) {
    return star >= 1 && star <= 3;
  }

  void _updateRatingState(int star) {
    if (mounted) {
      setState(() {
        _selectedRating = star;
        if (star != 1) {
          _feedback = null;
          _feedbackController.clear();
          _hasSubmittedFeedback = false;
        }
      });
    }
  }

  void _triggerStarAnimation() {
    _controller.forward(from: 0);
  }

  Future<void> _submitRating(int star) async {
    try {
      await widget.onRatingSubmitted(
        widget.questionId,
        star,
        _hasSubmittedFeedback ? _feedback : null,
      );

      _logSecurityEvent('RatingSubmitted', {
        'questionId': widget.questionId,
        'rating': star,
        'isAdvice': widget.isAdvice,
      });
    } catch (error, stackTrace) {
      await _handleRatingError(error, stackTrace, star);
    }
  }

  Future<void> _submitFeedback() async {
    // 🔒 Rate limiting
    if (!_rateLimiter.isActionAllowed('feedbackSubmit', _ratingCooldown)) {
      _showSnackBar('Please wait before submitting feedback');
      return;
    }

    if (!_validateFeedback()) {
      _showSnackBar('Please enter your feedback');
      return;
    }

    await _performFeedbackSubmission();
  }

  bool _validateFeedback() {
    final feedback = _feedback?.trim() ?? '';
    return feedback.isNotEmpty &&
        feedback.length <= SecurityConfig.maxFeedbackLength;
  }

  Future<void> _performFeedbackSubmission() async {
    if (mounted) {
      setState(() => _isSubmitting = true);
    }

    _feedbackFocusNode.unfocus(); // Hide keyboard

    try {
      await widget.onRatingSubmitted(widget.questionId, 1, _feedback);

      if (mounted) {
        setState(() {
          _isSubmitting = false;
          _hasSubmittedFeedback = true;
        });
      }

      _logSecurityEvent('FeedbackSubmitted', {
        'questionId': widget.questionId,
        'feedbackLength': _feedback?.length ?? 0,
        'isAdvice': widget.isAdvice,
      });

      _showSnackBar('Thank you for your feedback!');
    } catch (error, stackTrace) {
      await _handleFeedbackError(error, stackTrace);
    } finally {
      if (mounted && _isSubmitting) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _handleRatingError(
    dynamic error,
    StackTrace stackTrace,
    int star,
  ) async {
    _logSecurityEvent('RatingSubmissionFailed', {
      'questionId': widget.questionId,
      'rating': star,
      'error': error.toString(),
    });

    await ErrorReportingService.reportError(error, stackTrace);

    if (mounted) {
      // Revert rating on error
      setState(() {
        _selectedRating = widget.initialRating;
      });
      _showSnackBar('Failed to submit rating. Please try again.');
    }
  }

  Future<void> _handleFeedbackError(
    dynamic error,
    StackTrace stackTrace,
  ) async {
    _logSecurityEvent('FeedbackSubmissionFailed', {
      'questionId': widget.questionId,
      'error': error.toString(),
    });

    await ErrorReportingService.reportError(error, stackTrace);

    if (mounted) {
      _showSnackBar('Failed to submit feedback. Please try again.');
    }
  }

  void _showSnackBar(String message) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _logSecurityEvent(String event, Map<String, dynamic> params) {
    debugPrint('🔒 Rating Security Event: $event - $params');
    // In production, send to analytics/security monitoring
    // AnalyticsService.logEvent(event, parameters: params);
  }

  @override
  void dispose() {
    _controller.dispose();
    _feedbackController.dispose();
    _feedbackFocusNode.dispose();
    super.dispose();
  }
}
