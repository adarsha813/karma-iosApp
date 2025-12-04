// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get notificationSettings => 'تنظیمات اعلان';

  @override
  String get privacySettings => 'تنظیمات حریم خصوصی';

  @override
  String get accountSettings => 'تنظیمات حساب';

  @override
  String get languageSettings => 'تنظیمات زبان';

  @override
  String get languageChanged => 'زبان تغییر کرد';

  @override
  String get existingUserButton => 'من یک کاربر موجود هستم';

  @override
  String get chooseCountryTitle => 'کشور را انتخاب کنید';

  @override
  String get yesText => 'بله';

  @override
  String get noText => 'خیر';

  @override
  String get appBarTitle => 'تنظیمات پروفایل';

  @override
  String get userIdLabel => 'شناسه کاربری *';

  @override
  String get nameLabel => 'نام';

  @override
  String get birthCountryLabel => 'کشور محل تولد';

  @override
  String get birthCityLabel => 'شهر محل تولد';

  @override
  String get countrySelectionTitle => 'کشور خود را انتخاب کنید';

  @override
  String get maleLabel => 'مرد';

  @override
  String get femaleLabel => 'زن';

  @override
  String get birthDateLabel => 'تاریخ تولد';

  @override
  String get birthDatePlaceholder => 'تاریخ تولد را انتخاب کنید';

  @override
  String get birthTimeLabel => 'زمان تولد';

  @override
  String get birthTimePlaceholder => 'انتخاب زمان تولد';

  @override
  String get saveProfileButton => 'ذخیره پروفایل';

  @override
  String get noCitiesFound => 'هیچ شهری یافت نشد';

  @override
  String cityPlaceholder(Object country) {
    return 'شهر را در $country وارد کنید';
  }

  @override
  String get countryFirstPlaceholder => 'ابتدا کشور را انتخاب کنید';

  @override
  String get versionHistoryTitle => 'تاریخچه نسخه';

  @override
  String get notSetText => 'تنظیم نشده';

  @override
  String nameHistory(Object name) {
    return 'نام: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'شهر: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'کشور: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'جنسیت: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'تاریخ تولد: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'زمان تولد: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'مکان: $latitude، $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'منطقه زمانی: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'وضعیت: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'به‌روزرسانی‌شده در $date';
  }

  @override
  String get userIdRequired => 'شناسه کاربری الزامی است';

  @override
  String get profileSaved => 'مشخصات با موفقیت ذخیره شد';

  @override
  String get saveFailed => 'ذخیره پروفایل ناموفق بود';

  @override
  String get errorPrefix => 'خطا:';

  @override
  String get onboardingChooseLanguage => 'زبان خود را انتخاب کنید';

  @override
  String get onboardingChooseLanguageDesc =>
      'برای ادامه، زبان مورد نظر خود را انتخاب کنید.';

  @override
  String get onboardingWhatIsAstrology => 'طالع بینی چیست؟';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'طالع بینی علم مطالعه اجرام آسمانی است...';

  @override
  String get onboardingWhyUseApp => 'چرا از این برنامه استفاده کنیم؟';

  @override
  String get onboardingWhyUseAppDesc =>
      'فال‌های شخصی‌سازی‌شده، پیش‌بینی‌های روزانه و راهنمایی برای تصمیم‌گیری‌های آگاهانه دریافت کنید.';

  @override
  String get onboardingHowToUse => 'چگونه از این برنامه استفاده کنیم؟';

  @override
  String get onboardingHowToUseDesc =>
      'به راحتی پیمایش کنید، فال روزانه را بررسی کنید و پروفایل خود را برای پیش‌بینی‌های دقیق مدیریت کنید.';

  @override
  String get onboardingGetStarted => 'شروع کنید';

  @override
  String get onboardingNewUser => 'کاربر جدید';

  @override
  String get onboardingExistingUser => 'کاربر فعلی';

  @override
  String get onboardingBack => 'برگشت';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get userIdNotFound =>
      'شناسه کاربری یافت نشد. لطفا وارد شوید یا نمایه خود را تنظیم کنید.';

  @override
  String get clearNotificationsTitle => 'پاک کردن اعلان‌ها';

  @override
  String get clearNotificationsMessage =>
      'آیا مطمئن هستید که می‌خواهید همه اعلان‌ها را پاک کنید؟';

  @override
  String get clearNotificationsSuccess => 'همه اعلان‌ها با موفقیت پاک شدند.';

  @override
  String get clearHoroscopeTitle => 'فال پاک';

  @override
  String get clearHoroscopeMessage =>
      'آیا مطمئن هستید که می‌خواهید داده‌های طالع بینی خود را پاک کنید؟';

  @override
  String get clearHoroscopeSuccess => 'فال با موفقیت پاک شد.';

  @override
  String get clearChatTitle => 'پاک کردن تاریخچه چت';

  @override
  String get clearChatMessage =>
      'آیا مطمئن هستید که می‌خواهید تمام تاریخچه چت خود را حذف کنید؟';

  @override
  String get clearChatLocal => 'چت به صورت محلی پاک شد.';

  @override
  String get deleteAccountTitle => 'حذف حساب کاربری';

  @override
  String get deleteAccountMessage =>
      'آیا از حذف حساب کاربری خود مطمئن هستید؟ با این کار تمام تاریخچه چت‌ها و اعلان‌های شما نیز پاک می‌شود.';

  @override
  String get deleteAccountSuccess => 'حساب کاربری و تمام اطلاعات شما حذف شد.';

  @override
  String get deleteAccountError => 'خطا در حذف حساب کاربری';

  @override
  String get logoutTitle => 'خروج';

  @override
  String get logoutMessage =>
      'آیا مطمئن هستید که می‌خواهید از سیستم خارج شوید؟';

  @override
  String get termsPrivacyTitle => 'شرایط و حریم خصوصی';

  @override
  String get privacyPolicyTitle => 'سیاست حفظ حریم خصوصی';

  @override
  String get termsConditionsTitle => 'شرایط و ضوابط';

  @override
  String get dataControlTitle => 'کنترل داده‌ها';

  @override
  String get cancelButton => 'لغو';

  @override
  String get confirmButton => 'تأیید';

  @override
  String get clearQuestionsSuccess => 'همه سوالات با موفقیت حذف شدند.';

  @override
  String get yoginiLabel => 'یوگینی';

  @override
  String get lordLabel => 'پروردگار';

  @override
  String get startLabel => 'شروع';

  @override
  String get recoverAccount => 'بازیابی حساب کاربری';

  @override
  String get endLabel => 'پایان';

  @override
  String get startDateLabel => 'تاریخ شروع';

  @override
  String get endDateLabel => 'تاریخ پایان';

  @override
  String get notAvailable => 'موجود نیست';

  @override
  String get noData => 'بدون داده';

  @override
  String get unknownError => 'خطای ناشناخته';

  @override
  String get retryButton => 'دوباره امتحان کنید';

  @override
  String get kundaliGeneratorTitle => 'ژنراتور کندالی';

  @override
  String get natalChartTitle => 'نمودار تولد';

  @override
  String get lagnaLabel => 'لاگنا';

  @override
  String get rashiLabel => 'راشی';

  @override
  String get ascDegreeLabel => 'درجه صعودی';

  @override
  String get vimshottariDashaTitle => 'ویمشوتاری داشا';

  @override
  String get yoginiDashaTitle => 'یوگینی داشا';

  @override
  String get unknown => 'ناشناخته';

  @override
  String get clearHoroscope => 'فال پاک';

  @override
  String get clearNotifications => 'پاک کردن اعلان‌ها';

  @override
  String get clearChatHistory => 'پاک کردن تاریخچه چت';

  @override
  String get logout => 'خروج';

  @override
  String get deleteAccount => 'حذف حساب کاربری';

  @override
  String get allFieldsRequired => 'همه فیلدها الزامی هستند.';

  @override
  String get accountRecoveredSuccess => 'حساب کاربری با موفقیت بازیابی شد.';

  @override
  String get recoveryFailed => 'بازیابی ناموفق بود. اطلاعات خود را بررسی کنید.';

  @override
  String get recoverySecretLabel => 'راز بهبودی:';

  @override
  String get aboutUsTitle => 'درباره ما';

  @override
  String get aboutOurCompany => 'درباره شرکت ما';

  @override
  String get aboutCompanyDescription =>
      'در کارما، ما به شما کمک می‌کنیم تا مسیر واقعی زندگی خود را از طریق خرد جاودانه طالع بینی ودایی کشف کنید. هر بینشی از طالع‌بینان واقعی و باتجربه ناشی می‌شود که با دقت بر اساس نمودار تولد منحصر به فرد شما تهیه شده‌اند. از طالع بینی روزانه گرفته تا راهنمایی‌های شخصی، کارما دانش باستانی را به بیش از ۱۰۰ زبان در دسترس قرار می‌دهد.';

  @override
  String get ourMission => 'ماموریت ما';

  @override
  String get missionDescription =>
      'ماموریت ما ساده است: ارائه راهنمایی‌های طالع‌بینی معتبر و مبتنی بر انسان که شما را قادر می‌سازد تصمیمات مطمئن و آگاهانه‌ای بگیرید. هر پیش‌بینی و مشاوره نشان دهنده سال‌ها تخصص حرفه‌ای است، نه الگوریتم‌های خودکار.';

  @override
  String get ourVision => 'دیدگاه ما';

  @override
  String get visionDescription =>
      'ما تلاش می‌کنیم تا معتبرترین پلتفرم جهان برای طالع بینی ودایی باشیم و به مردم در همه جا کمک کنیم تا خود، انتخاب‌هایشان و سفر زندگی‌شان را با وضوح و اطمینان درک کنند.';

  @override
  String get ourValues => 'ارزش‌های ما';

  @override
  String get valuesDescription =>
      'در کارما، ما برای اصالت، دقت و اعتماد ارزش قائلیم. ما متعهد به ارائه راهنمایی‌هایی هستیم که نه تنها دقیق، بلکه معنادار نیز باشند و به شما کمک کنند تا با بینش و اعتماد به نفس در زندگی خود حرکت کنید.';

  @override
  String get contactUs => 'تماس با ما';

  @override
  String get contactEmail => 'ایمیل: support@yourcompany.com';

  @override
  String get contactWebsite => 'وب‌سایت: www.yourcompany.com';

  @override
  String get customerSupport => 'پشتیبانی مشتری';

  @override
  String get supportHeroTitle => 'ما اینجا هستیم تا کمک کنیم';

  @override
  String get supportHeroDescription =>
      'فرم زیر را پر کنید، تیم پشتیبانی ما در اسرع وقت با شما تماس خواهد گرفت.';

  @override
  String get yourName => 'نام شما';

  @override
  String get yourEmail => 'ایمیل شما';

  @override
  String get message => 'پیام';

  @override
  String get enterEmail => 'ایمیل خود را وارد کنید';

  @override
  String get enterValidEmail => 'یک آدرس ایمیل معتبر وارد کنید';

  @override
  String enterField(Object fieldName) {
    return '$fieldName را وارد کنید';
  }

  @override
  String get send => 'ارسال';

  @override
  String get sending => 'در حال ارسال...';

  @override
  String get emailSentSuccess => '✅ ایمیل با موفقیت ارسال شد!';

  @override
  String get emailSendFailed => '❌ ارسال ایمیل ناموفق بود';

  @override
  String get astroDictionaryTitle => 'فرهنگ لغت آسترو';

  @override
  String get searchTermsHint => 'عبارات جستجو ...';

  @override
  String get noTermsFound => 'هیچ اصطلاحی یافت نشد';

  @override
  String get buyQuestionsTitle => 'سوالات خرید';

  @override
  String get userNotAuthenticated => 'کاربر احراز هویت نشده است';

  @override
  String get loadStoreDataFailed => 'بارگیری داده‌های فروشگاه ناموفق بود';

  @override
  String get missingAuthToken => 'توکن احراز هویت وجود ندارد';

  @override
  String get merchantDisplayName => 'اپلیکیشن چت آسترو';

  @override
  String get paymentSuccessful => '✅ پرداخت با موفقیت انجام شد! سوال ارسال شد';

  @override
  String paymentFailed(Object error) {
    return '❌ پرداخت ناموفق بود: $error';
  }

  @override
  String get yourBalance => 'موجودی شما';

  @override
  String questionsBalance(Object count) {
    return '$count سوالات';
  }

  @override
  String get availableOffers => 'پیشنهادات موجود';

  @override
  String questionsCount(Object count) {
    return '$count سوال';
  }

  @override
  String get buyButton => 'خرید';

  @override
  String get dailyHoroscopeTitle => '🌟 فال روزانه';

  @override
  String get userIdMissing => 'شناسه کاربری موجود نیست';

  @override
  String get fetchHoroscopesFailed => 'دریافت فال ناموفق بود';

  @override
  String get noHoroscopeFound => 'طالع بینی پیدا نشد.';

  @override
  String get signLabel => 'علامت';

  @override
  String get todayLabel => 'امروز';

  @override
  String get yesterdayLabel => 'دیروز';

  @override
  String get thisWeekLabel => 'این هفته';

  @override
  String get lastMonthLabel => 'ماه گذشته';

  @override
  String get chatTitle => 'چت';

  @override
  String get typeYourQuestionHint => 'سوال خود را تایپ کنید...';

  @override
  String get paymentRequired => 'پرداخت مورد نیاز';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'شما از سوالات رایگان خود استفاده کردید. برای ادامه، مبلغ $amount را پرداخت کنید.';
  }

  @override
  String get payNowButton => 'همین حالا پرداخت کنید';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count سوالات رایگان باقی مانده';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count سوالات پولی باقی مانده';
  }

  @override
  String get thankYouFeedback => 'از بازخورد شما متشکرم!';

  @override
  String get ratingSubmitted => 'امتیاز ارسال شد!';

  @override
  String get setUserIdFirst => 'لطفا ابتدا شناسه کاربری خود را تنظیم کنید';

  @override
  String get failedToFetchPrevious =>
      'نتوانستم سوالات و پاسخ‌های قبلی را دریافت کنم';

  @override
  String errorOccurred(Object error) {
    return 'خطا: $error';
  }

  @override
  String get drawerAstroProfile => 'پروفایل آسترو';

  @override
  String get drawerDailyHoroscope => 'فال روزانه';

  @override
  String get drawerBuyQuestions => 'سوالات خرید';

  @override
  String get drawerAstroDictionary => 'فرهنگ لغت آسترو';

  @override
  String get drawerSettings => 'تنظیمات';

  @override
  String get drawerCustomerSupport => 'پشتیبانی مشتری';

  @override
  String get drawerAbout => 'درباره';

  @override
  String get drawerProfileSettings => 'تنظیمات پروفایل';

  @override
  String get demoNotificationTitle => '🔔 اطلاع رسانی نسخه آزمایشی';

  @override
  String get demoNotificationBody => 'این یک اعلان آزمایشی از برنامه شماست!';

  @override
  String get notificationsTitle => 'اعلان‌ها';

  @override
  String get noNotifications => 'بدون اعلان';

  @override
  String get allTab => 'همه';

  @override
  String get markAllAsRead => 'علامت گذاری همه به عنوان خوانده شده';

  @override
  String get notificationMarkedRead =>
      'اعلان علامت‌گذاری شده به عنوان خوانده شده';

  @override
  String get failedToLoadNotifications => 'بارگیری اعلان‌ها ناموفق بود';

  @override
  String get failedToMarkRead => 'علامت‌گذاری به عنوان خوانده‌شده ناموفق بود';

  @override
  String get failedToMarkAllRead =>
      'علامت‌گذاری همه به عنوان خوانده شده ناموفق بود';

  @override
  String get socketConnected => 'سوکت متصل است';

  @override
  String get socketDisconnected => 'سوکت قطع شده است';

  @override
  String get newNotificationReceived => 'اطلاعیه جدید دریافت شد';

  @override
  String get generalCategory => 'عمومی';

  @override
  String get horoscopeCategory => 'فال و طالع بینی';

  @override
  String get chatCategory => 'چت';

  @override
  String get systemCategory => 'سیستم';

  @override
  String get updateCategory => 'به‌روزرسانی‌ها';

  @override
  String get howToAskTitle => 'چگونه بپرسیم';

  @override
  String get noQuestionsAvailable => 'هیچ سوالی موجود نیست';

  @override
  String get failedToLoadQuestions => 'بارگیری سوالات ناموفق بود';

  @override
  String get pullToRefresh => 'برای تازه کردن بکشید';

  @override
  String get careerCategory => 'شغل';

  @override
  String get loveCategory => 'عشق و روابط';

  @override
  String get healthCategory => 'سلامت';

  @override
  String get financeCategory => 'امور مالی';

  @override
  String get familyCategory => 'خانواده';

  @override
  String get educationCategory => 'آموزش';

  @override
  String get travelCategory => 'سفر';

  @override
  String get spiritualCategory => 'معنوی';

  @override
  String get profileLoaded => 'نمایه با موفقیت بارگذاری شد';

  @override
  String get imageUploaded => 'تصویر با موفقیت آپلود شد';

  @override
  String get savedInformationConfirmation => 'من این اطلاعات را ذخیره کرده‌ام';

  @override
  String get noHistoryAvailable => 'سابقه ای موجود نیست';

  @override
  String get missingUserIdError => 'شناسه کاربری الزامی است';

  @override
  String get networkError => 'خطای شبکه. لطفا دوباره امتحان کنید.';

  @override
  String get timeoutError => 'مهلت درخواست تمام شد';

  @override
  String get genericError => 'چیزی اشتباه پیش رفت';

  @override
  String get reactionUpdateError => 'به‌روزرسانی واکنش انجام نشد';

  @override
  String get noSearchResults => 'هیچ نتیجه‌ای برای جستجو یافت نشد';

  @override
  String get clearSearch => 'پاک کردن جستجو';

  @override
  String get resultsFound => 'نتایج یافت شد';

  @override
  String get recoverySecretHint => 'کپی پیست ممکن است کار نکند، دستی تایپ کنید';

  @override
  String get recoverAccountDescription =>
      'برای بازیابی حساب کاربری خود این مراحل را دنبال کنید';

  @override
  String get processingLabel => 'در حال پردازش...';

  @override
  String get clearChatSuccess => 'چت با موفقیت پاک شد';

  @override
  String get notificationsEnabled => 'اعلان‌ها فعال شدند';

  @override
  String get notificationsDisabled => 'اعلان‌ها غیرفعال شدند';

  @override
  String get securityNotice =>
      'داده‌های شما به صورت امن رمزگذاری و ذخیره می‌شوند';

  @override
  String get loading => 'در حال بارگذاری...';

  @override
  String get selectLanguage => 'انتخاب زبان';

  @override
  String get onboardingGetStartedDesc => 'با انتخاب زبان خود شروع کنید';

  @override
  String get accountRecoveryTitle => '🔐 جزئیات بازیابی حساب';

  @override
  String get recoveryInstructions =>
      'لطفاً این اطلاعات را در جای امنی ذخیره کنید. برای بازیابی حساب کاربری خود به آن نیاز خواهید داشت.';

  @override
  String get importantNotice => '⚠️ نکته مهم:';

  @override
  String get astrologerProfileTitle => 'پروفایل ستاره شناس';

  @override
  String get personalAstrologer => 'ستاره‌شناس شخصی';

  @override
  String get makePersonalAstrologer => 'ستاره شناس شخصی بسازید';

  @override
  String get favoriteDescription =>
      'سوالات شما با اولویت به این منجم ارجاع داده خواهد شد. در صورت عدم دسترسی، یک منجم واجد شرایط دیگر به شما کمک خواهد کرد.';

  @override
  String get educationQualifications => 'تحصیلات و مدارک تحصیلی';

  @override
  String get aboutSection => 'درباره';

  @override
  String get shareProfile => 'اشتراک‌گذاری پروفایل';

  @override
  String get loadingAstrologer => 'در حال بارگذاری جزئیات اخترشناس...';

  @override
  String get failedToLoadAstrologer => 'جزئیات اخترشناس بارگیری نشد';

  @override
  String get authenticationRequired => 'احراز هویت لازم است. لطفا وارد شوید.';

  @override
  String securityCheckFailed(Object error) {
    return 'بررسی امنیتی ناموفق بود: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name اکنون ستاره‌شناس شخصی شماست';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name از موارد دلخواه حذف شد';
  }

  @override
  String get toggleFavoriteError => 'به‌روزرسانی وضعیت مورد علاقه ناموفق بود';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 تحصیلات: $education\n📜 مدرک تحصیلی: $qualification\n⏳ سابقه کار: $experience';
  }

  @override
  String get notProvided => 'ارائه نشده است';

  @override
  String reviews(Object count) {
    return '($count نقد و بررسی‌ها)';
  }

  @override
  String get specialties => 'تخصص‌ها';

  @override
  String get experience => 'تجربه';

  @override
  String get qualification => 'صلاحیت';

  @override
  String get education => 'آموزش';

  @override
  String get recoveryTips =>
      '• از این اطلاعات اسکرین شات بگیرید\n• آن را در جای امنی ذخیره کنید\n• با کسی به اشتراک نگذارید\n• این فقط یک بار نمایش داده می‌شود';

  @override
  String get themeSettingsTitle => 'تنظیمات قالب';

  @override
  String get lightThemeLabel => 'نور';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'تیره';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'سیستم';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'تیم ما';

  @override
  String get teamDescription =>
      'تیم ما از ستاره‌شناسان حرفه‌ای ودایی، سال‌ها تجربه در تفسیر تأثیرات سیارات و الگوهای زندگی را به ارمغان می‌آورند. کارما با پشتیبانی یک تیم پشتیبانی و توسعه اختصاصی، یک تجربه یکپارچه، قابل اعتماد و جهانی را برای هر کاربر ارائه می‌دهد.';
}
