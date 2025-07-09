import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LocaleProvider.dart'; // Add this import
// lib/providers/notification_provider.dart
import '../providers/notification_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return RadioListTile<Locale>(
      title: Text(language),
      value: locale,
      groupValue: currentLocale,
      onChanged: (Locale? value) {
        if (value != null) {
          Provider.of<LocaleProvider>(context, listen: false).setLocale(value);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.languageChanged)));
        }
      },
    );
  }
}
