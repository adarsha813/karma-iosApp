// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get notificationSettings => 'அறிவிப்பு அமைப்புகள்';

  @override
  String get privacySettings => 'தனியுரிமை அமைப்புகள்';

  @override
  String get accountSettings => 'கணக்கு அமைப்புகள்';

  @override
  String get languageSettings => 'மொழி அமைப்புகள்';

  @override
  String get languageChanged => 'மொழி மாற்றப்பட்டது';

  @override
  String get existingUserButton => 'நான் ஏற்கனவே உள்ள பயனர்.';

  @override
  String get chooseCountryTitle => 'நாட்டைத் தேர்வுசெய்க';

  @override
  String get yesText => 'ஆம்';

  @override
  String get noText => 'இல்லை';

  @override
  String get appBarTitle => 'சுயவிவர அமைப்புகள்';

  @override
  String get userIdLabel => 'பயனர் ஐடி *';

  @override
  String get nameLabel => 'பெயர்';

  @override
  String get birthCountryLabel => 'பிறந்த நாடு';

  @override
  String get birthCityLabel => 'பிறந்த நகரம்';

  @override
  String get countrySelectionTitle => 'உங்கள் நாட்டைத் தேர்வுசெய்க';

  @override
  String get maleLabel => 'ஆண்';

  @override
  String get femaleLabel => 'பெண்';

  @override
  String get birthDateLabel => 'பிறந்த தேதி';

  @override
  String get birthDatePlaceholder => 'பிறந்த தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get birthTimeLabel => 'பிறந்த நேரம்';

  @override
  String get birthTimePlaceholder => 'பிறந்த நேரத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get saveProfileButton => 'சுயவிவரத்தைச் சேமி';

  @override
  String get noCitiesFound => 'நகரங்கள் எதுவும் இல்லை';

  @override
  String cityPlaceholder(Object country) {
    return '$country இல் நகரத்தை உள்ளிடவும்';
  }

  @override
  String get countryFirstPlaceholder => 'முதலில் நாட்டைத் தேர்ந்தெடுக்கவும்';

  @override
  String get versionHistoryTitle => 'பதிப்பு வரலாறு';

  @override
  String get notSetText => 'அமைக்கப்படவில்லை';

  @override
  String nameHistory(Object name) {
    return 'பெயர்: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'நகரம்: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'நாடு: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'பாலினம்: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'பிறந்த தேதி: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'பிறந்த நேரம்: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'இடம்: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'நேர மண்டலம்: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'நிலை: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date அன்று புதுப்பிக்கப்பட்டது.';
  }

  @override
  String get userIdRequired => 'பயனர் ஐடி அவசியம்';

  @override
  String get profileSaved => 'சுயவிவரம் வெற்றிகரமாக சேமிக்கப்பட்டது';

  @override
  String get saveFailed => 'சுயவிவரத்தைச் சேமிக்க முடியவில்லை.';

  @override
  String get errorPrefix => 'பிழை:';

  @override
  String get onboardingChooseLanguage => 'உங்கள் மொழியை தேர்வு செய்யவும்';

  @override
  String get onboardingChooseLanguageDesc =>
      'தொடர உங்களுக்கு விருப்பமான மொழியைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get onboardingWhatIsAstrology => 'ஜோதிடம் என்றால் என்ன?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ஜோதிடம் என்பது வான உடல்களைப் பற்றிய ஆய்வு...';

  @override
  String get onboardingWhyUseApp => 'இந்த பயன்பாட்டை ஏன் பயன்படுத்த வேண்டும்?';

  @override
  String get onboardingWhyUseAppDesc =>
      'தனிப்பயனாக்கப்பட்ட ஜாதகங்கள், தினசரி கணிப்புகள் மற்றும் தகவலறிந்த முடிவுகளை எடுக்க வழிகாட்டுதல்களைப் பெறுங்கள்.';

  @override
  String get onboardingHowToUse => 'இந்த பயன்பாட்டை எவ்வாறு பயன்படுத்துவது?';

  @override
  String get onboardingHowToUseDesc =>
      'எளிதாக செல்லவும், தினசரி ஜாதகங்களைச் சரிபார்க்கவும், துல்லியமான கணிப்புகளுக்கு உங்கள் சுயவிவரத்தை நிர்வகிக்கவும்.';

  @override
  String get onboardingGetStarted => 'தொடங்குங்கள்';

  @override
  String get onboardingNewUser => 'புதிய பயனர்';

  @override
  String get onboardingExistingUser => 'ஏற்கனவே உள்ள பயனர்';

  @override
  String get onboardingBack => 'மீண்டும்';

  @override
  String get onboardingNext => 'அடுத்து';

  @override
  String get userIdNotFound =>
      'பயனர் ஐடி கிடைக்கவில்லை. உள்நுழையவும் அல்லது உங்கள் சுயவிவரத்தை அமைக்கவும்.';

  @override
  String get clearNotificationsTitle => 'அறிவிப்புகளை அழி';

  @override
  String get clearNotificationsMessage =>
      'எல்லா அறிவிப்புகளையும் அழிக்க விரும்புகிறீர்களா?';

  @override
  String get clearNotificationsSuccess =>
      'அனைத்து அறிவிப்புகளும் வெற்றிகரமாக அழிக்கப்பட்டன.';

  @override
  String get clearHoroscopeTitle => 'தெளிவான ஜாதகம்';

  @override
  String get clearHoroscopeMessage =>
      'உங்கள் ஜாதகத் தரவை நிச்சயமாக அழிக்க விரும்புகிறீர்களா?';

  @override
  String get clearHoroscopeSuccess => 'ஜாதகம் வெற்றிகரமாக அழிக்கப்பட்டது.';

  @override
  String get clearChatTitle => 'அரட்டை வரலாற்றை அழி';

  @override
  String get clearChatMessage =>
      'உங்கள் அரட்டை வரலாறு முழுவதையும் நீக்க விரும்புகிறீர்களா?';

  @override
  String get clearChatLocal => 'அரட்டை உள்ளூரில் அழிக்கப்பட்டது.';

  @override
  String get deleteAccountTitle => 'கணக்கை நீக்கு';

  @override
  String get deleteAccountMessage =>
      'உங்கள் கணக்கை நீக்க விரும்புகிறீர்களா? இது உங்கள் அரட்டை வரலாறு மற்றும் அறிவிப்புகள் அனைத்தையும் அழிக்கும்.';

  @override
  String get deleteAccountSuccess =>
      'உங்கள் கணக்கும் எல்லா தரவும் நீக்கப்பட்டன.';

  @override
  String get deleteAccountError => 'கணக்கை நீக்குவதில் பிழை';

  @override
  String get logoutTitle => 'வெளியேறு';

  @override
  String get logoutMessage => 'நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get termsPrivacyTitle => 'விதிமுறைகள் & தனியுரிமை';

  @override
  String get privacyPolicyTitle => 'தனியுரிமைக் கொள்கை';

  @override
  String get termsConditionsTitle => 'விதிமுறைகளும் நிபந்தனைகளும்';

  @override
  String get dataControlTitle => 'தரவு கட்டுப்பாடு';

  @override
  String get cancelButton => 'ரத்துசெய்';

  @override
  String get confirmButton => 'உறுதிப்படுத்தவும்';

  @override
  String get clearQuestionsSuccess =>
      'அனைத்து கேள்விகளும் வெற்றிகரமாக நீக்கப்பட்டன.';

  @override
  String get yoginiLabel => 'யோகினி';

  @override
  String get lordLabel => 'இறைவன்';

  @override
  String get startLabel => 'தொடங்கு';

  @override
  String get recoverAccount => 'கணக்கை மீட்டெடுங்கள்';

  @override
  String get endLabel => 'முடிவு';

  @override
  String get startDateLabel => 'தொடக்க தேதி';

  @override
  String get endDateLabel => 'முடிவு தேதி';

  @override
  String get notAvailable => 'கிடைக்கவில்லை';

  @override
  String get noData => 'தரவு இல்லை';

  @override
  String get unknownError => 'தெரியாத பிழை';

  @override
  String get retryButton => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get kundaliGeneratorTitle => 'குண்டலி ஜெனரேட்டர்';

  @override
  String get natalChartTitle => 'பிறப்பு விளக்கப்படம்';

  @override
  String get lagnaLabel => 'லக்னம்';

  @override
  String get rashiLabel => 'ராஷி';

  @override
  String get ascDegreeLabel => 'ஏறுவரிசை பட்டம்';

  @override
  String get vimshottariDashaTitle => 'விம்ஷோத்தரி தசா';

  @override
  String get yoginiDashaTitle => 'யோகினி தசா';

  @override
  String get unknown => 'தெரியவில்லை';

  @override
  String get clearHoroscope => 'தெளிவான ஜாதகம்';

  @override
  String get clearNotifications => 'அறிவிப்புகளை அழி';

  @override
  String get clearChatHistory => 'அரட்டை வரலாற்றை அழி';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String get allFieldsRequired => 'அனைத்து புலங்களும் தேவை.';

  @override
  String get accountRecoveredSuccess =>
      'கணக்கு வெற்றிகரமாக மீட்டெடுக்கப்பட்டது.';

  @override
  String get recoveryFailed =>
      'மீட்பு தோல்வியடைந்தது. உங்கள் தகவலைச் சரிபார்க்கவும்.';

  @override
  String get recoverySecretLabel => 'மீட்பு ரகசியம்:';

  @override
  String get aboutUsTitle => 'எங்களை பற்றி';

  @override
  String get aboutOurCompany => 'எங்கள் நிறுவனம் பற்றி';

  @override
  String get aboutCompanyDescription =>
      'கர்மாவில், வேத ஜோதிடத்தின் காலத்தால் அழியாத ஞானத்தின் மூலம் உங்கள் உண்மையான வாழ்க்கைப் பாதையைக் கண்டறிய நாங்கள் உங்களுக்கு உதவுகிறோம். ஒவ்வொரு நுண்ணறிவும் உண்மையான, அனுபவம் வாய்ந்த ஜோதிடர்களிடமிருந்து வருகிறது, உங்கள் தனித்துவமான பிறப்பு விளக்கப்படத்தின் அடிப்படையில் கவனமாக வடிவமைக்கப்பட்டுள்ளது. தினசரி ஜாதகங்கள் முதல் தனிப்பயனாக்கப்பட்ட வழிகாட்டுதல் வரை, கர்மா பண்டைய அறிவை 100 க்கும் மேற்பட்ட மொழிகளில் அணுகக்கூடியதாக ஆக்குகிறது.';

  @override
  String get ourMission => 'எங்கள் நோக்கம்';

  @override
  String get missionDescription =>
      'எங்கள் நோக்கம் எளிமையானது: நம்பிக்கையான, தகவலறிந்த முடிவுகளை எடுக்க உங்களை ஊக்குவிக்கும் உண்மையான, மனிதர்களால் வழிநடத்தப்படும் ஜோதிட வழிகாட்டுதலை வழங்குவது. ஒவ்வொரு கணிப்பும் ஆலோசனையும் தானியங்கி வழிமுறைகள் அல்ல, பல ஆண்டுகால தொழில்முறை நிபுணத்துவத்தை பிரதிபலிக்கிறது.';

  @override
  String get ourVision => 'எங்கள் தொலைநோக்கு';

  @override
  String get visionDescription =>
      'வேத ஜோதிடத்திற்கான உலகின் மிகவும் நம்பகமான தளமாக இருக்க நாங்கள் பாடுபடுகிறோம், எல்லா இடங்களிலும் உள்ள மக்கள் தங்களை, அவர்களின் தேர்வுகள் மற்றும் அவர்களின் வாழ்க்கைப் பயணத்தை தெளிவுடனும் நம்பிக்கையுடனும் புரிந்துகொள்ள உதவுகிறோம்.';

  @override
  String get ourValues => 'எங்கள் மதிப்புகள்';

  @override
  String get valuesDescription =>
      'கர்மாவில், நம்பகத்தன்மை, துல்லியம் மற்றும் நம்பிக்கையை நாங்கள் மதிக்கிறோம். வாழ்க்கையை நுண்ணறிவு மற்றும் நம்பிக்கையுடன் வழிநடத்த உதவும் துல்லியமான வழிகாட்டுதலை மட்டுமல்லாமல் அர்த்தமுள்ள வழிகாட்டுதலையும் வழங்க நாங்கள் உறுதிபூண்டுள்ளோம்.';

  @override
  String get contactUs => 'எங்களை தொடர்பு கொள்ள';

  @override
  String get contactEmail => 'மின்னஞ்சல்: support@yourcompany.com';

  @override
  String get contactWebsite => 'வலைத்தளம்: www.yourcompany.com';

  @override
  String get customerSupport => 'வாடிக்கையாளர் ஆதரவு';

  @override
  String get supportHeroTitle => 'நாங்கள் உதவ இங்கே இருக்கிறோம்';

  @override
  String get supportHeroDescription =>
      'கீழே உள்ள படிவத்தை நிரப்பவும், எங்கள் ஆதரவு குழு விரைவில் உங்களைத் தொடர்பு கொள்ளும்.';

  @override
  String get yourName => 'உங்கள் பெயர்';

  @override
  String get yourEmail => 'உங்கள் மின்னஞ்சல் முகவரி';

  @override
  String get message => 'செய்தி';

  @override
  String get enterEmail => 'உங்கள் மின்னஞ்சலை உள்ளிடவும்';

  @override
  String get enterValidEmail =>
      'செல்லுபடியாகும் மின்னஞ்சல் முகவரியை உள்ளிடவும்.';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ஐ உள்ளிடவும்';
  }

  @override
  String get send => 'அனுப்பவும்';

  @override
  String get sending => 'அனுப்புகிறது...';

  @override
  String get emailSentSuccess => '✅ மின்னஞ்சல் வெற்றிகரமாக அனுப்பப்பட்டது!';

  @override
  String get emailSendFailed => '❌ மின்னஞ்சல் அனுப்ப முடியவில்லை.';

  @override
  String get astroDictionaryTitle => 'ஜோதிட அகராதி';

  @override
  String get searchTermsHint => 'தேடல் சொற்கள்...';

  @override
  String get noTermsFound => 'எந்த சொற்களும் கிடைக்கவில்லை.';

  @override
  String get buyQuestionsTitle => 'கேள்விகளை வாங்கவும்';

  @override
  String get userNotAuthenticated => 'பயனர் அங்கீகரிக்கப்படவில்லை.';

  @override
  String get loadStoreDataFailed => 'ஸ்டோர் தரவை ஏற்ற முடியவில்லை.';

  @override
  String get missingAuthToken => 'அங்கீகார டோக்கன் இல்லை.';

  @override
  String get merchantDisplayName => 'ஆஸ்ட்ரோ அரட்டை செயலி';

  @override
  String get paymentSuccessful =>
      '✅ பணம் செலுத்தப்பட்டது! கேள்வி அனுப்பப்பட்டது.';

  @override
  String paymentFailed(Object error) {
    return '❌ பணம் செலுத்துதல் தோல்வியடைந்தது: $error';
  }

  @override
  String get yourBalance => 'உங்கள் இருப்பு';

  @override
  String questionsBalance(Object count) {
    return '$count கேள்விகள்';
  }

  @override
  String get availableOffers => 'கிடைக்கும் சலுகைகள்';

  @override
  String questionsCount(Object count) {
    return '$count கேள்வி';
  }

  @override
  String get buyButton => 'வாங்கவும்';

  @override
  String get dailyHoroscopeTitle => '🌟 தினசரி ஜாதகம்';

  @override
  String get userIdMissing => 'பயனர் ஐடி இல்லை.';

  @override
  String get fetchHoroscopesFailed => 'ஜாதகங்களைப் பெற முடியவில்லை.';

  @override
  String get noHoroscopeFound => 'ஜாதகம் கிடைக்கவில்லை.';

  @override
  String get signLabel => 'அடையாளம்';

  @override
  String get todayLabel => 'இன்று';

  @override
  String get yesterdayLabel => 'நேற்று';

  @override
  String get thisWeekLabel => 'இந்த வாரம்';

  @override
  String get lastMonthLabel => 'கடந்த மாதம்';

  @override
  String get chatTitle => 'அரட்டை';

  @override
  String get typeYourQuestionHint => 'உங்கள் கேள்வியை தட்டச்சு செய்யவும்...';

  @override
  String get paymentRequired => 'கட்டணம் செலுத்த வேண்டும்';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'உங்கள் இலவச கேள்விகளைப் பயன்படுத்திவிட்டீர்கள். தொடர $amount செலுத்தவும்.';
  }

  @override
  String get payNowButton => 'இப்போதே பணம் செலுத்துங்கள்';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count மீதமுள்ள இலவச கேள்விகள்';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count மீதமுள்ள பணம் செலுத்திய கேள்விகள்';
  }

  @override
  String get thankYouFeedback => 'உங்கள் கருத்துக்கு நன்றி!';

  @override
  String get ratingSubmitted => 'மதிப்பீடு சமர்ப்பிக்கப்பட்டது!';

  @override
  String get setUserIdFirst => 'முதலில் உங்கள் பயனர் ஐடியை அமைக்கவும்.';

  @override
  String get failedToFetchPrevious =>
      'முந்தைய கேள்விகள் மற்றும் பதில்களைப் பெற முடியவில்லை.';

  @override
  String errorOccurred(Object error) {
    return 'பிழை: $error';
  }

  @override
  String get drawerAstroProfile => 'ஆஸ்ட்ரோ சுயவிவரம்';

  @override
  String get drawerDailyHoroscope => 'தினசரி ஜாதகம்';

  @override
  String get drawerBuyQuestions => 'கேள்விகளை வாங்கவும்';

  @override
  String get drawerAstroDictionary => 'ஜோதிட அகராதி';

  @override
  String get drawerSettings => 'அமைப்புகள்';

  @override
  String get drawerCustomerSupport => 'வாடிக்கையாளர் ஆதரவு';

  @override
  String get drawerAbout => 'பற்றி';

  @override
  String get drawerProfileSettings => 'சுயவிவர அமைப்புகள்';

  @override
  String get demoNotificationTitle => '🔔 டெமோ அறிவிப்பு';

  @override
  String get demoNotificationBody =>
      'இது உங்கள் பயன்பாட்டிலிருந்து வந்த சோதனை அறிவிப்பு!';

  @override
  String get notificationsTitle => 'அறிவிப்புகள்';

  @override
  String get noNotifications => 'அறிவிப்புகள் இல்லை';

  @override
  String get allTab => 'அனைத்தும்';

  @override
  String get markAllAsRead => 'அனைத்தையும் படித்ததாகக் குறி';

  @override
  String get notificationMarkedRead => 'அறிவிப்பு படித்ததாகக் குறிக்கப்பட்டது';

  @override
  String get failedToLoadNotifications => 'அறிவிப்புகளை ஏற்ற முடியவில்லை.';

  @override
  String get failedToMarkRead => 'படித்ததாகக் குறிக்க முடியவில்லை.';

  @override
  String get failedToMarkAllRead =>
      'அனைத்தையும் படித்ததாகக் குறிக்க முடியவில்லை.';

  @override
  String get socketConnected => 'சாக்கெட் இணைக்கப்பட்டது';

  @override
  String get socketDisconnected => 'சாக்கெட் துண்டிக்கப்பட்டது';

  @override
  String get newNotificationReceived => 'புதிய அறிவிப்பு பெறப்பட்டது';

  @override
  String get generalCategory => 'பொது';

  @override
  String get horoscopeCategory => 'ஜாதகம்';

  @override
  String get chatCategory => 'அரட்டை';

  @override
  String get systemCategory => 'அமைப்பு';

  @override
  String get updateCategory => 'புதுப்பிப்புகள்';

  @override
  String get howToAskTitle => 'எப்படி கேட்பது';

  @override
  String get noQuestionsAvailable => 'கேள்விகள் எதுவும் இல்லை.';

  @override
  String get failedToLoadQuestions => 'கேள்விகளை ஏற்ற முடியவில்லை.';

  @override
  String get pullToRefresh => 'புதுப்பிக்க இழுக்கவும்';

  @override
  String get careerCategory => 'தொழில்';

  @override
  String get loveCategory => 'காதல் & உறவுகள்';

  @override
  String get healthCategory => 'சுகாதாரம்';

  @override
  String get financeCategory => 'நிதி';

  @override
  String get familyCategory => 'குடும்பம்';

  @override
  String get educationCategory => 'கல்வி';

  @override
  String get travelCategory => 'பயணம்';

  @override
  String get spiritualCategory => 'ஆன்மீகம்';

  @override
  String get profileLoaded => 'சுயவிவரம் வெற்றிகரமாக ஏற்றப்பட்டது';

  @override
  String get imageUploaded => 'படம் வெற்றிகரமாக பதிவேற்றப்பட்டது.';

  @override
  String get savedInformationConfirmation => 'நான் இந்த தகவலை சேமித்துள்ளேன்.';

  @override
  String get noHistoryAvailable => 'வரலாறு எதுவும் கிடைக்கவில்லை.';

  @override
  String get missingUserIdError => 'பயனர் ஐடி அவசியம்';

  @override
  String get networkError => 'நெட்வொர்க் பிழை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get timeoutError => 'கோரிக்கை நேரம் முடிந்தது';

  @override
  String get genericError => 'ஏதோ தவறாகிவிட்டது.';

  @override
  String get reactionUpdateError => 'எதிர்வினையைப் புதுப்பிக்க முடியவில்லை.';

  @override
  String get noSearchResults => 'தேடல் முடிவுகள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get clearSearch => 'தேடலை அழி';

  @override
  String get resultsFound => 'முடிவுகள் கிடைத்தன';

  @override
  String get recoverySecretHint =>
      'நகலெடுத்து ஒட்டுவது வேலை செய்யாமல் போகலாம், கைமுறையாக தட்டச்சு செய்யவும்.';

  @override
  String get recoverAccountDescription =>
      'உங்கள் கணக்கை மீட்டெடுக்க இந்தப் படிகளைப் பின்பற்றவும்.';

  @override
  String get processingLabel => 'செயலாக்குகிறது...';

  @override
  String get clearChatSuccess => 'அரட்டை வெற்றிகரமாக அழிக்கப்பட்டது.';

  @override
  String get notificationsEnabled => 'அறிவிப்புகள் இயக்கப்பட்டன';

  @override
  String get notificationsDisabled => 'அறிவிப்புகள் முடக்கப்பட்டுள்ளன';

  @override
  String get securityNotice =>
      'உங்கள் தரவு பாதுகாப்பாக குறியாக்கம் செய்யப்பட்டு சேமிக்கப்படுகிறது.';

  @override
  String get loading => 'ஏற்றுகிறது...';

  @override
  String get selectLanguage => 'மொழியைத் தேர்ந்தெடுங்கள்';

  @override
  String get onboardingGetStartedDesc =>
      'உங்கள் மொழியைத் தேர்ந்தெடுப்பதன் மூலம் தொடங்குங்கள்.';

  @override
  String get accountRecoveryTitle => '🔐 கணக்கு மீட்பு விவரங்கள்';

  @override
  String get recoveryInstructions =>
      'இந்தத் தகவலைப் பாதுகாப்பாகச் சேமிக்கவும். உங்கள் கணக்கை மீட்டெடுக்க இது உங்களுக்குத் தேவைப்படும்.';

  @override
  String get importantNotice => '⚠️ முக்கியமானது:';

  @override
  String get astrologerProfileTitle => 'ஜோதிடர் சுயவிவரம்';

  @override
  String get personalAstrologer => 'தனிப்பட்ட ஜோதிடர்';

  @override
  String get makePersonalAstrologer => 'தனிப்பட்ட ஜோதிடரை உருவாக்குங்கள்';

  @override
  String get favoriteDescription =>
      'உங்கள் கேள்விகள் இந்த ஜோதிடருக்கு முன்னுரிமை அளிக்கப்படும். கிடைக்கவில்லை என்றால், மற்றொரு தகுதிவாய்ந்த ஜோதிடர் உங்களுக்கு உதவுவார்.';

  @override
  String get educationQualifications => 'கல்வி & தகுதிகள்';

  @override
  String get aboutSection => 'பற்றி';

  @override
  String get shareProfile => 'சுயவிவரத்தைப் பகிரவும்';

  @override
  String get loadingAstrologer => 'ஜோதிடர் விவரங்களை ஏற்றுகிறது...';

  @override
  String get failedToLoadAstrologer => 'ஜோதிடர் விவரங்களை ஏற்ற முடியவில்லை.';

  @override
  String get authenticationRequired => 'அங்கீகாரம் தேவை. உள்நுழையவும்.';

  @override
  String securityCheckFailed(Object error) {
    return 'பாதுகாப்பு சோதனை தோல்வியடைந்தது: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name இப்போது உங்கள் தனிப்பட்ட ஜோதிடர்.';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name பிடித்தவையிலிருந்து அகற்றப்பட்டது.';
  }

  @override
  String get toggleFavoriteError => 'பிடித்த நிலையைப் புதுப்பிக்க முடியவில்லை.';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 கல்வி: $education\n📜 தகுதி: $qualification\n⏳ அனுபவம்: $experience';
  }

  @override
  String get notProvided => 'வழங்கப்படவில்லை';

  @override
  String reviews(Object count) {
    return '($count மதிப்புரைகள்)';
  }

  @override
  String get specialties => 'சிறப்புகள்';

  @override
  String get experience => 'அனுபவம்';

  @override
  String get qualification => 'தகுதி';

  @override
  String get education => 'கல்வி';

  @override
  String get recoveryTips =>
      '• இந்தத் தகவலின் ஸ்கிரீன்ஷாட்டை எடுக்கவும்\n• பாதுகாப்பான இடத்தில் சேமிக்கவும்\n• யாருடனும் பகிர வேண்டாம்\n• இது ஒரு முறை மட்டுமே காண்பிக்கப்படும்';

  @override
  String get themeSettingsTitle => 'தீம் அமைப்புகள்';

  @override
  String get lightThemeLabel => 'ஒளி';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'இருள்';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'அமைப்பு';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'எங்கள் அணி';

  @override
  String get teamDescription =>
      'எங்கள் தொழில்முறை வேத ஜோதிடர்கள் குழு, கிரக தாக்கங்கள் மற்றும் வாழ்க்கை முறைகளை விளக்குவதில் பல வருட அனுபவத்தைக் கொண்டுள்ளது. அர்ப்பணிப்புள்ள ஆதரவு மற்றும் மேம்பாட்டுக் குழுவின் ஆதரவுடன், கர்மா ஒவ்வொரு பயனருக்கும் தடையற்ற, நம்பகமான மற்றும் உலகளாவிய அனுபவத்தை வழங்குகிறது.';
}
