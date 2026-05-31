import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/email_service.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import '../utils/security_utils.dart';
import '../utils/validation_utils.dart';
import '../services/analytical_service.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class CustomerSupportPage extends StatefulWidget {
  const CustomerSupportPage({super.key});

  @override
  State<CustomerSupportPage> createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // Security and state management
  bool _isSending = false;
  bool _isFormTouched = false;
  DateTime? _lastSubmissionTime;
  int _submissionAttempts = 0;
  static const int _maxSubmissionAttempts = 3;
  static const Duration _submissionCooldown = Duration(minutes: 1);

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      AnalyticsService.logEvent(event, parameters: params);
    }
  }

  void _logError(String error, StackTrace stackTrace, {String? context}) {
    // Correctly pass error and stackTrace as named parameters
    _logger.e(
      '🚨 Error: $error - Context: $context',
      error: error,
      stackTrace: stackTrace,
    );

    if (Environment.isProduction) {
      AnalyticsService.logError(
        error,
        stackTrace: stackTrace,
        context: 'CustomerSupportPage: $context',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logAnalyticsEvent('customer_support_page_viewed');
    });
  }

  @override
  void dispose() {
    // Clean up controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Rate limiting and security checks
  bool _canSubmit() {
    final now = DateTime.now();

    // Check rate limiting
    if (_lastSubmissionTime != null) {
      final timeSinceLastSubmission = now.difference(_lastSubmissionTime!);
      if (timeSinceLastSubmission < _submissionCooldown) {
        return false;
      }
    }

    // Check maximum attempts
    if (_submissionAttempts >= _maxSubmissionAttempts) {
      return false;
    }

    return true;
  }

  Future<void> _sendEmail() async {
    // Capture l10n BEFORE async operations
    final l10n = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) {
      _logAnalyticsEvent('form_validation_failed');
      return;
    }

    if (!_canSubmit()) {
      _showRateLimitDialog(l10n);
      return;
    }

    final name = SecurityUtils.sanitizeInput(_nameController.text.trim());
    final email = SecurityUtils.sanitizeInput(_emailController.text.trim());
    final message = SecurityUtils.sanitizeInput(_messageController.text.trim());

    if (!ValidationUtils.isValidEmail(email)) {
      // Check mounted before showing snackbar
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.enterValidEmail)));
      }
      return;
    }

    if (name.length < 2) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid name (at least 2 characters)'),
          ),
        );
      }
      return;
    }

    setState(() => _isSending = true);

    try {
      _logAnalyticsEvent(
        'email_submission_attempted',
        params: {
          'email_length': email.length,
          'name_length': name.length,
          'message_length': message.length,
          'attempt_number': _submissionAttempts + 1,
        },
      );

      final result = await EmailService.sendEmail(
        name: name,
        email: email,
        message: message,
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Email sending timed out');
        },
      );

      setState(() {
        _isSending = false;
        _lastSubmissionTime = DateTime.now();
        _submissionAttempts++;
      });

      // Check mounted before any UI updates
      if (mounted) {
        final theme = Theme.of(context);

        if (result.success) {
          _logAnalyticsEvent('email_sent_successfully');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.emailSentSuccess,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              backgroundColor: theme.colorScheme.primary,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 4),
            ),
          );
          _resetForm();
        } else {
          _logAnalyticsEvent('email_send_failed');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                result.error ?? l10n.emailSendFailed,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onError,
                ),
              ),
              backgroundColor: theme.colorScheme.error,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    } on TimeoutException catch (e, stackTrace) {
      _logError('Email sending timeout', stackTrace, context: 'sendEmail');
      setState(() => _isSending = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Request timeout. Please try again.'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e, stackTrace) {
      _logError('Email sending failed: $e', stackTrace, context: 'sendEmail');
      setState(() => _isSending = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An unexpected error occurred. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showRateLimitDialog(AppLocalizations l10n) {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('Rate Limit'),
            content: Text(
              _submissionAttempts >= _maxSubmissionAttempts
                  ? 'Maximum submission attempts reached. Please try again later.'
                  : 'Please wait before sending another message.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    _formKey.currentState?.reset();
    setState(() => _isFormTouched = false);
  }

  void _onFieldChanged() {
    if (!_isFormTouched) {
      setState(() => _isFormTouched = true);
    }
  }

  // Enhanced validation methods
  String? _validateEmail(String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return l10n.enterEmail;
    }

    if (!ValidationUtils.isValidEmail(value.trim())) {
      return l10n.enterValidEmail;
    }

    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }

    // Additional security: Check for minimum length
    if (value.trim().length < 2) {
      return '$fieldName must be at least 2 characters';
    }

    // Security: Check for maximum length to prevent abuse
    if (value.trim().length > 500) {
      return '$fieldName is too long';
    }

    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a message';
    }

    if (value.trim().length < 10) {
      return 'Message must be at least 10 characters';
    }

    if (value.trim().length > 2000) {
      return 'Message is too long (maximum 2000 characters)';
    }

    // Security: Check for suspicious patterns
    if (SecurityUtils.containsSuspiciousPatterns(value)) {
      return 'Suspicious content detected in message';
    }

    return null;
  }

  Widget _buildHeroSection(ThemeData theme, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withAlpha((0.8 * 255).toInt()),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withAlpha((0.2 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.support_agent,
              size: 40,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.supportHeroTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.supportHeroDescription,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(ThemeData theme, AppLocalizations l10n) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: l10n.yourName,
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: theme.colorScheme.primary,
                  ),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) => _validateRequired(value, 'name'),
                onChanged: (_) => _onFieldChanged(),
                maxLength: 100,
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                controller: _emailController,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: l10n.yourEmail,
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: theme.colorScheme.primary,
                  ),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validateEmail,
                onChanged: (_) => _onFieldChanged(),
                maxLength: 254,
              ),
              const SizedBox(height: 20),

              // Message Field
              TextFormField(
                controller: _messageController,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: l10n.message,
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  prefixIcon: Icon(
                    Icons.message_outlined,
                    color: theme.colorScheme.primary,
                  ),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                validator: _validateMessage,
                onChanged: (_) => _onFieldChanged(),
                maxLength: 2000,
                buildCounter:
                    (
                      context, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) => Text(
                      '$currentLength/$maxLength',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 24),

              // Security notice
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.outline),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.security,
                      size: 16,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Your information is secure and encrypted',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              Row(
                children: [
                  // Clear Button
                  if (_isFormTouched) ...[
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _isSending ? null : _resetForm,
                        icon: Icon(
                          Icons.clear,
                          color: theme.colorScheme.primary,
                        ),
                        label: Text(
                          'Clear Form',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(color: theme.colorScheme.primary),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],

                  // Send Button
                  Expanded(
                    flex: _isFormTouched ? 1 : 2,
                    child: ElevatedButton.icon(
                      onPressed:
                          _isSending || !_canSubmit() ? null : _sendEmail,
                      icon:
                          _isSending
                              ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              )
                              : Icon(
                                Icons.send_outlined,
                                color: theme.colorScheme.onPrimary,
                              ),
                      label: Text(
                        _isSending ? l10n.sending : l10n.send,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(ThemeData theme, AppLocalizations l10n) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.contact_support_outlined,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Alternative Contact',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              icon: Icons.email_outlined,
              label: 'Email',
              value: 'care@karmalifepath.com',
              onTap: () {
                _logAnalyticsEvent('support_email_tapped');
                // Implementation for launching email client
              },
              theme: theme,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback? onTap,
    required ThemeData theme,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                onTap != null
                    ? theme.colorScheme.surfaceContainerHighest
                    : null,
            borderRadius: BorderRadius.circular(8),
            border:
                onTap != null
                    ? Border.all(color: theme.colorScheme.outline)
                    : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color:
                    onTap != null
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            onTap != null
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                        fontWeight:
                            onTap != null ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null) ...[
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(ThemeData theme, AppLocalizations l10n) {
    return AppBar(
      title: Text(l10n.customerSupport),
      centerTitle: true,
      backgroundColor: theme.appBarTheme.backgroundColor,
      foregroundColor: theme.appBarTheme.foregroundColor,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: _buildAppBar(theme, l10n),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeroSection(theme, l10n),
            const SizedBox(height: 24),
            _buildFormSection(theme, l10n),
            const SizedBox(height: 24),
            _buildContactInfo(theme, l10n),
            const SizedBox(height: 20),
            // Footer with additional info
            Text(
              'Typically respond within 24 hours',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
