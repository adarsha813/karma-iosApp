import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
  ];

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed'**
  String get languageChanged;

  /// No description provided for @chooseCountryTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your country'**
  String get chooseCountryTitle;

  /// No description provided for @yesText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesText;

  /// No description provided for @noText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noText;

  /// No description provided for @appBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get appBarTitle;

  /// No description provided for @userIdLabel.
  ///
  /// In en, this message translates to:
  /// **'User ID *'**
  String get userIdLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @birthCountryLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Country'**
  String get birthCountryLabel;

  /// No description provided for @birthCityLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth City'**
  String get birthCityLabel;

  /// No description provided for @countrySelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your country'**
  String get countrySelectionTitle;

  /// No description provided for @maleLabel.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get maleLabel;

  /// No description provided for @femaleLabel.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get femaleLabel;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDateLabel;

  /// No description provided for @birthDatePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select Birth Date'**
  String get birthDatePlaceholder;

  /// No description provided for @birthTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Time'**
  String get birthTimeLabel;

  /// No description provided for @birthTimePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select Birth Time'**
  String get birthTimePlaceholder;

  /// No description provided for @saveProfileButton.
  ///
  /// In en, this message translates to:
  /// **'Save Profile'**
  String get saveProfileButton;

  /// No description provided for @noCitiesFound.
  ///
  /// In en, this message translates to:
  /// **'No cities found'**
  String get noCitiesFound;

  /// No description provided for @cityPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter city in {country}'**
  String cityPlaceholder(Object country);

  /// No description provided for @countryFirstPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select country first'**
  String get countryFirstPlaceholder;

  /// No description provided for @versionHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Version History'**
  String get versionHistoryTitle;

  /// No description provided for @notSetText.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSetText;

  /// No description provided for @nameHistory.
  ///
  /// In en, this message translates to:
  /// **'Name: {name}'**
  String nameHistory(Object name);

  /// No description provided for @cityHistory.
  ///
  /// In en, this message translates to:
  /// **'City: {city}'**
  String cityHistory(Object city);

  /// No description provided for @countryHistory.
  ///
  /// In en, this message translates to:
  /// **'Country: {country}'**
  String countryHistory(Object country);

  /// No description provided for @genderHistory.
  ///
  /// In en, this message translates to:
  /// **'Gender: {gender}'**
  String genderHistory(Object gender);

  /// No description provided for @birthDateHistory.
  ///
  /// In en, this message translates to:
  /// **'Birth Date: {date}'**
  String birthDateHistory(Object date);

  /// No description provided for @birthTimeHistory.
  ///
  /// In en, this message translates to:
  /// **'Birth Time: {time}'**
  String birthTimeHistory(Object time);

  /// No description provided for @locationHistory.
  ///
  /// In en, this message translates to:
  /// **'Location: {latitude}, {longitude}'**
  String locationHistory(Object latitude, Object longitude);

  /// No description provided for @timezoneHistory.
  ///
  /// In en, this message translates to:
  /// **'Timezone: GMT{offset}'**
  String timezoneHistory(Object offset);

  /// No description provided for @dstHistory.
  ///
  /// In en, this message translates to:
  /// **'DST: {value}'**
  String dstHistory(Object value);

  /// No description provided for @stateHistory.
  ///
  /// In en, this message translates to:
  /// **'State: {state}'**
  String stateHistory(Object state);

  /// No description provided for @versionFromText.
  ///
  /// In en, this message translates to:
  /// **'Version from {date}'**
  String versionFromText(Object date);

  /// No description provided for @userIdRequired.
  ///
  /// In en, this message translates to:
  /// **'User ID is required'**
  String get userIdRequired;

  /// No description provided for @profileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved successfully'**
  String get profileSaved;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save profile'**
  String get saveFailed;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get errorPrefix;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
