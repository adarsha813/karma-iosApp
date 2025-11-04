// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get settingsTitle => 'सेटिङहरू';

  @override
  String get notificationSettings => 'सूचना सेटिङहरू';

  @override
  String get privacySettings => 'गोपनीयता सेटिङहरू';

  @override
  String get accountSettings => 'खाता सेटिङहरू';

  @override
  String get languageSettings => 'भाषा सेटिङहरू';

  @override
  String get languageChanged => 'भाषा परिवर्तन गरियो';

  @override
  String get existingUserButton => 'म एक अवस्थित प्रयोगकर्ता हुँ।';

  @override
  String get chooseCountryTitle => 'देश छान्नुहोस्';

  @override
  String get yesText => 'हो';

  @override
  String get noText => 'होइन';

  @override
  String get appBarTitle => 'प्रोफाइल सेटिङहरू';

  @override
  String get userIdLabel => 'प्रयोगकर्ता आईडी *';

  @override
  String get nameLabel => 'नाम';

  @override
  String get birthCountryLabel => 'जन्म देश';

  @override
  String get birthCityLabel => 'जन्म शहर';

  @override
  String get countrySelectionTitle => 'आफ्नो देश छान्नुहोस्';

  @override
  String get maleLabel => 'पुरुष';

  @override
  String get femaleLabel => 'महिला';

  @override
  String get birthDateLabel => 'जन्म मिति';

  @override
  String get birthDatePlaceholder => 'जन्म मिति चयन गर्नुहोस्';

  @override
  String get birthTimeLabel => 'जन्म समय';

  @override
  String get birthTimePlaceholder => 'जन्म समय चयन गर्नुहोस्';

  @override
  String get saveProfileButton => 'प्रोफाइल सेभ गर्नुहोस्';

  @override
  String get noCitiesFound => 'कुनै शहर भेटिएन';

  @override
  String cityPlaceholder(Object country) {
    return '$country मा शहर प्रविष्ट गर्नुहोस्';
  }

  @override
  String get countryFirstPlaceholder => 'पहिले देश छान्नुहोस्';

  @override
  String get versionHistoryTitle => 'संस्करण इतिहास';

  @override
  String get notSetText => 'सेट गरिएको छैन';

  @override
  String nameHistory(Object name) {
    return 'नाम: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'शहर: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'देश: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'लिङ्ग: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'जन्म मिति: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'जन्म समय: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'स्थान: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'समय क्षेत्र: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'अवस्था: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date मा अद्यावधिक गरिएको';
  }

  @override
  String get userIdRequired => 'प्रयोगकर्ता आईडी आवश्यक छ';

  @override
  String get profileSaved => 'प्रोफाइल सफलतापूर्वक सुरक्षित गरियो';

  @override
  String get saveFailed => 'प्रोफाइल सुरक्षित गर्न असफल भयो';

  @override
  String get errorPrefix => 'त्रुटि:';

  @override
  String get onboardingChooseLanguage => 'आफ्नो भाषा छान्नुहोस्';

  @override
  String get onboardingChooseLanguageDesc =>
      'जारी राख्न आफ्नो मनपर्ने भाषा चयन गर्नुहोस्।';

  @override
  String get onboardingWhatIsAstrology => 'ज्योतिष भनेको के हो?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ज्योतिषशास्त्र भनेको आकाशीय पिण्डहरूको अध्ययन हो...';

  @override
  String get onboardingWhyUseApp => 'यो एप किन प्रयोग गर्ने?';

  @override
  String get onboardingWhyUseAppDesc =>
      'सूचित निर्णय लिनको लागि व्यक्तिगत राशिफल, दैनिक भविष्यवाणी र मार्गदर्शन प्राप्त गर्नुहोस्।';

  @override
  String get onboardingHowToUse => 'यो एप कसरी प्रयोग गर्ने?';

  @override
  String get onboardingHowToUseDesc =>
      'सजिलैसँग नेभिगेट गर्नुहोस्, दैनिक राशिफलहरू जाँच गर्नुहोस्, र सही भविष्यवाणीहरूको लागि आफ्नो प्रोफाइल व्यवस्थापन गर्नुहोस्।';

  @override
  String get onboardingGetStarted => 'सुरु गर्नुहोस्';

  @override
  String get onboardingNewUser => 'नयाँ प्रयोगकर्ता';

  @override
  String get onboardingExistingUser => 'अवस्थित प्रयोगकर्ता';

  @override
  String get onboardingBack => 'पछाडि';

  @override
  String get onboardingNext => 'अर्को';

  @override
  String get userIdNotFound =>
      'प्रयोगकर्ता ID फेला परेन। कृपया लगइन गर्नुहोस् वा आफ्नो प्रोफाइल सेट गर्नुहोस्।';

  @override
  String get clearNotificationsTitle => 'सूचनाहरू हटाउनुहोस्';

  @override
  String get clearNotificationsMessage =>
      'के तपाईं सबै सूचनाहरू खाली गर्न निश्चित हुनुहुन्छ?';

  @override
  String get clearNotificationsSuccess => 'सबै सूचनाहरू सफलतापूर्वक खाली गरिए।';

  @override
  String get clearHoroscopeTitle => 'स्पष्ट राशिफल';

  @override
  String get clearHoroscopeMessage =>
      'के तपाईं आफ्नो राशिफल डेटा खाली गर्न चाहनुहुन्छ?';

  @override
  String get clearHoroscopeSuccess => 'राशिफल सफलतापूर्वक सफा गरियो।';

  @override
  String get clearChatTitle => 'च्याट इतिहास खाली गर्नुहोस्';

  @override
  String get clearChatMessage =>
      'के तपाईं आफ्नो सबै च्याट इतिहास मेटाउन निश्चित हुनुहुन्छ?';

  @override
  String get clearChatLocal => 'स्थानीय रूपमा च्याट खाली गरियो।';

  @override
  String get deleteAccountTitle => 'खाता मेटाउनुहोस्';

  @override
  String get deleteAccountMessage =>
      'के तपाईं आफ्नो खाता मेटाउन निश्चित हुनुहुन्छ? यसले तपाईंको सबै च्याट इतिहास र सूचनाहरू पनि खाली गर्नेछ।';

  @override
  String get deleteAccountSuccess => 'तपाईंको खाता र सबै डेटा हटाइएको छ।';

  @override
  String get deleteAccountError => 'खाता मेटाउँदा त्रुटि भयो';

  @override
  String get logoutTitle => 'लगआउट गर्नुहोस्';

  @override
  String get logoutMessage => 'के तपाईं लगआउट गर्न निश्चित हुनुहुन्छ?';

  @override
  String get termsPrivacyTitle => 'सर्तहरू र गोपनीयता';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get termsConditionsTitle => 'नियम तथा सर्तहरू';

  @override
  String get dataControlTitle => 'डेटा नियन्त्रण';

  @override
  String get cancelButton => 'रद्द गर्नुहोस्';

  @override
  String get confirmButton => 'पुष्टि गर्नुहोस्';

  @override
  String get clearQuestionsSuccess => 'सबै प्रश्नहरू सफलतापूर्वक मेटाइए।';

  @override
  String get yoginiLabel => 'योगिनी';

  @override
  String get lordLabel => 'प्रभु';

  @override
  String get startLabel => 'सुरु गर्नुहोस्';

  @override
  String get recoverAccount => 'खाता पुन: प्राप्ति गर्नुहोस्';

  @override
  String get endLabel => 'अन्त्य';

  @override
  String get startDateLabel => 'सुरु मिति';

  @override
  String get endDateLabel => 'अन्त्य मिति';

  @override
  String get notAvailable => 'उपलब्ध छैन';

  @override
  String get noData => 'कुनै डेटा छैन';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get retryButton => 'पुन: प्रयास गर्नुहोस्';

  @override
  String get kundaliGeneratorTitle => 'कुण्डली जेनरेटर';

  @override
  String get natalChartTitle => 'जन्मकुण्डली';

  @override
  String get lagnaLabel => 'लग्ना';

  @override
  String get rashiLabel => 'राशी';

  @override
  String get ascDegreeLabel => 'आरोहण डिग्री';

  @override
  String get vimshottariDashaTitle => 'विमशोत्तरी दशा';

  @override
  String get yoginiDashaTitle => 'योगिनी दशा';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get clearHoroscope => 'स्पष्ट राशिफल';

  @override
  String get clearNotifications => 'सूचनाहरू हटाउनुहोस्';

  @override
  String get clearChatHistory => 'च्याट इतिहास खाली गर्नुहोस्';

  @override
  String get logout => 'लगआउट गर्नुहोस्';

  @override
  String get deleteAccount => 'खाता मेटाउनुहोस्';

  @override
  String get allFieldsRequired => 'सबै क्षेत्रहरू आवश्यक छन्।';

  @override
  String get accountRecoveredSuccess => 'खाता सफलतापूर्वक पुन: प्राप्ति भयो।';

  @override
  String get recoveryFailed =>
      'पुनःप्राप्ति असफल भयो। आफ्नो जानकारी जाँच गर्नुहोस्।';

  @override
  String get recoverySecretLabel => 'पुनर्प्राप्तिको रहस्य:';

  @override
  String get aboutUsTitle => 'हाम्रो बारेमा';

  @override
  String get aboutOurCompany => 'हाम्रो कम्पनीको बारेमा';

  @override
  String get aboutCompanyDescription =>
      'हामी हाम्रा प्रयोगकर्ताहरूलाई उत्कृष्ट ज्योतिष अनुभव प्रदान गर्न प्रतिबद्ध छौं।';

  @override
  String get ourMission => 'हाम्रो मिशन';

  @override
  String get missionDescription =>
      'प्रयोगकर्ताहरूलाई आफ्नो जीवनमा सूचित निर्णयहरू लिन मद्दत गर्न सही र व्यक्तिगत ज्योतिष अन्तर्दृष्टि प्रदान गर्न।';

  @override
  String get ourVision => 'हाम्रो दृष्टिकोण';

  @override
  String get visionDescription =>
      'प्रविधि र प्राचीन ज्ञानको संयोजन गर्दै, सबैभन्दा विश्वसनीय ज्योतिष प्लेटफर्म बन्न।';

  @override
  String get ourValues => 'हाम्रा मूल्यमान्यताहरू';

  @override
  String get valuesDescription =>
      'निष्ठा, शुद्धता, प्रयोगकर्ता-केन्द्रित डिजाइन, र निरन्तर नवीनता।';

  @override
  String get contactUs => 'हामीलाई सम्पर्क गर्नुहोस';

  @override
  String get contactEmail => 'इमेल: support@yourcompany.com';

  @override
  String get contactWebsite => 'वेबसाइट: www.yourcompany.com';

  @override
  String get customerSupport => 'ग्राहक सहयोग केन्द्र';

  @override
  String get supportHeroTitle => 'हामी मद्दत गर्न यहाँ छौं';

  @override
  String get supportHeroDescription =>
      'तलको फारम भर्नुहोस् र हाम्रो समर्थन टोली सकेसम्म चाँडो तपाईंलाई सम्पर्क गर्नेछ।';

  @override
  String get yourName => 'तपाईंको नाम';

  @override
  String get yourEmail => 'तपाईंको इमेल';

  @override
  String get message => 'सन्देश';

  @override
  String get enterEmail => 'आफ्नो इमेल प्रविष्ट गर्नुहोस्';

  @override
  String get enterValidEmail => 'मान्य इमेल ठेगाना प्रविष्ट गर्नुहोस्';

  @override
  String enterField(Object fieldName) {
    return '$fieldName प्रविष्ट गर्नुहोस्';
  }

  @override
  String get send => 'पठाउनुहोस्';

  @override
  String get sending => 'पठाउँदै...';

  @override
  String get emailSentSuccess => '✅ इमेल सफलतापूर्वक पठाइयो!';

  @override
  String get emailSendFailed => '❌ इमेल पठाउन असफल भयो';

  @override
  String get astroDictionaryTitle => 'खगोल शब्दकोश';

  @override
  String get searchTermsHint => 'खोज शब्दहरू...';

  @override
  String get noTermsFound => 'कुनै पनि शब्द भेटिएन।';

  @override
  String get buyQuestionsTitle => 'प्रश्नहरू किन्नुहोस्';

  @override
  String get userNotAuthenticated => 'प्रयोगकर्ता प्रमाणित छैन';

  @override
  String get loadStoreDataFailed => 'स्टोर डेटा लोड गर्न असफल भयो';

  @override
  String get missingAuthToken => 'प्रमाणीकरण टोकन हराइरहेको छ';

  @override
  String get merchantDisplayName => 'एस्ट्रो च्याट एप';

  @override
  String get paymentSuccessful => '✅ भुक्तानी सफल भयो! प्रश्न पठाइयो।';

  @override
  String paymentFailed(Object error) {
    return '❌ भुक्तानी असफल भयो: $error';
  }

  @override
  String get yourBalance => 'तपाईंको ब्यालेन्स';

  @override
  String questionsBalance(Object count) {
    return '$count प्रश्नहरू';
  }

  @override
  String get availableOffers => 'उपलब्ध अफरहरू';

  @override
  String questionsCount(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get buyButton => 'किन्नुहोस्';

  @override
  String get dailyHoroscopeTitle => '🌟 दैनिक राशिफल';

  @override
  String get userIdMissing => 'प्रयोगकर्ता ID हराइरहेको छ।';

  @override
  String get fetchHoroscopesFailed => 'राशिफलहरू प्राप्त गर्न असफल भयो';

  @override
  String get noHoroscopeFound => 'कुनै राशिफल भेटिएन।';

  @override
  String get signLabel => 'साइन इन गर्नुहोस्';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'हिजो';

  @override
  String get thisWeekLabel => 'यो हप्ता';

  @override
  String get lastMonthLabel => 'गत महिना';

  @override
  String get chatTitle => 'कुराकानी';

  @override
  String get typeYourQuestionHint => 'आफ्नो प्रश्न टाइप गर्नुहोस्...';

  @override
  String get paymentRequired => 'भुक्तानी आवश्यक छ';

  @override
  String get paymentRequiredMessage =>
      'तपाईंले आफ्ना नि:शुल्क प्रश्नहरू प्रयोग गर्नुभएको छ। जारी राख्न ₹५० तिर्नुहोस्।';

  @override
  String get payNowButton => 'अहिले नै तिर्नुहोस्';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count बाँकी नि:शुल्क प्रश्नहरू';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count बाँकी रहेका सशुल्क प्रश्नहरू';
  }

  @override
  String get thankYouFeedback => 'तपाईंको प्रतिक्रियाको लागि धन्यवाद!';

  @override
  String get ratingSubmitted => 'मूल्याङ्कन पेश गरियो!';

  @override
  String get setUserIdFirst =>
      'कृपया पहिले आफ्नो प्रयोगकर्ता आईडी सेट गर्नुहोस्।';

  @override
  String get failedToFetchPrevious =>
      'अघिल्ला प्रश्न र उत्तरहरू प्राप्त गर्न असफल भयो';

  @override
  String errorOccurred(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get drawerAstroProfile => 'खगोल प्रोफाइल';

  @override
  String get drawerDailyHoroscope => 'दैनिक राशिफल';

  @override
  String get drawerBuyQuestions => 'प्रश्नहरू किन्नुहोस्';

  @override
  String get drawerAstroDictionary => 'खगोल शब्दकोश';

  @override
  String get drawerSettings => 'सेटिङहरू';

  @override
  String get drawerCustomerSupport => 'ग्राहक सहयोग केन्द्र';

  @override
  String get drawerAbout => 'बारेमा';

  @override
  String get drawerProfileSettings => 'प्रोफाइल सेटिङहरू';

  @override
  String get demoNotificationTitle => '🔔 डेमो सूचना';

  @override
  String get demoNotificationBody => 'यो तपाईंको एपबाट आएको परीक्षण सूचना हो!';

  @override
  String get notificationsTitle => 'सूचनाहरू';

  @override
  String get noNotifications => 'कुनै सूचना छैन';

  @override
  String get allTab => 'सबै';

  @override
  String get markAllAsRead => 'सबै पढिएको रूपमा चिन्ह लगाउनुहोस्';

  @override
  String get notificationMarkedRead => 'सूचना पढिएको भनी चिन्ह लगाइयो';

  @override
  String get failedToLoadNotifications => 'सूचनाहरू लोड गर्न असफल भयो';

  @override
  String get failedToMarkRead => 'पढिएको भनी चिन्ह लगाउन सकिएन';

  @override
  String get failedToMarkAllRead => 'सबै पढिएको भनी चिन्ह लगाउन सकिएन';

  @override
  String get socketConnected => 'सकेट जडान भयो';

  @override
  String get socketDisconnected => 'सकेट विच्छेद भयो';

  @override
  String get newNotificationReceived => 'नयाँ सूचना प्राप्त भयो';

  @override
  String get generalCategory => 'सामान्य जानकारी';

  @override
  String get horoscopeCategory => 'राशिफल';

  @override
  String get chatCategory => 'कुराकानी';

  @override
  String get systemCategory => 'प्रणाली';

  @override
  String get updateCategory => 'अपडेटहरू';

  @override
  String get howToAskTitle => 'कसरी सोध्ने';

  @override
  String get noQuestionsAvailable => 'कुनै प्रश्न उपलब्ध छैन';

  @override
  String get failedToLoadQuestions => 'प्रश्नहरू लोड गर्न सकिएन';

  @override
  String get pullToRefresh => 'रिफ्रेस गर्न तान्नुहोस्';

  @override
  String get careerCategory => 'करियर';

  @override
  String get loveCategory => 'प्रेम र सम्बन्ध';

  @override
  String get healthCategory => 'स्वास्थ्य';

  @override
  String get financeCategory => '२०२३ फेब्रुअरी ८';

  @override
  String get familyCategory => 'परिवार';

  @override
  String get educationCategory => 'शिक्षा';

  @override
  String get travelCategory => 'यात्रा';

  @override
  String get spiritualCategory => 'आध्यात्मिक';

  @override
  String get profileLoaded => 'प्रोफाइल सफलतापूर्वक लोड गरियो';

  @override
  String get imageUploaded => 'छवि सफलतापूर्वक अपलोड गरियो';

  @override
  String get savedInformationConfirmation =>
      'मैले यो जानकारी सुरक्षित गरेको छु।';

  @override
  String get noHistoryAvailable => 'कुनै इतिहास उपलब्ध छैन';

  @override
  String get missingUserIdError => 'प्रयोगकर्ता आईडी आवश्यक छ';

  @override
  String get networkError => 'नेटवर्क त्रुटि। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String get timeoutError => 'अनुरोधको समय सकियो';

  @override
  String get genericError => 'केही गडबड भयो।';

  @override
  String get reactionUpdateError => 'प्रतिक्रिया अद्यावधिक गर्न सकिएन';

  @override
  String get noSearchResults => 'कुनै खोज परिणाम फेला परेन।';

  @override
  String get clearSearch => 'खोज खाली गर्नुहोस्';

  @override
  String get resultsFound => 'परिणामहरू भेटिए';

  @override
  String get recoverySecretHint =>
      'कपी-पेस्टले काम नगर्न सक्छ, म्यानुअली टाइप गर्नुहोस्';

  @override
  String get recoverAccountDescription =>
      'आफ्नो खाता पुनःप्राप्त गर्न यी चरणहरू पालना गर्नुहोस्';

  @override
  String get processingLabel => 'प्रशोधन गर्दै...';

  @override
  String get clearChatSuccess => 'च्याट सफलतापूर्वक खाली गरियो';

  @override
  String get notificationsEnabled => 'सूचनाहरू सक्षम पारियो';

  @override
  String get notificationsDisabled => 'सूचनाहरू असक्षम पारिए';

  @override
  String get securityNotice =>
      'तपाईंको डाटा सुरक्षित रूपमा इन्क्रिप्टेड र भण्डारण गरिएको छ।';

  @override
  String get loading => 'लोड हुँदै...';

  @override
  String get selectLanguage => 'भाषा छनोट गर्नुस';

  @override
  String get onboardingGetStartedDesc => 'आफ्नो भाषा छनौट गरेर सुरु गर्नुहोस्';

  @override
  String get accountRecoveryTitle => '🔐 खाता रिकभरी विवरणहरू';

  @override
  String get recoveryInstructions =>
      'कृपया यो जानकारी सुरक्षित रूपमा बचत गर्नुहोस्। तपाईंको खाता पुन: प्राप्ति गर्न तपाईंलाई यसको आवश्यकता पर्नेछ।';

  @override
  String get importantNotice => '⚠️ महत्त्वपूर्ण:';

  @override
  String get astrologerProfileTitle => 'ज्योतिषी प्रोफाइल';

  @override
  String get personalAstrologer => 'व्यक्तिगत ज्योतिषी';

  @override
  String get makePersonalAstrologer => 'व्यक्तिगत ज्योतिषी बनाउनुहोस्';

  @override
  String get favoriteDescription =>
      'तपाईंका प्रश्नहरूलाई यस ज्योतिषीलाई प्राथमिकता दिइनेछ। यदि उपलब्ध छैन भने, अर्को योग्य ज्योतिषीले तपाईंलाई सहयोग गर्नेछन्।';

  @override
  String get educationQualifications => 'शिक्षा र योग्यता';

  @override
  String get aboutSection => 'बारेमा';

  @override
  String get shareProfile => 'प्रोफाइल सेयर गर्नुहोस्';

  @override
  String get loadingAstrologer => 'ज्योतिषी विवरणहरू लोड गर्दै...';

  @override
  String get failedToLoadAstrologer => 'ज्योतिषी विवरणहरू लोड गर्न सकिएन';

  @override
  String get authenticationRequired =>
      'प्रमाणीकरण आवश्यक छ। कृपया लग इन गर्नुहोस्।';

  @override
  String securityCheckFailed(Object error) {
    return 'सुरक्षा जाँच असफल भयो: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name अब तपाईंको व्यक्तिगत ज्योतिषी हुनुहुन्छ';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ मनपर्नेबाट $name हटाइयो';
  }

  @override
  String get toggleFavoriteError => 'मनपर्ने स्थिति अद्यावधिक गर्न असफल भयो';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 शिक्षा: $education\n📜 योग्यता: $qualification\n⏳ अनुभव: $experience';
  }

  @override
  String get notProvided => 'प्रदान गरिएको छैन';

  @override
  String reviews(Object count) {
    return '($count समीक्षाहरू)';
  }

  @override
  String get specialties => 'विशेषताहरू';

  @override
  String get experience => 'अनुभव';

  @override
  String get qualification => 'योग्यता';

  @override
  String get education => 'शिक्षा';

  @override
  String get recoveryTips =>
      '• यो जानकारीको स्क्रिनसट लिनुहोस्\n• यसलाई सुरक्षित ठाउँमा भण्डारण गर्नुहोस्\n• कसैसँग साझा नगर्नुहोस्\n• यो एक पटक मात्र देखाइनेछ';
}
