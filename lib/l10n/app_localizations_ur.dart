// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get notificationSettings => 'اطلاع کی ترتیبات';

  @override
  String get privacySettings => 'رازداری کی ترتیبات';

  @override
  String get accountSettings => 'اکاؤنٹ کی ترتیبات';

  @override
  String get languageSettings => 'زبان کی ترتیبات';

  @override
  String get languageChanged => 'زبان بدل گئی۔';

  @override
  String get existingUserButton => 'میں ایک موجودہ صارف ہوں۔';

  @override
  String get chooseCountryTitle => 'ملک کا انتخاب کریں۔';

  @override
  String get yesText => 'جی ہاں';

  @override
  String get noText => 'نہیں';

  @override
  String get appBarTitle => 'پروفائل کی ترتیبات';

  @override
  String get userIdLabel => 'یوزر آئی ڈی *';

  @override
  String get nameLabel => 'نام';

  @override
  String get birthCountryLabel => 'ملک پیدائش';

  @override
  String get birthCityLabel => 'پیدائش کا شہر';

  @override
  String get countrySelectionTitle => 'اپنا ملک منتخب کریں۔';

  @override
  String get maleLabel => 'مرد';

  @override
  String get femaleLabel => 'خاتون';

  @override
  String get birthDateLabel => 'تاریخ پیدائش';

  @override
  String get birthDatePlaceholder => 'تاریخ پیدائش منتخب کریں۔';

  @override
  String get birthTimeLabel => 'پیدائش کا وقت';

  @override
  String get birthTimePlaceholder => 'پیدائش کا وقت منتخب کریں۔';

  @override
  String get saveProfileButton => 'پروفائل محفوظ کریں۔';

  @override
  String get noCitiesFound => 'کوئی شہر نہیں ملا';

  @override
  String cityPlaceholder(Object country) {
    return '$country میں شہر درج کریں۔';
  }

  @override
  String get countryFirstPlaceholder => 'پہلے ملک کا انتخاب کریں۔';

  @override
  String get versionHistoryTitle => 'ورژن کی تاریخ';

  @override
  String get notSetText => 'سیٹ نہیں ہے۔';

  @override
  String nameHistory(Object name) {
    return 'نام: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'شہر: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ملک: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'صنف: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'تاریخ پیدائش: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'پیدائش کا وقت: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'مقام: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ٹائم زون: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ریاست: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date کو اپ ڈیٹ کیا گیا۔';
  }

  @override
  String get userIdRequired => 'یوزر آئی ڈی درکار ہے۔';

  @override
  String get profileSaved => 'پروفائل کامیابی کے ساتھ محفوظ ہو گیا۔';

  @override
  String get saveFailed => 'پروفائل محفوظ کرنے میں ناکام';

  @override
  String get errorPrefix => 'خرابی:';

  @override
  String get onboardingChooseLanguage => 'اپنی زبان کا انتخاب کریں۔';

  @override
  String get onboardingChooseLanguageDesc =>
      'جاری رکھنے کے لیے اپنی پسند کی زبان منتخب کریں۔';

  @override
  String get onboardingWhatIsAstrology => 'علم نجوم کیا ہے؟';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'علم نجوم آسمانی حرکات اور انسانی زندگی پر ان کے اثرات کا قدیم مطالعہ ہے، جو شخصیت، رشتوں اور زندگی کے واقعات کے بارے میں بصیرت پیش کرتا ہے۔';

  @override
  String get onboardingWhyUseApp => 'یہ ایپ کیوں استعمال کریں؟';

  @override
  String get onboardingWhyUseAppDesc =>
      'اپنے پیدائشی چارٹ کے مطابق درست، انسانی پیدا کردہ زائچہ اور رہنمائی حاصل کریں۔ روزانہ کی پیشین گوئیوں اور تجربہ کار نجومیوں کے ذاتی مشورے کے ساتھ باخبر فیصلے کریں۔';

  @override
  String get onboardingHowToUse => 'اس ایپ کو کیسے استعمال کریں؟';

  @override
  String get onboardingHowToUseDesc =>
      'فوری طور پر شروع کرنے کے لیے بس اپنی تاریخ پیدائش، صحیح وقت، جائے پیدائش، اور کوئی دوسری متعلقہ تفصیلات درج کریں۔ روزانہ کی زائچہ دریافت کریں، ماہر نجومیوں سے سوالات پوچھیں، اور درست، ذاتی نوعیت کی پیشین گوئیوں کے لیے اپنے پروفائل کا نظم کریں — لاگ ان کی ضرورت نہیں۔';

  @override
  String get onboardingGetStarted => 'شروع کریں';

  @override
  String get onboardingNewUser => 'نیا صارف';

  @override
  String get onboardingExistingUser => 'موجودہ صارف';

  @override
  String get onboardingBack => 'پیچھے';

  @override
  String get onboardingNext => 'اگلا';

  @override
  String get userIdNotFound =>
      'یوزر آئی ڈی نہیں ملی۔ براہ کرم لاگ ان کریں یا اپنا پروفائل سیٹ کریں۔';

  @override
  String get clearNotificationsTitle => 'اطلاعات کو صاف کریں۔';

  @override
  String get clearNotificationsMessage =>
      'کیا آپ واقعی تمام اطلاعات کو صاف کرنا چاہتے ہیں؟';

  @override
  String get clearNotificationsSuccess =>
      'تمام اطلاعات کامیابی سے صاف ہو گئیں۔';

  @override
  String get clearHoroscopeTitle => 'زائچہ صاف کریں۔';

  @override
  String get clearHoroscopeMessage =>
      'کیا آپ واقعی اپنے زائچہ کا ڈیٹا صاف کرنا چاہتے ہیں؟';

  @override
  String get clearHoroscopeSuccess => 'زائچہ کامیابی سے صاف ہو گیا۔';

  @override
  String get clearChatTitle => 'چیٹ کی سرگزشت صاف کریں۔';

  @override
  String get clearChatMessage =>
      'کیا آپ واقعی اپنی تمام چیٹ کی سرگزشت کو حذف کرنا چاہتے ہیں؟';

  @override
  String get clearChatLocal => 'چیٹ مقامی طور پر صاف ہو گئی۔';

  @override
  String get deleteAccountTitle => 'اکاؤنٹ حذف کریں۔';

  @override
  String get deleteAccountMessage =>
      'کیا آپ واقعی اپنا اکاؤنٹ حذف کرنا چاہتے ہیں؟ اس سے آپ کی تمام چیٹ کی سرگزشت اور اطلاعات بھی صاف ہو جائیں گی۔';

  @override
  String get deleteAccountSuccess =>
      'آپ کا اکاؤنٹ اور تمام ڈیٹا ہٹا دیا گیا ہے۔';

  @override
  String get deleteAccountError => 'اکاؤنٹ حذف کرنے میں خرابی۔';

  @override
  String get logoutTitle => 'لاگ آؤٹ';

  @override
  String get logoutMessage => 'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟';

  @override
  String get termsPrivacyTitle => 'شرائط اور رازداری';

  @override
  String get privacyPolicyTitle => 'رازداری کی پالیسی';

  @override
  String get termsConditionsTitle => 'شرائط و ضوابط';

  @override
  String get dataControlTitle => 'ڈیٹا کنٹرول';

  @override
  String get cancelButton => 'منسوخ کریں۔';

  @override
  String get confirmButton => 'تصدیق کریں۔';

  @override
  String get clearQuestionsSuccess => 'تمام سوالات کامیابی کے ساتھ حذف ہو گئے۔';

  @override
  String get yoginiLabel => 'یوگنی';

  @override
  String get lordLabel => 'رب';

  @override
  String get startLabel => 'شروع کریں۔';

  @override
  String get recoverAccount => 'اکاؤنٹ بازیافت کریں۔';

  @override
  String get endLabel => 'ختم';

  @override
  String get startDateLabel => 'آغاز کی تاریخ';

  @override
  String get endDateLabel => 'اختتامی تاریخ';

  @override
  String get notAvailable => 'دستیاب نہیں۔';

  @override
  String get noData => 'کوئی ڈیٹا نہیں۔';

  @override
  String get unknownError => 'نامعلوم خرابی۔';

  @override
  String get retryButton => 'دوبارہ کوشش کریں۔';

  @override
  String get kundaliGeneratorTitle => 'کنڈلی جنریٹر';

  @override
  String get natalChartTitle => 'نٹل چارٹ';

  @override
  String get lagnaLabel => 'لگنا';

  @override
  String get rashiLabel => 'راشی';

  @override
  String get ascDegreeLabel => 'عروج کی ڈگری';

  @override
  String get vimshottariDashaTitle => 'ویمشوتری دشا';

  @override
  String get yoginiDashaTitle => 'یوگنی دشا';

  @override
  String get unknown => 'نامعلوم';

  @override
  String get clearHoroscope => 'زائچہ صاف کریں۔';

  @override
  String get clearNotifications => 'اطلاعات کو صاف کریں۔';

  @override
  String get clearChatHistory => 'چیٹ کی سرگزشت صاف کریں۔';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get deleteAccount => 'اکاؤنٹ حذف کریں۔';

  @override
  String get allFieldsRequired => 'تمام فیلڈز درکار ہیں۔';

  @override
  String get accountRecoveredSuccess => 'اکاؤنٹ کامیابی کے ساتھ بحال ہو گیا۔';

  @override
  String get recoveryFailed => 'بازیابی ناکام ہوگئی۔ اپنی معلومات چیک کریں۔';

  @override
  String get recoverySecretLabel => 'بازیابی کا راز:';

  @override
  String get aboutUsTitle => 'ہمارے بارے میں';

  @override
  String get aboutOurCompany => 'ہماری کمپنی کے بارے میں';

  @override
  String get aboutCompanyDescription =>
      'کرما میں، ہم آپ کو ویدک علم نجوم کی لازوال حکمت کے ذریعے آپ کی زندگی کے حقیقی راستے سے پردہ اٹھانے میں مدد کرتے ہیں۔ ہر بصیرت حقیقی، تجربہ کار نجومیوں سے آتی ہے، جو آپ کے منفرد پیدائشی چارٹ کی بنیاد پر احتیاط سے تیار کی گئی ہے۔ روزانہ زائچہ سے لے کر ذاتی رہنمائی تک، کرما قدیم علم کو 100 سے زیادہ زبانوں میں قابل رسائی بناتا ہے۔';

  @override
  String get ourMission => 'ہمارا مشن';

  @override
  String get missionDescription =>
      'ہمارا مشن بہت آسان ہے: مستند، انسانی قیادت میں علم نجوم کی رہنمائی فراہم کرنا جو آپ کو بااعتماد، باخبر فیصلے کرنے کی طاقت دیتی ہے۔ ہر پیشین گوئی اور مشاورت سالوں کی پیشہ ورانہ مہارت کی عکاسی کرتی ہے، خودکار الگورتھم نہیں۔';

  @override
  String get ourVision => 'ہمارا وژن';

  @override
  String get visionDescription =>
      'ہم ویدک علم نجوم کے لیے دنیا کا سب سے بھروسہ مند پلیٹ فارم بننے کی کوشش کرتے ہیں، ہر جگہ لوگوں کو خود کو، ان کے انتخاب، اور ان کی زندگی کے سفر کو واضح اور اعتماد کے ساتھ سمجھنے میں مدد کرتے ہیں۔';

  @override
  String get ourValues => 'ہماری اقدار';

  @override
  String get valuesDescription =>
      'کرما میں، ہم صداقت، درستگی اور اعتماد کی قدر کرتے ہیں۔ ہم رہنمائی پیش کرنے کے لیے پرعزم ہیں جو نہ صرف درست ہے بلکہ بامعنی بھی ہے، جو آپ کو بصیرت اور اعتماد کے ساتھ زندگی میں تشریف لانے میں مدد کرتی ہے۔';

  @override
  String get contactUs => 'ہم سے رابطہ کریں۔';

  @override
  String get contactEmail => 'ای میل: care@karmalifepath.com';

  @override
  String get contactWebsite => 'ویب سائٹ: www.karmalifepath.com';

  @override
  String get customerSupport => 'کسٹمر سپورٹ';

  @override
  String get supportHeroTitle => 'ہم مدد کے لیے حاضر ہیں۔';

  @override
  String get supportHeroDescription =>
      'نیچے دیئے گئے فارم کو پُر کریں اور ہماری سپورٹ ٹیم جلد از جلد آپ سے رابطہ کرے گی۔';

  @override
  String get yourName => 'آپ کا نام';

  @override
  String get yourEmail => 'آپ کا ای میل';

  @override
  String get message => 'پیغام';

  @override
  String get enterEmail => 'اپنا ای میل درج کریں۔';

  @override
  String get enterValidEmail => 'ایک درست ای میل ایڈریس درج کریں۔';

  @override
  String enterField(Object fieldName) {
    return '$fieldName درج کریں۔';
  }

  @override
  String get send => 'بھیجیں۔';

  @override
  String get sending => 'بھیج رہا ہے...';

  @override
  String get emailSentSuccess => '✅ ای میل کامیابی کے ساتھ بھیج دیا گیا!';

  @override
  String get emailSendFailed => '❌ ای میل بھیجنے میں ناکام';

  @override
  String get astroDictionaryTitle => 'آسٹرو ڈکشنری';

  @override
  String get searchTermsHint => 'تلاش کی اصطلاحات...';

  @override
  String get noTermsFound => 'کوئی شرائط نہیں ملیں۔';

  @override
  String get buyQuestionsTitle => 'سوالات خریدیں۔';

  @override
  String get userNotAuthenticated => 'صارف کی توثیق نہیں ہوئی۔';

  @override
  String get loadStoreDataFailed => 'اسٹور ڈیٹا لوڈ کرنے میں ناکام';

  @override
  String get missingAuthToken => 'گمشدہ توثیق ٹوکن';

  @override
  String get merchantDisplayName => 'ایسٹرو چیٹ ایپ';

  @override
  String get paymentSuccessful => '✅ ادائیگی کامیاب! سوال بھیجا گیا۔';

  @override
  String paymentFailed(Object error) {
    return '❌ ادائیگی ناکام ہو گئی: $error';
  }

  @override
  String get yourBalance => 'آپ کا بیلنس';

  @override
  String questionsBalance(Object count) {
    return '$count سوالات';
  }

  @override
  String get availableOffers => 'دستیاب پیشکشیں';

  @override
  String questionsCount(Object count) {
    return '$count سوال';
  }

  @override
  String get buyButton => 'خریدیں۔';

  @override
  String get dailyHoroscopeTitle => ' یومیہ زائچہ';

  @override
  String get userIdMissing => 'یوزر آئی ڈی غائب ہے۔';

  @override
  String get fetchHoroscopesFailed => 'زائچہ حاصل کرنے میں ناکام';

  @override
  String get noHoroscopeFound => 'کوئی زائچہ نہیں ملا۔';

  @override
  String get signLabel => 'دستخط';

  @override
  String get todayLabel => 'آج';

  @override
  String get yesterdayLabel => 'کل';

  @override
  String get thisWeekLabel => 'اس ہفتے';

  @override
  String get lastMonthLabel => 'پچھلے مہینے';

  @override
  String get chatTitle => 'گپ شپ';

  @override
  String get typeYourQuestionHint => 'اپنا سوال ٹائپ کریں...';

  @override
  String get paymentRequired => 'ادائیگی کی ضرورت ہے۔';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'آپ نے اپنے مفت سوالات کا استعمال کیا ہے۔ جاری رکھنے کے لیے $amount ادا کریں۔';
  }

  @override
  String get payNowButton => 'ابھی ادائیگی کریں۔';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count مفت سوالات باقی ہیں۔';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count بامعاوضہ سوالات باقی ہیں۔';
  }

  @override
  String get thankYouFeedback => 'آپ کے تاثرات کا شکریہ!';

  @override
  String get ratingSubmitted => 'درجہ بندی جمع کرائی گئی!';

  @override
  String get setUserIdFirst => 'براہ کرم پہلے اپنا یوزر آئی ڈی سیٹ کریں۔';

  @override
  String get failedToFetchPrevious =>
      'پچھلے سوالات اور جوابات حاصل کرنے میں ناکام';

  @override
  String errorOccurred(Object error) {
    return 'خرابی: $error';
  }

  @override
  String get drawerAstroProfile => 'ایسٹرو پروفائل';

  @override
  String get drawerDailyHoroscope => 'روزانہ زائچہ';

  @override
  String get drawerBuyQuestions => 'سوالات خریدیں۔';

  @override
  String get drawerAstroDictionary => 'آسٹرو ڈکشنری';

  @override
  String get drawerSettings => 'ترتیبات';

  @override
  String get drawerCustomerSupport => 'کسٹمر سپورٹ';

  @override
  String get drawerAbout => 'کے بارے میں';

  @override
  String get drawerProfileSettings => 'پروفائل کی ترتیبات';

  @override
  String get demoNotificationTitle => '🔔 ڈیمو نوٹیفکیشن';

  @override
  String get demoNotificationBody => 'یہ آپ کی ایپ کی طرف سے ٹیسٹ کی اطلاع ہے!';

  @override
  String get notificationsTitle => 'اطلاعات';

  @override
  String get noNotifications => 'کوئی اطلاع نہیں۔';

  @override
  String get allTab => 'تمام';

  @override
  String get markAllAsRead => 'سبھی کو پڑھا ہوا نشان زد کریں۔';

  @override
  String get notificationMarkedRead =>
      'اطلاع کو پڑھا ہوا کے بطور نشان زد کیا گیا۔';

  @override
  String get failedToLoadNotifications => 'اطلاعات لوڈ کرنے میں ناکام';

  @override
  String get failedToMarkRead => 'پڑھا ہوا کے بطور نشان زد کرنے میں ناکام';

  @override
  String get failedToMarkAllRead =>
      'سبھی کو پڑھا ہوا کے بطور نشان زد کرنے میں ناکام';

  @override
  String get socketConnected => 'ساکٹ منسلک ہے۔';

  @override
  String get socketDisconnected => 'ساکٹ منقطع ہو گیا۔';

  @override
  String get newNotificationReceived => 'نیا نوٹیفکیشن موصول ہوا۔';

  @override
  String get generalCategory => 'جنرل';

  @override
  String get horoscopeCategory => 'زائچہ';

  @override
  String get chatCategory => 'گپ شپ';

  @override
  String get systemCategory => 'سسٹم';

  @override
  String get updateCategory => 'اپڈیٹس';

  @override
  String get howToAskTitle => 'کیسے پوچھیں۔';

  @override
  String get noQuestionsAvailable => 'کوئی سوال دستیاب نہیں۔';

  @override
  String get failedToLoadQuestions => 'سوالات لوڈ کرنے میں ناکام';

  @override
  String get pullToRefresh => 'تازہ دم کرنے کے لیے کھینچیں۔';

  @override
  String get careerCategory => 'کیریئر';

  @override
  String get loveCategory => 'محبت اور رشتے';

  @override
  String get healthCategory => 'صحت';

  @override
  String get financeCategory => 'فنانس';

  @override
  String get familyCategory => 'خاندان';

  @override
  String get educationCategory => 'تعلیم';

  @override
  String get travelCategory => 'سفر';

  @override
  String get spiritualCategory => 'روحانی';

  @override
  String get profileLoaded => 'پروفائل کامیابی کے ساتھ لوڈ ہو گیا۔';

  @override
  String get imageUploaded => 'تصویر کامیابی کے ساتھ اپ لوڈ ہو گئی۔';

  @override
  String get savedInformationConfirmation =>
      'میں نے یہ معلومات محفوظ کر لی ہیں۔';

  @override
  String get noHistoryAvailable => 'کوئی تاریخ دستیاب نہیں ہے۔';

  @override
  String get missingUserIdError => 'یوزر آئی ڈی درکار ہے۔';

  @override
  String get networkError => 'نیٹ ورک کی خرابی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get timeoutError => 'درخواست کا وقت ختم ہو گیا۔';

  @override
  String get genericError => 'کچھ غلط ہو گیا۔';

  @override
  String get reactionUpdateError => 'ردعمل کو اپ ڈیٹ کرنے میں ناکام';

  @override
  String get noSearchResults => 'تلاش کے کوئی نتائج نہیں ملے';

  @override
  String get clearSearch => 'تلاش صاف کریں۔';

  @override
  String get resultsFound => 'نتائج ملے';

  @override
  String get recoverySecretHint =>
      'کاپی پیسٹ کام نہیں کر سکتا، دستی طور پر ٹائپ کریں۔';

  @override
  String get recoverAccountDescription =>
      'اپنا اکاؤنٹ بازیافت کرنے کے لیے ان اقدامات پر عمل کریں۔';

  @override
  String get processingLabel => 'پروسیسنگ...';

  @override
  String get clearChatSuccess => 'چیٹ کامیابی سے صاف ہو گئی۔';

  @override
  String get notificationsEnabled => 'اطلاعات فعال ہیں۔';

  @override
  String get notificationsDisabled => 'اطلاعات غیر فعال ہیں۔';

  @override
  String get securityNotice => 'آپ کا ڈیٹا محفوظ طریقے سے انکرپٹ اور محفوظ ہے۔';

  @override
  String get loading => 'لوڈ ہو رہا ہے...';

  @override
  String get selectLanguage => 'زبان منتخب کریں۔';

  @override
  String get onboardingGetStartedDesc =>
      'اپنی زبان کا انتخاب کرکے شروعات کریں۔';

  @override
  String get accountRecoveryTitle => '🔐 اکاؤنٹ کی بازیابی کی تفصیلات';

  @override
  String get recoveryInstructions =>
      'براہ کرم اس معلومات کو محفوظ طریقے سے محفوظ کریں۔ آپ کو اپنا اکاؤنٹ بحال کرنے کے لیے اس کی ضرورت ہوگی۔';

  @override
  String get importantNotice => '⚠️ اہم:';

  @override
  String get astrologerProfileTitle => 'نجومی پروفائل';

  @override
  String get personalAstrologer => 'ذاتی نجومی۔';

  @override
  String get makePersonalAstrologer => 'ذاتی نجومی بنائیں';

  @override
  String get favoriteDescription =>
      'آپ کے سوالات کو اس نجومی سے ترجیح دی جائے گی۔ اگر دستیاب نہ ہو تو کوئی اور مستند نجومی آپ کی مدد کرے گا۔';

  @override
  String get educationQualifications => 'تعلیم اور قابلیت';

  @override
  String get aboutSection => 'کے بارے میں';

  @override
  String get shareProfile => 'پروفائل شیئر کریں۔';

  @override
  String get loadingAstrologer => 'نجومی کی تفصیلات لوڈ ہو رہی ہیں...';

  @override
  String get failedToLoadAstrologer => 'نجومی کی تفصیلات لوڈ کرنے میں ناکام';

  @override
  String get authenticationRequired => 'توثیق درکار ہے۔ براہ کرم لاگ ان کریں۔';

  @override
  String securityCheckFailed(Object error) {
    return 'سیکیورٹی چیک ناکام: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name اب آپ کا ذاتی نجومی ہے';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ پسندیدہ سے $name کو ہٹا دیا گیا۔';
  }

  @override
  String get toggleFavoriteError => 'پسندیدہ اسٹیٹس کو اپ ڈیٹ کرنے میں ناکام';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 تعلیم: $education\n📜 اہلیت: $qualification\n⏳ تجربہ: $experience';
  }

  @override
  String get notProvided => 'فراہم نہیں کیا گیا۔';

  @override
  String reviews(Object count) {
    return '($count جائزے)';
  }

  @override
  String get specialties => 'خصوصیات';

  @override
  String get experience => 'تجربہ';

  @override
  String get qualification => 'قابلیت';

  @override
  String get education => 'تعلیم';

  @override
  String get recoveryTips =>
      '• اس معلومات کا اسکرین شاٹ لیں۔\n• اسے محفوظ جگہ پر ذخیرہ کریں۔\n• کسی کے ساتھ اشتراک نہ کریں۔\n• یہ صرف ایک بار دکھایا جائے گا۔';

  @override
  String get themeSettingsTitle => 'تھیم کی ترتیبات';

  @override
  String get lightThemeLabel => 'روشنی';

  @override
  String get lightThemeDescription => 'ہمیشہ ہلکی تھیم استعمال کریں۔';

  @override
  String get darkThemeLabel => 'اندھیرا';

  @override
  String get darkThemeDescription => 'ہمیشہ ڈارک تھیم استعمال کریں۔';

  @override
  String get systemThemeLabel => 'سسٹم';

  @override
  String get systemThemeDarkDescription =>
      'ڈارک تھیم کے لیے سسٹم سیٹنگ کو فالو کریں۔';

  @override
  String get systemThemeLightDescription =>
      'لائٹ تھیم کے لیے سسٹم سیٹنگ کو فالو کریں۔';

  @override
  String get switchToLight => 'لائٹ پر سوئچ کریں۔';

  @override
  String get switchToDark => 'تاریک پر سوئچ کریں۔';

  @override
  String get ourTeam => 'ہماری ٹیم';

  @override
  String get teamDescription =>
      'پیشہ ور ویدک نجومیوں کی ہماری ٹیم سیاروں کے اثرات اور زندگی کے نمونوں کی ترجمانی کرنے کا برسوں کا تجربہ لاتی ہے۔ ایک سرشار سپورٹ اور ڈیولپمنٹ ٹیم کے تعاون سے، کرما ہر صارف کے لیے ایک ہموار، قابل اعتماد، اور عالمی تجربہ فراہم کرتا ہے۔';
}
