import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_ceb.dart';
import 'app_localizations_co.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_fy.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gd.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_ha.dart';
import 'app_localizations_haw.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hmn.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_ht.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_hy.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ig.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_jv.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ku.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_lb.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mg.dart';
import 'app_localizations_mi.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_mt.dart';
import 'app_localizations_my.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_ny.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_rw.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sm.dart';
import 'app_localizations_sn.dart';
import 'app_localizations_so.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_st.dart';
import 'app_localizations_su.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tg.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tk.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_tt.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_xh.dart';
import 'app_localizations_yi.dart';
import 'app_localizations_yo.dart';
import 'app_localizations_zh.dart';
import 'app_localizations_zu.dart';

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
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bs'),
    Locale('ca'),
    Locale('ceb'),
    Locale('co'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('fy'),
    Locale('ga'),
    Locale('gd'),
    Locale('gl'),
    Locale('gu'),
    Locale('ha'),
    Locale('haw'),
    Locale('he'),
    Locale('hi'),
    Locale('hmn'),
    Locale('hr'),
    Locale('ht'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('ig'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('jv'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ku'),
    Locale('ky'),
    Locale('lb'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mg'),
    Locale('mi'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('mt'),
    Locale('my'),
    Locale('ne'),
    Locale('nl'),
    Locale('no'),
    Locale('ny'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('rw'),
    Locale('sd'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sm'),
    Locale('sn'),
    Locale('so'),
    Locale('sq'),
    Locale('sr'),
    Locale('st'),
    Locale('su'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('tg'),
    Locale('th'),
    Locale('tk'),
    Locale('tl'),
    Locale('tr'),
    Locale('tt'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('xh'),
    Locale('yi'),
    Locale('yo'),
    Locale('zh'),
    Locale('zh', 'TW'),
    Locale('zu'),
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
  /// **'Choose Country'**
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
  /// **'Updated on {date}'**
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
  /// **'Recovery Secret:'**
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
  /// **'You\'ve used your free questions. Pay \$5 to continue.'**
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

  /// No description provided for @profileLoaded.
  ///
  /// In en, this message translates to:
  /// **'Profile loaded successfully'**
  String get profileLoaded;

  /// No description provided for @imageUploaded.
  ///
  /// In en, this message translates to:
  /// **'Image uploaded successfully'**
  String get imageUploaded;

  /// No description provided for @savedInformationConfirmation.
  ///
  /// In en, this message translates to:
  /// **'I\'ve Saved This Information'**
  String get savedInformationConfirmation;

  /// No description provided for @noHistoryAvailable.
  ///
  /// In en, this message translates to:
  /// **'No history available'**
  String get noHistoryAvailable;

  /// No description provided for @missingUserIdError.
  ///
  /// In en, this message translates to:
  /// **'User ID is required'**
  String get missingUserIdError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please try again.'**
  String get networkError;

  /// No description provided for @timeoutError.
  ///
  /// In en, this message translates to:
  /// **'Request timed out'**
  String get timeoutError;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get genericError;

  /// No description provided for @reactionUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update reaction'**
  String get reactionUpdateError;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No search results found'**
  String get noSearchResults;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @resultsFound.
  ///
  /// In en, this message translates to:
  /// **'Results found'**
  String get resultsFound;

  /// No description provided for @recoverySecretHint.
  ///
  /// In en, this message translates to:
  /// **'Copy-paste may not work, type manually'**
  String get recoverySecretHint;

  /// No description provided for @recoverAccountDescription.
  ///
  /// In en, this message translates to:
  /// **'Follow these steps to recover your account'**
  String get recoverAccountDescription;

  /// No description provided for @processingLabel.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processingLabel;

  /// No description provided for @clearChatSuccess.
  ///
  /// In en, this message translates to:
  /// **'Chat cleared successfully'**
  String get clearChatSuccess;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get notificationsEnabled;

  /// No description provided for @notificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications disabled'**
  String get notificationsDisabled;

  /// No description provided for @securityNotice.
  ///
  /// In en, this message translates to:
  /// **'Your data is securely encrypted and stored'**
  String get securityNotice;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @onboardingGetStartedDesc.
  ///
  /// In en, this message translates to:
  /// **'Get started by choosing your language'**
  String get onboardingGetStartedDesc;

  /// No description provided for @accountRecoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'🔐 Account Recovery Details'**
  String get accountRecoveryTitle;

  /// No description provided for @recoveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Please save this information securely. You\'ll need it to recover your account.'**
  String get recoveryInstructions;

  /// No description provided for @importantNotice.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Important:'**
  String get importantNotice;

  /// No description provided for @astrologerProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Astrologer Profile'**
  String get astrologerProfileTitle;

  /// No description provided for @personalAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Personal Astrologer'**
  String get personalAstrologer;

  /// No description provided for @makePersonalAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Make Personal Astrologer'**
  String get makePersonalAstrologer;

  /// No description provided for @favoriteDescription.
  ///
  /// In en, this message translates to:
  /// **'Your questions will be prioritized to this astrologer. If unavailable, another qualified astrologer will assist you.'**
  String get favoriteDescription;

  /// No description provided for @educationQualifications.
  ///
  /// In en, this message translates to:
  /// **'Education & Qualifications'**
  String get educationQualifications;

  /// No description provided for @aboutSection.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSection;

  /// No description provided for @shareProfile.
  ///
  /// In en, this message translates to:
  /// **'Share Profile'**
  String get shareProfile;

  /// No description provided for @loadingAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Loading astrologer details...'**
  String get loadingAstrologer;

  /// No description provided for @failedToLoadAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Failed to load astrologer details'**
  String get failedToLoadAstrologer;

  /// No description provided for @authenticationRequired.
  ///
  /// In en, this message translates to:
  /// **'Authentication required. Please log in.'**
  String get authenticationRequired;

  /// No description provided for @securityCheckFailed.
  ///
  /// In en, this message translates to:
  /// **'Security check failed: {error}'**
  String securityCheckFailed(Object error);

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'🎯 {name} is now your Personal Astrologer'**
  String addedToFavorites(Object name);

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'✅ Removed {name} from favorites'**
  String removedFromFavorites(Object name);

  /// No description provided for @toggleFavoriteError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update favorite status'**
  String get toggleFavoriteError;

  /// Message text when sharing astrologer profile
  ///
  /// In en, this message translates to:
  /// **'{name}\n🎓 Education: {education}\n📜 Qualification: {qualification}\n⏳ Experience: {experience}'**
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  );

  /// No description provided for @notProvided.
  ///
  /// In en, this message translates to:
  /// **'Not provided'**
  String get notProvided;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'({count} reviews)'**
  String reviews(Object count);

  /// No description provided for @specialties.
  ///
  /// In en, this message translates to:
  /// **'Specialties'**
  String get specialties;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @qualification.
  ///
  /// In en, this message translates to:
  /// **'Qualification'**
  String get qualification;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @recoveryTips.
  ///
  /// In en, this message translates to:
  /// **'• Take a screenshot of this information\n• Store it in a secure place\n• Do not share with anyone\n• This will only be shown once'**
  String get recoveryTips;

  /// No description provided for @themeSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme Settings'**
  String get themeSettingsTitle;

  /// No description provided for @lightThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightThemeLabel;

  /// No description provided for @lightThemeDescription.
  ///
  /// In en, this message translates to:
  /// **'Always use light theme'**
  String get lightThemeDescription;

  /// No description provided for @darkThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkThemeLabel;

  /// No description provided for @darkThemeDescription.
  ///
  /// In en, this message translates to:
  /// **'Always use dark theme'**
  String get darkThemeDescription;

  /// No description provided for @systemThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemThemeLabel;

  /// No description provided for @systemThemeDarkDescription.
  ///
  /// In en, this message translates to:
  /// **'Using system dark theme'**
  String get systemThemeDarkDescription;

  /// No description provided for @systemThemeLightDescription.
  ///
  /// In en, this message translates to:
  /// **'Using system light theme'**
  String get systemThemeLightDescription;

  /// No description provided for @switchToLight.
  ///
  /// In en, this message translates to:
  /// **'Switch to Light'**
  String get switchToLight;

  /// No description provided for @switchToDark.
  ///
  /// In en, this message translates to:
  /// **'Switch to Dark'**
  String get switchToDark;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'am',
    'ar',
    'az',
    'be',
    'bg',
    'bn',
    'bs',
    'ca',
    'ceb',
    'co',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'eo',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fr',
    'fy',
    'ga',
    'gd',
    'gl',
    'gu',
    'ha',
    'haw',
    'he',
    'hi',
    'hmn',
    'hr',
    'ht',
    'hu',
    'hy',
    'id',
    'ig',
    'is',
    'it',
    'ja',
    'jv',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ku',
    'ky',
    'lb',
    'lo',
    'lt',
    'lv',
    'mg',
    'mi',
    'mk',
    'ml',
    'mn',
    'mr',
    'ms',
    'mt',
    'my',
    'ne',
    'nl',
    'no',
    'ny',
    'or',
    'pa',
    'pl',
    'ps',
    'pt',
    'ro',
    'ru',
    'rw',
    'sd',
    'si',
    'sk',
    'sl',
    'sm',
    'sn',
    'so',
    'sq',
    'sr',
    'st',
    'su',
    'sv',
    'sw',
    'ta',
    'te',
    'tg',
    'th',
    'tk',
    'tl',
    'tr',
    'tt',
    'ug',
    'uk',
    'ur',
    'uz',
    'vi',
    'xh',
    'yi',
    'yo',
    'zh',
    'zu',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'be':
      return AppLocalizationsBe();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'bs':
      return AppLocalizationsBs();
    case 'ca':
      return AppLocalizationsCa();
    case 'ceb':
      return AppLocalizationsCeb();
    case 'co':
      return AppLocalizationsCo();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'eo':
      return AppLocalizationsEo();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'eu':
      return AppLocalizationsEu();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'fy':
      return AppLocalizationsFy();
    case 'ga':
      return AppLocalizationsGa();
    case 'gd':
      return AppLocalizationsGd();
    case 'gl':
      return AppLocalizationsGl();
    case 'gu':
      return AppLocalizationsGu();
    case 'ha':
      return AppLocalizationsHa();
    case 'haw':
      return AppLocalizationsHaw();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hmn':
      return AppLocalizationsHmn();
    case 'hr':
      return AppLocalizationsHr();
    case 'ht':
      return AppLocalizationsHt();
    case 'hu':
      return AppLocalizationsHu();
    case 'hy':
      return AppLocalizationsHy();
    case 'id':
      return AppLocalizationsId();
    case 'ig':
      return AppLocalizationsIg();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'jv':
      return AppLocalizationsJv();
    case 'ka':
      return AppLocalizationsKa();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ku':
      return AppLocalizationsKu();
    case 'ky':
      return AppLocalizationsKy();
    case 'lb':
      return AppLocalizationsLb();
    case 'lo':
      return AppLocalizationsLo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mg':
      return AppLocalizationsMg();
    case 'mi':
      return AppLocalizationsMi();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'mt':
      return AppLocalizationsMt();
    case 'my':
      return AppLocalizationsMy();
    case 'ne':
      return AppLocalizationsNe();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'ny':
      return AppLocalizationsNy();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'ps':
      return AppLocalizationsPs();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'rw':
      return AppLocalizationsRw();
    case 'sd':
      return AppLocalizationsSd();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sm':
      return AppLocalizationsSm();
    case 'sn':
      return AppLocalizationsSn();
    case 'so':
      return AppLocalizationsSo();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'st':
      return AppLocalizationsSt();
    case 'su':
      return AppLocalizationsSu();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'tg':
      return AppLocalizationsTg();
    case 'th':
      return AppLocalizationsTh();
    case 'tk':
      return AppLocalizationsTk();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'tt':
      return AppLocalizationsTt();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'uz':
      return AppLocalizationsUz();
    case 'vi':
      return AppLocalizationsVi();
    case 'xh':
      return AppLocalizationsXh();
    case 'yi':
      return AppLocalizationsYi();
    case 'yo':
      return AppLocalizationsYo();
    case 'zh':
      return AppLocalizationsZh();
    case 'zu':
      return AppLocalizationsZu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
