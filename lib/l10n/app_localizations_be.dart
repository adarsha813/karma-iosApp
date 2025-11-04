// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get settingsTitle => 'Налады';

  @override
  String get notificationSettings => 'Налады апавяшчэнняў';

  @override
  String get privacySettings => 'Налады прыватнасці';

  @override
  String get accountSettings => 'Налады ўліковага запісу';

  @override
  String get languageSettings => 'Моўныя налады';

  @override
  String get languageChanged => 'Мова зменена';

  @override
  String get existingUserButton => 'Я ўжо зарэгістраваны карыстальнік';

  @override
  String get chooseCountryTitle => 'Выберыце краіну';

  @override
  String get yesText => 'Так';

  @override
  String get noText => 'Не';

  @override
  String get appBarTitle => 'Налады профілю';

  @override
  String get userIdLabel => 'Ідэнтыфікатар карыстальніка *';

  @override
  String get nameLabel => 'Імя';

  @override
  String get birthCountryLabel => 'Краіна нараджэння';

  @override
  String get birthCityLabel => 'Горад нараджэння';

  @override
  String get countrySelectionTitle => 'Выберыце сваю краіну';

  @override
  String get maleLabel => 'Мужчынскі';

  @override
  String get femaleLabel => 'Жанчына';

  @override
  String get birthDateLabel => 'Дата нараджэння';

  @override
  String get birthDatePlaceholder => 'Выберыце дату нараджэння';

  @override
  String get birthTimeLabel => 'Час нараджэння';

  @override
  String get birthTimePlaceholder => 'Выберыце час нараджэння';

  @override
  String get saveProfileButton => 'Захаваць профіль';

  @override
  String get noCitiesFound => 'Гарады не знойдзены';

  @override
  String cityPlaceholder(Object country) {
    return 'Увядзіце горад у $country';
  }

  @override
  String get countryFirstPlaceholder => 'Спачатку выберыце краіну';

  @override
  String get versionHistoryTitle => 'Гісторыя версій';

  @override
  String get notSetText => 'Не зададзена';

  @override
  String nameHistory(Object name) {
    return 'Імя: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Горад: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Краіна: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Пол: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Дата нараджэння: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Час нараджэння: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Месцазнаходжанне: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Летні час: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Штат: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Абноўлена $date';
  }

  @override
  String get userIdRequired => 'Патрабуецца ідэнтыфікатар карыстальніка';

  @override
  String get profileSaved => 'Профіль паспяхова захаваны';

  @override
  String get saveFailed => 'Не ўдалося захаваць профіль';

  @override
  String get errorPrefix => 'Памылка:';

  @override
  String get onboardingChooseLanguage => 'Выберыце сваю мову';

  @override
  String get onboardingChooseLanguageDesc =>
      'Выберыце патрэбную мову, каб працягнуць.';

  @override
  String get onboardingWhatIsAstrology => 'Што такое астралогія?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астралогія — гэта навука пра нябесныя целы...';

  @override
  String get onboardingWhyUseApp => 'Чаму выкарыстоўваць гэта дадатак?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Атрымлівайце персаналізаваныя гараскопы, штодзённыя прагнозы і рэкамендацыі для прыняцця абгрунтаваных рашэнняў.';

  @override
  String get onboardingHowToUse => 'Як карыстацца гэтым дадаткам?';

  @override
  String get onboardingHowToUseDesc =>
      'Лёгка перамяшчайцеся, правярайце штодзённыя гараскопы і кіруйце сваім профілем для дакладных прагнозаў.';

  @override
  String get onboardingGetStarted => 'Пачаць';

  @override
  String get onboardingNewUser => 'Новы карыстальнік';

  @override
  String get onboardingExistingUser => 'Існуючы карыстальнік';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingNext => 'Далей';

  @override
  String get userIdNotFound =>
      'Ідэнтыфікатар карыстальніка не знойдзены. Калі ласка, увайдзіце ў сістэму або наладзьце свой профіль.';

  @override
  String get clearNotificationsTitle => 'Ачысціць апавяшчэнні';

  @override
  String get clearNotificationsMessage =>
      'Вы ўпэўненыя, што хочаце ачысціць усе апавяшчэнні?';

  @override
  String get clearNotificationsSuccess => 'Усе апавяшчэнні паспяхова выдалены.';

  @override
  String get clearHoroscopeTitle => 'Ачысціць гараскоп';

  @override
  String get clearHoroscopeMessage =>
      'Вы ўпэўненыя, што хочаце ачысціць дадзеныя свайго гараскопа?';

  @override
  String get clearHoroscopeSuccess => 'Гараскоп паспяхова ачышчаны.';

  @override
  String get clearChatTitle => 'Ачысціць гісторыю чата';

  @override
  String get clearChatMessage =>
      'Вы ўпэўненыя, што хочаце выдаліць усю гісторыю чата?';

  @override
  String get clearChatLocal => 'Чат ачышчаны лакальна.';

  @override
  String get deleteAccountTitle => 'Выдаліць уліковы запіс';

  @override
  String get deleteAccountMessage =>
      'Вы ўпэўненыя, што хочаце выдаліць свой уліковы запіс? Гэта таксама ачысціць усю гісторыю чатаў і апавяшчэнні.';

  @override
  String get deleteAccountSuccess =>
      'Ваш уліковы запіс і ўсе даныя былі выдалены.';

  @override
  String get deleteAccountError => 'Памылка выдалення ўліковага запісу';

  @override
  String get logoutTitle => 'Выйсці';

  @override
  String get logoutMessage => 'Вы ўпэўненыя, што хочаце выйсці?';

  @override
  String get termsPrivacyTitle => 'Умовы і прыватнасць';

  @override
  String get privacyPolicyTitle => 'Палітыка прыватнасці';

  @override
  String get termsConditionsTitle => 'Умовы і палажэнні';

  @override
  String get dataControlTitle => 'Кантроль дадзеных';

  @override
  String get cancelButton => 'Адмена';

  @override
  String get confirmButton => 'Пацвердзіць';

  @override
  String get clearQuestionsSuccess => 'Усе пытанні паспяхова выдалены.';

  @override
  String get yoginiLabel => 'Ёгіні';

  @override
  String get lordLabel => 'Лорд';

  @override
  String get startLabel => 'Пачатак';

  @override
  String get recoverAccount => 'Аднавіць уліковы запіс';

  @override
  String get endLabel => 'Канец';

  @override
  String get startDateLabel => 'Дата пачатку';

  @override
  String get endDateLabel => 'Дата заканчэння';

  @override
  String get notAvailable => 'Недаступна';

  @override
  String get noData => 'Няма дадзеных';

  @override
  String get unknownError => 'Невядомая памылка';

  @override
  String get retryButton => 'Паўтарыць спробу';

  @override
  String get kundaliGeneratorTitle => 'Генератар Кундалі';

  @override
  String get natalChartTitle => 'Натальная карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Рашы';

  @override
  String get ascDegreeLabel => 'Градус узыходзячага';

  @override
  String get vimshottariDashaTitle => 'Вімшотары Даша';

  @override
  String get yoginiDashaTitle => 'Ёгіні Даша';

  @override
  String get unknown => 'Невядома';

  @override
  String get clearHoroscope => 'Ачысціць гараскоп';

  @override
  String get clearNotifications => 'Ачысціць апавяшчэнні';

  @override
  String get clearChatHistory => 'Ачысціць гісторыю чата';

  @override
  String get logout => 'Выйсці';

  @override
  String get deleteAccount => 'Выдаліць уліковы запіс';

  @override
  String get allFieldsRequired => 'Усе палі абавязковыя для запаўнення.';

  @override
  String get accountRecoveredSuccess => 'Уліковы запіс паспяхова адноўлены.';

  @override
  String get recoveryFailed =>
      'Аднаўленне не атрымалася. Праверце сваю інфармацыю.';

  @override
  String get recoverySecretLabel => 'Сакрэт аднаўлення:';

  @override
  String get aboutUsTitle => 'Пра нас';

  @override
  String get aboutOurCompany => 'Пра нашу кампанію';

  @override
  String get aboutCompanyDescription =>
      'Мы імкнемся даць нашым карыстальнікам найлепшы астралагічны вопыт.';

  @override
  String get ourMission => 'Наша місія';

  @override
  String get missionDescription =>
      'Каб даць дакладную і персаналізаваную астралагічную інфармацыю, каб дапамагчы карыстальнікам прымаць абгрунтаваныя рашэнні ў сваім жыцці.';

  @override
  String get ourVision => 'Наша бачанне';

  @override
  String get visionDescription =>
      'Стаць самай надзейнай астралагічнай платформай, якая спалучае тэхналогіі і старажытную мудрасць.';

  @override
  String get ourValues => 'Нашы каштоўнасці';

  @override
  String get valuesDescription =>
      'Цэласнасць, дакладнасць, дызайн, арыентаваны на карыстальніка, і пастаянныя інавацыі.';

  @override
  String get contactUs => 'Звяжыцеся з намі';

  @override
  String get contactEmail => 'Электронная пошта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Вэб-сайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Падтрымка кліентаў';

  @override
  String get supportHeroTitle => 'Мы тут, каб дапамагчы';

  @override
  String get supportHeroDescription =>
      'Запоўніце форму ніжэй, і наша служба падтрымкі звяжацца з вамі як мага хутчэй.';

  @override
  String get yourName => 'Ваша імя';

  @override
  String get yourEmail => 'Ваш адрас электроннай пошты';

  @override
  String get message => 'Паведамленне';

  @override
  String get enterEmail => 'Увядзіце свой адрас электроннай пошты';

  @override
  String get enterValidEmail => 'Увядзіце сапраўдны адрас электроннай пошты';

  @override
  String enterField(Object fieldName) {
    return 'Увядзіце $fieldName';
  }

  @override
  String get send => 'Адправіць';

  @override
  String get sending => 'Адпраўка...';

  @override
  String get emailSentSuccess => '✅ Электронны ліст паспяхова адпраўлены!';

  @override
  String get emailSendFailed => '❌ Не атрымалася адправіць электронны ліст';

  @override
  String get astroDictionaryTitle => 'Астралагічны слоўнік';

  @override
  String get searchTermsHint => 'Пошукавыя тэрміны...';

  @override
  String get noTermsFound => 'Тэрміны не знойдзены';

  @override
  String get buyQuestionsTitle => 'Пытанні па куплі';

  @override
  String get userNotAuthenticated => 'Карыстальнік не аўтэнтыфікаваны';

  @override
  String get loadStoreDataFailed => 'Не атрымалася загрузіць дадзеныя крамы';

  @override
  String get missingAuthToken => 'Адсутнічае токен аўтарызацыі';

  @override
  String get merchantDisplayName => 'Прыкладанне для астра-чата';

  @override
  String get paymentSuccessful => '✅ Аплата паспяховая! Пытанне адпраўлена';

  @override
  String paymentFailed(Object error) {
    return '❌ Памылка аплаты: $error';
  }

  @override
  String get yourBalance => 'Ваш баланс';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Даступныя прапановы';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Купіць';

  @override
  String get dailyHoroscopeTitle => '🌟 Штодзённы гараскоп';

  @override
  String get userIdMissing => 'Адсутнічае ідэнтыфікатар карыстальніка';

  @override
  String get fetchHoroscopesFailed => 'Не атрымалася атрымаць гараскопы';

  @override
  String get noHoroscopeFound => 'Гараскоп не знойдзены.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Сёння';

  @override
  String get yesterdayLabel => 'Учора';

  @override
  String get thisWeekLabel => 'Гэты тыдзень';

  @override
  String get lastMonthLabel => 'Апошні месяц';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Увядзіце сваё пытанне...';

  @override
  String get paymentRequired => 'Патрабуецца аплата';

  @override
  String get paymentRequiredMessage =>
      'Вы выкарысталі свае бясплатныя пытанні. Заплаціце 50 рупій, каб працягнуць.';

  @override
  String get payNowButton => 'Аплаціць зараз';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Засталося $count бясплатных пытанняў';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Засталося $count платных пытанняў';
  }

  @override
  String get thankYouFeedback => 'Дзякуй за ваш водгук!';

  @override
  String get ratingSubmitted => 'Ацэнка адпраўлена!';

  @override
  String get setUserIdFirst =>
      'Спачатку ўсталюйце свой ідэнтыфікатар карыстальніка';

  @override
  String get failedToFetchPrevious =>
      'Не атрымалася атрымаць папярэднія пытанні і адказы';

  @override
  String errorOccurred(Object error) {
    return 'Памылка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астралагічны профіль';

  @override
  String get drawerDailyHoroscope => 'Штодзённы гараскоп';

  @override
  String get drawerBuyQuestions => 'Пытанні па куплі';

  @override
  String get drawerAstroDictionary => 'Астралагічны слоўнік';

  @override
  String get drawerSettings => 'Налады';

  @override
  String get drawerCustomerSupport => 'Падтрымка кліентаў';

  @override
  String get drawerAbout => 'Пра нас';

  @override
  String get drawerProfileSettings => 'Налады профілю';

  @override
  String get demoNotificationTitle => '🔔 Апавяшчэнне аб дэма-версіі';

  @override
  String get demoNotificationBody =>
      'Гэта тэставае апавяшчэнне ад вашай праграмы!';

  @override
  String get notificationsTitle => 'Апавяшчэнні';

  @override
  String get noNotifications => 'Няма апавяшчэнняў';

  @override
  String get allTab => 'Усе';

  @override
  String get markAllAsRead => 'Адзначыць усе як прачытаныя';

  @override
  String get notificationMarkedRead => 'Апавяшчэнне пазначана як прачытанае';

  @override
  String get failedToLoadNotifications => 'Не атрымалася загрузіць апавяшчэнні';

  @override
  String get failedToMarkRead => 'Не атрымалася пазначыць як прачытанае';

  @override
  String get failedToMarkAllRead => 'Не атрымалася адзначыць усе як прачытаныя';

  @override
  String get socketConnected => 'Разетка падключана';

  @override
  String get socketDisconnected => 'Разетка адключана';

  @override
  String get newNotificationReceived => 'Атрымана новае апавяшчэнне';

  @override
  String get generalCategory => 'Агульныя';

  @override
  String get horoscopeCategory => 'Гараскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Сістэма';

  @override
  String get updateCategory => 'Абнаўленні';

  @override
  String get howToAskTitle => 'Як спытаць';

  @override
  String get noQuestionsAvailable => 'Няма даступных пытанняў';

  @override
  String get failedToLoadQuestions => 'Не атрымалася загрузіць пытанні';

  @override
  String get pullToRefresh => 'Пацягніце, каб абнавіць';

  @override
  String get careerCategory => 'Кар\'ера';

  @override
  String get loveCategory => 'Каханне і адносіны';

  @override
  String get healthCategory => 'Здароўе';

  @override
  String get financeCategory => 'Фінансы';

  @override
  String get familyCategory => 'Сям\'я';

  @override
  String get educationCategory => 'Адукацыя';

  @override
  String get travelCategory => 'Падарожжы';

  @override
  String get spiritualCategory => 'Духоўны';

  @override
  String get profileLoaded => 'Профіль паспяхова загружаны';

  @override
  String get imageUploaded => 'Выява паспяхова загружана';

  @override
  String get savedInformationConfirmation => 'Я захаваў гэтую інфармацыю';

  @override
  String get noHistoryAvailable => 'Гісторыя недаступная';

  @override
  String get missingUserIdError => 'Патрабуецца ідэнтыфікатар карыстальніка';

  @override
  String get networkError => 'Памылка сеткі. Паўтарыце спробу.';

  @override
  String get timeoutError => 'Запыт перавысіў час чакання';

  @override
  String get genericError => 'Нешта пайшло не так';

  @override
  String get reactionUpdateError => 'Не атрымалася абнавіць рэакцыю';

  @override
  String get noSearchResults => 'Вынікаў пошуку не знойдзена';

  @override
  String get clearSearch => 'Ачысціць пошук';

  @override
  String get resultsFound => 'Знойдзеныя вынікі';

  @override
  String get recoverySecretHint =>
      'Капіраванне і ўстаўка могуць не працаваць, увядзіце ўручную';

  @override
  String get recoverAccountDescription =>
      'Выканайце наступныя дзеянні, каб аднавіць свой уліковы запіс';

  @override
  String get processingLabel => 'Апрацоўка...';

  @override
  String get clearChatSuccess => 'Чат паспяхова ачышчаны';

  @override
  String get notificationsEnabled => 'Апавяшчэнні ўключаны';

  @override
  String get notificationsDisabled => 'Апавяшчэнні адключаны';

  @override
  String get securityNotice =>
      'Вашы дадзеныя надзейна зашыфраваны і захоўваюцца';

  @override
  String get loading => 'Загрузка...';

  @override
  String get selectLanguage => 'Выберыце мову';

  @override
  String get onboardingGetStartedDesc => 'Пачніце з выбару мовы';

  @override
  String get accountRecoveryTitle =>
      '🔐 Падрабязнасці аднаўлення ўліковага запісу';

  @override
  String get recoveryInstructions =>
      'Калі ласка, захавайце гэтую інфармацыю ў надзейным месцы. Яна спатрэбіцца вам для аднаўлення вашага ўліковага запісу.';

  @override
  String get importantNotice => '⚠️ Важна:';

  @override
  String get astrologerProfileTitle => 'Профіль астролага';

  @override
  String get personalAstrologer => 'асабісты астралог';

  @override
  String get makePersonalAstrologer => 'Зрабіць асабістым астралагам';

  @override
  String get favoriteDescription =>
      'Вашы пытанні будуць прыярытэтна перададзены гэтаму астролагу. Калі ён недаступны, вам дапаможа іншы кваліфікаваны астролаг.';

  @override
  String get educationQualifications => 'Адукацыя і кваліфікацыя';

  @override
  String get aboutSection => 'Пра нас';

  @override
  String get shareProfile => 'Падзяліцца профілем';

  @override
  String get loadingAstrologer => 'Загрузка звестак пра астролага...';

  @override
  String get failedToLoadAstrologer =>
      'Не атрымалася загрузіць звесткі пра астролага';

  @override
  String get authenticationRequired =>
      'Патрабуецца аўтэнтыфікацыя. Калі ласка, увайдзіце.';

  @override
  String securityCheckFailed(Object error) {
    return 'Праверка бяспекі не ўдалася: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name цяпер ваш асабісты астралаг';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Выдалена $name з абранага';
  }

  @override
  String get toggleFavoriteError => 'Не атрымалася абнавіць статус абранага';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Адукацыя: $education\n📜 Кваліфікацыя: $qualification\n⏳ Вопыт працы: $experience';
  }

  @override
  String get notProvided => 'Не пазначана';

  @override
  String reviews(Object count) {
    return '($count водгукаў)';
  }

  @override
  String get specialties => 'Спецыяльнасці';

  @override
  String get experience => 'Вопыт';

  @override
  String get qualification => 'Кваліфікацыя';

  @override
  String get education => 'Адукацыя';

  @override
  String get recoveryTips =>
      '• Зрабіце скрыншот гэтай інфармацыі\n• Захоўвайце яе ў бяспечным месцы\n• Ні з кім не дзяліцеся ёю\n• Гэта будзе паказана толькі адзін раз';
}
