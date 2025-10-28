import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/profile_provider.dart';
import 'profile_settings_screen.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';

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

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final _nameController = TextEditingController();
  final _secretController = TextEditingController();

  DateTime? _selectedDob;
  TimeOfDay? _selectedTime;

  bool _isLoading = false;

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  Completer<void>? _recoveryCompleter;

  @override
  void initState() {
    super.initState();
    _logAnalyticsEvent('recovery_screen_opened');
  }

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  void _reportError(dynamic error, StackTrace stackTrace, {String? context}) {
    _logger.e('🚨 Error in $context', error: error, stackTrace: stackTrace);

    if (Environment.isProduction) {
      // Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  String _getLocalizedError(String errorKey, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (errorKey) {
      case 'missing_fields':
        return l10n?.allFieldsRequired ?? 'All fields are required';
      case 'network_error':
        return l10n?.networkError ?? 'Network error occurred';
      case 'timeout_error':
        return l10n?.timeoutError ?? 'Request timed out';
      case 'recovery_failed':
        return l10n?.recoveryFailed ?? 'Account recovery failed';
      case 'invalid_data':
        return l10n?.genericError ?? 'Invalid data provided';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _pickDate() async {
    _logAnalyticsEvent('date_picker_opened');

    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: AppLocalizations.of(context)!.birthDateLabel,
      cancelText: AppLocalizations.of(context)!.cancelButton,
      confirmText: AppLocalizations.of(context)!.confirmButton,
    );

    if (picked != null) {
      _logAnalyticsEvent('date_selected', params: {'date': picked.toString()});
      setState(() => _selectedDob = picked);
    } else {
      _logAnalyticsEvent('date_selection_cancelled');
    }
  }

  Future<void> _pickTime() async {
    _logAnalyticsEvent('time_picker_opened');

    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 0),
      helpText: AppLocalizations.of(context)!.birthTimeLabel,
      cancelText: AppLocalizations.of(context)!.cancelButton,
      confirmText: AppLocalizations.of(context)!.confirmButton,
    );

    if (picked != null) {
      _logAnalyticsEvent(
        'time_selected',
        params: {'hour': picked.hour, 'minute': picked.minute},
      );
      setState(() => _selectedTime = picked);
    } else {
      _logAnalyticsEvent('time_selection_cancelled');
    }
  }

  bool _validateInputs() {
    final name = _nameController.text.trim();
    final secret = _secretController.text.trim();

    if (name.isEmpty ||
        secret.isEmpty ||
        _selectedDob == null ||
        _selectedTime == null) {
      return false;
    }

    // Validate name length
    if (name.length < 2 || name.length > 100) {
      return false;
    }

    // Validate secret length
    if (secret.length < 4 || secret.length > 50) {
      return false;
    }

    // Validate date is not in future
    if (_selectedDob!.isAfter(DateTime.now())) {
      return false;
    }

    return true;
  }

  Future<void> _recoverAccountWithRetry() async {
    _logger.d('Starting account recovery with retry logic');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _recoverAccount();
        _logger.i('✅ Account recovery successful on attempt $attempt');
        return;
      } catch (e, stackTrace) {
        _logger.w(
          '❌ Attempt $attempt failed to recover account',
          error: e,
          stackTrace: stackTrace,
        );

        if (attempt == _maxRetries) {
          _logger.e('💥 All $attempt attempts failed to recover account');
          rethrow;
        }

        // Exponential backoff
        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  Future<void> _recoverAccount() async {
    if (!_validateInputs()) {
      _showErrorSnackBar(_getLocalizedError('missing_fields', context));
      return;
    }

    setState(() => _isLoading = true);
    _recoveryCompleter = Completer<void>();
    _logAnalyticsEvent('recovery_attempt_started');

    final name = _nameController.text.trim();
    final secret = _secretController.text.trim();

    final dobStr =
        "${_selectedDob!.year.toString().padLeft(4, '0')}-"
        "${_selectedDob!.month.toString().padLeft(2, '0')}-"
        "${_selectedDob!.day.toString().padLeft(2, '0')}";

    final timeStr =
        "${_selectedTime!.hour.toString().padLeft(2, '0')}:"
        "${_selectedTime!.minute.toString().padLeft(2, '0')}:00";

    try {
      final response = await http
          .post(
            Uri.parse("${Environment.baseUrl}/users/recover"),
            headers: Environment.securityHeaders,
            body: jsonEncode({
              "name": name,
              "dob": dobStr,
              "timeOfBirth": timeStr,
              "recoverySecret": secret,
            }),
          )
          .timeout(_apiTimeout);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final data = jsonDecode(responseBody);

        // Validate response structure
        if (data is! Map<String, dynamic> ||
            data['userId'] == null ||
            data['recoveryToken'] == null) {
          throw const FormatException('Invalid response format from server');
        }

        final userId = data['userId'].toString();
        final token = data['recoveryToken'].toString();

        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );

        // Save credentials securely
        await profileProvider.saveUserId(userId);
        await profileProvider.saveToken(token);

        _logAnalyticsEvent(
          'recovery_success',
          params: {'user_id': userId, 'has_token': token.isNotEmpty},
        );

        _showSuccessSnackBar(
          AppLocalizations.of(context)!.accountRecoveredSuccess,
        );

        // Navigate back with recovered user ID
        if (mounted) {
          Navigator.pop(context, userId);
        }

        _recoveryCompleter?.complete();
      } else if (response.statusCode == 404) {
        _logAnalyticsEvent('recovery_failed_not_found');
        _showErrorSnackBar(AppLocalizations.of(context)!.recoveryFailed);
      } else if (response.statusCode == 400) {
        _logAnalyticsEvent('recovery_failed_invalid_data');
        _showErrorSnackBar(_getLocalizedError('invalid_data', context));
      } else {
        _logAnalyticsEvent(
          'recovery_failed_server_error',
          params: {'status_code': response.statusCode},
        );
        _showErrorSnackBar(_getLocalizedError('recovery_failed', context));
      }
    } on TimeoutException {
      _logger.e('⏰ Account recovery timeout');
      _logAnalyticsEvent('recovery_timeout');
      if (mounted) {
        _showErrorSnackBar(_getLocalizedError('timeout_error', context));
      }
    } on FormatException catch (e) {
      _logger.e('📄 Response format error: $e');
      _logAnalyticsEvent('recovery_format_error');
      if (mounted) {
        _showErrorSnackBar(_getLocalizedError('invalid_data', context));
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'account_recovery');
      _logAnalyticsEvent(
        'recovery_unexpected_error',
        params: {'error': e.toString()},
      );
      if (mounted) {
        _showErrorSnackBar(_getLocalizedError('network_error', context));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      _recoveryCompleter?.complete();
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildNameField(AppLocalizations l10n) {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: l10n.nameLabel,
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        _logAnalyticsEvent(
          'name_field_changed',
          params: {'text_length': value.length},
        );
      },
    );
  }

  Widget _buildDateField(AppLocalizations l10n) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(
          Icons.calendar_today,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          _selectedDob == null
              ? l10n.birthDatePlaceholder
              : "${l10n.birthDateLabel}: ${_selectedDob!.day}-${_selectedDob!.month}-${_selectedDob!.year}",
          style: TextStyle(
            color: _selectedDob == null ? Colors.grey : Colors.black87,
            fontWeight:
                _selectedDob == null ? FontWeight.normal : FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: _pickDate,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildTimeField(AppLocalizations l10n) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.access_time, color: Theme.of(context).primaryColor),
        title: Text(
          _selectedTime == null
              ? l10n.birthTimePlaceholder
              : "${l10n.birthTimeLabel}: ${_selectedTime!.format(context)}",
          style: TextStyle(
            color: _selectedTime == null ? Colors.grey : Colors.black87,
            fontWeight:
                _selectedTime == null ? FontWeight.normal : FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: _pickTime,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildSecretField(AppLocalizations l10n) {
    return TextField(
      controller: _secretController,
      decoration: InputDecoration(
        labelText: l10n.recoverySecretLabel,
        prefixIcon: const Icon(Icons.security),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade50,
        hintText: l10n.recoverySecretHint,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        _logAnalyticsEvent(
          'secret_field_changed',
          params: {'text_length': value.length},
        );
      },
      onSubmitted: (_) {
        if (!_isLoading && _validateInputs()) {
          _recoverAccountWithRetry();
        }
      },
    );
  }

  Widget _buildRecoveryButton(AppLocalizations l10n) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _recoverAccountWithRetry,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child:
          _isLoading
              ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
              : Text(
                l10n.recoverAccount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
    );
  }

  Widget _buildNewUserLink(AppLocalizations l10n) {
    return Center(
      child: TextButton(
        onPressed:
            _isLoading
                ? null
                : () {
                  _logAnalyticsEvent('new_user_navigation');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileSettingsScreen(),
                    ),
                  );
                },
        child: Text(
          l10n.onboardingNewUser,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: _isLoading ? Colors.grey : Colors.blue,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _secretController.dispose();
    _recoveryCompleter?.completeError('Screen disposed');
    _logAnalyticsEvent(
      'recovery_screen_closed',
      params: {
        'recovery_attempted': _isLoading,
        'has_date': _selectedDob != null,
        'has_time': _selectedTime != null,
      },
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recoverAccount),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _isLoading ? null : () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              const SizedBox(height: 20),
              Icon(
                Icons.account_circle_outlined,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.recoverAccountDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Form fields
              _buildNameField(l10n),
              const SizedBox(height: 16),
              _buildDateField(l10n),
              const SizedBox(height: 16),
              _buildTimeField(l10n),
              const SizedBox(height: 16),
              _buildSecretField(l10n),
              const SizedBox(height: 32),

              // Recovery button
              _buildRecoveryButton(l10n),
              const SizedBox(height: 24),

              // New user link
              _buildNewUserLink(l10n),
            ],
          ),
        ),
      ),
    );
  }
}
