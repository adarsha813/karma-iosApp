// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get settingsTitle => 'Подешавања';

  @override
  String get notificationSettings => 'Подешавања обавештења';

  @override
  String get privacySettings => 'Подешавања приватности';

  @override
  String get accountSettings => 'Подешавања налога';

  @override
  String get languageSettings => 'Подешавања језика';

  @override
  String get languageChanged => 'Језик је промењен';

  @override
  String get existingUserButton => 'Ја сам постојећи корисник';

  @override
  String get chooseCountryTitle => 'Изаберите земљу';

  @override
  String get yesText => 'Да';

  @override
  String get noText => 'Не';

  @override
  String get appBarTitle => 'Подешавања профила';

  @override
  String get userIdLabel => 'ИД корисника *';

  @override
  String get nameLabel => 'Име';

  @override
  String get birthCountryLabel => 'Земља рођења';

  @override
  String get birthCityLabel => 'Град рођења';

  @override
  String get countrySelectionTitle => 'Изаберите своју земљу';

  @override
  String get maleLabel => 'Мушки';

  @override
  String get femaleLabel => 'Женско';

  @override
  String get birthDateLabel => 'Датум рођења';

  @override
  String get birthDatePlaceholder => 'Изаберите датум рођења';

  @override
  String get birthTimeLabel => 'Време рођења';

  @override
  String get birthTimePlaceholder => 'Изаберите време рођења';

  @override
  String get saveProfileButton => 'Сачувај профил';

  @override
  String get noCitiesFound => 'Није пронађен ниједан град';

  @override
  String cityPlaceholder(Object country) {
    return 'Унесите град у $country';
  }

  @override
  String get countryFirstPlaceholder => 'Прво изаберите земљу';

  @override
  String get versionHistoryTitle => 'Историја верзија';

  @override
  String get notSetText => 'Није подешено';

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
    return 'Земља: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Пол: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Датум рођења: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Време рођења: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Локација: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Летње време: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Држава: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ажурирано $date';
  }

  @override
  String get userIdRequired => 'ИД корисника је обавезан';

  @override
  String get profileSaved => 'Профил је успешно сачуван';

  @override
  String get saveFailed => 'Чување профила није успело';

  @override
  String get errorPrefix => 'Грешка:';

  @override
  String get onboardingChooseLanguage => 'Изаберите свој језик';

  @override
  String get onboardingChooseLanguageDesc =>
      'Изаберите жељени језик да бисте наставили.';

  @override
  String get onboardingWhatIsAstrology => 'Шта је астрологија?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрологија је древна наука о кретању небеских тела и њиховом утицају на људски живот, која нуди увид у личност, односе и животне догађаје.';

  @override
  String get onboardingWhyUseApp => 'Зашто користити ову апликацију?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Добијајте тачне, људски генерисане хороскопе и смернице прилагођене вашој наталној карти. Доносите информисане одлуке уз дневне прогнозе и персонализоване савете искусних астролога.';

  @override
  String get onboardingHowToUse => 'Како се користи ова апликација?';

  @override
  String get onboardingHowToUseDesc =>
      'Једноставно унесите датум рођења, тачно време, место рођења и све друге релевантне детаље да бисте одмах почели. Истражите дневне хороскопе, постављајте питања стручним астролозима и управљајте својим профилом за прецизна, персонализована предвиђања — није потребно пријављивање.';

  @override
  String get onboardingGetStarted => 'Започните';

  @override
  String get onboardingNewUser => 'Нови корисник';

  @override
  String get onboardingExistingUser => 'Постојећи корисник';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingNext => 'Следеће';

  @override
  String get userIdNotFound =>
      'ИД корисника није пронађен. Молимо вас да се пријавите или подесите свој профил.';

  @override
  String get clearNotificationsTitle => 'Обриши обавештења';

  @override
  String get clearNotificationsMessage =>
      'Да ли сте сигурни да желите да обришете сва обавештења?';

  @override
  String get clearNotificationsSuccess => 'Сва обавештења су успешно обрисана.';

  @override
  String get clearHoroscopeTitle => 'Јасан хороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Да ли сте сигурни да желите да обришете податке свог хороскопа?';

  @override
  String get clearHoroscopeSuccess => 'Хороскоп је успешно обрисан.';

  @override
  String get clearChatTitle => 'Обриши историју ћаскања';

  @override
  String get clearChatMessage =>
      'Да ли сте сигурни да желите да обришете сву историју ћаскања?';

  @override
  String get clearChatLocal => 'Ћаскање је локално обрисано.';

  @override
  String get deleteAccountTitle => 'Обриши налог';

  @override
  String get deleteAccountMessage =>
      'Да ли сте сигурни да желите да обришете свој налог? Овим ћете такође обрисати сву историју ћаскања и обавештења.';

  @override
  String get deleteAccountSuccess => 'Ваш налог и сви подаци су уклоњени.';

  @override
  String get deleteAccountError => 'Грешка при брисању налога';

  @override
  String get logoutTitle => 'Одјава';

  @override
  String get logoutMessage => 'Да ли сте сигурни да желите да се одјавите?';

  @override
  String get termsPrivacyTitle => 'Услови и приватност';

  @override
  String get privacyPolicyTitle => 'Политика приватности';

  @override
  String get termsConditionsTitle => 'Услови и одредбе';

  @override
  String get dataControlTitle => 'Контрола података';

  @override
  String get cancelButton => 'Откажи';

  @override
  String get confirmButton => 'Потврди';

  @override
  String get clearQuestionsSuccess => 'Сва питања су успешно обрисана.';

  @override
  String get yoginiLabel => 'Јогини';

  @override
  String get lordLabel => 'Господ';

  @override
  String get startLabel => 'Почетак';

  @override
  String get recoverAccount => 'Опорави налог';

  @override
  String get endLabel => 'Крај';

  @override
  String get startDateLabel => 'Датум почетка';

  @override
  String get endDateLabel => 'Крајњи датум';

  @override
  String get notAvailable => 'Није доступно';

  @override
  String get noData => 'Нема података';

  @override
  String get unknownError => 'Непозната грешка';

  @override
  String get retryButton => 'Покушај поново';

  @override
  String get kundaliGeneratorTitle => 'Кундали генератор';

  @override
  String get natalChartTitle => 'Натална карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Асцендентски степен';

  @override
  String get vimshottariDashaTitle => 'Вимшотари Даша';

  @override
  String get yoginiDashaTitle => 'Јогини Даша';

  @override
  String get unknown => 'Непознато';

  @override
  String get clearHoroscope => 'Јасан хороскоп';

  @override
  String get clearNotifications => 'Обриши обавештења';

  @override
  String get clearChatHistory => 'Обриши историју ћаскања';

  @override
  String get logout => 'Одјава';

  @override
  String get deleteAccount => 'Обриши налог';

  @override
  String get allFieldsRequired => 'Сва поља су обавезна.';

  @override
  String get accountRecoveredSuccess => 'Налог је успешно враћен.';

  @override
  String get recoveryFailed => 'Опоравак није успео. Проверите своје податке.';

  @override
  String get recoverySecretLabel => 'Тајна опоравка:';

  @override
  String get aboutUsTitle => 'О нама';

  @override
  String get aboutOurCompany => 'О нашој компанији';

  @override
  String get aboutCompanyDescription =>
      'У Карми вам помажемо да откријете свој прави животни пут кроз безвременску мудрост ведске астрологије. Сваки увид долази од правих, искусних астролога, пажљиво израђених на основу ваше јединствене наталне карте. Од дневних хороскопа до персонализованог вођења, Карма чини древно знање доступним на преко 100 језика.';

  @override
  String get ourMission => 'Наша мисија';

  @override
  String get missionDescription =>
      'Наша мисија је једноставна: да пружимо аутентично, људски вођено астролошко вођство које вам омогућава да доносите самоуверене и информисане одлуке. Свако предвиђање и консултација одражава године професионалног искуства, а не аутоматизоване алгоритме.';

  @override
  String get ourVision => 'Наша визија';

  @override
  String get visionDescription =>
      'Тежимо да будемо најпоузданија платформа за ведску астрологију на свету, помажући људима свуда да разумеју себе, своје изборе и свој животни пут са јасноћом и самопоуздањем.';

  @override
  String get ourValues => 'Наше вредности';

  @override
  String get valuesDescription =>
      'У Карми ценимо аутентичност, прецизност и поверење. Посвећени смо пружању смерница које су не само тачне већ и смислене, помажући вам да се крећете кроз живот са увидом и самопоуздањем.';

  @override
  String get contactUs => 'Контактирајте нас';

  @override
  String get contactEmail => 'Е-пошта: care@karmalifepath.com';

  @override
  String get contactWebsite => 'Веб-сајт: www.karmalifepath.com';

  @override
  String get customerSupport => 'Корисничка подршка';

  @override
  String get supportHeroTitle => 'Ту смо да помогнемо';

  @override
  String get supportHeroDescription =>
      'Попуните доњу форму и наш тим за подршку ће вам се јавити у најкраћем могућем року.';

  @override
  String get yourName => 'Ваше име';

  @override
  String get yourEmail => 'Ваша имејл адреса';

  @override
  String get message => 'Порука';

  @override
  String get enterEmail => 'Унесите своју имејл адресу';

  @override
  String get enterValidEmail => 'Унесите важећу адресу е-поште';

  @override
  String enterField(Object fieldName) {
    return 'Унесите $fieldName';
  }

  @override
  String get send => 'Пошаљи';

  @override
  String get sending => 'Слање...';

  @override
  String get emailSentSuccess => '✅ Имејл је успешно послат!';

  @override
  String get emailSendFailed => '❌ Слање имејла није успело';

  @override
  String get astroDictionaryTitle => 'Астро речник';

  @override
  String get searchTermsHint => 'Претражи појмове...';

  @override
  String get noTermsFound => 'Није пронађен ниједан термин';

  @override
  String get buyQuestionsTitle => 'Питања о куповини';

  @override
  String get userNotAuthenticated => 'Корисник није аутентификован';

  @override
  String get loadStoreDataFailed => 'Учитавање података продавнице није успело';

  @override
  String get missingAuthToken => 'Недостаје токен за аутентификацију';

  @override
  String get merchantDisplayName => 'Астро апликација за ћаскање';

  @override
  String get paymentSuccessful => '✅ Плаћање успешно! Питање послато';

  @override
  String paymentFailed(Object error) {
    return '❌ Плаћање није успело: $error';
  }

  @override
  String get yourBalance => 'Ваш салдо';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Доступне понуде';

  @override
  String questionsCount(Object count) {
    return '$count Питање';
  }

  @override
  String get buyButton => 'Купи';

  @override
  String get dailyHoroscopeTitle => ' Дневни хороскоп';

  @override
  String get userIdMissing => 'Недостаје ИД корисника';

  @override
  String get fetchHoroscopesFailed => 'Преузимање хороскопа није успело';

  @override
  String get noHoroscopeFound => 'Није пронађен хороскоп.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Данас';

  @override
  String get yesterdayLabel => 'Јуче';

  @override
  String get thisWeekLabel => 'Ове недеље';

  @override
  String get lastMonthLabel => 'Прошлог месеца';

  @override
  String get chatTitle => 'Ћаскање';

  @override
  String get typeYourQuestionHint => 'Унесите своје питање...';

  @override
  String get paymentRequired => 'Потребна је уплата';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Искористили сте своја бесплатна питања. Платите $amount да бисте наставили.';
  }

  @override
  String get payNowButton => 'Плати сада';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Преостало је $count бесплатних питања';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Преостало је $count плаћених питања';
  }

  @override
  String get thankYouFeedback => 'Хвала вам на повратним информацијама!';

  @override
  String get ratingSubmitted => 'Оцена послата!';

  @override
  String get setUserIdFirst => 'Прво подесите свој кориснички ИД';

  @override
  String get failedToFetchPrevious =>
      'Није успело преузимање претходних питања и одговора';

  @override
  String errorOccurred(Object error) {
    return 'Грешка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профил';

  @override
  String get drawerDailyHoroscope => 'Дневни хороскоп';

  @override
  String get drawerBuyQuestions => 'Питања о куповини';

  @override
  String get drawerAstroDictionary => 'Астро речник';

  @override
  String get drawerSettings => 'Подешавања';

  @override
  String get drawerCustomerSupport => 'Корисничка подршка';

  @override
  String get drawerAbout => 'О нама';

  @override
  String get drawerProfileSettings => 'Подешавања профила';

  @override
  String get demoNotificationTitle => '🔔 Обавештење о демо верзији';

  @override
  String get demoNotificationBody =>
      'Ово је тест обавештење из ваше апликације!';

  @override
  String get notificationsTitle => 'Обавештења';

  @override
  String get noNotifications => 'Нема обавештења';

  @override
  String get allTab => 'Сви';

  @override
  String get markAllAsRead => 'Означи све као прочитано';

  @override
  String get notificationMarkedRead => 'Обавештење означено као прочитано';

  @override
  String get failedToLoadNotifications => 'Учитавање обавештења није успело';

  @override
  String get failedToMarkRead => 'Означавање као прочитано није успело';

  @override
  String get failedToMarkAllRead =>
      'Означавање свих као прочитаних није успело';

  @override
  String get socketConnected => 'Утичница повезана';

  @override
  String get socketDisconnected => 'Утичница је искључена';

  @override
  String get newNotificationReceived => 'Примљено је ново обавештење';

  @override
  String get generalCategory => 'Опште';

  @override
  String get horoscopeCategory => 'Хороскоп';

  @override
  String get chatCategory => 'Ћаскање';

  @override
  String get systemCategory => 'Систем';

  @override
  String get updateCategory => 'Ажурирања';

  @override
  String get howToAskTitle => 'Како питати';

  @override
  String get noQuestionsAvailable => 'Нема доступних питања';

  @override
  String get failedToLoadQuestions => 'Учитавање питања није успело';

  @override
  String get pullToRefresh => 'Повуците да бисте освежили';

  @override
  String get careerCategory => 'Каријера';

  @override
  String get loveCategory => 'Љубав и везе';

  @override
  String get healthCategory => 'Здравље';

  @override
  String get financeCategory => 'Финансије';

  @override
  String get familyCategory => 'Породица';

  @override
  String get educationCategory => 'Образовање';

  @override
  String get travelCategory => 'Путовања';

  @override
  String get spiritualCategory => 'Духовни';

  @override
  String get profileLoaded => 'Профил је успешно учитан';

  @override
  String get imageUploaded => 'Слика је успешно отпремљена';

  @override
  String get savedInformationConfirmation => 'Сачувао/ла сам ове информације';

  @override
  String get noHistoryAvailable => 'Нема доступне историје';

  @override
  String get missingUserIdError => 'ИД корисника је обавезан';

  @override
  String get networkError => 'Грешка на мрежи. Молимо покушајте поново.';

  @override
  String get timeoutError => 'Временско ограничење захтева је истекло';

  @override
  String get genericError => 'Нешто је пошло наопако';

  @override
  String get reactionUpdateError => 'Ажурирање реакције није успело';

  @override
  String get noSearchResults => 'Нису пронађени резултати претраге';

  @override
  String get clearSearch => 'Обриши претрагу';

  @override
  String get resultsFound => 'Пронађени резултати';

  @override
  String get recoverySecretHint =>
      'Копирање и лепљење можда неће функционисати, куцајте ручно';

  @override
  String get recoverAccountDescription =>
      'Пратите ове кораке да бисте повратили свој налог';

  @override
  String get processingLabel => 'Обрађује се...';

  @override
  String get clearChatSuccess => 'Ћаскање је успешно обрисано';

  @override
  String get notificationsEnabled => 'Обавештења су омогућена';

  @override
  String get notificationsDisabled => 'Обавештења су онемогућена';

  @override
  String get securityNotice => 'Ваши подаци су безбедно шифровани и сачувани';

  @override
  String get loading => 'Учитавање...';

  @override
  String get selectLanguage => 'Изаберите језик';

  @override
  String get onboardingGetStartedDesc =>
      'Започните тако што ћете изабрати свој језик';

  @override
  String get accountRecoveryTitle => '🔐 Детаљи о опоравку налога';

  @override
  String get recoveryInstructions =>
      'Молимо вас да безбедно сачувате ове информације. Биће вам потребне да бисте повратили приступ налогу.';

  @override
  String get importantNotice => '⚠️ Важно:';

  @override
  String get astrologerProfileTitle => 'Профил астролога';

  @override
  String get personalAstrologer => 'Лични астролог';

  @override
  String get makePersonalAstrologer => 'Направите личног астролога';

  @override
  String get favoriteDescription =>
      'Ваша питања ће бити приоритетно додељена овом астрологу. Уколико није доступан, други квалификовани астролог ће вам помоћи.';

  @override
  String get educationQualifications => 'Образовање и квалификације';

  @override
  String get aboutSection => 'О нама';

  @override
  String get shareProfile => 'Дели профил';

  @override
  String get loadingAstrologer => 'Учитавање података астролога...';

  @override
  String get failedToLoadAstrologer =>
      'Учитавање података о астрологу није успело';

  @override
  String get authenticationRequired =>
      'Потребна је аутентификација. Молимо вас да се пријавите.';

  @override
  String securityCheckFailed(Object error) {
    return 'Безбедносна провера није успела: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name је сада ваш лични астролог';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Уклоњено $name из омиљених';
  }

  @override
  String get toggleFavoriteError => 'Ажурирање статуса омиљених није успело';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Образовање: $education\n📜 Квалификација: $qualification\n⏳ Искуство: $experience';
  }

  @override
  String get notProvided => 'Није наведено';

  @override
  String reviews(Object count) {
    return '($count рецензија)';
  }

  @override
  String get specialties => 'Специјалитети';

  @override
  String get experience => 'Искуство';

  @override
  String get qualification => 'Квалификација';

  @override
  String get education => 'Образовање';

  @override
  String get recoveryTips =>
      '• Направите снимак екрана ових информација\n• Чувајте их на сигурном месту\n• Не делите ни са ким\n• Ово ће бити приказано само једном';

  @override
  String get themeSettingsTitle => 'Подешавања теме';

  @override
  String get lightThemeLabel => 'Светло';

  @override
  String get lightThemeDescription => 'Увек користи светлу тему';

  @override
  String get darkThemeLabel => 'Тамно';

  @override
  String get darkThemeDescription => 'Увек користи тамну тему';

  @override
  String get systemThemeLabel => 'Систем';

  @override
  String get systemThemeDarkDescription =>
      'Пратите системска подешавања за тамну тему';

  @override
  String get systemThemeLightDescription =>
      'Пратите системска подешавања за светлу тему';

  @override
  String get switchToLight => 'Пребаци на светло';

  @override
  String get switchToDark => 'Пребаци на тамно';

  @override
  String get ourTeam => 'Наш тим';

  @override
  String get teamDescription =>
      'Наш тим професионалних ведских астролога има дугогодишње искуство у тумачењу планетарних утицаја и животних образаца. Уз подршку посвећеног тима за подршку и развој, Карма пружа беспрекорно, поуздано и глобално искуство за сваког корисника.';
}
