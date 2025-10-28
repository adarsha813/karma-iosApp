import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/email_service.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import '../utils/security_utils.dart';
import '../utils/validation_utils.dart';
import '../services/analytical_service.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: true,
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
    final l10n = AppLocalizations.of(context)!;

    // Security: Validate form before proceeding
    if (!_formKey.currentState!.validate()) {
      _logAnalyticsEvent('form_validation_failed');
      return;
    }

    // Security: Rate limiting and anti-spam checks
    if (!_canSubmit()) {
      _showRateLimitDialog(l10n);
      return;
    }

    // Security: Input sanitization
    final name = SecurityUtils.sanitizeInput(_nameController.text.trim());
    final email = SecurityUtils.sanitizeInput(_emailController.text.trim());
    final message = SecurityUtils.sanitizeInput(_messageController.text.trim());

    // Additional validation
    if (!ValidationUtils.isValidEmail(email)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.enterValidEmail)));
      return;
    }

    if (name.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid name (at least 2 characters)'),
        ),
      );
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

      final success = await EmailService.sendEmail(
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

      if (success) {
        _logAnalyticsEvent('email_sent_successfully');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.emailSentSuccess),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );

        // Clear form after successful submission
        _resetForm();
      } else {
        _logAnalyticsEvent('email_send_failed');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.emailSendFailed),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } on TimeoutException catch (e, stackTrace) {
      _logError('Email sending timeout', stackTrace, context: 'sendEmail');

      setState(() => _isSending = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request timeout. Please try again.'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e, stackTrace) {
      _logError('Email sending failed: $e', stackTrace, context: 'sendEmail');

      setState(() => _isSending = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showRateLimitDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (context) => AlertDialog(
            title: const Text('Rate Limit'),
            content: Text(
              _submissionAttempts >= _maxSubmissionAttempts
                  ? 'Maximum submission attempts reached. Please try again later.'
                  : 'Please wait before sending another message.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
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

  Widget _buildHeroSection(AppLocalizations l10n, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.supportHeroTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.supportHeroDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(AppLocalizations l10n, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
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
                decoration: InputDecoration(
                  labelText: l10n.yourName,
                  prefixIcon: const Icon(Icons.person_outline),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade50,
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
                decoration: InputDecoration(
                  labelText: l10n.yourEmail,
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade50,
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
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: l10n.message,
                  prefixIcon: const Icon(Icons.message_outlined),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  alignLabelWithHint: true,
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
                    }) => Text('$currentLength/$maxLength'),
              ),
              const SizedBox(height: 24),

              // Security notice
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    Icon(Icons.security, size: 16, color: Colors.blue.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Your information is secure and encrypted',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade700,
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
                        icon: const Icon(Icons.clear),
                        label: const Text('Clear Form'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                                  color: Colors.white,
                                ),
                              )
                              : const Icon(Icons.send_outlined),
                      label: Text(_isSending ? l10n.sending : l10n.send),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

  Widget _buildContactInfo(AppLocalizations l10n, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
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
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.contact_support_outlined,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Alternative Contact',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              icon: Icons.email_outlined,
              label: 'Email',
              value: 'support@yourapp.com',
              onTap: () {
                _logAnalyticsEvent('support_email_tapped');
                // Implementation for launching email client
              },
              context: context,
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: '+1-555-SUPPORT',
              onTap: () {
                _logAnalyticsEvent('support_phone_tapped');
                // Implementation for launching phone dialer
              },
              context: context,
            ),
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
    required BuildContext context,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: onTap != null ? Colors.grey.shade50 : null,
            borderRadius: BorderRadius.circular(8),
            border:
                onTap != null ? Border.all(color: Colors.grey.shade200) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color:
                    onTap != null
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade600,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            onTap != null
                                ? Colors.black87
                                : Colors.grey.shade600,
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
                  color: Colors.grey.shade500,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(l10n.customerSupport),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeroSection(l10n, context),
            const SizedBox(height: 24),
            _buildFormSection(l10n, context),
            const SizedBox(height: 24),
            _buildContactInfo(l10n, context),
            const SizedBox(height: 20),

            // Footer with additional info
            Text(
              'Typically respond within 24 hours',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
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
