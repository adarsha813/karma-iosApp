// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get settingsTitle => 'ക്രമീകരണങ്ങൾ';

  @override
  String get notificationSettings => 'അറിയിപ്പ് ക്രമീകരണങ്ങൾ';

  @override
  String get privacySettings => 'സ്വകാര്യതാ ക്രമീകരണങ്ങൾ';

  @override
  String get accountSettings => 'അക്കൗണ്ട് ക്രമീകരണങ്ങൾ';

  @override
  String get languageSettings => 'ഭാഷാ ക്രമീകരണങ്ങൾ';

  @override
  String get languageChanged => 'ഭാഷ മാറി';

  @override
  String get existingUserButton => 'ഞാൻ നിലവിലുള്ള ഒരു ഉപയോക്താവാണ്.';

  @override
  String get chooseCountryTitle => 'രാജ്യം തിരഞ്ഞെടുക്കുക';

  @override
  String get yesText => 'അതെ';

  @override
  String get noText => 'ഇല്ല';

  @override
  String get appBarTitle => 'പ്രൊഫൈൽ ക്രമീകരണങ്ങൾ';

  @override
  String get userIdLabel => 'ഉപയോക്തൃ ഐഡി *';

  @override
  String get nameLabel => 'പേര്';

  @override
  String get birthCountryLabel => 'ജന്മനാട്';

  @override
  String get birthCityLabel => 'ജനന നഗരം';

  @override
  String get countrySelectionTitle => 'നിങ്ങളുടെ രാജ്യം തിരഞ്ഞെടുക്കുക';

  @override
  String get maleLabel => 'ആൺ';

  @override
  String get femaleLabel => 'സ്ത്രീ';

  @override
  String get birthDateLabel => 'ജനനത്തീയതി';

  @override
  String get birthDatePlaceholder => 'ജനനത്തീയതി തിരഞ്ഞെടുക്കുക';

  @override
  String get birthTimeLabel => 'ജനന സമയം';

  @override
  String get birthTimePlaceholder => 'ജനന സമയം തിരഞ്ഞെടുക്കുക';

  @override
  String get saveProfileButton => 'പ്രൊഫൈൽ സംരക്ഷിക്കുക';

  @override
  String get noCitiesFound => 'നഗരങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String cityPlaceholder(Object country) {
    return '$country എന്നതിൽ നഗരം നൽകുക';
  }

  @override
  String get countryFirstPlaceholder => 'ആദ്യം രാജ്യം തിരഞ്ഞെടുക്കുക';

  @override
  String get versionHistoryTitle => 'പതിപ്പ് ചരിത്രം';

  @override
  String get notSetText => 'സജ്ജീകരിച്ചിട്ടില്ല';

  @override
  String nameHistory(Object name) {
    return 'പേര്: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'നഗരം: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'രാജ്യം: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ലിംഗഭേദം: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ജനനത്തീയതി: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ജനന സമയം: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'സ്ഥാനം: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'സമയമേഖല: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ഡിഎസ്ടി: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'സ്റ്റേറ്റ്: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date-ന് അപ്‌ഡേറ്റ് ചെയ്‌തു.';
  }

  @override
  String get userIdRequired => 'ഉപയോക്തൃ ഐഡി ആവശ്യമാണ്';

  @override
  String get profileSaved => 'പ്രൊഫൈൽ വിജയകരമായി സംരക്ഷിച്ചു';

  @override
  String get saveFailed => 'പ്രൊഫൈൽ സംരക്ഷിക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get errorPrefix => 'പിശക്:';

  @override
  String get onboardingChooseLanguage => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get onboardingChooseLanguageDesc =>
      'തുടരാൻ നിങ്ങൾക്ക് ഇഷ്ടപ്പെട്ട ഭാഷ തിരഞ്ഞെടുക്കുക.';

  @override
  String get onboardingWhatIsAstrology => 'ജ്യോതിഷം എന്താണ്?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ജ്യോതിഷം ആകാശഗോളങ്ങളെക്കുറിച്ചുള്ള പഠനമാണ്...';

  @override
  String get onboardingWhyUseApp => 'എന്തുകൊണ്ടാണ് ഈ ആപ്പ് ഉപയോഗിക്കുന്നത്?';

  @override
  String get onboardingWhyUseAppDesc =>
      'വ്യക്തിഗതമാക്കിയ ജാതകങ്ങൾ, ദൈനംദിന പ്രവചനങ്ങൾ, അറിവുള്ള തീരുമാനങ്ങൾ എടുക്കുന്നതിനുള്ള മാർഗ്ഗനിർദ്ദേശങ്ങൾ എന്നിവ നേടുക.';

  @override
  String get onboardingHowToUse => 'ഈ ആപ്പ് എങ്ങനെ ഉപയോഗിക്കാം?';

  @override
  String get onboardingHowToUseDesc =>
      'എളുപ്പത്തിൽ നാവിഗേറ്റ് ചെയ്യുക, ദിവസേനയുള്ള ജാതകം പരിശോധിക്കുക, കൃത്യമായ പ്രവചനങ്ങൾക്കായി നിങ്ങളുടെ പ്രൊഫൈൽ കൈകാര്യം ചെയ്യുക.';

  @override
  String get onboardingGetStarted => 'ആരംഭിക്കുക';

  @override
  String get onboardingNewUser => 'പുതിയ ഉപയോക്താവ്';

  @override
  String get onboardingExistingUser => 'നിലവിലുള്ള ഉപയോക്താവ്';

  @override
  String get onboardingBack => 'തിരികെ';

  @override
  String get onboardingNext => 'അടുത്തത്';

  @override
  String get userIdNotFound =>
      'ഉപയോക്തൃ ഐഡി കണ്ടെത്തിയില്ല. ദയവായി ലോഗിൻ ചെയ്യുക അല്ലെങ്കിൽ നിങ്ങളുടെ പ്രൊഫൈൽ സജ്ജമാക്കുക.';

  @override
  String get clearNotificationsTitle => 'അറിയിപ്പുകൾ മായ്‌ക്കുക';

  @override
  String get clearNotificationsMessage =>
      'എല്ലാ അറിയിപ്പുകളും മായ്ക്കണമെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?';

  @override
  String get clearNotificationsSuccess =>
      'എല്ലാ അറിയിപ്പുകളും വിജയകരമായി മായ്ച്ചു.';

  @override
  String get clearHoroscopeTitle => 'വ്യക്തമായ ജാതകം';

  @override
  String get clearHoroscopeMessage =>
      'നിങ്ങളുടെ ജാതക ഡാറ്റ മായ്ക്കണമെന്ന് ഉറപ്പാണോ?';

  @override
  String get clearHoroscopeSuccess => 'ജാതകം വിജയകരമായി മായ്ച്ചു.';

  @override
  String get clearChatTitle => 'ചാറ്റ് ചരിത്രം മായ്ക്കുക';

  @override
  String get clearChatMessage =>
      'നിങ്ങളുടെ എല്ലാ ചാറ്റ് ചരിത്രവും ഇല്ലാതാക്കണമെന്ന് ഉറപ്പാണോ?';

  @override
  String get clearChatLocal => 'ചാറ്റ് ലോക്കലായി മായ്ച്ചു.';

  @override
  String get deleteAccountTitle => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountMessage =>
      'നിങ്ങളുടെ അക്കൗണ്ട് ഇല്ലാതാക്കണമെന്ന് ഉറപ്പാണോ? ഇത് നിങ്ങളുടെ എല്ലാ ചാറ്റ് ചരിത്രവും അറിയിപ്പുകളും മായ്ക്കും.';

  @override
  String get deleteAccountSuccess =>
      'നിങ്ങളുടെ അക്കൗണ്ടും എല്ലാ ഡാറ്റയും നീക്കം ചെയ്‌തു.';

  @override
  String get deleteAccountError => 'അക്കൗണ്ട് ഇല്ലാതാക്കുന്നതിൽ പിശക്';

  @override
  String get logoutTitle => 'ലോഗ്ഔട്ട് ചെയ്യുക';

  @override
  String get logoutMessage => 'നിങ്ങൾക്ക് ലോഗ് ഔട്ട് ചെയ്യണമെന്ന് ഉറപ്പാണോ?';

  @override
  String get termsPrivacyTitle => 'നിബന്ധനകളും സ്വകാര്യതയും';

  @override
  String get privacyPolicyTitle => 'സ്വകാര്യതാ നയം';

  @override
  String get termsConditionsTitle => 'നിബന്ധനകളും വ്യവസ്ഥകളും';

  @override
  String get dataControlTitle => 'ഡാറ്റ നിയന്ത്രണം';

  @override
  String get cancelButton => 'റദ്ദാക്കുക';

  @override
  String get confirmButton => 'സ്ഥിരീകരിക്കുക';

  @override
  String get clearQuestionsSuccess =>
      'എല്ലാ ചോദ്യങ്ങളും വിജയകരമായി ഇല്ലാതാക്കി.';

  @override
  String get yoginiLabel => 'യോഗിനി';

  @override
  String get lordLabel => 'യജമാനൻ';

  @override
  String get startLabel => 'ആരംഭിക്കുക';

  @override
  String get recoverAccount => 'അക്കൗണ്ട് വീണ്ടെടുക്കുക';

  @override
  String get endLabel => 'അവസാനിക്കുന്നു';

  @override
  String get startDateLabel => 'ആരംഭിക്കുന്ന തീയതി';

  @override
  String get endDateLabel => 'അവസാന തീയതി';

  @override
  String get notAvailable => 'ലഭ്യമല്ല';

  @override
  String get noData => 'ഡാറ്റ ഇല്ല';

  @override
  String get unknownError => 'അജ്ഞാത പിശക്';

  @override
  String get retryButton => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get kundaliGeneratorTitle => 'കുണ്ഡലി ജനറേറ്റർ';

  @override
  String get natalChartTitle => 'ജനന ചാർട്ട്';

  @override
  String get lagnaLabel => 'ലഗ്നം';

  @override
  String get rashiLabel => 'റാഷി';

  @override
  String get ascDegreeLabel => 'അസെൻഡന്റ് ഡിഗ്രി';

  @override
  String get vimshottariDashaTitle => 'വിംഷോത്തരി ദശ';

  @override
  String get yoginiDashaTitle => 'യോഗിനി ദശ';

  @override
  String get unknown => 'അജ്ഞാതം';

  @override
  String get clearHoroscope => 'വ്യക്തമായ ജാതകം';

  @override
  String get clearNotifications => 'അറിയിപ്പുകൾ മായ്‌ക്കുക';

  @override
  String get clearChatHistory => 'ചാറ്റ് ചരിത്രം മായ്ക്കുക';

  @override
  String get logout => 'ലോഗ്ഔട്ട് ചെയ്യുക';

  @override
  String get deleteAccount => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get allFieldsRequired => 'എല്ലാ ഫീൽഡുകളും പൂരിപ്പിക്കേണ്ടതുണ്ട്.';

  @override
  String get accountRecoveredSuccess => 'അക്കൗണ്ട് വിജയകരമായി വീണ്ടെടുത്തു.';

  @override
  String get recoveryFailed =>
      'വീണ്ടെടുക്കൽ പരാജയപ്പെട്ടു. നിങ്ങളുടെ വിവരങ്ങൾ പരിശോധിക്കുക.';

  @override
  String get recoverySecretLabel => 'വീണ്ടെടുക്കൽ രഹസ്യം:';

  @override
  String get aboutUsTitle => 'ഞങ്ങളേക്കുറിച്ച്';

  @override
  String get aboutOurCompany => 'ഞങ്ങളുടെ കമ്പനിയെക്കുറിച്ച്';

  @override
  String get aboutCompanyDescription =>
      'ഞങ്ങളുടെ ഉപയോക്താക്കൾക്ക് ഏറ്റവും മികച്ച ജ്യോതിഷ അനുഭവം നൽകുന്നതിൽ ഞങ്ങൾ പ്രതിജ്ഞാബദ്ധരാണ്.';

  @override
  String get ourMission => 'ഞങ്ങളുടെ ദൗത്യം';

  @override
  String get missionDescription =>
      'ഉപയോക്താക്കൾക്ക് അവരുടെ ജീവിതത്തിൽ അറിവുള്ള തീരുമാനങ്ങൾ എടുക്കാൻ സഹായിക്കുന്നതിന് കൃത്യവും വ്യക്തിപരവുമായ ജ്യോതിഷ ഉൾക്കാഴ്ചകൾ നൽകുന്നതിന്.';

  @override
  String get ourVision => 'ഞങ്ങളുടെ ദർശനം';

  @override
  String get visionDescription =>
      'സാങ്കേതികവിദ്യയും പുരാതന ജ്ഞാനവും സംയോജിപ്പിച്ച് ഏറ്റവും വിശ്വസനീയമായ ജ്യോതിഷ വേദിയായി മാറുക.';

  @override
  String get ourValues => 'ഞങ്ങളുടെ മൂല്യങ്ങൾ';

  @override
  String get valuesDescription =>
      'സമഗ്രത, കൃത്യത, ഉപയോക്തൃ കേന്ദ്രീകൃത രൂപകൽപ്പന, തുടർച്ചയായ നവീകരണം.';

  @override
  String get contactUs => 'ഞങ്ങളെ സമീപിക്കുക';

  @override
  String get contactEmail => 'ഇമെയിൽ: support@yourcompany.com';

  @override
  String get contactWebsite => 'വെബ്സൈറ്റ്: www.yourcompany.com';

  @override
  String get customerSupport => 'ഉപഭോക്തൃ പിന്തുണ';

  @override
  String get supportHeroTitle => 'സഹായിക്കാൻ ഞങ്ങൾ ഇവിടെയുണ്ട്';

  @override
  String get supportHeroDescription =>
      'താഴെയുള്ള ഫോം പൂരിപ്പിക്കുക, ഞങ്ങളുടെ പിന്തുണാ ടീം എത്രയും വേഗം നിങ്ങളെ ബന്ധപ്പെടുന്നതായിരിക്കും.';

  @override
  String get yourName => 'നിങ്ങളുടെ പേര്';

  @override
  String get yourEmail => 'നിങ്ങളുടെ ഇമെയിൽ';

  @override
  String get message => 'സന്ദേശം';

  @override
  String get enterEmail => 'നിങ്ങളുടെ ഇമെയിൽ നൽകുക';

  @override
  String get enterValidEmail => 'സാധുവായ ഒരു ഇമെയിൽ വിലാസം നൽകുക';

  @override
  String enterField(Object fieldName) {
    return '$fieldName നൽകുക';
  }

  @override
  String get send => 'അയയ്‌ക്കുക';

  @override
  String get sending => 'അയയ്ക്കുന്നു...';

  @override
  String get emailSentSuccess => '✅ ഇമെയിൽ വിജയകരമായി അയച്ചു!';

  @override
  String get emailSendFailed => '❌ ഇമെയിൽ അയയ്ക്കുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get astroDictionaryTitle => 'ആസ്ട്രോ നിഘണ്ടു';

  @override
  String get searchTermsHint => 'തിരയൽ പദങ്ങൾ...';

  @override
  String get noTermsFound => 'പദങ്ങളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get buyQuestionsTitle => 'ചോദ്യങ്ങൾ വാങ്ങുക';

  @override
  String get userNotAuthenticated => 'ഉപയോക്താവിനെ ആധികാരികമാക്കിയിട്ടില്ല.';

  @override
  String get loadStoreDataFailed =>
      'സ്റ്റോർ ഡാറ്റ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get missingAuthToken => 'ഓത്ത് ടോക്കൺ കാണുന്നില്ല';

  @override
  String get merchantDisplayName => 'ആസ്ട്രോ ചാറ്റ് ആപ്പ്';

  @override
  String get paymentSuccessful => '✅ പേയ്‌മെന്റ് വിജയകരം! ചോദ്യം അയച്ചു.';

  @override
  String paymentFailed(Object error) {
    return '❌ പേയ്‌മെന്റ് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get yourBalance => 'നിങ്ങളുടെ ബാലൻസ്';

  @override
  String questionsBalance(Object count) {
    return '$count ചോദ്യങ്ങൾ';
  }

  @override
  String get availableOffers => 'ലഭ്യമായ ഓഫറുകൾ';

  @override
  String questionsCount(Object count) {
    return '$count ചോദ്യം';
  }

  @override
  String get buyButton => 'വാങ്ങുക';

  @override
  String get dailyHoroscopeTitle => '🌟 ദൈനംദിന ജാതകം';

  @override
  String get userIdMissing => 'ഉപയോക്തൃ ഐഡി കാണുന്നില്ല.';

  @override
  String get fetchHoroscopesFailed => 'ജാതകം കണ്ടെത്തുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get noHoroscopeFound => 'ജാതകം കണ്ടെത്തിയില്ല.';

  @override
  String get signLabel => 'അടയാളം';

  @override
  String get todayLabel => 'ഇന്ന്';

  @override
  String get yesterdayLabel => 'ഇന്നലെ';

  @override
  String get thisWeekLabel => 'ഈ ആഴ്ച';

  @override
  String get lastMonthLabel => 'കഴിഞ്ഞ മാസം';

  @override
  String get chatTitle => 'ചാറ്റ്';

  @override
  String get typeYourQuestionHint => 'നിങ്ങളുടെ ചോദ്യം ടൈപ്പ് ചെയ്യുക...';

  @override
  String get paymentRequired => 'പേയ്‌മെന്റ് ആവശ്യമാണ്';

  @override
  String get paymentRequiredMessage =>
      'നിങ്ങളുടെ സൗജന്യ ചോദ്യങ്ങൾ നിങ്ങൾ ഉപയോഗിച്ചു കഴിഞ്ഞു. തുടരാൻ ₹50 അടയ്ക്കുക.';

  @override
  String get payNowButton => 'ഇപ്പോൾ പണമടയ്‌ക്കുക';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ബാക്കി സൗജന്യ ചോദ്യങ്ങൾ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ബാക്കിയുളള പണമടച്ചുള്ള ചോദ്യങ്ങൾ';
  }

  @override
  String get thankYouFeedback => 'നിങ്ങളുടെ ഫീഡ്‌ബാക്കിന് നന്ദി!';

  @override
  String get ratingSubmitted => 'റേറ്റിംഗ് സമർപ്പിച്ചു!';

  @override
  String get setUserIdFirst => 'ആദ്യം നിങ്ങളുടെ ഉപയോക്തൃ ഐഡി സജ്ജമാക്കുക.';

  @override
  String get failedToFetchPrevious =>
      'മുൻ ചോദ്യങ്ങളും ഉത്തരങ്ങളും ലഭ്യമാക്കുന്നതിൽ പരാജയപ്പെട്ടു.';

  @override
  String errorOccurred(Object error) {
    return 'പിശക്: $error';
  }

  @override
  String get drawerAstroProfile => 'ആസ്ട്രോ പ്രൊഫൈൽ';

  @override
  String get drawerDailyHoroscope => 'ദൈനംദിന ജാതകം';

  @override
  String get drawerBuyQuestions => 'ചോദ്യങ്ങൾ വാങ്ങുക';

  @override
  String get drawerAstroDictionary => 'ആസ്ട്രോ നിഘണ്ടു';

  @override
  String get drawerSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get drawerCustomerSupport => 'ഉപഭോക്തൃ പിന്തുണ';

  @override
  String get drawerAbout => 'കുറിച്ച്';

  @override
  String get drawerProfileSettings => 'പ്രൊഫൈൽ ക്രമീകരണങ്ങൾ';

  @override
  String get demoNotificationTitle => '🔔 ഡെമോ അറിയിപ്പ്';

  @override
  String get demoNotificationBody =>
      'ഇത് നിങ്ങളുടെ ആപ്പിൽ നിന്നുള്ള ഒരു പരീക്ഷണ അറിയിപ്പാണ്!';

  @override
  String get notificationsTitle => 'അറിയിപ്പുകൾ';

  @override
  String get noNotifications => 'അറിയിപ്പുകളൊന്നുമില്ല';

  @override
  String get allTab => 'എല്ലാം';

  @override
  String get markAllAsRead => 'എല്ലാം വായിച്ചതായി അടയാളപ്പെടുത്തുക';

  @override
  String get notificationMarkedRead => 'അറിയിപ്പ് വായിച്ചതായി അടയാളപ്പെടുത്തി';

  @override
  String get failedToLoadNotifications =>
      'അറിയിപ്പുകൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get failedToMarkRead => 'വായിച്ചതായി അടയാളപ്പെടുത്താനായില്ല';

  @override
  String get failedToMarkAllRead => 'എല്ലാം വായിച്ചതായി അടയാളപ്പെടുത്താനായില്ല';

  @override
  String get socketConnected => 'സോക്കറ്റ് ബന്ധിപ്പിച്ചു';

  @override
  String get socketDisconnected => 'സോക്കറ്റ് വിച്ഛേദിച്ചു';

  @override
  String get newNotificationReceived => 'പുതിയ അറിയിപ്പ് ലഭിച്ചു';

  @override
  String get generalCategory => 'ജനറൽ';

  @override
  String get horoscopeCategory => 'ജാതകം';

  @override
  String get chatCategory => 'ചാറ്റ്';

  @override
  String get systemCategory => 'സിസ്റ്റം';

  @override
  String get updateCategory => 'അപ്‌ഡേറ്റുകൾ';

  @override
  String get howToAskTitle => 'എങ്ങനെ ചോദിക്കാം';

  @override
  String get noQuestionsAvailable => 'ചോദ്യങ്ങളൊന്നും ലഭ്യമല്ല.';

  @override
  String get failedToLoadQuestions => 'ചോദ്യങ്ങൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get pullToRefresh => 'പുതുക്കാൻ വലിക്കുക';

  @override
  String get careerCategory => 'കരിയർ';

  @override
  String get loveCategory => 'പ്രണയവും ബന്ധങ്ങളും';

  @override
  String get healthCategory => 'ആരോഗ്യം';

  @override
  String get financeCategory => 'സാമ്പത്തിക';

  @override
  String get familyCategory => 'കുടുംബം';

  @override
  String get educationCategory => 'വിദ്യാഭ്യാസം';

  @override
  String get travelCategory => 'യാത്ര';

  @override
  String get spiritualCategory => 'ആത്മീയം';

  @override
  String get profileLoaded => 'പ്രൊഫൈൽ വിജയകരമായി ലോഡ് ചെയ്തു';

  @override
  String get imageUploaded => 'ചിത്രം വിജയകരമായി അപ്‌ലോഡ് ചെയ്തു';

  @override
  String get savedInformationConfirmation =>
      'ഞാൻ ഈ വിവരങ്ങൾ സേവ് ചെയ്തിട്ടുണ്ട്.';

  @override
  String get noHistoryAvailable => 'ചരിത്രമൊന്നും ലഭ്യമല്ല.';

  @override
  String get missingUserIdError => 'ഉപയോക്തൃ ഐഡി ആവശ്യമാണ്';

  @override
  String get networkError => 'നെറ്റ്‌വർക്ക് പിശക്. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get timeoutError => 'അഭ്യർത്ഥന കാലഹരണപ്പെട്ടു';

  @override
  String get genericError => 'എന്തോ കുഴപ്പം സംഭവിച്ചു.';

  @override
  String get reactionUpdateError => 'പ്രതികരണം അപ്ഡേറ്റ് ചെയ്യാനായില്ല';

  @override
  String get noSearchResults => 'തിരയൽ ഫലങ്ങളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get clearSearch => 'തിരയൽ മായ്ക്കുക';

  @override
  String get resultsFound => 'ഫലങ്ങൾ കണ്ടെത്തി';

  @override
  String get recoverySecretHint =>
      'കോപ്പി-പേസ്റ്റ് പ്രവർത്തിച്ചേക്കില്ല, സ്വമേധയാ ടൈപ്പ് ചെയ്യുക.';

  @override
  String get recoverAccountDescription =>
      'നിങ്ങളുടെ അക്കൗണ്ട് വീണ്ടെടുക്കാൻ ഈ ഘട്ടങ്ങൾ പാലിക്കുക.';

  @override
  String get processingLabel => 'പ്രോസസ്സ് ചെയ്യുന്നു...';

  @override
  String get clearChatSuccess => 'ചാറ്റ് വിജയകരമായി മായ്ച്ചു';

  @override
  String get notificationsEnabled => 'അറിയിപ്പുകൾ പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get notificationsDisabled => 'അറിയിപ്പുകൾ പ്രവർത്തനരഹിതമാക്കി';

  @override
  String get securityNotice =>
      'നിങ്ങളുടെ ഡാറ്റ സുരക്ഷിതമായി എൻക്രിപ്റ്റ് ചെയ്ത് സൂക്ഷിച്ചിരിക്കുന്നു.';

  @override
  String get loading => 'ലോഡ് ചെയ്യുന്നു...';

  @override
  String get selectLanguage => 'ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get onboardingGetStartedDesc =>
      'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുത്തുകൊണ്ട് ആരംഭിക്കുക';

  @override
  String get accountRecoveryTitle => '🔐 അക്കൗണ്ട് വീണ്ടെടുക്കൽ വിശദാംശങ്ങൾ';

  @override
  String get recoveryInstructions =>
      'ഈ വിവരങ്ങൾ സുരക്ഷിതമായി സംരക്ഷിക്കുക. നിങ്ങളുടെ അക്കൗണ്ട് വീണ്ടെടുക്കാൻ ഇത് ആവശ്യമായി വരും.';

  @override
  String get importantNotice => '⚠️ പ്രധാനം:';

  @override
  String get astrologerProfileTitle => 'ജ്യോതിഷി പ്രൊഫൈൽ';

  @override
  String get personalAstrologer => 'വ്യക്തിഗത ജ്യോതിഷി';

  @override
  String get makePersonalAstrologer => 'ഒരു വ്യക്തിഗത ജ്യോതിഷിയെ സൃഷ്ടിക്കുക';

  @override
  String get favoriteDescription =>
      'നിങ്ങളുടെ ചോദ്യങ്ങൾക്ക് മുൻഗണന നൽകുന്നത് ഈ ജ്യോതിഷിയായിരിക്കും. ലഭ്യമല്ലെങ്കിൽ, യോഗ്യതയുള്ള മറ്റൊരു ജ്യോതിഷി നിങ്ങളെ സഹായിക്കും.';

  @override
  String get educationQualifications => 'വിദ്യാഭ്യാസവും യോഗ്യതയും';

  @override
  String get aboutSection => 'കുറിച്ച്';

  @override
  String get shareProfile => 'പ്രൊഫൈൽ പങ്കിടുക';

  @override
  String get loadingAstrologer => 'ജ്യോത്സ്യ വിശദാംശങ്ങൾ ലോഡ് ചെയ്യുന്നു...';

  @override
  String get failedToLoadAstrologer =>
      'ജ്യോതിഷികളുടെ വിശദാംശങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു.';

  @override
  String get authenticationRequired =>
      'ആധികാരികത ആവശ്യമാണ്. ദയവായി ലോഗിൻ ചെയ്യുക.';

  @override
  String securityCheckFailed(Object error) {
    return 'സുരക്ഷാ പരിശോധന പരാജയപ്പെട്ടു: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ഇപ്പോൾ നിങ്ങളുടെ സ്വകാര്യ ജ്യോതിഷിയാണ്';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ പ്രിയപ്പെട്ടവയിൽ നിന്ന് $name നീക്കം ചെയ്‌തു.';
  }

  @override
  String get toggleFavoriteError =>
      'പ്രിയപ്പെട്ട സ്റ്റാറ്റസ് അപ്ഡേറ്റ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 വിദ്യാഭ്യാസം: $education\n📜 യോഗ്യത: $qualification\n⏳ പരിചയം: $experience';
  }

  @override
  String get notProvided => 'നൽകിയിട്ടില്ല';

  @override
  String reviews(Object count) {
    return '($count അവലോകനങ്ങൾ)';
  }

  @override
  String get specialties => 'പ്രത്യേകതകൾ';

  @override
  String get experience => 'അനുഭവം';

  @override
  String get qualification => 'യോഗ്യത';

  @override
  String get education => 'വിദ്യാഭ്യാസം';

  @override
  String get recoveryTips =>
      '• ഈ വിവരങ്ങളുടെ സ്ക്രീൻഷോട്ട് എടുക്കുക\n• സുരക്ഷിതമായ സ്ഥലത്ത് സൂക്ഷിക്കുക\n• ആരുമായും പങ്കിടരുത്\n• ഇത് ഒരിക്കൽ മാത്രമേ കാണിക്കൂ';
}
