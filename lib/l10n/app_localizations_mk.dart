// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get settingsTitle => 'Поставки';

  @override
  String get notificationSettings => 'Поставки за известувања';

  @override
  String get privacySettings => 'Поставки за приватност';

  @override
  String get accountSettings => 'Поставки на сметката';

  @override
  String get languageSettings => 'Поставки за јазик';

  @override
  String get languageChanged => 'Јазикот е променет';

  @override
  String get existingUserButton => 'Јас сум постоечки корисник';

  @override
  String get chooseCountryTitle => 'Изберете земја';

  @override
  String get yesText => 'Да';

  @override
  String get noText => 'Не';

  @override
  String get appBarTitle => 'Поставки на профилот';

  @override
  String get userIdLabel => 'Кориснички ИД *';

  @override
  String get nameLabel => 'Име';

  @override
  String get birthCountryLabel => 'Земја на раѓање';

  @override
  String get birthCityLabel => 'Град на раѓање';

  @override
  String get countrySelectionTitle => 'Изберете ја вашата земја';

  @override
  String get maleLabel => 'Машки';

  @override
  String get femaleLabel => 'Женски';

  @override
  String get birthDateLabel => 'Датум на раѓање';

  @override
  String get birthDatePlaceholder => 'Изберете датум на раѓање';

  @override
  String get birthTimeLabel => 'Време на раѓање';

  @override
  String get birthTimePlaceholder => 'Изберете време на раѓање';

  @override
  String get saveProfileButton => 'Зачувај профил';

  @override
  String get noCitiesFound => 'Не се пронајдени градови';

  @override
  String cityPlaceholder(Object country) {
    return 'Внесете град во $country';
  }

  @override
  String get countryFirstPlaceholder => 'Прво изберете земја';

  @override
  String get versionHistoryTitle => 'Историја на верзии';

  @override
  String get notSetText => 'Не е поставено';

  @override
  String nameHistory(Object name) {
    return 'Име: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Град: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Земја: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Пол: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Датум на раѓање: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Време на раѓање: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Локација: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Временска зона: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ДСТ: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Состојба: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ажурирано на $date';
  }

  @override
  String get userIdRequired => 'Потребен е кориснички ID';

  @override
  String get profileSaved => 'Профилот е успешно зачуван';

  @override
  String get saveFailed => 'Неуспешно зачувување на профилот';

  @override
  String get errorPrefix => 'Грешка:';

  @override
  String get onboardingChooseLanguage => 'Изберете го вашиот јазик';

  @override
  String get onboardingChooseLanguageDesc =>
      'Изберете го вашиот претпочитан јазик за да продолжите.';

  @override
  String get onboardingWhatIsAstrology => 'Што е астрологија?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрологијата е наука за небесните тела...';

  @override
  String get onboardingWhyUseApp => 'Зошто да ја користите оваа апликација?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Добивајте персонализирани хороскопи, дневни предвидувања и упатства за донесување информирани одлуки.';

  @override
  String get onboardingHowToUse => 'Како да ја користите оваа апликација?';

  @override
  String get onboardingHowToUseDesc =>
      'Лесно навигирајте, проверувајте дневни хороскопи и управувајте со вашиот профил за точни предвидувања.';

  @override
  String get onboardingGetStarted => 'Започнете';

  @override
  String get onboardingNewUser => 'Нов корисник';

  @override
  String get onboardingExistingUser => 'Постоечки корисник';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingNext => 'Следно';

  @override
  String get userIdNotFound =>
      'Корисничкиот ID не е пронајден. Најавете се или поставете го вашиот профил.';

  @override
  String get clearNotificationsTitle => 'Исчисти известувања';

  @override
  String get clearNotificationsMessage =>
      'Дали сте сигурни дека сакате да ги избришете сите известувања?';

  @override
  String get clearNotificationsSuccess =>
      'Сите известувања се успешно исчистени.';

  @override
  String get clearHoroscopeTitle => 'Јасен хороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Дали сте сигурни дека сакате да ги избришете податоците од вашиот хороскоп?';

  @override
  String get clearHoroscopeSuccess => 'Хороскопот е успешно исчистен.';

  @override
  String get clearChatTitle => 'Исчисти ја историјата на разговори';

  @override
  String get clearChatMessage =>
      'Дали сте сигурни дека сакате да ја избришете целата историја на разговор?';

  @override
  String get clearChatLocal => 'Разговорот е исчистен локално.';

  @override
  String get deleteAccountTitle => 'Избриши сметка';

  @override
  String get deleteAccountMessage =>
      'Дали сте сигурни дека сакате да ја избришете вашата сметка? Ова исто така ќе ја избрише целата ваша историја на разговори и известувања.';

  @override
  String get deleteAccountSuccess =>
      'Вашата сметка и сите податоци се отстранети.';

  @override
  String get deleteAccountError => 'Грешка при бришење на сметката';

  @override
  String get logoutTitle => 'Одјави се';

  @override
  String get logoutMessage => 'Дали сте сигурни дека сакате да се одјавите?';

  @override
  String get termsPrivacyTitle => 'Услови и приватност';

  @override
  String get privacyPolicyTitle => 'Политика за приватност';

  @override
  String get termsConditionsTitle => 'Услови и одредби';

  @override
  String get dataControlTitle => 'Контрола на податоци';

  @override
  String get cancelButton => 'Откажи';

  @override
  String get confirmButton => 'Потврди';

  @override
  String get clearQuestionsSuccess => 'Сите прашања се успешно избришани.';

  @override
  String get yoginiLabel => 'Јогини';

  @override
  String get lordLabel => 'Господ';

  @override
  String get startLabel => 'Почеток';

  @override
  String get recoverAccount => 'Обновете ја сметката';

  @override
  String get endLabel => 'Крај';

  @override
  String get startDateLabel => 'Датум на почеток';

  @override
  String get endDateLabel => 'Датум на завршување';

  @override
  String get notAvailable => 'Не е достапно';

  @override
  String get noData => 'Нема податоци';

  @override
  String get unknownError => 'Непозната грешка';

  @override
  String get retryButton => 'Обидете се повторно';

  @override
  String get kundaliGeneratorTitle => 'Кундали Генератор';

  @override
  String get natalChartTitle => 'Натална карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Асцендентен степен';

  @override
  String get vimshottariDashaTitle => 'Вимшотари Даша';

  @override
  String get yoginiDashaTitle => 'Јогини Даша';

  @override
  String get unknown => 'Непознато';

  @override
  String get clearHoroscope => 'Јасен хороскоп';

  @override
  String get clearNotifications => 'Исчисти известувања';

  @override
  String get clearChatHistory => 'Исчисти ја историјата на разговори';

  @override
  String get logout => 'Одјави се';

  @override
  String get deleteAccount => 'Избриши сметка';

  @override
  String get allFieldsRequired => 'Сите полиња се задолжителни.';

  @override
  String get accountRecoveredSuccess => 'Сметката е успешно вратена.';

  @override
  String get recoveryFailed =>
      'Обновувањето не успеа. Проверете ги вашите информации.';

  @override
  String get recoverySecretLabel => 'Тајната на закрепнувањето:';

  @override
  String get aboutUsTitle => 'За нас';

  @override
  String get aboutOurCompany => 'За нашата компанија';

  @override
  String get aboutCompanyDescription =>
      'Во Карма, ние ви помагаме да го откриете вашиот вистински животен пат преку безвременската мудрост на ведската астрологија. Секој увид доаѓа од вистински, искусни астролози, внимателно изработен врз основа на вашата единствена натална карта. Од дневни хороскопи до персонализирани упатства, Карма го прави древното знаење достапно на над 100 јазици.';

  @override
  String get ourMission => 'Нашата мисија';

  @override
  String get missionDescription =>
      'Нашата мисија е едноставна: да обезбедиме автентично, човечко астролошко водство кое ви овозможува да донесувате самоуверени, информирани одлуки. Секое предвидување и консултација одразува години професионална експертиза, а не автоматизирани алгоритми.';

  @override
  String get ourVision => 'Нашата визија';

  @override
  String get visionDescription =>
      'Се стремиме да бидеме најдоверливата платформа во светот за ведска астрологија, помагајќи им на луѓето насекаде да се разберат себеси, своите избори и своето животно патување со јасност и самодоверба.';

  @override
  String get ourValues => 'Нашите вредности';

  @override
  String get valuesDescription =>
      'Во Карма, ние ја цениме автентичноста, прецизноста и довербата. Посветени сме да понудиме насоки кои не се само точни, туку и значајни, помагајќи ви да се снајдете во животот со увид и самодоверба.';

  @override
  String get contactUs => 'Контактирајте не';

  @override
  String get contactEmail => 'Е-пошта: support@вашатакомпанија.com';

  @override
  String get contactWebsite => 'Веб-страница: www.вашатакомпанија.com';

  @override
  String get customerSupport => 'Поддршка за корисници';

  @override
  String get supportHeroTitle => 'Тука сме да помогнеме';

  @override
  String get supportHeroDescription =>
      'Пополнете го формуларот подолу и нашиот тим за поддршка ќе ви се јави што е можно поскоро.';

  @override
  String get yourName => 'Вашето име';

  @override
  String get yourEmail => 'Вашата е-пошта';

  @override
  String get message => 'Порака';

  @override
  String get enterEmail => 'Внесете ја вашата е-пошта';

  @override
  String get enterValidEmail => 'Внесете важечка е-адреса';

  @override
  String enterField(Object fieldName) {
    return 'Внесете $fieldName';
  }

  @override
  String get send => 'Испрати';

  @override
  String get sending => 'Се испраќа...';

  @override
  String get emailSentSuccess => '✅ Е-поштата е успешно испратена!';

  @override
  String get emailSendFailed => '❌ Неуспешно испраќање на е-пошта';

  @override
  String get astroDictionaryTitle => 'Астро речник';

  @override
  String get searchTermsHint => 'Пребарувај термини...';

  @override
  String get noTermsFound => 'Не се пронајдени термини';

  @override
  String get buyQuestionsTitle => 'Прашања за купување';

  @override
  String get userNotAuthenticated => 'Корисникот не е автентициран';

  @override
  String get loadStoreDataFailed =>
      'Не успеаја да се вчитаат податоците од продавницата';

  @override
  String get missingAuthToken => 'Недостасува токен за авторизација';

  @override
  String get merchantDisplayName => 'Апликација за разговор „Астро“';

  @override
  String get paymentSuccessful =>
      '✅ Плаќањето е успешно! Прашањето е испратено!';

  @override
  String paymentFailed(Object error) {
    return '❌ Плаќањето не успеа: $error';
  }

  @override
  String get yourBalance => 'Вашиот биланс';

  @override
  String questionsBalance(Object count) {
    return '$count Прашања';
  }

  @override
  String get availableOffers => 'Достапни понуди';

  @override
  String questionsCount(Object count) {
    return '$count Прашање';
  }

  @override
  String get buyButton => 'Купи';

  @override
  String get dailyHoroscopeTitle => '🌟 Дневен хороскоп';

  @override
  String get userIdMissing => 'Корисничкиот ID недостасува';

  @override
  String get fetchHoroscopesFailed => 'Не успеав да ги добијам хороскопите';

  @override
  String get noHoroscopeFound => 'Не е пронајден хороскоп.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Денес';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get thisWeekLabel => 'Оваа недела';

  @override
  String get lastMonthLabel => 'Минатиот месец';

  @override
  String get chatTitle => 'Разговор';

  @override
  String get typeYourQuestionHint => 'Внесете го вашето прашање...';

  @override
  String get paymentRequired => 'Потребно е плаќање';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Ги искористивте вашите бесплатни прашања. Платете $amount за да продолжите.';
  }

  @override
  String get payNowButton => 'Плати сега';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count преостануваат бесплатни прашања';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count преостануваат платени прашања';
  }

  @override
  String get thankYouFeedback =>
      'Ви благодариме за вашите повратни информации!';

  @override
  String get ratingSubmitted => 'Оцената е поднесена!';

  @override
  String get setUserIdFirst => 'Прво поставете го вашиот кориснички ID';

  @override
  String get failedToFetchPrevious =>
      'Не успеа да се преземат претходните прашања и одговори';

  @override
  String errorOccurred(Object error) {
    return 'Грешка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профил';

  @override
  String get drawerDailyHoroscope => 'Дневен хороскоп';

  @override
  String get drawerBuyQuestions => 'Прашања за купување';

  @override
  String get drawerAstroDictionary => 'Астро речник';

  @override
  String get drawerSettings => 'Поставки';

  @override
  String get drawerCustomerSupport => 'Поддршка за корисници';

  @override
  String get drawerAbout => 'За';

  @override
  String get drawerProfileSettings => 'Поставки на профилот';

  @override
  String get demoNotificationTitle => '🔔 Демо известување';

  @override
  String get demoNotificationBody =>
      'Ова е тест известување од вашата апликација!';

  @override
  String get notificationsTitle => 'Известувања';

  @override
  String get noNotifications => 'Нема известувања';

  @override
  String get allTab => 'Сите';

  @override
  String get markAllAsRead => 'Означи ги сите како прочитани';

  @override
  String get notificationMarkedRead =>
      'Известувањето е означено како прочитано';

  @override
  String get failedToLoadNotifications =>
      'Неуспешно вчитување на известувањата';

  @override
  String get failedToMarkRead => 'Неуспешно означување како прочитано';

  @override
  String get failedToMarkAllRead =>
      'Не успеа да се означат сите како прочитани';

  @override
  String get socketConnected => 'Сокетот е поврзан';

  @override
  String get socketDisconnected => 'Сокетот е исклучен';

  @override
  String get newNotificationReceived => 'Примено е ново известување';

  @override
  String get generalCategory => 'Општо';

  @override
  String get horoscopeCategory => 'Хороскоп';

  @override
  String get chatCategory => 'Разговор';

  @override
  String get systemCategory => 'Систем';

  @override
  String get updateCategory => 'Ажурирања';

  @override
  String get howToAskTitle => 'Како да прашате';

  @override
  String get noQuestionsAvailable => 'Нема достапни прашања';

  @override
  String get failedToLoadQuestions => 'Неуспешно вчитување на прашањата';

  @override
  String get pullToRefresh => 'Повлечете за да освежите';

  @override
  String get careerCategory => 'Кариера';

  @override
  String get loveCategory => 'Љубов и врски';

  @override
  String get healthCategory => 'Здравје';

  @override
  String get financeCategory => 'Финансии';

  @override
  String get familyCategory => 'Семејство';

  @override
  String get educationCategory => 'Образование';

  @override
  String get travelCategory => 'Патување';

  @override
  String get spiritualCategory => 'Духовен';

  @override
  String get profileLoaded => 'Профилот е успешно вчитан';

  @override
  String get imageUploaded => 'Сликата е успешно прикачена';

  @override
  String get savedInformationConfirmation => 'Ги зачував овие информации';

  @override
  String get noHistoryAvailable => 'Нема достапна историја';

  @override
  String get missingUserIdError => 'Потребен е кориснички ID';

  @override
  String get networkError => 'Грешка во мрежата. Обидете се повторно.';

  @override
  String get timeoutError => 'Барањето истече';

  @override
  String get genericError => 'Нешто тргна наопаку';

  @override
  String get reactionUpdateError => 'Неуспешно ажурирање на реакцијата';

  @override
  String get noSearchResults => 'Не се пронајдени резултати од пребарувањето';

  @override
  String get clearSearch => 'Исчисти пребарување';

  @override
  String get resultsFound => 'Пронајдени резултати';

  @override
  String get recoverySecretHint =>
      'Копирањето-залевањето може да не работи, пишувајте рачно';

  @override
  String get recoverAccountDescription =>
      'Следете ги овие чекори за да ја вратите вашата сметка';

  @override
  String get processingLabel => 'Се обработува...';

  @override
  String get clearChatSuccess => 'Разговорот е успешно исчистен';

  @override
  String get notificationsEnabled => 'Известувањата се овозможени';

  @override
  String get notificationsDisabled => 'Известувањата се оневозможени';

  @override
  String get securityNotice =>
      'Вашите податоци се безбедно шифрирани и складирани';

  @override
  String get loading => 'Се вчитува...';

  @override
  String get selectLanguage => 'Изберете јазик';

  @override
  String get onboardingGetStartedDesc =>
      'Започнете со избирање на вашиот јазик';

  @override
  String get accountRecoveryTitle => '🔐 Детали за враќање на сметката';

  @override
  String get recoveryInstructions =>
      'Ве молиме зачувајте ги овие информации безбедно. Ќе ви бидат потребни за да ја вратите вашата сметка.';

  @override
  String get importantNotice => '⚠️ Важно:';

  @override
  String get astrologerProfileTitle => 'Профил на астролог';

  @override
  String get personalAstrologer => 'Личен астролог';

  @override
  String get makePersonalAstrologer => 'Направете личен астролог';

  @override
  String get favoriteDescription =>
      'Вашите прашања ќе бидат приоритетно разгледани од овој астролог. Доколку не сте достапни, друг квалификуван астролог ќе ви помогне.';

  @override
  String get educationQualifications => 'Образование и квалификации';

  @override
  String get aboutSection => 'За';

  @override
  String get shareProfile => 'Сподели профил';

  @override
  String get loadingAstrologer => 'Се вчитуваат деталите за астрологот...';

  @override
  String get failedToLoadAstrologer =>
      'Неуспешно вчитување на деталите за астрологот';

  @override
  String get authenticationRequired =>
      'Потребна е автентикација. Ве молиме најавете се.';

  @override
  String securityCheckFailed(Object error) {
    return 'Безбедносната проверка не успеа: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name сега е ваш личен астролог';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name е отстрането од омилените';
  }

  @override
  String get toggleFavoriteError =>
      'Неуспешно ажурирање на статусот на омилено';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Образование: $education\n📜 Квалификација: $qualification\n⏳ Искуство: $experience';
  }

  @override
  String get notProvided => 'Не е наведено';

  @override
  String reviews(Object count) {
    return '($count прегледи)';
  }

  @override
  String get specialties => 'Специјалитети';

  @override
  String get experience => 'Искуство';

  @override
  String get qualification => 'Квалификација';

  @override
  String get education => 'Образование';

  @override
  String get recoveryTips =>
      '• Направете слика од екранот од овие информации\n• Чувајте ги на безбедно место\n• Не споделувајте со никого\n• Ова ќе се прикаже само еднаш';

  @override
  String get themeSettingsTitle => 'Поставки на темата';

  @override
  String get lightThemeLabel => 'Светло';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Темно';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Систем';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Нашиот тим';

  @override
  String get teamDescription =>
      'Нашиот тим од професионални ведски астролози има долгогодишно искуство во толкување на планетарните влијанија и животните обрасци. Поддржан од посветен тим за поддршка и развој, Карма нуди беспрекорно, сигурно и глобално искуство за секој корисник.';
}
