// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AppLocalizationsPs extends AppLocalizations {
  AppLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get settingsTitle => 'امستنې';

  @override
  String get notificationSettings => 'د خبرتیا ترتیبات';

  @override
  String get privacySettings => 'د محرمیت ترتیبات';

  @override
  String get accountSettings => 'د حساب تنظیمات';

  @override
  String get languageSettings => 'د ژبې ترتیبات';

  @override
  String get languageChanged => 'ژبه بدله شوه';

  @override
  String get existingUserButton => 'زه یو موجود کاروونکی یم';

  @override
  String get chooseCountryTitle => 'هیواد غوره کړئ';

  @override
  String get yesText => 'هو';

  @override
  String get noText => 'نه';

  @override
  String get appBarTitle => 'د پروفایل ترتیبات';

  @override
  String get userIdLabel => 'د کارونکي پېژندپاڼه *';

  @override
  String get nameLabel => 'نوم';

  @override
  String get birthCountryLabel => 'د زیږیدو هیواد';

  @override
  String get birthCityLabel => 'د زیږون ښار';

  @override
  String get countrySelectionTitle => 'خپل هیواد غوره کړئ';

  @override
  String get maleLabel => 'نارینه';

  @override
  String get femaleLabel => 'ښځه';

  @override
  String get birthDateLabel => 'د زیږون نیټه';

  @override
  String get birthDatePlaceholder => 'د زیږون نیټه وټاکئ';

  @override
  String get birthTimeLabel => 'د زیږون وخت';

  @override
  String get birthTimePlaceholder => 'د زیږون وخت وټاکئ';

  @override
  String get saveProfileButton => 'پروفایل خوندي کړئ';

  @override
  String get noCitiesFound => 'هیڅ ښار ونه موندل شو';

  @override
  String cityPlaceholder(Object country) {
    return 'ښار په $country کې دننه کړئ';
  }

  @override
  String get countryFirstPlaceholder => 'لومړی هیواد غوره کړئ';

  @override
  String get versionHistoryTitle => 'د نسخې تاریخ';

  @override
  String get notSetText => 'نه دی ټاکل شوی';

  @override
  String nameHistory(Object name) {
    return 'نوم: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ښار: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'هیواد: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'جنس: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'د زیږون نیټه: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'د زیږون وخت: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'موقعیت: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'د وخت زون: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'حالت: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'تازه شوی په $date';
  }

  @override
  String get userIdRequired => 'د کارونکي ID اړین دی';

  @override
  String get profileSaved => 'پروفایل په بریالیتوب سره خوندي شو';

  @override
  String get saveFailed => 'د پروفایل خوندي کولو کې پاتې راغی';

  @override
  String get errorPrefix => 'تېروتنه:';

  @override
  String get onboardingChooseLanguage => 'خپله ژبه غوره کړئ';

  @override
  String get onboardingChooseLanguageDesc =>
      'د دوام لپاره خپله خوښه ژبه غوره کړئ.';

  @override
  String get onboardingWhatIsAstrology => 'ستورپوهنه څه ده؟';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ستورپوهنه د اسماني اجسامو مطالعه ده...';

  @override
  String get onboardingWhyUseApp => 'ولې دا اپلیکیشن وکاروئ؟';

  @override
  String get onboardingWhyUseAppDesc =>
      'د باخبره پریکړو کولو لپاره شخصي افقونه، ورځني وړاندوینې، او لارښوونې ترلاسه کړئ.';

  @override
  String get onboardingHowToUse => 'دا اپلیکیشن څنګه وکاروئ؟';

  @override
  String get onboardingHowToUseDesc =>
      'په اسانۍ سره حرکت وکړئ، ورځني افقونه وګورئ، او د دقیقو وړاندوینو لپاره خپل پروفایل اداره کړئ.';

  @override
  String get onboardingGetStarted => 'پیل وکړئ';

  @override
  String get onboardingNewUser => 'نوی کارن';

  @override
  String get onboardingExistingUser => 'موجوده کارن';

  @override
  String get onboardingBack => 'شاته';

  @override
  String get onboardingNext => 'بل';

  @override
  String get userIdNotFound =>
      'د کارونکي ID ونه موندل شو. مهرباني وکړئ ننوتل یا خپل پروفایل تنظیم کړئ.';

  @override
  String get clearNotificationsTitle => 'خبرتیاوې پاکې کړئ';

  @override
  String get clearNotificationsMessage =>
      'ایا تاسو ډاډه یاست چې غواړئ ټول خبرتیاوې پاکې کړئ؟';

  @override
  String get clearNotificationsSuccess =>
      'ټول خبرتیاوې په بریالیتوب سره پاکې شوې.';

  @override
  String get clearHoroscopeTitle => 'روښانه افق';

  @override
  String get clearHoroscopeMessage =>
      'ایا تاسو ډاډه یاست چې غواړئ خپل د افق معلومات پاک کړئ؟';

  @override
  String get clearHoroscopeSuccess => 'افق په بریالیتوب سره پاک شو.';

  @override
  String get clearChatTitle => 'د چیٹ تاریخ پاک کړئ';

  @override
  String get clearChatMessage =>
      'ایا تاسو ډاډه یاست چې غواړئ د خپل ټول چیٹ تاریخ ړنګ کړئ؟';

  @override
  String get clearChatLocal => 'چیٹ په محلي ډول پاک شو.';

  @override
  String get deleteAccountTitle => 'حساب ړنګ کړئ';

  @override
  String get deleteAccountMessage =>
      'ایا تاسو ډاډه یاست چې غواړئ خپل حساب حذف کړئ؟ دا به ستاسو د چیټ ټول تاریخ او خبرتیاوې هم پاکې کړي.';

  @override
  String get deleteAccountSuccess => 'ستاسو حساب او ټول معلومات لرې شوي دي.';

  @override
  String get deleteAccountError => 'د حساب حذف کولو کې تېروتنه';

  @override
  String get logoutTitle => 'وتل';

  @override
  String get logoutMessage => 'ایا تاسو ډاډه یاست چې ننوتل غواړئ؟';

  @override
  String get termsPrivacyTitle => 'شرایط او محرمیت';

  @override
  String get privacyPolicyTitle => 'د محرمیت تګلاره';

  @override
  String get termsConditionsTitle => 'شرایط او مقررات';

  @override
  String get dataControlTitle => 'د معلوماتو کنټرول';

  @override
  String get cancelButton => 'لغوه کول';

  @override
  String get confirmButton => 'تایید کړئ';

  @override
  String get clearQuestionsSuccess => 'ټولې پوښتنې په بریالیتوب سره حذف شوې.';

  @override
  String get yoginiLabel => 'یوګیني';

  @override
  String get lordLabel => 'ربه';

  @override
  String get startLabel => 'پیل';

  @override
  String get recoverAccount => 'حساب بیرته ترلاسه کړئ';

  @override
  String get endLabel => 'پای';

  @override
  String get startDateLabel => 'د پیل نیټه';

  @override
  String get endDateLabel => 'د پای نیټه';

  @override
  String get notAvailable => 'شتون نلري';

  @override
  String get noData => 'هیڅ معلومات نشته';

  @override
  String get unknownError => 'نامعلومه تېروتنه';

  @override
  String get retryButton => 'بیا هڅه وکړئ';

  @override
  String get kundaliGeneratorTitle => 'د کنډالي جنراتور';

  @override
  String get natalChartTitle => 'د زېږون چارټ';

  @override
  String get lagnaLabel => 'لګنا';

  @override
  String get rashiLabel => 'راشي';

  @override
  String get ascDegreeLabel => 'د لوړو درجو';

  @override
  String get vimshottariDashaTitle => 'ویمشوتری داشا';

  @override
  String get yoginiDashaTitle => 'یوګیني داشا';

  @override
  String get unknown => 'نامعلوم';

  @override
  String get clearHoroscope => 'روښانه افق';

  @override
  String get clearNotifications => 'خبرتیاوې پاکې کړئ';

  @override
  String get clearChatHistory => 'د چیٹ تاریخ پاک کړئ';

  @override
  String get logout => 'وتل';

  @override
  String get deleteAccount => 'حساب ړنګ کړئ';

  @override
  String get allFieldsRequired => 'ټولې ساحې اړینې دي.';

  @override
  String get accountRecoveredSuccess =>
      'حساب په بریالیتوب سره بیرته ترلاسه شو.';

  @override
  String get recoveryFailed => 'بیا رغونه ناکامه شوه. خپل معلومات وګورئ.';

  @override
  String get recoverySecretLabel => 'د بیا رغونې راز:';

  @override
  String get aboutUsTitle => 'زموږ په اړه';

  @override
  String get aboutOurCompany => 'زموږ د شرکت په اړه';

  @override
  String get aboutCompanyDescription =>
      'موږ ژمن یو چې خپلو کاروونکو ته د ستورپوهنې غوره تجربه وړاندې کړو.';

  @override
  String get ourMission => 'زموږ ماموریت';

  @override
  String get missionDescription =>
      'د ستورپوهنې دقیق او شخصي بصیرت چمتو کول ترڅو کاروونکو سره د دوی په ژوند کې باخبره پریکړې کولو کې مرسته وکړي.';

  @override
  String get ourVision => 'زموږ لید';

  @override
  String get visionDescription =>
      'د ټیکنالوژۍ او لرغوني حکمت سره یوځای کولو سره، د ستورپوهنې ترټولو باوري پلیټ فارم شي.';

  @override
  String get ourValues => 'زموږ ارزښتونه';

  @override
  String get valuesDescription =>
      'صداقت، دقت، د کاروونکي پر بنسټ ډیزاین، او دوامداره نوښت.';

  @override
  String get contactUs => 'موږ سره اړیکه ونیسئ';

  @override
  String get contactEmail => 'برېښنالیک: support@yourcompany.com';

  @override
  String get contactWebsite => 'ویب پاڼه: www.yourcompany.com';

  @override
  String get customerSupport => 'د پیرودونکو ملاتړ';

  @override
  String get supportHeroTitle => 'موږ دلته د مرستې لپاره یو';

  @override
  String get supportHeroDescription =>
      'لاندې فورمه ډکه کړئ او زموږ د ملاتړ ټیم به ژر تر ژره له تاسو سره اړیکه ونیسي.';

  @override
  String get yourName => 'ستاسو نوم';

  @override
  String get yourEmail => 'ستاسو برېښنالیک';

  @override
  String get message => 'پیغام';

  @override
  String get enterEmail => 'خپل برېښنالیک ولیکئ';

  @override
  String get enterValidEmail => 'یو باوري برېښنالیک پته دننه کړئ';

  @override
  String enterField(Object fieldName) {
    return '$fieldName دننه کړئ';
  }

  @override
  String get send => 'ولېږئ';

  @override
  String get sending => 'لیږل...';

  @override
  String get emailSentSuccess => '✅ برېښنالیک په بریالیتوب سره واستول شو!';

  @override
  String get emailSendFailed => '❌ د برېښنالیک لیږلو کې پاتې راغلل';

  @override
  String get astroDictionaryTitle => 'د ستورو قاموس';

  @override
  String get searchTermsHint => 'د لټون اصطلاحات...';

  @override
  String get noTermsFound => 'هیڅ اصطلاح ونه موندل شوه';

  @override
  String get buyQuestionsTitle => 'پوښتنې واخلئ';

  @override
  String get userNotAuthenticated => 'کارن تصدیق شوی نه دی';

  @override
  String get loadStoreDataFailed => 'د ذخیرې ډاټا بارولو کې پاتې راغله';

  @override
  String get missingAuthToken => 'د اعتبار نښه ورکه ده';

  @override
  String get merchantDisplayName => 'د اسټرو چیټ اپلیکیشن';

  @override
  String get paymentSuccessful => '✅ تادیه بریالۍ شوه! پوښتنه واستول شوه';

  @override
  String paymentFailed(Object error) {
    return '❌ تادیه ناکامه شوه: $error';
  }

  @override
  String get yourBalance => 'ستاسو بیلانس';

  @override
  String questionsBalance(Object count) {
    return '$count پوښتنې';
  }

  @override
  String get availableOffers => 'شته وړاندیزونه';

  @override
  String questionsCount(Object count) {
    return '$count پوښتنه';
  }

  @override
  String get buyButton => 'پېرود';

  @override
  String get dailyHoroscopeTitle => '🌟 ورځنی افق';

  @override
  String get userIdMissing => 'د کارونکي ID ورک دی';

  @override
  String get fetchHoroscopesFailed =>
      'د ستورپوهنو په ترلاسه کولو کې پاتې راغلل';

  @override
  String get noHoroscopeFound => 'هیڅ افق ونه موندل شو.';

  @override
  String get signLabel => 'لاسلیک';

  @override
  String get todayLabel => 'نن';

  @override
  String get yesterdayLabel => 'پرون';

  @override
  String get thisWeekLabel => 'دا اونۍ';

  @override
  String get lastMonthLabel => 'تېره میاشت';

  @override
  String get chatTitle => 'چیٹ';

  @override
  String get typeYourQuestionHint => 'خپله پوښتنه ولیکئ...';

  @override
  String get paymentRequired => 'تادیه اړینه ده';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'تاسو خپلې وړیا پوښتنې کارولې دي. د دوام لپاره $amount ورکړئ.';
  }

  @override
  String get payNowButton => 'اوس پیسې ورکړئ';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count پاتې وړیا پوښتنې';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count پاتې پیسې ورکړل شوې پوښتنې';
  }

  @override
  String get thankYouFeedback => 'ستاسو د نظر څخه مننه!';

  @override
  String get ratingSubmitted => 'درجه بندي وسپارل شوه!';

  @override
  String get setUserIdFirst => 'مهرباني وکړئ لومړی خپل د کارونکي ID تنظیم کړئ';

  @override
  String get failedToFetchPrevious =>
      'د پخوانیو پوښتنو او ځوابونو په ترلاسه کولو کې پاتې راغلل';

  @override
  String errorOccurred(Object error) {
    return 'تېروتنه: $error';
  }

  @override
  String get drawerAstroProfile => 'د اسټرو پروفایل';

  @override
  String get drawerDailyHoroscope => 'ورځنی افق';

  @override
  String get drawerBuyQuestions => 'پوښتنې واخلئ';

  @override
  String get drawerAstroDictionary => 'د ستورو قاموس';

  @override
  String get drawerSettings => 'امستنې';

  @override
  String get drawerCustomerSupport => 'د پیرودونکو ملاتړ';

  @override
  String get drawerAbout => 'په اړه';

  @override
  String get drawerProfileSettings => 'د پروفایل ترتیبات';

  @override
  String get demoNotificationTitle => '🔔 د ډیمو خبرتیا';

  @override
  String get demoNotificationBody =>
      'دا ستاسو د اپلیکیشن څخه د ازموینې خبرتیا ده!';

  @override
  String get notificationsTitle => 'خبرتیاوې';

  @override
  String get noNotifications => 'هیڅ خبرتیا نشته';

  @override
  String get allTab => 'ټول';

  @override
  String get markAllAsRead => 'ټول د لوستل شوي په توګه په نښه کړئ';

  @override
  String get notificationMarkedRead => 'خبرتیا د لوستل شوي په توګه نښه شوې';

  @override
  String get failedToLoadNotifications => 'د خبرتیاوو بارولو کې پاتې راغلل';

  @override
  String get failedToMarkRead =>
      'د لوستل شوي په توګه په نښه کولو کې پاتې راغلل';

  @override
  String get failedToMarkAllRead =>
      'ټول د لوستل شوي په توګه په نښه کولو کې پاتې راغلل';

  @override
  String get socketConnected => 'ساکټ وصل شو';

  @override
  String get socketDisconnected => 'ساکټ منقطع شو';

  @override
  String get newNotificationReceived => 'نوی خبرتیا ترلاسه شوه';

  @override
  String get generalCategory => 'جنرال';

  @override
  String get horoscopeCategory => 'د ستورپوهنې';

  @override
  String get chatCategory => 'چیٹ';

  @override
  String get systemCategory => 'سیسټم';

  @override
  String get updateCategory => 'تازه معلومات';

  @override
  String get howToAskTitle => 'څنګه پوښتنه وکړو';

  @override
  String get noQuestionsAvailable => 'هیڅ پوښتنه نشته';

  @override
  String get failedToLoadQuestions => 'د پوښتنو بارولو کې پاتې راغلل';

  @override
  String get pullToRefresh => 'د تازه کولو لپاره کش کړئ';

  @override
  String get careerCategory => 'مسلک';

  @override
  String get loveCategory => 'مینه او اړیکې';

  @override
  String get healthCategory => 'روغتیا';

  @override
  String get financeCategory => 'اقتصاد';

  @override
  String get familyCategory => 'کورنۍ';

  @override
  String get educationCategory => 'زده کړه';

  @override
  String get travelCategory => 'سفر';

  @override
  String get spiritualCategory => 'روحاني';

  @override
  String get profileLoaded => 'پروفایل په بریالیتوب سره پورته شو';

  @override
  String get imageUploaded => 'انځور په بریالیتوب سره پورته شو';

  @override
  String get savedInformationConfirmation => 'ما دا معلومات خوندي کړي دي';

  @override
  String get noHistoryAvailable => 'هیڅ تاریخ شتون نلري';

  @override
  String get missingUserIdError => 'د کارونکي ID اړین دی';

  @override
  String get networkError => 'د شبکې تېروتنه. مهرباني وکړئ بیا هڅه وکړئ.';

  @override
  String get timeoutError => 'د غوښتنې وخت پای ته ورسېد';

  @override
  String get genericError => 'یو څه غلط شول';

  @override
  String get reactionUpdateError => 'د غبرګون تازه کولو کې پاتې راغی';

  @override
  String get noSearchResults => 'د لټون کومه پایله ونه موندل شوه';

  @override
  String get clearSearch => 'لټون پاک کړئ';

  @override
  String get resultsFound => 'پایلې وموندل شوې';

  @override
  String get recoverySecretHint =>
      'کاپي او پیسټ ممکن کار ونکړي، په لاسي ډول یې ولیکئ';

  @override
  String get recoverAccountDescription =>
      'د خپل حساب بیرته ترلاسه کولو لپاره دا ګامونه تعقیب کړئ';

  @override
  String get processingLabel => 'پروسس کول...';

  @override
  String get clearChatSuccess => 'چیٹ په بریالیتوب سره پاک شو';

  @override
  String get notificationsEnabled => 'خبرتیاوې فعالې شوې';

  @override
  String get notificationsDisabled => 'خبرتیاوې غیر فعالې شوې';

  @override
  String get securityNotice =>
      'ستاسو معلومات په خوندي ډول کوډ شوي او زیرمه شوي دي';

  @override
  String get loading => 'بارول کیږي...';

  @override
  String get selectLanguage => 'ژبه غوره کړه';

  @override
  String get onboardingGetStartedDesc => 'د خپلې ژبې په غوره کولو سره پیل وکړئ';

  @override
  String get accountRecoveryTitle => '🔐 د حساب بیرته ترلاسه کولو توضیحات';

  @override
  String get recoveryInstructions =>
      'مهرباني وکړئ دا معلومات په خوندي ډول خوندي کړئ. تاسو به د خپل حساب بیرته ترلاسه کولو لپاره دې ته اړتیا ولرئ.';

  @override
  String get importantNotice => '⚠️ مهم:';

  @override
  String get astrologerProfileTitle => 'د ستورپوه پروفایل';

  @override
  String get personalAstrologer => 'شخصي ستورپوه';

  @override
  String get makePersonalAstrologer => 'شخصي ستورپوه جوړ کړئ';

  @override
  String get favoriteDescription =>
      'ستاسو پوښتنې به دې ستورپوه ته لومړیتوب ورکړل شي. که شتون ونلري، نو بل وړ ستورپوه به ستاسو سره مرسته وکړي.';

  @override
  String get educationQualifications => 'تعلیم او وړتیاوې';

  @override
  String get aboutSection => 'په اړه';

  @override
  String get shareProfile => 'پروفایل شریک کړئ';

  @override
  String get loadingAstrologer => 'د ستورپوهنې توضیحات پورته کیږي...';

  @override
  String get failedToLoadAstrologer =>
      'د ستورپوهنې جزئیات بارولو کې پاتې راغلل';

  @override
  String get authenticationRequired => 'تصدیق اړین دی. مهرباني وکړئ ننوتل.';

  @override
  String securityCheckFailed(Object error) {
    return 'د امنیت معاینه ناکامه شوه: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name اوس ستاسو شخصي ستورپوه دی';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ د خوښې څخه $name لرې شو';
  }

  @override
  String get toggleFavoriteError => 'د خوښې حالت تازه کولو کې پاتې راغی';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 زده کړه: $education\n📜 وړتیا: $qualification\n⏳ تجربه: $experience';
  }

  @override
  String get notProvided => 'نه دی ورکړل شوی';

  @override
  String reviews(Object count) {
    return '($count بیاکتنې)';
  }

  @override
  String get specialties => 'ځانګړتیاوې';

  @override
  String get experience => 'تجربه';

  @override
  String get qualification => 'وړتوب';

  @override
  String get education => 'زده کړه';

  @override
  String get recoveryTips =>
      '• د دې معلوماتو سکرین شاټ واخلئ\n• په خوندي ځای کې یې وساتئ\n• له هیچا سره مه شریکوئ\n• دا به یوازې یو ځل وښودل شي';

  @override
  String get themeSettingsTitle => 'د موضوع ترتیبات';

  @override
  String get lightThemeLabel => 'رڼا';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'تیاره';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'سیسټم';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
