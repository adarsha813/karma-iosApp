// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get notificationSettings => 'सूचना सेटिंग्ज';

  @override
  String get privacySettings => 'गोपनीयता सेटिंग्ज';

  @override
  String get accountSettings => 'खाते सेटिंग्ज';

  @override
  String get languageSettings => 'भाषा सेटिंग्ज';

  @override
  String get languageChanged => 'भाषा बदलली';

  @override
  String get existingUserButton => 'मी एक विद्यमान वापरकर्ता आहे.';

  @override
  String get chooseCountryTitle => 'देश निवडा';

  @override
  String get yesText => 'होय';

  @override
  String get noText => 'नाही';

  @override
  String get appBarTitle => 'प्रोफाइल सेटिंग्ज';

  @override
  String get userIdLabel => 'वापरकर्ता आयडी *';

  @override
  String get nameLabel => 'नाव';

  @override
  String get birthCountryLabel => 'जन्म देश';

  @override
  String get birthCityLabel => 'जन्म शहर';

  @override
  String get countrySelectionTitle => 'तुमचा देश निवडा';

  @override
  String get maleLabel => 'पुरुष';

  @override
  String get femaleLabel => 'स्त्री';

  @override
  String get birthDateLabel => 'जन्मतारीख';

  @override
  String get birthDatePlaceholder => 'जन्मतारीख निवडा';

  @override
  String get birthTimeLabel => 'जन्मवेळ';

  @override
  String get birthTimePlaceholder => 'जन्मवेळ निवडा';

  @override
  String get saveProfileButton => 'प्रोफाइल सेव्ह करा';

  @override
  String get noCitiesFound => 'कोणतीही शहरे आढळली नाहीत.';

  @override
  String cityPlaceholder(Object country) {
    return '$country मध्ये शहर प्रविष्ट करा';
  }

  @override
  String get countryFirstPlaceholder => 'प्रथम देश निवडा';

  @override
  String get versionHistoryTitle => 'आवृत्ती इतिहास';

  @override
  String get notSetText => 'सेट नाही';

  @override
  String nameHistory(Object name) {
    return 'नाव: $name';
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
    return 'जन्मतारीख: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'जन्मवेळ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'स्थान: $longitude, $latitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'टाइमझोन: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'डीएसटी: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'स्थिती: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date रोजी अपडेट केले';
  }

  @override
  String get userIdRequired => 'वापरकर्ता आयडी आवश्यक आहे';

  @override
  String get profileSaved => 'प्रोफाइल यशस्वीरित्या सेव्ह केले';

  @override
  String get saveFailed => 'प्रोफाइल सेव्ह करण्यात अयशस्वी';

  @override
  String get errorPrefix => 'त्रुटी:';

  @override
  String get onboardingChooseLanguage => 'तुमची भाषा निवडा';

  @override
  String get onboardingChooseLanguageDesc =>
      'पुढे जाण्यासाठी तुमची पसंतीची भाषा निवडा.';

  @override
  String get onboardingWhatIsAstrology => 'ज्योतिष म्हणजे काय?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ज्योतिषशास्त्र हे खगोलीय हालचालींचा आणि मानवी जीवनावरील त्यांच्या प्रभावाचा प्राचीन अभ्यास आहे, जो व्यक्तिमत्व, नातेसंबंध आणि जीवनातील घटनांबद्दल अंतर्दृष्टी प्रदान करतो.';

  @override
  String get onboardingWhyUseApp => 'हे अ‍ॅप का वापरावे?';

  @override
  String get onboardingWhyUseAppDesc =>
      'तुमच्या जन्मकुंडलीनुसार अचूक, मानवनिर्मित कुंडली आणि मार्गदर्शन मिळवा. अनुभवी ज्योतिषींकडून दैनंदिन भाकिते आणि वैयक्तिकृत सल्ल्यासह माहितीपूर्ण निर्णय घ्या.';

  @override
  String get onboardingHowToUse => 'हे अॅप कसे वापरावे?';

  @override
  String get onboardingHowToUseDesc =>
      'सुरुवात करण्यासाठी फक्त तुमची जन्मतारीख, अचूक वेळ, जन्मस्थान आणि इतर संबंधित तपशील प्रविष्ट करा. दररोजच्या कुंडली एक्सप्लोर करा, तज्ञ ज्योतिषांना प्रश्न विचारा आणि अचूक, वैयक्तिकृत भाकितेसाठी तुमचे प्रोफाइल व्यवस्थापित करा—लॉगिन आवश्यक नाही.';

  @override
  String get onboardingGetStarted => 'सुरुवात करा';

  @override
  String get onboardingNewUser => 'नवीन वापरकर्ता';

  @override
  String get onboardingExistingUser => 'विद्यमान वापरकर्ता';

  @override
  String get onboardingBack => 'मागे';

  @override
  String get onboardingNext => 'पुढे';

  @override
  String get userIdNotFound =>
      'वापरकर्ता आयडी सापडला नाही. कृपया लॉगिन करा किंवा तुमचा प्रोफाइल सेट करा.';

  @override
  String get clearNotificationsTitle => 'सूचना साफ करा';

  @override
  String get clearNotificationsMessage =>
      'तुम्हाला खात्री आहे की तुम्हाला सर्व सूचना साफ करायच्या आहेत?';

  @override
  String get clearNotificationsSuccess => 'सर्व सूचना यशस्वीरित्या साफ केल्या.';

  @override
  String get clearHoroscopeTitle => 'स्पष्ट कुंडली';

  @override
  String get clearHoroscopeMessage =>
      'तुम्हाला तुमचा कुंडली डेटा नक्की साफ करायचा आहे का?';

  @override
  String get clearHoroscopeSuccess => 'कुंडली यशस्वीरित्या साफ झाली.';

  @override
  String get clearChatTitle => 'चॅट इतिहास साफ करा';

  @override
  String get clearChatMessage =>
      'तुम्हाला तुमचा सर्व चॅट इतिहास नक्की हटवायचा आहे का?';

  @override
  String get clearChatLocal => 'स्थानिक पातळीवर चॅट साफ केले.';

  @override
  String get deleteAccountTitle => 'खाते हटवा';

  @override
  String get deleteAccountMessage =>
      'तुम्हाला तुमचे खाते नक्की हटवायचे आहे का? हे तुमचा सर्व चॅट इतिहास आणि सूचना देखील साफ करेल.';

  @override
  String get deleteAccountSuccess =>
      'तुमचे खाते आणि सर्व डेटा काढून टाकण्यात आला आहे.';

  @override
  String get deleteAccountError => 'खाते हटवताना त्रुटी आली';

  @override
  String get logoutTitle => 'लॉगआउट करा';

  @override
  String get logoutMessage => 'तुम्हाला नक्की लॉगआउट करायचे आहे का?';

  @override
  String get termsPrivacyTitle => 'अटी आणि गोपनीयता';

  @override
  String get privacyPolicyTitle => 'गोपनीयता धोरण';

  @override
  String get termsConditionsTitle => 'अटी आणि शर्ती';

  @override
  String get dataControlTitle => 'डेटा नियंत्रण';

  @override
  String get cancelButton => 'रद्द करा';

  @override
  String get confirmButton => 'पुष्टी करा';

  @override
  String get clearQuestionsSuccess => 'सर्व प्रश्न यशस्वीरित्या हटवले.';

  @override
  String get yoginiLabel => 'योगिनी';

  @override
  String get lordLabel => 'प्रभु';

  @override
  String get startLabel => 'सुरुवात करा';

  @override
  String get recoverAccount => 'खाते पुनर्प्राप्त करा';

  @override
  String get endLabel => 'शेवट';

  @override
  String get startDateLabel => 'प्रारंभ तारीख';

  @override
  String get endDateLabel => 'समाप्ती तारीख';

  @override
  String get notAvailable => 'उपलब्ध नाही';

  @override
  String get noData => 'कोणताही डेटा नाही';

  @override
  String get unknownError => 'अज्ञात त्रुटी';

  @override
  String get retryButton => 'पुन्हा प्रयत्न करा';

  @override
  String get kundaliGeneratorTitle => 'कुंडली जनरेटर';

  @override
  String get natalChartTitle => 'जन्मकुंडली';

  @override
  String get lagnaLabel => 'लग्न';

  @override
  String get rashiLabel => 'राशी';

  @override
  String get ascDegreeLabel => 'चढत्या पदवी';

  @override
  String get vimshottariDashaTitle => 'विमशोत्तरी दशा';

  @override
  String get yoginiDashaTitle => 'योगिनी दशा';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get clearHoroscope => 'स्पष्ट कुंडली';

  @override
  String get clearNotifications => 'सूचना साफ करा';

  @override
  String get clearChatHistory => 'चॅट इतिहास साफ करा';

  @override
  String get logout => 'लॉगआउट करा';

  @override
  String get deleteAccount => 'खाते हटवा';

  @override
  String get allFieldsRequired => 'सर्व फील्ड आवश्यक आहेत.';

  @override
  String get accountRecoveredSuccess => 'खाते यशस्वीरित्या पुनर्प्राप्त झाले.';

  @override
  String get recoveryFailed => 'पुनर्प्राप्ती अयशस्वी. तुमची माहिती तपासा.';

  @override
  String get recoverySecretLabel => 'पुनर्प्राप्तीचे रहस्य:';

  @override
  String get aboutUsTitle => 'आमच्याबद्दल';

  @override
  String get aboutOurCompany => 'आमच्या कंपनीबद्दल';

  @override
  String get aboutCompanyDescription =>
      'कर्मामध्ये, आम्ही तुम्हाला वैदिक ज्योतिषशास्त्राच्या कालातीत ज्ञानाद्वारे तुमचा खरा जीवन मार्ग उलगडण्यास मदत करतो. प्रत्येक अंतर्दृष्टी खऱ्या, अनुभवी ज्योतिषींकडून येते, जी तुमच्या अद्वितीय जन्मकुंडलीवर आधारित काळजीपूर्वक तयार केली जाते. दैनंदिन कुंडलींपासून ते वैयक्तिकृत मार्गदर्शनापर्यंत, कर्म १०० हून अधिक भाषांमध्ये प्राचीन ज्ञान उपलब्ध करून देते.';

  @override
  String get ourMission => 'आमचे ध्येय';

  @override
  String get missionDescription =>
      'आमचे ध्येय सोपे आहे: प्रामाणिक, मानव-नेतृत्वाखालील ज्योतिषीय मार्गदर्शन प्रदान करणे जे तुम्हाला आत्मविश्वासाने, माहितीपूर्ण निर्णय घेण्यास सक्षम करते. प्रत्येक भाकित आणि सल्लामसलत अनेक वर्षांच्या व्यावसायिक कौशल्याचे प्रतिबिंबित करते, स्वयंचलित अल्गोरिदमचे नाही.';

  @override
  String get ourVision => 'आमचा दृष्टिकोन';

  @override
  String get visionDescription =>
      'आम्ही वैदिक ज्योतिषशास्त्रासाठी जगातील सर्वात विश्वासार्ह व्यासपीठ बनण्याचा प्रयत्न करतो, ज्यामुळे सर्वत्र लोकांना स्वतःला, त्यांच्या निवडींना आणि त्यांच्या जीवन प्रवासाला स्पष्टता आणि आत्मविश्वासाने समजून घेण्यास मदत होते.';

  @override
  String get ourValues => 'आमची मूल्ये';

  @override
  String get valuesDescription =>
      'कर्मामध्ये, आम्ही प्रामाणिकपणा, अचूकता आणि विश्वासाला महत्त्व देतो. आम्ही असे मार्गदर्शन देण्यास वचनबद्ध आहोत जे केवळ अचूकच नाही तर अर्थपूर्ण देखील आहे, जे तुम्हाला अंतर्दृष्टी आणि आत्मविश्वासाने जीवन जगण्यास मदत करेल.';

  @override
  String get contactUs => 'आमच्याशी संपर्क साधा';

  @override
  String get contactEmail => 'ईमेल: support@yourcompany.com';

  @override
  String get contactWebsite => 'वेबसाइट: www.yourcompany.com';

  @override
  String get customerSupport => 'ग्राहक समर्थन';

  @override
  String get supportHeroTitle => 'आम्ही मदतीसाठी येथे आहोत';

  @override
  String get supportHeroDescription =>
      'खालील फॉर्म भरा आणि आमची सपोर्ट टीम शक्य तितक्या लवकर तुमच्याशी संपर्क साधेल.';

  @override
  String get yourName => 'तुमचे नाव';

  @override
  String get yourEmail => 'तुमचा ईमेल';

  @override
  String get message => 'संदेश';

  @override
  String get enterEmail => 'तुमचा ईमेल एंटर करा';

  @override
  String get enterValidEmail => 'वैध ईमेल पत्ता प्रविष्ट करा';

  @override
  String enterField(Object fieldName) {
    return '$fieldName एंटर करा';
  }

  @override
  String get send => 'पाठवा';

  @override
  String get sending => 'पाठवत आहे...';

  @override
  String get emailSentSuccess => '✅ ईमेल यशस्वीरित्या पाठवला!';

  @override
  String get emailSendFailed => '❌ ईमेल पाठवण्यात अयशस्वी';

  @override
  String get astroDictionaryTitle => 'खगोल शब्दकोश';

  @override
  String get searchTermsHint => 'शोध संज्ञा...';

  @override
  String get noTermsFound => 'कोणतेही शब्द आढळले नाहीत.';

  @override
  String get buyQuestionsTitle => 'प्रश्न खरेदी करा';

  @override
  String get userNotAuthenticated => 'वापरकर्ता प्रमाणीकृत नाही';

  @override
  String get loadStoreDataFailed => 'स्टोअर डेटा लोड करण्यात अयशस्वी';

  @override
  String get missingAuthToken => 'ऑथेंटिकेशन टोकन गहाळ आहे';

  @override
  String get merchantDisplayName => 'अ‍ॅस्ट्रो चॅट अ‍ॅप';

  @override
  String get paymentSuccessful => '✅ पेमेंट यशस्वी झाले! प्रश्न पाठवला.';

  @override
  String paymentFailed(Object error) {
    return '❌ पेमेंट अयशस्वी: $error';
  }

  @override
  String get yourBalance => 'तुमची शिल्लक';

  @override
  String questionsBalance(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get availableOffers => 'उपलब्ध ऑफर्स';

  @override
  String questionsCount(Object count) {
    return '$count प्रश्न';
  }

  @override
  String get buyButton => 'खरेदी करा';

  @override
  String get dailyHoroscopeTitle => '🌟 दैनिक राशिफल';

  @override
  String get userIdMissing => 'वापरकर्ता आयडी गहाळ आहे.';

  @override
  String get fetchHoroscopesFailed => 'कुंडली मिळवता आल्या नाहीत';

  @override
  String get noHoroscopeFound => 'कुंडली सापडली नाही.';

  @override
  String get signLabel => 'चिन्ह';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'काल';

  @override
  String get thisWeekLabel => 'या आठवड्यात';

  @override
  String get lastMonthLabel => 'गेल्या महिन्यात';

  @override
  String get chatTitle => 'गप्पा';

  @override
  String get typeYourQuestionHint => 'तुमचा प्रश्न टाइप करा...';

  @override
  String get paymentRequired => 'पेमेंट आवश्यक आहे';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'तुम्ही तुमचे मोफत प्रश्न वापरले आहेत. पुढे सुरू ठेवण्यासाठी $amount द्या.';
  }

  @override
  String get payNowButton => 'आता पैसे द्या';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count बाकी मोफत प्रश्न';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count सशुल्क प्रश्न शिल्लक आहेत';
  }

  @override
  String get thankYouFeedback => 'तुमच्या अभिप्रायाबद्दल धन्यवाद!';

  @override
  String get ratingSubmitted => 'रेटिंग सबमिट केले!';

  @override
  String get setUserIdFirst => 'कृपया प्रथम तुमचा वापरकर्ता आयडी सेट करा.';

  @override
  String get failedToFetchPrevious =>
      'मागील प्रश्न आणि उत्तरे मिळवता आली नाहीत';

  @override
  String errorOccurred(Object error) {
    return 'त्रुटी: $error';
  }

  @override
  String get drawerAstroProfile => 'अ‍ॅस्ट्रो प्रोफाइल';

  @override
  String get drawerDailyHoroscope => 'दैनिक राशिफल';

  @override
  String get drawerBuyQuestions => 'प्रश्न खरेदी करा';

  @override
  String get drawerAstroDictionary => 'खगोल शब्दकोश';

  @override
  String get drawerSettings => 'सेटिंग्ज';

  @override
  String get drawerCustomerSupport => 'ग्राहक समर्थन';

  @override
  String get drawerAbout => 'आमच्याबद्दल';

  @override
  String get drawerProfileSettings => 'प्रोफाइल सेटिंग्ज';

  @override
  String get demoNotificationTitle => '🔔 डेमो सूचना';

  @override
  String get demoNotificationBody => 'तुमच्या अ‍ॅपकडून ही चाचणी सूचना आहे!';

  @override
  String get notificationsTitle => 'सूचना';

  @override
  String get noNotifications => 'सूचना नाहीत';

  @override
  String get allTab => 'सर्व';

  @override
  String get markAllAsRead => 'सर्व वाचलेले म्हणून चिन्हांकित करा';

  @override
  String get notificationMarkedRead => 'सूचना वाचलेली म्हणून चिन्हांकित केली';

  @override
  String get failedToLoadNotifications => 'सूचना लोड करण्यात अयशस्वी';

  @override
  String get failedToMarkRead => 'वाचलेले म्हणून चिन्हांकित करण्यात अयशस्वी';

  @override
  String get failedToMarkAllRead =>
      'सर्व वाचलेले म्हणून चिन्हांकित करता आले नाही';

  @override
  String get socketConnected => 'सॉकेट कनेक्ट केले';

  @override
  String get socketDisconnected => 'सॉकेट डिस्कनेक्ट झाला';

  @override
  String get newNotificationReceived => 'नवीन सूचना मिळाली';

  @override
  String get generalCategory => 'सामान्य';

  @override
  String get horoscopeCategory => 'कुंडली';

  @override
  String get chatCategory => 'गप्पा';

  @override
  String get systemCategory => 'प्रणाली';

  @override
  String get updateCategory => 'अपडेट्स';

  @override
  String get howToAskTitle => 'कसे विचारावे';

  @override
  String get noQuestionsAvailable => 'कोणतेही प्रश्न उपलब्ध नाहीत.';

  @override
  String get failedToLoadQuestions => 'प्रश्न लोड करता आले नाहीत';

  @override
  String get pullToRefresh => 'रिफ्रेश करण्यासाठी ओढा';

  @override
  String get careerCategory => 'करिअर';

  @override
  String get loveCategory => 'प्रेम आणि नातेसंबंध';

  @override
  String get healthCategory => 'आरोग्य';

  @override
  String get financeCategory => 'अर्थव्यवस्था';

  @override
  String get familyCategory => 'कुटुंब';

  @override
  String get educationCategory => 'शिक्षण';

  @override
  String get travelCategory => 'प्रवास';

  @override
  String get spiritualCategory => 'आध्यात्मिक';

  @override
  String get profileLoaded => 'प्रोफाइल यशस्वीरित्या लोड केले';

  @override
  String get imageUploaded => 'इमेज यशस्वीरित्या अपलोड केली';

  @override
  String get savedInformationConfirmation => 'मी ही माहिती जतन केली आहे.';

  @override
  String get noHistoryAvailable => 'इतिहास उपलब्ध नाही';

  @override
  String get missingUserIdError => 'वापरकर्ता आयडी आवश्यक आहे';

  @override
  String get networkError => 'नेटवर्क त्रुटी. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get timeoutError => 'विनंती कालबाह्य झाली';

  @override
  String get genericError => 'काहीतरी चूक झाली.';

  @override
  String get reactionUpdateError => 'प्रतिक्रिया अपडेट करता आली नाही';

  @override
  String get noSearchResults => 'कोणतेही शोध परिणाम आढळले नाहीत.';

  @override
  String get clearSearch => 'शोध साफ करा';

  @override
  String get resultsFound => 'निकाल सापडले';

  @override
  String get recoverySecretHint =>
      'कॉपी-पेस्ट काम करणार नाही, मॅन्युअली टाइप करा.';

  @override
  String get recoverAccountDescription =>
      'तुमचे खाते रिकव्हर करण्यासाठी या पायऱ्या फॉलो करा';

  @override
  String get processingLabel => 'प्रक्रिया करत आहे...';

  @override
  String get clearChatSuccess => 'चॅट यशस्वीरित्या साफ केले';

  @override
  String get notificationsEnabled => 'सूचना सक्षम केल्या';

  @override
  String get notificationsDisabled => 'सूचना बंद केल्या';

  @override
  String get securityNotice =>
      'तुमचा डेटा सुरक्षितपणे एन्क्रिप्ट केलेला आणि संग्रहित आहे';

  @override
  String get loading => 'लोड होत आहे...';

  @override
  String get selectLanguage => 'भाषा निवडा';

  @override
  String get onboardingGetStartedDesc => 'तुमची भाषा निवडून सुरुवात करा';

  @override
  String get accountRecoveryTitle => '🔐 खाते पुनर्प्राप्ती तपशील';

  @override
  String get recoveryInstructions =>
      'कृपया ही माहिती सुरक्षितपणे जतन करा. तुमचे खाते पुनर्प्राप्त करण्यासाठी तुम्हाला त्याची आवश्यकता असेल.';

  @override
  String get importantNotice => '⚠️ महत्वाचे:';

  @override
  String get astrologerProfileTitle => 'ज्योतिषी प्रोफाइल';

  @override
  String get personalAstrologer => 'वैयक्तिक ज्योतिषी';

  @override
  String get makePersonalAstrologer => 'वैयक्तिक ज्योतिषी बनवा';

  @override
  String get favoriteDescription =>
      'तुमचे प्रश्न या ज्योतिष्याला प्राधान्य दिले जातील. जर उपलब्ध नसेल तर दुसरा पात्र ज्योतिषी तुम्हाला मदत करेल.';

  @override
  String get educationQualifications => 'शिक्षण आणि पात्रता';

  @override
  String get aboutSection => 'आमच्याबद्दल';

  @override
  String get shareProfile => 'प्रोफाइल शेअर करा';

  @override
  String get loadingAstrologer => 'ज्योतिषी तपशील लोड करत आहे...';

  @override
  String get failedToLoadAstrologer => 'ज्योतिषी तपशील लोड करता आले नाहीत.';

  @override
  String get authenticationRequired =>
      'प्रमाणीकरण आवश्यक आहे. कृपया लॉग इन करा.';

  @override
  String securityCheckFailed(Object error) {
    return 'सुरक्षा तपासणी अयशस्वी: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name आता तुमचा वैयक्तिक ज्योतिषी आहे';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ आवडींमधून $name काढून टाकले';
  }

  @override
  String get toggleFavoriteError => 'आवडती स्थिती अपडेट करण्यात अयशस्वी';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 शिक्षण: $education\n📜 पात्रता: $qualification\n⏳ अनुभव: $experience';
  }

  @override
  String get notProvided => 'प्रदान केलेले नाही';

  @override
  String reviews(Object count) {
    return '($count पुनरावलोकने)';
  }

  @override
  String get specialties => 'खासियत';

  @override
  String get experience => 'अनुभव';

  @override
  String get qualification => 'पात्रता';

  @override
  String get education => 'शिक्षण';

  @override
  String get recoveryTips =>
      '• या माहितीचा स्क्रीनशॉट घ्या\n• ती सुरक्षित ठिकाणी साठवा\n• कोणासोबतही शेअर करू नका\n• ही फक्त एकदाच दाखवली जाईल';

  @override
  String get themeSettingsTitle => 'थीम सेटिंग्ज';

  @override
  String get lightThemeLabel => 'प्रकाश';

  @override
  String get lightThemeDescription => 'नेहमी हलकी थीम वापरा';

  @override
  String get darkThemeLabel => 'गडद';

  @override
  String get darkThemeDescription => 'नेहमी गडद थीम वापरा';

  @override
  String get systemThemeLabel => 'प्रणाली';

  @override
  String get systemThemeDarkDescription => 'गडद थीमसाठी सिस्टम सेटिंग फॉलो करा';

  @override
  String get systemThemeLightDescription =>
      'हलक्या थीमसाठी सिस्टम सेटिंग फॉलो करा';

  @override
  String get switchToLight => 'लाईटवर स्विच करा';

  @override
  String get switchToDark => 'गडद वर स्विच करा';

  @override
  String get ourTeam => 'आमचा संघ';

  @override
  String get teamDescription =>
      'आमच्या व्यावसायिक वैदिक ज्योतिषींच्या टीमकडे ग्रहांच्या प्रभावांचा आणि जीवन पद्धतींचा अर्थ लावण्याचा वर्षानुवर्षे अनुभव आहे. समर्पित समर्थन आणि विकास टीमच्या पाठिंब्याने, कर्मा प्रत्येक वापरकर्त्यासाठी एक अखंड, विश्वासार्ह आणि जागतिक अनुभव प्रदान करते.';
}
