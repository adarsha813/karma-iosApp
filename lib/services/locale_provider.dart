import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  bool _isLoading = true;

  Locale? get locale => _locale;
  bool get isLoading => _isLoading;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('language_code');
      final countryCode = prefs.getString('country_code');

      if (languageCode != null) {
        _locale = Locale(languageCode, countryCode);
      } else {
        _locale = const Locale('en'); // Default to English
      }
    } catch (e) {
      _locale = const Locale('en');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale newLocale) async {
    _locale = newLocale;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', newLocale.languageCode);
      if (newLocale.countryCode != null) {
        await prefs.setString('country_code', newLocale.countryCode!);
      } else {
        await prefs.remove('country_code');
      }
    } catch (e) {
      // Handle error silently in production
    }

    notifyListeners();
  }

  Future<void> clearLocale() async {
    _locale = const Locale('en');

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('language_code');
      await prefs.remove('country_code');
    } catch (e) {
      // Handle error silently
    }

    notifyListeners();
  }
}
