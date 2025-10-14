// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settingsTitle => 'Settings';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String get privacySettings => 'Privacy Settings';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get languageChanged => 'Language changed';

  @override
  String get existingUserButton => 'I am an existing user';

  @override
  String get chooseCountryTitle => 'Choose your country';

  @override
  String get yesText => 'Yes';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Profile Settings';

  @override
  String get userIdLabel => 'User ID *';

  @override
  String get nameLabel => 'Name';

  @override
  String get birthCountryLabel => 'Birth Country';

  @override
  String get birthCityLabel => 'Birth City';

  @override
  String get countrySelectionTitle => 'Choose your country';

  @override
  String get maleLabel => 'Male';

  @override
  String get femaleLabel => 'Female';

  @override
  String get birthDateLabel => 'Birth Date';

  @override
  String get birthDatePlaceholder => 'Select Birth Date';

  @override
  String get birthTimeLabel => 'Birth Time';

  @override
  String get birthTimePlaceholder => 'Select Birth Time';

  @override
  String get saveProfileButton => 'Save Profile';

  @override
  String get noCitiesFound => 'No cities found';

  @override
  String cityPlaceholder(Object country) {
    return 'Enter city in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Select country first';

  @override
  String get versionHistoryTitle => 'Version History';

  @override
  String get notSetText => 'Not set';

  @override
  String nameHistory(Object name) {
    return 'Name: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'City: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Country: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Birth Date: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Birth Time: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Location: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'State: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Version from $date';
  }

  @override
  String get userIdRequired => 'User ID is required';

  @override
  String get profileSaved => 'Profile saved successfully';

  @override
  String get saveFailed => 'Failed to save profile';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Choose Your Language';

  @override
  String get onboardingChooseLanguageDesc =>
      'Select your preferred language to continue.';

  @override
  String get onboardingWhatIsAstrology => 'What is Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology is the study of celestial bodies...';

  @override
  String get onboardingWhyUseApp => 'Why use this app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Get personalized horoscopes, daily predictions, and guidance to make informed decisions.';

  @override
  String get onboardingHowToUse => 'How to use this app?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigate easily, check daily horoscopes, and manage your profile for accurate predictions.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingNewUser => 'New User';

  @override
  String get onboardingExistingUser => 'Existing User';

  @override
  String get onboardingBack => 'Back';

  @override
  String get onboardingNext => 'Next';

  @override
  String get userIdNotFound => 'User ID not found.';

  @override
  String get clearNotificationsTitle => 'Clear Notifications';

  @override
  String get clearNotificationsMessage =>
      'Are you sure you want to clear all notifications?';

  @override
  String get clearNotificationsSuccess =>
      'All notifications cleared successfully.';

  @override
  String get clearHoroscopeTitle => 'Clear Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Are you sure you want to clear your horoscope data?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope cleared successfully.';

  @override
  String get clearChatTitle => 'Clear Chat History';

  @override
  String get clearChatMessage =>
      'Are you sure you want to delete all your chat history?';

  @override
  String get clearChatLocal => 'Chat cleared locally.';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountMessage =>
      'Are you sure you want to delete your account? This will also clear all your chat history and notifications.';

  @override
  String get deleteAccountSuccess =>
      'Your account and all data have been removed.';

  @override
  String get deleteAccountError => 'Error deleting account';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutMessage => 'Are you sure you want to logout?';

  @override
  String get termsPrivacyTitle => 'Terms & Privacy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get termsConditionsTitle => 'Terms & Conditions';

  @override
  String get dataControlTitle => 'Data Control';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get clearQuestionsSuccess => 'All questions deleted successfully.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Recover Account';

  @override
  String get endLabel => 'End';

  @override
  String get startDateLabel => 'Start Date';

  @override
  String get endDateLabel => 'End Date';

  @override
  String get notAvailable => 'Not available';

  @override
  String get noData => 'No data';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get retryButton => 'Retry';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Natal Chart';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Ascendant Degree';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Unknown';

  @override
  String get clearHoroscope => 'Clear Horoscope';

  @override
  String get clearNotifications => 'Clear Notifications';

  @override
  String get clearChatHistory => 'Clear Chat History';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Delete Account';
}
