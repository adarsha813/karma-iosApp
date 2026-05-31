// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get settingsTitle => 'إعدادات';

  @override
  String get notificationSettings => 'إعدادات الإشعارات';

  @override
  String get privacySettings => 'إعدادات الخصوصية';

  @override
  String get accountSettings => 'إعدادات الحساب';

  @override
  String get languageSettings => 'إعدادات اللغة';

  @override
  String get languageChanged => 'تم تغيير اللغة';

  @override
  String get existingUserButton => 'أنا مستخدم موجود';

  @override
  String get chooseCountryTitle => 'اختر البلد';

  @override
  String get yesText => 'نعم';

  @override
  String get noText => 'لا';

  @override
  String get appBarTitle => 'إعدادات الملف الشخصي';

  @override
  String get userIdLabel => 'معرف المستخدم *';

  @override
  String get nameLabel => 'اسم';

  @override
  String get birthCountryLabel => 'بلد الميلاد';

  @override
  String get birthCityLabel => 'مدينة الميلاد';

  @override
  String get countrySelectionTitle => 'اختر بلدك';

  @override
  String get maleLabel => 'ذكر';

  @override
  String get femaleLabel => 'أنثى';

  @override
  String get birthDateLabel => 'تاريخ الميلاد';

  @override
  String get birthDatePlaceholder => 'حدد تاريخ الميلاد';

  @override
  String get birthTimeLabel => 'وقت الميلاد';

  @override
  String get birthTimePlaceholder => 'حدد وقت الميلاد';

  @override
  String get saveProfileButton => 'حفظ الملف الشخصي';

  @override
  String get noCitiesFound => 'لم يتم العثور على مدن';

  @override
  String cityPlaceholder(Object country) {
    return 'أدخل المدينة في $country';
  }

  @override
  String get countryFirstPlaceholder => 'حدد البلد أولا';

  @override
  String get versionHistoryTitle => 'تاريخ الإصدار';

  @override
  String get notSetText => 'غير محدد';

  @override
  String nameHistory(Object name) {
    return 'الاسم: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'المدينة: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'البلد: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'الجنس: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'تاريخ الميلاد: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'وقت الميلاد: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'الموقع: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'المنطقة الزمنية: توقيت جرينتش$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'التوقيت الصيفي: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'الحالة: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'تم التحديث في $date';
  }

  @override
  String get userIdRequired => 'مطلوب معرف المستخدم';

  @override
  String get profileSaved => 'تم حفظ الملف الشخصي بنجاح';

  @override
  String get saveFailed => 'فشل في حفظ الملف الشخصي';

  @override
  String get errorPrefix => 'خطأ:';

  @override
  String get onboardingChooseLanguage => 'اختر لغتك';

  @override
  String get onboardingChooseLanguageDesc => 'حدد اللغة المفضلة لديك للمتابعة.';

  @override
  String get onboardingWhatIsAstrology => 'ما هو علم التنجيم؟';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'علم التنجيم هو الدراسة القديمة للحركات السماوية وتأثيرها على حياة الإنسان، ويقدم رؤى حول الشخصية والعلاقات وأحداث الحياة.';

  @override
  String get onboardingWhyUseApp => 'لماذا تستخدم هذا التطبيق؟';

  @override
  String get onboardingWhyUseAppDesc =>
      'احصل على أبراج دقيقة من إعداد بشري وإرشادات مُصممة خصيصًا لبرج ميلادك. اتخذ قرارات مدروسة مع توقعات يومية ونصائح شخصية من منجمين ذوي خبرة.';

  @override
  String get onboardingHowToUse => 'كيفية استخدام هذا التطبيق؟';

  @override
  String get onboardingHowToUseDesc =>
      'ما عليك سوى إدخال تاريخ ميلادك، والوقت المحدد، ومكان الميلاد، وأي تفاصيل أخرى ذات صلة للبدء فورًا. استكشف الأبراج اليومية، واطرح أسئلة على خبراء الفلك، وأدر ملفك الشخصي للحصول على تنبؤات دقيقة وشخصية - دون الحاجة إلى تسجيل الدخول.';

  @override
  String get onboardingGetStarted => 'البدء';

  @override
  String get onboardingNewUser => 'مستخدم جديد';

  @override
  String get onboardingExistingUser => 'المستخدم الحالي';

  @override
  String get onboardingBack => 'خلف';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get userIdNotFound =>
      'لم يتم العثور على مُعرّف المستخدم. يُرجى تسجيل الدخول أو إنشاء ملفك الشخصي.';

  @override
  String get clearNotificationsTitle => 'مسح الإشعارات';

  @override
  String get clearNotificationsMessage =>
      'هل أنت متأكد أنك تريد مسح كافة الإشعارات؟';

  @override
  String get clearNotificationsSuccess => 'تم مسح كافة الإشعارات بنجاح.';

  @override
  String get clearHoroscopeTitle => 'برجك الواضح';

  @override
  String get clearHoroscopeMessage => 'هل أنت متأكد أنك تريد مسح بيانات برجك؟';

  @override
  String get clearHoroscopeSuccess => 'تم مسح برجك بنجاح.';

  @override
  String get clearChatTitle => 'مسح سجل الدردشة';

  @override
  String get clearChatMessage =>
      'هل أنت متأكد أنك تريد حذف كافة محفوظات الدردشة الخاصة بك؟';

  @override
  String get clearChatLocal => 'تم مسح الدردشة محليًا.';

  @override
  String get deleteAccountTitle => 'حذف الحساب';

  @override
  String get deleteAccountMessage =>
      'هل أنت متأكد من رغبتك في حذف حسابك؟ سيؤدي هذا أيضًا إلى مسح جميع سجلات الدردشة والإشعارات.';

  @override
  String get deleteAccountSuccess => 'لقد تم إزالة حسابك وجميع البيانات.';

  @override
  String get deleteAccountError => 'خطأ في حذف الحساب';

  @override
  String get logoutTitle => 'تسجيل الخروج';

  @override
  String get logoutMessage => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get termsPrivacyTitle => 'الشروط والخصوصية';

  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';

  @override
  String get termsConditionsTitle => 'الشروط والأحكام';

  @override
  String get dataControlTitle => 'التحكم في البيانات';

  @override
  String get cancelButton => 'يلغي';

  @override
  String get confirmButton => 'يتأكد';

  @override
  String get clearQuestionsSuccess => 'تم حذف كافة الأسئلة بنجاح.';

  @override
  String get yoginiLabel => 'يوجيني';

  @override
  String get lordLabel => 'رب';

  @override
  String get startLabel => 'يبدأ';

  @override
  String get recoverAccount => 'استعادة الحساب';

  @override
  String get endLabel => 'نهاية';

  @override
  String get startDateLabel => 'تاريخ البدء';

  @override
  String get endDateLabel => 'تاريخ الانتهاء';

  @override
  String get notAvailable => 'غير متوفر';

  @override
  String get noData => 'لا يوجد بيانات';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get retryButton => 'إعادة المحاولة';

  @override
  String get kundaliGeneratorTitle => 'مولد كوندالي';

  @override
  String get natalChartTitle => 'مخطط الولادة';

  @override
  String get lagnaLabel => 'لاجنا';

  @override
  String get rashiLabel => 'راشي';

  @override
  String get ascDegreeLabel => 'الدرجة الصاعدة';

  @override
  String get vimshottariDashaTitle => 'فيمشوتاري داشا';

  @override
  String get yoginiDashaTitle => 'يوجيني داشا';

  @override
  String get unknown => 'مجهول';

  @override
  String get clearHoroscope => 'برجك الواضح';

  @override
  String get clearNotifications => 'مسح الإشعارات';

  @override
  String get clearChatHistory => 'مسح سجل الدردشة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get allFieldsRequired => 'جميع الحقول مطلوبة.';

  @override
  String get accountRecoveredSuccess => 'تم استرداد الحساب بنجاح.';

  @override
  String get recoveryFailed => 'فشل الاسترداد. تحقق من معلوماتك.';

  @override
  String get recoverySecretLabel => 'سر الاسترداد:';

  @override
  String get aboutUsTitle => 'معلومات عنا';

  @override
  String get aboutOurCompany => 'نبذة عن شركتنا';

  @override
  String get aboutCompanyDescription =>
      'في كارما، نساعدك على اكتشاف مسار حياتك الحقيقي من خلال الحكمة الخالدة لعلم التنجيم الفيدي. كل معلومة تأتي من منجمين حقيقيين ذوي خبرة، مصممة بعناية بناءً على برج ميلادك الفريد. من الأبراج اليومية إلى التوجيه الشخصي، تُتيح كارما المعرفة القديمة بأكثر من 100 لغة.';

  @override
  String get ourMission => 'مهمتنا';

  @override
  String get missionDescription =>
      'مهمتنا بسيطة: تقديم إرشاد فلكي موثوق، بقيادة بشرية، يُمكّنك من اتخاذ قرارات مدروسة وواثقة. كل تنبؤ واستشارات تعكس سنوات من الخبرة المهنية، لا خوارزميات آلية.';

  @override
  String get ourVision => 'رؤيتنا';

  @override
  String get visionDescription =>
      'نحن نسعى جاهدين لنكون المنصة الأكثر ثقة في العالم لعلم التنجيم الفيدي، ونساعد الناس في كل مكان على فهم أنفسهم وخياراتهم ورحلة حياتهم بوضوح وثقة.';

  @override
  String get ourValues => 'قيمنا';

  @override
  String get valuesDescription =>
      'في كارما، نُقدّر الأصالة والدقة والثقة. نلتزم بتقديم إرشادات دقيقة وذات معنى، تُساعدكم على خوض غمار الحياة ببصيرة وثقة.';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get contactEmail => 'البريد الإلكتروني: care@karmalifepath.com';

  @override
  String get contactWebsite => 'الموقع الإلكتروني: www.karmalifepath.com';

  @override
  String get customerSupport => 'دعم العملاء';

  @override
  String get supportHeroTitle => 'نحن هنا للمساعدة';

  @override
  String get supportHeroDescription =>
      'قم بملء النموذج أدناه وسيقوم فريق الدعم الخاص بنا بالتواصل معك في أقرب وقت ممكن.';

  @override
  String get yourName => 'اسمك';

  @override
  String get yourEmail => 'بريدك الإلكتروني';

  @override
  String get message => 'رسالة';

  @override
  String get enterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterValidEmail => 'أدخل عنوان بريد إلكتروني صالح';

  @override
  String enterField(Object fieldName) {
    return 'أدخل $fieldName';
  }

  @override
  String get send => 'يرسل';

  @override
  String get sending => 'إرسال...';

  @override
  String get emailSentSuccess => '✅ تم إرسال البريد الإلكتروني بنجاح!';

  @override
  String get emailSendFailed => '❌فشل في إرسال البريد الإلكتروني';

  @override
  String get astroDictionaryTitle => 'قاموس الفلك';

  @override
  String get searchTermsHint => 'مصطلحات البحث...';

  @override
  String get noTermsFound => 'لم يتم العثور على أي مصطلحات';

  @override
  String get buyQuestionsTitle => 'أسئلة الشراء';

  @override
  String get userNotAuthenticated => 'المستخدم غير مُصادق عليه';

  @override
  String get loadStoreDataFailed => 'فشل تحميل بيانات المتجر';

  @override
  String get missingAuthToken => 'رمز المصادقة مفقود';

  @override
  String get merchantDisplayName => 'تطبيق الدردشة الفلكية';

  @override
  String get paymentSuccessful => '✅ تم الدفع بنجاح! تم إرسال السؤال';

  @override
  String paymentFailed(Object error) {
    return '❌ فشل الدفع: $error';
  }

  @override
  String get yourBalance => 'رصيدك';

  @override
  String questionsBalance(Object count) {
    return '$count الأسئلة';
  }

  @override
  String get availableOffers => 'العروض المتاحة';

  @override
  String questionsCount(Object count) {
    return '$count سؤال';
  }

  @override
  String get buyButton => 'يشتري';

  @override
  String get dailyHoroscopeTitle => ' برجك اليومي';

  @override
  String get userIdMissing => 'معرف المستخدم مفقود';

  @override
  String get fetchHoroscopesFailed => 'فشل في جلب الأبراج';

  @override
  String get noHoroscopeFound => 'لم يتم العثور على برجك.';

  @override
  String get signLabel => 'لافتة';

  @override
  String get todayLabel => 'اليوم';

  @override
  String get yesterdayLabel => 'أمس';

  @override
  String get thisWeekLabel => 'هذا الاسبوع';

  @override
  String get lastMonthLabel => 'الشهر الماضي';

  @override
  String get chatTitle => 'محادثة';

  @override
  String get typeYourQuestionHint => 'اكتب سؤالك...';

  @override
  String get paymentRequired => 'الدفع مطلوب';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'لقد استخدمت أسئلتك المجانية. ادفع $amount للمتابعة.';
  }

  @override
  String get payNowButton => 'ادفع الآن';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count الأسئلة المجانية المتبقية';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count الأسئلة المدفوعة المتبقية';
  }

  @override
  String get thankYouFeedback => 'شكرا لتعليقاتك!';

  @override
  String get ratingSubmitted => 'تم تقديم التقييم!';

  @override
  String get setUserIdFirst => 'الرجاء تعيين معرف المستخدم الخاص بك أولاً';

  @override
  String get failedToFetchPrevious => 'فشل في جلب الأسئلة والأجوبة السابقة';

  @override
  String errorOccurred(Object error) {
    return 'خطأ: $error';
  }

  @override
  String get drawerAstroProfile => 'الملف الشخصي الفلكي';

  @override
  String get drawerDailyHoroscope => 'برجك اليومي';

  @override
  String get drawerBuyQuestions => 'أسئلة الشراء';

  @override
  String get drawerAstroDictionary => 'قاموس الفلك';

  @override
  String get drawerSettings => 'إعدادات';

  @override
  String get drawerCustomerSupport => 'دعم العملاء';

  @override
  String get drawerAbout => 'عن';

  @override
  String get drawerProfileSettings => 'إعدادات الملف الشخصي';

  @override
  String get demoNotificationTitle => '🔔 إشعار العرض التوضيحي';

  @override
  String get demoNotificationBody => 'هذا إشعار اختبار من تطبيقك!';

  @override
  String get notificationsTitle => 'إشعارات';

  @override
  String get noNotifications => 'لا يوجد إشعارات';

  @override
  String get allTab => 'الجميع';

  @override
  String get markAllAsRead => 'وضع علامة على الكل كمقروء';

  @override
  String get notificationMarkedRead => 'تم وضع علامة على الإشعار كمقروء';

  @override
  String get failedToLoadNotifications => 'فشل تحميل الإشعارات';

  @override
  String get failedToMarkRead => 'فشل في وضع علامة على القراءة';

  @override
  String get failedToMarkAllRead => 'فشل في وضع علامة على قراءة الكل';

  @override
  String get socketConnected => 'المقبس متصل';

  @override
  String get socketDisconnected => 'المقبس مفصول';

  @override
  String get newNotificationReceived => 'تم استلام إشعار جديد';

  @override
  String get generalCategory => 'عام';

  @override
  String get horoscopeCategory => 'برجك';

  @override
  String get chatCategory => 'محادثة';

  @override
  String get systemCategory => 'نظام';

  @override
  String get updateCategory => 'التحديثات';

  @override
  String get howToAskTitle => 'كيفية السؤال';

  @override
  String get noQuestionsAvailable => 'لا توجد أسئلة متاحة';

  @override
  String get failedToLoadQuestions => 'فشل تحميل الأسئلة';

  @override
  String get pullToRefresh => 'اسحب للتحديث';

  @override
  String get careerCategory => 'حياة مهنية';

  @override
  String get loveCategory => 'الحب والعلاقات';

  @override
  String get healthCategory => 'صحة';

  @override
  String get financeCategory => 'تمويل';

  @override
  String get familyCategory => 'عائلة';

  @override
  String get educationCategory => 'تعليم';

  @override
  String get travelCategory => 'يسافر';

  @override
  String get spiritualCategory => 'روحي';

  @override
  String get profileLoaded => 'تم تحميل الملف الشخصي بنجاح';

  @override
  String get imageUploaded => 'تم تحميل الصورة بنجاح';

  @override
  String get savedInformationConfirmation => 'لقد قمت بحفظ هذه المعلومات';

  @override
  String get noHistoryAvailable => 'لا يوجد تاريخ متاح';

  @override
  String get missingUserIdError => 'مطلوب معرف المستخدم';

  @override
  String get networkError => 'خطأ في الشبكة. يُرجى المحاولة مرة أخرى.';

  @override
  String get timeoutError => 'انتهت مهلة الطلب';

  @override
  String get genericError => 'لقد حدث خطأ ما';

  @override
  String get reactionUpdateError => 'فشل في تحديث التفاعل';

  @override
  String get noSearchResults => 'لم يتم العثور على نتائج البحث';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get resultsFound => 'تم العثور على النتائج';

  @override
  String get recoverySecretHint =>
      'قد لا تعمل عملية النسخ واللصق، لذا اكتب يدويًا';

  @override
  String get recoverAccountDescription => 'اتبع هذه الخطوات لاستعادة حسابك';

  @override
  String get processingLabel => 'يعالج...';

  @override
  String get clearChatSuccess => 'تم مسح الدردشة بنجاح';

  @override
  String get notificationsEnabled => 'تم تمكين الإشعارات';

  @override
  String get notificationsDisabled => 'تم تعطيل الإشعارات';

  @override
  String get securityNotice => 'يتم تشفير بياناتك وتخزينها بشكل آمن';

  @override
  String get loading => 'تحميل...';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get onboardingGetStartedDesc => 'ابدأ باختيار لغتك';

  @override
  String get accountRecoveryTitle => '🔐 تفاصيل استرداد الحساب';

  @override
  String get recoveryInstructions =>
      'يرجى حفظ هذه المعلومات بأمان. ستحتاجها لاستعادة حسابك.';

  @override
  String get importantNotice => '⚠️ هام:';

  @override
  String get astrologerProfileTitle => 'الملف الشخصي للمنجم';

  @override
  String get personalAstrologer => 'منجم شخصي';

  @override
  String get makePersonalAstrologer => 'اصنع منجمًا شخصيًا';

  @override
  String get favoriteDescription =>
      'سيتم توجيه أسئلتكم إلى هذا المنجم. في حال عدم توفره، سيساعدكم منجم مؤهل آخر.';

  @override
  String get educationQualifications => 'التعليم والمؤهلات';

  @override
  String get aboutSection => 'عن';

  @override
  String get shareProfile => 'مشاركة الملف الشخصي';

  @override
  String get loadingAstrologer => 'جاري تحميل تفاصيل المنجم...';

  @override
  String get failedToLoadAstrologer => 'فشل تحميل تفاصيل المنجم';

  @override
  String get authenticationRequired => 'مطلوب المصادقة. يرجى تسجيل الدخول.';

  @override
  String securityCheckFailed(Object error) {
    return 'فشل التحقق الأمني: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name هو الآن منجمك الشخصي';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ تمت إزالة $name من المفضلة';
  }

  @override
  String get toggleFavoriteError => 'فشل في تحديث الحالة المفضلة';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 التعليم: $education\n📜 المؤهل: $qualification\n⏳ الخبرة: $experience';
  }

  @override
  String get notProvided => 'غير متوفر';

  @override
  String reviews(Object count) {
    return '($count مراجعات)';
  }

  @override
  String get specialties => 'التخصصات';

  @override
  String get experience => 'خبرة';

  @override
  String get qualification => 'مؤهل';

  @override
  String get education => 'تعليم';

  @override
  String get recoveryTips =>
      '• التقط لقطة شاشة لهذه المعلومات.\n• احفظها في مكان آمن.\n• لا تشاركها مع أي شخص.\n• ستظهر هذه المعلومات مرة واحدة فقط.';

  @override
  String get themeSettingsTitle => 'إعدادات السمة';

  @override
  String get lightThemeLabel => 'ضوء';

  @override
  String get lightThemeDescription => 'استخدم دائمًا الوضع الفاتح';

  @override
  String get darkThemeLabel => 'مظلم';

  @override
  String get darkThemeDescription => 'استخدم الوضع الداكن دائمًا';

  @override
  String get systemThemeLabel => 'نظام';

  @override
  String get systemThemeDarkDescription =>
      'اتبع إعدادات النظام لتفعيل الوضع الداكن';

  @override
  String get systemThemeLightDescription =>
      'اتبع إعدادات النظام للحصول على الوضع الفاتح';

  @override
  String get switchToLight => 'قم بتشغيل الضوء';

  @override
  String get switchToDark => 'التبديل إلى الوضع الداكن';

  @override
  String get ourTeam => 'فريقنا';

  @override
  String get teamDescription =>
      'يتمتع فريقنا من المنجمين الفيديين المحترفين بسنوات من الخبرة في تفسير تأثيرات الكواكب وأنماط الحياة. بدعم من فريق دعم وتطوير متخصص، تقدم كارما تجربة سلسة وموثوقة وعالمية لكل مستخدم.';
}
