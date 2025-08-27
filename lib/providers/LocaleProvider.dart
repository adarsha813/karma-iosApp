import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en'); // fallback
  bool _isLoading = true;

  Locale get locale => _locale;
  bool get isLoading => _isLoading;

  LocaleProvider() {
    _loadLocaleFromPrefs();
  }

  Future<void> setLocale(Locale locale) async {
    // Ensure locale is supported
    if (!AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .contains(locale.languageCode)) {
      return;
    }

    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale_code', locale.languageCode);
  }

  Future<void> _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('locale_code');

    if (code != null) {
      final isSupported = AppLocalizations.supportedLocales
          .map((l) => l.languageCode)
          .contains(code);

      if (isSupported) {
        _locale = Locale(code);
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
