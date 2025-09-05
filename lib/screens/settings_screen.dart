import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LocaleProvider.dart'; // Add this import
// lib/providers/notification_provider.dart
import '../providers/notification_provider.dart';
import '../providers/profile_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/HoroscopeService.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            ListTile(
              title: Text(l10n.privacySettings),
              onTap: () => _handlePrivacySettings(context),
            ),
            ListTile(
              title: Text(l10n.accountSettings),
              onTap: () => _handleAccountSettings(context),
            ),
            _LanguageSettingsTile(l10n: l10n),
          ],
        ),
      ),
    );
  }

  void _handlePrivacySettings(BuildContext context) {
    debugPrint('Privacy settings tapped');
  }

  void _handleAccountSettings(BuildContext context) {
    debugPrint('Account settings tapped');
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
