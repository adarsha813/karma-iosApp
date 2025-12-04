// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get settingsTitle => 'პარამეტრები';

  @override
  String get notificationSettings => 'შეტყობინებების პარამეტრები';

  @override
  String get privacySettings => 'კონფიდენციალურობის პარამეტრები';

  @override
  String get accountSettings => 'ანგარიშის პარამეტრები';

  @override
  String get languageSettings => 'ენის პარამეტრები';

  @override
  String get languageChanged => 'ენა შეიცვალა';

  @override
  String get existingUserButton => 'მე უკვე არსებული მომხმარებელი ვარ';

  @override
  String get chooseCountryTitle => 'აირჩიეთ ქვეყანა';

  @override
  String get yesText => 'დიახ';

  @override
  String get noText => 'არა';

  @override
  String get appBarTitle => 'პროფილის პარამეტრები';

  @override
  String get userIdLabel => 'მომხმარებლის ID *';

  @override
  String get nameLabel => 'სახელი';

  @override
  String get birthCountryLabel => 'დაბადების ქვეყანა';

  @override
  String get birthCityLabel => 'დაბადების ქალაქი';

  @override
  String get countrySelectionTitle => 'აირჩიეთ თქვენი ქვეყანა';

  @override
  String get maleLabel => 'მამაკაცი';

  @override
  String get femaleLabel => 'ქალი';

  @override
  String get birthDateLabel => 'დაბადების თარიღი';

  @override
  String get birthDatePlaceholder => 'დაბადების თარიღის არჩევა';

  @override
  String get birthTimeLabel => 'დაბადების დრო';

  @override
  String get birthTimePlaceholder => 'აირჩიეთ დაბადების დრო';

  @override
  String get saveProfileButton => 'პროფილის შენახვა';

  @override
  String get noCitiesFound => 'ქალაქები ვერ მოიძებნა';

  @override
  String cityPlaceholder(Object country) {
    return 'შეიყვანეთ ქალაქი $country-ში';
  }

  @override
  String get countryFirstPlaceholder => 'ჯერ ქვეყანა აირჩიეთ';

  @override
  String get versionHistoryTitle => 'ვერსიის ისტორია';

  @override
  String get notSetText => 'არ არის დაყენებული';

  @override
  String nameHistory(Object name) {
    return 'სახელი: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ქალაქი: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ქვეყანა: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'სქესი: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'დაბადების თარიღი: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'დაბადების დრო: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'მდებარეობა: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'დროის სარტყელი: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ზამთრის დრო: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'მდგომარეობა: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'განახლებულია $date-ში';
  }

  @override
  String get userIdRequired => 'მომხმარებლის ID საჭიროა';

  @override
  String get profileSaved => 'პროფილი წარმატებით შენახულია';

  @override
  String get saveFailed => 'პროფილის შენახვა ვერ მოხერხდა';

  @override
  String get errorPrefix => 'შეცდომა:';

  @override
  String get onboardingChooseLanguage => 'აირჩიეთ თქვენი ენა';

  @override
  String get onboardingChooseLanguageDesc =>
      'გასაგრძელებლად აირჩიეთ თქვენთვის სასურველი ენა.';

  @override
  String get onboardingWhatIsAstrology => 'რა არის ასტროლოგია?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ასტროლოგია არის ციური სხეულების შესწავლა...';

  @override
  String get onboardingWhyUseApp => 'რატომ უნდა გამოვიყენოთ ეს აპლიკაცია?';

  @override
  String get onboardingWhyUseAppDesc =>
      'მიიღეთ პერსონალიზებული ჰოროსკოპები, ყოველდღიური პროგნოზები და რჩევები ინფორმირებული გადაწყვეტილებების მისაღებად.';

  @override
  String get onboardingHowToUse => 'როგორ გამოვიყენოთ ეს აპლიკაცია?';

  @override
  String get onboardingHowToUseDesc =>
      'მარტივად ნავიგაცია, ყოველდღიური ჰოროსკოპების შემოწმება და თქვენი პროფილის მართვა ზუსტი პროგნოზებისთვის.';

  @override
  String get onboardingGetStarted => 'დაწყება';

  @override
  String get onboardingNewUser => 'ახალი მომხმარებელი';

  @override
  String get onboardingExistingUser => 'არსებული მომხმარებელი';

  @override
  String get onboardingBack => 'უკან';

  @override
  String get onboardingNext => 'შემდეგი';

  @override
  String get userIdNotFound =>
      'მომხმარებლის ID ვერ მოიძებნა. გთხოვთ, შეხვიდეთ სისტემაში ან დააყენოთ თქვენი პროფილი.';

  @override
  String get clearNotificationsTitle => 'შეტყობინებების გასუფთავება';

  @override
  String get clearNotificationsMessage =>
      'დარწმუნებული ხართ, რომ გსურთ ყველა შეტყობინების წაშლა?';

  @override
  String get clearNotificationsSuccess =>
      'ყველა შეტყობინება წარმატებით წაიშალა.';

  @override
  String get clearHoroscopeTitle => 'წმინდა ჰოროსკოპი';

  @override
  String get clearHoroscopeMessage =>
      'დარწმუნებული ხართ, რომ გსურთ თქვენი ჰოროსკოპის მონაცემების გასუფთავება?';

  @override
  String get clearHoroscopeSuccess => 'ჰოროსკოპი წარმატებით გაიწმინდა.';

  @override
  String get clearChatTitle => 'ჩატის ისტორიის გასუფთავება';

  @override
  String get clearChatMessage =>
      'დარწმუნებული ხართ, რომ გსურთ თქვენი ჩატის ისტორიის მთლიანად წაშლა?';

  @override
  String get clearChatLocal => 'ჩატი ადგილობრივად გაიწმინდა.';

  @override
  String get deleteAccountTitle => 'ანგარიშის წაშლა';

  @override
  String get deleteAccountMessage =>
      'დარწმუნებული ხართ, რომ გსურთ თქვენი ანგარიშის წაშლა? ეს ასევე წაშლის თქვენი ჩატის ისტორიას და შეტყობინებებს.';

  @override
  String get deleteAccountSuccess =>
      'თქვენი ანგარიში და ყველა მონაცემი წაიშალა.';

  @override
  String get deleteAccountError =>
      'ანგარიშის წაშლისას შეცდომა მოხდა: მოხდა ანგარიშის წაშლა.';

  @override
  String get logoutTitle => 'გასვლა';

  @override
  String get logoutMessage => 'დარწმუნებული ხართ, რომ გსურთ გასვლა?';

  @override
  String get termsPrivacyTitle => 'პირობები და კონფიდენციალურობა';

  @override
  String get privacyPolicyTitle => 'კონფიდენციალურობის პოლიტიკა';

  @override
  String get termsConditionsTitle => 'წესები და პირობები';

  @override
  String get dataControlTitle => 'მონაცემთა კონტროლი';

  @override
  String get cancelButton => 'გაუქმება';

  @override
  String get confirmButton => 'დადასტურება';

  @override
  String get clearQuestionsSuccess => 'ყველა კითხვა წარმატებით წაიშალა.';

  @override
  String get yoginiLabel => 'იოგინი';

  @override
  String get lordLabel => 'უფალი';

  @override
  String get startLabel => 'დაწყება';

  @override
  String get recoverAccount => 'ანგარიშის აღდგენა';

  @override
  String get endLabel => 'დასასრული';

  @override
  String get startDateLabel => 'დაწყების თარიღი';

  @override
  String get endDateLabel => 'დასრულების თარიღი';

  @override
  String get notAvailable => 'მიუწვდომელია';

  @override
  String get noData => 'მონაცემები არ არის';

  @override
  String get unknownError => 'უცნობი შეცდომა';

  @override
  String get retryButton => 'ხელახლა ცდა';

  @override
  String get kundaliGeneratorTitle => 'კუნდალის გენერატორი';

  @override
  String get natalChartTitle => 'ნატალური რუკა';

  @override
  String get lagnaLabel => 'ლაგნა';

  @override
  String get rashiLabel => 'რაში';

  @override
  String get ascDegreeLabel => 'აღმავალი ხარისხი';

  @override
  String get vimshottariDashaTitle => 'ვიმშოტარი დაშა';

  @override
  String get yoginiDashaTitle => 'იოგინი დაშა';

  @override
  String get unknown => 'უცნობი';

  @override
  String get clearHoroscope => 'წმინდა ჰოროსკოპი';

  @override
  String get clearNotifications => 'შეტყობინებების გასუფთავება';

  @override
  String get clearChatHistory => 'ჩატის ისტორიის გასუფთავება';

  @override
  String get logout => 'გასვლა';

  @override
  String get deleteAccount => 'ანგარიშის წაშლა';

  @override
  String get allFieldsRequired => 'ყველა ველი სავალდებულოა.';

  @override
  String get accountRecoveredSuccess => 'ანგარიში წარმატებით აღდგა.';

  @override
  String get recoveryFailed =>
      'აღდგენა ვერ მოხერხდა. შეამოწმეთ თქვენი ინფორმაცია.';

  @override
  String get recoverySecretLabel => 'აღდგენის საიდუმლო:';

  @override
  String get aboutUsTitle => 'ჩვენს შესახებ';

  @override
  String get aboutOurCompany => 'ჩვენი კომპანიის შესახებ';

  @override
  String get aboutCompanyDescription =>
      'კარმაში ჩვენ დაგეხმარებით აღმოაჩინოთ თქვენი ნამდვილი ცხოვრებისეული გზა ვედური ასტროლოგიის მარადიული სიბრძნის მეშვეობით. ყველა ინფორმაცია მოდის რეალური, გამოცდილი ასტროლოგებისგან, რომელიც ფრთხილად არის შემუშავებული თქვენი უნიკალური დაბადების რუკის საფუძველზე. ყოველდღიური ჰოროსკოპებიდან დაწყებული პერსონალიზებული ხელმძღვანელობით დამთავრებული, კარმა უძველეს ცოდნას 100-ზე მეტ ენაზე ხელმისაწვდომს ხდის.';

  @override
  String get ourMission => 'ჩვენი მისია';

  @override
  String get missionDescription =>
      'ჩვენი მისია მარტივია: უზრუნველვყოთ ავთენტური, ადამიანის მიერ ხელმძღვანელობით ჩატარებული ასტროლოგიური ხელმძღვანელობა, რომელიც საშუალებას მოგცემთ მიიღოთ თავდაჯერებული და ინფორმირებული გადაწყვეტილებები. ყველა პროგნოზი და კონსულტაცია ასახავს მრავალწლიან პროფესიულ გამოცდილებას და არა ავტომატიზირებულ ალგორითმებს.';

  @override
  String get ourVision => 'ჩვენი ხედვა';

  @override
  String get visionDescription =>
      'ჩვენ ვცდილობთ ვიყოთ ვედური ასტროლოგიის მსოფლიოში ყველაზე სანდო პლატფორმა, რომელიც ეხმარება ადამიანებს ყველგან გაიგონ საკუთარი თავი, თავიანთი არჩევანი და ცხოვრებისეული გზა ნათლად და თავდაჯერებულად.';

  @override
  String get ourValues => 'ჩვენი ღირებულებები';

  @override
  String get valuesDescription =>
      'კარმაში ჩვენ ვაფასებთ ავთენტურობას, სიზუსტეს და ნდობას. ჩვენ ვალდებულნი ვართ შემოგთავაზოთ არა მხოლოდ ზუსტი, არამედ შინაარსიანი რჩევები, რაც დაგეხმარებათ ცხოვრებისეული გამოცდილებისა და თავდაჯერებულობის გამოყენებით ნავიგაციაში.';

  @override
  String get contactUs => 'დაგვიკავშირდით';

  @override
  String get contactEmail => 'ელ. ფოსტა: support@yourcompany.com';

  @override
  String get contactWebsite => 'ვებსაიტი: www.yourcompany.com';

  @override
  String get customerSupport => 'მომხმარებელთა მხარდაჭერა';

  @override
  String get supportHeroTitle => 'ჩვენ აქ ვართ დასახმარებლად';

  @override
  String get supportHeroDescription =>
      'შეავსეთ ქვემოთ მოცემული ფორმა და ჩვენი მხარდაჭერის გუნდი რაც შეიძლება მალე დაგიკავშირდებათ.';

  @override
  String get yourName => 'თქვენი სახელი';

  @override
  String get yourEmail => 'თქვენი ელ. ფოსტა';

  @override
  String get message => 'შეტყობინება';

  @override
  String get enterEmail => 'შეიყვანეთ თქვენი ელ. ფოსტა';

  @override
  String get enterValidEmail => 'შეიყვანეთ სწორი ელექტრონული ფოსტის მისამართი';

  @override
  String enterField(Object fieldName) {
    return 'შეიყვანეთ $fieldName';
  }

  @override
  String get send => 'გაგზავნა';

  @override
  String get sending => 'იგზავნება...';

  @override
  String get emailSentSuccess => '✅ ელ.წერილი წარმატებით გაიგზავნა!';

  @override
  String get emailSendFailed => '❌ ელფოსტის გაგზავნა ვერ მოხერხდა';

  @override
  String get astroDictionaryTitle => 'ასტრო ლექსიკონი';

  @override
  String get searchTermsHint => 'საძიებო ტერმინები...';

  @override
  String get noTermsFound => 'ტერმინები ვერ მოიძებნა';

  @override
  String get buyQuestionsTitle => 'შესყიდვის კითხვები';

  @override
  String get userNotAuthenticated => 'მომხმარებელი არ არის ავტორიზებული';

  @override
  String get loadStoreDataFailed =>
      'მაღაზიის მონაცემების ჩატვირთვა ვერ მოხერხდა';

  @override
  String get missingAuthToken => 'ავტორიზაციის ტოკენი აკლია';

  @override
  String get merchantDisplayName => 'ასტრო ჩატის აპლიკაცია';

  @override
  String get paymentSuccessful =>
      '✅ გადახდა წარმატებით დასრულდა! კითხვა გაგზავნილია!';

  @override
  String paymentFailed(Object error) {
    return '❌ გადახდა ვერ მოხერხდა: $error';
  }

  @override
  String get yourBalance => 'თქვენი ბალანსი';

  @override
  String questionsBalance(Object count) {
    return '$count კითხვები';
  }

  @override
  String get availableOffers => 'ხელმისაწვდომი შეთავაზებები';

  @override
  String questionsCount(Object count) {
    return '$count კითხვა';
  }

  @override
  String get buyButton => 'ყიდვა';

  @override
  String get dailyHoroscopeTitle => '🌟 ყოველდღიური ჰოროსკოპი';

  @override
  String get userIdMissing => 'მომხმარებლის ID აკლია';

  @override
  String get fetchHoroscopesFailed => 'ჰოროსკოპების მიღება ვერ მოხერხდა';

  @override
  String get noHoroscopeFound => 'ჰოროსკოპი ვერ მოიძებნა.';

  @override
  String get signLabel => 'ნიშანი';

  @override
  String get todayLabel => 'დღეს';

  @override
  String get yesterdayLabel => 'გუშინ';

  @override
  String get thisWeekLabel => 'ამ კვირაში';

  @override
  String get lastMonthLabel => 'გასული თვე';

  @override
  String get chatTitle => 'ჩატი';

  @override
  String get typeYourQuestionHint => 'აკრიფეთ თქვენი კითხვა...';

  @override
  String get paymentRequired => 'გადახდა სავალდებულოა';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'თქვენ გამოიყენეთ თქვენი უფასო კითხვები. გადაუხადეთ $amount გასაგრძელებლად.';
  }

  @override
  String get payNowButton => 'გადაიხადეთ ახლავე';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count დარჩენილია უფასო კითხვები';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count დარჩენილია ფასიანი კითხვები';
  }

  @override
  String get thankYouFeedback => 'გმადლობთ თქვენი გამოხმაურებისთვის!';

  @override
  String get ratingSubmitted => 'შეფასება წარდგენილია!';

  @override
  String get setUserIdFirst => 'გთხოვთ, ჯერ თქვენი მომხმარებლის ID დააყენოთ';

  @override
  String get failedToFetchPrevious =>
      'წინა კითხვებისა და პასუხების მოძიება ვერ მოხერხდა';

  @override
  String errorOccurred(Object error) {
    return 'შეცდომა: $error';
  }

  @override
  String get drawerAstroProfile => 'ასტრო პროფილი';

  @override
  String get drawerDailyHoroscope => 'ყოველდღიური ჰოროსკოპი';

  @override
  String get drawerBuyQuestions => 'შესყიდვის კითხვები';

  @override
  String get drawerAstroDictionary => 'ასტრო ლექსიკონი';

  @override
  String get drawerSettings => 'პარამეტრები';

  @override
  String get drawerCustomerSupport => 'მომხმარებელთა მხარდაჭერა';

  @override
  String get drawerAbout => 'შესახებ';

  @override
  String get drawerProfileSettings => 'პროფილის პარამეტრები';

  @override
  String get demoNotificationTitle => '🔔 დემო შეტყობინება';

  @override
  String get demoNotificationBody =>
      'ეს თქვენი აპლიკაციიდან სატესტო შეტყობინებაა!';

  @override
  String get notificationsTitle => 'შეტყობინებები';

  @override
  String get noNotifications => 'შეტყობინებები არ არის';

  @override
  String get allTab => 'ყველა';

  @override
  String get markAllAsRead => 'ყველას წაკითხულად მონიშვნა';

  @override
  String get notificationMarkedRead =>
      'შეტყობინება მონიშნულია, როგორც წაკითხული';

  @override
  String get failedToLoadNotifications =>
      'შეტყობინებების ჩატვირთვა ვერ მოხერხდა';

  @override
  String get failedToMarkRead => 'წაკითხულად მონიშვნა ვერ მოხერხდა';

  @override
  String get failedToMarkAllRead => 'ყველას წაკითხულად მონიშვნა ვერ მოხერხდა';

  @override
  String get socketConnected => 'სოკეტი დაკავშირებულია';

  @override
  String get socketDisconnected => 'სოკეტი გათიშულია';

  @override
  String get newNotificationReceived => 'ახალი შეტყობინება მიღებულია';

  @override
  String get generalCategory => 'ზოგადი';

  @override
  String get horoscopeCategory => 'ჰოროსკოპი';

  @override
  String get chatCategory => 'ჩატი';

  @override
  String get systemCategory => 'სისტემა';

  @override
  String get updateCategory => 'განახლებები';

  @override
  String get howToAskTitle => 'როგორ ვიკითხოთ';

  @override
  String get noQuestionsAvailable => 'კითხვები არ არის ხელმისაწვდომი';

  @override
  String get failedToLoadQuestions => 'კითხვების ჩატვირთვა ვერ მოხერხდა';

  @override
  String get pullToRefresh => 'გაწიეთ განახლებისთვის';

  @override
  String get careerCategory => 'კარიერა';

  @override
  String get loveCategory => 'სიყვარული და ურთიერთობები';

  @override
  String get healthCategory => 'ჯანმრთელობა';

  @override
  String get financeCategory => 'ფინანსები';

  @override
  String get familyCategory => 'ოჯახი';

  @override
  String get educationCategory => 'განათლება';

  @override
  String get travelCategory => 'მოგზაურობა';

  @override
  String get spiritualCategory => 'სულიერი';

  @override
  String get profileLoaded => 'პროფილი წარმატებით ჩაიტვირთა';

  @override
  String get imageUploaded => 'სურათი წარმატებით აიტვირთა';

  @override
  String get savedInformationConfirmation => 'ეს ინფორმაცია შენახული მაქვს';

  @override
  String get noHistoryAvailable => 'ისტორია მიუწვდომელია';

  @override
  String get missingUserIdError => 'მომხმარებლის ID საჭიროა';

  @override
  String get networkError => 'ქსელის შეცდომა. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get timeoutError => 'მოთხოვნის დრო ამოიწურა';

  @override
  String get genericError => 'რაღაც არასწორად მოხდა';

  @override
  String get reactionUpdateError => 'რეაქციის განახლება ვერ მოხერხდა';

  @override
  String get noSearchResults => 'ძიების შედეგები ვერ მოიძებნა';

  @override
  String get clearSearch => 'ძიების გასუფთავება';

  @override
  String get resultsFound => 'ნაპოვნი შედეგები';

  @override
  String get recoverySecretHint =>
      'კოპირება-ჩასმა შეიძლება არ იმუშაოს, ხელით აკრიფეთ';

  @override
  String get recoverAccountDescription =>
      'თქვენი ანგარიშის აღსადგენად მიჰყევით ამ ნაბიჯებს';

  @override
  String get processingLabel => 'დამუშავება...';

  @override
  String get clearChatSuccess => 'ჩატი წარმატებით გაიწმინდა';

  @override
  String get notificationsEnabled => 'შეტყობინებები ჩართულია';

  @override
  String get notificationsDisabled => 'შეტყობინებები გამორთულია';

  @override
  String get securityNotice =>
      'თქვენი მონაცემები უსაფრთხოდ დაშიფრული და შენახულია';

  @override
  String get loading => 'იტვირთება...';

  @override
  String get selectLanguage => 'ენის არჩევა';

  @override
  String get onboardingGetStartedDesc => 'დაიწყეთ თქვენი ენის არჩევით';

  @override
  String get accountRecoveryTitle => '🔐 ანგარიშის აღდგენის დეტალები';

  @override
  String get recoveryInstructions =>
      'გთხოვთ, უსაფრთხოდ შეინახოთ ეს ინფორმაცია. ის თქვენი ანგარიშის აღსადგენად დაგჭირდებათ.';

  @override
  String get importantNotice => '⚠️ მნიშვნელოვანია:';

  @override
  String get astrologerProfileTitle => 'ასტროლოგის პროფილი';

  @override
  String get personalAstrologer => 'პირადი ასტროლოგი';

  @override
  String get makePersonalAstrologer => 'გახდი პირადი ასტროლოგი';

  @override
  String get favoriteDescription =>
      'თქვენს კითხვებს პრიორიტეტულად სწორედ ამ ასტროლოგს გადასცემენ. თუ ის არ არის ხელმისაწვდომი, სხვა კვალიფიციური ასტროლოგი დაგეხმარებათ.';

  @override
  String get educationQualifications => 'განათლება და კვალიფიკაცია';

  @override
  String get aboutSection => 'შესახებ';

  @override
  String get shareProfile => 'პროფილის გაზიარება';

  @override
  String get loadingAstrologer => 'ასტროლოგის დეტალები იტვირთება...';

  @override
  String get failedToLoadAstrologer =>
      'ასტროლოგის დეტალების ჩატვირთვა ვერ მოხერხდა';

  @override
  String get authenticationRequired =>
      'საჭიროა ავტორიზაცია. გთხოვთ, შეხვიდეთ სისტემაში.';

  @override
  String securityCheckFailed(Object error) {
    return 'უსაფრთხოების შემოწმება ვერ მოხერხდა: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ახლა თქვენი პირადი ასტროლოგია';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name წაშლილია რჩეულებიდან';
  }

  @override
  String get toggleFavoriteError => 'ფავორიტის სტატუსის განახლება ვერ მოხერხდა';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 განათლება: $education\n📜 კვალიფიკაცია: $qualification\n⏳ გამოცდილება: $experience';
  }

  @override
  String get notProvided => 'არ არის მოწოდებული';

  @override
  String reviews(Object count) {
    return '($count მიმოხილვები)';
  }

  @override
  String get specialties => 'სპეციალობები';

  @override
  String get experience => 'გამოცდილება';

  @override
  String get qualification => 'კვალიფიკაცია';

  @override
  String get education => 'განათლება';

  @override
  String get recoveryTips =>
      '• გადაიღეთ ამ ინფორმაციის ეკრანის ანაბეჭდი\n• შეინახეთ უსაფრთხო ადგილას\n• არავის გაუზიარეთ\n• ეს მხოლოდ ერთხელ გამოჩნდება';

  @override
  String get themeSettingsTitle => 'თემის პარამეტრები';

  @override
  String get lightThemeLabel => 'სინათლე';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'მუქი';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'სისტემა';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'ჩვენი გუნდი';

  @override
  String get teamDescription =>
      'ჩვენი პროფესიონალი ვედური ასტროლოგების გუნდი მრავალწლიან გამოცდილებას ფლობს პლანეტარული გავლენისა და ცხოვრებისეული ნიმუშების ინტერპრეტაციაში. ერთგული მხარდაჭერისა და განვითარების გუნდის მხარდაჭერით, კარმა ყველა მომხმარებელს სთავაზობს შეუფერხებელ, საიმედო და გლობალურ გამოცდილებას.';
}
