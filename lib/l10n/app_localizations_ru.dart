// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get notificationSettings => 'Настройки уведомлений';

  @override
  String get privacySettings => 'Настройки конфиденциальности';

  @override
  String get accountSettings => 'Настройки учетной записи';

  @override
  String get languageSettings => 'Настройки языка';

  @override
  String get languageChanged => 'Язык изменен';

  @override
  String get existingUserButton => 'Я существующий пользователь';

  @override
  String get chooseCountryTitle => 'Выберите страну';

  @override
  String get yesText => 'Да';

  @override
  String get noText => 'Нет';

  @override
  String get appBarTitle => 'Настройки профиля';

  @override
  String get userIdLabel => 'ID пользователя *';

  @override
  String get nameLabel => 'Имя';

  @override
  String get birthCountryLabel => 'Страна рождения';

  @override
  String get birthCityLabel => 'Город рождения';

  @override
  String get countrySelectionTitle => 'Выберите свою страну';

  @override
  String get maleLabel => 'Мужской';

  @override
  String get femaleLabel => 'Женский';

  @override
  String get birthDateLabel => 'Дата рождения';

  @override
  String get birthDatePlaceholder => 'Выберите дату рождения';

  @override
  String get birthTimeLabel => 'Время рождения';

  @override
  String get birthTimePlaceholder => 'Выберите время рождения';

  @override
  String get saveProfileButton => 'Сохранить профиль';

  @override
  String get noCitiesFound => 'Города не найдены';

  @override
  String cityPlaceholder(Object country) {
    return 'Введите город в $country';
  }

  @override
  String get countryFirstPlaceholder => 'Сначала выберите страну';

  @override
  String get versionHistoryTitle => 'История версий';

  @override
  String get notSetText => 'Не установлено';

  @override
  String nameHistory(Object name) {
    return 'Имя: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Город: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Страна: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Пол: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Дата рождения: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Время рождения: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Местоположение: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Часовой пояс: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Летнее время: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Штат: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Обновлено $date';
  }

  @override
  String get userIdRequired => 'Требуется идентификатор пользователя';

  @override
  String get profileSaved => 'Профиль успешно сохранен';

  @override
  String get saveFailed => 'Не удалось сохранить профиль.';

  @override
  String get errorPrefix => 'Ошибка:';

  @override
  String get onboardingChooseLanguage => 'Выберите свой язык';

  @override
  String get onboardingChooseLanguageDesc =>
      'Выберите предпочитаемый язык, чтобы продолжить.';

  @override
  String get onboardingWhatIsAstrology => 'Что такое астрология?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрология — это древнее учение о движении небесных тел и его влиянии на жизнь человека, дающее возможность глубже понять личность, отношения и жизненные события.';

  @override
  String get onboardingWhyUseApp => 'Зачем использовать это приложение?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Получайте точные гороскопы и рекомендации, составленные людьми и подобранные специально для вашей натальной карты. Принимайте взвешенные решения с помощью ежедневных прогнозов и персональных советов опытных астрологов.';

  @override
  String get onboardingHowToUse => 'Как пользоваться этим приложением?';

  @override
  String get onboardingHowToUseDesc =>
      'Просто введите дату рождения, точное время, место рождения и любую другую необходимую информацию, чтобы начать работу. Читайте ежедневные гороскопы, задавайте вопросы опытным астрологам и управляйте своим профилем, чтобы получать точные персонализированные прогнозы — вход в систему не требуется.';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get onboardingNewUser => 'Новый пользователь';

  @override
  String get onboardingExistingUser => 'Существующий пользователь';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingNext => 'Следующий';

  @override
  String get userIdNotFound =>
      'Идентификатор пользователя не найден. Пожалуйста, войдите в систему или настройте свой профиль.';

  @override
  String get clearNotificationsTitle => 'Очистить уведомления';

  @override
  String get clearNotificationsMessage =>
      'Вы уверены, что хотите удалить все уведомления?';

  @override
  String get clearNotificationsSuccess => 'Все уведомления успешно удалены.';

  @override
  String get clearHoroscopeTitle => 'Ясный гороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Вы уверены, что хотите очистить данные своего гороскопа?';

  @override
  String get clearHoroscopeSuccess => 'Гороскоп успешно очищен.';

  @override
  String get clearChatTitle => 'Очистить историю чата';

  @override
  String get clearChatMessage =>
      'Вы уверены, что хотите удалить всю историю чата?';

  @override
  String get clearChatLocal => 'Чат очищен локально.';

  @override
  String get deleteAccountTitle => 'Удалить аккаунт';

  @override
  String get deleteAccountMessage =>
      'Вы уверены, что хотите удалить свою учётную запись? Это также удалит всю историю чатов и уведомления.';

  @override
  String get deleteAccountSuccess =>
      'Ваша учетная запись и все данные были удалены.';

  @override
  String get deleteAccountError => 'Ошибка при удалении аккаунта';

  @override
  String get logoutTitle => 'Выйти';

  @override
  String get logoutMessage => 'Вы уверены, что хотите выйти?';

  @override
  String get termsPrivacyTitle => 'Условия и конфиденциальность';

  @override
  String get privacyPolicyTitle => 'политика конфиденциальности';

  @override
  String get termsConditionsTitle => 'Условия и положения';

  @override
  String get dataControlTitle => 'Контроль данных';

  @override
  String get cancelButton => 'Отмена';

  @override
  String get confirmButton => 'Подтверждать';

  @override
  String get clearQuestionsSuccess => 'Все вопросы успешно удалены.';

  @override
  String get yoginiLabel => 'Йогини';

  @override
  String get lordLabel => 'Господин';

  @override
  String get startLabel => 'Начинать';

  @override
  String get recoverAccount => 'Восстановить аккаунт';

  @override
  String get endLabel => 'Конец';

  @override
  String get startDateLabel => 'Дата начала';

  @override
  String get endDateLabel => 'Дата окончания';

  @override
  String get notAvailable => 'Нет в наличии';

  @override
  String get noData => 'Нет данных';

  @override
  String get unknownError => 'Неизвестная ошибка';

  @override
  String get retryButton => 'Повторить попытку';

  @override
  String get kundaliGeneratorTitle => 'Генератор Кундали';

  @override
  String get natalChartTitle => 'Натальная карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Восходящий градус';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Неизвестный';

  @override
  String get clearHoroscope => 'Ясный гороскоп';

  @override
  String get clearNotifications => 'Очистить уведомления';

  @override
  String get clearChatHistory => 'Очистить историю чата';

  @override
  String get logout => 'Выйти';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get allFieldsRequired => 'Все поля обязательны для заполнения.';

  @override
  String get accountRecoveredSuccess => 'Аккаунт успешно восстановлен.';

  @override
  String get recoveryFailed =>
      'Восстановление не удалось. Проверьте информацию.';

  @override
  String get recoverySecretLabel => 'Секрет восстановления:';

  @override
  String get aboutUsTitle => 'О нас';

  @override
  String get aboutOurCompany => 'О нашей компании';

  @override
  String get aboutCompanyDescription =>
      'В Karma мы поможем вам открыть свой истинный жизненный путь благодаря непреходящей мудрости ведической астрологии. Все советы исходят от настоящих, опытных астрологов и тщательно подбираются на основе вашей уникальной карты рождения. От ежедневных гороскопов до персонализированных рекомендаций — Karma делает древние знания доступными более чем на 100 языках.';

  @override
  String get ourMission => 'Наша миссия';

  @override
  String get missionDescription =>
      'Наша миссия проста: предоставлять достоверные, основанные на опыте человека астрологические рекомендации, которые помогут вам принимать уверенные и обоснованные решения. Каждый прогноз и консультация — это результат многолетнего профессионального опыта, а не автоматизированных алгоритмов.';

  @override
  String get ourVision => 'Наше видение';

  @override
  String get visionDescription =>
      'Мы стремимся стать самой надежной в мире платформой ведической астрологии, помогая людям во всем мире ясно и уверенно понимать себя, свой выбор и свой жизненный путь.';

  @override
  String get ourValues => 'Наши ценности';

  @override
  String get valuesDescription =>
      'В Karma мы ценим достоверность, точность и доверие. Мы стремимся предлагать не только точные, но и содержательные рекомендации, помогая вам идти по жизни с пониманием и уверенностью.';

  @override
  String get contactUs => 'Связаться с нами';

  @override
  String get contactEmail => 'Электронная почта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Веб-сайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Служба поддержки клиентов';

  @override
  String get supportHeroTitle => 'Мы здесь, чтобы помочь';

  @override
  String get supportHeroDescription =>
      'Заполните форму ниже, и наша служба поддержки свяжется с вами как можно скорее.';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get yourEmail => 'Ваш адрес электронной почты';

  @override
  String get message => 'Сообщение';

  @override
  String get enterEmail => 'Введите свой адрес электронной почты';

  @override
  String get enterValidEmail =>
      'Введите действительный адрес электронной почты';

  @override
  String enterField(Object fieldName) {
    return 'Введите $fieldName';
  }

  @override
  String get send => 'Отправлять';

  @override
  String get sending => 'Отправка...';

  @override
  String get emailSentSuccess => '✅ Письмо успешно отправлено!';

  @override
  String get emailSendFailed => '❌ Не удалось отправить электронное письмо';

  @override
  String get astroDictionaryTitle => 'Астрологический словарь';

  @override
  String get searchTermsHint => 'Условия поиска...';

  @override
  String get noTermsFound => 'Термины не найдены';

  @override
  String get buyQuestionsTitle => 'Вопросы о покупке';

  @override
  String get userNotAuthenticated => 'Пользователь не аутентифицирован';

  @override
  String get loadStoreDataFailed => 'Не удалось загрузить данные магазина.';

  @override
  String get missingAuthToken => 'Отсутствует токен авторизации';

  @override
  String get merchantDisplayName => 'Приложение Astro Chat';

  @override
  String get paymentSuccessful => '✅ Оплата прошла успешно! Вопрос отправлен.';

  @override
  String paymentFailed(Object error) {
    return '❌ Платеж не прошёл: $error';
  }

  @override
  String get yourBalance => 'Ваш баланс';

  @override
  String questionsBalance(Object count) {
    return '$count Вопросы';
  }

  @override
  String get availableOffers => 'Доступные предложения';

  @override
  String questionsCount(Object count) {
    return '$count Вопрос';
  }

  @override
  String get buyButton => 'Купить';

  @override
  String get dailyHoroscopeTitle => '🌟 Ежедневный гороскоп';

  @override
  String get userIdMissing => 'Идентификатор пользователя отсутствует';

  @override
  String get fetchHoroscopesFailed => 'Не удалось загрузить гороскопы';

  @override
  String get noHoroscopeFound => 'Гороскоп не найден.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Сегодня';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get thisWeekLabel => 'На этой неделе';

  @override
  String get lastMonthLabel => 'В прошлом месяце';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Введите свой вопрос...';

  @override
  String get paymentRequired => 'Требуется оплата';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Вы использовали бесплатные вопросы. Заплатите $amount, чтобы продолжить.';
  }

  @override
  String get payNowButton => 'Оплатить сейчас';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count оставшиеся бесплатные вопросы';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count осталось оплаченных вопросов';
  }

  @override
  String get thankYouFeedback => 'Спасибо за ваш отзыв!';

  @override
  String get ratingSubmitted => 'Рейтинг отправлен!';

  @override
  String get setUserIdFirst =>
      'Сначала установите свой идентификатор пользователя.';

  @override
  String get failedToFetchPrevious =>
      'Не удалось получить предыдущие вопросы и ответы.';

  @override
  String errorOccurred(Object error) {
    return 'Ошибка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астропрофиль';

  @override
  String get drawerDailyHoroscope => 'Ежедневный гороскоп';

  @override
  String get drawerBuyQuestions => 'Вопросы о покупке';

  @override
  String get drawerAstroDictionary => 'Астрологический словарь';

  @override
  String get drawerSettings => 'Настройки';

  @override
  String get drawerCustomerSupport => 'Служба поддержки клиентов';

  @override
  String get drawerAbout => 'О';

  @override
  String get drawerProfileSettings => 'Настройки профиля';

  @override
  String get demoNotificationTitle => '🔔 Уведомление о демонстрации';

  @override
  String get demoNotificationBody =>
      'Это тестовое уведомление от вашего приложения!';

  @override
  String get notificationsTitle => 'Уведомления';

  @override
  String get noNotifications => 'Нет уведомлений';

  @override
  String get allTab => 'Все';

  @override
  String get markAllAsRead => 'Отметить все как прочитанное';

  @override
  String get notificationMarkedRead => 'Уведомление отмечено как прочитанное';

  @override
  String get failedToLoadNotifications => 'Не удалось загрузить уведомления.';

  @override
  String get failedToMarkRead => 'Не удалось отметить как прочитанное';

  @override
  String get failedToMarkAllRead => 'Не удалось отметить все как прочитанные.';

  @override
  String get socketConnected => 'Розетка подключена';

  @override
  String get socketDisconnected => 'Розетка отключена';

  @override
  String get newNotificationReceived => 'Получено новое уведомление';

  @override
  String get generalCategory => 'Общий';

  @override
  String get horoscopeCategory => 'Гороскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Система';

  @override
  String get updateCategory => 'Обновления';

  @override
  String get howToAskTitle => 'Как спросить';

  @override
  String get noQuestionsAvailable => 'Нет доступных вопросов';

  @override
  String get failedToLoadQuestions => 'Не удалось загрузить вопросы';

  @override
  String get pullToRefresh => 'Потяните, чтобы обновить';

  @override
  String get careerCategory => 'Карьера';

  @override
  String get loveCategory => 'Любовь и отношения';

  @override
  String get healthCategory => 'Здоровье';

  @override
  String get financeCategory => 'Финансы';

  @override
  String get familyCategory => 'Семья';

  @override
  String get educationCategory => 'Образование';

  @override
  String get travelCategory => 'Путешествовать';

  @override
  String get spiritualCategory => 'Духовный';

  @override
  String get profileLoaded => 'Профиль успешно загружен';

  @override
  String get imageUploaded => 'Изображение успешно загружено';

  @override
  String get savedInformationConfirmation => 'Я сохранил эту информацию';

  @override
  String get noHistoryAvailable => 'История недоступна';

  @override
  String get missingUserIdError => 'Требуется идентификатор пользователя';

  @override
  String get networkError => 'Ошибка сети. Попробуйте ещё раз.';

  @override
  String get timeoutError => 'Запрос истек';

  @override
  String get genericError => 'Что-то пошло не так';

  @override
  String get reactionUpdateError => 'Не удалось обновить реакцию.';

  @override
  String get noSearchResults => 'Результаты поиска не найдены.';

  @override
  String get clearSearch => 'Очистить поиск';

  @override
  String get resultsFound => 'Результаты найдены';

  @override
  String get recoverySecretHint =>
      'Копирование-вставка может не работать, вводите вручную';

  @override
  String get recoverAccountDescription =>
      'Выполните следующие действия, чтобы восстановить свою учетную запись.';

  @override
  String get processingLabel => 'Обработка...';

  @override
  String get clearChatSuccess => 'Чат успешно очищен';

  @override
  String get notificationsEnabled => 'Уведомления включены';

  @override
  String get notificationsDisabled => 'Уведомления отключены';

  @override
  String get securityNotice => 'Ваши данные надежно зашифрованы и хранятся';

  @override
  String get loading => 'Загрузка...';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get onboardingGetStartedDesc => 'Начните с выбора языка';

  @override
  String get accountRecoveryTitle => '🔐 Информация о восстановлении аккаунта';

  @override
  String get recoveryInstructions =>
      'Сохраните эту информацию в безопасном месте. Она понадобится вам для восстановления учётной записи.';

  @override
  String get importantNotice => '⚠️ Важно:';

  @override
  String get astrologerProfileTitle => 'Профиль астролога';

  @override
  String get personalAstrologer => 'Персональный астролог';

  @override
  String get makePersonalAstrologer => 'Назначить личного астролога';

  @override
  String get favoriteDescription =>
      'Ваши вопросы будут в первую очередь адресованы этому астрологу. Если он занят, вам поможет другой квалифицированный астролог.';

  @override
  String get educationQualifications => 'Образование и квалификация';

  @override
  String get aboutSection => 'О';

  @override
  String get shareProfile => 'Поделиться профилем';

  @override
  String get loadingAstrologer => 'Загрузка данных астролога...';

  @override
  String get failedToLoadAstrologer => 'Не удалось загрузить данные астролога.';

  @override
  String get authenticationRequired =>
      'Требуется аутентификация. Пожалуйста, войдите в систему.';

  @override
  String securityCheckFailed(Object error) {
    return 'Проверка безопасности не пройдена: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name теперь ваш персональный астролог';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Удален $name из избранного';
  }

  @override
  String get toggleFavoriteError => 'Не удалось обновить статус избранного.';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Образование: $education\n📜 Квалификация: $qualification\n⏳ Опыт работы: $experience';
  }

  @override
  String get notProvided => 'Не предоставлено';

  @override
  String reviews(Object count) {
    return '($count отзывов)';
  }

  @override
  String get specialties => 'Специальности';

  @override
  String get experience => 'Опыт';

  @override
  String get qualification => 'Квалификация';

  @override
  String get education => 'Образование';

  @override
  String get recoveryTips =>
      '• Сделайте скриншот этой информации\n• Сохраните его в безопасном месте\n• Не передавайте никому\n• Эта информация будет показана только один раз';

  @override
  String get themeSettingsTitle => 'Настройки темы';

  @override
  String get lightThemeLabel => 'Свет';

  @override
  String get lightThemeDescription =>
      'Всегда используйте светлую тему оформления.';

  @override
  String get darkThemeLabel => 'Темный';

  @override
  String get darkThemeDescription => 'Всегда используйте темную тему.';

  @override
  String get systemThemeLabel => 'Система';

  @override
  String get systemThemeDarkDescription =>
      'Для темной темы следуйте системным настройкам.';

  @override
  String get systemThemeLightDescription =>
      'Для светлой темы используйте системные настройки.';

  @override
  String get switchToLight => 'Переключиться на свет';

  @override
  String get switchToDark => 'Переключиться на темный';

  @override
  String get ourTeam => 'Наша команда';

  @override
  String get teamDescription =>
      'Наша команда профессиональных ведических астрологов обладает многолетним опытом интерпретации планетарных влияний и жизненных закономерностей. Благодаря поддержке и поддержке команды разработчиков, Karma обеспечивает бесперебойный, надежный и глобальный доступ для каждого пользователя.';
}
