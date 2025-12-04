// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get notificationSettings => 'Налаштування сповіщень';

  @override
  String get privacySettings => 'Налаштування конфіденційності';

  @override
  String get accountSettings => 'Налаштування облікового запису';

  @override
  String get languageSettings => 'Мовні налаштування';

  @override
  String get languageChanged => 'Мова змінена';

  @override
  String get existingUserButton => 'Я є існуючим користувачем';

  @override
  String get chooseCountryTitle => 'Виберіть країну';

  @override
  String get yesText => 'Так';

  @override
  String get noText => 'Ні';

  @override
  String get appBarTitle => 'Налаштування профілю';

  @override
  String get userIdLabel => 'Ідентифікатор користувача *';

  @override
  String get nameLabel => 'Ім\'я';

  @override
  String get birthCountryLabel => 'Країна народження';

  @override
  String get birthCityLabel => 'Місто народження';

  @override
  String get countrySelectionTitle => 'Оберіть свою країну';

  @override
  String get maleLabel => 'Чоловік';

  @override
  String get femaleLabel => 'Жінка';

  @override
  String get birthDateLabel => 'Дата народження';

  @override
  String get birthDatePlaceholder => 'Виберіть дату народження';

  @override
  String get birthTimeLabel => 'Час народження';

  @override
  String get birthTimePlaceholder => 'Виберіть час народження';

  @override
  String get saveProfileButton => 'Зберегти профіль';

  @override
  String get noCitiesFound => 'Міст не знайдено';

  @override
  String cityPlaceholder(Object country) {
    return 'Введіть місто в $country';
  }

  @override
  String get countryFirstPlaceholder => 'Спочатку виберіть країну';

  @override
  String get versionHistoryTitle => 'Історія версій';

  @override
  String get notSetText => 'Не встановлено';

  @override
  String nameHistory(Object name) {
    return 'Ім\'я: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Місто: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Країна: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Стать: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Дата народження: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Час народження: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Розташування: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Літній час: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Штат: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Оновлено $date';
  }

  @override
  String get userIdRequired => 'Потрібен ідентифікатор користувача';

  @override
  String get profileSaved => 'Профіль успішно збережено';

  @override
  String get saveFailed => 'Не вдалося зберегти профіль';

  @override
  String get errorPrefix => 'Помилка:';

  @override
  String get onboardingChooseLanguage => 'Оберіть свою мову';

  @override
  String get onboardingChooseLanguageDesc =>
      'Виберіть потрібну мову, щоб продовжити.';

  @override
  String get onboardingWhatIsAstrology => 'Що таке астрологія?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрологія – це наука про небесні тіла...';

  @override
  String get onboardingWhyUseApp => 'Чому варто використовувати цей додаток?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Отримуйте персоналізовані гороскопи, щоденні прогнози та поради для прийняття обґрунтованих рішень.';

  @override
  String get onboardingHowToUse => 'Як користуватися цим додатком?';

  @override
  String get onboardingHowToUseDesc =>
      'Легко орієнтуйтеся, перевіряйте щоденні гороскопи та керуйте своїм профілем для отримання точних прогнозів.';

  @override
  String get onboardingGetStarted => 'Почати';

  @override
  String get onboardingNewUser => 'Новий користувач';

  @override
  String get onboardingExistingUser => 'Існуючий користувач';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get userIdNotFound =>
      'Ідентифікатор користувача не знайдено. Будь ласка, увійдіть або налаштуйте свій профіль.';

  @override
  String get clearNotificationsTitle => 'Очистити сповіщення';

  @override
  String get clearNotificationsMessage =>
      'Ви впевнені, що хочете очистити всі сповіщення?';

  @override
  String get clearNotificationsSuccess => 'Усі сповіщення успішно видалено.';

  @override
  String get clearHoroscopeTitle => 'Очистити гороскоп';

  @override
  String get clearHoroscopeMessage =>
      'Ви впевнені, що хочете очистити дані свого гороскопу?';

  @override
  String get clearHoroscopeSuccess => 'Гороскоп успішно очищено.';

  @override
  String get clearChatTitle => 'Очистити історію чату';

  @override
  String get clearChatMessage =>
      'Ви впевнені, що хочете видалити всю історію чату?';

  @override
  String get clearChatLocal => 'Чат очищено локально.';

  @override
  String get deleteAccountTitle => 'Видалити обліковий запис';

  @override
  String get deleteAccountMessage =>
      'Ви впевнені, що хочете видалити свій обліковий запис? Це також очистить всю історію ваших чатів та сповіщення.';

  @override
  String get deleteAccountSuccess => 'Ваш обліковий запис і всі дані видалено.';

  @override
  String get deleteAccountError => 'Помилка видалення облікового запису';

  @override
  String get logoutTitle => 'Вийти';

  @override
  String get logoutMessage => 'Ви впевнені, що хочете вийти?';

  @override
  String get termsPrivacyTitle => 'Умови та конфіденційність';

  @override
  String get privacyPolicyTitle => 'Політика конфіденційності';

  @override
  String get termsConditionsTitle => 'Умови та положення';

  @override
  String get dataControlTitle => 'Контроль даних';

  @override
  String get cancelButton => 'Скасувати';

  @override
  String get confirmButton => 'Підтвердити';

  @override
  String get clearQuestionsSuccess => 'Усі питання успішно видалено.';

  @override
  String get yoginiLabel => 'Йогіні';

  @override
  String get lordLabel => 'Господь';

  @override
  String get startLabel => 'Початок';

  @override
  String get recoverAccount => 'Відновити обліковий запис';

  @override
  String get endLabel => 'Кінець';

  @override
  String get startDateLabel => 'Дата початку';

  @override
  String get endDateLabel => 'Дата завершення';

  @override
  String get notAvailable => 'Недоступно';

  @override
  String get noData => 'Немає даних';

  @override
  String get unknownError => 'Невідома помилка';

  @override
  String get retryButton => 'Повторити спробу';

  @override
  String get kundaliGeneratorTitle => 'Генератор Кундалі';

  @override
  String get natalChartTitle => 'Натальна карта';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раші';

  @override
  String get ascDegreeLabel => 'Градус Асцендента';

  @override
  String get vimshottariDashaTitle => 'Вімшоттарі Даша';

  @override
  String get yoginiDashaTitle => 'Йогіні Даша';

  @override
  String get unknown => 'Невідомо';

  @override
  String get clearHoroscope => 'Очистити гороскоп';

  @override
  String get clearNotifications => 'Очистити сповіщення';

  @override
  String get clearChatHistory => 'Очистити історію чату';

  @override
  String get logout => 'Вийти';

  @override
  String get deleteAccount => 'Видалити обліковий запис';

  @override
  String get allFieldsRequired => 'Усі поля обов\'язкові для заповнення.';

  @override
  String get accountRecoveredSuccess => 'Обліковий запис успішно відновлено.';

  @override
  String get recoveryFailed =>
      'Не вдалося відновити. Перевірте свою інформацію.';

  @override
  String get recoverySecretLabel => 'Секрет відновлення:';

  @override
  String get aboutUsTitle => 'Про нас';

  @override
  String get aboutOurCompany => 'Про нашу компанію';

  @override
  String get aboutCompanyDescription =>
      'У Karma ми допомагаємо вам розкрити ваш справжній життєвий шлях завдяки позачасовій мудрості ведичної астрології. Кожне розуміння походить від справжніх, досвідчених астрологів, ретельно розроблене на основі вашої унікальної карти народження. Від щоденних гороскопів до персоналізованих порад, Karma робить давні знання доступними понад 100 мовами.';

  @override
  String get ourMission => 'Наша місія';

  @override
  String get missionDescription =>
      'Наша місія проста: надавати автентичні астрологічні поради, засновані на досвіді людини, які дозволять вам приймати впевнені та обґрунтовані рішення. Кожен прогноз та консультація відображають багаторічний професійний досвід, а не автоматизовані алгоритми.';

  @override
  String get ourVision => 'Наше бачення';

  @override
  String get visionDescription =>
      'Ми прагнемо бути найнадійнішою у світі платформою для ведичної астрології, допомагаючи людям у всьому світі чітко та впевнено розуміти себе, свій вибір та свій життєвий шлях.';

  @override
  String get ourValues => 'Наші цінності';

  @override
  String get valuesDescription =>
      'У Karma ми цінуємо справжність, точність та довіру. Ми прагнемо пропонувати не лише точні, але й змістовні поради, допомагаючи вам орієнтуватися в житті з розумінням та впевненістю.';

  @override
  String get contactUs => 'Зв\'яжіться з нами';

  @override
  String get contactEmail => 'Електронна пошта: support@yourcompany.com';

  @override
  String get contactWebsite => 'Вебсайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Підтримка клієнтів';

  @override
  String get supportHeroTitle => 'Ми тут, щоб допомогти';

  @override
  String get supportHeroDescription =>
      'Заповніть форму нижче, і наша служба підтримки зв\'яжеться з вами якомога швидше.';

  @override
  String get yourName => 'Ваше ім\'я';

  @override
  String get yourEmail => 'Ваша електронна адреса';

  @override
  String get message => 'Повідомлення';

  @override
  String get enterEmail => 'Введіть свою електронну адресу';

  @override
  String get enterValidEmail => 'Введіть дійсну адресу електронної пошти';

  @override
  String enterField(Object fieldName) {
    return 'Введіть $fieldName';
  }

  @override
  String get send => 'Надіслати';

  @override
  String get sending => 'Надсилання...';

  @override
  String get emailSentSuccess => '✅ Лист успішно надіслано!';

  @override
  String get emailSendFailed => '❌ Не вдалося надіслати електронного листа';

  @override
  String get astroDictionaryTitle => 'Астрологічний словник';

  @override
  String get searchTermsHint => 'Пошукові терміни...';

  @override
  String get noTermsFound => 'Терміни не знайдено';

  @override
  String get buyQuestionsTitle => 'Питання щодо купівлі';

  @override
  String get userNotAuthenticated => 'Користувач не автентифіковано';

  @override
  String get loadStoreDataFailed => 'Не вдалося завантажити дані магазину';

  @override
  String get missingAuthToken => 'Відсутній токен авторизації';

  @override
  String get merchantDisplayName => 'Додаток для чату Astro';

  @override
  String get paymentSuccessful => '✅ Оплата успішна! Запитання надіслано';

  @override
  String paymentFailed(Object error) {
    return '❌ Оплата не вдалася: $error';
  }

  @override
  String get yourBalance => 'Ваш баланс';

  @override
  String questionsBalance(Object count) {
    return '$count Запитання';
  }

  @override
  String get availableOffers => 'Доступні пропозиції';

  @override
  String questionsCount(Object count) {
    return '$count Запитання';
  }

  @override
  String get buyButton => 'Купити';

  @override
  String get dailyHoroscopeTitle => '🌟 Щоденний гороскоп';

  @override
  String get userIdMissing => 'Ідентифікатор користувача відсутній';

  @override
  String get fetchHoroscopesFailed => 'Не вдалося отримати гороскопи';

  @override
  String get noHoroscopeFound => 'Гороскоп не знайдено.';

  @override
  String get signLabel => 'Знак';

  @override
  String get todayLabel => 'Сьогодні';

  @override
  String get yesterdayLabel => 'Вчора';

  @override
  String get thisWeekLabel => 'Цього тижня';

  @override
  String get lastMonthLabel => 'Минулого місяця';

  @override
  String get chatTitle => 'Чат';

  @override
  String get typeYourQuestionHint => 'Введіть своє запитання...';

  @override
  String get paymentRequired => 'Потрібна оплата';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Ви використали свої безкоштовні запитання. Сплатіть $amount, щоб продовжити.';
  }

  @override
  String get payNowButton => 'Сплатити зараз';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Залишилося $count безкоштовних запитань';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Залишилося $count платних запитань';
  }

  @override
  String get thankYouFeedback => 'Дякуємо за ваш відгук!';

  @override
  String get ratingSubmitted => 'Оцінку надіслано!';

  @override
  String get setUserIdFirst =>
      'Будь ласка, спочатку встановіть свій ідентифікатор користувача';

  @override
  String get failedToFetchPrevious =>
      'Не вдалося отримати попередні запитання та відповіді';

  @override
  String errorOccurred(Object error) {
    return 'Помилка: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профіль';

  @override
  String get drawerDailyHoroscope => 'Щоденний гороскоп';

  @override
  String get drawerBuyQuestions => 'Питання щодо купівлі';

  @override
  String get drawerAstroDictionary => 'Астрологічний словник';

  @override
  String get drawerSettings => 'Налаштування';

  @override
  String get drawerCustomerSupport => 'Підтримка клієнтів';

  @override
  String get drawerAbout => 'Про нас';

  @override
  String get drawerProfileSettings => 'Налаштування профілю';

  @override
  String get demoNotificationTitle => '🔔 Сповіщення про демоверсію';

  @override
  String get demoNotificationBody =>
      'Це тестове сповіщення від вашого застосунку!';

  @override
  String get notificationsTitle => 'Сповіщення';

  @override
  String get noNotifications => 'Немає сповіщень';

  @override
  String get allTab => 'Усі';

  @override
  String get markAllAsRead => 'Позначити всі як прочитані';

  @override
  String get notificationMarkedRead => 'Сповіщення позначено як прочитане';

  @override
  String get failedToLoadNotifications => 'Не вдалося завантажити сповіщення';

  @override
  String get failedToMarkRead => 'Не вдалося позначити як прочитане';

  @override
  String get failedToMarkAllRead => 'Не вдалося позначити всі як прочитані';

  @override
  String get socketConnected => 'Розетка підключена';

  @override
  String get socketDisconnected => 'Розетка відключена';

  @override
  String get newNotificationReceived => 'Отримано нове сповіщення';

  @override
  String get generalCategory => 'Загальне';

  @override
  String get horoscopeCategory => 'Гороскоп';

  @override
  String get chatCategory => 'Чат';

  @override
  String get systemCategory => 'Система';

  @override
  String get updateCategory => 'Оновлення';

  @override
  String get howToAskTitle => 'Як запитати';

  @override
  String get noQuestionsAvailable => 'Немає доступних запитань';

  @override
  String get failedToLoadQuestions => 'Не вдалося завантажити запитання';

  @override
  String get pullToRefresh => 'Потягніть, щоб оновити';

  @override
  String get careerCategory => 'Кар\'єра';

  @override
  String get loveCategory => 'Кохання та стосунки';

  @override
  String get healthCategory => 'Здоров\'я';

  @override
  String get financeCategory => 'Фінанси';

  @override
  String get familyCategory => 'Сім\'я';

  @override
  String get educationCategory => 'Освіта';

  @override
  String get travelCategory => 'Подорожі';

  @override
  String get spiritualCategory => 'Духовний';

  @override
  String get profileLoaded => 'Профіль успішно завантажено';

  @override
  String get imageUploaded => 'Зображення успішно завантажено';

  @override
  String get savedInformationConfirmation => 'Я зберіг цю інформацію';

  @override
  String get noHistoryAvailable => 'Історія недоступна';

  @override
  String get missingUserIdError => 'Потрібен ідентифікатор користувача';

  @override
  String get networkError => 'Помилка мережі. Спробуйте ще раз.';

  @override
  String get timeoutError => 'Час очікування запиту минув';

  @override
  String get genericError => 'Щось пішло не так';

  @override
  String get reactionUpdateError => 'Не вдалося оновити реакцію';

  @override
  String get noSearchResults => 'Результатів пошуку не знайдено';

  @override
  String get clearSearch => 'Очистити пошук';

  @override
  String get resultsFound => 'Знайдені результати';

  @override
  String get recoverySecretHint =>
      'Копіювання та вставка можуть не спрацювати, введіть текст вручну';

  @override
  String get recoverAccountDescription =>
      'Виконайте ці кроки, щоб відновити свій обліковий запис';

  @override
  String get processingLabel => 'Обробка...';

  @override
  String get clearChatSuccess => 'Чат успішно очищено';

  @override
  String get notificationsEnabled => 'Сповіщення ввімкнено';

  @override
  String get notificationsDisabled => 'Сповіщення вимкнено';

  @override
  String get securityNotice => 'Ваші дані надійно зашифровані та зберігаються';

  @override
  String get loading => 'Завантаження...';

  @override
  String get selectLanguage => 'Виберіть мову';

  @override
  String get onboardingGetStartedDesc => 'Почніть з вибору мови';

  @override
  String get accountRecoveryTitle =>
      '🔐 Інформація про відновлення облікового запису';

  @override
  String get recoveryInstructions =>
      'Будь ласка, збережіть цю інформацію надійно. Вона знадобиться вам для відновлення облікового запису.';

  @override
  String get importantNotice => '⚠️ Важливо:';

  @override
  String get astrologerProfileTitle => 'Профіль астролога';

  @override
  String get personalAstrologer => 'Особистий астролог';

  @override
  String get makePersonalAstrologer => 'Зробіть персонального астролога';

  @override
  String get favoriteDescription =>
      'Ваші запитання будуть передані цьому астрологу в пріоритет. Якщо він недоступний, вам допоможе інший кваліфікований астролог.';

  @override
  String get educationQualifications => 'Освіта та кваліфікація';

  @override
  String get aboutSection => 'Про нас';

  @override
  String get shareProfile => 'Поділитися профілем';

  @override
  String get loadingAstrologer => 'Завантаження даних астролога...';

  @override
  String get failedToLoadAstrologer => 'Не вдалося завантажити дані астролога';

  @override
  String get authenticationRequired =>
      'Потрібна автентифікація. Будь ласка, увійдіть.';

  @override
  String securityCheckFailed(Object error) {
    return 'Перевірка безпеки не вдалася: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name тепер ваш особистий астролог';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Видалено $name з обраного';
  }

  @override
  String get toggleFavoriteError => 'Не вдалося оновити статус обраного';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Освіта: $education\n📜 Кваліфікація: $qualification\n⏳ Досвід роботи: $experience';
  }

  @override
  String get notProvided => 'Не надано';

  @override
  String reviews(Object count) {
    return '($count відгуків)';
  }

  @override
  String get specialties => 'Спеціальності';

  @override
  String get experience => 'Досвід';

  @override
  String get qualification => 'Кваліфікація';

  @override
  String get education => 'Освіта';

  @override
  String get recoveryTips =>
      '• Зробіть скріншот цієї інформації\n• Зберігайте її в безпечному місці\n• Нікому не передавайте\n• Це буде показано лише один раз';

  @override
  String get themeSettingsTitle => 'Налаштування теми';

  @override
  String get lightThemeLabel => 'Світло';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Темний';

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
  String get ourTeam => 'Наша команда';

  @override
  String get teamDescription =>
      'Наша команда професійних ведичних астрологів має багаторічний досвід тлумачення планетарних впливів та життєвих моделей. Завдяки відданій команді підтримки та розробки, Karma забезпечує безперебійний, надійний та глобальний досвід для кожного користувача.';
}
