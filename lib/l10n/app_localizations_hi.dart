// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get notificationSettings => 'अधिसूचना सेटिंग्स';

  @override
  String get privacySettings => 'गोपनीयता सेटिंग्स';

  @override
  String get accountSettings => 'खाता सेटिंग्स';

  @override
  String get languageSettings => 'भाषा सेटिंग्स';

  @override
  String get languageChanged => 'भाषा बदली गई';

  @override
  String get chooseCountryTitle => 'अपना देश चुनें';

  @override
  String get yesText => 'हाँ';

  @override
  String get noText => 'नहीं';

  @override
  String get appBarTitle => 'प्रोफ़ाइल सेटिंग';

  @override
  String get userIdLabel => 'उपयोगकर्ता ID';

  @override
  String get nameLabel => 'नाम';

  @override
  String get birthCountryLabel => 'जन्म देश';

  @override
  String get birthCityLabel => 'जन्म शहर';

  @override
  String get countrySelectionTitle => 'अपना देश चुनें';

  @override
  String get maleLabel => 'पुरुष';

  @override
  String get femaleLabel => 'महिला';

  @override
  String get birthDateLabel => 'जन्म तिथि';

  @override
  String get birthDatePlaceholder => 'जन्म तिथि';

  @override
  String get birthTimeLabel => 'जन्म समय';

  @override
  String get birthTimePlaceholder => 'जन्म समय चुनें';

  @override
  String get saveProfileButton => 'प्रोफ़ाइल सहेजें';

  @override
  String get noCitiesFound => 'कोई शहर नहीं मिला';

  @override
  String cityPlaceholder(Object country) {
    return 'शहर में प्रवेश करें';
  }

  @override
  String get countryFirstPlaceholder => 'पहला देश चुनें';

  @override
  String get versionHistoryTitle => 'संस्करण इतिहास';

  @override
  String get notSetText => 'सेट नहीं';

  @override
  String nameHistory(Object name) {
    return 'नाम: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'शहर: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'देश: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'जन्म तिथि: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'जन्म समय: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'स्थान: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'टाइमज़ोन: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'राज्य: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date से संस्करण';
  }

  @override
  String get userIdRequired => 'उपयोगकर्ता ID की आवश्यकता है';

  @override
  String get profileSaved => 'प्रोफ़ाइल सफलतापूर्वक बचाया';

  @override
  String get saveFailed => 'प्रोफ़ाइल को बचाने में विफल';

  @override
  String get errorPrefix => 'त्रुटि:';
}
