import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../services/production_logger.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');
  bool _isLoading = true;

  Locale get locale => _locale;
  bool get isLoading => _isLoading;

  LocaleProvider() {
    _loadLocaleFromPrefs();
  }

  Future<void> setLocale(Locale locale) async {
    // Validate the locale is supported by Material widgets
    if (!_isLocaleSupportedByMaterial(locale)) {
      ProductionLogger.warning(
        'Locale ${locale.languageCode} not fully supported by Material widgets, some UI elements may show in English',
      );
      // Still allow setting for your app's custom strings, but log warning
    }

    _locale = locale;
    notifyListeners();

    // Save to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale_code', locale.languageCode);

    ProductionLogger.i('App locale changed to: $locale');
  }

  Future<void> _loadLocaleFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString('locale_code');

      if (code != null) {
        final locale = Locale(code);
        if (_isLocaleSupportedByApp(locale)) {
          _locale = locale;
        } else {
          ProductionLogger.warning('Saved locale $code not supported by app');
        }
      }
    } catch (e) {
      ProductionLogger.e('Error loading locale from prefs', e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool _isLocaleSupportedByApp(Locale locale) {
    return AppLocalizations.supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    );
  }

  bool _isLocaleSupportedByMaterial(Locale locale) {
    // MaterialLocalizations supported languages
    const materialSupported = {
      'en',
      'es',
      'fr',
      'de',
      'it',
      'pt',
      'ru',
      'ja',
      'ko',
      'zh',
      'ar',
      'hi',
      'tr',
      'pl',
      'nl',
      'sv',
      'da',
      'fi',
      'no',
      'cs',
      'hu',
      'ro',
      'sk',
      'uk',
      'bg',
      'hr',
      'sr',
      'sl',
      'et',
      'lv',
      'lt',
      'el',
      'he',
      'id',
      'ms',
      'th',
      'vi',
      'fa',
      'ur',
      'sw',
      'am',
      'bn',
      'gu',
      'kn',
      'ml',
      'mr',
      'ne',
      'pa',
      'ta',
      'te',
      //'tr',
      //'zh',
    };

    return materialSupported.contains(locale.languageCode);
  }

  // Get display name for language
  String getDisplayName(String languageCode) {
    return _getLanguageDisplayName(Locale(languageCode));
  }

  String _getLanguageDisplayName(Locale locale) {
    switch (locale.languageCode) {
      case 'af':
        return 'Afrikaans';
      case 'am':
        return 'Amharic';
      case 'ar':
        return 'Arabic';
      case 'az':
        return 'Azerbaijani';
      case 'be':
        return 'Belarusian';
      case 'bg':
        return 'Bulgarian';
      case 'bn':
        return 'Bengali';
      case 'bs':
        return 'Bosnian';
      case 'ca':
        return 'Catalan';
      case 'ceb':
        return 'Cebuano';
      case 'co':
        return 'Corsican';
      case 'cs':
        return 'Czech';
      case 'cy':
        return 'Welsh';
      case 'da':
        return 'Danish';
      case 'de':
        return 'German';
      case 'el':
        return 'Greek';
      case 'en':
        return 'English';
      case 'eo':
        return 'Esperanto';
      case 'es':
        return 'Spanish';
      case 'et':
        return 'Estonian';
      case 'eu':
        return 'Basque';
      case 'fa':
        return 'Persian';
      case 'fi':
        return 'Finnish';
      case 'fr':
        return 'French';
      case 'fy':
        return 'Frisian';
      case 'ga':
        return 'Irish';
      case 'gd':
        return 'Scots Gaelic';
      case 'gl':
        return 'Galician';
      case 'gu':
        return 'Gujarati';
      case 'ha':
        return 'Hausa';
      case 'haw':
        return 'Hawaiian';
      case 'he':
        return 'Hebrew';
      case 'hi':
        return 'Hindi';
      case 'hmn':
        return 'Hmong';
      case 'hr':
        return 'Croatian';
      case 'ht':
        return 'Haitian Creole';
      case 'hu':
        return 'Hungarian';
      case 'hy':
        return 'Armenian';
      case 'id':
        return 'Indonesian';
      case 'ig':
        return 'Igbo';
      case 'is':
        return 'Icelandic';
      case 'it':
        return 'Italian';
      case 'ja':
        return 'Japanese';
      case 'jv':
        return 'Javanese';
      case 'ka':
        return 'Georgian';
      case 'kk':
        return 'Kazakh';
      case 'km':
        return 'Khmer';
      case 'kn':
        return 'Kannada';
      case 'ko':
        return 'Korean';
      case 'ku':
        return 'Kurdish';
      case 'ky':
        return 'Kyrgyz';
      case 'lb':
        return 'Luxembourgish';
      case 'lo':
        return 'Lao';
      case 'lt':
        return 'Lithuanian';
      case 'lv':
        return 'Latvian';
      case 'mg':
        return 'Malagasy';
      case 'mi':
        return 'Maori';
      case 'mk':
        return 'Macedonian';
      case 'ml':
        return 'Malayalam';
      case 'mn':
        return 'Mongolian';
      case 'mr':
        return 'Marathi';
      case 'ms':
        return 'Malay';
      case 'mt':
        return 'Maltese';
      case 'my':
        return 'Myanmar (Burmese)';
      case 'ne':
        return 'Nepali';
      case 'nl':
        return 'Dutch';
      case 'no':
        return 'Norwegian';
      case 'ny':
        return 'Nyanja (Chichewa)';
      case 'or':
        return 'Odia (Oriya)';
      case 'pa':
        return 'Punjabi';
      case 'pl':
        return 'Polish';
      case 'ps':
        return 'Pashto';
      case 'pt':
        return 'Portuguese';
      case 'ro':
        return 'Romanian';
      case 'ru':
        return 'Russian';
      case 'rw':
        return 'Kinyarwanda';
      case 'sd':
        return 'Sindhi';
      case 'si':
        return 'Sinhala';
      case 'sk':
        return 'Slovak';
      case 'sl':
        return 'Slovenian';
      case 'sm':
        return 'Samoan';
      case 'sn':
        return 'Shona';
      case 'so':
        return 'Somali';
      case 'sq':
        return 'Albanian';
      case 'sr':
        return 'Serbian';
      case 'st':
        return 'Sesotho';
      case 'su':
        return 'Sundanese';
      case 'sv':
        return 'Swedish';
      case 'sw':
        return 'Swahili';
      case 'ta':
        return 'Tamil';
      case 'te':
        return 'Telugu';
      case 'tg':
        return 'Tajik';
      case 'th':
        return 'Thai';
      case 'tk':
        return 'Turkmen';
      case 'tl':
        return 'Tagalog (Filipino)';
      case 'tr':
        return 'Turkish';
      case 'tt':
        return 'Tatar';
      case 'ug':
        return 'Uyghur';
      case 'uk':
        return 'Ukrainian';
      case 'ur':
        return 'Urdu';
      case 'uz':
        return 'Uzbek';
      case 'vi':
        return 'Vietnamese';
      case 'xh':
        return 'Xhosa';
      case 'yi':
        return 'Yiddish';
      case 'yo':
        return 'Yoruba';
      case 'zh':
        return 'Chinese (Simplified)';
      case 'zu':
        return 'Zulu';
      default:
        return locale.languageCode.toUpperCase();
    }
  }

  // Get list of languages with Material support info
  List<Map<String, dynamic>> getLanguagesWithSupportInfo() {
    return AppLocalizations.supportedLocales.map((locale) {
      final hasMaterialSupport = _isLocaleSupportedByMaterial(locale);
      return {
        'locale': locale,
        'name': _getLanguageDisplayName(locale),
        'hasMaterialSupport': hasMaterialSupport,
        'code': locale.languageCode,
      };
    }).toList();
  }
}
