import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LocaleProvider.dart'; // Add this import
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
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  onConfirm();
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }

  void _clearNotifications(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Notifications",
      "Are you sure you want to clear all notifications?",
      () => _sendRequest(
        context,
        "notifications/hide-all",
        "All notifications cleared successfully.",
        method: 'PATCH',
        body: {'userId': userId},
      ),
    );
  }

  void _clearHoroscope(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Horoscope",
      "Are you sure you want to clear your horoscope data?",
      () => _sendRequest(
        context,
        "horoscope/hide-all",
        "Horoscope cleared successfully.",
        method: 'PATCH',
        body: {'userId': userId},
      ),
    );
  }

  void _clearChatHistory(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final chatService = Provider.of<ChatService>(context, listen: false);
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Chat History",
      "Are you sure you want to delete all your chat history?",
      () async {
        chatService.clearMessages();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Chat cleared locally.")));

        await Future.wait([
          _sendRequest(
            context,
            "advices/hide-all",
            "All advice deleted successfully.",
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
            "All questions deleted successfully.",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                    HoroscopeService().setNotificationsEnabled(
                      value,
                    ); // if using service

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
              title: const Text("Terms & Privacy"),
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Privacy Policy"),
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
                  title: const Text("Terms & Conditions"),
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
              title: const Text("Data Control"),
              children: [
                ListTile(
                  leading: const Icon(Icons.clear_all),
                  title: const Text("Clear Horoscope"),
                  onTap: () => _clearHoroscope(context),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_off),
                  title: const Text("Clear Notifications"),
                  onTap: () => _clearNotifications(context),
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: const Text("Clear Chat History"),
                  onTap: () => _clearChatHistory(context),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(l10n.accountSettings),
              children: [
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.orange),
                  title: const Text("Logout"),
                  onTap: () => _logout(context),
                ),
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: const Text("Delete Account"),
                  onTap: () => _deleteAccount(context),
                ),
                ListTile(
                  leading: const Icon(Icons.restore, color: Colors.green),
                  title: const Text("Recover Account"),
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

void _showConfirmationDialog(
  BuildContext context,
  String title,
  String message,
  VoidCallback onConfirm,
) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                onConfirm();
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
  );
}

void _deleteAccount(BuildContext context) {
  _showConfirmationDialog(
    context,
    "Delete Account",
    "Are you sure you want to delete your account? This will also clear all your chat history and notifications.",
    () async {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId;

      if (userId == null || userId.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
        return;
      }

      try {
        // clear profile locally
        await profileProvider.clearProfile();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your account and all data have been removed."),
          ),
        );

        // navigate back or to login
        Navigator.pushReplacementNamed(context, '/profile-settings');
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error deleting account: $e")));
      }
    },
  );
}

void _logout(BuildContext context) {
  _showConfirmationDialog(
    context,
    "Logout",
    "Are you sure you want to logout?",
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
  );
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
