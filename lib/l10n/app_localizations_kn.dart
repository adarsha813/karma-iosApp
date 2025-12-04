// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get settingsTitle => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get notificationSettings => 'ಅಧಿಸೂಚನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get privacySettings => 'ಗೌಪ್ಯತೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get accountSettings => 'ಖಾತೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get languageSettings => 'ಭಾಷಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get languageChanged => 'ಭಾಷೆ ಬದಲಾಗಿದೆ';

  @override
  String get existingUserButton => 'ನಾನು ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಬಳಕೆದಾರ.';

  @override
  String get chooseCountryTitle => 'ದೇಶವನ್ನು ಆರಿಸಿ';

  @override
  String get yesText => 'ಹೌದು';

  @override
  String get noText => 'ಇಲ್ಲ';

  @override
  String get appBarTitle => 'ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get userIdLabel => 'ಬಳಕೆದಾರ ಐಡಿ *';

  @override
  String get nameLabel => 'ಹೆಸರು';

  @override
  String get birthCountryLabel => 'ಜನ್ಮಸ್ಥಳ';

  @override
  String get birthCityLabel => 'ಜನ್ಮಸ್ಥಳ';

  @override
  String get countrySelectionTitle => 'ನಿಮ್ಮ ದೇಶವನ್ನು ಆರಿಸಿ';

  @override
  String get maleLabel => 'ಗಂಡು';

  @override
  String get femaleLabel => 'ಹೆಣ್ಣು';

  @override
  String get birthDateLabel => 'ಜನ್ಮ ದಿನಾಂಕ';

  @override
  String get birthDatePlaceholder => 'ಜನ್ಮ ದಿನಾಂಕವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get birthTimeLabel => 'ಜನನ ಸಮಯ';

  @override
  String get birthTimePlaceholder => 'ಜನ್ಮ ಸಮಯವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get saveProfileButton => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಿ';

  @override
  String get noCitiesFound => 'ಯಾವುದೇ ನಗರಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String cityPlaceholder(Object country) {
    return '$country ನಲ್ಲಿ ನಗರವನ್ನು ನಮೂದಿಸಿ';
  }

  @override
  String get countryFirstPlaceholder => 'ಮೊದಲು ದೇಶವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get versionHistoryTitle => 'ಆವೃತ್ತಿ ಇತಿಹಾಸ';

  @override
  String get notSetText => 'ಹೊಂದಿಸಿಲ್ಲ';

  @override
  String nameHistory(Object name) {
    return 'ಹೆಸರು: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ನಗರ: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ದೇಶ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ಲಿಂಗ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ಜನ್ಮ ದಿನಾಂಕ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ಜನನ ಸಮಯ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ಸ್ಥಳ: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ಸಮಯವಲಯ: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ಡಿಎಸ್ಟಿ: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ಸ್ಥಿತಿ: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date ರಂದು ನವೀಕರಿಸಲಾಗಿದೆ';
  }

  @override
  String get userIdRequired => 'ಬಳಕೆದಾರ ಐಡಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get profileSaved => 'ಪ್ರೊಫೈಲ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get saveFailed => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get errorPrefix => 'ದೋಷ:';

  @override
  String get onboardingChooseLanguage => 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆರಿಸಿ';

  @override
  String get onboardingChooseLanguageDesc =>
      'ಮುಂದುವರಿಯಲು ನಿಮ್ಮ ಆದ್ಯತೆಯ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get onboardingWhatIsAstrology => 'ಜ್ಯೋತಿಷ್ಯ ಎಂದರೇನು?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ಜ್ಯೋತಿಷ್ಯವು ಆಕಾಶಕಾಯಗಳ ಅಧ್ಯಯನವಾಗಿದೆ...';

  @override
  String get onboardingWhyUseApp => 'ಈ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಏಕೆ ಬಳಸಬೇಕು?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಜಾತಕಗಳು, ದೈನಂದಿನ ಭವಿಷ್ಯವಾಣಿಗಳು ಮತ್ತು ತಿಳುವಳಿಕೆಯುಳ್ಳ ನಿರ್ಧಾರಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಮಾರ್ಗದರ್ಶನ ಪಡೆಯಿರಿ.';

  @override
  String get onboardingHowToUse => 'ಈ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹೇಗೆ ಬಳಸುವುದು?';

  @override
  String get onboardingHowToUseDesc =>
      'ಸುಲಭವಾಗಿ ನ್ಯಾವಿಗೇಟ್ ಮಾಡಿ, ದೈನಂದಿನ ಜಾತಕಗಳನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ನಿಖರವಾದ ಭವಿಷ್ಯವಾಣಿಗಳಿಗಾಗಿ ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ನಿರ್ವಹಿಸಿ.';

  @override
  String get onboardingGetStarted => 'ಪ್ರಾರಂಭಿಸಲು ಒತ್ತಿ';

  @override
  String get onboardingNewUser => 'ಹೊಸ ಬಳಕೆದಾರ';

  @override
  String get onboardingExistingUser => 'ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಬಳಕೆದಾರರು';

  @override
  String get onboardingBack => 'ಹಿಂದೆ';

  @override
  String get onboardingNext => 'ಮುಂದೆ';

  @override
  String get userIdNotFound =>
      'ಬಳಕೆದಾರ ಐಡಿ ಕಂಡುಬಂದಿಲ್ಲ. ದಯವಿಟ್ಟು ಲಾಗಿನ್ ಮಾಡಿ ಅಥವಾ ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಹೊಂದಿಸಿ.';

  @override
  String get clearNotificationsTitle => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get clearNotificationsMessage =>
      'ನೀವು ಎಲ್ಲಾ ಅಧಿಸೂಚನೆಗಳನ್ನು ತೆರವುಗೊಳಿಸಲು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get clearNotificationsSuccess =>
      'ಎಲ್ಲಾ ಅಧಿಸೂಚನೆಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get clearHoroscopeTitle => 'ಸ್ಪಷ್ಟ ಜಾತಕ';

  @override
  String get clearHoroscopeMessage =>
      'ನಿಮ್ಮ ಜಾತಕ ಡೇಟಾವನ್ನು ತೆರವುಗೊಳಿಸಲು ನೀವು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get clearHoroscopeSuccess => 'ಜಾತಕವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get clearChatTitle => 'ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get clearChatMessage =>
      'ನಿಮ್ಮ ಎಲ್ಲಾ ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ಅಳಿಸಲು ನೀವು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get clearChatLocal => 'ಸ್ಥಳೀಯವಾಗಿ ಚಾಟ್ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get deleteAccountTitle => 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get deleteAccountMessage =>
      'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಅಳಿಸಲು ನೀವು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ? ಇದು ನಿಮ್ಮ ಎಲ್ಲಾ ಚಾಟ್ ಇತಿಹಾಸ ಮತ್ತು ಅಧಿಸೂಚನೆಗಳನ್ನು ಸಹ ತೆರವುಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get deleteAccountSuccess =>
      'ನಿಮ್ಮ ಖಾತೆ ಮತ್ತು ಎಲ್ಲಾ ಡೇಟಾವನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ.';

  @override
  String get deleteAccountError => 'ಖಾತೆಯನ್ನು ಅಳಿಸುವಲ್ಲಿ ದೋಷ';

  @override
  String get logoutTitle => 'ಲಾಗ್ಔಟ್';

  @override
  String get logoutMessage => 'ನೀವು ಲಾಗ್ ಔಟ್ ಮಾಡಲು ಖಚಿತವಾಗಿ ಬಯಸುತ್ತೀರಾ?';

  @override
  String get termsPrivacyTitle => 'ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತೆ';

  @override
  String get privacyPolicyTitle => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get termsConditionsTitle => 'ನಿಯಮ ಮತ್ತು ಶರತ್ತುಗಳು';

  @override
  String get dataControlTitle => 'ಡೇಟಾ ನಿಯಂತ್ರಣ';

  @override
  String get cancelButton => 'ರದ್ದುಮಾಡಿ';

  @override
  String get confirmButton => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get clearQuestionsSuccess =>
      'ಎಲ್ಲಾ ಪ್ರಶ್ನೆಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಅಳಿಸಲಾಗಿದೆ.';

  @override
  String get yoginiLabel => 'ಯೋಗಿನಿ';

  @override
  String get lordLabel => 'ಪ್ರಭು';

  @override
  String get startLabel => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get recoverAccount => 'ಖಾತೆಯನ್ನು ಮರುಪಡೆಯಿರಿ';

  @override
  String get endLabel => 'ಅಂತ್ಯ';

  @override
  String get startDateLabel => 'ಪ್ರಾರಂಭ ದಿನಾಂಕ';

  @override
  String get endDateLabel => 'ಅಂತಿಮ ದಿನಾಂಕ';

  @override
  String get notAvailable => 'ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get noData => 'ಡೇಟಾ ಇಲ್ಲ';

  @override
  String get unknownError => 'ಅಜ್ಞಾತ ದೋಷ';

  @override
  String get retryButton => 'ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get kundaliGeneratorTitle => 'ಕುಂಡಲಿ ಜನರೇಟರ್';

  @override
  String get natalChartTitle => 'ಜನ್ಮ ಚಾರ್ಟ್';

  @override
  String get lagnaLabel => 'ಲಗ್ನ';

  @override
  String get rashiLabel => 'ರಾಶಿ';

  @override
  String get ascDegreeLabel => 'ಆರೋಹಣ ಪದವಿ';

  @override
  String get vimshottariDashaTitle => 'ವಿಂಶೋತ್ತರಿ ದಶಾ';

  @override
  String get yoginiDashaTitle => 'ಯೋಗಿನಿ ದಶಾ';

  @override
  String get unknown => 'ಅಜ್ಞಾತ';

  @override
  String get clearHoroscope => 'ಸ್ಪಷ್ಟ ಜಾತಕ';

  @override
  String get clearNotifications => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get clearChatHistory => 'ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get logout => 'ಲಾಗ್ಔಟ್';

  @override
  String get deleteAccount => 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ';

  @override
  String get allFieldsRequired => 'ಎಲ್ಲಾ ಕ್ಷೇತ್ರಗಳು ಅಗತ್ಯವಿದೆ.';

  @override
  String get accountRecoveredSuccess => 'ಖಾತೆಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಮರುಪಡೆಯಲಾಗಿದೆ.';

  @override
  String get recoveryFailed =>
      'ಮರುಪಡೆಯುವಿಕೆ ವಿಫಲವಾಗಿದೆ. ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get recoverySecretLabel => 'ಚೇತರಿಕೆಯ ರಹಸ್ಯ:';

  @override
  String get aboutUsTitle => 'ನಮ್ಮ ಬಗ್ಗೆ';

  @override
  String get aboutOurCompany => 'ನಮ್ಮ ಕಂಪನಿಯ ಬಗ್ಗೆ';

  @override
  String get aboutCompanyDescription =>
      'ಕರ್ಮದಲ್ಲಿ, ವೈದಿಕ ಜ್ಯೋತಿಷ್ಯದ ಕಾಲಾತೀತ ಬುದ್ಧಿವಂತಿಕೆಯ ಮೂಲಕ ನಿಮ್ಮ ನಿಜವಾದ ಜೀವನ ಮಾರ್ಗವನ್ನು ಬಹಿರಂಗಪಡಿಸಲು ನಾವು ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತೇವೆ. ಪ್ರತಿಯೊಂದು ಒಳನೋಟವು ನಿಜವಾದ, ಅನುಭವಿ ಜ್ಯೋತಿಷಿಗಳಿಂದ ಬರುತ್ತದೆ, ನಿಮ್ಮ ಅನನ್ಯ ಜನ್ಮ ಚಾರ್ಟ್ ಅನ್ನು ಆಧರಿಸಿ ಎಚ್ಚರಿಕೆಯಿಂದ ರಚಿಸಲಾಗಿದೆ. ದೈನಂದಿನ ಜಾತಕದಿಂದ ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಮಾರ್ಗದರ್ಶನದವರೆಗೆ, ಕರ್ಮವು ಪ್ರಾಚೀನ ಜ್ಞಾನವನ್ನು 100 ಕ್ಕೂ ಹೆಚ್ಚು ಭಾಷೆಗಳಲ್ಲಿ ಪ್ರವೇಶಿಸುವಂತೆ ಮಾಡುತ್ತದೆ.';

  @override
  String get ourMission => 'ನಮ್ಮ ಧ್ಯೇಯ';

  @override
  String get missionDescription =>
      'ನಮ್ಮ ಧ್ಯೇಯ ಸರಳವಾಗಿದೆ: ವಿಶ್ವಾಸಾರ್ಹ, ಮಾಹಿತಿಯುಕ್ತ ನಿರ್ಧಾರಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ನಿಮಗೆ ಅಧಿಕಾರ ನೀಡುವ ಅಧಿಕೃತ, ಮಾನವ ನೇತೃತ್ವದ ಜ್ಯೋತಿಷ್ಯ ಮಾರ್ಗದರ್ಶನವನ್ನು ಒದಗಿಸುವುದು. ಪ್ರತಿಯೊಂದು ಭವಿಷ್ಯವಾಣಿ ಮತ್ತು ಸಮಾಲೋಚನೆಯು ವರ್ಷಗಳ ವೃತ್ತಿಪರ ಪರಿಣತಿಯನ್ನು ಪ್ರತಿಬಿಂಬಿಸುತ್ತದೆ, ಸ್ವಯಂಚಾಲಿತ ಅಲ್ಗಾರಿದಮ್‌ಗಳಲ್ಲ.';

  @override
  String get ourVision => 'ನಮ್ಮ ದೃಷ್ಟಿ';

  @override
  String get visionDescription =>
      'ನಾವು ವೈದಿಕ ಜ್ಯೋತಿಷ್ಯಕ್ಕೆ ವಿಶ್ವದ ಅತ್ಯಂತ ವಿಶ್ವಾಸಾರ್ಹ ವೇದಿಕೆಯಾಗಲು ಶ್ರಮಿಸುತ್ತೇವೆ, ಎಲ್ಲೆಡೆ ಜನರು ತಮ್ಮನ್ನು, ಅವರ ಆಯ್ಕೆಗಳನ್ನು ಮತ್ತು ಅವರ ಜೀವನ ಪ್ರಯಾಣವನ್ನು ಸ್ಪಷ್ಟತೆ ಮತ್ತು ಆತ್ಮವಿಶ್ವಾಸದಿಂದ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಹಾಯ ಮಾಡುತ್ತೇವೆ.';

  @override
  String get ourValues => 'ನಮ್ಮ ಮೌಲ್ಯಗಳು';

  @override
  String get valuesDescription =>
      'ಕರ್ಮದಲ್ಲಿ ನಾವು ದೃಢತೆ, ನಿಖರತೆ ಮತ್ತು ನಂಬಿಕೆಯನ್ನು ಗೌರವಿಸುತ್ತೇವೆ. ಜೀವನವನ್ನು ಒಳನೋಟ ಮತ್ತು ಆತ್ಮವಿಶ್ವಾಸದಿಂದ ಮುನ್ನಡೆಸಲು ನಿಮಗೆ ಸಹಾಯ ಮಾಡುವ ನಿಖರವಾದ ಆದರೆ ಅರ್ಥಪೂರ್ಣವಾದ ಮಾರ್ಗದರ್ಶನವನ್ನು ನೀಡಲು ನಾವು ಬದ್ಧರಾಗಿದ್ದೇವೆ.';

  @override
  String get contactUs => 'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get contactEmail => 'ಇಮೇಲ್: support@yourcompany.com';

  @override
  String get contactWebsite => 'ವೆಬ್‌ಸೈಟ್: www.yourcompany.com';

  @override
  String get customerSupport => 'ಗ್ರಾಹಕ ಬೆಂಬಲ';

  @override
  String get supportHeroTitle => 'ಸಹಾಯ ಮಾಡಲು ನಾವು ಇಲ್ಲಿದ್ದೇವೆ';

  @override
  String get supportHeroDescription =>
      'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ, ನಮ್ಮ ಬೆಂಬಲ ತಂಡವು ಸಾಧ್ಯವಾದಷ್ಟು ಬೇಗ ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ.';

  @override
  String get yourName => 'ನಿಮ್ಮ ಹೆಸರು';

  @override
  String get yourEmail => 'ನಿಮ್ಮ ಇಮೇಲ್';

  @override
  String get message => 'ಸಂದೇಶ';

  @override
  String get enterEmail => 'ನಿಮ್ಮ ಇಮೇಲ್ ನಮೂದಿಸಿ';

  @override
  String get enterValidEmail => 'ಮಾನ್ಯ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ.';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ನಮೂದಿಸಿ';
  }

  @override
  String get send => 'ಕಳುಹಿಸಿ';

  @override
  String get sending => 'ಕಳುಹಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get emailSentSuccess => '✅ ಇಮೇಲ್ ಯಶಸ್ವಿಯಾಗಿ ಕಳುಹಿಸಲಾಗಿದೆ!';

  @override
  String get emailSendFailed => '❌ ಇಮೇಲ್ ಕಳುಹಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get astroDictionaryTitle => 'ಆಸ್ಟ್ರೋ ನಿಘಂಟು';

  @override
  String get searchTermsHint => 'ಹುಡುಕಾಟ ಪದಗಳು...';

  @override
  String get noTermsFound => 'ಯಾವುದೇ ಪದಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get buyQuestionsTitle => 'ಪ್ರಶ್ನೆಗಳನ್ನು ಖರೀದಿಸಿ';

  @override
  String get userNotAuthenticated => 'ಬಳಕೆದಾರರನ್ನು ದೃಢೀಕರಿಸಲಾಗಿಲ್ಲ';

  @override
  String get loadStoreDataFailed => 'ಅಂಗಡಿ ಡೇಟಾವನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get missingAuthToken => 'ದೃಢೀಕರಣ ಟೋಕನ್ ಕಾಣೆಯಾಗಿದೆ';

  @override
  String get merchantDisplayName => 'ಆಸ್ಟ್ರೋ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್';

  @override
  String get paymentSuccessful => '✅ ಪಾವತಿ ಯಶಸ್ವಿಯಾಗಿದೆ! ಪ್ರಶ್ನೆ ಕಳುಹಿಸಲಾಗಿದೆ.';

  @override
  String paymentFailed(Object error) {
    return '❌ ಪಾವತಿ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get yourBalance => 'ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String questionsBalance(Object count) {
    return '$count ಪ್ರಶ್ನೆಗಳು';
  }

  @override
  String get availableOffers => 'ಲಭ್ಯವಿರುವ ಕೊಡುಗೆಗಳು';

  @override
  String questionsCount(Object count) {
    return '$count ಪ್ರಶ್ನೆ';
  }

  @override
  String get buyButton => 'ಖರೀದಿಸಿ';

  @override
  String get dailyHoroscopeTitle => '🌟 ದೈನಂದಿನ ಜಾತಕ';

  @override
  String get userIdMissing => 'ಬಳಕೆದಾರ ID ಕಾಣೆಯಾಗಿದೆ.';

  @override
  String get fetchHoroscopesFailed => 'ಜಾತಕಗಳನ್ನು ಪಡೆಯುವಲ್ಲಿ ವಿಫಲವಾಗಿದೆ.';

  @override
  String get noHoroscopeFound => 'ಯಾವುದೇ ಜಾತಕ ಸಿಗಲಿಲ್ಲ.';

  @override
  String get signLabel => 'ಸಹಿ ಮಾಡಿ';

  @override
  String get todayLabel => 'ಇಂದು';

  @override
  String get yesterdayLabel => 'ನಿನ್ನೆ';

  @override
  String get thisWeekLabel => 'ಈ ವಾರ';

  @override
  String get lastMonthLabel => 'ಕಳೆದ ತಿಂಗಳು';

  @override
  String get chatTitle => 'ಚಾಟ್ ಮಾಡಿ';

  @override
  String get typeYourQuestionHint => 'ನಿಮ್ಮ ಪ್ರಶ್ನೆಯನ್ನು ಟೈಪ್ ಮಾಡಿ...';

  @override
  String get paymentRequired => 'ಪಾವತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'ನೀವು ನಿಮ್ಮ ಉಚಿತ ಪ್ರಶ್ನೆಗಳನ್ನು ಬಳಸಿದ್ದೀರಿ. ಮುಂದುವರಿಯಲು $amount ಪಾವತಿಸಿ.';
  }

  @override
  String get payNowButton => 'ಈಗಲೇ ಪಾವತಿಸಿ';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ಉಚಿತ ಪ್ರಶ್ನೆಗಳು ಉಳಿದಿವೆ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ಬಾಕಿ ಉಳಿದಿರುವ ಪಾವತಿಸಿದ ಪ್ರಶ್ನೆಗಳು';
  }

  @override
  String get thankYouFeedback => 'ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆಗೆ ಧನ್ಯವಾದಗಳು!';

  @override
  String get ratingSubmitted => 'ರೇಟಿಂಗ್ ಸಲ್ಲಿಸಲಾಗಿದೆ!';

  @override
  String get setUserIdFirst => 'ದಯವಿಟ್ಟು ಮೊದಲು ನಿಮ್ಮ ಬಳಕೆದಾರ ಐಡಿಯನ್ನು ಹೊಂದಿಸಿ.';

  @override
  String get failedToFetchPrevious =>
      'ಹಿಂದಿನ ಪ್ರಶ್ನೆಗಳು ಮತ್ತು ಉತ್ತರಗಳನ್ನು ಪಡೆಯುವಲ್ಲಿ ವಿಫಲವಾಗಿದೆ.';

  @override
  String errorOccurred(Object error) {
    return 'ದೋಷ: $error';
  }

  @override
  String get drawerAstroProfile => 'ಆಸ್ಟ್ರೋ ಪ್ರೊಫೈಲ್';

  @override
  String get drawerDailyHoroscope => 'ದೈನಂದಿನ ಜಾತಕ';

  @override
  String get drawerBuyQuestions => 'ಪ್ರಶ್ನೆಗಳನ್ನು ಖರೀದಿಸಿ';

  @override
  String get drawerAstroDictionary => 'ಆಸ್ಟ್ರೋ ನಿಘಂಟು';

  @override
  String get drawerSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get drawerCustomerSupport => 'ಗ್ರಾಹಕ ಬೆಂಬಲ';

  @override
  String get drawerAbout => 'ನಮ್ಮ ಬಗ್ಗೆ';

  @override
  String get drawerProfileSettings => 'ಪ್ರೊಫೈಲ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get demoNotificationTitle => '🔔 ಡೆಮೊ ಅಧಿಸೂಚನೆ';

  @override
  String get demoNotificationBody =>
      'ಇದು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಬಂದ ಪರೀಕ್ಷಾ ಅಧಿಸೂಚನೆಯಾಗಿದೆ!';

  @override
  String get notificationsTitle => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get noNotifications => 'ಯಾವುದೇ ಅಧಿಸೂಚನೆಗಳಿಲ್ಲ';

  @override
  String get allTab => 'ಎಲ್ಲವೂ';

  @override
  String get markAllAsRead => 'ಎಲ್ಲವನ್ನೂ ಓದಿದಂತೆ ಗುರುತಿಸಿ';

  @override
  String get notificationMarkedRead =>
      'ಅಧಿಸೂಚನೆಯನ್ನು ಓದಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String get failedToLoadNotifications =>
      'ಅಧಿಸೂಚನೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get failedToMarkRead => 'ಓದಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get failedToMarkAllRead =>
      'ಎಲ್ಲವನ್ನೂ ಓದಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get socketConnected => 'ಸಾಕೆಟ್ ಸಂಪರ್ಕಗೊಂಡಿದೆ';

  @override
  String get socketDisconnected => 'ಸಾಕೆಟ್ ಸಂಪರ್ಕ ಕಡಿತಗೊಂಡಿದೆ';

  @override
  String get newNotificationReceived => 'ಹೊಸ ಅಧಿಸೂಚನೆಯನ್ನು ಸ್ವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get generalCategory => 'ಜನರಲ್';

  @override
  String get horoscopeCategory => 'ಜಾತಕ';

  @override
  String get chatCategory => 'ಚಾಟ್ ಮಾಡಿ';

  @override
  String get systemCategory => 'ವ್ಯವಸ್ಥೆ';

  @override
  String get updateCategory => 'ನವೀಕರಣಗಳು';

  @override
  String get howToAskTitle => 'ಹೇಗೆ ಕೇಳುವುದು';

  @override
  String get noQuestionsAvailable => 'ಯಾವುದೇ ಪ್ರಶ್ನೆಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get failedToLoadQuestions => 'ಪ್ರಶ್ನೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get pullToRefresh => 'ರಿಫ್ರೆಶ್ ಮಾಡಲು ಎಳೆಯಿರಿ';

  @override
  String get careerCategory => 'ವೃತ್ತಿಜೀವನ';

  @override
  String get loveCategory => 'ಪ್ರೀತಿ ಮತ್ತು ಸಂಬಂಧಗಳು';

  @override
  String get healthCategory => 'ಆರೋಗ್ಯ';

  @override
  String get financeCategory => 'ಹಣಕಾಸು';

  @override
  String get familyCategory => 'ಕುಟುಂಬ';

  @override
  String get educationCategory => 'ವಿದ್ಯಾಭ್ಯಾಸ';

  @override
  String get travelCategory => 'ಪ್ರಯಾಣ';

  @override
  String get spiritualCategory => 'ಆಧ್ಯಾತ್ಮಿಕ';

  @override
  String get profileLoaded => 'ಪ್ರೊಫೈಲ್ ಯಶಸ್ವಿಯಾಗಿ ಲೋಡ್ ಆಗಿದೆ';

  @override
  String get imageUploaded => 'ಚಿತ್ರವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾಗಿದೆ.';

  @override
  String get savedInformationConfirmation => 'ನಾನು ಈ ಮಾಹಿತಿಯನ್ನು ಉಳಿಸಿದ್ದೇನೆ.';

  @override
  String get noHistoryAvailable => 'ಯಾವುದೇ ಇತಿಹಾಸ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get missingUserIdError => 'ಬಳಕೆದಾರ ಐಡಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get networkError => 'ನೆಟ್‌ವರ್ಕ್ ದೋಷ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get timeoutError => 'ವಿನಂತಿಯ ಸಮಯ ಮೀರಿದೆ';

  @override
  String get genericError => 'ಏನೋ ತಪ್ಪಾಗಿದೆ.';

  @override
  String get reactionUpdateError => 'ಪ್ರತಿಕ್ರಿಯೆಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get noSearchResults => 'ಯಾವುದೇ ಹುಡುಕಾಟ ಫಲಿತಾಂಶಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get clearSearch => 'ಹುಡುಕಾಟ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get resultsFound => 'ಫಲಿತಾಂಶಗಳು ಕಂಡುಬಂದಿವೆ';

  @override
  String get recoverySecretHint =>
      'ಕಾಪಿ-ಪೇಸ್ಟ್ ಕೆಲಸ ಮಾಡದಿರಬಹುದು, ಹಸ್ತಚಾಲಿತವಾಗಿ ಟೈಪ್ ಮಾಡಿ';

  @override
  String get recoverAccountDescription =>
      'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಮರುಪಡೆಯಲು ಈ ಹಂತಗಳನ್ನು ಅನುಸರಿಸಿ.';

  @override
  String get processingLabel => 'ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get clearChatSuccess => 'ಚಾಟ್ ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ.';

  @override
  String get notificationsEnabled => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get notificationsDisabled => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get securityNotice =>
      'ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿದೆ ಮತ್ತು ಸಂಗ್ರಹಿಸಲಾಗಿದೆ';

  @override
  String get loading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get selectLanguage => 'ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get onboardingGetStartedDesc =>
      'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆರಿಸುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get accountRecoveryTitle => '🔐 ಖಾತೆ ಮರುಪಡೆಯುವಿಕೆ ವಿವರಗಳು';

  @override
  String get recoveryInstructions =>
      'ದಯವಿಟ್ಟು ಈ ಮಾಹಿತಿಯನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಉಳಿಸಿ. ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಮರುಪಡೆಯಲು ನಿಮಗೆ ಇದು ಅಗತ್ಯವಾಗಿರುತ್ತದೆ.';

  @override
  String get importantNotice => '⚠️ ಮುಖ್ಯ:';

  @override
  String get astrologerProfileTitle => 'ಜ್ಯೋತಿಷಿ ಪ್ರೊಫೈಲ್';

  @override
  String get personalAstrologer => 'ವೈಯಕ್ತಿಕ ಜ್ಯೋತಿಷಿ';

  @override
  String get makePersonalAstrologer => 'ವೈಯಕ್ತಿಕ ಜ್ಯೋತಿಷಿಯನ್ನು ಮಾಡಿ';

  @override
  String get favoriteDescription =>
      'ನಿಮ್ಮ ಪ್ರಶ್ನೆಗಳಿಗೆ ಈ ಜ್ಯೋತಿಷಿಗೆ ಆದ್ಯತೆ ನೀಡಲಾಗುವುದು. ಲಭ್ಯವಿಲ್ಲದಿದ್ದರೆ, ಮತ್ತೊಬ್ಬ ಅರ್ಹ ಜ್ಯೋತಿಷಿ ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತಾರೆ.';

  @override
  String get educationQualifications => 'ಶಿಕ್ಷಣ ಮತ್ತು ಅರ್ಹತೆಗಳು';

  @override
  String get aboutSection => 'ನಮ್ಮ ಬಗ್ಗೆ';

  @override
  String get shareProfile => 'ಪ್ರೊಫೈಲ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get loadingAstrologer => 'ಜ್ಯೋತಿಷಿ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get failedToLoadAstrologer =>
      'ಜ್ಯೋತಿಷಿ ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get authenticationRequired =>
      'ದೃಢೀಕರಣದ ಅಗತ್ಯವಿದೆ. ದಯವಿಟ್ಟು ಲಾಗಿನ್ ಮಾಡಿ.';

  @override
  String securityCheckFailed(Object error) {
    return 'ಭದ್ರತಾ ಪರಿಶೀಲನೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ಈಗ ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಜ್ಯೋತಿಷಿ.';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ಮೆಚ್ಚಿನವುಗಳಿಂದ $name ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗಿದೆ';
  }

  @override
  String get toggleFavoriteError => 'ನೆಚ್ಚಿನ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ಶಿಕ್ಷಣ: $education\n📜 ಅರ್ಹತೆ: $qualification\n⏳ ಅನುಭವ: $experience';
  }

  @override
  String get notProvided => 'ಒದಗಿಸಲಾಗಿಲ್ಲ';

  @override
  String reviews(Object count) {
    return '($count ವಿಮರ್ಶೆಗಳು)';
  }

  @override
  String get specialties => 'ವಿಶೇಷತೆಗಳು';

  @override
  String get experience => 'ಅನುಭವ';

  @override
  String get qualification => 'ಅರ್ಹತೆ';

  @override
  String get education => 'ವಿದ್ಯಾಭ್ಯಾಸ';

  @override
  String get recoveryTips =>
      '• ಈ ಮಾಹಿತಿಯ ಸ್ಕ್ರೀನ್‌ಶಾಟ್ ತೆಗೆದುಕೊಳ್ಳಿ\n• ಅದನ್ನು ಸುರಕ್ಷಿತ ಸ್ಥಳದಲ್ಲಿ ಸಂಗ್ರಹಿಸಿ\n• ಯಾರೊಂದಿಗೂ ಹಂಚಿಕೊಳ್ಳಬೇಡಿ\n• ಇದನ್ನು ಒಮ್ಮೆ ಮಾತ್ರ ತೋರಿಸಲಾಗುತ್ತದೆ';

  @override
  String get themeSettingsTitle => 'ಥೀಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get lightThemeLabel => 'ಬೆಳಕು';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'ಕತ್ತಲೆ';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ವ್ಯವಸ್ಥೆ';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'ನಮ್ಮ ತಂಡ';

  @override
  String get teamDescription =>
      'ನಮ್ಮ ವೃತ್ತಿಪರ ವೈದಿಕ ಜ್ಯೋತಿಷಿಗಳ ತಂಡವು ಗ್ರಹಗಳ ಪ್ರಭಾವ ಮತ್ತು ಜೀವನ ಮಾದರಿಗಳನ್ನು ಅರ್ಥೈಸುವಲ್ಲಿ ವರ್ಷಗಳ ಅನುಭವವನ್ನು ತರುತ್ತದೆ. ಸಮರ್ಪಿತ ಬೆಂಬಲ ಮತ್ತು ಅಭಿವೃದ್ಧಿ ತಂಡದ ಬೆಂಬಲದೊಂದಿಗೆ, ಕರ್ಮವು ಪ್ರತಿಯೊಬ್ಬ ಬಳಕೆದಾರರಿಗೆ ತಡೆರಹಿತ, ವಿಶ್ವಾಸಾರ್ಹ ಮತ್ತು ಜಾಗತಿಕ ಅನುಭವವನ್ನು ನೀಡುತ್ತದೆ.';
}
