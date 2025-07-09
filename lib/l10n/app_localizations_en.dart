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
}
