// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get notificationSettings => 'अधिसूचना सेटिंग';

  @override
  String get privacySettings => 'गोपनीयता सेटिंग';

  @override
  String get accountSettings => 'खाता सेटिंग';

  @override
  String get languageSettings => 'भाषा सेटिंग';

  @override
  String get languageChanged => 'भाषा बदली';

  @override
  String get existingUserButton => 'मैं एक मौजूदा उपयोगकर्ता हूँ';

  @override
  String get chooseCountryTitle => 'देश चुनें';

  @override
  String get yesText => 'हाँ';

  @override
  String get noText => 'नहीं';

  @override
  String get appBarTitle => 'प्रोफ़ाइल सेटिंग';

  @override
  String get userIdLabel => 'उपयोगकर्ता ID';

  @override
  String get nameLabel => 'नाम';

  @override
  String get birthCountryLabel => 'जन्म देश';

  @override
  String get birthCityLabel => 'जन्म शहर';

  @override
  String get countrySelectionTitle => 'अपना देश चुनें';

  @override
  String get maleLabel => 'पुरुष';

  @override
  String get femaleLabel => 'महिला';

  @override
  String get birthDateLabel => 'जन्म तिथि';

  @override
  String get birthDatePlaceholder => 'जन्म तिथि';

  @override
  String get birthTimeLabel => 'जन्म समय';

  @override
  String get birthTimePlaceholder => 'जन्म समय चुनें';

  @override
  String get saveProfileButton => 'प्रोफ़ाइल सहेजें';

  @override
  String get noCitiesFound => 'कोई शहर नहीं मिला';

  @override
  String cityPlaceholder(Object country) {
    return 'शहर में प्रवेश करें';
  }

  @override
  String get countryFirstPlaceholder => 'पहला देश चुनें';

  @override
  String get versionHistoryTitle => 'संस्करण इतिहास';

  @override
  String get notSetText => 'सेट नहीं';

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
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'जन्म तिथि: $date';
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
    return 'टाइमज़ोन: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'राज्य: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date से संस्करण';
  }

  @override
  String get userIdRequired => 'उपयोगकर्ता ID की आवश्यकता है';

  @override
  String get profileSaved => 'प्रोफ़ाइल सफलतापूर्वक बचाया';

  @override
  String get saveFailed => 'प्रोफ़ाइल को बचाने में विफल';

  @override
  String get errorPrefix => 'त्रुटि:';

  @override
  String get onboardingChooseLanguage => 'अपनी भाषा चुनें';

  @override
  String get onboardingChooseLanguageDesc =>
      'अपनी पसंदीदा भाषा को जारी रखने के लिए चुनें।.';

  @override
  String get onboardingWhatIsAstrology => 'ज्योतिष क्या है?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ज्योतिष, खगोलीय शरीर का अध्ययन है।.';

  @override
  String get onboardingWhyUseApp => 'इस एप्लिकेशन का उपयोग क्यों करें?';

  @override
  String get onboardingWhyUseAppDesc =>
      'व्यक्तिगत कुंडली, दैनिक भविष्यवाणियों और सूचित निर्णय लेने के लिए मार्गदर्शन प्राप्त करें।.';

  @override
  String get onboardingHowToUse => 'इस एप्लिकेशन का उपयोग कैसे करें?';

  @override
  String get onboardingHowToUseDesc =>
      'आसानी से नेविगेट करें, दैनिक कुंडली की जांच करें और सटीक भविष्यवाणियों के लिए अपनी प्रोफ़ाइल का प्रबंधन करें।.';

  @override
  String get onboardingGetStarted => 'शुरू करना';

  @override
  String get onboardingNewUser => 'नया उपयोगकर्ता';

  @override
  String get onboardingExistingUser => 'मौजूदा उपयोगकर्ता';

  @override
  String get onboardingBack => 'वापस';

  @override
  String get onboardingNext => 'अगला';

  @override
  String get userIdNotFound =>
      'उपयोगकर्ता ID नहीं मिली। कृपया लॉगिन करें या अपनी प्रोफ़ाइल सेट करें।';

  @override
  String get clearNotificationsTitle => 'सूचनाएँ साफ़ करें';

  @override
  String get clearNotificationsMessage =>
      'क्या आप सभी सूचनाएँ साफ़ करना चाहते हैं?';

  @override
  String get clearNotificationsSuccess =>
      'सभी सूचनाएँ सफलतापूर्वक साफ़ की गईं।';

  @override
  String get clearHoroscopeTitle => 'कुंडली साफ़ करें';

  @override
  String get clearHoroscopeMessage =>
      'क्या आप अपनी कुंडली डेटा को साफ़ करना चाहते हैं?';

  @override
  String get clearHoroscopeSuccess => 'कुंडली सफलतापूर्वक साफ़ की गई।';

  @override
  String get clearChatTitle => 'चैट इतिहास साफ़ करें';

  @override
  String get clearChatMessage =>
      'क्या आप अपना पूरा चैट इतिहास हटाना चाहते हैं?';

  @override
  String get clearChatLocal => 'चैट स्थानीय रूप से साफ़ की गई।';

  @override
  String get deleteAccountTitle => 'खाता हटाएँ';

  @override
  String get deleteAccountMessage =>
      'क्या आप वाकई अपना खाता हटाना चाहते हैं? इससे आपका चैट इतिहास और सूचनाएँ भी हट जाएँगी।';

  @override
  String get deleteAccountSuccess => 'आपका खाता और सभी डेटा हटा दिए गए हैं।';

  @override
  String get deleteAccountError => 'खाता हटाने में त्रुटि';

  @override
  String get logoutTitle => 'लॉगआउट';

  @override
  String get logoutMessage => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String get termsPrivacyTitle => 'नियम और गोपनीयता';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get termsConditionsTitle => 'नियम और शर्तें';

  @override
  String get dataControlTitle => 'डेटा नियंत्रण';

  @override
  String get cancelButton => 'रद्द करें';

  @override
  String get confirmButton => 'पुष्टि करें';

  @override
  String get clearQuestionsSuccess => 'सभी प्रश्न सफलतापूर्वक हटाए गए।';

  @override
  String get yoginiLabel => 'योगिनी';

  @override
  String get lordLabel => 'स्वामी';

  @override
  String get startLabel => 'प्रारंभ';

  @override
  String get recoverAccount => 'खाता पुनर्प्राप्त करें';

  @override
  String get endLabel => 'समाप्ति';

  @override
  String get startDateLabel => 'प्रारंभ तिथि';

  @override
  String get endDateLabel => 'समाप्ति तिथि';

  @override
  String get notAvailable => 'उपलब्ध नहीं';

  @override
  String get noData => 'कोई डेटा नहीं';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get retryButton => 'पुनः प्रयास करें';

  @override
  String get kundaliGeneratorTitle => 'कुंडली जनरेटर';

  @override
  String get natalChartTitle => 'जन्म कुंडली';

  @override
  String get lagnaLabel => 'लग्न';

  @override
  String get rashiLabel => 'राशि';

  @override
  String get ascDegreeLabel => 'लग्न डिग्री';

  @override
  String get vimshottariDashaTitle => 'विम्शोत्तरी दशा';

  @override
  String get yoginiDashaTitle => 'योगिनी दशा';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get clearHoroscope => 'कुंडली साफ करें';

  @override
  String get clearNotifications => 'सूचनाएं साफ करें';

  @override
  String get clearChatHistory => 'चैट इतिहास साफ करें';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get deleteAccount => 'खाता हटाएं';

  @override
  String get allFieldsRequired => 'सभी फ़ील्ड आवश्यक हैं।';

  @override
  String get accountRecoveredSuccess =>
      'खाता सफलतापूर्वक पुनर्प्राप्त कर लिया गया।';

  @override
  String get recoveryFailed => 'पुनर्प्राप्ति विफल। अपनी जानकारी जांचें।';

  @override
  String get recoverySecretLabel => 'पुनर्प्राप्ति गुप्त:';

  @override
  String get aboutUsTitle => 'हमारे बारे में';

  @override
  String get aboutOurCompany => 'हमारी कंपनी के बारे में';

  @override
  String get aboutCompanyDescription =>
      'हम अपने उपयोगकर्ताओं को सर्वश्रेष्ठ ज्योतिष अनुभव प्रदान करने के लिए प्रतिबद्ध हैं।';

  @override
  String get ourMission => 'हमारा मिशन';

  @override
  String get missionDescription =>
      'उपयोगकर्ताओं को उनके जीवन में सूचित निर्णय लेने में मदद करने के लिए सटीक और व्यक्तिगत ज्योतिष अंतर्दृष्टि प्रदान करना।';

  @override
  String get ourVision => 'हमारी दृष्टि';

  @override
  String get visionDescription =>
      'प्रौद्योगिकी और प्राचीन ज्ञान को मिलाकर सबसे भरोसेमंद ज्योतिष प्लेटफॉर्म बनना।';

  @override
  String get ourValues => 'हमारे मूल्य';

  @override
  String get valuesDescription =>
      'ईमानदारी, सटीकता, उपयोगकर्ता-केंद्रित डिजाइन, और निरंतर नवाचार।';

  @override
  String get contactUs => 'हमसे संपर्क करें';

  @override
  String get contactEmail => 'ईमेल: support@yourcompany.com';

  @override
  String get contactWebsite => 'वेबसाइट: www.yourcompany.com';

  @override
  String get customerSupport => 'ग्राहक सहायता';

  @override
  String get supportHeroTitle => 'हम आपकी मदद के लिए यहां हैं';

  @override
  String get supportHeroDescription =>
      'नीचे दिया गया फॉर्म भरें और हमारी सहायता टीम आपसे जल्द से जल्द संपर्क करेगी।';

  @override
  String get yourName => 'आपका नाम';

  @override
  String get yourEmail => 'आपका ईमेल';

  @override
  String get message => 'संदेश';

  @override
  String get enterEmail => 'अपना ईमेल दर्ज करें';

  @override
  String get enterValidEmail => 'एक वैध ईमेल पता दर्ज करें';

  @override
  String enterField(Object fieldName) {
    return '$fieldName दर्ज करें';
  }

  @override
  String get send => 'भेजें';

  @override
  String get sending => 'भेज रहे हैं...';

  @override
  String get emailSentSuccess => '✅ ईमेल सफलतापूर्वक भेजा गया!';

  @override
  String get emailSendFailed => '❌ ईमेल भेजने में विफल';

  @override
  String get astroDictionaryTitle => 'ज्योतिष शब्दकोश';

  @override
  String get searchTermsHint => 'शब्द खोजें...';

  @override
  String get noTermsFound => 'कोई शब्द नहीं मिला';

  @override
  String get buyQuestionsTitle => 'प्रश्न खरीदें';

  @override
  String get userNotAuthenticated => 'उपयोगकर्ता प्रमाणित नहीं है';

  @override
  String get loadStoreDataFailed => 'स्टोर डेटा लोड करने में विफल';

  @override
  String get missingAuthToken => 'ऑथ टोकन गुम है';

  @override
  String get merchantDisplayName => 'एस्ट्रो चैट ऐप';

  @override
  String get paymentSuccessful => '✅ भुगतान सफल! प्रश्न भेजा गया';

  @override
  String paymentFailed(Object error) {
    return '❌ भुगतान विफल: $error';
  }

  @override
  String get yourBalance => 'आपका बैलेंस';

  @override
  String questionsBalance(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get availableOffers => 'उपलब्ध ऑफ़र';

  @override
  String questionsCount(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get buyButton => 'खरीदें';

  @override
  String get dailyHoroscopeTitle => '🌟 दैनिक राशिफल';

  @override
  String get userIdMissing => 'उपयोगकर्ता ID गुम है';

  @override
  String get fetchHoroscopesFailed => 'राशिफल लाने में विफल';

  @override
  String get noHoroscopeFound => 'कोई राशिफल नहीं मिला।';

  @override
  String get signLabel => 'राशि';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'कल';

  @override
  String get thisWeekLabel => 'इस सप्ताह';

  @override
  String get lastMonthLabel => 'पिछला महीना';

  @override
  String get chatTitle => 'चैट';

  @override
  String get typeYourQuestionHint => 'अपना प्रश्न टाइप करें...';

  @override
  String get paymentRequired => 'भुगतान आवश्यक';

  @override
  String get paymentRequiredMessage =>
      'आपने अपने मुफ्त प्रश्नों का उपयोग कर लिया है। जारी रखने के लिए ₹50 का भुगतान करें।';

  @override
  String get payNowButton => 'अभी भुगतान करें';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count मुफ्त प्रश्न शेष';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count भुगतान किए गए प्रश्न शेष';
  }

  @override
  String get thankYouFeedback => 'आपके फीडबैक के लिए धन्यवाद!';

  @override
  String get ratingSubmitted => 'रेटिंग सबमिट की गई!';

  @override
  String get setUserIdFirst => 'कृपया पहले अपना उपयोगकर्ता ID सेट करें';

  @override
  String get failedToFetchPrevious => 'पिछले प्रश्न और उत्तर लाने में विफल';

  @override
  String errorOccurred(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get drawerAstroProfile => 'ज्योतिष प्रोफ़ाइल';

  @override
  String get drawerDailyHoroscope => 'दैनिक राशिफल';

  @override
  String get drawerBuyQuestions => 'प्रश्न खरीदें';

  @override
  String get drawerAstroDictionary => 'ज्योतिष शब्दकोश';

  @override
  String get drawerSettings => 'सेटिंग';

  @override
  String get drawerCustomerSupport => 'ग्राहक सहायता';

  @override
  String get drawerAbout => 'हमारे बारे में';

  @override
  String get drawerProfileSettings => 'प्रोफ़ाइल सेटिंग';

  @override
  String get demoNotificationTitle => '🔔 डेमो सूचना';

  @override
  String get demoNotificationBody => 'यह आपके ऐप से एक परीक्षण सूचना है!';

  @override
  String get notificationsTitle => 'नोटिफिकेशन';

  @override
  String get noNotifications => 'कोई नोटिफिकेशन नहीं';

  @override
  String get allTab => 'सभी';

  @override
  String get markAllAsRead => 'सभी को पढ़ा हुआ दिखाएं';

  @override
  String get notificationMarkedRead => 'सूचना को पढ़ा हुआ चिह्नित किया गया';

  @override
  String get failedToLoadNotifications => 'सूचनाएं लोड करने में विफल';

  @override
  String get failedToMarkRead => 'पढ़ा हुआ चिह्नित करने में विफल';

  @override
  String get failedToMarkAllRead => 'सभी को पढ़ा हुआ चिह्नित करने में विफल';

  @override
  String get socketConnected => 'सॉकेट कनेक्टेड';

  @override
  String get socketDisconnected => 'सॉकेट डिस्कनेक्टेड';

  @override
  String get newNotificationReceived => 'नई सूचना प्राप्त हुई';

  @override
  String get generalCategory => 'सामान्य';

  @override
  String get horoscopeCategory => 'राशिफल';

  @override
  String get chatCategory => 'चैट';

  @override
  String get systemCategory => 'सिस्टम';

  @override
  String get updateCategory => 'अपडेट';

  @override
  String get howToAskTitle => 'कैसे पूछें';

  @override
  String get noQuestionsAvailable => 'कोई प्रश्न उपलब्ध नहीं';

  @override
  String get failedToLoadQuestions => 'प्रश्न लोड करने में विफल';

  @override
  String get pullToRefresh => 'रिफ्रेश करने के लिए खींचें';

  @override
  String get careerCategory => 'करियर';

  @override
  String get loveCategory => 'प्यार और रिश्ते';

  @override
  String get healthCategory => 'स्वास्थ्य';

  @override
  String get financeCategory => 'वित्त';

  @override
  String get familyCategory => 'परिवार';

  @override
  String get educationCategory => 'शिक्षा';

  @override
  String get travelCategory => 'यात्रा';

  @override
  String get spiritualCategory => 'आध्यात्मिक';

  @override
  String get profileLoaded => 'प्रोफाइल सफलतापूर्वक लोड भयो';

  @override
  String get imageUploaded => 'तस्बिर सफलतापूर्वक अपलोड भयो';

  @override
  String get savedInformationConfirmation => 'मैंने यह जानकारी सहेज ली है';

  @override
  String get noHistoryAvailable => 'कोई इतिहास उपलब्ध नहीं है';

  @override
  String get missingUserIdError => 'उपयोगकर्ता आईडी आवश्यक है';

  @override
  String get networkError => 'नेटवर्क त्रुटि हुई';

  @override
  String get timeoutError => 'अनुरोध का समय समाप्त हो गया';

  @override
  String get genericError => 'कुछ गलत हो गया';

  @override
  String get reactionUpdateError => 'प्रतिक्रिया अपडेट करने में विफल';

  @override
  String get noSearchResults => 'कोई परिणाम नहीं मिला';

  @override
  String get clearSearch => 'खोज साफ़ करें';

  @override
  String get resultsFound => 'परिणाम मिले';

  @override
  String get recoverySecretHint => 'अपना गुप्त संकेत दर्ज करें';

  @override
  String get recoverAccountDescription =>
      'अपने खाते को पुनर्प्राप्त करने के लिए इन चरणों का पालन करें';

  @override
  String get processingLabel => 'प्रसंस्करण हो रहा है...';

  @override
  String get clearChatSuccess => 'चैट सफलतापूर्वक साफ़ किया गया';

  @override
  String get notificationsEnabled => 'सूचनाएं सक्षम हैं';

  @override
  String get notificationsDisabled => 'सूचनाएं अक्षम हैं';

  @override
  String get securityNotice =>
      'आपका डेटा सुरक्षित रूप से एन्क्रिप्ट और संग्रहीत किया गया है';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get accountRecoveryTitle => '🔐 खाता पुनर्प्राप्ति विवरण';

  @override
  String get recoveryInstructions =>
      'कृपया इस जानकारी को सुरक्षित रूप से सहेजें। आपको अपने खाते को पुनर्प्राप्त करने के लिए इसकी आवश्यकता होगी।';

  @override
  String get importantNotice => '⚠️ महत्वपूर्ण:';

  @override
  String get recoveryTips =>
      '• इस जानकारी का स्क्रीनशॉट लें\n• इसे सुरक्षित स्थान पर सहेजें\n• किसी के साथ साझा न करें\n• यह केवल एक बार दिखाया जाएगा';
}
