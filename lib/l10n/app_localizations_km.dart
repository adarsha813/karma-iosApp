// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AppLocalizationsKm extends AppLocalizations {
  AppLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get settingsTitle => 'ការកំណត់';

  @override
  String get notificationSettings => 'ការកំណត់ការជូនដំណឹង';

  @override
  String get privacySettings => 'ការកំណត់ឯកជនភាព';

  @override
  String get accountSettings => 'ការកំណត់គណនី';

  @override
  String get languageSettings => 'ការកំណត់ភាសា';

  @override
  String get languageChanged => 'ភាសាបានផ្លាស់ប្តូរ';

  @override
  String get existingUserButton => 'ខ្ញុំជាអ្នកប្រើប្រាស់ដែលមានស្រាប់';

  @override
  String get chooseCountryTitle => 'ជ្រើសរើសប្រទេស';

  @override
  String get yesText => 'បាទ';

  @override
  String get noText => 'ទេ';

  @override
  String get appBarTitle => 'ការកំណត់ប្រវត្តិរូប';

  @override
  String get userIdLabel => 'លេខសម្គាល់អ្នកប្រើប្រាស់ *';

  @override
  String get nameLabel => 'ឈ្មោះ';

  @override
  String get birthCountryLabel => 'ប្រទេសកំណើត';

  @override
  String get birthCityLabel => 'ទីក្រុងកំណើត';

  @override
  String get countrySelectionTitle => 'ជ្រើសរើសប្រទេសរបស់អ្នក។';

  @override
  String get maleLabel => 'ប្រុស';

  @override
  String get femaleLabel => 'ស្រី';

  @override
  String get birthDateLabel => 'ថ្ងៃខែឆ្នាំកំណើត';

  @override
  String get birthDatePlaceholder => 'ជ្រើសរើសថ្ងៃខែឆ្នាំកំណើត';

  @override
  String get birthTimeLabel => 'ម៉ោងកំណើត';

  @override
  String get birthTimePlaceholder => 'ជ្រើសរើសពេលវេលាកំណើត';

  @override
  String get saveProfileButton => 'រក្សាទុកប្រវត្តិរូប';

  @override
  String get noCitiesFound => 'រកមិនឃើញទីក្រុងទេ។';

  @override
  String cityPlaceholder(Object country) {
    return 'បញ្ចូលទីក្រុងនៅក្នុង $country';
  }

  @override
  String get countryFirstPlaceholder => 'ជ្រើសរើសប្រទេសជាមុនសិន';

  @override
  String get versionHistoryTitle => 'ប្រវត្តិកំណែ';

  @override
  String get notSetText => 'មិនបានកំណត់';

  @override
  String nameHistory(Object name) {
    return 'ឈ្មោះ៖ $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ទីក្រុង៖ $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ប្រទេស៖ $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ភេទ៖ $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ថ្ងៃខែឆ្នាំកំណើត៖ $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ម៉ោងកំណើត៖ $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ទីតាំង៖ $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'តំបន់ពេលវេលា៖ GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST៖ $value';
  }

  @override
  String stateHistory(Object state) {
    return 'រដ្ឋ៖ $state';
  }

  @override
  String versionFromText(Object date) {
    return 'បានធ្វើបច្ចុប្បន្នភាពនៅលើ $date';
  }

  @override
  String get userIdRequired => 'លេខសម្គាល់អ្នកប្រើប្រាស់ត្រូវបានទាមទារ';

  @override
  String get profileSaved => 'ប្រវត្តិរូបត្រូវបានរក្សាទុកដោយជោគជ័យ';

  @override
  String get saveFailed => 'បរាជ័យក្នុងការរក្សាទុកកម្រងព័ត៌មាន';

  @override
  String get errorPrefix => 'កំហុស៖';

  @override
  String get onboardingChooseLanguage => 'ជ្រើសរើសភាសារបស់អ្នក។';

  @override
  String get onboardingChooseLanguageDesc =>
      'ជ្រើសរើសភាសាដែលអ្នកពេញចិត្តដើម្បីបន្ត។';

  @override
  String get onboardingWhatIsAstrology => 'តើហោរាសាស្រ្តជាអ្វី?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ហោរាសាស្ត្រ​គឺ​ជា​ការ​សិក្សា​អំពី​រូបកាយ​សេឡេស្ទាល...';

  @override
  String get onboardingWhyUseApp => 'ហេតុអ្វីត្រូវប្រើកម្មវិធីនេះ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ទទួលបានហោរាសាស្ត្រផ្ទាល់ខ្លួន ការទស្សន៍ទាយប្រចាំថ្ងៃ និងការណែនាំដើម្បីធ្វើការសម្រេចចិត្តដែលមានព័ត៌មាន។';

  @override
  String get onboardingHowToUse => 'របៀបប្រើកម្មវិធីនេះ?';

  @override
  String get onboardingHowToUseDesc =>
      'រុករកយ៉ាងងាយស្រួល ពិនិត្យហោរាសាស្ត្រប្រចាំថ្ងៃ និងគ្រប់គ្រងប្រវត្តិរូបរបស់អ្នកសម្រាប់ការទស្សន៍ទាយត្រឹមត្រូវ។';

  @override
  String get onboardingGetStarted => 'ចាប់ផ្តើម';

  @override
  String get onboardingNewUser => 'អ្នកប្រើប្រាស់ថ្មី។';

  @override
  String get onboardingExistingUser => 'អ្នកប្រើប្រាស់ដែលមានស្រាប់';

  @override
  String get onboardingBack => 'ត្រឡប់មកវិញ';

  @override
  String get onboardingNext => 'បន្ទាប់';

  @override
  String get userIdNotFound =>
      'រកមិនឃើញលេខសម្គាល់អ្នកប្រើប្រាស់ទេ។ សូមចូល ឬកំណត់ប្រវត្តិរូបរបស់អ្នក។';

  @override
  String get clearNotificationsTitle => 'ជម្រះការជូនដំណឹង';

  @override
  String get clearNotificationsMessage =>
      'តើអ្នកប្រាកដថាចង់លុបការជូនដំណឹងទាំងអស់មែនទេ?';

  @override
  String get clearNotificationsSuccess =>
      'ការជូនដំណឹងទាំងអស់ត្រូវបានសម្អាតដោយជោគជ័យ។';

  @override
  String get clearHoroscopeTitle => 'ជម្រះហោរាសាស្ត្រ';

  @override
  String get clearHoroscopeMessage =>
      'តើ​អ្នក​ប្រាកដ​ជា​ចង់​លុប​ទិន្នន័យ​ហោរាសាស្ត្រ​របស់​អ្នក​ទេ?';

  @override
  String get clearHoroscopeSuccess => 'ហោរាសាស្ត្រ​បាន​សម្អាត​ដោយ​ជោគជ័យ។';

  @override
  String get clearChatTitle => 'សម្អាតប្រវត្តិជជែក';

  @override
  String get clearChatMessage =>
      'តើអ្នកប្រាកដថាចង់លុបប្រវត្តិជជែករបស់អ្នកទាំងអស់មែនទេ?';

  @override
  String get clearChatLocal => 'ការជជែកត្រូវបានសម្អាតក្នុងមូលដ្ឋាន។';

  @override
  String get deleteAccountTitle => 'លុបគណនី';

  @override
  String get deleteAccountMessage =>
      'តើអ្នកប្រាកដថាចង់លុបគណនីរបស់អ្នកមែនទេ? វានឹងសម្អាតប្រវត្តិជជែក និងការជូនដំណឹងរបស់អ្នកទាំងអស់ផងដែរ។';

  @override
  String get deleteAccountSuccess =>
      'គណនីរបស់អ្នក និងទិន្នន័យទាំងអស់ត្រូវបានដកចេញ។';

  @override
  String get deleteAccountError => 'កំហុសក្នុងការលុបគណនី';

  @override
  String get logoutTitle => 'ចេញ';

  @override
  String get logoutMessage => 'តើ​អ្នក​ប្រាកដ​ជា​ចង់​ចេញ?';

  @override
  String get termsPrivacyTitle => 'លក្ខខណ្ឌ និងឯកជនភាព';

  @override
  String get privacyPolicyTitle => 'គោលការណ៍ឯកជនភាព';

  @override
  String get termsConditionsTitle => 'លក្ខខណ្ឌ';

  @override
  String get dataControlTitle => 'ការគ្រប់គ្រងទិន្នន័យ';

  @override
  String get cancelButton => 'បោះបង់';

  @override
  String get confirmButton => 'បញ្ជាក់';

  @override
  String get clearQuestionsSuccess => 'សំណួរទាំងអស់ត្រូវបានលុបដោយជោគជ័យ។';

  @override
  String get yoginiLabel => 'យូហ្គីនី';

  @override
  String get lordLabel => 'ព្រះអម្ចាស់';

  @override
  String get startLabel => 'ចាប់ផ្តើម';

  @override
  String get recoverAccount => 'ស្តារគណនី';

  @override
  String get endLabel => 'ចប់';

  @override
  String get startDateLabel => 'កាលបរិច្ឆេទចាប់ផ្តើម';

  @override
  String get endDateLabel => 'កាលបរិច្ឆេទបញ្ចប់';

  @override
  String get notAvailable => 'មិនអាចប្រើបាន';

  @override
  String get noData => 'គ្មានទិន្នន័យ';

  @override
  String get unknownError => 'កំហុសមិនស្គាល់';

  @override
  String get retryButton => 'ព្យាយាមម្តងទៀត';

  @override
  String get kundaliGeneratorTitle => 'ម៉ាស៊ីនភ្លើង Kundali';

  @override
  String get natalChartTitle => 'តារាង Natal';

  @override
  String get lagnaLabel => 'ឡាណា';

  @override
  String get rashiLabel => 'រ៉ាស៊ី';

  @override
  String get ascDegreeLabel => 'សញ្ញាប័ត្រឡើង';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'មិនស្គាល់';

  @override
  String get clearHoroscope => 'ជម្រះហោរាសាស្ត្រ';

  @override
  String get clearNotifications => 'ជម្រះការជូនដំណឹង';

  @override
  String get clearChatHistory => 'សម្អាតប្រវត្តិជជែក';

  @override
  String get logout => 'ចេញ';

  @override
  String get deleteAccount => 'លុបគណនី';

  @override
  String get allFieldsRequired => 'វាលទាំងអស់ត្រូវបានទាមទារ។';

  @override
  String get accountRecoveredSuccess => 'គណនីត្រូវបានសង្គ្រោះដោយជោគជ័យ។';

  @override
  String get recoveryFailed =>
      'ការស្តារឡើងវិញបានបរាជ័យ។ ពិនិត្យព័ត៌មានរបស់អ្នក។';

  @override
  String get recoverySecretLabel => 'អាថ៌កំបាំងនៃការស្តារឡើងវិញ៖';

  @override
  String get aboutUsTitle => 'អំពីពួកយើង';

  @override
  String get aboutOurCompany => 'អំពីក្រុមហ៊ុនរបស់យើង។';

  @override
  String get aboutCompanyDescription =>
      'យើងប្តេជ្ញាផ្តល់នូវបទពិសោធន៍ហោរាសាស្រ្តល្អបំផុតដល់អ្នកប្រើប្រាស់របស់យើង។';

  @override
  String get ourMission => 'បេសកកម្មរបស់យើង។';

  @override
  String get missionDescription =>
      'ដើម្បីផ្តល់នូវការយល់ដឹងអំពីហោរាសាស្រ្តត្រឹមត្រូវ និងផ្ទាល់ខ្លួន ដើម្បីជួយអ្នកប្រើប្រាស់ធ្វើការសម្រេចចិត្តប្រកបដោយព័ត៌មានក្នុងជីវិតរបស់ពួកគេ។';

  @override
  String get ourVision => 'ចក្ខុវិស័យរបស់យើង។';

  @override
  String get visionDescription =>
      'ដើម្បីក្លាយជាវេទិកាហោរាសាស្រ្តដែលគួរឱ្យទុកចិត្តបំផុត រួមបញ្ចូលគ្នារវាងបច្ចេកវិទ្យា និងប្រាជ្ញាបុរាណ។';

  @override
  String get ourValues => 'តម្លៃរបស់យើង។';

  @override
  String get valuesDescription =>
      'សុចរិតភាព ភាពត្រឹមត្រូវ ការរចនាជាមជ្ឈមណ្ឌលអ្នកប្រើប្រាស់ និងការច្នៃប្រឌិតជាបន្តបន្ទាប់។';

  @override
  String get contactUs => 'ទាក់ទងមកយើងខ្ញុំ';

  @override
  String get contactEmail => 'អ៊ីមែល៖ support@yourcompany.com';

  @override
  String get contactWebsite => 'គេហទំព័រ៖ www.yourcompany.com';

  @override
  String get customerSupport => 'ជំនួយអតិថិជន';

  @override
  String get supportHeroTitle => 'យើងនៅទីនេះដើម្បីជួយ';

  @override
  String get supportHeroDescription =>
      'បំពេញទម្រង់ខាងក្រោម ហើយក្រុមគាំទ្ររបស់យើងនឹងត្រលប់មកអ្នកវិញឱ្យបានឆាប់តាមដែលអាចធ្វើទៅបាន។';

  @override
  String get yourName => 'ឈ្មោះរបស់អ្នក។';

  @override
  String get yourEmail => 'អ៊ីមែលរបស់អ្នក។';

  @override
  String get message => 'សារ';

  @override
  String get enterEmail => 'បញ្ចូលអ៊ីមែលរបស់អ្នក។';

  @override
  String get enterValidEmail => 'បញ្ចូលអាសយដ្ឋានអ៊ីមែលត្រឹមត្រូវ។';

  @override
  String enterField(Object fieldName) {
    return 'បញ្ចូល $fieldName';
  }

  @override
  String get send => 'ផ្ញើ';

  @override
  String get sending => 'កំពុងផ្ញើ...';

  @override
  String get emailSentSuccess => '✅ ផ្ញើអ៊ីមែលដោយជោគជ័យ!';

  @override
  String get emailSendFailed => '❌ បរាជ័យក្នុងការផ្ញើអ៊ីមែល';

  @override
  String get astroDictionaryTitle => 'វចនានុក្រម Astro';

  @override
  String get searchTermsHint => 'ពាក្យ​ស្វែងរក...';

  @override
  String get noTermsFound => 'រកមិនឃើញលក្ខខណ្ឌទេ។';

  @override
  String get buyQuestionsTitle => 'ទិញសំណួរ';

  @override
  String get userNotAuthenticated => 'អ្នក​ប្រើ​មិន​ត្រូវ​បាន​ផ្ទៀងផ្ទាត់';

  @override
  String get loadStoreDataFailed => 'បរាជ័យក្នុងការផ្ទុកទិន្នន័យ';

  @override
  String get missingAuthToken => 'បាត់សញ្ញាសម្ងាត់';

  @override
  String get merchantDisplayName => 'កម្មវិធីជជែក Astro';

  @override
  String get paymentSuccessful => '✅ ការទូទាត់ជោគជ័យ! បាន​ផ្ញើ​សំណួរ';

  @override
  String paymentFailed(Object error) {
    return '❌ ការទូទាត់បានបរាជ័យ៖ $error';
  }

  @override
  String get yourBalance => 'សមតុល្យរបស់អ្នក។';

  @override
  String questionsBalance(Object count) {
    return '$count សំណួរ';
  }

  @override
  String get availableOffers => 'ការផ្តល់ជូនដែលមាន';

  @override
  String questionsCount(Object count) {
    return '$count សំណួរ';
  }

  @override
  String get buyButton => 'ទិញ';

  @override
  String get dailyHoroscopeTitle => '🌟 ហោរាសាស្ត្រប្រចាំថ្ងៃ';

  @override
  String get userIdMissing => 'លេខសម្គាល់អ្នកប្រើប្រាស់បាត់';

  @override
  String get fetchHoroscopesFailed => 'បរាជ័យក្នុងការទាញយកហោរាសាស្ត្រ';

  @override
  String get noHoroscopeFound => 'រកមិនឃើញហោរាសាស្ត្រទេ។';

  @override
  String get signLabel => 'សញ្ញា';

  @override
  String get todayLabel => 'ថ្ងៃនេះ';

  @override
  String get yesterdayLabel => 'ម្សិលមិញ';

  @override
  String get thisWeekLabel => 'សប្តាហ៍នេះ។';

  @override
  String get lastMonthLabel => 'ខែមុន។';

  @override
  String get chatTitle => 'ជជែក';

  @override
  String get typeYourQuestionHint => 'វាយសំណួររបស់អ្នក...';

  @override
  String get paymentRequired => 'តម្រូវឱ្យបង់ប្រាក់';

  @override
  String get paymentRequiredMessage =>
      'អ្នកបានប្រើសំណួរឥតគិតថ្លៃរបស់អ្នក។ បង់ប្រាក់ ₹50 ដើម្បីបន្ត។';

  @override
  String get payNowButton => 'បង់ឥឡូវនេះ';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count សំណួរឥតគិតថ្លៃនៅសល់';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count សំណួរដែលបង់ប្រាក់នៅសល់';
  }

  @override
  String get thankYouFeedback => 'សូមអរគុណចំពោះមតិកែលម្អរបស់អ្នក!';

  @override
  String get ratingSubmitted => 'ការវាយតម្លៃត្រូវបានដាក់ជូន!';

  @override
  String get setUserIdFirst => 'សូមកំណត់ User ID របស់អ្នកជាមុនសិន';

  @override
  String get failedToFetchPrevious => 'បរាជ័យក្នុងការទាញយកសំណួរ និងចម្លើយពីមុន';

  @override
  String errorOccurred(Object error) {
    return 'កំហុស៖ $error';
  }

  @override
  String get drawerAstroProfile => 'ប្រវត្តិរូប Astro';

  @override
  String get drawerDailyHoroscope => 'ហោរាសាស្ត្រប្រចាំថ្ងៃ';

  @override
  String get drawerBuyQuestions => 'ទិញសំណួរ';

  @override
  String get drawerAstroDictionary => 'វចនានុក្រម Astro';

  @override
  String get drawerSettings => 'ការកំណត់';

  @override
  String get drawerCustomerSupport => 'ជំនួយអតិថិជន';

  @override
  String get drawerAbout => 'អំពី';

  @override
  String get drawerProfileSettings => 'ការកំណត់ប្រវត្តិរូប';

  @override
  String get demoNotificationTitle => '🔔 ការជូនដំណឹងសាកល្បង';

  @override
  String get demoNotificationBody =>
      'នេះគឺជាការជូនដំណឹងសាកល្បងពីកម្មវិធីរបស់អ្នក!';

  @override
  String get notificationsTitle => 'ការជូនដំណឹង';

  @override
  String get noNotifications => 'គ្មានការជូនដំណឹងទេ។';

  @override
  String get allTab => 'ទាំងអស់។';

  @override
  String get markAllAsRead => 'សម្គាល់ទាំងអស់ថាបានអានហើយ។';

  @override
  String get notificationMarkedRead => 'ការជូនដំណឹងត្រូវបានសម្គាល់ថាបានអានហើយ។';

  @override
  String get failedToLoadNotifications => 'បានបរាជ័យក្នុងការផ្ទុកការជូនដំណឹង';

  @override
  String get failedToMarkRead => 'បានបរាជ័យក្នុងការសម្គាល់ថាបានអានហើយ។';

  @override
  String get failedToMarkAllRead => 'បរាជ័យក្នុងការសម្គាល់ទាំងអស់ថាបានអានហើយ។';

  @override
  String get socketConnected => 'រន្ធភ្ជាប់';

  @override
  String get socketDisconnected => 'រន្ធត្រូវបានផ្តាច់';

  @override
  String get newNotificationReceived => 'បានទទួលការជូនដំណឹងថ្មី។';

  @override
  String get generalCategory => 'ទូទៅ';

  @override
  String get horoscopeCategory => 'ហោរាសាស្ត្រ';

  @override
  String get chatCategory => 'ជជែក';

  @override
  String get systemCategory => 'ប្រព័ន្ធ';

  @override
  String get updateCategory => 'បច្ចុប្បន្នភាព';

  @override
  String get howToAskTitle => 'របៀបសួរ';

  @override
  String get noQuestionsAvailable => 'មិនមានសំណួរទេ។';

  @override
  String get failedToLoadQuestions => 'បរាជ័យក្នុងការផ្ទុកសំណួរ';

  @override
  String get pullToRefresh => 'ទាញដើម្បីធ្វើឱ្យស្រស់';

  @override
  String get careerCategory => 'អាជីព';

  @override
  String get loveCategory => 'ស្នេហា និងទំនាក់ទំនង';

  @override
  String get healthCategory => 'សុខភាព';

  @override
  String get financeCategory => 'ហិរញ្ញវត្ថុ';

  @override
  String get familyCategory => 'គ្រួសារ';

  @override
  String get educationCategory => 'ការអប់រំ';

  @override
  String get travelCategory => 'ការធ្វើដំណើរ';

  @override
  String get spiritualCategory => 'ខាងវិញ្ញាណ';

  @override
  String get profileLoaded => 'កម្រងព័ត៌មានត្រូវបានផ្ទុកដោយជោគជ័យ';

  @override
  String get imageUploaded => 'បង្ហោះរូបភាពដោយជោគជ័យ';

  @override
  String get savedInformationConfirmation => 'ខ្ញុំបានរក្សាទុកព័ត៌មាននេះ។';

  @override
  String get noHistoryAvailable => 'មិនមានប្រវត្តិទេ។';

  @override
  String get missingUserIdError => 'លេខសម្គាល់អ្នកប្រើប្រាស់ត្រូវបានទាមទារ';

  @override
  String get networkError => 'កំហុសបណ្តាញ។ សូមព្យាយាមម្តងទៀត។';

  @override
  String get timeoutError => 'សំណើអស់ពេលហើយ។';

  @override
  String get genericError => 'មានអ្វីមួយខុសប្រក្រតី';

  @override
  String get reactionUpdateError => 'បរាជ័យក្នុងការធ្វើបច្ចុប្បន្នភាពប្រតិកម្ម';

  @override
  String get noSearchResults => 'រកមិនឃើញលទ្ធផលស្វែងរកទេ។';

  @override
  String get clearSearch => 'ជម្រះការស្វែងរក';

  @override
  String get resultsFound => 'លទ្ធផលបានរកឃើញ';

  @override
  String get recoverySecretHint =>
      'ការចម្លង-បិទភ្ជាប់ប្រហែលជាមិនដំណើរការទេ សូមវាយដោយដៃ';

  @override
  String get recoverAccountDescription =>
      'អនុវត្តតាមជំហានទាំងនេះដើម្បីសង្គ្រោះគណនីរបស់អ្នក។';

  @override
  String get processingLabel => 'កំពុងដំណើរការ...';

  @override
  String get clearChatSuccess => 'ការជជែកត្រូវបានសម្អាតដោយជោគជ័យ';

  @override
  String get notificationsEnabled => 'បានបើកការជូនដំណឹង';

  @override
  String get notificationsDisabled => 'ការជូនដំណឹងត្រូវបានបិទ';

  @override
  String get securityNotice =>
      'ទិន្នន័យរបស់អ្នកត្រូវបានអ៊ិនគ្រីប និងរក្សាទុកដោយសុវត្ថិភាព';

  @override
  String get loading => 'កំពុង​ផ្ទុក...';

  @override
  String get selectLanguage => 'ជ្រើសរើសភាសា';

  @override
  String get onboardingGetStartedDesc => 'ចាប់ផ្តើមដោយជ្រើសរើសភាសារបស់អ្នក។';

  @override
  String get accountRecoveryTitle => '🔐 ព័ត៌មានលម្អិតអំពីការស្ដារគណនី';

  @override
  String get recoveryInstructions =>
      'សូមរក្សាទុកព័ត៌មាននេះដោយសុវត្ថិភាព។ អ្នកនឹងត្រូវការវាដើម្បីសង្គ្រោះគណនីរបស់អ្នក។';

  @override
  String get importantNotice => '⚠️សំខាន់ៈ';

  @override
  String get astrologerProfileTitle => 'ប្រវត្តិរូបហោរា';

  @override
  String get personalAstrologer => 'ហោរាសាស្ត្រផ្ទាល់ខ្លួន';

  @override
  String get makePersonalAstrologer => 'ធ្វើហោរាសាស្ត្រផ្ទាល់ខ្លួន';

  @override
  String get favoriteDescription =>
      'សំណួររបស់អ្នកនឹងត្រូវបានផ្តល់អាទិភាពចំពោះហោរានេះ។ ប្រសិនបើមិនមានទេ ហោរាដែលមានលក្ខណៈសម្បត្តិគ្រប់គ្រាន់ផ្សេងទៀតនឹងជួយអ្នក។';

  @override
  String get educationQualifications => 'ការអប់រំ និងគុណវុឌ្ឍិ';

  @override
  String get aboutSection => 'អំពី';

  @override
  String get shareProfile => 'ចែករំលែកប្រវត្តិរូប';

  @override
  String get loadingAstrologer => 'កំពុង​ផ្ទុក​ព័ត៌មាន​លម្អិត​អំពី​ហោរា...';

  @override
  String get failedToLoadAstrologer =>
      'បរាជ័យក្នុងការផ្ទុកព័ត៌មានលម្អិតរបស់ហោរា';

  @override
  String get authenticationRequired => 'ទាមទារការផ្ទៀងផ្ទាត់។ សូមចូល។';

  @override
  String securityCheckFailed(Object error) {
    return 'ការត្រួតពិនិត្យសុវត្ថិភាពបានបរាជ័យ៖ $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ឥឡូវនេះគឺជាហោរាផ្ទាល់ខ្លួនរបស់អ្នក។';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ បានលុប $name ចេញពីចំណូលចិត្ត';
  }

  @override
  String get toggleFavoriteError =>
      'បរាជ័យក្នុងការធ្វើបច្ចុប្បន្នភាពស្ថានភាពដែលចូលចិត្ត';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ការអប់រំ៖ $education\n📜 គុណវុឌ្ឍិ៖ $qualification\n⏳ បទពិសោធន៍៖ $experience';
  }

  @override
  String get notProvided => 'មិនបានផ្តល់';

  @override
  String reviews(Object count) {
    return '($count ពិនិត្យ)';
  }

  @override
  String get specialties => 'ឯកទេស';

  @override
  String get experience => 'បទពិសោធន៍';

  @override
  String get qualification => 'គុណវុឌ្ឍិ';

  @override
  String get education => 'ការអប់រំ';

  @override
  String get recoveryTips =>
      '• ថតអេក្រង់នៃព័ត៌មាននេះ។\n• ទុកវានៅកន្លែងដែលមានសុវត្ថិភាព\n• កុំចែករំលែកជាមួយនរណាម្នាក់\n• វានឹងត្រូវបានបង្ហាញតែម្តងប៉ុណ្ណោះ។';

  @override
  String get themeSettingsTitle => 'ការកំណត់ប្រធានបទ';

  @override
  String get lightThemeLabel => 'ពន្លឺ';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'ងងឹត';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ប្រព័ន្ធ';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
