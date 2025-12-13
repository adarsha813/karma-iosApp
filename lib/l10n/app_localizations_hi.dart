// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get notificationSettings => 'अधिसूचना सेटिंग्स';

  @override
  String get privacySettings => 'गोपनीय सेटिंग';

  @override
  String get accountSettings => 'अकाउंट सेटिंग';

  @override
  String get languageSettings => 'भाषा सेटिंग्स';

  @override
  String get languageChanged => 'भाषा बदल गई';

  @override
  String get existingUserButton => 'मैं एक मौजूदा उपयोगकर्ता हूँ';

  @override
  String get chooseCountryTitle => 'देश चुनें';

  @override
  String get yesText => 'हाँ';

  @override
  String get noText => 'नहीं';

  @override
  String get appBarTitle => 'प्रोफ़ाइल सेटिंग्स';

  @override
  String get userIdLabel => 'उपयोगकर्ता पहचान *';

  @override
  String get nameLabel => 'नाम';

  @override
  String get birthCountryLabel => 'जन्म का देश';

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
  String get birthDatePlaceholder => 'जन्म तिथि चुनें';

  @override
  String get birthTimeLabel => 'जन्म समय';

  @override
  String get birthTimePlaceholder => 'जन्म समय चुनें';

  @override
  String get saveProfileButton => 'प्रोफ़ाइल बचा';

  @override
  String get noCitiesFound => 'कोई शहर नहीं मिला';

  @override
  String cityPlaceholder(Object country) {
    return '$country में शहर दर्ज करें';
  }

  @override
  String get countryFirstPlaceholder => 'पहले देश चुनें';

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
    return 'लिंग: $gender';
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
    return 'समय क्षेत्र: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'डीएसटी: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'स्थिति: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date को अपडेट किया गया';
  }

  @override
  String get userIdRequired => 'उपयोगकर्ता आईडी आवश्यक है';

  @override
  String get profileSaved => 'प्रोफ़ाइल सफलतापूर्वक सहेजी गई';

  @override
  String get saveFailed => 'प्रोफ़ाइल सहेजने में विफल';

  @override
  String get errorPrefix => 'गलती:';

  @override
  String get onboardingChooseLanguage => 'अपनी भाषा चुनें';

  @override
  String get onboardingChooseLanguageDesc =>
      'जारी रखने के लिए अपनी पसंदीदा भाषा चुनें.';

  @override
  String get onboardingWhatIsAstrology => 'ज्योतिष क्या है?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ज्योतिष शास्त्र आकाशीय गतियों और मानव जीवन पर उनके प्रभाव का प्राचीन अध्ययन है, जो व्यक्तित्व, संबंधों और जीवन की घटनाओं के बारे में अंतर्दृष्टि प्रदान करता है।';

  @override
  String get onboardingWhyUseApp => 'इस ऐप का उपयोग क्यों करें?';

  @override
  String get onboardingWhyUseAppDesc =>
      'अपनी जन्म कुंडली के अनुसार सटीक, मानव-निर्मित राशिफल और मार्गदर्शन प्राप्त करें। अनुभवी ज्योतिषियों से दैनिक भविष्यवाणियों और व्यक्तिगत सलाह के साथ सूचित निर्णय लें।';

  @override
  String get onboardingHowToUse => 'इस ऐप का उपयोग कैसे करें?';

  @override
  String get onboardingHowToUseDesc =>
      'तुरंत शुरुआत करने के लिए बस अपनी जन्मतिथि, सटीक समय, जन्म स्थान और अन्य प्रासंगिक जानकारी दर्ज करें। दैनिक राशिफल देखें, विशेषज्ञ ज्योतिषियों से प्रश्न पूछें, और सटीक, वैयक्तिकृत भविष्यवाणियों के लिए अपनी प्रोफ़ाइल प्रबंधित करें—लॉगिन की आवश्यकता नहीं।';

  @override
  String get onboardingGetStarted => 'शुरू हो जाओ';

  @override
  String get onboardingNewUser => 'नए उपयोगकर्ता';

  @override
  String get onboardingExistingUser => 'मौजूदा उपयोगकर्ता';

  @override
  String get onboardingBack => 'पीछे';

  @override
  String get onboardingNext => 'अगला';

  @override
  String get userIdNotFound =>
      'उपयोगकर्ता आईडी नहीं मिली। कृपया लॉगिन करें या अपनी प्रोफ़ाइल सेट करें।';

  @override
  String get clearNotificationsTitle => 'सूचनाएं साफ़ करें';

  @override
  String get clearNotificationsMessage =>
      'क्या आप वाकई सभी सूचनाएं साफ़ करना चाहते हैं?';

  @override
  String get clearNotificationsSuccess =>
      'सभी अधिसूचनाएं सफलतापूर्वक साफ़ कर दी गईं.';

  @override
  String get clearHoroscopeTitle => 'स्पष्ट राशिफल';

  @override
  String get clearHoroscopeMessage =>
      'क्या आप वाकई अपनी कुंडली का डेटा साफ़ करना चाहते हैं?';

  @override
  String get clearHoroscopeSuccess => 'कुंडली सफलतापूर्वक साफ़ हो गई।';

  @override
  String get clearChatTitle => 'चैट इतिहास साफ़ करें';

  @override
  String get clearChatMessage =>
      'क्या आप वाकई अपना पूरा चैट इतिहास हटाना चाहते हैं?';

  @override
  String get clearChatLocal => 'चैट स्थानीय रूप से साफ़ कर दी गई.';

  @override
  String get deleteAccountTitle => 'खाता हटा दो';

  @override
  String get deleteAccountMessage =>
      'क्या आप वाकई अपना अकाउंट डिलीट करना चाहते हैं? इससे आपकी सारी चैट हिस्ट्री और नोटिफ़िकेशन भी डिलीट हो जाएँगे।';

  @override
  String get deleteAccountSuccess => 'आपका खाता और सारा डेटा हटा दिया गया है.';

  @override
  String get deleteAccountError => 'खाता हटाने में त्रुटि';

  @override
  String get logoutTitle => 'लॉग आउट';

  @override
  String get logoutMessage => 'क्या आप लॉग आउट करना चाहते हैं?';

  @override
  String get termsPrivacyTitle => 'नियम एवं गोपनीयता';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get termsConditionsTitle => 'नियम एवं शर्तें';

  @override
  String get dataControlTitle => 'डेटा नियंत्रण';

  @override
  String get cancelButton => 'रद्द करना';

  @override
  String get confirmButton => 'पुष्टि करना';

  @override
  String get clearQuestionsSuccess => 'सभी प्रश्न सफलतापूर्वक हटा दिए गए.';

  @override
  String get yoginiLabel => 'योगिनी';

  @override
  String get lordLabel => 'भगवान';

  @override
  String get startLabel => 'शुरू';

  @override
  String get recoverAccount => 'खाते की वसूली';

  @override
  String get endLabel => 'अंत';

  @override
  String get startDateLabel => 'आरंभ करने की तिथि';

  @override
  String get endDateLabel => 'अंतिम तिथि';

  @override
  String get notAvailable => 'उपलब्ध नहीं है';

  @override
  String get noData => 'कोई डेटा नहीं';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get retryButton => 'पुन: प्रयास करें';

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
  String get vimshottariDashaTitle => 'विंशोत्तरी दशा';

  @override
  String get yoginiDashaTitle => 'योगिनी दशा';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get clearHoroscope => 'स्पष्ट राशिफल';

  @override
  String get clearNotifications => 'सूचनाएं साफ़ करें';

  @override
  String get clearChatHistory => 'चैट इतिहास साफ़ करें';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get deleteAccount => 'खाता हटा दो';

  @override
  String get allFieldsRequired => 'सभी फ़ील्ड आवश्यक हैं।';

  @override
  String get accountRecoveredSuccess =>
      'खाता सफलतापूर्वक पुनर्प्राप्त किया गया.';

  @override
  String get recoveryFailed => 'पुनर्प्राप्ति विफल. अपनी जानकारी जांचें.';

  @override
  String get recoverySecretLabel => 'पुनर्प्राप्ति रहस्य:';

  @override
  String get aboutUsTitle => 'हमारे बारे में';

  @override
  String get aboutOurCompany => 'हमारी कंपनी के बारे में';

  @override
  String get aboutCompanyDescription =>
      'कर्मा में, हम वैदिक ज्योतिष के शाश्वत ज्ञान के माध्यम से आपके जीवन के वास्तविक पथ को जानने में आपकी मदद करते हैं। हर जानकारी वास्तविक, अनुभवी ज्योतिषियों द्वारा दी जाती है, जो आपकी विशिष्ट जन्म कुंडली के आधार पर सावधानीपूर्वक तैयार की जाती है। दैनिक राशिफल से लेकर व्यक्तिगत मार्गदर्शन तक, कर्मा प्राचीन ज्ञान को 100 से ज़्यादा भाषाओं में उपलब्ध कराता है।';

  @override
  String get ourMission => 'हमारा विशेष कार्य';

  @override
  String get missionDescription =>
      'हमारा मिशन सरल है: प्रामाणिक, मानव-निर्देशित ज्योतिषीय मार्गदर्शन प्रदान करना जो आपको आत्मविश्वास से भरे, सूचित निर्णय लेने में सक्षम बनाता है। प्रत्येक भविष्यवाणी और परामर्श वर्षों की पेशेवर विशेषज्ञता को दर्शाता है, न कि स्वचालित एल्गोरिदम को।';

  @override
  String get ourVision => 'हमारा नज़रिया';

  @override
  String get visionDescription =>
      'हम वैदिक ज्योतिष के लिए दुनिया का सबसे भरोसेमंद मंच बनने का प्रयास करते हैं, जिससे लोगों को हर जगह खुद को, अपनी पसंद और अपनी जीवन यात्रा को स्पष्टता और आत्मविश्वास के साथ समझने में मदद मिलती है।';

  @override
  String get ourValues => 'हमारे मूल्य';

  @override
  String get valuesDescription =>
      'कर्मा में, हम प्रामाणिकता, सटीकता और विश्वास को महत्व देते हैं। हम आपको ऐसा मार्गदर्शन प्रदान करने के लिए प्रतिबद्ध हैं जो न केवल सटीक हो, बल्कि सार्थक भी हो, जिससे आपको जीवन में अंतर्दृष्टि और आत्मविश्वास के साथ आगे बढ़ने में मदद मिले।';

  @override
  String get contactUs => 'हमसे संपर्क करें';

  @override
  String get contactEmail => 'ईमेल: support@yourcompany.com';

  @override
  String get contactWebsite => 'वेबसाइट: www.yourcompany.com';

  @override
  String get customerSupport => 'ग्राहक सहेयता';

  @override
  String get supportHeroTitle => 'हम आपकी मदद के लिए यहाँ हैं';

  @override
  String get supportHeroDescription =>
      'नीचे दिया गया फॉर्म भरें और हमारी सहायता टीम यथाशीघ्र आपसे संपर्क करेगी।';

  @override
  String get yourName => 'आपका नाम';

  @override
  String get yourEmail => 'आपका ईमेल';

  @override
  String get message => 'संदेश';

  @override
  String get enterEmail => 'अपना ईमेल दर्ज करें';

  @override
  String get enterValidEmail => 'एक मान्य ईमेल पता दर्ज करें';

  @override
  String enterField(Object fieldName) {
    return '$fieldName दर्ज करें';
  }

  @override
  String get send => 'भेजना';

  @override
  String get sending => 'भेजा जा रहा है...';

  @override
  String get emailSentSuccess => '✅ ईमेल सफलतापूर्वक भेजा गया!';

  @override
  String get emailSendFailed => '❌ ईमेल भेजने में विफल';

  @override
  String get astroDictionaryTitle => 'खगोल शब्दकोश';

  @override
  String get searchTermsHint => 'खोज शब्द...';

  @override
  String get noTermsFound => 'कोई शब्द नहीं मिला';

  @override
  String get buyQuestionsTitle => 'खरीदें प्रश्न';

  @override
  String get userNotAuthenticated => 'उपयोगकर्ता प्रमाणित नहीं है';

  @override
  String get loadStoreDataFailed => 'स्टोर डेटा लोड करने में विफल';

  @override
  String get missingAuthToken => 'प्राधिकरण टोकन गुम है';

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
  String get availableOffers => 'उपलब्ध ऑफर';

  @override
  String questionsCount(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get buyButton => 'खरीदना';

  @override
  String get dailyHoroscopeTitle => '🌟 दैनिक राशिफल';

  @override
  String get userIdMissing => 'उपयोगकर्ता आईडी गायब है';

  @override
  String get fetchHoroscopesFailed => 'कुंडली प्राप्त करने में विफल';

  @override
  String get noHoroscopeFound => 'कोई कुंडली नहीं मिली.';

  @override
  String get signLabel => 'संकेत';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'कल';

  @override
  String get thisWeekLabel => 'इस सप्ताह';

  @override
  String get lastMonthLabel => 'पिछला महीना';

  @override
  String get chatTitle => 'बात करना';

  @override
  String get typeYourQuestionHint => 'अपना प्रश्न लिखें...';

  @override
  String get paymentRequired => 'भुगतान आवश्यक';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'आपने अपने निःशुल्क प्रश्नों का उपयोग कर लिया है। जारी रखने के लिए $amount का भुगतान करें।';
  }

  @override
  String get payNowButton => 'अब भुगतान करें';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count निःशुल्क प्रश्न शेष हैं';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count भुगतान किए गए प्रश्न शेष हैं';
  }

  @override
  String get thankYouFeedback => 'आपकी प्रतिक्रिया के लिए आपका धन्यवाद!';

  @override
  String get ratingSubmitted => 'रेटिंग सबमिट की गई!';

  @override
  String get setUserIdFirst => 'कृपया पहले अपना उपयोगकर्ता आईडी सेट करें';

  @override
  String get failedToFetchPrevious =>
      'पिछले प्रश्न और उत्तर प्राप्त करने में विफल';

  @override
  String errorOccurred(Object error) {
    return 'त्रुटि: $error';
  }

  @override
  String get drawerAstroProfile => 'एस्ट्रो प्रोफाइल';

  @override
  String get drawerDailyHoroscope => 'दैनिक राशिफल';

  @override
  String get drawerBuyQuestions => 'खरीदें प्रश्न';

  @override
  String get drawerAstroDictionary => 'खगोल शब्दकोश';

  @override
  String get drawerSettings => 'सेटिंग्स';

  @override
  String get drawerCustomerSupport => 'ग्राहक सहेयता';

  @override
  String get drawerAbout => 'के बारे में';

  @override
  String get drawerProfileSettings => 'प्रोफ़ाइल सेटिंग्स';

  @override
  String get demoNotificationTitle => '🔔 डेमो अधिसूचना';

  @override
  String get demoNotificationBody => 'यह आपके ऐप से एक परीक्षण अधिसूचना है!';

  @override
  String get notificationsTitle => 'सूचनाएं';

  @override
  String get noNotifications => 'कोई सूचना नहीं';

  @override
  String get allTab => 'सभी';

  @override
  String get markAllAsRead => 'सभी को पढ़ा हुआ मार्क करें';

  @override
  String get notificationMarkedRead => 'अधिसूचना को पढ़ा हुआ चिह्नित किया गया';

  @override
  String get failedToLoadNotifications => 'सूचनाएँ लोड करने में विफल';

  @override
  String get failedToMarkRead => 'पढ़ा हुआ चिह्नित करने में विफल';

  @override
  String get failedToMarkAllRead => 'सभी को पढ़ा हुआ चिह्नित करने में विफल';

  @override
  String get socketConnected => 'सॉकेट कनेक्टेड';

  @override
  String get socketDisconnected => 'सॉकेट डिस्कनेक्ट हो गया';

  @override
  String get newNotificationReceived => 'नई अधिसूचना प्राप्त हुई';

  @override
  String get generalCategory => 'सामान्य';

  @override
  String get horoscopeCategory => 'राशिफल';

  @override
  String get chatCategory => 'बात करना';

  @override
  String get systemCategory => 'प्रणाली';

  @override
  String get updateCategory => 'अपडेट';

  @override
  String get howToAskTitle => 'कैसे पूछें';

  @override
  String get noQuestionsAvailable => 'कोई प्रश्न उपलब्ध नहीं है';

  @override
  String get failedToLoadQuestions => 'प्रश्न लोड करने में विफल';

  @override
  String get pullToRefresh => 'रीफ़्रेश करने के लिए खींचें';

  @override
  String get careerCategory => 'आजीविका';

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
  String get profileLoaded => 'प्रोफ़ाइल सफलतापूर्वक लोड हो गई';

  @override
  String get imageUploaded => 'छवि सफलतापूर्वक अपलोड की गई';

  @override
  String get savedInformationConfirmation => 'मैंने यह जानकारी सहेज ली है';

  @override
  String get noHistoryAvailable => 'कोई इतिहास उपलब्ध नहीं है';

  @override
  String get missingUserIdError => 'उपयोगकर्ता आईडी आवश्यक है';

  @override
  String get networkError => 'नेटवर्क त्रुटि. कृपया पुनः प्रयास करें.';

  @override
  String get timeoutError => 'अनुरोध का समय समाप्त हो गया';

  @override
  String get genericError => 'कुछ गलत हो गया';

  @override
  String get reactionUpdateError => 'प्रतिक्रिया अपडेट करने में विफल';

  @override
  String get noSearchResults => 'कोई खोज परिणाम नहीं मिला';

  @override
  String get clearSearch => 'खोज साफ़ करें';

  @override
  String get resultsFound => 'परिणाम मिले';

  @override
  String get recoverySecretHint =>
      'कॉपी-पेस्ट काम नहीं कर सकता, मैन्युअल रूप से टाइप करें';

  @override
  String get recoverAccountDescription =>
      'अपना खाता पुनः प्राप्त करने के लिए इन चरणों का पालन करें';

  @override
  String get processingLabel => 'प्रसंस्करण...';

  @override
  String get clearChatSuccess => 'चैट सफलतापूर्वक साफ़ हो गई';

  @override
  String get notificationsEnabled => 'सूचनाएं सक्षम';

  @override
  String get notificationsDisabled => 'सूचनाएं अक्षम';

  @override
  String get securityNotice =>
      'आपका डेटा सुरक्षित रूप से एन्क्रिप्ट और संग्रहीत किया जाता है';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get selectLanguage => 'भाषा चुने';

  @override
  String get onboardingGetStartedDesc => 'अपनी भाषा चुनकर शुरुआत करें';

  @override
  String get accountRecoveryTitle => '🔐 खाता पुनर्प्राप्ति विवरण';

  @override
  String get recoveryInstructions =>
      'कृपया इस जानकारी को सुरक्षित रूप से सहेजें। आपको अपना खाता पुनर्प्राप्त करने के लिए इसकी आवश्यकता होगी।';

  @override
  String get importantNotice => '⚠️ महत्वपूर्ण:';

  @override
  String get astrologerProfileTitle => 'ज्योतिषी प्रोफ़ाइल';

  @override
  String get personalAstrologer => 'व्यक्तिगत ज्योतिषी';

  @override
  String get makePersonalAstrologer => 'व्यक्तिगत ज्योतिषी बनाएं';

  @override
  String get favoriteDescription =>
      'आपके प्रश्नों को प्राथमिकता के आधार पर इस ज्योतिषी के पास भेजा जाएगा। यदि उपलब्ध न हो, तो कोई अन्य योग्य ज्योतिषी आपकी सहायता करेगा।';

  @override
  String get educationQualifications => 'शैक्षणिक योग्यता';

  @override
  String get aboutSection => 'के बारे में';

  @override
  String get shareProfile => 'प्रोफ़ाइल साझा करें';

  @override
  String get loadingAstrologer => 'ज्योतिषी विवरण लोड हो रहा है...';

  @override
  String get failedToLoadAstrologer => 'ज्योतिषी का विवरण लोड करने में विफल';

  @override
  String get authenticationRequired =>
      'प्रमाणीकरण आवश्यक है। कृपया लॉग इन करें।';

  @override
  String securityCheckFailed(Object error) {
    return 'सुरक्षा जाँच विफल: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name अब आपके निजी ज्योतिषी हैं';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name को पसंदीदा से हटा दिया गया';
  }

  @override
  String get toggleFavoriteError => 'पसंदीदा स्थिति अपडेट करने में विफल';

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
  String get notProvided => 'उपलब्ध नहीं कराया';

  @override
  String reviews(Object count) {
    return '($count समीक्षाएं)';
  }

  @override
  String get specialties => 'विशिष्टताओं';

  @override
  String get experience => 'अनुभव';

  @override
  String get qualification => 'योग्यता';

  @override
  String get education => 'शिक्षा';

  @override
  String get recoveryTips =>
      '• इस जानकारी का स्क्रीनशॉट लें\n• इसे सुरक्षित स्थान पर रखें\n• किसी के साथ साझा न करें\n• यह केवल एक बार दिखाई देगा';

  @override
  String get themeSettingsTitle => 'थीम सेटिंग्स';

  @override
  String get lightThemeLabel => 'रोशनी';

  @override
  String get lightThemeDescription => 'हमेशा लाइट थीम का उपयोग करें';

  @override
  String get darkThemeLabel => 'अँधेरा';

  @override
  String get darkThemeDescription => 'हमेशा डार्क थीम का उपयोग करें';

  @override
  String get systemThemeLabel => 'प्रणाली';

  @override
  String get systemThemeDarkDescription =>
      'डार्क थीम के लिए सिस्टम सेटिंग का पालन करें';

  @override
  String get systemThemeLightDescription =>
      'लाइट थीम के लिए सिस्टम सेटिंग का पालन करें';

  @override
  String get switchToLight => 'लाइट पर स्विच करें';

  @override
  String get switchToDark => 'डार्क मोड पर स्विच करें';

  @override
  String get ourTeam => 'हमारी टीम';

  @override
  String get teamDescription =>
      'हमारे पेशेवर वैदिक ज्योतिषियों की टीम ग्रहों के प्रभावों और जीवन के पैटर्न की व्याख्या करने में वर्षों का अनुभव रखती है। एक समर्पित सहायता और विकास टीम द्वारा समर्थित, कर्मा प्रत्येक उपयोगकर्ता के लिए एक सहज, विश्वसनीय और वैश्विक अनुभव प्रदान करता है।';
}
