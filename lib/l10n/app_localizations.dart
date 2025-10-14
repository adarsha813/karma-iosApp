import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
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
    Locale('es'),
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

  /// No description provided for @existingUserButton.
  ///
  /// In en, this message translates to:
  /// **'I am an existing user'**
  String get existingUserButton;

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

  /// No description provided for @onboardingChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Language'**
  String get onboardingChooseLanguage;

  /// No description provided for @onboardingChooseLanguageDesc.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language to continue.'**
  String get onboardingChooseLanguageDesc;

  /// No description provided for @onboardingWhatIsAstrology.
  ///
  /// In en, this message translates to:
  /// **'What is Astrology?'**
  String get onboardingWhatIsAstrology;

  /// No description provided for @onboardingWhatIsAstrologyDesc.
  ///
  /// In en, this message translates to:
  /// **'Astrology is the study of celestial bodies...'**
  String get onboardingWhatIsAstrologyDesc;

  /// No description provided for @onboardingWhyUseApp.
  ///
  /// In en, this message translates to:
  /// **'Why use this app?'**
  String get onboardingWhyUseApp;

  /// No description provided for @onboardingWhyUseAppDesc.
  ///
  /// In en, this message translates to:
  /// **'Get personalized horoscopes, daily predictions, and guidance to make informed decisions.'**
  String get onboardingWhyUseAppDesc;

  /// No description provided for @onboardingHowToUse.
  ///
  /// In en, this message translates to:
  /// **'How to use this app?'**
  String get onboardingHowToUse;

  /// No description provided for @onboardingHowToUseDesc.
  ///
  /// In en, this message translates to:
  /// **'Navigate easily, check daily horoscopes, and manage your profile for accurate predictions.'**
  String get onboardingHowToUseDesc;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingNewUser.
  ///
  /// In en, this message translates to:
  /// **'New User'**
  String get onboardingNewUser;

  /// No description provided for @onboardingExistingUser.
  ///
  /// In en, this message translates to:
  /// **'Existing User'**
  String get onboardingExistingUser;

  /// No description provided for @onboardingBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get onboardingBack;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @userIdNotFound.
  ///
  /// In en, this message translates to:
  /// **'User ID not found. Please login or set your profile.'**
  String get userIdNotFound;

  /// No description provided for @clearNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Notifications'**
  String get clearNotificationsTitle;

  /// No description provided for @clearNotificationsMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all notifications?'**
  String get clearNotificationsMessage;

  /// No description provided for @clearNotificationsSuccess.
  ///
  /// In en, this message translates to:
  /// **'All notifications cleared successfully.'**
  String get clearNotificationsSuccess;

  /// No description provided for @clearHoroscopeTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Horoscope'**
  String get clearHoroscopeTitle;

  /// No description provided for @clearHoroscopeMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear your horoscope data?'**
  String get clearHoroscopeMessage;

  /// No description provided for @clearHoroscopeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Horoscope cleared successfully.'**
  String get clearHoroscopeSuccess;

  /// No description provided for @clearChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Chat History'**
  String get clearChatTitle;

  /// No description provided for @clearChatMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all your chat history?'**
  String get clearChatMessage;

  /// No description provided for @clearChatLocal.
  ///
  /// In en, this message translates to:
  /// **'Chat cleared locally.'**
  String get clearChatLocal;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This will also clear all your chat history and notifications.'**
  String get deleteAccountMessage;

  /// No description provided for @deleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your account and all data have been removed.'**
  String get deleteAccountSuccess;

  /// No description provided for @deleteAccountError.
  ///
  /// In en, this message translates to:
  /// **'Error deleting account'**
  String get deleteAccountError;

  /// No description provided for @logoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutTitle;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutMessage;

  /// No description provided for @termsPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Privacy'**
  String get termsPrivacyTitle;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @termsConditionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditionsTitle;

  /// No description provided for @dataControlTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Control'**
  String get dataControlTitle;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// No description provided for @clearQuestionsSuccess.
  ///
  /// In en, this message translates to:
  /// **'All questions deleted successfully.'**
  String get clearQuestionsSuccess;

  /// No description provided for @yoginiLabel.
  ///
  /// In en, this message translates to:
  /// **'Yogini'**
  String get yoginiLabel;

  /// No description provided for @lordLabel.
  ///
  /// In en, this message translates to:
  /// **'Lord'**
  String get lordLabel;

  /// No description provided for @startLabel.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startLabel;

  /// No description provided for @recoverAccount.
  ///
  /// In en, this message translates to:
  /// **'Recover Account'**
  String get recoverAccount;

  /// No description provided for @endLabel.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get endLabel;

  /// No description provided for @startDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDateLabel;

  /// No description provided for @endDateLabel.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDateLabel;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @kundaliGeneratorTitle.
  ///
  /// In en, this message translates to:
  /// **'Kundali Generator'**
  String get kundaliGeneratorTitle;

  /// No description provided for @natalChartTitle.
  ///
  /// In en, this message translates to:
  /// **'Natal Chart'**
  String get natalChartTitle;

  /// No description provided for @lagnaLabel.
  ///
  /// In en, this message translates to:
  /// **'Lagna'**
  String get lagnaLabel;

  /// No description provided for @rashiLabel.
  ///
  /// In en, this message translates to:
  /// **'Rashi'**
  String get rashiLabel;

  /// No description provided for @ascDegreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Ascendant Degree'**
  String get ascDegreeLabel;

  /// No description provided for @vimshottariDashaTitle.
  ///
  /// In en, this message translates to:
  /// **'Vimshottari Dasha'**
  String get vimshottariDashaTitle;

  /// No description provided for @yoginiDashaTitle.
  ///
  /// In en, this message translates to:
  /// **'Yogini Dasha'**
  String get yoginiDashaTitle;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// Title for clear horoscope option
  ///
  /// In en, this message translates to:
  /// **'Clear Horoscope'**
  String get clearHoroscope;

  /// Title for clear notifications option
  ///
  /// In en, this message translates to:
  /// **'Clear Notifications'**
  String get clearNotifications;

  /// Title for clear chat history option
  ///
  /// In en, this message translates to:
  /// **'Clear Chat History'**
  String get clearChatHistory;

  /// Title for logout option
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Title for delete account option
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Error message when fields are empty
  ///
  /// In en, this message translates to:
  /// **'All fields are required.'**
  String get allFieldsRequired;

  /// Success message for account recovery
  ///
  /// In en, this message translates to:
  /// **'Account recovered successfully.'**
  String get accountRecoveredSuccess;

  /// Error message for failed recovery
  ///
  /// In en, this message translates to:
  /// **'Recovery failed. Check your information.'**
  String get recoveryFailed;

  /// Label for recovery secret input field
  ///
  /// In en, this message translates to:
  /// **'Recovery Secret'**
  String get recoverySecretLabel;

  /// Title for About Us page
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUsTitle;

  /// Header title for company information
  ///
  /// In en, this message translates to:
  /// **'About Our Company'**
  String get aboutOurCompany;

  /// Description of company commitment
  ///
  /// In en, this message translates to:
  /// **'We are committed to delivering the best astrology experience to our users.'**
  String get aboutCompanyDescription;

  /// Title for mission section
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMission;

  /// Description of company mission
  ///
  /// In en, this message translates to:
  /// **'To provide accurate and personalized astrology insights to help users make informed decisions in their lives.'**
  String get missionDescription;

  /// Title for vision section
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVision;

  /// Description of company vision
  ///
  /// In en, this message translates to:
  /// **'To become the most trusted astrology platform, combining technology and ancient wisdom.'**
  String get visionDescription;

  /// Title for values section
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get ourValues;

  /// Description of company values
  ///
  /// In en, this message translates to:
  /// **'Integrity, Accuracy, User-Centric Design, and Continuous Innovation.'**
  String get valuesDescription;

  /// Title for contact section
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// Contact email address
  ///
  /// In en, this message translates to:
  /// **'Email: support@yourcompany.com'**
  String get contactEmail;

  /// Contact website URL
  ///
  /// In en, this message translates to:
  /// **'Website: www.yourcompany.com'**
  String get contactWebsite;

  /// Title for customer support page
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// Hero section title for support page
  ///
  /// In en, this message translates to:
  /// **'We\'re Here to Help'**
  String get supportHeroTitle;

  /// Hero section description for support page
  ///
  /// In en, this message translates to:
  /// **'Fill out the form below and our support team will get back to you as soon as possible.'**
  String get supportHeroDescription;

  /// Label for name input field
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// Label for email input field
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get yourEmail;

  /// Label for message input field
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// Validation error for empty email
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// Validation error for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enterValidEmail;

  /// Validation error for required fields
  ///
  /// In en, this message translates to:
  /// **'Enter {fieldName}'**
  String enterField(Object fieldName);

  /// Send button text
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Send button text when sending
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// Success message after sending email
  ///
  /// In en, this message translates to:
  /// **'✅ Email sent successfully!'**
  String get emailSentSuccess;

  /// Error message when email fails to send
  ///
  /// In en, this message translates to:
  /// **'❌ Failed to send email'**
  String get emailSendFailed;

  /// Title for astrology dictionary screen
  ///
  /// In en, this message translates to:
  /// **'Astro Dictionary'**
  String get astroDictionaryTitle;

  /// Hint text for search field in dictionary
  ///
  /// In en, this message translates to:
  /// **'Search terms...'**
  String get searchTermsHint;

  /// Message when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No terms found'**
  String get noTermsFound;

  /// Title for question store screen
  ///
  /// In en, this message translates to:
  /// **'Buy Questions'**
  String get buyQuestionsTitle;

  /// Error message when user is not logged in
  ///
  /// In en, this message translates to:
  /// **'User not authenticated'**
  String get userNotAuthenticated;

  /// Error message when store data fails to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load store data'**
  String get loadStoreDataFailed;

  /// Error message when authentication token is missing
  ///
  /// In en, this message translates to:
  /// **'Missing auth token'**
  String get missingAuthToken;

  /// Merchant name for payment processing
  ///
  /// In en, this message translates to:
  /// **'Astro Chat App'**
  String get merchantDisplayName;

  /// Success message after payment
  ///
  /// In en, this message translates to:
  /// **'✅ Payment successful! Question sent'**
  String get paymentSuccessful;

  /// Error message when payment fails
  ///
  /// In en, this message translates to:
  /// **'❌ Payment failed: {error}'**
  String paymentFailed(Object error);

  /// Label for user's question balance
  ///
  /// In en, this message translates to:
  /// **'Your Balance'**
  String get yourBalance;

  /// Display user's question balance with count
  ///
  /// In en, this message translates to:
  /// **'{count} Questions'**
  String questionsBalance(Object count);

  /// Title for available offers section
  ///
  /// In en, this message translates to:
  /// **'Available Offers'**
  String get availableOffers;

  /// Display question count with proper pluralization
  ///
  /// In en, this message translates to:
  /// **'{count} Question'**
  String questionsCount(Object count);

  /// Buy button text
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buyButton;

  /// Title for daily horoscope screen
  ///
  /// In en, this message translates to:
  /// **'🌟 Daily Horoscope'**
  String get dailyHoroscopeTitle;

  /// Error message when user ID is not available
  ///
  /// In en, this message translates to:
  /// **'User ID is missing'**
  String get userIdMissing;

  /// Error message when horoscope fetch fails
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch horoscopes'**
  String get fetchHoroscopesFailed;

  /// Message when no horoscopes are available
  ///
  /// In en, this message translates to:
  /// **'No horoscope found.'**
  String get noHoroscopeFound;

  /// Label for zodiac sign
  ///
  /// In en, this message translates to:
  /// **'Sign'**
  String get signLabel;

  /// Label for today's horoscopes
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// Label for yesterday's horoscopes
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterdayLabel;

  /// Label for this week's horoscopes
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeekLabel;

  /// Label for last month's horoscopes
  ///
  /// In en, this message translates to:
  /// **'Last Month'**
  String get lastMonthLabel;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatTitle;

  /// No description provided for @typeYourQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Type your question...'**
  String get typeYourQuestionHint;

  /// No description provided for @paymentRequired.
  ///
  /// In en, this message translates to:
  /// **'Payment Required'**
  String get paymentRequired;

  /// No description provided for @paymentRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve used your free questions. Pay ₹50 to continue.'**
  String get paymentRequiredMessage;

  /// No description provided for @payNowButton.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNowButton;

  /// No description provided for @freeQuestionsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} free questions remaining'**
  String freeQuestionsRemaining(Object count);

  /// No description provided for @paidQuestionsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} paid questions remaining'**
  String paidQuestionsRemaining(Object count);

  /// No description provided for @thankYouFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback!'**
  String get thankYouFeedback;

  /// No description provided for @ratingSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Rating submitted!'**
  String get ratingSubmitted;

  /// No description provided for @setUserIdFirst.
  ///
  /// In en, this message translates to:
  /// **'Please set your User ID first'**
  String get setUserIdFirst;

  /// No description provided for @failedToFetchPrevious.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch previous questions and answers'**
  String get failedToFetchPrevious;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorOccurred(Object error);

  /// No description provided for @drawerAstroProfile.
  ///
  /// In en, this message translates to:
  /// **'Astro Profile'**
  String get drawerAstroProfile;

  /// No description provided for @drawerDailyHoroscope.
  ///
  /// In en, this message translates to:
  /// **'Daily Horoscope'**
  String get drawerDailyHoroscope;

  /// No description provided for @drawerBuyQuestions.
  ///
  /// In en, this message translates to:
  /// **'Buy Questions'**
  String get drawerBuyQuestions;

  /// No description provided for @drawerAstroDictionary.
  ///
  /// In en, this message translates to:
  /// **'Astro Dictionary'**
  String get drawerAstroDictionary;

  /// No description provided for @drawerSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawerSettings;

  /// No description provided for @drawerCustomerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get drawerCustomerSupport;

  /// No description provided for @drawerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawerAbout;

  /// No description provided for @drawerProfileSettings.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get drawerProfileSettings;

  /// No description provided for @demoNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'🔔 Demo Notification'**
  String get demoNotificationTitle;

  /// No description provided for @demoNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'This is a test notification from your app!'**
  String get demoNotificationBody;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @allTab.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTab;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @notificationMarkedRead.
  ///
  /// In en, this message translates to:
  /// **'Notification marked as read'**
  String get notificationMarkedRead;

  /// No description provided for @failedToLoadNotifications.
  ///
  /// In en, this message translates to:
  /// **'Failed to load notifications'**
  String get failedToLoadNotifications;

  /// No description provided for @failedToMarkRead.
  ///
  /// In en, this message translates to:
  /// **'Failed to mark as read'**
  String get failedToMarkRead;

  /// No description provided for @failedToMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Failed to mark all as read'**
  String get failedToMarkAllRead;

  /// No description provided for @socketConnected.
  ///
  /// In en, this message translates to:
  /// **'Socket connected'**
  String get socketConnected;

  /// No description provided for @socketDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Socket disconnected'**
  String get socketDisconnected;

  /// No description provided for @newNotificationReceived.
  ///
  /// In en, this message translates to:
  /// **'New notification received'**
  String get newNotificationReceived;

  /// No description provided for @generalCategory.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get generalCategory;

  /// No description provided for @horoscopeCategory.
  ///
  /// In en, this message translates to:
  /// **'Horoscope'**
  String get horoscopeCategory;

  /// No description provided for @chatCategory.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatCategory;

  /// No description provided for @systemCategory.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemCategory;

  /// No description provided for @updateCategory.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updateCategory;

  /// No description provided for @howToAskTitle.
  ///
  /// In en, this message translates to:
  /// **'How To Ask'**
  String get howToAskTitle;

  /// No description provided for @noQuestionsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No questions available'**
  String get noQuestionsAvailable;

  /// No description provided for @failedToLoadQuestions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load questions'**
  String get failedToLoadQuestions;

  /// No description provided for @pullToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh'**
  String get pullToRefresh;

  /// No description provided for @careerCategory.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get careerCategory;

  /// No description provided for @loveCategory.
  ///
  /// In en, this message translates to:
  /// **'Love & Relationships'**
  String get loveCategory;

  /// No description provided for @healthCategory.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get healthCategory;

  /// No description provided for @financeCategory.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get financeCategory;

  /// No description provided for @familyCategory.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get familyCategory;

  /// No description provided for @educationCategory.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationCategory;

  /// No description provided for @travelCategory.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travelCategory;

  /// No description provided for @spiritualCategory.
  ///
  /// In en, this message translates to:
  /// **'Spiritual'**
  String get spiritualCategory;
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
      <String>['en', 'es', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
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
