import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LocaleProvider.dart';
import 'package:kundali/screens/recovery_screen.dart';
import '../providers/notification_provider.dart';
import '../providers/profile_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/HoroscopeService.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import '../services/chat_service.dart';
import 'package:kundali/screens/policy_page.dart';
import 'package:kundali/screens/profile_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String baseUrl = "https://chat-backend-rvk9.onrender.com";

  Future<void> _sendRequest(
    BuildContext context,
    String endpoint,
    String successMessage, {
    String method = 'DELETE',
    Map<String, dynamic>? body,
  }) async {
    try {
      http.Response response;
      final uri = Uri.parse("$baseUrl/$endpoint");

      if (method == 'DELETE') {
        response = await http.delete(uri);
      } else if (method == 'PATCH') {
        response = await http.patch(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: body != null ? jsonEncode(body) : null,
        );
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(successMessage)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  void _showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm, {
    String? confirmText,
    String? cancelText,
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
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(cancelText ?? l10n.cancelButton),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  onConfirm();
                },
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.userIdNotFound)));
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.userIdNotFound)));
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

  void _clearChatHistory(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final chatService = Provider.of<ChatService>(context, listen: false);
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.userIdNotFound)));
      return;
    }

    _showConfirmationDialog(
      context,
      l10n.clearChatTitle,
      l10n.clearChatMessage,
      () async {
        chatService.clearMessages();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.clearChatLocal)));

        await Future.wait([
          _sendRequest(
            context,
            "advices/hide-all",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
            body: {'userId': userId, 'hide': true},
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-clarifications",
            "All clarifications deleted successfully.",
            method: 'PATCH',
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-questions",
            l10n.clearQuestionsSuccess,
            method: 'PATCH',
          ),
          _sendRequest(
            context,
            "questions/user/$userId/hide-answers",
            "All answers deleted successfully.",
            method: 'PATCH',
          ),
        ]);
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.userIdNotFound)));
          return;
        }

        try {
          // clear profile locally
          await profileProvider.clearProfile();

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.deleteAccountSuccess)));

          // navigate back or to login
          Navigator.pushReplacementNamed(context, '/profile-settings');
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${l10n.deleteAccountError}: $e")),
          );
        }
      },
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
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
        await profileProvider.clearProfile();

        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ProfileSettingsScreen()),
          );
        }
      },
      confirmText: l10n.confirmButton,
      cancelText: l10n.cancelButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileProvider.loadLanguage();
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Consumer<NotificationProvider>(
              builder: (context, notificationProvider, child) {
                return SwitchListTile(
                  title: Text(l10n.notificationSettings),
                  value: notificationProvider.notificationsEnabled,
                  onChanged: (bool value) {
                    notificationProvider.setNotificationsEnabled(value);
                    HoroscopeService().setNotificationsEnabled(value);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          value
                              ? 'Notifications Enabled'
                              : 'Notifications Disabled',
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            ExpansionTile(
              title: Text(l10n.termsPrivacyTitle),
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: Text(l10n.privacyPolicyTitle),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => const PolicyPage(
                              title: "Privacy Policy",
                              url:
                                  "https://chat-backend-rvk9.onrender.com/api/policies/privacy-policy",
                            ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.article),
                  title: Text(l10n.termsConditionsTitle),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => const PolicyPage(
                              title: "Terms & Conditions",
                              url:
                                  "https://chat-backend-rvk9.onrender.com/api/policies/terms-and-conditions",
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text(l10n.dataControlTitle),
              children: [
                ListTile(
                  leading: const Icon(Icons.clear_all),
                  title: Text(l10n.clearHoroscope),
                  onTap: () => _clearHoroscope(context),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_off),
                  title: Text(l10n.clearNotifications),
                  onTap: () => _clearNotifications(context),
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: Text(l10n.clearChatHistory),
                  onTap: () => _clearChatHistory(context),
                ),
              ],
            ),

            ExpansionTile(
              title: Text(l10n.accountSettings),
              children: [
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.orange),
                  title: Text(l10n.logout),
                  onTap: () => _logout(context),
                ),
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: Text(l10n.deleteAccount),
                  onTap: () => _deleteAccount(context),
                ),
                ListTile(
                  leading: const Icon(Icons.restore, color: Colors.green),
                  title: Text(l10n.recoverAccount),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RecoveryScreen()),
                    );
                  },
                ),
              ],
            ),
            _LanguageSettingsTile(l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _LanguageSettingsTile extends StatelessWidget {
  final AppLocalizations l10n;

  const _LanguageSettingsTile({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(l10n.languageSettings),
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
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId;
      final token = profileProvider.token;

      if (userId == null || token == null) {
        debugPrint("⚠️ Cannot update language: userId or token missing");
        return;
      }

      final url = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/update-language',
      );
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'userId': userId, 'language': langCode}),
      );

      if (response.statusCode == 200) {
        debugPrint("✅ Language updated on backend successfully.");
        // Optional: ensure ProfileProvider.language is synced
        profileProvider.setLanguage(langCode);
      } else {
        debugPrint("❌ Failed to update language: ${response.body}");
      }
    } catch (e) {
      debugPrint("🔴 Error updating language: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return RadioListTile<String>(
      title: Text(language),
      value: locale.languageCode,
      groupValue: profileProvider.language ?? 'en',
      onChanged: (String? value) async {
        if (value != null) {
          // Update ProfileProvider state
          await profileProvider.saveLanguage(value);

          // Update Flutter locale
          localeProvider.setLocale(Locale(value));

          // Update backend if user is logged in
          if (profileProvider.userId != null) {
            await _updateLanguageOnBackend(context, value);
          }

          // Show confirmation
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.languageChanged)));
        }
      },
    );
  }
}
