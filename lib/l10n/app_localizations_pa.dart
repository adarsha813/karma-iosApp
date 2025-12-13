// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get settingsTitle => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get notificationSettings => 'ਸੂਚਨਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get privacySettings => 'ਗੋਪਨੀਯਤਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get accountSettings => 'ਖਾਤਾ ਯੋਜਨਾ';

  @override
  String get languageSettings => 'ਭਾਸ਼ਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get languageChanged => 'ਭਾਸ਼ਾ ਬਦਲ ਗਈ';

  @override
  String get existingUserButton => 'ਮੈਂ ਇੱਕ ਮੌਜੂਦਾ ਵਰਤੋਂਕਾਰ ਹਾਂ।';

  @override
  String get chooseCountryTitle => 'ਦੇਸ਼ ਚੁਣੋ';

  @override
  String get yesText => 'ਹਾਂ';

  @override
  String get noText => 'ਨਹੀਂ';

  @override
  String get appBarTitle => 'ਪ੍ਰੋਫਾਈਲ ਸੈਟਿੰਗਾਂ';

  @override
  String get userIdLabel => 'ਯੂਜਰ ਆਈਡੀ *';

  @override
  String get nameLabel => 'ਨਾਮ';

  @override
  String get birthCountryLabel => 'ਜਨਮ ਦੇਸ਼';

  @override
  String get birthCityLabel => 'ਜਨਮ ਸ਼ਹਿਰ';

  @override
  String get countrySelectionTitle => 'ਆਪਣਾ ਦੇਸ਼ ਚੁਣੋ';

  @override
  String get maleLabel => 'ਮਰਦ';

  @override
  String get femaleLabel => 'ਔਰਤ';

  @override
  String get birthDateLabel => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get birthDatePlaceholder => 'ਜਨਮ ਮਿਤੀ ਚੁਣੋ';

  @override
  String get birthTimeLabel => 'ਜਨਮ ਸਮਾਂ';

  @override
  String get birthTimePlaceholder => 'ਜਨਮ ਸਮਾਂ ਚੁਣੋ';

  @override
  String get saveProfileButton => 'ਪ੍ਰੋਫਾਈਲ ਸੇਵ ਕਰੋ';

  @override
  String get noCitiesFound => 'ਕੋਈ ਸ਼ਹਿਰ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String cityPlaceholder(Object country) {
    return '$country ਵਿੱਚ ਸ਼ਹਿਰ ਦਾਖਲ ਕਰੋ';
  }

  @override
  String get countryFirstPlaceholder => 'ਪਹਿਲਾਂ ਦੇਸ਼ ਚੁਣੋ';

  @override
  String get versionHistoryTitle => 'ਵਰਜਨ ਇਤਿਹਾਸ';

  @override
  String get notSetText => 'ਸੈੱਟ ਨਹੀਂ ਹੈ';

  @override
  String nameHistory(Object name) {
    return 'ਨਾਮ: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ਸ਼ਹਿਰ: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ਦੇਸ਼: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ਲਿੰਗ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ਜਨਮ ਮਿਤੀ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ਜਨਮ ਸਮਾਂ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ਟਿਕਾਣਾ: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ਸਮਾਂ ਖੇਤਰ: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ਸਥਿਤੀ: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date ਨੂੰ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String get userIdRequired => 'ਯੂਜ਼ਰ ਆਈਡੀ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get profileSaved => 'ਪ੍ਰੋਫਾਈਲ ਸਫਲਤਾਪੂਰਵਕ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String get saveFailed => 'ਪ੍ਰੋਫਾਈਲ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get errorPrefix => 'ਗਲਤੀ:';

  @override
  String get onboardingChooseLanguage => 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get onboardingChooseLanguageDesc =>
      'ਜਾਰੀ ਰੱਖਣ ਲਈ ਆਪਣੀ ਪਸੰਦੀਦਾ ਭਾਸ਼ਾ ਚੁਣੋ।';

  @override
  String get onboardingWhatIsAstrology => 'ਜੋਤਿਸ਼ ਕੀ ਹੈ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ਜੋਤਿਸ਼ ਵਿਗਿਆਨ ਸਵਰਗੀ ਗਤੀਵਿਧੀਆਂ ਅਤੇ ਮਨੁੱਖੀ ਜੀਵਨ \'ਤੇ ਉਨ੍ਹਾਂ ਦੇ ਪ੍ਰਭਾਵ ਦਾ ਪ੍ਰਾਚੀਨ ਅਧਿਐਨ ਹੈ, ਜੋ ਸ਼ਖਸੀਅਤ, ਸਬੰਧਾਂ ਅਤੇ ਜੀਵਨ ਦੀਆਂ ਘਟਨਾਵਾਂ ਬਾਰੇ ਸੂਝ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।';

  @override
  String get onboardingWhyUseApp => 'ਇਸ ਐਪ ਦੀ ਵਰਤੋਂ ਕਿਉਂ ਕਰੀਏ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ਆਪਣੀ ਜਨਮ ਕੁੰਡਲੀ ਦੇ ਅਨੁਸਾਰ ਸਹੀ, ਮਨੁੱਖ ਦੁਆਰਾ ਤਿਆਰ ਕੀਤੀਆਂ ਕੁੰਡਲੀਆਂ ਅਤੇ ਮਾਰਗਦਰਸ਼ਨ ਪ੍ਰਾਪਤ ਕਰੋ। ਰੋਜ਼ਾਨਾ ਭਵਿੱਖਬਾਣੀਆਂ ਅਤੇ ਤਜਰਬੇਕਾਰ ਜੋਤਸ਼ੀਆਂ ਤੋਂ ਵਿਅਕਤੀਗਤ ਸਲਾਹ ਨਾਲ ਸੂਚਿਤ ਫੈਸਲੇ ਲਓ।';

  @override
  String get onboardingHowToUse => 'ਇਸ ਐਪ ਦੀ ਵਰਤੋਂ ਕਿਵੇਂ ਕਰੀਏ?';

  @override
  String get onboardingHowToUseDesc =>
      'ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਕਰਨ ਲਈ ਬਸ ਆਪਣੀ ਜਨਮ ਮਿਤੀ, ਸਹੀ ਸਮਾਂ, ਜਨਮ ਸਥਾਨ, ਅਤੇ ਕੋਈ ਹੋਰ ਸੰਬੰਧਿਤ ਵੇਰਵੇ ਦਰਜ ਕਰੋ। ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀਆਂ ਦੀ ਪੜਚੋਲ ਕਰੋ, ਮਾਹਰ ਜੋਤਸ਼ੀਆਂ ਤੋਂ ਸਵਾਲ ਪੁੱਛੋ, ਅਤੇ ਸਟੀਕ, ਵਿਅਕਤੀਗਤ ਭਵਿੱਖਬਾਣੀਆਂ ਲਈ ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ—ਕੋਈ ਲੌਗਇਨ ਲੋੜੀਂਦਾ ਨਹੀਂ ਹੈ।';

  @override
  String get onboardingGetStarted => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get onboardingNewUser => 'ਨਵਾਂ ਯੂਜ਼ਰ';

  @override
  String get onboardingExistingUser => 'ਮੌਜੂਦਾ ਵਰਤੋਂਕਾਰ';

  @override
  String get onboardingBack => 'ਪਿੱਛੇ';

  @override
  String get onboardingNext => 'ਅਗਲਾ';

  @override
  String get userIdNotFound =>
      'ਯੂਜ਼ਰ ਆਈਡੀ ਨਹੀਂ ਮਿਲੀ। ਕਿਰਪਾ ਕਰਕੇ ਲੌਗਇਨ ਕਰੋ ਜਾਂ ਆਪਣਾ ਪ੍ਰੋਫਾਈਲ ਸੈੱਟ ਕਰੋ।';

  @override
  String get clearNotificationsTitle => 'ਸੂਚਨਾਵਾਂ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearNotificationsMessage =>
      'ਕੀ ਤੁਸੀਂ ਯਕੀਨਨ ਸਾਰੀਆਂ ਸੂਚਨਾਵਾਂ ਨੂੰ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get clearNotificationsSuccess =>
      'ਸਾਰੀਆਂ ਸੂਚਨਾਵਾਂ ਸਫਲਤਾਪੂਰਵਕ ਕਲੀਅਰ ਕੀਤੀਆਂ ਗਈਆਂ।';

  @override
  String get clearHoroscopeTitle => 'ਸਾਫ਼ ਕੁੰਡਲੀ';

  @override
  String get clearHoroscopeMessage =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਆਪਣਾ ਕੁੰਡਲੀ ਡੇਟਾ ਸਾਫ਼ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get clearHoroscopeSuccess => 'ਕੁੰਡਲੀ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਹੋ ਗਈ।';

  @override
  String get clearChatTitle => 'ਚੈਟ ਇਤਿਹਾਸ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearChatMessage =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਆਪਣਾ ਸਾਰਾ ਚੈਟ ਇਤਿਹਾਸ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get clearChatLocal => 'ਚੈਟ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਕਲੀਅਰ ਕੀਤੀ ਗਈ।';

  @override
  String get deleteAccountTitle => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountMessage =>
      'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਆਪਣਾ ਖਾਤਾ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਹ ਤੁਹਾਡੇ ਸਾਰੇ ਚੈਟ ਇਤਿਹਾਸ ਅਤੇ ਸੂਚਨਾਵਾਂ ਨੂੰ ਵੀ ਸਾਫ਼ ਕਰ ਦੇਵੇਗਾ।';

  @override
  String get deleteAccountSuccess =>
      'ਤੁਹਾਡਾ ਖਾਤਾ ਅਤੇ ਸਾਰਾ ਡਾਟਾ ਹਟਾ ਦਿੱਤਾ ਗਿਆ ਹੈ।';

  @override
  String get deleteAccountError => 'ਖਾਤਾ ਮਿਟਾਉਣ ਵਿੱਚ ਗੜਬੜ ਹੋਈ';

  @override
  String get logoutTitle => 'ਲਾਗਆਉਟ';

  @override
  String get logoutMessage => 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਲੌਗਆਉਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get termsPrivacyTitle => 'ਨਿਯਮ ਅਤੇ ਗੋਪਨੀਯਤਾ';

  @override
  String get privacyPolicyTitle => 'ਪਰਾਈਵੇਟ ਨੀਤੀ';

  @override
  String get termsConditionsTitle => 'ਨਿਯਮ ਅਤੇ ਸ਼ਰਤਾਂ';

  @override
  String get dataControlTitle => 'ਡਾਟਾ ਕੰਟਰੋਲ';

  @override
  String get cancelButton => 'ਰੱਦ ਕਰੋ';

  @override
  String get confirmButton => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get clearQuestionsSuccess => 'ਸਾਰੇ ਸਵਾਲ ਸਫਲਤਾਪੂਰਵਕ ਮਿਟਾਏ ਗਏ।';

  @override
  String get yoginiLabel => 'ਯੋਗਿਨੀ';

  @override
  String get lordLabel => 'ਪ੍ਰਭੂ';

  @override
  String get startLabel => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get recoverAccount => 'ਖਾਤਾ ਮੁੜ ਪ੍ਰਾਪਤ ਕਰੋ';

  @override
  String get endLabel => 'ਅੰਤ';

  @override
  String get startDateLabel => 'ਤਾਰੀਖ ਸ਼ੁਰੂ';

  @override
  String get endDateLabel => 'ਸਮਾਪਤੀ ਮਿਤੀ';

  @override
  String get notAvailable => 'ਉਪਲਭਦ ਨਹੀ';

  @override
  String get noData => 'ਕੋਈ ਡਾਟਾ ਨਹੀਂ';

  @override
  String get unknownError => 'ਅਗਿਆਤ ਗਲਤੀ';

  @override
  String get retryButton => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get kundaliGeneratorTitle => 'ਕੁੰਡਲੀ ਜਨਰੇਟਰ';

  @override
  String get natalChartTitle => 'ਨੇਟਲ ਕੁੰਡਲੀ';

  @override
  String get lagnaLabel => 'ਲਗਨਾ';

  @override
  String get rashiLabel => 'ਰਾਸ਼ੀ';

  @override
  String get ascDegreeLabel => 'ਚੜ੍ਹਦੀ ਡਿਗਰੀ';

  @override
  String get vimshottariDashaTitle => 'ਵਿਮਸ਼ੋਤਰੀ ਦਸ਼ਾ';

  @override
  String get yoginiDashaTitle => 'ਯੋਗਿਨੀ ਦਸ਼ਾ';

  @override
  String get unknown => 'ਅਣਜਾਣ';

  @override
  String get clearHoroscope => 'ਸਾਫ਼ ਕੁੰਡਲੀ';

  @override
  String get clearNotifications => 'ਸੂਚਨਾਵਾਂ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearChatHistory => 'ਚੈਟ ਇਤਿਹਾਸ ਸਾਫ਼ ਕਰੋ';

  @override
  String get logout => 'ਲਾਗਆਉਟ';

  @override
  String get deleteAccount => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get allFieldsRequired => 'ਸਾਰੇ ਖੇਤਰ ਲੋੜੀਂਦੇ ਹਨ।';

  @override
  String get accountRecoveredSuccess => 'ਖਾਤਾ ਸਫਲਤਾਪੂਰਵਕ ਰਿਕਵਰ ਕੀਤਾ ਗਿਆ।';

  @override
  String get recoveryFailed => 'ਰਿਕਵਰੀ ਅਸਫਲ ਰਹੀ। ਆਪਣੀ ਜਾਣਕਾਰੀ ਦੀ ਜਾਂਚ ਕਰੋ।';

  @override
  String get recoverySecretLabel => 'ਰਿਕਵਰੀ ਰਾਜ਼:';

  @override
  String get aboutUsTitle => 'ਸਾਡੇ ਬਾਰੇ';

  @override
  String get aboutOurCompany => 'ਸਾਡੀ ਕੰਪਨੀ ਬਾਰੇ';

  @override
  String get aboutCompanyDescription =>
      'ਕਰਮਾ ਵਿਖੇ, ਅਸੀਂ ਵੈਦਿਕ ਜੋਤਿਸ਼ ਦੀ ਸਦੀਵੀ ਬੁੱਧੀ ਰਾਹੀਂ ਤੁਹਾਡੇ ਸੱਚੇ ਜੀਵਨ ਮਾਰਗ ਨੂੰ ਉਜਾਗਰ ਕਰਨ ਵਿੱਚ ਤੁਹਾਡੀ ਮਦਦ ਕਰਦੇ ਹਾਂ। ਹਰ ਸੂਝ ਅਸਲ, ਤਜਰਬੇਕਾਰ ਜੋਤਸ਼ੀਆਂ ਤੋਂ ਆਉਂਦੀ ਹੈ, ਜੋ ਤੁਹਾਡੇ ਵਿਲੱਖਣ ਜਨਮ ਚਾਰਟ ਦੇ ਆਧਾਰ \'ਤੇ ਧਿਆਨ ਨਾਲ ਤਿਆਰ ਕੀਤੀ ਗਈ ਹੈ। ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀਆਂ ਤੋਂ ਲੈ ਕੇ ਵਿਅਕਤੀਗਤ ਮਾਰਗਦਰਸ਼ਨ ਤੱਕ, ਕਰਮਾ ਪ੍ਰਾਚੀਨ ਗਿਆਨ ਨੂੰ 100 ਤੋਂ ਵੱਧ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ ਪਹੁੰਚਯੋਗ ਬਣਾਉਂਦਾ ਹੈ।';

  @override
  String get ourMission => 'ਸਾਡਾ ਮਿਸ਼ਨ';

  @override
  String get missionDescription =>
      'ਸਾਡਾ ਮਿਸ਼ਨ ਸਰਲ ਹੈ: ਪ੍ਰਮਾਣਿਕ, ਮਨੁੱਖ-ਅਗਵਾਈ ਵਾਲੇ ਜੋਤਿਸ਼ ਮਾਰਗਦਰਸ਼ਨ ਪ੍ਰਦਾਨ ਕਰਨਾ ਜੋ ਤੁਹਾਨੂੰ ਆਤਮਵਿਸ਼ਵਾਸ, ਸੂਚਿਤ ਫੈਸਲੇ ਲੈਣ ਲਈ ਸ਼ਕਤੀ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ। ਹਰ ਭਵਿੱਖਬਾਣੀ ਅਤੇ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਸਾਲਾਂ ਦੀ ਪੇਸ਼ੇਵਰ ਮੁਹਾਰਤ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ, ਨਾ ਕਿ ਸਵੈਚਾਲਿਤ ਐਲਗੋਰਿਦਮ ਨੂੰ।';

  @override
  String get ourVision => 'ਸਾਡਾ ਵਿਜ਼ਨ';

  @override
  String get visionDescription =>
      'ਅਸੀਂ ਵੈਦਿਕ ਜੋਤਿਸ਼ ਲਈ ਦੁਨੀਆ ਦਾ ਸਭ ਤੋਂ ਭਰੋਸੇਮੰਦ ਪਲੇਟਫਾਰਮ ਬਣਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਜੋ ਹਰ ਜਗ੍ਹਾ ਲੋਕਾਂ ਨੂੰ ਆਪਣੇ ਆਪ ਨੂੰ, ਉਨ੍ਹਾਂ ਦੀਆਂ ਚੋਣਾਂ ਨੂੰ, ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਜੀਵਨ ਸਫ਼ਰ ਨੂੰ ਸਪਸ਼ਟਤਾ ਅਤੇ ਵਿਸ਼ਵਾਸ ਨਾਲ ਸਮਝਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।';

  @override
  String get ourValues => 'ਸਾਡੇ ਮੁੱਲ';

  @override
  String get valuesDescription =>
      'ਕਰਮਾ ਵਿਖੇ, ਅਸੀਂ ਪ੍ਰਮਾਣਿਕਤਾ, ਸ਼ੁੱਧਤਾ ਅਤੇ ਵਿਸ਼ਵਾਸ ਦੀ ਕਦਰ ਕਰਦੇ ਹਾਂ। ਅਸੀਂ ਅਜਿਹੀ ਅਗਵਾਈ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ਵਚਨਬੱਧ ਹਾਂ ਜੋ ਨਾ ਸਿਰਫ਼ ਸਹੀ ਹੋਵੇ ਬਲਕਿ ਅਰਥਪੂਰਨ ਵੀ ਹੋਵੇ, ਜੋ ਤੁਹਾਨੂੰ ਸਮਝ ਅਤੇ ਵਿਸ਼ਵਾਸ ਨਾਲ ਜ਼ਿੰਦਗੀ ਨੂੰ ਨੇਵੀਗੇਟ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰੇ।';

  @override
  String get contactUs => 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get contactEmail => 'ਈਮੇਲ: support@yourcompany.com';

  @override
  String get contactWebsite => 'ਵੈੱਬਸਾਈਟ: www.yourcompany.com';

  @override
  String get customerSupport => 'ਗਾਹਕ ਸਹਾਇਤਾ';

  @override
  String get supportHeroTitle => 'ਅਸੀਂ ਮਦਦ ਲਈ ਹਾਜ਼ਰ ਹਾਂ';

  @override
  String get supportHeroDescription =>
      'ਹੇਠਾਂ ਦਿੱਤਾ ਫਾਰਮ ਭਰੋ ਅਤੇ ਸਾਡੀ ਸਹਾਇਤਾ ਟੀਮ ਜਿੰਨੀ ਜਲਦੀ ਹੋ ਸਕੇ ਤੁਹਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੇਗੀ।';

  @override
  String get yourName => 'ਤੁਹਾਡਾ ਨਾਮ';

  @override
  String get yourEmail => 'ਤੁਹਾਡਾ ਈਮੇਲ';

  @override
  String get message => 'ਸੁਨੇਹਾ';

  @override
  String get enterEmail => 'ਆਪਣਾ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get enterValidEmail => 'ਇੱਕ ਵੈਧ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ਦਰਜ ਕਰੋ';
  }

  @override
  String get send => 'ਭੇਜੋ';

  @override
  String get sending => 'ਭੇਜ ਰਿਹਾ ਹੈ...';

  @override
  String get emailSentSuccess => '✅ ਈਮੇਲ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜੀ ਗਈ!';

  @override
  String get emailSendFailed => '❌ ਈਮੇਲ ਭੇਜਣ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get astroDictionaryTitle => 'ਐਸਟ੍ਰੋ ਡਿਕਸ਼ਨਰੀ';

  @override
  String get searchTermsHint => 'ਖੋਜ ਸ਼ਬਦ...';

  @override
  String get noTermsFound => 'ਕੋਈ ਸ਼ਬਦ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get buyQuestionsTitle => 'ਸਵਾਲ ਖਰੀਦੋ';

  @override
  String get userNotAuthenticated => 'ਵਰਤੋਂਕਾਰ ਪ੍ਰਮਾਣਿਤ ਨਹੀਂ ਹੈ';

  @override
  String get loadStoreDataFailed => 'ਸਟੋਰ ਡਾਟਾ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get missingAuthToken => 'ਪ੍ਰਮਾਣੀਕਰਨ ਟੋਕਨ ਗੁੰਮ ਹੈ';

  @override
  String get merchantDisplayName => 'ਐਸਟ੍ਰੋ ਚੈਟ ਐਪ';

  @override
  String get paymentSuccessful => '✅ ਭੁਗਤਾਨ ਸਫਲ ਰਿਹਾ! ਸਵਾਲ ਭੇਜਿਆ ਗਿਆ';

  @override
  String paymentFailed(Object error) {
    return '❌ ਭੁਗਤਾਨ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get yourBalance => 'ਤੁਹਾਡਾ ਬਕਾਇਆ';

  @override
  String questionsBalance(Object count) {
    return '$count ਸਵਾਲ';
  }

  @override
  String get availableOffers => 'ਉਪਲਬਧ ਪੇਸ਼ਕਸ਼ਾਂ';

  @override
  String questionsCount(Object count) {
    return '$count ਸਵਾਲ';
  }

  @override
  String get buyButton => 'ਖਰੀਦੋ';

  @override
  String get dailyHoroscopeTitle => '🌟 ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀ';

  @override
  String get userIdMissing => 'ਯੂਜ਼ਰ ਆਈਡੀ ਗੁੰਮ ਹੈ।';

  @override
  String get fetchHoroscopesFailed => 'ਕੁੰਡਲੀਆਂ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get noHoroscopeFound => 'ਕੋਈ ਕੁੰਡਲੀ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get signLabel => 'ਸਾਈਨ';

  @override
  String get todayLabel => 'ਅੱਜ';

  @override
  String get yesterdayLabel => 'ਕੱਲ੍ਹ';

  @override
  String get thisWeekLabel => 'ਇਸ ਹਫ਼ਤੇ';

  @override
  String get lastMonthLabel => 'ਪਿਛਲਾ ਮਹੀਨਾ';

  @override
  String get chatTitle => 'ਚੈਟ';

  @override
  String get typeYourQuestionHint => 'ਆਪਣਾ ਸਵਾਲ ਟਾਈਪ ਕਰੋ...';

  @override
  String get paymentRequired => 'ਭੁਗਤਾਨ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'ਤੁਸੀਂ ਆਪਣੇ ਮੁਫ਼ਤ ਸਵਾਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰ ਲਈ ਹੈ। ਜਾਰੀ ਰੱਖਣ ਲਈ $amount ਦਾ ਭੁਗਤਾਨ ਕਰੋ।';
  }

  @override
  String get payNowButton => 'ਹੁਣੇ ਭੁਗਤਾਨ ਕਰੋ';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ਬਾਕੀ ਮੁਫ਼ਤ ਸਵਾਲ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ਭੁਗਤਾਨ ਕੀਤੇ ਸਵਾਲ ਬਾਕੀ ਹਨ';
  }

  @override
  String get thankYouFeedback => 'ਤੁਹਾਡੇ ਫੀਡਬੈਕ ਲਈ ਧੰਨਵਾਦ!';

  @override
  String get ratingSubmitted => 'ਰੇਟਿੰਗ ਜਮ੍ਹਾਂ ਕਰਵਾਈ ਗਈ!';

  @override
  String get setUserIdFirst => 'ਕਿਰਪਾ ਕਰਕੇ ਪਹਿਲਾਂ ਆਪਣੀ ਯੂਜ਼ਰ ਆਈਡੀ ਸੈੱਟ ਕਰੋ।';

  @override
  String get failedToFetchPrevious =>
      'ਪਿਛਲੇ ਸਵਾਲ ਅਤੇ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰਨ ਵਿੱਚ ਅਸਫਲ ਰਿਹਾ';

  @override
  String errorOccurred(Object error) {
    return 'ਗਲਤੀ: $error';
  }

  @override
  String get drawerAstroProfile => 'ਐਸਟ੍ਰੋ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get drawerDailyHoroscope => 'ਰੋਜ਼ਾਨਾ ਰਾਸ਼ੀਫਲ';

  @override
  String get drawerBuyQuestions => 'ਸਵਾਲ ਖਰੀਦੋ';

  @override
  String get drawerAstroDictionary => 'ਐਸਟ੍ਰੋ ਡਿਕਸ਼ਨਰੀ';

  @override
  String get drawerSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get drawerCustomerSupport => 'ਗਾਹਕ ਸਹਾਇਤਾ';

  @override
  String get drawerAbout => 'ਬਾਰੇ';

  @override
  String get drawerProfileSettings => 'ਪ੍ਰੋਫਾਈਲ ਸੈਟਿੰਗਾਂ';

  @override
  String get demoNotificationTitle => '🔔 ਡੈਮੋ ਸੂਚਨਾ';

  @override
  String get demoNotificationBody => 'ਇਹ ਤੁਹਾਡੀ ਐਪ ਤੋਂ ਇੱਕ ਟੈਸਟ ਸੂਚਨਾ ਹੈ!';

  @override
  String get notificationsTitle => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get noNotifications => 'ਕੋਈ ਸੂਚਨਾਵਾਂ ਨਹੀਂ';

  @override
  String get allTab => 'ਸਾਰੇ';

  @override
  String get markAllAsRead => 'ਸਭ ਨੂੰ ਪੜ੍ਹੇ ਹੋਏ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰੋ';

  @override
  String get notificationMarkedRead =>
      'ਸੂਚਨਾ ਨੂੰ ਪੜ੍ਹਿਆ ਹੋਇਆ ਵਜੋਂ ਚਿੰਨ੍ਹਿਤ ਕੀਤਾ ਗਿਆ';

  @override
  String get failedToLoadNotifications => 'ਸੂਚਨਾਵਾਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get failedToMarkRead => 'ਪੜ੍ਹੇ ਹੋਏ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get failedToMarkAllRead =>
      'ਸਭ ਨੂੰ ਪੜ੍ਹੇ ਹੋਏ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get socketConnected => 'ਸਾਕਟ ਜੁੜਿਆ ਹੋਇਆ ਹੈ';

  @override
  String get socketDisconnected => 'ਸਾਕਟ ਡਿਸਕਨੈਕਟ ਹੋ ਗਿਆ';

  @override
  String get newNotificationReceived => 'ਨਵੀਂ ਸੂਚਨਾ ਪ੍ਰਾਪਤ ਹੋਈ';

  @override
  String get generalCategory => 'ਜਨਰਲ';

  @override
  String get horoscopeCategory => 'ਕੁੰਡਲੀ';

  @override
  String get chatCategory => 'ਚੈਟ';

  @override
  String get systemCategory => 'ਸਿਸਟਮ';

  @override
  String get updateCategory => 'ਅੱਪਡੇਟ';

  @override
  String get howToAskTitle => 'ਕਿਵੇਂ ਪੁੱਛਣਾ ਹੈ';

  @override
  String get noQuestionsAvailable => 'ਕੋਈ ਸਵਾਲ ਉਪਲਬਧ ਨਹੀਂ ਹਨ';

  @override
  String get failedToLoadQuestions => 'ਸਵਾਲ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get pullToRefresh => 'ਤਾਜ਼ਾ ਕਰਨ ਲਈ ਖਿੱਚੋ';

  @override
  String get careerCategory => 'ਕਰੀਅਰ';

  @override
  String get loveCategory => 'ਪਿਆਰ ਅਤੇ ਰਿਸ਼ਤੇ';

  @override
  String get healthCategory => 'ਸਿਹਤ';

  @override
  String get financeCategory => 'ਵਿੱਤ';

  @override
  String get familyCategory => 'ਪਰਿਵਾਰ';

  @override
  String get educationCategory => 'ਸਿੱਖਿਆ';

  @override
  String get travelCategory => 'ਯਾਤਰਾ';

  @override
  String get spiritualCategory => 'ਅਧਿਆਤਮਿਕ';

  @override
  String get profileLoaded => 'ਪ੍ਰੋਫਾਈਲ ਸਫਲਤਾਪੂਰਵਕ ਲੋਡ ਕੀਤਾ ਗਿਆ';

  @override
  String get imageUploaded => 'ਚਿੱਤਰ ਸਫਲਤਾਪੂਰਵਕ ਅੱਪਲੋਡ ਕੀਤਾ ਗਿਆ';

  @override
  String get savedInformationConfirmation => 'ਮੈਂ ਇਹ ਜਾਣਕਾਰੀ ਸੇਵ ਕਰ ਲਈ ਹੈ।';

  @override
  String get noHistoryAvailable => 'ਕੋਈ ਇਤਿਹਾਸ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get missingUserIdError => 'ਯੂਜ਼ਰ ਆਈਡੀ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get networkError => 'ਨੈੱਟਵਰਕ ਗਲਤੀ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get timeoutError => 'ਬੇਨਤੀ ਦਾ ਸਮਾਂ ਸਮਾਪਤ ਹੋਇਆ';

  @override
  String get genericError => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ।';

  @override
  String get reactionUpdateError => 'ਪ੍ਰਤੀਕਿਰਿਆ ਨੂੰ ਅੱਪਡੇਟ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get noSearchResults => 'ਕੋਈ ਖੋਜ ਨਤੀਜੇ ਨਹੀਂ ਮਿਲੇ।';

  @override
  String get clearSearch => 'ਖੋਜ ਸਾਫ਼ ਕਰੋ';

  @override
  String get resultsFound => 'ਨਤੀਜੇ ਮਿਲੇ';

  @override
  String get recoverySecretHint => 'ਕਾਪੀ-ਪੇਸਟ ਕੰਮ ਨਹੀਂ ਕਰ ਸਕਦਾ, ਹੱਥੀਂ ਟਾਈਪ ਕਰੋ';

  @override
  String get recoverAccountDescription =>
      'ਆਪਣੇ ਖਾਤੇ ਨੂੰ ਮੁੜ-ਹਾਸਲ ਕਰਨ ਲਈ ਇਹਨਾਂ ਕਦਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ';

  @override
  String get processingLabel => 'ਪ੍ਰਕਿਰਿਆ ਹੋ ਰਹੀ ਹੈ...';

  @override
  String get clearChatSuccess => 'ਚੈਟ ਸਫਲਤਾਪੂਰਵਕ ਕਲੀਅਰ ਕੀਤੀ ਗਈ';

  @override
  String get notificationsEnabled => 'ਸੂਚਨਾਵਾਂ ਚਾਲੂ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get notificationsDisabled => 'ਸੂਚਨਾਵਾਂ ਬੰਦ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get securityNotice =>
      'ਤੁਹਾਡਾ ਡੇਟਾ ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਏਨਕ੍ਰਿਪਟਡ ਅਤੇ ਸਟੋਰ ਕੀਤਾ ਗਿਆ ਹੈ।';

  @override
  String get loading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get selectLanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get onboardingGetStartedDesc => 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣ ਕੇ ਸ਼ੁਰੂਆਤ ਕਰੋ';

  @override
  String get accountRecoveryTitle => '🔐 ਖਾਤਾ ਰਿਕਵਰੀ ਵੇਰਵੇ';

  @override
  String get recoveryInstructions =>
      'ਕਿਰਪਾ ਕਰਕੇ ਇਸ ਜਾਣਕਾਰੀ ਨੂੰ ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਸੁਰੱਖਿਅਤ ਕਰੋ। ਤੁਹਾਨੂੰ ਆਪਣਾ ਖਾਤਾ ਰਿਕਵਰ ਕਰਨ ਲਈ ਇਸਦੀ ਲੋੜ ਪਵੇਗੀ।';

  @override
  String get importantNotice => '⚠️ ਮਹੱਤਵਪੂਰਨ:';

  @override
  String get astrologerProfileTitle => 'ਜੋਤਸ਼ੀ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get personalAstrologer => 'ਨਿੱਜੀ ਜੋਤਸ਼ੀ';

  @override
  String get makePersonalAstrologer => 'ਨਿੱਜੀ ਜੋਤਸ਼ੀ ਬਣਾਓ';

  @override
  String get favoriteDescription =>
      'ਤੁਹਾਡੇ ਸਵਾਲਾਂ ਨੂੰ ਇਸ ਜੋਤਸ਼ੀ ਨੂੰ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਵੇਗੀ। ਜੇਕਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ, ਤਾਂ ਕੋਈ ਹੋਰ ਯੋਗ ਜੋਤਸ਼ੀ ਤੁਹਾਡੀ ਮਦਦ ਕਰੇਗਾ।';

  @override
  String get educationQualifications => 'ਸਿੱਖਿਆ ਅਤੇ ਯੋਗਤਾਵਾਂ';

  @override
  String get aboutSection => 'ਬਾਰੇ';

  @override
  String get shareProfile => 'ਪ੍ਰੋਫਾਈਲ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get loadingAstrologer => 'ਜੋਤਸ਼ੀ ਵੇਰਵੇ ਲੋਡ ਕੀਤੇ ਜਾ ਰਹੇ ਹਨ...';

  @override
  String get failedToLoadAstrologer => 'ਜੋਤਸ਼ੀ ਵੇਰਵੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get authenticationRequired =>
      'ਪ੍ਰਮਾਣੀਕਰਨ ਲੋੜੀਂਦਾ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਲੌਗ ਇਨ ਕਰੋ।';

  @override
  String securityCheckFailed(Object error) {
    return 'ਸੁਰੱਖਿਆ ਜਾਂਚ ਅਸਫਲ ਰਹੀ: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ਹੁਣ ਤੁਹਾਡਾ ਨਿੱਜੀ ਜੋਤਸ਼ੀ ਹੈ';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ਮਨਪਸੰਦ ਵਿੱਚੋਂ $name ਹਟਾਇਆ ਗਿਆ';
  }

  @override
  String get toggleFavoriteError => 'ਮਨਪਸੰਦ ਸਥਿਤੀ ਨੂੰ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ਸਿੱਖਿਆ: $education\n📜 ਯੋਗਤਾ: $qualification\n⏳ ਅਨੁਭਵ: $experience';
  }

  @override
  String get notProvided => 'ਮੁਹੱਈਆ ਨਹੀਂ ਕਰਵਾਇਆ ਗਿਆ';

  @override
  String reviews(Object count) {
    return '($count ਸਮੀਖਿਆਵਾਂ)';
  }

  @override
  String get specialties => 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ';

  @override
  String get experience => 'ਅਨੁਭਵ';

  @override
  String get qualification => 'ਯੋਗਤਾ';

  @override
  String get education => 'ਸਿੱਖਿਆ';

  @override
  String get recoveryTips =>
      '• ਇਸ ਜਾਣਕਾਰੀ ਦਾ ਸਕ੍ਰੀਨਸ਼ੌਟ ਲਓ\n• ਇਸਨੂੰ ਸੁਰੱਖਿਅਤ ਜਗ੍ਹਾ \'ਤੇ ਸਟੋਰ ਕਰੋ\n• ਕਿਸੇ ਨਾਲ ਸਾਂਝਾ ਨਾ ਕਰੋ\n• ਇਹ ਸਿਰਫ਼ ਇੱਕ ਵਾਰ ਦਿਖਾਇਆ ਜਾਵੇਗਾ';

  @override
  String get themeSettingsTitle => 'ਥੀਮ ਸੈਟਿੰਗਾਂ';

  @override
  String get lightThemeLabel => 'ਰੋਸ਼ਨੀ';

  @override
  String get lightThemeDescription => 'ਹਮੇਸ਼ਾ ਹਲਕਾ ਥੀਮ ਵਰਤੋ';

  @override
  String get darkThemeLabel => 'ਹਨੇਰਾ';

  @override
  String get darkThemeDescription => 'ਹਮੇਸ਼ਾ ਗੂੜ੍ਹਾ ਥੀਮ ਵਰਤੋ';

  @override
  String get systemThemeLabel => 'ਸਿਸਟਮ';

  @override
  String get systemThemeDarkDescription =>
      'ਗੂੜ੍ਹੇ ਥੀਮ ਲਈ ਸਿਸਟਮ ਸੈਟਿੰਗ ਦੀ ਪਾਲਣਾ ਕਰੋ';

  @override
  String get systemThemeLightDescription =>
      'ਹਲਕੇ ਥੀਮ ਲਈ ਸਿਸਟਮ ਸੈਟਿੰਗ ਦੀ ਪਾਲਣਾ ਕਰੋ';

  @override
  String get switchToLight => 'ਹਲਕੇ \'ਤੇ ਬਦਲੋ';

  @override
  String get switchToDark => 'ਗੂੜ੍ਹੇ ਰੰਗ ਵਿੱਚ ਬਦਲੋ';

  @override
  String get ourTeam => 'ਸਾਡੀ ਟੀਮ';

  @override
  String get teamDescription =>
      'ਸਾਡੀ ਪੇਸ਼ੇਵਰ ਵੈਦਿਕ ਜੋਤਸ਼ੀਆਂ ਦੀ ਟੀਮ ਗ੍ਰਹਿਆਂ ਦੇ ਪ੍ਰਭਾਵਾਂ ਅਤੇ ਜੀਵਨ ਪੈਟਰਨਾਂ ਦੀ ਵਿਆਖਿਆ ਕਰਨ ਦਾ ਸਾਲਾਂ ਦਾ ਤਜਰਬਾ ਰੱਖਦੀ ਹੈ। ਇੱਕ ਸਮਰਪਿਤ ਸਹਾਇਤਾ ਅਤੇ ਵਿਕਾਸ ਟੀਮ ਦੁਆਰਾ ਸਮਰਥਤ, ਕਰਮਾ ਹਰੇਕ ਉਪਭੋਗਤਾ ਲਈ ਇੱਕ ਸਹਿਜ, ਭਰੋਸੇਮੰਦ ਅਤੇ ਗਲੋਬਲ ਅਨੁਭਵ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।';
}
