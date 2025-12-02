// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get notificationSettings => 'Настройки за известия';

  @override
  String get privacySettings => 'Настройки за поверителност';

  @override
  String get accountSettings => 'Настройки на акаунта';

  @override
  String get languageSettings => 'Езикови настройки';

  @override
  String get languageChanged => 'Езикът е променен';

  @override
  String get existingUserButton => 'Аз съм съществуващ потребител';

  @override
  String get chooseCountryTitle => 'Изберете държава';

  @override
  String get yesText => 'Да';

  @override
  String get noText => 'Не';

  @override
  String get appBarTitle => 'Настройки на профила';

  @override
  String get userIdLabel => 'Потребителски идентификатор *';

  @override
  String get nameLabel => 'Име';

  @override
  String get birthCountryLabel => 'Държава на раждане';

  @override
  String get birthCityLabel => 'Роден град';

  @override
  String get countrySelectionTitle => 'Изберете вашата държава';

  @override
  String get maleLabel => 'Мъж';

  @override
  String get femaleLabel => 'Жена';

  @override
  String get birthDateLabel => 'Дата на раждане';

  @override
  String get birthDatePlaceholder => 'Изберете дата на раждане';

  @override
  String get birthTimeLabel => 'Време на раждане';

  @override
  String get birthTimePlaceholder => 'Изберете час на раждане';

  @override
  String get saveProfileButton => 'Запазване на профил';

  @override
  String get noCitiesFound => 'Не са намерени градове';

  @override
  String cityPlaceholder(Object country) {
    return 'Въведете град в $country';
  }

  @override
  String get countryFirstPlaceholder => 'Първо изберете държава';

  @override
  String get versionHistoryTitle => 'История на версиите';

  @override
  String get notSetText => 'Не е зададено';

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
    return 'Държава: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Пол: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Дата на раждане: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Време на раждане: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Местоположение: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Лятно време: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Щат: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Актуализирано на $date';
  }

  @override
  String get userIdRequired => 'Изисква се потребителско име';

  @override
  String get profileSaved => 'Профилът е запазен успешно';

  @override
  String get saveFailed => 'Запазването на профила не бе успешно';

  @override
  String get errorPrefix => 'Грешка:';

  @override
  String get onboardingChooseLanguage => 'Изберете Вашия език';

  @override
  String get onboardingChooseLanguageDesc =>
      'Изберете предпочитания от вас език, за да продължите.';

  @override
  String get onboardingWhatIsAstrology => 'Какво е астрология?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрологията е наука за небесните тела...';

  @override
  String get onboardingWhyUseApp => 'Защо да използвате това приложение?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Получавайте персонализирани хороскопи, ежедневни прогнози и насоки, за да вземате информирани решения.';

  @override
  String get onboardingHowToUse => 'Как да използвам това приложение?';

  @override
  String get onboardingHowToUseDesc =>
      'Навигирайте лесно, проверявайте ежедневните хороскопи и управлявайте профила си за точни прогнози.';

  @override
  String get onboardingGetStarted => 'Започнете';

  @override
  String get onboardingNewUser => 'Нов потребител';

  @override
  String get onboardingExistingUser => 'Съществуващ потребител';

  @override
  String get onboardingBack => 'Обратно';

  @override
  String get onboardingNext => 'Следващо';

  @override
  String get userIdNotFound =>
      'Потребителският идентификатор не е намерен. Моля, влезте или настройте профила си.';

  @override
  String get clearNotificationsTitle => 'Изчистване на известията';

  @override
  String get clearNotificationsMessage =>
      'Сигурни ли сте, че искате да изчистите всички известия?';

  @override
  String get clearNotificationsSuccess =>
      'Всички известия са изчистени успешно.';

  @override
  String get clearHoroscopeTitle => 'Ясен хороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Сигурни ли сте, че искате да изчистите данните от хороскопа си?';

  @override
  String get clearHoroscopeSuccess => 'Хороскопът е успешно изчистен.';

  @override
  String get clearChatTitle => 'Изчистване на историята на чата';

  @override
  String get clearChatMessage =>
      'Сигурни ли сте, че искате да изтриете цялата си история на чата?';

  @override
  String get clearChatLocal => 'Чатът е изчистен локално.';

  @override
  String get deleteAccountTitle => 'Изтриване на акаунт';

  @override
  String get deleteAccountMessage =>
      'Сигурни ли сте, че искате да изтриете акаунта си? Това ще изчисти и цялата ви история на чата и известията.';

  @override
  String get deleteAccountSuccess =>
      'Вашият акаунт и всички данни са премахнати.';

  @override
  String get deleteAccountError => 'Грешка при изтриване на акаунт';

  @override
  String get logoutTitle => 'Изход';

  @override
  String get logoutMessage => 'Сигурни ли сте, че искате да излезете?';

  @override
  String get termsPrivacyTitle => 'Условия и поверителност';

  @override
  String get privacyPolicyTitle => 'Политика за поверителност';

  @override
  String get termsConditionsTitle => 'Общи условия';

  @override
  String get dataControlTitle => 'Контрол на данните';

  @override
  String get cancelButton => 'Отказ';

  @override
  String get confirmButton => 'Потвърди';

  @override
  String get clearQuestionsSuccess => 'Всички въпроси са успешно изтрити.';

  @override
  String get yoginiLabel => 'Йогини';

  @override
  String get lordLabel => 'Господ';

  @override
  String get startLabel => 'Старт';

  @override
  String get recoverAccount => 'Възстановяване на акаунт';

  @override
  String get endLabel => 'Край';

  @override
  String get startDateLabel => 'Начална дата';

  @override
  String get endDateLabel => 'Крайна дата';

  @override
  String get notAvailable => 'Не е налично';

  @override
  String get noData => 'Няма данни';

  @override
  String get unknownError => 'Неизвестна грешка';

  @override
  String get retryButton => 'Опитай отново';

  @override
  String get kundaliGeneratorTitle => 'Генератор Кундали';

  @override
  String get natalChartTitle => 'Натална карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Градус на Асцендента';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Неизвестен';

  @override
  String get clearHoroscope => 'Ясен хороскоп';

  @override
  String get clearNotifications => 'Изчистване на известията';

  @override
  String get clearChatHistory => 'Изчистване на историята на чата';

  @override
  String get logout => 'Изход';

  @override
  String get deleteAccount => 'Изтриване на акаунт';

  @override
  String get allFieldsRequired => 'Всички полета са задължителни.';

  @override
  String get accountRecoveredSuccess => 'Профилът е възстановен успешно.';

  @override
  String get recoveryFailed =>
      'Възстановяването не бе успешно. Проверете информацията си.';

  @override
  String get recoverySecretLabel => 'Тайна за възстановяване:';

  @override
  String get aboutUsTitle => 'За нас';

  @override
  String get aboutOurCompany => 'За нашата компания';

  @override
  String get aboutCompanyDescription =>
      'Ние сме ангажирани да предоставим най-доброто астрологично изживяване на нашите потребители.';

  @override
  String get ourMission => 'Нашата мисия';

  @override
  String get missionDescription =>
      'Да предоставя точни и персонализирани астрологични прозрения, които да помогнат на потребителите да вземат информирани решения в живота си.';

  @override
  String get ourVision => 'Нашата визия';

  @override
  String get visionDescription =>
      'Да се превърнем в най-доверената астрологична платформа, съчетаваща технологии и древна мъдрост.';

  @override
  String get ourValues => 'Нашите ценности';

  @override
  String get valuesDescription =>
      'Честност, точност, дизайн, ориентиран към потребителя, и непрекъснати иновации.';

  @override
  String get contactUs => 'Свържете се с нас';

  @override
  String get contactEmail => 'Имейл: support@yourcompany.com';

  @override
  String get contactWebsite => 'Уебсайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Поддръжка на клиенти';

  @override
  String get supportHeroTitle => 'Тук сме, за да помогнем';

  @override
  String get supportHeroDescription =>
      'Попълнете формата по-долу и нашият екип за поддръжка ще се свърже с вас възможно най-скоро.';

  @override
  String get yourName => 'Вашето име';

  @override
  String get yourEmail => 'Вашият имейл';

  @override
  String get message => 'Съобщение';

  @override
  String get enterEmail => 'Въведете имейла си';

  @override
  String get enterValidEmail => 'Въведете валиден имейл адрес';

  @override
  String enterField(Object fieldName) {
    return 'Въведете $fieldName';
  }

  @override
  String get send => 'Изпрати';

  @override
  String get sending => 'Изпраща се...';

  @override
  String get emailSentSuccess => '✅ Имейлът е изпратен успешно!';

  @override
  String get emailSendFailed => '❌ Изпращането на имейл не бе успешно';

  @override
  String get astroDictionaryTitle => 'Астрологичен речник';

  @override
  String get searchTermsHint => 'Търсени термини...';

  @override
  String get noTermsFound => 'Няма намерени термини';

  @override
  String get buyQuestionsTitle => 'Въпроси за покупка';

  @override
  String get userNotAuthenticated => 'Потребителят не е удостоверен';

  @override
  String get loadStoreDataFailed =>
      'Зареждането на данните от магазина не бе успешно';

  @override
  String get missingAuthToken => 'Липсва токен за удостоверяване';

  @override
  String get merchantDisplayName => 'Приложение за астро чат';

  @override
  String get paymentSuccessful => '✅ Плащането е успешно! Въпросът е изпратен';

  @override
  String paymentFailed(Object error) {
    return '❌ Плащането не бе успешно: $error';
  }

  @override
  String get yourBalance => 'Вашият баланс';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Налични оферти';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Купете';

  @override
  String get dailyHoroscopeTitle => '🌟 Дневен хороскоп';

  @override
  String get userIdMissing => 'Липсва потребителски идентификатор';

  @override
  String get fetchHoroscopesFailed => 'Извличането на хороскопи не бе успешно';

  @override
  String get noHoroscopeFound => 'Не е намерен хороскоп.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Днес';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get thisWeekLabel => 'Тази седмица';

  @override
  String get lastMonthLabel => 'Миналия месец';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Въведете въпроса си...';

  @override
  String get paymentRequired => 'Необходимо плащане';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Използвахте безплатните си въпроси. Платете 50 рупии, за да продължите.';
  }

  @override
  String get payNowButton => 'Плати сега';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Остават $count безплатни въпроса';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Остават $count платени въпроса';
  }

  @override
  String get thankYouFeedback => 'Благодаря ви за обратната връзка!';

  @override
  String get ratingSubmitted => 'Оценката е изпратена!';

  @override
  String get setUserIdFirst =>
      'Моля, първо задайте потребителския си идентификатор';

  @override
  String get failedToFetchPrevious =>
      'Неуспешно извличане на предишни въпроси и отговори';

  @override
  String errorOccurred(Object error) {
    return 'Грешка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профил';

  @override
  String get drawerDailyHoroscope => 'Дневен хороскоп';

  @override
  String get drawerBuyQuestions => 'Въпроси за покупка';

  @override
  String get drawerAstroDictionary => 'Астрологичен речник';

  @override
  String get drawerSettings => 'Настройки';

  @override
  String get drawerCustomerSupport => 'Поддръжка на клиенти';

  @override
  String get drawerAbout => 'Относно';

  @override
  String get drawerProfileSettings => 'Настройки на профила';

  @override
  String get demoNotificationTitle => '🔔 Известие за демо версия';

  @override
  String get demoNotificationBody =>
      'Това е тестово известие от вашето приложение!';

  @override
  String get notificationsTitle => 'Известия';

  @override
  String get noNotifications => 'Няма известия';

  @override
  String get allTab => 'Всички';

  @override
  String get markAllAsRead => 'Маркирай всички като прочетени';

  @override
  String get notificationMarkedRead => 'Известието е маркирано като прочетено';

  @override
  String get failedToLoadNotifications =>
      'Зареждането на известията не бе успешно';

  @override
  String get failedToMarkRead => 'Маркирането като прочетено не бе успешно';

  @override
  String get failedToMarkAllRead =>
      'Неуспешно маркиране на всички като прочетени';

  @override
  String get socketConnected => 'Гнездото е свързано';

  @override
  String get socketDisconnected => 'Контактът е изключен';

  @override
  String get newNotificationReceived => 'Получено е ново известие';

  @override
  String get generalCategory => 'Общи';

  @override
  String get horoscopeCategory => 'Хороскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Система';

  @override
  String get updateCategory => 'Актуализации';

  @override
  String get howToAskTitle => 'Как да попитате';

  @override
  String get noQuestionsAvailable => 'Няма налични въпроси';

  @override
  String get failedToLoadQuestions => 'Зареждането на въпросите не бе успешно';

  @override
  String get pullToRefresh => 'Плъзнете, за да обновите';

  @override
  String get careerCategory => 'Кариера';

  @override
  String get loveCategory => 'Любов и връзки';

  @override
  String get healthCategory => 'Здраве';

  @override
  String get financeCategory => 'Финанси';

  @override
  String get familyCategory => 'Семейство';

  @override
  String get educationCategory => 'Образование';

  @override
  String get travelCategory => 'Пътуване';

  @override
  String get spiritualCategory => 'Духовен';

  @override
  String get profileLoaded => 'Профилът е зареден успешно';

  @override
  String get imageUploaded => 'Изображението е качено успешно';

  @override
  String get savedInformationConfirmation => 'Запазих тази информация';

  @override
  String get noHistoryAvailable => 'Няма налична история';

  @override
  String get missingUserIdError => 'Изисква се потребителско име';

  @override
  String get networkError => 'Мрежова грешка. Моля, опитайте отново.';

  @override
  String get timeoutError => 'Времето за изчакване на заявката е изтекло';

  @override
  String get genericError => 'Нещо се обърка';

  @override
  String get reactionUpdateError =>
      'Актуализирането на реакцията не бе успешно';

  @override
  String get noSearchResults => 'Няма намерени резултати от търсенето';

  @override
  String get clearSearch => 'Изчистване на търсенето';

  @override
  String get resultsFound => 'Намерени резултати';

  @override
  String get recoverySecretHint =>
      'Копирането и поставянето може да не работят, въведете ръчно';

  @override
  String get recoverAccountDescription =>
      'Следвайте тези стъпки, за да възстановите акаунта си';

  @override
  String get processingLabel => 'Обработва се...';

  @override
  String get clearChatSuccess => 'Чатът е изчистен успешно';

  @override
  String get notificationsEnabled => 'Известията са активирани';

  @override
  String get notificationsDisabled => 'Известията са деактивирани';

  @override
  String get securityNotice =>
      'Вашите данни са сигурно криптирани и съхранявани';

  @override
  String get loading => 'Зареждане...';

  @override
  String get selectLanguage => 'Изберете език';

  @override
  String get onboardingGetStartedDesc => 'Започнете, като изберете езика си';

  @override
  String get accountRecoveryTitle =>
      '🔐 Подробности за възстановяване на акаунт';

  @override
  String get recoveryInstructions =>
      'Моля, запазете тази информация сигурно. Ще ви е необходима, за да възстановите акаунта си.';

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
      'Вашите въпроси ще бъдат приоритетно насочени към този астролог. Ако няма такъв, друг квалифициран астролог ще ви помогне.';

  @override
  String get educationQualifications => 'Образование и квалификации';

  @override
  String get aboutSection => 'Относно';

  @override
  String get shareProfile => 'Споделяне на профил';

  @override
  String get loadingAstrologer => 'Зареждане на данни за астролога...';

  @override
  String get failedToLoadAstrologer =>
      'Зареждането на данните за астролога не бе успешно';

  @override
  String get authenticationRequired =>
      'Изисква се удостоверяване. Моля, влезте.';

  @override
  String securityCheckFailed(Object error) {
    return 'Проверката за сигурност не бе успешна: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name вече е вашият личен астролог';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Премахнато $name от любими';
  }

  @override
  String get toggleFavoriteError =>
      'Актуализирането на статуса „Любими“ не бе успешно';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Образование: $education\n📜 Квалификация: $qualification\n⏳ Опит: $experience';
  }

  @override
  String get notProvided => 'Не е предоставено';

  @override
  String reviews(Object count) {
    return '($count отзива)';
  }

  @override
  String get specialties => 'Специалности';

  @override
  String get experience => 'Опит';

  @override
  String get qualification => 'Квалификация';

  @override
  String get education => 'Образование';

  @override
  String get recoveryTips =>
      '• Направете екранна снимка на тази информация\n• Съхранявайте я на сигурно място\n• Не я споделяйте с никого\n• Това ще бъде показано само веднъж';

  @override
  String get themeSettingsTitle => 'Настройки на темата';

  @override
  String get lightThemeLabel => 'Светлина';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Тъмно';

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
}
