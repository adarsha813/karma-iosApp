// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get settingsTitle => 'Параметрлер';

  @override
  String get notificationSettings => 'Хабарландыру параметрлері';

  @override
  String get privacySettings => 'Құпиялық параметрлері';

  @override
  String get accountSettings => 'Есеп жазбасын түзету';

  @override
  String get languageSettings => 'Тіл параметрлері';

  @override
  String get languageChanged => 'Тіл өзгерді';

  @override
  String get existingUserButton => 'Мен бұрыннан бар пайдаланушымын';

  @override
  String get chooseCountryTitle => 'Елді таңдаңыз';

  @override
  String get yesText => 'Иә';

  @override
  String get noText => 'Жоқ';

  @override
  String get appBarTitle => 'Профиль параметрлері';

  @override
  String get userIdLabel => 'Пайдаланушы идентификаторы *';

  @override
  String get nameLabel => 'Аты';

  @override
  String get birthCountryLabel => 'Туған елі';

  @override
  String get birthCityLabel => 'Туған қала';

  @override
  String get countrySelectionTitle => 'Өз еліңізді таңдаңыз';

  @override
  String get maleLabel => 'Еркек';

  @override
  String get femaleLabel => 'Әйел';

  @override
  String get birthDateLabel => 'Туылған күні';

  @override
  String get birthDatePlaceholder => 'Туған күні таңдаңыз';

  @override
  String get birthTimeLabel => 'Туылған уақыты';

  @override
  String get birthTimePlaceholder => 'Туған уақытын таңдаңыз';

  @override
  String get saveProfileButton => 'Профильді сақтау';

  @override
  String get noCitiesFound => 'Ешқандай қала табылмады';

  @override
  String cityPlaceholder(Object country) {
    return 'Қаланы $country ішіне енгізіңіз';
  }

  @override
  String get countryFirstPlaceholder => 'Алдымен елді таңдаңыз';

  @override
  String get versionHistoryTitle => 'Нұсқалар тарихы';

  @override
  String get notSetText => 'Орнатылмаған';

  @override
  String nameHistory(Object name) {
    return 'Атауы: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Қала: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ел: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Жынысы: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Туған күні: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Туылған уақыты: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Орналасқан жері: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Уақыт белдеуі: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Күй: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date жаңартылды';
  }

  @override
  String get userIdRequired => 'Пайдаланушы идентификаторы қажет';

  @override
  String get profileSaved => 'Профиль сәтті сақталды';

  @override
  String get saveFailed => 'Профильді сақтау мүмкін болмады';

  @override
  String get errorPrefix => 'Қате:';

  @override
  String get onboardingChooseLanguage => 'Тіліңізді таңдаңыз';

  @override
  String get onboardingChooseLanguageDesc =>
      'Жалғастыру үшін қалаған тілді таңдаңыз.';

  @override
  String get onboardingWhatIsAstrology => 'Астрология дегеніміз не?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрология - бұл аспан қозғалыстары мен олардың адам өміріне әсері туралы ежелгі зерттеу, тұлға, қарым-қатынас және өмірлік оқиғалар туралы түсінік береді.';

  @override
  String get onboardingWhyUseApp => 'Бұл қолданбаны не үшін пайдалану керек?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Туған кестеңізге бейімделген дәл, адам жасаған жұлдыз жорамалдарды және нұсқауларды алыңыз. Тәжірибелі астрологтардың күнделікті болжамдарымен және жеке кеңестерімен негізделген шешімдер қабылдаңыз.';

  @override
  String get onboardingHowToUse => 'Бұл қолданбаны қалай пайдалануға болады?';

  @override
  String get onboardingHowToUseDesc =>
      'Бірден бастау үшін жай ғана туған күніңізді, нақты уақытыңызды, туған жеріңізді және кез келген басқа маңызды мәліметтерді енгізіңіз. Күнделікті жұлдыз жорамалдарды зерттеңіз, сарапшы астрологтарға сұрақтар қойыңыз және дәл, жеке болжам жасау үшін профиліңізді басқарыңыз — кіру қажет емес.';

  @override
  String get onboardingGetStarted => 'Жұмысты бастау';

  @override
  String get onboardingNewUser => 'Жаңа пайдаланушы';

  @override
  String get onboardingExistingUser => 'Қолданыстағы пайдаланушы';

  @override
  String get onboardingBack => 'Артқа';

  @override
  String get onboardingNext => 'Келесі';

  @override
  String get userIdNotFound =>
      'Пайдаланушы идентификаторы табылмады. Жүйеге кіріңіз немесе профиліңізді орнатыңыз.';

  @override
  String get clearNotificationsTitle => 'Хабарландыруларды тазалау';

  @override
  String get clearNotificationsMessage =>
      'Барлық хабарландыруларды өшіргіңіз келетініне сенімдісіз бе?';

  @override
  String get clearNotificationsSuccess =>
      'Барлық хабарландырулар сәтті өшірілді.';

  @override
  String get clearHoroscopeTitle => 'Ашық жұлдыз жорамал';

  @override
  String get clearHoroscopeMessage =>
      'Жұлдызнама деректерін шынымен өшіргіңіз келе ме?';

  @override
  String get clearHoroscopeSuccess => 'Жұлдызнама сәтті аяқталды.';

  @override
  String get clearChatTitle => 'Сөйлесу тарихын тазалау';

  @override
  String get clearChatMessage =>
      'Барлық сөйлесу тарихын жойғыңыз келетініне сенімдісіз бе?';

  @override
  String get clearChatLocal => 'Чат жергілікті түрде өшірілді.';

  @override
  String get deleteAccountTitle => 'Есептік жазбаны жою';

  @override
  String get deleteAccountMessage =>
      'Есептік жазбаңызды шынымен жойғыңыз келе ме? Бұл сонымен қатар барлық сөйлесу журналы мен хабарландыруларды өшіреді.';

  @override
  String get deleteAccountSuccess =>
      'Есептік жазбаңыз және барлық деректер жойылды.';

  @override
  String get deleteAccountError => 'Есептік жазбаны жою қатесі';

  @override
  String get logoutTitle => 'Шығу';

  @override
  String get logoutMessage => 'Шығуды қалайсыз ба?';

  @override
  String get termsPrivacyTitle => 'Шарттар мен құпиялылық';

  @override
  String get privacyPolicyTitle => 'Құпиялылық саясаты';

  @override
  String get termsConditionsTitle => 'Шарттар мен талаптар';

  @override
  String get dataControlTitle => 'Деректерді басқару';

  @override
  String get cancelButton => 'Болдырмау';

  @override
  String get confirmButton => 'Растау';

  @override
  String get clearQuestionsSuccess => 'Барлық сұрақтар сәтті жойылды.';

  @override
  String get yoginiLabel => 'Йогини';

  @override
  String get lordLabel => 'Мырза';

  @override
  String get startLabel => 'Бастау';

  @override
  String get recoverAccount => 'Есептік жазбаны қалпына келтіру';

  @override
  String get endLabel => 'Соңы';

  @override
  String get startDateLabel => 'Басталу күні';

  @override
  String get endDateLabel => 'Аяқталу күні';

  @override
  String get notAvailable => 'Жоқ';

  @override
  String get noData => 'Деректер жоқ';

  @override
  String get unknownError => 'Белгісіз қате';

  @override
  String get retryButton => 'Қайталап көріңіз';

  @override
  String get kundaliGeneratorTitle => 'Кундали генераторы';

  @override
  String get natalChartTitle => 'Натальдық диаграмма';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Жоғары дәреже';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Белгісіз';

  @override
  String get clearHoroscope => 'Ашық жұлдыз жорамал';

  @override
  String get clearNotifications => 'Хабарландыруларды тазалау';

  @override
  String get clearChatHistory => 'Сөйлесу тарихын тазалау';

  @override
  String get logout => 'Шығу';

  @override
  String get deleteAccount => 'Есептік жазбаны жою';

  @override
  String get allFieldsRequired => 'Барлық өрістер міндетті.';

  @override
  String get accountRecoveredSuccess =>
      'Есептік жазба сәтті қалпына келтірілді.';

  @override
  String get recoveryFailed =>
      'Қалпына келтіру сәтсіз аяқталды. Ақпаратыңызды тексеріңіз.';

  @override
  String get recoverySecretLabel => 'Қалпына келтіру құпиясы:';

  @override
  String get aboutUsTitle => 'Біз туралы';

  @override
  String get aboutOurCompany => 'Біздің компания туралы';

  @override
  String get aboutCompanyDescription =>
      'Кармада біз Ведалық астрологияның мәңгілік даналығы арқылы шынайы өмір жолыңызды ашуға көмектесеміз. Әрбір түсінік шынайы, тәжірибелі астрологтардан келеді, сіздің бірегей туу диаграммаңыз негізінде мұқият жасалған. Күнделікті жұлдыз жорамалдардан жекелендірілген нұсқауларға дейін Карма ежелгі білімді 100-ден астам тілде қолжетімді етеді.';

  @override
  String get ourMission => 'Біздің миссиямыз';

  @override
  String get missionDescription =>
      'Біздің миссиямыз қарапайым: сенімді, негізделген шешімдер қабылдауға мүмкіндік беретін шынайы, адам басқаратын астрологиялық нұсқаулықты қамтамасыз ету. Әрбір болжам мен кеңес автоматтандырылған алгоритмдерді емес, көп жылдық кәсіби тәжірибені көрсетеді.';

  @override
  String get ourVision => 'Біздің көзқарасымыз';

  @override
  String get visionDescription =>
      'Біз ведиялық астрологияның әлемдегі ең сенімді платформасы болуға тырысамыз, бұл адамдарға барлық жерде өздерін, таңдауларын және өмірлік саяхатын анық және сенімді түсінуге көмектесеміз.';

  @override
  String get ourValues => 'Біздің құндылықтарымыз';

  @override
  String get valuesDescription =>
      'Кармада біз шынайылықты, дәлдікті және сенімділікті бағалаймыз. Біз өмірді түсіну және сенімділікпен басқаруға көмектесетін дәл ғана емес, сонымен қатар мағыналы нұсқауларды ұсынуға дайынбыз.';

  @override
  String get contactUs => 'Бізбен хабарласыңы';

  @override
  String get contactEmail => 'Электрондық пошта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Веб-сайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Тұтынушыларды қолдау';

  @override
  String get supportHeroTitle => 'Біз көмектесуге келдік';

  @override
  String get supportHeroDescription =>
      'Төмендегі пішінді толтырыңыз және қолдау көрсету тобы сізге мүмкіндігінше тезірек хабарласады.';

  @override
  String get yourName => 'Сіздің атыңыз';

  @override
  String get yourEmail => 'Сіздің электрондық поштаңыз';

  @override
  String get message => 'Хабарлама';

  @override
  String get enterEmail => 'Электрондық поштаңызды енгізіңіз';

  @override
  String get enterValidEmail =>
      'Жарамды электрондық пошта мекенжайын енгізіңіз';

  @override
  String enterField(Object fieldName) {
    return '$fieldName енгізіңіз';
  }

  @override
  String get send => 'Жіберу';

  @override
  String get sending => 'Жіберілуде...';

  @override
  String get emailSentSuccess => '✅ Электрондық пошта сәтті жіберілді!';

  @override
  String get emailSendFailed => '❌ Электрондық поштаны жіберу мүмкін болмады';

  @override
  String get astroDictionaryTitle => 'Астро сөздігі';

  @override
  String get searchTermsHint => 'Терминдерді іздеу...';

  @override
  String get noTermsFound => 'Ешбір термин табылмады';

  @override
  String get buyQuestionsTitle => 'Сатып алу сұрақтары';

  @override
  String get userNotAuthenticated => 'Пайдаланушы аутентификацияланбаған';

  @override
  String get loadStoreDataFailed => 'Дүкен деректерін жүктеу сәтсіз аяқталды';

  @override
  String get missingAuthToken => 'Аутентификация белгісі жоқ';

  @override
  String get merchantDisplayName => 'Astro Chat қолданбасы';

  @override
  String get paymentSuccessful => '✅ Төлем сәтті өтті! Сұрақ жіберілді';

  @override
  String paymentFailed(Object error) {
    return '❌ Төлем орындалмады: $error';
  }

  @override
  String get yourBalance => 'Сіздің балансыңыз';

  @override
  String questionsBalance(Object count) {
    return '$count Сұрақтар';
  }

  @override
  String get availableOffers => 'Қолжетімді ұсыныстар';

  @override
  String questionsCount(Object count) {
    return '$count Сұрақ';
  }

  @override
  String get buyButton => 'Сатып алу';

  @override
  String get dailyHoroscopeTitle => '🌟 Күнделікті жұлдыз жорамал';

  @override
  String get userIdMissing => 'Пайдаланушы идентификаторы жоқ';

  @override
  String get fetchHoroscopesFailed => 'Жұлдыз жорамалдары алынбады';

  @override
  String get noHoroscopeFound => 'Жұлдыз жорамал табылмады.';

  @override
  String get signLabel => 'Қол қою';

  @override
  String get todayLabel => 'Бүгін';

  @override
  String get yesterdayLabel => 'Кеше';

  @override
  String get thisWeekLabel => 'Осы аптада';

  @override
  String get lastMonthLabel => 'Өткен айда';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Сұрағыңызды теріңіз...';

  @override
  String get paymentRequired => 'Төлем қажет';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Сіз тегін сұрақтарыңызды пайдаландыңыз. Жалғастыру үшін $amount төлеңіз.';
  }

  @override
  String get payNowButton => 'Қазір төлеңіз';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count бос сұрақтар қалды';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ақылы сұрақтар қалды';
  }

  @override
  String get thankYouFeedback => 'Пікіріңізге рахмет!';

  @override
  String get ratingSubmitted => 'Рейтинг жіберілді!';

  @override
  String get setUserIdFirst =>
      'Алдымен пайдаланушы идентификаторыңызды орнатыңыз';

  @override
  String get failedToFetchPrevious => 'Алдыңғы сұрақтар мен жауаптар алынбады';

  @override
  String errorOccurred(Object error) {
    return 'Қате: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro профилі';

  @override
  String get drawerDailyHoroscope => 'Күнделікті жұлдыз жорамал';

  @override
  String get drawerBuyQuestions => 'Сатып алу сұрақтары';

  @override
  String get drawerAstroDictionary => 'Астро сөздігі';

  @override
  String get drawerSettings => 'Параметрлер';

  @override
  String get drawerCustomerSupport => 'Тұтынушыларды қолдау';

  @override
  String get drawerAbout => 'туралы';

  @override
  String get drawerProfileSettings => 'Профиль параметрлері';

  @override
  String get demoNotificationTitle => '🔔 Демо хабарландыру';

  @override
  String get demoNotificationBody => 'Бұл қолданбаңыздың сынақ хабарландыруы!';

  @override
  String get notificationsTitle => 'Хабарландырулар';

  @override
  String get noNotifications => 'Хабарландырулар жоқ';

  @override
  String get allTab => 'Барлығы';

  @override
  String get markAllAsRead => 'Барлығын оқылған деп белгілеңіз';

  @override
  String get notificationMarkedRead => 'Хабарландыру оқылған деп белгіленді';

  @override
  String get failedToLoadNotifications => 'Хабарландырулар жүктелмеді';

  @override
  String get failedToMarkRead => 'Оқылған деп белгілеу мүмкін болмады';

  @override
  String get failedToMarkAllRead =>
      'Барлығын оқылған деп белгілеу мүмкін болмады';

  @override
  String get socketConnected => 'Розетка қосылған';

  @override
  String get socketDisconnected => 'Розетка ажыратылды';

  @override
  String get newNotificationReceived => 'Жаңа хабарландыру алынды';

  @override
  String get generalCategory => 'Жалпы';

  @override
  String get horoscopeCategory => 'Жұлдыз жорамал';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Жүйе';

  @override
  String get updateCategory => 'Жаңартулар';

  @override
  String get howToAskTitle => 'Қалай сұрауға болады';

  @override
  String get noQuestionsAvailable => 'Сұрақтар жоқ';

  @override
  String get failedToLoadQuestions => 'Сұрақтар жүктелмеді';

  @override
  String get pullToRefresh => 'Жаңарту үшін тартыңыз';

  @override
  String get careerCategory => 'Мансап';

  @override
  String get loveCategory => 'Махаббат және қарым-қатынас';

  @override
  String get healthCategory => 'Денсаулық';

  @override
  String get financeCategory => 'Қаржы';

  @override
  String get familyCategory => 'Отбасы';

  @override
  String get educationCategory => 'Білім';

  @override
  String get travelCategory => 'Саяхат';

  @override
  String get spiritualCategory => 'Рухани';

  @override
  String get profileLoaded => 'Профиль сәтті жүктелді';

  @override
  String get imageUploaded => 'Кескін жүктеп салынды';

  @override
  String get savedInformationConfirmation => 'Мен бұл ақпаратты сақтадым';

  @override
  String get noHistoryAvailable => 'Тарих жоқ';

  @override
  String get missingUserIdError => 'Пайдаланушы идентификаторы қажет';

  @override
  String get networkError => 'Желі қатесі. Қайталап көріңіз.';

  @override
  String get timeoutError => 'Сұрау уақыты аяқталды';

  @override
  String get genericError => 'Бірдеңе дұрыс болмады';

  @override
  String get reactionUpdateError => 'Реакцияны жаңарту мүмкін болмады';

  @override
  String get noSearchResults => 'Іздеу нәтижелері табылмады';

  @override
  String get clearSearch => 'Іздеуді тазалау';

  @override
  String get resultsFound => 'Нәтижелер табылды';

  @override
  String get recoverySecretHint =>
      'Көшіру-қою жұмыс істемеуі мүмкін, қолмен теріңіз';

  @override
  String get recoverAccountDescription =>
      'Есептік жазбаңызды қалпына келтіру үшін мына қадамдарды орындаңыз';

  @override
  String get processingLabel => 'Өңдеуде...';

  @override
  String get clearChatSuccess => 'Чат сәтті жойылды';

  @override
  String get notificationsEnabled => 'Хабарландырулар қосылды';

  @override
  String get notificationsDisabled => 'Хабарландырулар өшірілді';

  @override
  String get securityNotice =>
      'Сіздің деректеріңіз қауіпсіз шифрланған және сақталады';

  @override
  String get loading => 'Жүктелуде...';

  @override
  String get selectLanguage => 'Тіл таңдаңыз';

  @override
  String get onboardingGetStartedDesc => 'Тілді таңдаудан бастаңыз';

  @override
  String get accountRecoveryTitle =>
      '🔐 Есептік жазбаны қалпына келтіру мәліметтері';

  @override
  String get recoveryInstructions =>
      'Бұл ақпаратты қауіпсіз сақтаңыз. Бұл есептік жазбаңызды қалпына келтіру үшін қажет болады.';

  @override
  String get importantNotice => '⚠️ Маңызды:';

  @override
  String get astrologerProfileTitle => 'Астролог профилі';

  @override
  String get personalAstrologer => 'Жеке астролог';

  @override
  String get makePersonalAstrologer => 'Жеке астролог жасаңыз';

  @override
  String get favoriteDescription =>
      'Сіздің сұрақтарыңыз осы астрологқа басымдық беріледі. Қолжетімсіз болса, сізге басқа білікті астролог көмектеседі.';

  @override
  String get educationQualifications => 'Білім және біліктілік';

  @override
  String get aboutSection => 'туралы';

  @override
  String get shareProfile => 'Профильді бөлісу';

  @override
  String get loadingAstrologer => 'Астролог мәліметтері жүктелуде...';

  @override
  String get failedToLoadAstrologer => 'Астролог мәліметтері жүктелмеді';

  @override
  String get authenticationRequired => 'Аутентификация қажет. Жүйеге кіріңіз.';

  @override
  String securityCheckFailed(Object error) {
    return 'Қауіпсіздікті тексеру сәтсіз аяқталды: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name енді сіздің жеке астрологыңыз';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Таңдаулылардан $name жойылды';
  }

  @override
  String get toggleFavoriteError => 'Таңдаулы күйді жаңарту мүмкін болмады';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Білім: $education\n📜 Біліктілік: $qualification\n⏳ Тәжірибе: $experience';
  }

  @override
  String get notProvided => 'Берілмеген';

  @override
  String reviews(Object count) {
    return '($count шолулар)';
  }

  @override
  String get specialties => 'Мамандықтар';

  @override
  String get experience => 'Тәжірибе';

  @override
  String get qualification => 'Біліктілік';

  @override
  String get education => 'Білім';

  @override
  String get recoveryTips =>
      '• Осы ақпараттың скриншотын алыңыз\n• Оны қауіпсіз жерде сақтаңыз\n• Ешкіммен бөліспеңіз\n• Бұл тек бір рет көрсетіледі';

  @override
  String get themeSettingsTitle => 'Тақырып параметрлері';

  @override
  String get lightThemeLabel => 'Жарық';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Қараңғы';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Жүйе';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Біздің команда';

  @override
  String get teamDescription =>
      'Біздің кәсіби ведалық астрологтар тобы планеталық әсерлер мен өмір сүру үлгілерін түсіндіретін көп жылдық тәжірибені әкеледі. Арнайы қолдау және әзірлеу тобының қолдауымен Карма әрбір пайдаланушы үшін үздіксіз, сенімді және жаһандық тәжірибені ұсынады.';
}
