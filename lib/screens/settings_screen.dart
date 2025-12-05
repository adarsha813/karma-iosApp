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
import '../providers/theme_provider.dart';

class SafeNavigation {
  static Future<void> navigateToProfileSettings(BuildContext context) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));

      if (context.mounted) {
        await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
          (route) => false,
        );
      }
    } catch (e) {
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
    }
  }

  void _reportError(dynamic error, StackTrace stackTrace, {String? context}) {
    _logger.e('🚨 Error in $context', error: error, stackTrace: stackTrace);
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
    String? token,
  }) async {
    _logger.d('Sending $method request to: $endpoint');
    _logAnalyticsEvent(
      'api_request_sent',
      params: {
        'endpoint': endpoint,
        'method': method,
        'has_body': body != null,
        'has_token': token != null,
      },
    );

    try {
      http.Response response;
      final uri = Uri.parse("${Environment.baseUrl}/$endpoint");

      final headers = {
        ...Environment.securityHeaders,
        if (method != 'GET') 'Content-Type': 'application/json',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
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
          final themeProvider = Provider.of<ThemeProvider>(
            context,
            listen: false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              backgroundColor:
                  themeProvider.getCurrentTheme(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    showDialog(
      context: context,
      builder:
          (ctx) => Theme(
            data: theme,
            child: AlertDialog(
              backgroundColor: theme.colorScheme.surface,
              title: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              content: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _logAnalyticsEvent(
                      'confirmation_dialog_cancelled',
                      params: {'title': title},
                    );
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    cancelText ?? l10n.cancelButton,
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _logAnalyticsEvent(
                      'confirmation_dialog_confirmed',
                      params: {'title': title, 'is_destructive': isDestructive},
                    );
                    Navigator.of(ctx).pop();

                    final completer = Completer<void>();
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (context) => WillPopScope(
                              onWillPop: () async => false,
                              child: AlertDialog(
                                backgroundColor: theme.colorScheme.surface,
                                content: Row(
                                  children: [
                                    CircularProgressIndicator(
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      l10n.processingLabel,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.onSurface,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      );

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
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDestructive ? Colors.red : theme.colorScheme.primary,
                    foregroundColor:
                        isDestructive
                            ? Colors.white
                            : theme.colorScheme.onPrimary,
                  ),
                  child: Text(confirmText ?? l10n.confirmButton),
                ),
              ],
            ),
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
    final token = profileProvider.token;

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
        token: token,
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
    final token = profileProvider.token;

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
        token: token,
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
    final token = profileProvider.token;

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

        final requests = [
          _sendRequest(
            context,
            "advices/hide-all",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
            body: {'userId': userId, 'hide': true},
            showSuccess: false,
            token: token,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-clarifications",
            "Clarifications cleared",
            method: 'PATCH',
            showSuccess: false,
            token: token,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-questions",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
            showSuccess: false,
            token: token,
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-answers",
            "Answers cleared",
            method: 'PATCH',
            showSuccess: false,
            token: token,
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
        final token = profileProvider.token;

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
          await profileProvider.clearProfile();
          _logAnalyticsEvent('account_deleted_local');

          await _sendRequest(
            context,
            "api/profile/remove-profile",
            l10n.deleteAccountSuccess,
            method: 'PATCH',
            body: {'userId': userId, 'removed': true},
            token: token,
          );

          _logAnalyticsEvent('account_deleted_backend');

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

          // Use your existing SafeNavigation utility
          if (context.mounted) {
            await SafeNavigation.navigateToProfileSettings(context);
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        backgroundColor:
            themeProvider.getCurrentTheme(context).appBarTheme.backgroundColor,
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return Container(
      color: theme.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notification Settings
            _NotificationSettingsTile(l10n: widget.l10n),
            const SizedBox(height: 8),
            // Theme Settings
            _ThemeSettingsTile(l10n: widget.l10n),
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
      ),
    );
  }
}

class _ThemeSettingsTile extends StatelessWidget {
  final AppLocalizations l10n;

  const _ThemeSettingsTile({required this.l10n});

  String _getThemeModeName(ThemeMode mode, BuildContext context) {
    switch (mode) {
      case ThemeMode.light:
        return l10n.lightThemeLabel;
      case ThemeMode.dark:
        return l10n.darkThemeLabel;
      case ThemeMode.system:
        return l10n.systemThemeLabel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final isDark = themeProvider.isDarkMode(context);

    return Card(
      elevation: 2,
      color: theme.colorScheme.surface,
      child: ExpansionTile(
        leading: Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          color: theme.colorScheme.primary,
        ),
        title: Text(
          l10n.themeSettingsTitle, // Use l10n for title too
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          _getThemeModeName(themeProvider.themeMode, context),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        children: [
          // Light Theme Option
          RadioListTile<ThemeMode>(
            title: Text(
              l10n.lightThemeLabel,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              l10n.lightThemeDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
                _logger.i('🎨 Theme changed to: Light');

                if (Environment.isProduction) {
                  _logger.i('📊 Analytics: theme_changed - mode: light');
                }
              }
            },
            activeColor: theme.colorScheme.primary,
          ),

          // Dark Theme Option
          RadioListTile<ThemeMode>(
            title: Text(
              l10n.darkThemeLabel,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              l10n.darkThemeDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
                _logger.i('🎨 Theme changed to: Dark');

                if (Environment.isProduction) {
                  _logger.i('📊 Analytics: theme_changed - mode: dark');
                }
              }
            },
            activeColor: theme.colorScheme.primary,
          ),

          // System Theme Option
          RadioListTile<ThemeMode>(
            title: Text(
              l10n.systemThemeLabel,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              themeProvider.isDarkMode(context)
                  ? l10n.systemThemeDarkDescription
                  : l10n.systemThemeLightDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
                _logger.i('🎨 Theme changed to: System');

                if (Environment.isProduction) {
                  _logger.i('📊 Analytics: theme_changed - mode: system');
                }
              }
            },
            activeColor: theme.colorScheme.primary,
          ),

          // Quick Toggle Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    label: Text(
                      isDark ? l10n.switchToLight : l10n.switchToDark,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme();
                      _logger.i(
                        '🎨 Theme toggled to: ${isDark ? 'Light' : 'Dark'}',
                      );

                      if (Environment.isProduction) {
                        _logger.i('📊 Analytics: theme_toggled');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return Consumer<NotificationProvider>(
      builder: (context, notificationProvider, child) {
        return Card(
          elevation: 2,
          color: theme.colorScheme.surface,
          child: SwitchListTile(
            title: Text(
              l10n.notificationSettings,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              notificationProvider.notificationsEnabled
                  ? l10n.notificationsEnabled
                  : l10n.notificationsDisabled,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            value: notificationProvider.notificationsEnabled,
            onChanged: (bool value) {
              notificationProvider.setNotificationsEnabled(value);
              HoroscopeService().setNotificationsEnabled(value);

              _logger.i('🔔 Notifications ${value ? 'enabled' : 'disabled'}');

              if (Environment.isProduction) {
                _logger.i(
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
            activeColor: theme.colorScheme.primary,
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return Card(
      elevation: 2,
      color: theme.colorScheme.surface,
      child: ExpansionTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: theme.colorScheme.onSurface.withOpacity(0.6),
      ),
      onTap: () {
        _logger.i('📄 Opening policy: $policyType');

        if (Environment.isProduction) {
          _logger.i('📊 Analytics: policy_opened - type: $policyType');
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isDestructive ? Colors.red : theme.colorScheme.onSurface,
          fontWeight: isDestructive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: theme.colorScheme.onSurface.withOpacity(0.6),
      ),
      onTap: onTap,
    );
  }
}

class _LanguageSettingsTile extends StatefulWidget {
  final AppLocalizations l10n;

  const _LanguageSettingsTile({required this.l10n});

  @override
  State<_LanguageSettingsTile> createState() => _LanguageSettingsTileState();
}

class _LanguageSettingsTileState extends State<_LanguageSettingsTile> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredLanguages = [];

  // Define complete languages list
  static final List<Map<String, dynamic>> _allLanguages = [
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Afrikaans', 'locale': const Locale('af')},
    {'name': 'Albanian', 'locale': const Locale('sq')},
    {'name': 'Amharic', 'locale': const Locale('am')},
    {'name': 'Arabic', 'locale': const Locale('ar')},
    {'name': 'Armenian', 'locale': const Locale('hy')},
    {'name': 'Azerbaijani', 'locale': const Locale('az')},
    {'name': 'Basque', 'locale': const Locale('eu')},
    {'name': 'Belarusian', 'locale': const Locale('be')},
    {'name': 'Bengali', 'locale': const Locale('bn')},
    {'name': 'Bosnian', 'locale': const Locale('bs')},
    {'name': 'Bulgarian', 'locale': const Locale('bg')},
    {'name': 'Catalan', 'locale': const Locale('ca')},
    {'name': 'Cebuano', 'locale': const Locale('ceb')},
    {'name': 'Chinese (Simplified)', 'locale': const Locale('zh')},
    {'name': 'Chinese (Traditional)', 'locale': const Locale('zh', 'TW')},
    {'name': 'Corsican', 'locale': const Locale('co')},
    {'name': 'Croatian', 'locale': const Locale('hr')},
    {'name': 'Czech', 'locale': const Locale('cs')},
    {'name': 'Danish', 'locale': const Locale('da')},
    {'name': 'Dutch', 'locale': const Locale('nl')},
    {'name': 'Esperanto', 'locale': const Locale('eo')},
    {'name': 'Estonian', 'locale': const Locale('et')},
    {'name': 'Finnish', 'locale': const Locale('fi')},
    {'name': 'French', 'locale': const Locale('fr')},
    {'name': 'Frisian', 'locale': const Locale('fy')},
    {'name': 'Galician', 'locale': const Locale('gl')},
    {'name': 'Georgian', 'locale': const Locale('ka')},
    {'name': 'German', 'locale': const Locale('de')},
    {'name': 'Greek', 'locale': const Locale('el')},
    {'name': 'Gujarati', 'locale': const Locale('gu')},
    {'name': 'Haitian Creole', 'locale': const Locale('ht')},
    {'name': 'Hausa', 'locale': const Locale('ha')},
    {'name': 'Hawaiian', 'locale': const Locale('haw')},
    {'name': 'Hebrew', 'locale': const Locale('he')},
    {'name': 'Hindi', 'locale': const Locale('hi')},
    {'name': 'Hmong', 'locale': const Locale('hmn')},
    {'name': 'Hungarian', 'locale': const Locale('hu')},
    {'name': 'Icelandic', 'locale': const Locale('is')},
    {'name': 'Igbo', 'locale': const Locale('ig')},
    {'name': 'Indonesian', 'locale': const Locale('id')},
    {'name': 'Irish', 'locale': const Locale('ga')},
    {'name': 'Italian', 'locale': const Locale('it')},
    {'name': 'Japanese', 'locale': const Locale('ja')},
    {'name': 'Javanese', 'locale': const Locale('jv')},
    {'name': 'Kannada', 'locale': const Locale('kn')},
    {'name': 'Kazakh', 'locale': const Locale('kk')},
    {'name': 'Khmer', 'locale': const Locale('km')},
    {'name': 'Kinyarwanda', 'locale': const Locale('rw')},
    {'name': 'Korean', 'locale': const Locale('ko')},
    {'name': 'Kurdish', 'locale': const Locale('ku')},
    {'name': 'Kyrgyz', 'locale': const Locale('ky')},
    {'name': 'Lao', 'locale': const Locale('lo')},
    {'name': 'Latvian', 'locale': const Locale('lv')},
    {'name': 'Lithuanian', 'locale': const Locale('lt')},
    {'name': 'Luxembourgish', 'locale': const Locale('lb')},
    {'name': 'Macedonian', 'locale': const Locale('mk')},
    {'name': 'Malagasy', 'locale': const Locale('mg')},
    {'name': 'Malay', 'locale': const Locale('ms')},
    {'name': 'Malayalam', 'locale': const Locale('ml')},
    {'name': 'Maltese', 'locale': const Locale('mt')},
    {'name': 'Maori', 'locale': const Locale('mi')},
    {'name': 'Marathi', 'locale': const Locale('mr')},
    {'name': 'Mongolian', 'locale': const Locale('mn')},
    {'name': 'Myanmar (Burmese)', 'locale': const Locale('my')},
    {'name': 'Nepali', 'locale': const Locale('ne')},
    {'name': 'Norwegian', 'locale': const Locale('no')},
    {'name': 'Nyanja (Chichewa)', 'locale': const Locale('ny')},
    {'name': 'Odia (Oriya)', 'locale': const Locale('or')},
    {'name': 'Pashto', 'locale': const Locale('ps')},
    {'name': 'Persian', 'locale': const Locale('fa')},
    {'name': 'Polish', 'locale': const Locale('pl')},
    {'name': 'Portuguese', 'locale': const Locale('pt')},
    {'name': 'Punjabi', 'locale': const Locale('pa')},
    {'name': 'Romanian', 'locale': const Locale('ro')},
    {'name': 'Russian', 'locale': const Locale('ru')},
    {'name': 'Samoan', 'locale': const Locale('sm')},
    {'name': 'Scots Gaelic', 'locale': const Locale('gd')},
    {'name': 'Serbian', 'locale': const Locale('sr')},
    {'name': 'Sesotho', 'locale': const Locale('st')},
    {'name': 'Shona', 'locale': const Locale('sn')},
    {'name': 'Sindhi', 'locale': const Locale('sd')},
    {'name': 'Sinhala', 'locale': const Locale('si')},
    {'name': 'Slovak', 'locale': const Locale('sk')},
    {'name': 'Slovenian', 'locale': const Locale('sl')},
    {'name': 'Somali', 'locale': const Locale('so')},
    {'name': 'Spanish', 'locale': const Locale('es')},
    {'name': 'Sundanese', 'locale': const Locale('su')},
    {'name': 'Swahili', 'locale': const Locale('sw')},
    {'name': 'Swedish', 'locale': const Locale('sv')},
    {'name': 'Tagalog (Filipino)', 'locale': const Locale('tl')},
    {'name': 'Tajik', 'locale': const Locale('tg')},
    {'name': 'Tamil', 'locale': const Locale('ta')},
    {'name': 'Tatar', 'locale': const Locale('tt')},
    {'name': 'Telugu', 'locale': const Locale('te')},
    {'name': 'Thai', 'locale': const Locale('th')},
    {'name': 'Turkish', 'locale': const Locale('tr')},
    {'name': 'Turkmen', 'locale': const Locale('tk')},
    {'name': 'Ukrainian', 'locale': const Locale('uk')},
    {'name': 'Urdu', 'locale': const Locale('ur')},
    {'name': 'Uyghur', 'locale': const Locale('ug')},
    {'name': 'Uzbek', 'locale': const Locale('uz')},
    {'name': 'Vietnamese', 'locale': const Locale('vi')},
    {'name': 'Welsh', 'locale': const Locale('cy')},
    {'name': 'Xhosa', 'locale': const Locale('xh')},
    {'name': 'Yiddish', 'locale': const Locale('yi')},
    {'name': 'Yoruba', 'locale': const Locale('yo')},
    {'name': 'Zulu', 'locale': const Locale('zu')},
  ];

  @override
  void initState() {
    super.initState();
    _filteredLanguages = _allLanguages;
    _searchController.addListener(_filterLanguages);
  }

  void _filterLanguages() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredLanguages = _allLanguages;
      } else {
        _filteredLanguages =
            _allLanguages.where((lang) {
              return lang['name'].toString().toLowerCase().contains(query);
            }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return Card(
      elevation: 2,
      color: theme.colorScheme.surface,
      child: ExpansionTile(
        leading: Icon(Icons.language, color: theme.colorScheme.primary),
        title: Text(
          widget.l10n.languageSettings,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        initiallyExpanded: false,
        onExpansionChanged: (expanded) {
          if (!expanded) {
            _searchController.clear();
          }
        },
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search languages...',
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.primary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                isDense: true,
                filled: true,
                fillColor: theme.colorScheme.surface,
              ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child:
                _filteredLanguages.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No languages found',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: _filteredLanguages.length,
                      itemBuilder: (context, index) {
                        final language = _filteredLanguages[index];
                        return _LanguageRadioTile(
                          language: language['name'] as String,
                          locale: language['locale'] as Locale,
                          l10n: widget.l10n,
                        );
                      },
                    ),
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    String getCurrentLanguage() {
      if (profileProvider.language.isNotEmpty) {
        return profileProvider.language;
      }
      if (localeProvider.locale.languageCode.isNotEmpty) {
        return localeProvider.locale.languageCode;
      }
      return 'en';
    }

    final currentLanguage = getCurrentLanguage();

    return RadioListTile<String>(
      title: Text(
        language,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      value: locale.languageCode,
      groupValue: currentLanguage,
      onChanged: (String? value) async {
        if (value != null) {
          _logger.i('🌐 Changing language to: $value');

          try {
            await profileProvider.saveLanguage(value);
            localeProvider.setLocale(Locale(value));

            if (context.mounted) {
              Provider.of<ProfileProvider>(
                context,
                listen: false,
              ).refreshProfile();
            }

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.languageChanged),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
            }

            await _updateLanguageOnBackend(context, value);
          } catch (e) {
            _logger.e('🔴 Error changing language: $e');
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
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      activeColor: theme.colorScheme.primary,
    );
  }

  Future<void> _updateLanguageOnBackend(
    BuildContext context,
    String langCode,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId;
      final token = profileProvider.token;

      if (userId == null || token == null) {
        _logger.w("⚠️ Cannot update language: userId or token missing");
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
        _logger.i("✅ Language updated on backend successfully.");

        if (Environment.isProduction) {
          _logger.i('📊 Analytics: language_changed - lang: $langCode');
        }
      } else {
        _logger.w(
          "❌ Failed to update language: ${response.statusCode} - ${response.body}",
        );
      }
    } on TimeoutException {
      _logger.e("⏰ Language update timeout");
    } catch (e) {
      _logger.e("🔴 Error updating language: $e");

      if (Environment.isProduction) {
        _logger.e('📊 Analytics: language_update_error - error: $e');
      }
    }
  }
}
