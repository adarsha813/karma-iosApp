// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get settingsTitle => 'سيٽنگون';

  @override
  String get notificationSettings => 'اطلاع جي سيٽنگون';

  @override
  String get privacySettings => 'رازداري سيٽنگون';

  @override
  String get accountSettings => 'اڪائونٽ سيٽنگون';

  @override
  String get languageSettings => 'ٻولي سيٽنگون';

  @override
  String get languageChanged => 'ٻولي تبديل ٿي وئي';

  @override
  String get existingUserButton => 'مان هڪ موجوده استعمال ڪندڙ آهيان.';

  @override
  String get chooseCountryTitle => 'ملڪ چونڊيو';

  @override
  String get yesText => 'ها';

  @override
  String get noText => 'نه';

  @override
  String get appBarTitle => 'پروفائل سيٽنگون';

  @override
  String get userIdLabel => 'استعمال ڪندڙ جي سڃاڻپ *';

  @override
  String get nameLabel => 'نالو';

  @override
  String get birthCountryLabel => 'پيدائش جو ملڪ';

  @override
  String get birthCityLabel => 'ڄمڻ جو شهر';

  @override
  String get countrySelectionTitle => 'پنھنجو ملڪ چونڊيو';

  @override
  String get maleLabel => 'مرد';

  @override
  String get femaleLabel => 'عورت';

  @override
  String get birthDateLabel => 'ڄمڻ جي تاريخ';

  @override
  String get birthDatePlaceholder => 'ڄمڻ جي تاريخ چونڊيو';

  @override
  String get birthTimeLabel => 'ڄمڻ جو وقت';

  @override
  String get birthTimePlaceholder => 'ڄمڻ جو وقت چونڊيو';

  @override
  String get saveProfileButton => 'پروفائل محفوظ ڪريو';

  @override
  String get noCitiesFound => 'ڪوبه شهر نه مليو';

  @override
  String cityPlaceholder(Object country) {
    return '$country ۾ شهر داخل ڪريو';
  }

  @override
  String get countryFirstPlaceholder => 'پهرين ملڪ چونڊيو';

  @override
  String get versionHistoryTitle => 'نسخي جي تاريخ';

  @override
  String get notSetText => 'مقرر نه ٿيل';

  @override
  String nameHistory(Object name) {
    return 'نالو: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'شهر: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ملڪ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'جنس: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ڄمڻ جي تاريخ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ڄمڻ جو وقت: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'جڳھ: $latitude، $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ٽائم زون: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ڊي ايس ٽي: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'حالت: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date تي اپڊيٽ ڪيو ويو';
  }

  @override
  String get userIdRequired => 'استعمال ڪندڙ جي سڃاڻپ گهربل آهي';

  @override
  String get profileSaved => 'پروفائل ڪاميابي سان محفوظ ٿي وئي.';

  @override
  String get saveFailed => 'پروفائل محفوظ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get errorPrefix => 'غلطي:';

  @override
  String get onboardingChooseLanguage => 'پنهنجي ٻولي چونڊيو';

  @override
  String get onboardingChooseLanguageDesc =>
      'جاري رکڻ لاءِ پنهنجي پسنديده ٻولي چونڊيو.';

  @override
  String get onboardingWhatIsAstrology => 'علم نجوم ڇا آهي؟';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'علم نجوم آسماني حرڪتن ۽ انساني زندگي تي انهن جي اثر جو قديم مطالعو آهي، جيڪو شخصيت، رشتن ۽ زندگي جي واقعن ۾ بصيرت پيش ڪري ٿو.';

  @override
  String get onboardingWhyUseApp => 'هي ايپ ڇو استعمال ڪجي؟';

  @override
  String get onboardingWhyUseAppDesc =>
      'صحيح، انساني ٺاهيل زائچا ۽ هدايتون حاصل ڪريو جيڪي توهان جي پيدائش جي چارٽ مطابق هجن. روزاني اڳڪٿين ۽ تجربيڪار نجومي کان ذاتي صلاح سان باخبر فيصلا ڪريو.';

  @override
  String get onboardingHowToUse => 'هي ايپ ڪيئن استعمال ڪجي؟';

  @override
  String get onboardingHowToUseDesc =>
      'بس پنهنجي پيدائش جي تاريخ، صحيح وقت، پيدائش جي جاءِ، ۽ ٻيون لاڳاپيل تفصيلون داخل ڪريو ته جيئن فوري طور تي شروع ڪري سگهجي. روزاني افقن جي ڳولا ڪريو، ماهر نجومي کان سوال پڇو، ۽ صحيح، ذاتي پيشنگوئي لاءِ پنهنجي پروفائل کي منظم ڪريو - لاگ ان جي ضرورت ناهي.';

  @override
  String get onboardingGetStarted => 'شروع ڪريو';

  @override
  String get onboardingNewUser => 'نئون استعمال ڪندڙ';

  @override
  String get onboardingExistingUser => 'موجوده استعمال ڪندڙ';

  @override
  String get onboardingBack => 'پوئتي';

  @override
  String get onboardingNext => 'اڳيون';

  @override
  String get userIdNotFound =>
      'استعمال ڪندڙ جي سڃاڻپ نه ملي. مھرباني ڪري لاگ ان ڪريو يا پنھنجو پروفائل سيٽ ڪريو.';

  @override
  String get clearNotificationsTitle => 'اطلاع صاف ڪريو';

  @override
  String get clearNotificationsMessage =>
      'ڇا توهان کي پڪ آهي ته توهان سڀ اطلاع صاف ڪرڻ چاهيو ٿا؟';

  @override
  String get clearNotificationsSuccess => 'سڀ اطلاع ڪاميابي سان صاف ڪيا ويا.';

  @override
  String get clearHoroscopeTitle => 'صاف افق';

  @override
  String get clearHoroscopeMessage =>
      'ڇا توهان کي پڪ آهي ته توهان پنهنجي افق جي ڊيٽا کي صاف ڪرڻ چاهيو ٿا؟';

  @override
  String get clearHoroscopeSuccess => 'هاروسڪوپ ڪاميابي سان صاف ٿي ويو.';

  @override
  String get clearChatTitle => 'چيٽ جي تاريخ صاف ڪريو';

  @override
  String get clearChatMessage =>
      'ڇا توهان کي پڪ آهي ته توهان پنهنجي سڄي چيٽ جي تاريخ ختم ڪرڻ چاهيو ٿا؟';

  @override
  String get clearChatLocal => 'مقامي طور تي چيٽ صاف ڪئي وئي.';

  @override
  String get deleteAccountTitle => 'اڪائونٽ ختم ڪريو';

  @override
  String get deleteAccountMessage =>
      'ڇا توهان کي پڪ آهي ته توهان پنهنجو اڪائونٽ ختم ڪرڻ چاهيو ٿا؟ اهو توهان جي سڀني چيٽ جي تاريخ ۽ اطلاعن کي پڻ صاف ڪندو.';

  @override
  String get deleteAccountSuccess =>
      'توهان جو اڪائونٽ ۽ سڀ ڊيٽا هٽايو ويو آهي.';

  @override
  String get deleteAccountError => 'اڪائونٽ ختم ڪرڻ ۾ غلطي';

  @override
  String get logoutTitle => 'لاگ آئوٽ';

  @override
  String get logoutMessage =>
      'ڇا توهان کي پڪ آهي ته توهان لاگ آئوٽ ٿيڻ چاهيو ٿا؟';

  @override
  String get termsPrivacyTitle => 'شرطون ۽ رازداري';

  @override
  String get privacyPolicyTitle => 'رازداري پاليسي';

  @override
  String get termsConditionsTitle => 'شرطن ۽ ضابطن';

  @override
  String get dataControlTitle => 'ڊيٽا ڪنٽرول';

  @override
  String get cancelButton => 'منسوخ ڪريو';

  @override
  String get confirmButton => 'تصديق ڪريو';

  @override
  String get clearQuestionsSuccess => 'سڀ سوال ڪاميابي سان ڊهي ويا.';

  @override
  String get yoginiLabel => 'يوگيني';

  @override
  String get lordLabel => 'رب';

  @override
  String get startLabel => 'شروع ڪريو';

  @override
  String get recoverAccount => 'اڪائونٽ واپس وٺو';

  @override
  String get endLabel => 'آخر';

  @override
  String get startDateLabel => 'شروعاتي تاريخ';

  @override
  String get endDateLabel => 'آخري تاريخ';

  @override
  String get notAvailable => 'دستياب ناهي';

  @override
  String get noData => 'ڪو به ڊيٽا ناهي';

  @override
  String get unknownError => 'اڻڄاتل غلطي';

  @override
  String get retryButton => 'ٻيهر ڪوشش ڪريو';

  @override
  String get kundaliGeneratorTitle => 'ڪُنڊلي جنريٽر';

  @override
  String get natalChartTitle => 'پيدائشي چارٽ';

  @override
  String get lagnaLabel => 'لگنا';

  @override
  String get rashiLabel => 'رشي';

  @override
  String get ascDegreeLabel => 'عروج جي ڊگري';

  @override
  String get vimshottariDashaTitle => 'وِمشوتري دشا';

  @override
  String get yoginiDashaTitle => 'يوگيني دشا';

  @override
  String get unknown => 'اڻڄاتل';

  @override
  String get clearHoroscope => 'صاف افق';

  @override
  String get clearNotifications => 'اطلاع صاف ڪريو';

  @override
  String get clearChatHistory => 'چيٽ جي تاريخ صاف ڪريو';

  @override
  String get logout => 'لاگ آئوٽ';

  @override
  String get deleteAccount => 'اڪائونٽ ختم ڪريو';

  @override
  String get allFieldsRequired => 'سڀ فيلڊ گهربل آهن.';

  @override
  String get accountRecoveredSuccess => 'اڪائونٽ ڪاميابي سان بحال ٿيو.';

  @override
  String get recoveryFailed => 'بحالي ناڪام ٿي. پنهنجي معلومات چيڪ ڪريو.';

  @override
  String get recoverySecretLabel => 'بحالي جو راز:';

  @override
  String get aboutUsTitle => 'اسان جي باري ۾';

  @override
  String get aboutOurCompany => 'اسان جي ڪمپني بابت';

  @override
  String get aboutCompanyDescription =>
      'ڪرما ۾، اسين توهان جي مدد ڪريون ٿا توهان جي حقيقي زندگي جي رستي کي ويدڪ نجومي جي لازوال حڪمت ذريعي دريافت ڪرڻ ۾. هر بصيرت حقيقي، تجربيڪار نجومي کان ايندي آهي، احتياط سان توهان جي منفرد پيدائش جي چارٽ جي بنياد تي تيار ڪئي وئي آهي. روزاني زائچن کان وٺي ذاتي هدايت تائين، ڪرما قديم علم کي 100 کان وڌيڪ ٻولين ۾ رسائي لائق بڻائي ٿو.';

  @override
  String get ourMission => 'اسان جو مشن';

  @override
  String get missionDescription =>
      'اسان جو مشن سادو آهي: مستند، انساني اڳواڻي ۾ نجومي رهنمائي فراهم ڪرڻ جيڪا توهان کي اعتماد ۽ باخبر فيصلا ڪرڻ جي طاقت ڏئي ٿي. هر اڳڪٿي ۽ صلاح مشوري سالن جي پيشه ورانه مهارت کي ظاهر ڪري ٿي، نه ته خودڪار الگورتھم.';

  @override
  String get ourVision => 'اسان جو خواب';

  @override
  String get visionDescription =>
      'اسين ويدڪ علم نجوم لاءِ دنيا جو سڀ کان وڌيڪ قابل اعتماد پليٽ فارم بڻجڻ جي ڪوشش ڪريون ٿا، هر هنڌ ماڻهن کي پاڻ کي، انهن جي پسندن کي، ۽ انهن جي زندگي جي سفر کي وضاحت ۽ اعتماد سان سمجهڻ ۾ مدد ڪريون ٿا.';

  @override
  String get ourValues => 'اسان جا قدر';

  @override
  String get valuesDescription =>
      'ڪرما ۾، اسان صداقت، درستگي، ۽ اعتماد جي قدر ڪريون ٿا. اسان اهڙي رهنمائي پيش ڪرڻ لاءِ پرعزم آهيون جيڪا نه رڳو صحيح هجي پر بامعني پڻ هجي، جيڪا توهان کي بصيرت ۽ اعتماد سان زندگي گذارڻ ۾ مدد ڪندي.';

  @override
  String get contactUs => 'اسان سان رابطو ڪريو';

  @override
  String get contactEmail => 'اي ميل: support@yourcompany.com';

  @override
  String get contactWebsite => 'ويب سائيٽ: www.yourcompany.com';

  @override
  String get customerSupport => 'ڪسٽمر سپورٽ';

  @override
  String get supportHeroTitle => 'اسين مدد لاءِ هتي آهيون';

  @override
  String get supportHeroDescription =>
      'هيٺ ڏنل فارم ڀريو ۽ اسان جي سپورٽ ٽيم جلد کان جلد توهان سان رابطو ڪندي.';

  @override
  String get yourName => 'توهان جو نالو';

  @override
  String get yourEmail => 'اوهانجو ايميل';

  @override
  String get message => 'پيغام';

  @override
  String get enterEmail => 'پنهنجو اي ميل داخل ڪريو';

  @override
  String get enterValidEmail => 'صحيح اي ميل پتو داخل ڪريو.';

  @override
  String enterField(Object fieldName) {
    return '$fieldName داخل ڪريو';
  }

  @override
  String get send => 'موڪليو';

  @override
  String get sending => 'موڪلي رهيو آهي...';

  @override
  String get emailSentSuccess => '✅ اي ميل ڪاميابي سان موڪلي وئي!';

  @override
  String get emailSendFailed => '❌ اي ميل موڪلڻ ۾ ناڪام ٿيو';

  @override
  String get astroDictionaryTitle => 'ايسٽرو ڊڪشنري';

  @override
  String get searchTermsHint => 'ڳولا جون اصطلاحون...';

  @override
  String get noTermsFound => 'ڪي به اصطلاح نه مليا.';

  @override
  String get buyQuestionsTitle => 'سوال خريد ڪريو';

  @override
  String get userNotAuthenticated => 'استعمال ڪندڙ جي تصديق نه ٿي آهي.';

  @override
  String get loadStoreDataFailed => 'اسٽور ڊيٽا لوڊ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get missingAuthToken => 'گم ٿيل تصديق ٽوڪن';

  @override
  String get merchantDisplayName => 'ايسٽرو چيٽ ايپ';

  @override
  String get paymentSuccessful => '✅ ادائيگي ڪامياب! سوال موڪليو ويو.';

  @override
  String paymentFailed(Object error) {
    return '❌ ادائيگي ناڪام ٿي: $error';
  }

  @override
  String get yourBalance => 'توهان جو بيلنس';

  @override
  String questionsBalance(Object count) {
    return '$count سوال';
  }

  @override
  String get availableOffers => 'موجود آڇون';

  @override
  String questionsCount(Object count) {
    return '$count سوال';
  }

  @override
  String get buyButton => 'خريد ڪريو';

  @override
  String get dailyHoroscopeTitle => '🌟 روزاني زائچو';

  @override
  String get userIdMissing => 'استعمال ڪندڙ جي سڃاڻپ غائب آهي.';

  @override
  String get fetchHoroscopesFailed => 'افقون حاصل ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get noHoroscopeFound => 'ڪو به افق نه مليو.';

  @override
  String get signLabel => 'نشاني';

  @override
  String get todayLabel => 'اڄ';

  @override
  String get yesterdayLabel => 'ڪالهه';

  @override
  String get thisWeekLabel => 'هن هفتي';

  @override
  String get lastMonthLabel => 'گذريل مهينو';

  @override
  String get chatTitle => 'چيٽ';

  @override
  String get typeYourQuestionHint => 'پنھنجو سوال لکو...';

  @override
  String get paymentRequired => 'ادائيگي گهربل آهي';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'توهان پنهنجا مفت سوال استعمال ڪيا آهن. جاري رکڻ لاءِ $amount ادا ڪريو.';
  }

  @override
  String get payNowButton => 'هاڻي ادا ڪريو';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count مفت سوال باقي آهن';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ادا ڪيل سوال باقي آهن';
  }

  @override
  String get thankYouFeedback => 'توهان جي راءِ لاءِ مهرباني!';

  @override
  String get ratingSubmitted => 'درجه بندي جمع ڪرائي وئي!';

  @override
  String get setUserIdFirst =>
      'مھرباني ڪري پھريان پنھنجي يوزر آئي ڊي سيٽ ڪريو.';

  @override
  String get failedToFetchPrevious => 'پوئين سوال ۽ جواب حاصل ڪرڻ ۾ ناڪام ٿيو';

  @override
  String errorOccurred(Object error) {
    return 'غلطي: $error';
  }

  @override
  String get drawerAstroProfile => 'ايسٽرو پروفائل';

  @override
  String get drawerDailyHoroscope => 'روزاني افق';

  @override
  String get drawerBuyQuestions => 'سوال خريد ڪريو';

  @override
  String get drawerAstroDictionary => 'ايسٽرو ڊڪشنري';

  @override
  String get drawerSettings => 'سيٽنگون';

  @override
  String get drawerCustomerSupport => 'ڪسٽمر سپورٽ';

  @override
  String get drawerAbout => 'بابت';

  @override
  String get drawerProfileSettings => 'پروفائل سيٽنگون';

  @override
  String get demoNotificationTitle => '🔔 ڊيمو نوٽيفڪيشن';

  @override
  String get demoNotificationBody =>
      'هي توهان جي ايپ مان هڪ ٽيسٽ نوٽيفڪيشن آهي!';

  @override
  String get notificationsTitle => 'نوٽيفڪيشن';

  @override
  String get noNotifications => 'ڪابه اطلاع ناهي';

  @override
  String get allTab => 'سڀ';

  @override
  String get markAllAsRead => 'سڀني کي پڙهيل طور نشان لڳايو.';

  @override
  String get notificationMarkedRead => 'اطلاع کي پڙهيل طور نشان لڳايو ويو';

  @override
  String get failedToLoadNotifications => 'اطلاعن کي لوڊ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get failedToMarkRead => 'پڙهيل طور نشان لڳائڻ ۾ ناڪام ٿيو.';

  @override
  String get failedToMarkAllRead => 'سڀني کي پڙهيل طور نشان لڳائڻ ۾ ناڪام ٿيو.';

  @override
  String get socketConnected => 'ساکٽ ڳنڍيل آهي';

  @override
  String get socketDisconnected => 'ساکٽ ڊسڪنيڪٽ ٿي ويو';

  @override
  String get newNotificationReceived => 'نئون اطلاع مليو';

  @override
  String get generalCategory => 'جنرل';

  @override
  String get horoscopeCategory => 'زائچو';

  @override
  String get chatCategory => 'چيٽ';

  @override
  String get systemCategory => 'سسٽم';

  @override
  String get updateCategory => 'تازه ڪاريون';

  @override
  String get howToAskTitle => 'ڪيئن پڇجي';

  @override
  String get noQuestionsAvailable => 'ڪو به سوال موجود ناهي.';

  @override
  String get failedToLoadQuestions => 'سوال لوڊ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get pullToRefresh => 'ريفريش ڪرڻ لاءِ ڇڪيو';

  @override
  String get careerCategory => 'ڪيريئر';

  @override
  String get loveCategory => 'پيار ۽ رشتا';

  @override
  String get healthCategory => 'صحت';

  @override
  String get financeCategory => 'معيشت';

  @override
  String get familyCategory => 'خاندان';

  @override
  String get educationCategory => 'تعليم';

  @override
  String get travelCategory => 'سفر';

  @override
  String get spiritualCategory => 'روحاني';

  @override
  String get profileLoaded => 'پروفائل ڪاميابي سان لوڊ ٿي وئي.';

  @override
  String get imageUploaded => 'تصوير ڪاميابي سان اپ لوڊ ٿي وئي.';

  @override
  String get savedInformationConfirmation => 'مون هي معلومات محفوظ ڪئي آهي.';

  @override
  String get noHistoryAvailable => 'ڪا به تاريخ موجود ناهي';

  @override
  String get missingUserIdError => 'استعمال ڪندڙ جي سڃاڻپ گهربل آهي';

  @override
  String get networkError => 'نيٽ ورڪ جي غلطي. مھرباني ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get timeoutError => 'درخواست جو وقت ختم ٿي ويو';

  @override
  String get genericError => 'ڪجهه غلط ٿيو.';

  @override
  String get reactionUpdateError => 'رد عمل کي اپڊيٽ ڪرڻ ۾ ناڪام ٿيو';

  @override
  String get noSearchResults => 'ڪو به ڳولا جو نتيجو نه مليو.';

  @override
  String get clearSearch => 'ڳولا صاف ڪريو';

  @override
  String get resultsFound => 'نتيجا مليا';

  @override
  String get recoverySecretHint =>
      'ڪاپي پيسٽ ڪم نه ڪري سگھي ٿو، دستي طور تي ٽائيپ ڪريو';

  @override
  String get recoverAccountDescription =>
      'پنهنجو اڪائونٽ بحال ڪرڻ لاءِ انهن قدمن تي عمل ڪريو';

  @override
  String get processingLabel => 'پروسيسنگ...';

  @override
  String get clearChatSuccess => 'چيٽ ڪاميابي سان صاف ٿي وئي';

  @override
  String get notificationsEnabled => 'اطلاع فعال ڪيا ويا';

  @override
  String get notificationsDisabled => 'اطلاعن کي بند ڪيو ويو';

  @override
  String get securityNotice =>
      'توهان جو ڊيٽا محفوظ طور تي انڪرپٽ ٿيل ۽ محفوظ ٿيل آهي.';

  @override
  String get loading => 'لوڊ ٿي رهيو آهي...';

  @override
  String get selectLanguage => 'ٻولي چونڊيو';

  @override
  String get onboardingGetStartedDesc => 'پنهنجي ٻولي چونڊڻ سان شروع ڪريو';

  @override
  String get accountRecoveryTitle => '🔐 اڪائونٽ جي وصولي جا تفصيل';

  @override
  String get recoveryInstructions =>
      'مھرباني ڪري ھن معلومات کي محفوظ طور تي محفوظ ڪريو. توھان کي پنھنجو اڪائونٽ بحال ڪرڻ لاءِ ان جي ضرورت پوندي.';

  @override
  String get importantNotice => '⚠️ اهم:';

  @override
  String get astrologerProfileTitle => 'نجومي جي پروفائيل';

  @override
  String get personalAstrologer => 'ذاتي نجومي';

  @override
  String get makePersonalAstrologer => 'ذاتي نجومي بڻجو';

  @override
  String get favoriteDescription =>
      'توهان جا سوال هن نجومي کي ترجيح ڏني ويندي. جيڪڏهن دستياب نه هجي ته ٻيو ڪو قابل نجومي توهان جي مدد ڪندو.';

  @override
  String get educationQualifications => 'تعليم ۽ قابليت';

  @override
  String get aboutSection => 'بابت';

  @override
  String get shareProfile => 'پروفائل شيئر ڪريو';

  @override
  String get loadingAstrologer => 'نجومي تفصيل لوڊ ڪري رهيو آهي...';

  @override
  String get failedToLoadAstrologer => 'نجومي جي تفصيل لوڊ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String get authenticationRequired =>
      'تصديق گهربل آهي. مهرباني ڪري لاگ ان ٿيو.';

  @override
  String securityCheckFailed(Object error) {
    return 'سيڪيورٽي چيڪ ناڪام ٿيو: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name هاڻي توهان جو ذاتي نجومي آهي';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ پسنديده مان $name هٽايو ويو';
  }

  @override
  String get toggleFavoriteError => 'پسنديده حيثيت کي اپڊيٽ ڪرڻ ۾ ناڪام ٿيو.';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 تعليم: $education\n📜 قابليت: $qualification\n⏳ تجربو: $experience';
  }

  @override
  String get notProvided => 'مهيا نه ڪيو ويو آهي';

  @override
  String reviews(Object count) {
    return '($count جائزو)';
  }

  @override
  String get specialties => 'خاصيتون';

  @override
  String get experience => 'تجربو';

  @override
  String get qualification => 'قابليت';

  @override
  String get education => 'تعليم';

  @override
  String get recoveryTips =>
      '• هن معلومات جو اسڪرين شاٽ وٺو\n• ان کي محفوظ جاءِ تي محفوظ ڪريو\n• ڪنهن سان به شيئر نه ڪريو\n• هي صرف هڪ ڀيرو ڏيکاريو ويندو';

  @override
  String get themeSettingsTitle => 'ٿيم سيٽنگون';

  @override
  String get lightThemeLabel => 'روشني';

  @override
  String get lightThemeDescription => 'هميشه هلڪو ٿيم استعمال ڪريو';

  @override
  String get darkThemeLabel => 'اونداهو';

  @override
  String get darkThemeDescription => 'هميشه ڊارڪ ٿيم استعمال ڪريو';

  @override
  String get systemThemeLabel => 'سسٽم';

  @override
  String get systemThemeDarkDescription =>
      'ڊارڪ ٿيم لاءِ سسٽم سيٽنگ جي پيروي ڪريو';

  @override
  String get systemThemeLightDescription =>
      'هلڪي ٿيم لاءِ سسٽم سيٽنگ جي پيروي ڪريو';

  @override
  String get switchToLight => 'روشني ڏانهن تبديل ڪريو';

  @override
  String get switchToDark => 'اونداهي ڏانهن مٽايو';

  @override
  String get ourTeam => 'اسان جي ٽيم';

  @override
  String get teamDescription =>
      'اسان جي پيشيور ويدڪ نجومي جي ٽيم وٽ سيارن جي اثرن ۽ زندگي جي نمونن جي تشريح ڪرڻ جو سالن جو تجربو آهي. هڪ وقف سپورٽ ۽ ڊولپمينٽ ٽيم جي مدد سان، ڪرما هر استعمال ڪندڙ لاءِ هڪ بيحد، قابل اعتماد، ۽ عالمي تجربو فراهم ڪري ٿو.';
}
