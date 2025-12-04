// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get settingsTitle => 'Орнотуулар';

  @override
  String get notificationSettings => 'Эскертме жөндөөлөрү';

  @override
  String get privacySettings => 'Купуялык орнотуулары';

  @override
  String get accountSettings => 'Каттоо эсебинин жөндөөлөрү';

  @override
  String get languageSettings => 'Тил орнотуулары';

  @override
  String get languageChanged => 'Тил өзгөрдү';

  @override
  String get existingUserButton => 'Мен учурдагы колдонуучумун';

  @override
  String get chooseCountryTitle => 'Өлкөнү тандаңыз';

  @override
  String get yesText => 'Ооба';

  @override
  String get noText => 'Жок';

  @override
  String get appBarTitle => 'Профиль орнотуулары';

  @override
  String get userIdLabel => 'Колдонуучунун ID *';

  @override
  String get nameLabel => 'аты';

  @override
  String get birthCountryLabel => 'Туулган өлкө';

  @override
  String get birthCityLabel => 'Туулган шаар';

  @override
  String get countrySelectionTitle => 'Өлкөңдү танда';

  @override
  String get maleLabel => 'Эркек';

  @override
  String get femaleLabel => 'Аял';

  @override
  String get birthDateLabel => 'Туулган датасы';

  @override
  String get birthDatePlaceholder => 'Туулган күнү тандаңыз';

  @override
  String get birthTimeLabel => 'Туулган убакыт';

  @override
  String get birthTimePlaceholder => 'Туулган убакытты тандаңыз';

  @override
  String get saveProfileButton => 'Профильди сактоо';

  @override
  String get noCitiesFound => 'Шаарлар табылган жок';

  @override
  String cityPlaceholder(Object country) {
    return 'Шаарды $countryга киргизиңиз';
  }

  @override
  String get countryFirstPlaceholder => 'Алгач өлкөнү тандаңыз';

  @override
  String get versionHistoryTitle => 'Версия тарыхы';

  @override
  String get notSetText => 'коюлган эмес';

  @override
  String nameHistory(Object name) {
    return 'Аты: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Шаар: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Өлкө: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Жынысы: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Туулган күнү: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Туулган убакыт: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Жайгашкан жери: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Убакыт алкагы: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Штат: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date жаңыртылган';
  }

  @override
  String get userIdRequired => 'Колдонуучунун ID талап кылынат';

  @override
  String get profileSaved => 'Профиль ийгиликтүү сакталды';

  @override
  String get saveFailed => 'Профиль сакталбай калды';

  @override
  String get errorPrefix => 'Ката:';

  @override
  String get onboardingChooseLanguage => 'Тилиңизди тандаңыз';

  @override
  String get onboardingChooseLanguageDesc =>
      'Улантуу үчүн каалаган тилиңизди тандаңыз.';

  @override
  String get onboardingWhatIsAstrology => 'Астрология деген эмне?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрология - бул асман кыймылдарын жана алардын адам жашоосуна тийгизген таасирин байыркы изилдөө, инсандык, мамилелер жана жашоо окуялары жөнүндө түшүнүктөрдү сунуш кылат.';

  @override
  String get onboardingWhyUseApp => 'Бул колдонмону эмне үчүн колдонуңуз?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Туулган диаграммаңызга ылайыкташтырылган так, адам жараткан гороскопторду жана көрсөтмөлөрдү алыңыз. Тажрыйбалуу астрологдордун күнүмдүк божомолдору жана жекелештирилген кеңештери менен негизделген чечимдерди кабыл алыңыз.';

  @override
  String get onboardingHowToUse => 'Бул колдонмону кантип колдонсо болот?';

  @override
  String get onboardingHowToUseDesc =>
      'Ошол замат баштоо үчүн жөн гана туулган күнүңүздү, так убакытты, туулган жериңизди жана башка тиешелүү маалыматтарды киргизиңиз. Күнүмдүк гороскопторду изилдеп, адис астрологдорго суроолорду бериңиз жана так, жекелештирилген божомолдор үчүн профилиңизди башкарыңыз — логин талап кылынбайт.';

  @override
  String get onboardingGetStarted => 'Баштоо';

  @override
  String get onboardingNewUser => 'Жаңы колдонуучу';

  @override
  String get onboardingExistingUser => 'Учурдагы колдонуучу';

  @override
  String get onboardingBack => 'Артка';

  @override
  String get onboardingNext => 'Кийинки';

  @override
  String get userIdNotFound =>
      'Колдонуучунун ID табылган жок. Сураныч, кириңиз же профилиңизди орнотуңуз.';

  @override
  String get clearNotificationsTitle => 'Билдирмелерди тазалоо';

  @override
  String get clearNotificationsMessage =>
      'Чын эле бардык эскертмелерди тазалагыңыз келеби?';

  @override
  String get clearNotificationsSuccess =>
      'Бардык эскертмелер ийгиликтүү тазаланды.';

  @override
  String get clearHoroscopeTitle => 'Таза Гороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Гороскоп дайындарыңызды чын эле тазалагыңыз келеби?';

  @override
  String get clearHoroscopeSuccess => 'Гороскоп ийгиликтүү тазаланды.';

  @override
  String get clearChatTitle => 'Чат таржымалын тазалоо';

  @override
  String get clearChatMessage =>
      'Чын эле чат таржымалыңыздын баарын жок кылгыңыз келеби?';

  @override
  String get clearChatLocal => 'Чат жергиликтүү түрдө тазаланды.';

  @override
  String get deleteAccountTitle => 'Каттоо эсебин жок кылуу';

  @override
  String get deleteAccountMessage =>
      'Каттоо эсебиңизди чын эле жок кылгыңыз келеби? Бул ошондой эле бардык чат таржымалыңызды жана эскертмелериңизди тазалайт.';

  @override
  String get deleteAccountSuccess =>
      'Каттоо эсебиңиз жана бардык дайындар өчүрүлдү.';

  @override
  String get deleteAccountError => 'Каттоо эсебин жок кылуу катасы';

  @override
  String get logoutTitle => 'Чыгуу';

  @override
  String get logoutMessage => 'Чын эле чыгып кеткиңиз келеби?';

  @override
  String get termsPrivacyTitle => 'Шарттар жана Купуялык';

  @override
  String get privacyPolicyTitle => 'Купуялык саясаты';

  @override
  String get termsConditionsTitle => 'Шарттар жана жоболор';

  @override
  String get dataControlTitle => 'Маалыматтарды көзөмөлдөө';

  @override
  String get cancelButton => 'Жокко чыгаруу';

  @override
  String get confirmButton => 'ырастоо';

  @override
  String get clearQuestionsSuccess => 'Бардык суроолор ийгиликтүү өчүрүлдү.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Мырзабыз';

  @override
  String get startLabel => 'Баштоо';

  @override
  String get recoverAccount => 'Каттоо эсебин калыбына келтирүү';

  @override
  String get endLabel => 'Аягы';

  @override
  String get startDateLabel => 'Башталыш күнү';

  @override
  String get endDateLabel => 'Аяктоо күнү';

  @override
  String get notAvailable => 'жеткиликтүү эмес';

  @override
  String get noData => 'Дайындар жок';

  @override
  String get unknownError => 'Белгисиз ката';

  @override
  String get retryButton => 'Кайталап көрүңүз';

  @override
  String get kundaliGeneratorTitle => 'Кундали генератору';

  @override
  String get natalChartTitle => 'Натал диаграммасы';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Жогорку даража';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Белгисиз';

  @override
  String get clearHoroscope => 'Таза Гороскоп';

  @override
  String get clearNotifications => 'Билдирмелерди тазалоо';

  @override
  String get clearChatHistory => 'Чат таржымалын тазалоо';

  @override
  String get logout => 'Чыгуу';

  @override
  String get deleteAccount => 'Каттоо эсебин жок кылуу';

  @override
  String get allFieldsRequired => 'Бардык талаалар талап кылынат.';

  @override
  String get accountRecoveredSuccess =>
      'Каттоо эсеби ийгиликтүү калыбына келтирилди.';

  @override
  String get recoveryFailed =>
      'Калыбына келтирүү ишке ашкан жок. Маалыматыңызды текшериңиз.';

  @override
  String get recoverySecretLabel => 'Калыбына келтирүү сыры:';

  @override
  String get aboutUsTitle => 'Биз жөнүндө';

  @override
  String get aboutOurCompany => 'Биздин компания жөнүндө';

  @override
  String get aboutCompanyDescription =>
      'Кармада биз сизге Ведик астрологиясынын түбөлүктүү акылмандыгы аркылуу чыныгы жашоо жолуңузду ачууга жардам беребиз. Ар бир түшүнүк чыныгы, тажрыйбалуу астрологдордон келип, уникалдуу туулган диаграммаңыздын негизинде кылдаттык менен иштелип чыккан. Күнүмдүк гороскоптардан жекелештирилген жетекчиликке чейин Карма байыркы билимдерди 100дөн ашык тилде жеткиликтүү кылат.';

  @override
  String get ourMission => 'Биздин миссия';

  @override
  String get missionDescription =>
      'Биздин миссиябыз жөнөкөй: ишенимдүү, негизделген чечимдерди кабыл алууга мүмкүнчүлүк берген чыныгы, адам жетектеген астрологиялык жетекчилик менен камсыз кылуу. Ар бир божомол жана консультация автоматташтырылган алгоритмдерди эмес, көп жылдык кесипкөй тажрыйбаны чагылдырат.';

  @override
  String get ourVision => 'Биздин Vision';

  @override
  String get visionDescription =>
      'Биз Веда астрологиясы үчүн дүйнөдөгү эң ишенимдүү платформа болууга умтулуп, бардык жердеги адамдарга өздөрүн, тандоолорун жана алардын жашоо сапарын айкын жана ишенимдүү түшүнүүгө жардам беребиз.';

  @override
  String get ourValues => 'Биздин баалуулуктар';

  @override
  String get valuesDescription =>
      'Кармада биз аныктуулукту, тактыкты жана ишенимди баалайбыз. Биз так гана эмес, ошондой эле маңыздуу болгон жетекчиликти сунуштап, жашооңузду кыраакылык жана ишеним менен башкарууга жардам берүүгө даярбыз.';

  @override
  String get contactUs => 'Биз менен байланышыңыз';

  @override
  String get contactEmail => 'Электрондук почта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Вебсайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Кардарларды колдоо';

  @override
  String get supportHeroTitle => 'Биз жардам берүү үчүн келдик';

  @override
  String get supportHeroDescription =>
      'Төмөнкү форманы толтуруңуз жана биздин колдоо командабыз сизге мүмкүн болушунча тезирээк кайрылат.';

  @override
  String get yourName => 'Сиздин атыңыз';

  @override
  String get yourEmail => 'Сиздин Email';

  @override
  String get message => 'Кабар';

  @override
  String get enterEmail => 'Электрондук почтаңызды киргизиңиз';

  @override
  String get enterValidEmail => 'Жарактуу электрондук почта дарегин киргизиңиз';

  @override
  String enterField(Object fieldName) {
    return '$fieldName киргизиңиз';
  }

  @override
  String get send => 'Жөнөтүү';

  @override
  String get sending => 'Жөнөтүлүүдө...';

  @override
  String get emailSentSuccess => '✅ Электрондук кат ийгиликтүү жөнөтүлдү!';

  @override
  String get emailSendFailed => '❌ Электрондук кат жөнөтүлбөй калды';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Издөө шарттары...';

  @override
  String get noTermsFound => 'Шарт табылган жок';

  @override
  String get buyQuestionsTitle => 'Сатып алуу суроолору';

  @override
  String get userNotAuthenticated => 'Колдонуучунун аныктыгы текшерилген эмес';

  @override
  String get loadStoreDataFailed => 'Дүкөн дайындары жүктөлбөй калды';

  @override
  String get missingAuthToken => 'Аутентификация белгиси жок';

  @override
  String get merchantDisplayName => 'Astro Chat колдонмосу';

  @override
  String get paymentSuccessful => '✅ Төлөм ийгиликтүү болду! Суроо жөнөтүлдү';

  @override
  String paymentFailed(Object error) {
    return '❌ Төлөм ишке ашкан жок: $error';
  }

  @override
  String get yourBalance => 'Сиздин балансыңыз';

  @override
  String questionsBalance(Object count) {
    return '$count Суроолор';
  }

  @override
  String get availableOffers => 'Жеткиликтүү сунуштар';

  @override
  String questionsCount(Object count) {
    return '$count Суроо';
  }

  @override
  String get buyButton => 'Сатып алуу';

  @override
  String get dailyHoroscopeTitle => '🌟 Күнүмдүк гороскоп';

  @override
  String get userIdMissing => 'Колдонуучунун ID жок';

  @override
  String get fetchHoroscopesFailed => 'Гороскоптор алынбай калды';

  @override
  String get noHoroscopeFound => 'Гороскоп табылган жок.';

  @override
  String get signLabel => 'Кол коюу';

  @override
  String get todayLabel => 'Бүгүн';

  @override
  String get yesterdayLabel => 'Кечээ';

  @override
  String get thisWeekLabel => 'Бул жумада';

  @override
  String get lastMonthLabel => 'Өткөн айда';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Сурооңузду жазыңыз...';

  @override
  String get paymentRequired => 'Төлөм талап кылынат';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Сиз акысыз суроолоруңузду колдондуңуз. Улантуу үчүн $amount төлөңүз.';
  }

  @override
  String get payNowButton => 'Азыр төлөө';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count бекер суроолор калды';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count акы төлөнүүчү суроолор калды';
  }

  @override
  String get thankYouFeedback => 'Пикириңиз үчүн рахмат!';

  @override
  String get ratingSubmitted => 'Рейтинг берилди!';

  @override
  String get setUserIdFirst =>
      'Сураныч, адегенде колдонуучунун идентификаторуңузду орнотуңуз';

  @override
  String get failedToFetchPrevious =>
      'Мурунку суроолор жана жооптор алынбай калды';

  @override
  String errorOccurred(Object error) {
    return 'Ката: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'Күнүмдүк гороскоп';

  @override
  String get drawerBuyQuestions => 'Сатып алуу суроолору';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Орнотуулар';

  @override
  String get drawerCustomerSupport => 'Кардарларды колдоо';

  @override
  String get drawerAbout => 'Жөнүндө';

  @override
  String get drawerProfileSettings => 'Профиль орнотуулары';

  @override
  String get demoNotificationTitle => '🔔 Демо эскертме';

  @override
  String get demoNotificationBody =>
      'Бул колдонмоңуздан келген сыноо эскертмеси!';

  @override
  String get notificationsTitle => 'Эскертмелер';

  @override
  String get noNotifications => 'Билдирмелер жок';

  @override
  String get allTab => 'Баары';

  @override
  String get markAllAsRead => 'Баарын окулду деп белгиле';

  @override
  String get notificationMarkedRead => 'Билдирме окулду деп белгиленди';

  @override
  String get failedToLoadNotifications => 'Эскертмелер жүктөлгөн жок';

  @override
  String get failedToMarkRead => 'Окулган деп белгиленбей койду';

  @override
  String get failedToMarkAllRead => 'Баары окулду деп белгиленбей койду';

  @override
  String get socketConnected => 'Розетка туташты';

  @override
  String get socketDisconnected => 'Розетка ажыратылды';

  @override
  String get newNotificationReceived => 'Жаңы эскертме алынды';

  @override
  String get generalCategory => 'Генерал';

  @override
  String get horoscopeCategory => 'Гороскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Система';

  @override
  String get updateCategory => 'Жаңыртуулар';

  @override
  String get howToAskTitle => 'Кантип суроо';

  @override
  String get noQuestionsAvailable => 'Суроолор жок';

  @override
  String get failedToLoadQuestions => 'Суроолор жүктөлгөн жок';

  @override
  String get pullToRefresh => 'Жаңылоо үчүн тартыңыз';

  @override
  String get careerCategory => 'Карьера';

  @override
  String get loveCategory => 'Сүйүү жана мамилелер';

  @override
  String get healthCategory => 'Ден соолук';

  @override
  String get financeCategory => 'Каржы';

  @override
  String get familyCategory => 'Үй-бүлө';

  @override
  String get educationCategory => 'Билим берүү';

  @override
  String get travelCategory => 'Саякат';

  @override
  String get spiritualCategory => 'Рухий';

  @override
  String get profileLoaded => 'Профиль ийгиликтүү жүктөлдү';

  @override
  String get imageUploaded => 'Сүрөт ийгиликтүү жүктөлдү';

  @override
  String get savedInformationConfirmation => 'Мен бул маалыматты сактадым';

  @override
  String get noHistoryAvailable => 'Таржымал жок';

  @override
  String get missingUserIdError => 'Колдонуучунун ID талап кылынат';

  @override
  String get networkError => 'Тармак катасы. Сураныч, кайра аракет кылыңыз.';

  @override
  String get timeoutError => 'Сурамдын мөөнөтү бүттү';

  @override
  String get genericError => 'Бир жерден ката кетти';

  @override
  String get reactionUpdateError => 'Реакция жаңыртылган жок';

  @override
  String get noSearchResults => 'Издөө натыйжалары табылган жок';

  @override
  String get clearSearch => 'Издөөнү тазалоо';

  @override
  String get resultsFound => 'Натыйжалар табылды';

  @override
  String get recoverySecretHint =>
      'Көчүрүү-жаруу иштебей калышы мүмкүн, кол менен териңиз';

  @override
  String get recoverAccountDescription =>
      'Каттоо эсебиңизди калыбына келтирүү үчүн бул кадамдарды аткарыңыз';

  @override
  String get processingLabel => 'Иштелүүдө...';

  @override
  String get clearChatSuccess => 'Чат ийгиликтүү тазаланды';

  @override
  String get notificationsEnabled => 'Эскертмелер иштетилди';

  @override
  String get notificationsDisabled => 'Эскертмелер өчүрүлгөн';

  @override
  String get securityNotice =>
      'Сиздин дайындар коопсуз шифрленген жана сакталат';

  @override
  String get loading => 'Жүктөлүүдө...';

  @override
  String get selectLanguage => 'Тилди танда';

  @override
  String get onboardingGetStartedDesc => 'Тилиңизди тандоо менен баштаңыз';

  @override
  String get accountRecoveryTitle =>
      '🔐 Каттоо эсебин калыбына келтирүү чоо-жайы';

  @override
  String get recoveryInstructions =>
      'Сураныч, бул маалыматты коопсуз сактаңыз. Бул каттоо эсебиңизди калыбына келтирүү үчүн керек болот.';

  @override
  String get importantNotice => '⚠️ Маанилүү:';

  @override
  String get astrologerProfileTitle => 'Астролог профили';

  @override
  String get personalAstrologer => 'Жеке астролог';

  @override
  String get makePersonalAstrologer => 'Жеке астролог жасаңыз';

  @override
  String get favoriteDescription =>
      'Сиздин суроолоруңуз бул астрологго артыкчылык берилет. Эгер жеткиликсиз болсо, башка квалификациялуу астролог сизге жардам берет.';

  @override
  String get educationQualifications => 'Билим жана Квалификациялар';

  @override
  String get aboutSection => 'Жөнүндө';

  @override
  String get shareProfile => 'Профиль бөлүшүү';

  @override
  String get loadingAstrologer => 'Астрологдун чоо-жайы жүктөлүүдө...';

  @override
  String get failedToLoadAstrologer => 'Астрологдун чоо-жайы жүктөлгөн жок';

  @override
  String get authenticationRequired =>
      'Аутентификация талап кылынат. Сураныч, кириңиз.';

  @override
  String securityCheckFailed(Object error) {
    return 'Коопсуздук текшерилбей калды: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name эми сиздин жеке астрологуңуз';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Сүйүктүүлөрдөн $name алынып салынды';
  }

  @override
  String get toggleFavoriteError => 'Сүйүктүү статус жаңыртылган жок';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Билими: $education\n📜 Квалификация: $qualification\n⏳ Тажрыйба: $experience';
  }

  @override
  String get notProvided => 'каралган эмес';

  @override
  String reviews(Object count) {
    return '($count сын-пикирлер)';
  }

  @override
  String get specialties => 'Адистер';

  @override
  String get experience => 'Тажрыйба';

  @override
  String get qualification => 'Квалификация';

  @override
  String get education => 'Билим берүү';

  @override
  String get recoveryTips =>
      '• Бул маалыматтын скриншотун алыңыз\n• Аны коопсуз жерде сактаңыз\n• Эч ким менен бөлүшпө\n• Бул бир гана жолу көрсөтүлөт';

  @override
  String get themeSettingsTitle => 'Тема орнотуулары';

  @override
  String get lightThemeLabel => 'Жарык';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Караңгы';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Система';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Биздин команда';

  @override
  String get teamDescription =>
      'Биздин кесипкөй веда астрологдорунун командасы планеталардын таасирин жана жашоо образын чечмелөө боюнча көп жылдык тажрыйбаны алып келет. Атайын колдоо жана өнүктүрүү командасы тарабынан колдоого алынган Карма ар бир колдонуучу үчүн үзгүлтүксүз, ишенимдүү жана глобалдык тажрыйбаны берет.';
}
