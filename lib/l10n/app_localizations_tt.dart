// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tatar (`tt`).
class AppLocalizationsTt extends AppLocalizations {
  AppLocalizationsTt([String locale = 'tt']) : super(locale);

  @override
  String get settingsTitle => 'Көйләүләр';

  @override
  String get notificationSettings => 'Хәбәрләр көйләүләре';

  @override
  String get privacySettings => 'Хосусыйлык көйләүләре';

  @override
  String get accountSettings => 'Хисап көйләүләре';

  @override
  String get languageSettings => 'Тел көйләүләре';

  @override
  String get languageChanged => 'Тел үзгәрде';

  @override
  String get existingUserButton => 'Мин булган кулланучы';

  @override
  String get chooseCountryTitle => 'Илне сайлагыз';

  @override
  String get yesText => 'Әйе';

  @override
  String get noText => '.К';

  @override
  String get appBarTitle => 'Профиль көйләүләре';

  @override
  String get userIdLabel => 'Кулланучының ID *';

  @override
  String get nameLabel => 'Исем';

  @override
  String get birthCountryLabel => 'Туган ил';

  @override
  String get birthCityLabel => 'Туган шәһәр';

  @override
  String get countrySelectionTitle => 'Илегезне сайлагыз';

  @override
  String get maleLabel => 'Ир-ат';

  @override
  String get femaleLabel => 'Хатын-кыз';

  @override
  String get birthDateLabel => 'Туган көн';

  @override
  String get birthDatePlaceholder => 'Туган көнен сайлагыз';

  @override
  String get birthTimeLabel => 'Туган вакыт';

  @override
  String get birthTimePlaceholder => 'Туган вакытны сайлагыз';

  @override
  String get saveProfileButton => 'Профильне сакла';

  @override
  String get noCitiesFound => 'Шәһәрләр табылмады';

  @override
  String cityPlaceholder(Object country) {
    return 'Enter city in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Башта илне сайлагыз';

  @override
  String get versionHistoryTitle => 'Вариант тарихы';

  @override
  String get notSetText => 'Көтелмәгән';

  @override
  String nameHistory(Object name) {
    return 'Name: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'City: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Country: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Birth Date: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Birth Time: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Location: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'State: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Updated on $date';
  }

  @override
  String get userIdRequired => 'Кулланучының таныклыгы кирәк';

  @override
  String get profileSaved => 'Профиль уңышлы сакланды';

  @override
  String get saveFailed => 'Профильне саклый алмады';

  @override
  String get errorPrefix => 'Хата:';

  @override
  String get onboardingChooseLanguage => 'Сезнең телегезне сайлагыз';

  @override
  String get onboardingChooseLanguageDesc =>
      'Дәвам итәр өчен өстенлекле телегезне сайлагыз.';

  @override
  String get onboardingWhatIsAstrology => 'Нәрсә ул астрология?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрология - күк җисемнәрен өйрәнү ...';

  @override
  String get onboardingWhyUseApp => 'Нигә бу кушымтаны кулланырга?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Персональләштерелгән гороскоплар, көндәлек фаразлар, мәгълүматлы карарлар кабул итү өчен җитәкчелек алыгыз.';

  @override
  String get onboardingHowToUse => 'Бу кушымтаны ничек кулланырга?';

  @override
  String get onboardingHowToUseDesc =>
      'Easilyиңел юл белән йөрегез, көндәлек гороскопларны тикшерегез, төгәл фаразлау өчен профилегез белән идарә итегез.';

  @override
  String get onboardingGetStarted => 'Башлау';

  @override
  String get onboardingNewUser => 'Яңа кулланучы';

  @override
  String get onboardingExistingUser => 'Хәзерге кулланучы';

  @override
  String get onboardingBack => 'Кире';

  @override
  String get onboardingNext => 'Киләсе';

  @override
  String get userIdNotFound =>
      'Кулланучы таныклыгы табылмады. Зинһар, керегез яки профилегезне куегыз.';

  @override
  String get clearNotificationsTitle => 'Чиста хәбәрләр';

  @override
  String get clearNotificationsMessage =>
      'Сез барлык хәбәрләрне чистартырга телисезме?';

  @override
  String get clearNotificationsSuccess =>
      'Барлык хәбәрләр дә уңышлы чистартылды.';

  @override
  String get clearHoroscopeTitle => 'Гороскопны чистарту';

  @override
  String get clearHoroscopeMessage =>
      'Сез гороскоп мәгълүматларын чистартырга телисезме?';

  @override
  String get clearHoroscopeSuccess => 'Гороскоп уңышлы чистартылды.';

  @override
  String get clearChatTitle => 'Чат тарихын чистарту';

  @override
  String get clearChatMessage => 'Барлык чат тарихыгызны бетерергә телисезме?';

  @override
  String get clearChatLocal => 'Чат җирле чистартылды.';

  @override
  String get deleteAccountTitle => 'Хисапны бетерү';

  @override
  String get deleteAccountMessage =>
      'Сезнең счетыгызны бетерергә телисезме? Бу шулай ук сезнең чат тарихыгызны һәм хәбәрләрегезне чистартачак.';

  @override
  String get deleteAccountSuccess =>
      'Сезнең счетыгыз һәм барлык мәгълүматлар бетерелде.';

  @override
  String get deleteAccountError => 'Хисапны бетерүдә хата';

  @override
  String get logoutTitle => 'Чыгу';

  @override
  String get logoutMessage => 'Сез чыгарга телисезме?';

  @override
  String get termsPrivacyTitle => 'Шартлар һәм хосусыйлык';

  @override
  String get privacyPolicyTitle => 'Хосусыйлык политикасы';

  @override
  String get termsConditionsTitle => 'Шартлар';

  @override
  String get dataControlTitle => 'Мәгълүмат белән идарә итү';

  @override
  String get cancelButton => 'Баш тарту';

  @override
  String get confirmButton => 'Ышандыр';

  @override
  String get clearQuestionsSuccess => 'Барлык сораулар да уңышлы бетерелде.';

  @override
  String get yoginiLabel => 'Йогини';

  @override
  String get lordLabel => 'Ходаем';

  @override
  String get startLabel => 'Башлау';

  @override
  String get recoverAccount => 'Хисапны торгызу';

  @override
  String get endLabel => 'Ахыр';

  @override
  String get startDateLabel => 'Башлау датасы';

  @override
  String get endDateLabel => 'Ахыр датасы';

  @override
  String get notAvailable => 'Мөмкин түгел';

  @override
  String get noData => 'Мәгълүмат юк';

  @override
  String get unknownError => 'Билгесез хата';

  @override
  String get retryButton => 'Кабатлап карагыз';

  @override
  String get kundaliGeneratorTitle => 'Кундали Генераторы';

  @override
  String get natalChartTitle => 'Наталь диаграмма';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Күтәрелү дәрәҗәсе';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Билгесез';

  @override
  String get clearHoroscope => 'Гороскопны чистарту';

  @override
  String get clearNotifications => 'Чиста хәбәрләр';

  @override
  String get clearChatHistory => 'Чат тарихын чистарту';

  @override
  String get logout => 'Чыгу';

  @override
  String get deleteAccount => 'Хисапны бетерү';

  @override
  String get allFieldsRequired => 'Барлык кырлар да кирәк.';

  @override
  String get accountRecoveredSuccess => 'Хисап уңышлы торгызылды.';

  @override
  String get recoveryFailed => 'Бетерү уңышсыз. Мәгълүматыгызны тикшерегез.';

  @override
  String get recoverySecretLabel => 'Реставрация сере:';

  @override
  String get aboutUsTitle => 'Безнең турында';

  @override
  String get aboutOurCompany => 'Безнең компания турында';

  @override
  String get aboutCompanyDescription =>
      'Кармада без сезгә Ведик астрологиянең вакытсыз зирәклеге аша чын тормыш юлыгызны ачарга булышабыз. Everyәрбер аңлау чын, тәҗрибәле астрологлардан килә, сезнең уникаль туу схемасы нигезендә җентекләп эшләнгән. Көндәлек гороскоплардан алып шәхси җитәкчелеккә кадәр, Карма борыңгы белемнәрне 100 дән артык телдә куллана.';

  @override
  String get ourMission => 'Безнең миссия';

  @override
  String get missionDescription =>
      'Безнең миссия бик гади: ышанычлы, мәгълүматлы карарлар кабул итү өчен көч бирүче, кеше җитәкчелегендәге астрологик җитәкчелек бирү. Everyәрбер фаразлау һәм консультация автоматлаштырылган алгоритм түгел, күп еллык профессиональ тәҗрибәне чагылдыра.';

  @override
  String get ourVision => 'Безнең күренеш';

  @override
  String get visionDescription =>
      'Без Ведик астрология өчен дөньяның иң ышанычлы мәйданы булырга омтылабыз, кешеләргә үзләрен, сайлауларын, тормыш сәяхәтләрен ачыклык һәм ышаныч белән аңларга булышабыз.';

  @override
  String get ourValues => 'Безнең кыйммәтләр';

  @override
  String get valuesDescription =>
      'Кармада без чынлыкны, төгәллекне, ышанычны кадерлибез. Без төгәл генә түгел, ә мәгънәле җитәкчелек тәкъдим итәргә тәвәккәл, тормышны зирәклек һәм ышаныч белән алып барырга булышабыз.';

  @override
  String get contactUs => 'Безнең белән элемтәгә керегез';

  @override
  String get contactEmail => 'Электрон почта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Вебсайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Клиентларга ярдәм';

  @override
  String get supportHeroTitle => 'Без монда булышырга';

  @override
  String get supportHeroDescription =>
      'Түбәндәге форманы тутырыгыз, безнең ярдәм командасы тиз арада сезгә кайтачак.';

  @override
  String get yourName => 'Синең исемең';

  @override
  String get yourEmail => 'Сезнең электрон почта';

  @override
  String get message => 'Хәбәр';

  @override
  String get enterEmail => 'Электрон почтагызны кертегез';

  @override
  String get enterValidEmail => 'Дөрес электрон почта адресын кертегез';

  @override
  String enterField(Object fieldName) {
    return 'Enter $fieldName';
  }

  @override
  String get send => 'Sendибәр';

  @override
  String get sending => 'Ибәрү ...';

  @override
  String get emailSentSuccess => 'Mail Электрон почта уңышлы җибәрелде!';

  @override
  String get emailSendFailed => 'Email Электрон почта җибәрә алмады';

  @override
  String get astroDictionaryTitle => 'Астро сүзлеге';

  @override
  String get searchTermsHint => 'Эзләү терминнары ...';

  @override
  String get noTermsFound => 'Терминнар табылмады';

  @override
  String get buyQuestionsTitle => 'Сораулар сатып алыгыз';

  @override
  String get userNotAuthenticated => 'Кулланучы расланмаган';

  @override
  String get loadStoreDataFailed => 'Кибет мәгълүматларын йөкли алмады';

  @override
  String get missingAuthToken => 'Сагыну';

  @override
  String get merchantDisplayName => 'Астро Чат кушымтасы';

  @override
  String get paymentSuccessful => 'Ment Түләү уңышлы! Сорау җибәрелде';

  @override
  String paymentFailed(Object error) {
    return '❌ Payment failed: $error';
  }

  @override
  String get yourBalance => 'Сезнең баланс';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Мөмкин тәкъдимнәр';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Сатып ал';

  @override
  String get dailyHoroscopeTitle => '🌟 Көндәлек гороскоп';

  @override
  String get userIdMissing => 'Кулланучы таныклыгы юк';

  @override
  String get fetchHoroscopesFailed => 'Гороскоплар ала алмады';

  @override
  String get noHoroscopeFound => 'Гороскоп табылмады.';

  @override
  String get signLabel => 'Билге';

  @override
  String get todayLabel => 'Бүген';

  @override
  String get yesterdayLabel => 'Кичә';

  @override
  String get thisWeekLabel => 'Бу атнада';

  @override
  String get lastMonthLabel => 'Соңгы ай';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Соравыгызны языгыз ...';

  @override
  String get paymentRequired => 'Түләү кирәк';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Сез буш сорауларны кулландыгыз. Дәвам итәр өчен $amount түләгез.';
  }

  @override
  String get payNowButton => 'Хәзер түләгез';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count free questions remaining';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count paid questions remaining';
  }

  @override
  String get thankYouFeedback => 'Фикерләрегез өчен рәхмәт!';

  @override
  String get ratingSubmitted => 'Рейтинг тапшырылды!';

  @override
  String get setUserIdFirst => 'Зинһар, башта кулланучы таныклыгыгызны куегыз';

  @override
  String get failedToFetchPrevious =>
      'Алдагы сорауларны һәм җавапларны ала алмады';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профиле';

  @override
  String get drawerDailyHoroscope => 'Көндәлек гороскоп';

  @override
  String get drawerBuyQuestions => 'Сораулар сатып алыгыз';

  @override
  String get drawerAstroDictionary => 'Астро сүзлеге';

  @override
  String get drawerSettings => 'Көйләүләр';

  @override
  String get drawerCustomerSupport => 'Клиентларга ярдәм';

  @override
  String get drawerAbout => 'Турында';

  @override
  String get drawerProfileSettings => 'Профиль көйләүләре';

  @override
  String get demoNotificationTitle => 'O Демо хәбәр итү';

  @override
  String get demoNotificationBody => 'Бу сезнең кушымтадан сынау хәбәре!';

  @override
  String get notificationsTitle => 'Хәбәрләр';

  @override
  String get noNotifications => 'Хәбәрләр юк';

  @override
  String get allTab => 'Барысы да';

  @override
  String get markAllAsRead => 'Барысын да укылганча билгеләргә';

  @override
  String get notificationMarkedRead => 'Укылган дип билгеләнгән хәбәр';

  @override
  String get failedToLoadNotifications => 'Хәбәрләр йөкләнмәде';

  @override
  String get failedToMarkRead => 'Укылган дип билгеләргә булмады';

  @override
  String get failedToMarkAllRead => 'Барысын да укылган дип билгели алмады';

  @override
  String get socketConnected => 'Сокет тоташтырылган';

  @override
  String get socketDisconnected => 'Сокет өзелгән';

  @override
  String get newNotificationReceived => 'Яңа хәбәр килде';

  @override
  String get generalCategory => 'Генерал';

  @override
  String get horoscopeCategory => 'Гороскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Система';

  @override
  String get updateCategory => 'Яңартулар';

  @override
  String get howToAskTitle => 'Ничек сорарга';

  @override
  String get noQuestionsAvailable => 'Сораулар юк';

  @override
  String get failedToLoadQuestions => 'Сорауларны йөкли алмады';

  @override
  String get pullToRefresh => 'Яңартырга тарт';

  @override
  String get careerCategory => 'Карьера';

  @override
  String get loveCategory => 'Мәхәббәт һәм мөнәсәбәтләр';

  @override
  String get healthCategory => 'Сәламәтлек';

  @override
  String get financeCategory => 'Финанс';

  @override
  String get familyCategory => 'Гаилә';

  @override
  String get educationCategory => 'Мәгариф';

  @override
  String get travelCategory => 'Сәяхәт';

  @override
  String get spiritualCategory => 'Рухи';

  @override
  String get profileLoaded => 'Профиль уңышлы йөкләнде';

  @override
  String get imageUploaded => 'Рәсем уңышлы йөкләнде';

  @override
  String get savedInformationConfirmation => 'Мин бу мәгълүматны сакладым';

  @override
  String get noHistoryAvailable => 'Тарих юк';

  @override
  String get missingUserIdError => 'Кулланучының таныклыгы кирәк';

  @override
  String get networkError => 'Челтәр хата. Зинһар, кабатлап карагыз.';

  @override
  String get timeoutError => 'Сорау вакыты бетте';

  @override
  String get genericError => 'Нәрсәдер дөрес булмаган';

  @override
  String get reactionUpdateError => 'Реакцияне яңарта алмады';

  @override
  String get noSearchResults => 'Эзләү нәтиҗәләре табылмады';

  @override
  String get clearSearch => 'Эзләү';

  @override
  String get resultsFound => 'Нәтиҗә табылды';

  @override
  String get recoverySecretHint =>
      'Күчереп язу эшләмәскә мөмкин, кул белән языгыз';

  @override
  String get recoverAccountDescription =>
      'Хисап язмагызны торгызу өчен бу адымнарны үтәгез';

  @override
  String get processingLabel => 'Эшкәртү ...';

  @override
  String get clearChatSuccess => 'Чат уңышлы чистартылды';

  @override
  String get notificationsEnabled => 'Хәбәрләр кушылган';

  @override
  String get notificationsDisabled => 'Хәбәрләр сүндерелгән';

  @override
  String get securityNotice =>
      'Сезнең мәгълүматлар куркынычсыз шифрланган һәм сакланган';

  @override
  String get loading => 'Йөкләү ...';

  @override
  String get selectLanguage => 'Телне сайлагыз';

  @override
  String get onboardingGetStartedDesc =>
      'Languageз телеңне сайлап башлап җибәр';

  @override
  String get accountRecoveryTitle => '🔐 Хисапны торгызу турында мәгълүмат';

  @override
  String get recoveryInstructions =>
      'Зинһар, бу мәгълүматны саклагыз. Сезнең счетыгызны торгызу өчен сезгә кирәк булачак.';

  @override
  String get importantNotice => '⚠️ Мөһим:';

  @override
  String get astrologerProfileTitle => 'Астролог профиле';

  @override
  String get personalAstrologer => 'Шәхси астролог';

  @override
  String get makePersonalAstrologer => 'Шәхси астролог ясагыз';

  @override
  String get favoriteDescription =>
      'Сезнең сорауларыгыз бу астрологка өстенлек биреләчәк. Мөмкин булмаса, сезгә тагын бер квалификацияле астролог ярдәм итәчәк.';

  @override
  String get educationQualifications => 'Мәгариф һәм квалификация';

  @override
  String get aboutSection => 'Турында';

  @override
  String get shareProfile => 'Профильне бүлешү';

  @override
  String get loadingAstrologer => 'Йолдызчы детальләрен йөкләү ...';

  @override
  String get failedToLoadAstrologer => 'Йолдызчы детальләрен йөкли алмады';

  @override
  String get authenticationRequired => 'Аутентификация кирәк. Зинһар, керегез.';

  @override
  String securityCheckFailed(Object error) {
    return 'Security check failed: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is now your Personal Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Removed $name from favorites';
  }

  @override
  String get toggleFavoriteError => 'Яраткан статусны яңарта алмады';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Education: $education\n📜 Qualification: $qualification\n⏳ Experience: $experience';
  }

  @override
  String get notProvided => 'Бирелмәгән';

  @override
  String reviews(Object count) {
    return '($count reviews)';
  }

  @override
  String get specialties => 'Белгечлекләр';

  @override
  String get experience => 'Тәҗрибә';

  @override
  String get qualification => 'Квалификация';

  @override
  String get education => 'Мәгариф';

  @override
  String get recoveryTips =>
      '• Бу мәгълүматның скриншотын алыгыз\n• Аны куркынычсыз урында саклагыз\n• Беркем белән дә бүлешмәгез\n• Бу бер генә тапкыр күрсәтеләчәк';

  @override
  String get themeSettingsTitle => 'Тема көйләүләре';

  @override
  String get lightThemeLabel => 'Яктылык';

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
  String get ourTeam => 'Безнең команда';

  @override
  String get teamDescription =>
      'Безнең профессиональ Ведик астрологлар командасы планета йогынтысын һәм тормыш рәвешен аңлату буенча күп еллык тәҗрибә алып килә. Аерым ярдәм һәм үсеш коллективы ярдәмендә Карма һәр кулланучы өчен бертуктаусыз, ышанычлы һәм глобаль тәҗрибә бирә.';
}
