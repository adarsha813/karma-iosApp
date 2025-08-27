// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get notificationSettings => 'अधिसूचना सेटिंग';

  @override
  String get privacySettings => 'गोपनीयता सेटिंग';

  @override
  String get accountSettings => 'खाता सेटिंग';

  @override
  String get languageSettings => 'भाषा सेटिंग';

  @override
  String get languageChanged => 'भाषा बदली';

  @override
  String get existingUserButton => 'मैं एक मौजूदा उपयोगकर्ता हूँ';

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
  String countryHistory(Object country, Object pais) {
    return 'देश: $country';
  }

  @override
  String genderHistory(Object gender, Object genero) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date, Object fecha) {
    return 'जन्म तिथि: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'जन्म समय: $time';
  }

  @override
  String locationHistory(
    Object latitud,
    Object latitude,
    Object longitud,
    Object longitude,
  ) {
    return 'स्थान: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'टाइमज़ोन: GMT$offset';
  }

  @override
  String dstHistory(Object valor, Object value) {
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

  @override
  String get onboardingChooseLanguage => 'अपनी भाषा चुनें';

  @override
  String get onboardingChooseLanguageDesc =>
      'जारी रखने के लिए अपनी पसंदीदा भाषा चुनें।';

  @override
  String get onboardingWhatIsAstrology => 'ज्योतिष क्या है?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ज्योतिष आकाशीय पिंडों का अध्ययन है...';

  @override
  String get onboardingWhyUseApp => 'इस ऐप का उपयोग क्यों करें?';

  @override
  String get onboardingWhyUseAppDesc =>
      'व्यक्तिगत राशिफल, दैनिक भविष्यवाणियाँ, और निर्णय लेने में मार्गदर्शन प्राप्त करें।';

  @override
  String get onboardingHowToUse => 'इस ऐप का उपयोग कैसे करें?';

  @override
  String get onboardingHowToUseDesc =>
      'आसानी से नेविगेट करें, दैनिक राशिफल देखें और सटीक भविष्यवाणियों के लिए प्रोफ़ाइल प्रबंधित करें।';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get onboardingNewUser => 'नया उपयोगकर्ता';

  @override
  String get onboardingExistingUser => 'मौजूदा उपयोगकर्ता';

  @override
  String get onboardingBack => 'पीछे';

  @override
  String get onboardingNext => 'अगला';
}
