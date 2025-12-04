// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get settingsTitle => 'Sozlamalar';

  @override
  String get notificationSettings => 'Bildirishnoma sozlamalari';

  @override
  String get privacySettings => 'Maxfiylik sozlamalari';

  @override
  String get accountSettings => 'Hisob sozlamalari';

  @override
  String get languageSettings => 'Til sozlamalari';

  @override
  String get languageChanged => 'Til o\'zgartirildi';

  @override
  String get existingUserButton => 'Men mavjud foydalanuvchiman';

  @override
  String get chooseCountryTitle => 'Mamlakatni tanlang';

  @override
  String get yesText => 'Ha';

  @override
  String get noText => 'Yo\'q';

  @override
  String get appBarTitle => 'Profil sozlamalari';

  @override
  String get userIdLabel => 'Foydalanuvchi IDsi *';

  @override
  String get nameLabel => 'Ism';

  @override
  String get birthCountryLabel => 'Tug\'ilgan mamlakat';

  @override
  String get birthCityLabel => 'Tug\'ilgan shahar';

  @override
  String get countrySelectionTitle => 'Mamlakatingizni tanlang';

  @override
  String get maleLabel => 'Erkak';

  @override
  String get femaleLabel => 'Ayol';

  @override
  String get birthDateLabel => 'Tug\'ilgan kun sanasi';

  @override
  String get birthDatePlaceholder => 'Tug\'ilgan sanani tanlang';

  @override
  String get birthTimeLabel => 'Tug\'ilgan vaqti';

  @override
  String get birthTimePlaceholder => 'Tug\'ilgan vaqtni tanlang';

  @override
  String get saveProfileButton => 'Profilni saqlash';

  @override
  String get noCitiesFound => 'Hech qanday shahar topilmadi';

  @override
  String cityPlaceholder(Object country) {
    return '${country}da shaharni kiriting';
  }

  @override
  String get countryFirstPlaceholder => 'Avval mamlakatni tanlang';

  @override
  String get versionHistoryTitle => 'Versiya tarixi';

  @override
  String get notSetText => 'Belgilanmagan';

  @override
  String nameHistory(Object name) {
    return 'Nomi: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Shahar: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Mamlakat: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jins: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tug\'ilgan sanasi: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Tug\'ilgan vaqti: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Joylashuv: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Vaqt mintaqasi: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Holat: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date kuni yangilangan';
  }

  @override
  String get userIdRequired => 'Foydalanuvchi identifikatori talab qilinadi';

  @override
  String get profileSaved => 'Profil muvaffaqiyatli saqlandi';

  @override
  String get saveFailed => 'Profilni saqlab bo‘lmadi';

  @override
  String get errorPrefix => 'Xato:';

  @override
  String get onboardingChooseLanguage => 'Tilingizni tanlang';

  @override
  String get onboardingChooseLanguageDesc =>
      'Davom etish uchun sizga yoqqan tilni tanlang.';

  @override
  String get onboardingWhatIsAstrology => 'Astrologiya nima?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologiya - bu osmon jismlarini o\'rganadigan fan ...';

  @override
  String get onboardingWhyUseApp => 'Nima uchun bu ilovadan foydalanasiz?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Aniq qarorlar qabul qilish uchun moslashtirilgan munajjimlar bashorati, kundalik bashorat va ko\'rsatmalar oling.';

  @override
  String get onboardingHowToUse => 'Ushbu ilovadan qanday foydalanish kerak?';

  @override
  String get onboardingHowToUseDesc =>
      'Osonlik bilan harakatlaning, kundalik munajjimlar bashoratini tekshiring va aniq bashoratlar uchun profilingizni boshqaring.';

  @override
  String get onboardingGetStarted => 'Boshlash';

  @override
  String get onboardingNewUser => 'Yangi foydalanuvchi';

  @override
  String get onboardingExistingUser => 'Mavjud foydalanuvchi';

  @override
  String get onboardingBack => 'Orqaga';

  @override
  String get onboardingNext => 'Keyingisi';

  @override
  String get userIdNotFound =>
      'Foydalanuvchi identifikatori topilmadi. Iltimos, tizimga kiring yoki profilingizni o\'rnating.';

  @override
  String get clearNotificationsTitle => 'Bildirishnomalarni tozalash';

  @override
  String get clearNotificationsMessage =>
      'Haqiqatan ham barcha bildirishnomalarni oʻchirib tashlamoqchimisiz?';

  @override
  String get clearNotificationsSuccess =>
      'Barcha bildirishnomalar muvaffaqiyatli tozalandi.';

  @override
  String get clearHoroscopeTitle => 'Aniq munajjimlar bashorati';

  @override
  String get clearHoroscopeMessage =>
      'Haqiqatan ham munajjimlar bashorati maʼlumotlarini tozalamoqchimisiz?';

  @override
  String get clearHoroscopeSuccess =>
      'Munajjimlar bashorati muvaffaqiyatli tozalandi.';

  @override
  String get clearChatTitle => 'Chat tarixini tozalash';

  @override
  String get clearChatMessage =>
      'Haqiqatan ham barcha chat tarixingizni oʻchirib tashlamoqchimisiz?';

  @override
  String get clearChatLocal => 'Chat mahalliy sifatida tozalandi.';

  @override
  String get deleteAccountTitle => 'Hisobni o\'chirish';

  @override
  String get deleteAccountMessage =>
      'Hisobingizni oʻchirib tashlamoqchimisiz? Bu, shuningdek, barcha chat tarixi va bildirishnomalarni o\'chirib tashlaydi.';

  @override
  String get deleteAccountSuccess =>
      'Hisobingiz va barcha maʼlumotlaringiz olib tashlandi.';

  @override
  String get deleteAccountError => 'Hisobni o‘chirishda xatolik yuz berdi';

  @override
  String get logoutTitle => 'Chiqish';

  @override
  String get logoutMessage => 'Haqiqatan ham tizimdan chiqmoqchimisiz?';

  @override
  String get termsPrivacyTitle => 'Shartlar va Maxfiylik';

  @override
  String get privacyPolicyTitle => 'Maxfiylik siyosati';

  @override
  String get termsConditionsTitle => 'Foydalanish shartlari';

  @override
  String get dataControlTitle => 'Ma\'lumotlarni nazorat qilish';

  @override
  String get cancelButton => 'Bekor qilish';

  @override
  String get confirmButton => 'Tasdiqlang';

  @override
  String get clearQuestionsSuccess =>
      'Barcha savollar muvaffaqiyatli oʻchirildi.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Rabbim';

  @override
  String get startLabel => 'Boshlash';

  @override
  String get recoverAccount => 'Hisobni tiklash';

  @override
  String get endLabel => 'Oxiri';

  @override
  String get startDateLabel => 'Boshlanish sanasi';

  @override
  String get endDateLabel => 'Tugash sanasi';

  @override
  String get notAvailable => 'Mavjud emas';

  @override
  String get noData => 'Maʼlumot yoʻq';

  @override
  String get unknownError => 'Noma\'lum xato';

  @override
  String get retryButton => 'Qayta urinish';

  @override
  String get kundaliGeneratorTitle => 'Kundali generatori';

  @override
  String get natalChartTitle => 'Tug\'ilish jadvali';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Yuqori daraja';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Noma\'lum';

  @override
  String get clearHoroscope => 'Aniq munajjimlar bashorati';

  @override
  String get clearNotifications => 'Bildirishnomalarni tozalash';

  @override
  String get clearChatHistory => 'Chat tarixini tozalash';

  @override
  String get logout => 'Chiqish';

  @override
  String get deleteAccount => 'Hisobni o\'chirish';

  @override
  String get allFieldsRequired => 'Barcha maydonlar talab qilinadi.';

  @override
  String get accountRecoveredSuccess => 'Hisob muvaffaqiyatli tiklandi.';

  @override
  String get recoveryFailed =>
      'Qayta tiklash amalga oshmadi. Ma\'lumotlaringizni tekshiring.';

  @override
  String get recoverySecretLabel => 'Qayta tiklash siri:';

  @override
  String get aboutUsTitle => 'Biz haqimizda';

  @override
  String get aboutOurCompany => 'Kompaniyamiz haqida';

  @override
  String get aboutCompanyDescription =>
      'Karma-da biz Vedik astrologiyasining abadiy donoligi orqali haqiqiy hayot yo\'lingizni ochishga yordam beramiz. Har bir tushuncha haqiqiy, tajribali munajjimlardan keladi, sizning noyob tug\'ilish jadvalingiz asosida puxta ishlab chiqilgan. Kundalik munajjimlar bashoratidan shaxsiy yo\'l-yo\'riqlargacha, Karma qadimgi bilimlarni 100 dan ortiq tillarda mavjud qiladi.';

  @override
  String get ourMission => 'Bizning missiyamiz';

  @override
  String get missionDescription =>
      'Bizning vazifamiz oddiy: ishonchli, ongli qarorlar qabul qilish imkoniyatini beruvchi haqiqiy, insoniy munajjimlar bashorati bilan ta\'minlash. Har bir bashorat va maslahat avtomatlashtirilgan algoritmlarni emas, balki ko\'p yillik professional tajribani aks ettiradi.';

  @override
  String get ourVision => 'Bizning Vizyonimiz';

  @override
  String get visionDescription =>
      'Biz Vedik munajjimlik uchun dunyodagi eng ishonchli platforma bo\'lishga intilamiz, hamma joyda odamlarga o\'zlarini, tanlovlarini va hayot yo\'llarini ravshanlik va ishonch bilan tushunishlariga yordam beramiz.';

  @override
  String get ourValues => 'Bizning qadriyatlarimiz';

  @override
  String get valuesDescription =>
      'Karma-da biz haqiqiylik, aniqlik va ishonchni qadrlaymiz. Biz nafaqat toʻgʻri, balki mazmunli boʻlgan, hayotni aql va ishonch bilan boshqarishga yordam beradigan yoʻl-yoʻriqlarni taqdim etishga sodiqmiz.';

  @override
  String get contactUs => 'Biz bilan bog\'lanish';

  @override
  String get contactEmail => 'Elektron pochta: support@yourcompany.com';

  @override
  String get contactWebsite => 'Veb-sayt: www.yourcompany.com';

  @override
  String get customerSupport => 'Mijozlarni qo‘llab-quvvatlash';

  @override
  String get supportHeroTitle => 'Biz yordam berish uchun shu yerdamiz';

  @override
  String get supportHeroDescription =>
      'Quyidagi shaklni to\'ldiring va bizning qo\'llab-quvvatlash jamoamiz sizga imkon qadar tezroq javob beradi.';

  @override
  String get yourName => 'Sizning ismingiz';

  @override
  String get yourEmail => 'Sizning elektron pochtangiz';

  @override
  String get message => 'Xabar';

  @override
  String get enterEmail => 'Elektron pochtangizni kiriting';

  @override
  String get enterValidEmail => 'Yaroqli elektron pochta manzilini kiriting';

  @override
  String enterField(Object fieldName) {
    return '$fieldName kiriting';
  }

  @override
  String get send => 'Yuborish';

  @override
  String get sending => 'Yuborilmoqda...';

  @override
  String get emailSentSuccess => '✅ Elektron pochta muvaffaqiyatli yuborildi!';

  @override
  String get emailSendFailed => '❌ Elektron pochta xabarini yuborib bo‘lmadi';

  @override
  String get astroDictionaryTitle => 'Astro lug\'at';

  @override
  String get searchTermsHint => 'Qidiruv shartlari...';

  @override
  String get noTermsFound => 'Hech qanday shart topilmadi';

  @override
  String get buyQuestionsTitle => 'Savollarni sotib oling';

  @override
  String get userNotAuthenticated =>
      'Foydalanuvchi autentifikatsiya qilinmagan';

  @override
  String get loadStoreDataFailed => 'Doʻkon maʼlumotlarini yuklab boʻlmadi';

  @override
  String get missingAuthToken => 'Autentifikatsiya belgisi yetishmayapti';

  @override
  String get merchantDisplayName => 'Astro Chat ilovasi';

  @override
  String get paymentSuccessful =>
      '✅ Toʻlov muvaffaqiyatli amalga oshirildi! Savol yuborildi';

  @override
  String paymentFailed(Object error) {
    return '❌ To‘lov amalga oshmadi: $error';
  }

  @override
  String get yourBalance => 'Sizning balansingiz';

  @override
  String questionsBalance(Object count) {
    return '$count Savollar';
  }

  @override
  String get availableOffers => 'Mavjud takliflar';

  @override
  String questionsCount(Object count) {
    return '$count Savol';
  }

  @override
  String get buyButton => 'Sotib olish';

  @override
  String get dailyHoroscopeTitle => '🌟 Kundalik munajjimlar bashorati';

  @override
  String get userIdMissing => 'Foydalanuvchi identifikatori yetishmayapti';

  @override
  String get fetchHoroscopesFailed => 'Munajjimlar bashorati olib bo‘lmadi';

  @override
  String get noHoroscopeFound => 'Munajjimlar bashorati topilmadi.';

  @override
  String get signLabel => 'Imzo';

  @override
  String get todayLabel => 'Bugun';

  @override
  String get yesterdayLabel => 'Kecha';

  @override
  String get thisWeekLabel => 'Ushbu hafta';

  @override
  String get lastMonthLabel => 'O\'tgan oy';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Savolingizni yozing...';

  @override
  String get paymentRequired => 'To\'lov talab qilinadi';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Siz bepul savollaringizdan foydalandingiz. Davom etish uchun $amount to‘lang.';
  }

  @override
  String get payNowButton => 'Hozir toʻlash';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count bepul savollar qoldi';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pulli savollar qoldi';
  }

  @override
  String get thankYouFeedback => 'Fikr-mulohazangiz uchun rahmat!';

  @override
  String get ratingSubmitted => 'Baho berildi!';

  @override
  String get setUserIdFirst =>
      'Iltimos, avvalo foydalanuvchi identifikatoringizni o\'rnating';

  @override
  String get failedToFetchPrevious =>
      'Oldingi savol va javoblarni olib boʻlmadi';

  @override
  String errorOccurred(Object error) {
    return 'Xato: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profili';

  @override
  String get drawerDailyHoroscope => 'Kundalik munajjimlar bashorati';

  @override
  String get drawerBuyQuestions => 'Savollarni sotib oling';

  @override
  String get drawerAstroDictionary => 'Astro lug\'at';

  @override
  String get drawerSettings => 'Sozlamalar';

  @override
  String get drawerCustomerSupport => 'Mijozlarni qo‘llab-quvvatlash';

  @override
  String get drawerAbout => 'Haqida';

  @override
  String get drawerProfileSettings => 'Profil sozlamalari';

  @override
  String get demoNotificationTitle => '🔔 Namoyish haqida bildirishnoma';

  @override
  String get demoNotificationBody => 'Bu ilovangizdan sinov bildirishnomasi!';

  @override
  String get notificationsTitle => 'Bildirishnomalar';

  @override
  String get noNotifications => 'Hech qanday bildirishnoma yo\'q';

  @override
  String get allTab => 'Hammasi';

  @override
  String get markAllAsRead => 'Hammasini o\'qilgan deb belgilang';

  @override
  String get notificationMarkedRead => 'Bildirishnoma o‘qilgan deb belgilandi';

  @override
  String get failedToLoadNotifications => 'Bildirishnomalar yuklanmadi';

  @override
  String get failedToMarkRead => 'O‘qilgan deb belgilab bo‘lmadi';

  @override
  String get failedToMarkAllRead => 'Hammasini o‘qilgan deb belgilab bo‘lmadi';

  @override
  String get socketConnected => 'Soket ulangan';

  @override
  String get socketDisconnected => 'Soket uzildi';

  @override
  String get newNotificationReceived => 'Yangi bildirishnoma qabul qilindi';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Munajjimlar bashorati';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Tizim';

  @override
  String get updateCategory => 'Yangilanishlar';

  @override
  String get howToAskTitle => 'Qanday so\'rash kerak';

  @override
  String get noQuestionsAvailable => 'Hech qanday savol mavjud emas';

  @override
  String get failedToLoadQuestions => 'Savollarni yuklab bo‘lmadi';

  @override
  String get pullToRefresh => 'Yangilash uchun torting';

  @override
  String get careerCategory => 'Karyera';

  @override
  String get loveCategory => 'Sevgi va munosabatlar';

  @override
  String get healthCategory => 'Salomatlik';

  @override
  String get financeCategory => 'Moliya';

  @override
  String get familyCategory => 'Oila';

  @override
  String get educationCategory => 'Ta\'lim';

  @override
  String get travelCategory => 'Sayohat';

  @override
  String get spiritualCategory => 'Ruhiy';

  @override
  String get profileLoaded => 'Profil muvaffaqiyatli yuklandi';

  @override
  String get imageUploaded => 'Rasm muvaffaqiyatli yuklandi';

  @override
  String get savedInformationConfirmation => 'Men bu ma\'lumotni saqladim';

  @override
  String get noHistoryAvailable => 'Tarix mavjud emas';

  @override
  String get missingUserIdError =>
      'Foydalanuvchi identifikatori talab qilinadi';

  @override
  String get networkError => 'Tarmoq xatosi. Iltimos, qayta urinib koʻring.';

  @override
  String get timeoutError => 'So‘rov muddati tugadi';

  @override
  String get genericError => 'Nimadir xato ketdi';

  @override
  String get reactionUpdateError => 'Reaksiyani yangilab bo‘lmadi';

  @override
  String get noSearchResults => 'Hech qanday qidiruv natijalari topilmadi';

  @override
  String get clearSearch => 'Qidiruvni tozalash';

  @override
  String get resultsFound => 'Natijalar topildi';

  @override
  String get recoverySecretHint =>
      'Nusxalash va joylashtirish ishlamasligi mumkin, qo\'lda kiriting';

  @override
  String get recoverAccountDescription =>
      'Hisobingizni tiklash uchun quyidagi amallarni bajaring';

  @override
  String get processingLabel => 'Qayta ishlanmoqda...';

  @override
  String get clearChatSuccess => 'Chat muvaffaqiyatli tozalandi';

  @override
  String get notificationsEnabled => 'Bildirishnomalar yoqilgan';

  @override
  String get notificationsDisabled => 'Bildirishnomalar o‘chirilgan';

  @override
  String get securityNotice =>
      'Sizning ma\'lumotlaringiz xavfsiz shifrlangan va saqlanadi';

  @override
  String get loading => 'Yuklanmoqda...';

  @override
  String get selectLanguage => 'Tilni tanlang';

  @override
  String get onboardingGetStartedDesc => 'Tilingizni tanlash bilan boshlang';

  @override
  String get accountRecoveryTitle => '🔐 Hisobni tiklash tafsilotlari';

  @override
  String get recoveryInstructions =>
      'Iltimos, ushbu ma\'lumotni xavfsiz saqlang. Bu hisobingizni tiklash uchun kerak bo\'ladi.';

  @override
  String get importantNotice => '⚠️ Muhim:';

  @override
  String get astrologerProfileTitle => 'Astrolog profili';

  @override
  String get personalAstrologer => 'Shaxsiy munajjim';

  @override
  String get makePersonalAstrologer => 'Shaxsiy munajjim qiling';

  @override
  String get favoriteDescription =>
      'Sizning savollaringiz ushbu munajjimga ustuvor bo\'ladi. Agar mavjud bo\'lmasa, boshqa malakali munajjim sizga yordam beradi.';

  @override
  String get educationQualifications => 'Ta\'lim va malaka';

  @override
  String get aboutSection => 'Haqida';

  @override
  String get shareProfile => 'Profilni ulashish';

  @override
  String get loadingAstrologer => 'Astrolog tafsilotlari yuklanmoqda...';

  @override
  String get failedToLoadAstrologer =>
      'Astrolog tafsilotlarini yuklab bo‘lmadi';

  @override
  String get authenticationRequired =>
      'Autentifikatsiya talab qilinadi. Iltimos, tizimga kiring.';

  @override
  String securityCheckFailed(Object error) {
    return 'Xavfsizlik tekshiruvi amalga oshmadi: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name endi sizning shaxsiy munajjimingiz';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name sevimlilardan olib tashlandi';
  }

  @override
  String get toggleFavoriteError => 'Sevimli holatni yangilab bo‘lmadi';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Taʼlim: $education\n📜 Malaka: $qualification\n⏳ Tajriba: $experience';
  }

  @override
  String get notProvided => 'Taqdim etilmaydi';

  @override
  String reviews(Object count) {
    return '($count sharhlar)';
  }

  @override
  String get specialties => 'Mutaxassisliklar';

  @override
  String get experience => 'Tajriba';

  @override
  String get qualification => 'Malaka';

  @override
  String get education => 'Ta\'lim';

  @override
  String get recoveryTips =>
      '• Ushbu ma\'lumotning skrinshotini oling\n• Uni xavfsiz joyda saqlang\n• Hech kim bilan baham ko\'rmang\n• Bu faqat bir marta ko\'rsatiladi';

  @override
  String get themeSettingsTitle => 'Mavzu sozlamalari';

  @override
  String get lightThemeLabel => 'Nur';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Qorong\'i';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Tizim';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Bizning Jamoamiz';

  @override
  String get teamDescription =>
      'Bizning professional Vedik munajjimlar jamoasi sayyoraviy ta\'sirlar va hayot shakllarini sharhlash bo\'yicha ko\'p yillik tajribani olib keladi. Maxsus qo\'llab-quvvatlash va ishlab chiqish guruhi tomonidan qo\'llab-quvvatlangan Karma har bir foydalanuvchi uchun muammosiz, ishonchli va global tajribani taqdim etadi.';
}
