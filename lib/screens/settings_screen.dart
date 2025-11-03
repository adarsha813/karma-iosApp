import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LocaleProvider.dart';
import 'package:kundali/screens/recovery_screen.dart';
import '../providers/notification_provider.dart';
import '../providers/profile_provider.dart';
import 'package:http/http.dart' as http;
import '../services/HoroscopeService.dart';
import '../services/chat_service.dart';
import 'package:kundali/screens/policy_page.dart';
import 'package:kundali/screens/profile_settings_screen.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';

class SafeNavigation {
  static Future<void> navigateToProfileSettings(BuildContext context) async {
    try {
      // Small delay to ensure previous navigation completes
      await Future.delayed(const Duration(milliseconds: 100));

      if (context.mounted) {
        await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      // Fallback navigation
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
          (route) => route.isFirst,
        );
      }
    }
  }

  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}

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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      // Integrate with your analytics service here
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  void _reportError(dynamic error, StackTrace stackTrace, {String? context}) {
    _logger.e('🚨 Error in $context', error: error, stackTrace: stackTrace);

    if (Environment.isProduction) {
      // Integrate with your crash reporting service here
      // Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  String _getLocalizedError(String errorKey, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (errorKey) {
      case 'missing_user_id':
        return l10n?.missingUserIdError ?? 'User ID is required';
      case 'network_error':
        return l10n?.networkError ?? 'Network error occurred';
      case 'timeout_error':
        return l10n?.timeoutError ?? 'Request timed out';
      case 'delete_account_error':
        return l10n?.deleteAccountError ?? 'Failed to delete account';
      case 'logout_error':
        return l10n?.genericError ?? 'Failed to logout';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _sendRequest(
    BuildContext context,
    String endpoint,
    String successMessage, {
    String method = 'DELETE',
    Map<String, dynamic>? body,
    bool showSuccess = true,
  }) async {
    _logger.d('Sending $method request to: $endpoint');
    _logAnalyticsEvent(
      'api_request_sent',
      params: {
        'endpoint': endpoint,
        'method': method,
        'has_body': body != null,
      },
    );

    try {
      http.Response response;
      final uri = Uri.parse("${Environment.baseUrl}/$endpoint");

      final headers = {
        ...Environment.securityHeaders,
        if (method != 'GET') 'Content-Type': 'application/json',
      };

      switch (method) {
        case 'DELETE':
          response = await http.delete(uri, headers: headers);
          break;
        case 'PATCH':
          response = await http.patch(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'POST':
          response = await http.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      if (response.statusCode == 200) {
        _logger.i('✅ $method request successful: $endpoint');
        _logAnalyticsEvent(
          'api_request_success',
          params: {'endpoint': endpoint, 'method': method},
        );

        if (showSuccess && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        _logger.w('❌ HTTP ${response.statusCode} - Failed: $endpoint');
        _logAnalyticsEvent(
          'api_request_failed',
          params: {
            'endpoint': endpoint,
            'method': method,
            'status_code': response.statusCode,
          },
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "${_getLocalizedError('network_error', context)}: ${response.statusCode}",
              ),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    } on TimeoutException {
      _logger.e('⏰ Request timeout: $endpoint');
      _logAnalyticsEvent('api_request_timeout', params: {'endpoint': endpoint});

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getLocalizedError('timeout_error', context)),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'send_request_$endpoint');
      _logAnalyticsEvent(
        'api_request_error',
        params: {'endpoint': endpoint, 'error': e.toString()},
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${_getLocalizedError('network_error', context)}: ${e.toString()}",
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  void _showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    Future<void> Function() onConfirm, {
    String? confirmText,
    String? cancelText,
    bool isDestructive = false,
  }) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  _logAnalyticsEvent(
                    'confirmation_dialog_cancelled',
                    params: {'title': title},
                  );
                  Navigator.of(ctx).pop();
                },
                child: Text(cancelText ?? l10n.cancelButton),
              ),
              ElevatedButton(
                onPressed: () async {
                  _logAnalyticsEvent(
                    'confirmation_dialog_confirmed',
                    params: {'title': title, 'is_destructive': isDestructive},
                  );
                  Navigator.of(ctx).pop();

                  // Show loading indicator for async operations
                  final completer = Completer<void>();
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => WillPopScope(
                            onWillPop: () async => false,
                            child: AlertDialog(
                              content: Row(
                                children: [
                                  const CircularProgressIndicator(),
                                  const SizedBox(width: 16),
                                  Text(l10n.processingLabel),
                                ],
                              ),
                            ),
                          ),
                    );

                    // Wait for operation to complete
                    completer.future.then((_) {
                      if (context.mounted) {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                    });
                  }

                  try {
                    await onConfirm();
                    completer.complete();
                  } catch (e, stackTrace) {
                    completer.completeError(e);
                    _reportError(
                      e,
                      stackTrace,
                      context: 'confirmation_action_$title',
                    );
                  }
                },
                style:
                    isDestructive
                        ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
                        : null,
                child: Text(confirmText ?? l10n.confirmButton),
              ),
            ],
          ),
    );
  }

  void _clearNotifications(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      _logger.w('Cannot clear notifications - missing user ID');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.userIdNotFound),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _showConfirmationDialog(
      context,
      l10n.clearNotificationsTitle,
      l10n.clearNotificationsMessage,
      () => _sendRequest(
        context,
        "notifications/hide-all",
        l10n.clearNotificationsSuccess,
        method: 'PATCH',
        body: {'userId': userId},
      ),
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
    );
  }

  void _clearHoroscope(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      _logger.w('Cannot clear horoscope - missing user ID');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.userIdNotFound),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _showConfirmationDialog(
      context,
      l10n.clearHoroscopeTitle,
      l10n.clearHoroscopeMessage,
      () => _sendRequest(
        context,
        "horoscope/hide-all",
        l10n.clearHoroscopeSuccess,
        method: 'PATCH',
        body: {'userId': userId},
      ),
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
    );
  }

  Future<void> _clearChatHistory(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final chatService = Provider.of<SecureChatService>(context, listen: false);
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      _logger.w('Cannot clear chat history - missing user ID');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.userIdNotFound),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _showConfirmationDialog(
      context,
      l10n.clearChatTitle,
      l10n.clearChatMessage,
      () async {
        // Clear local chat messages first
        chatService.clearMessages();
        _logAnalyticsEvent('chat_history_cleared_local');

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.clearChatLocal),
              backgroundColor: Colors.green,
            ),
          );
        }

        // Clear all related data on backend
        final requests = [
          _sendRequest(
            context,
            "advices/hide-all",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
            body: {'userId': userId, 'hide': true},
            showSuccess: false,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-clarifications",
            "Clarifications cleared",
            method: 'PATCH',
            showSuccess: false,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-questions",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
            showSuccess: false,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-answers",
            "Answers cleared",
            method: 'PATCH',
            showSuccess: false,
          ),
        ];

        try {
          await Future.wait(requests);
          _logAnalyticsEvent('chat_history_cleared_backend');

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.clearChatSuccess),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        } catch (e, stackTrace) {
          _reportError(e, stackTrace, context: 'clear_chat_history');
        }
      },
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
    );
  }

  void _deleteAccount(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    _showConfirmationDialog(
      context,
      l10n.deleteAccountTitle,
      l10n.deleteAccountMessage,
      () async {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        final userId = profileProvider.userId;

        if (userId == null || userId.isEmpty) {
          _logger.w('Cannot delete account - missing user ID');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.userIdNotFound),
                backgroundColor: Colors.orange,
              ),
            );
          }
          return;
        }

        try {
          // Clear profile locally first
          await profileProvider.clearProfile();
          _logAnalyticsEvent('account_deleted_local');

          // Delete account from backend
          await _sendRequest(
            context,
            "auth/delete-account",
            l10n.deleteAccountSuccess,
            method: 'DELETE',
            body: {'userId': userId},
          );

          _logAnalyticsEvent('account_deleted_backend');

          // ✅ FIXED: Safe navigation using Navigator.of with root navigator
          if (context.mounted) {
            await SafeNavigation.navigateToProfileSettings(context);
          }
        } catch (e, stackTrace) {
          _reportError(e, stackTrace, context: 'delete_account');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${_getLocalizedError('delete_account_error', context)}: ${e.toString()}",
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
      isDestructive: true,
    );
  }

  void _logout(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    _showConfirmationDialog(
      context,
      l10n.logoutTitle,
      l10n.logoutMessage,
      () async {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );

        try {
          await profileProvider.clearProfile();
          _logAnalyticsEvent('user_logged_out');

          // ✅ FIXED: Safe navigation for logout
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
              (route) => false,
            );
          }
        } catch (e, stackTrace) {
          _reportError(e, stackTrace, context: 'logout');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${_getLocalizedError('logout_error', context)}: ${e.toString()}",
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: _SettingsContent(
        l10n: l10n,
        onClearHoroscope: () => _clearHoroscope(context),
        onClearNotifications: () => _clearNotifications(context),
        onClearChatHistory: () => _clearChatHistory(context),
        onLogout: () => _logout(context),
        onDeleteAccount: () => _deleteAccount(context),
      ),
    );
  }
}

class _SettingsContent extends StatefulWidget {
  final AppLocalizations l10n;
  final VoidCallback onClearHoroscope;
  final VoidCallback onClearNotifications;
  final VoidCallback onClearChatHistory;
  final VoidCallback onLogout;
  final VoidCallback onDeleteAccount;

  const _SettingsContent({
    required this.l10n,
    required this.onClearHoroscope,
    required this.onClearNotifications,
    required this.onClearChatHistory,
    required this.onLogout,
    required this.onDeleteAccount,
  });

  @override
  State<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<_SettingsContent> {
  @override
  void initState() {
    super.initState();
    _initializeSettings();
  }

  void _initializeSettings() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      _logger.d('🌐 Language initialized: ${profileProvider.language}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Notification Settings
          _NotificationSettingsTile(l10n: widget.l10n),
          const SizedBox(height: 8),

          // Terms & Privacy
          _ExpansionSection(
            title: widget.l10n.termsPrivacyTitle,
            icon: Icons.security,
            children: [
              _PolicyListTile(
                title: widget.l10n.privacyPolicyTitle,
                icon: Icons.privacy_tip,
                policyType: "privacy-policy",
                l10n: widget.l10n,
              ),
              _PolicyListTile(
                title: widget.l10n.termsConditionsTitle,
                icon: Icons.article,
                policyType: "terms-and-conditions",
                l10n: widget.l10n,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Data Control
          _ExpansionSection(
            title: widget.l10n.dataControlTitle,
            icon: Icons.data_usage,
            children: [
              _ActionListTile(
                title: widget.l10n.clearHoroscope,
                icon: Icons.clear_all,
                onTap: widget.onClearHoroscope,
                color: Colors.orange,
              ),
              _ActionListTile(
                title: widget.l10n.clearNotifications,
                icon: Icons.notifications_off,
                onTap: widget.onClearNotifications,
                color: Colors.blue,
              ),
              _ActionListTile(
                title: widget.l10n.clearChatHistory,
                icon: Icons.chat_bubble_outline,
                onTap: widget.onClearChatHistory,
                color: Colors.purple,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Account Settings
          _ExpansionSection(
            title: widget.l10n.accountSettings,
            icon: Icons.account_circle,
            children: [
              _ActionListTile(
                title: widget.l10n.logout,
                icon: Icons.logout,
                onTap: widget.onLogout,
                color: Colors.orange,
              ),
              _ActionListTile(
                title: widget.l10n.deleteAccount,
                icon: Icons.delete_forever,
                onTap: widget.onDeleteAccount,
                color: Colors.red,
                isDestructive: true,
              ),
              _ActionListTile(
                title: widget.l10n.recoverAccount,
                icon: Icons.restore,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RecoveryScreen()),
                  );
                },
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Language Settings
          _LanguageSettingsTile(l10n: widget.l10n),
        ],
      ),
    );
  }
}

class _NotificationSettingsTile extends StatelessWidget {
  final AppLocalizations l10n;

  const _NotificationSettingsTile({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, notificationProvider, child) {
        return Card(
          elevation: 2,
          child: SwitchListTile(
            title: Text(
              l10n.notificationSettings,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              notificationProvider.notificationsEnabled
                  ? l10n.notificationsEnabled
                  : l10n.notificationsDisabled,
            ),
            value: notificationProvider.notificationsEnabled,
            onChanged: (bool value) {
              notificationProvider.setNotificationsEnabled(value);
              HoroscopeService().setNotificationsEnabled(value);

              final logger = Logger();
              logger.i('🔔 Notifications ${value ? 'enabled' : 'disabled'}');

              // Analytics
              if (Environment.isProduction) {
                logger.i(
                  '📊 Analytics: notifications_toggled - enabled: $value',
                );
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value
                        ? l10n.notificationsEnabled
                        : l10n.notificationsDisabled,
                  ),
                  backgroundColor: value ? Colors.green : Colors.orange,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ExpansionSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _ExpansionSection({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        children: children,
      ),
    );
  }
}

class _PolicyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String policyType;
  final AppLocalizations l10n;

  const _PolicyListTile({
    required this.title,
    required this.icon,
    required this.policyType,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        final logger = Logger();
        logger.i('📄 Opening policy: $policyType');

        if (Environment.isProduction) {
          logger.i('📊 Analytics: policy_opened - type: $policyType');
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => PolicyPage(
                  title: title,
                  url: "${Environment.baseUrl}/api/policies/$policyType",
                ),
          ),
        );
      },
    );
  }
}

class _ActionListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final bool isDestructive;

  const _ActionListTile({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : null,
          fontWeight: isDestructive ? FontWeight.w600 : null,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class _LanguageSettingsTile extends StatelessWidget {
  final AppLocalizations l10n;

  const _LanguageSettingsTile({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(Icons.language, color: Theme.of(context).primaryColor),
        title: Text(
          l10n.languageSettings,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          _LanguageRadioTile(
            language: "English",
            locale: const Locale('en'),
            l10n: l10n,
          ),
          _LanguageRadioTile(
            language: "Español",
            locale: const Locale('es'),
            l10n: l10n,
          ),
          _LanguageRadioTile(
            language: "हिन्दी",
            locale: const Locale('hi'),
            l10n: l10n,
          ),
        ],
      ),
    );
  }
}

class _LanguageRadioTile extends StatelessWidget {
  final String language;
  final Locale locale;
  final AppLocalizations l10n;

  const _LanguageRadioTile({
    required this.language,
    required this.locale,
    required this.l10n,
  });

  Future<void> _updateLanguageOnBackend(
    BuildContext context,
    String langCode,
  ) async {
    final logger = Logger();

    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId;
      final token = profileProvider.token;

      if (userId == null || token == null) {
        logger.w("⚠️ Cannot update language: userId or token missing");
        return;
      }

      final url = Uri.parse(
        '${Environment.baseUrl}/api/profile/update-language',
      );

      final response = await http
          .post(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $token',
            },
            body: json.encode({'userId': userId, 'language': langCode}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        logger.i("✅ Language updated on backend successfully.");
        // ✅ Use the new method - language is already saved locally via saveLanguage()
        // The backend sync happens automatically in the secured ProfileProvider

        if (Environment.isProduction) {
          logger.i('📊 Analytics: language_changed - lang: $langCode');
        }
      } else {
        logger.w(
          "❌ Failed to update language: ${response.statusCode} - ${response.body}",
        );
      }
    } on TimeoutException {
      logger.e("⏰ Language update timeout");
    } catch (e) {
      final errorLogger = Logger();
      errorLogger.e("🔴 Error updating language: $e");

      if (Environment.isProduction) {
        errorLogger.e('📊 Analytics: language_update_error - error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    final currentLanguage =
        profileProvider.language.isNotEmpty
            ? profileProvider.language
            : localeProvider.locale.languageCode;

    return RadioListTile<String>(
      title: Text(language),
      value: locale.languageCode,
      groupValue: currentLanguage, // ✅ FIX: Use the reliable current language
      onChanged: (String? value) async {
        if (value != null) {
          final logger = Logger();
          logger.i('🌐 Changing language to: $value');

          try {
            // Update ProfileProvider state
            await profileProvider.saveLanguage(value);

            // Update Flutter locale
            localeProvider.setLocale(Locale(value));

            if (context.mounted) {
              // This will trigger a rebuild of the entire settings screen
              Provider.of<ProfileProvider>(
                context,
                listen: false,
              ).refreshProfile();
            }
            if (Environment.isProduction) {
              logger.i('📊 Analytics: language_changed - lang: $value');
            }

            // Show confirmation
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.languageChanged),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          } catch (e) {
            final errorLogger = Logger();
            errorLogger.e('🔴 Error changing language: $e');

            if (Environment.isProduction) {
              errorLogger.e('📊 Analytics: language_change_error - error: $e');
            }
            // Update backend if user is logged in
            if (profileProvider.userId != null) {
              await _updateLanguageOnBackend(context, value);
            }

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${l10n.genericError}: ${e.toString()}"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
      },
    );
  }
}
