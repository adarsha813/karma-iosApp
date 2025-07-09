import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  bool _isLoading = true;

  Locale? get locale => _locale;
  bool get isLoading => _isLoading;

  LocaleProvider() {
    _loadLocaleFromPrefs();
  }

  void setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale_code', locale.languageCode);
  }

  void _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('locale_code');

    if (code != null) {
      final locale = Locale(code);
      if (AppLocalizations.supportedLocales.contains(locale)) {
        _locale = locale;
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
