// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get notificationSettings => 'বিজ্ঞপ্তি সেটিংস';

  @override
  String get privacySettings => 'গোপনীয়তা সেটিংস';

  @override
  String get accountSettings => 'অ্যাকাউন্ট সেটিংস';

  @override
  String get languageSettings => 'ভাষা সেটিংস';

  @override
  String get languageChanged => 'ভাষা পরিবর্তন করা হয়েছে';

  @override
  String get existingUserButton => 'আমি একজন বিদ্যমান ব্যবহারকারী।';

  @override
  String get chooseCountryTitle => 'দেশ নির্বাচন করুন';

  @override
  String get yesText => 'হাঁ';

  @override
  String get noText => 'না';

  @override
  String get appBarTitle => 'প্রোফাইল সেটিংস';

  @override
  String get userIdLabel => 'ব্যবহারকারী আইডি *';

  @override
  String get nameLabel => 'নাম';

  @override
  String get birthCountryLabel => 'জন্মভূমি';

  @override
  String get birthCityLabel => 'জন্ম শহর';

  @override
  String get countrySelectionTitle => 'আপনার দেশ বেছে নিন';

  @override
  String get maleLabel => 'পুরুষ';

  @override
  String get femaleLabel => 'মহিলা';

  @override
  String get birthDateLabel => 'জন্ম তারিখ';

  @override
  String get birthDatePlaceholder => 'জন্ম তারিখ নির্বাচন করুন';

  @override
  String get birthTimeLabel => 'জন্ম সময়';

  @override
  String get birthTimePlaceholder => 'জন্ম সময় নির্বাচন করুন';

  @override
  String get saveProfileButton => 'প্রোফাইল সংরক্ষণ করুন';

  @override
  String get noCitiesFound => 'কোন শহর খুঁজে পাওয়া যায়নি';

  @override
  String cityPlaceholder(Object country) {
    return '$country এ শহর লিখুন';
  }

  @override
  String get countryFirstPlaceholder => 'প্রথমে দেশ নির্বাচন করুন';

  @override
  String get versionHistoryTitle => 'সংস্করণ ইতিহাস';

  @override
  String get notSetText => 'সেট করা নেই';

  @override
  String nameHistory(Object name) {
    return 'নাম: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'শহর: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'দেশ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'লিঙ্গ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'জন্ম তারিখ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'জন্ম সময়: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'অবস্থান: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'টাইমজোন: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ডিএসটি: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'অবস্থা: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date তারিখে আপডেট করা হয়েছে';
  }

  @override
  String get userIdRequired => 'ব্যবহারকারীর আইডি প্রয়োজন';

  @override
  String get profileSaved => 'প্রোফাইল সফলভাবে সংরক্ষিত হয়েছে';

  @override
  String get saveFailed => 'প্রোফাইল সংরক্ষণ করা যায়নি';

  @override
  String get errorPrefix => 'ত্রুটি:';

  @override
  String get onboardingChooseLanguage => 'আপনার ভাষা নির্বাচন করুন';

  @override
  String get onboardingChooseLanguageDesc =>
      'চালিয়ে যেতে আপনার পছন্দের ভাষা নির্বাচন করুন।';

  @override
  String get onboardingWhatIsAstrology => 'জ্যোতিষশাস্ত্র কী?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'জ্যোতিষশাস্ত্র হল মহাকাশীয় নক্ষত্রের অধ্যয়ন...';

  @override
  String get onboardingWhyUseApp => 'কেন এই অ্যাপটি ব্যবহার করবেন?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ব্যক্তিগতকৃত রাশিফল, প্রতিদিনের ভবিষ্যদ্বাণী এবং সুচিন্তিত সিদ্ধান্ত নেওয়ার জন্য নির্দেশনা পান।';

  @override
  String get onboardingHowToUse => 'এই অ্যাপটি কিভাবে ব্যবহার করবেন?';

  @override
  String get onboardingHowToUseDesc =>
      'সহজেই নেভিগেট করুন, দৈনিক রাশিফল পরীক্ষা করুন এবং সঠিক ভবিষ্যদ্বাণীর জন্য আপনার প্রোফাইল পরিচালনা করুন।';

  @override
  String get onboardingGetStarted => 'শুরু করুন';

  @override
  String get onboardingNewUser => 'নতুন ব্যবহারকারী';

  @override
  String get onboardingExistingUser => 'বিদ্যমান ব্যবহারকারী';

  @override
  String get onboardingBack => 'পিছনে';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get userIdNotFound =>
      'ব্যবহারকারীর আইডি খুঁজে পাওয়া যায়নি। অনুগ্রহ করে লগইন করুন অথবা আপনার প্রোফাইল সেট করুন।';

  @override
  String get clearNotificationsTitle => 'বিজ্ঞপ্তি সাফ করুন';

  @override
  String get clearNotificationsMessage =>
      'আপনি কি নিশ্চিত যে আপনি সমস্ত বিজ্ঞপ্তি মুছে ফেলতে চান?';

  @override
  String get clearNotificationsSuccess =>
      'সমস্ত বিজ্ঞপ্তি সফলভাবে সাফ করা হয়েছে।';

  @override
  String get clearHoroscopeTitle => 'পরিষ্কার রাশিফল';

  @override
  String get clearHoroscopeMessage =>
      'তুমি কি নিশ্চিত যে তুমি তোমার রাশিফলের তথ্য মুছে ফেলতে চাও?';

  @override
  String get clearHoroscopeSuccess => 'রাশিফল সফলভাবে পরিষ্কার করা হয়েছে।';

  @override
  String get clearChatTitle => 'চ্যাট ইতিহাস সাফ করুন';

  @override
  String get clearChatMessage =>
      'আপনি কি নিশ্চিত যে আপনি আপনার সমস্ত চ্যাট ইতিহাস মুছে ফেলতে চান?';

  @override
  String get clearChatLocal => 'স্থানীয়ভাবে চ্যাট সাফ করা হয়েছে।';

  @override
  String get deleteAccountTitle => 'অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountMessage =>
      'আপনি কি নিশ্চিত যে আপনি আপনার অ্যাকাউন্টটি মুছে ফেলতে চান? এটি আপনার সমস্ত চ্যাট ইতিহাস এবং বিজ্ঞপ্তিগুলিও মুছে ফেলবে।';

  @override
  String get deleteAccountSuccess =>
      'আপনার অ্যাকাউন্ট এবং সমস্ত ডেটা মুছে ফেলা হয়েছে।';

  @override
  String get deleteAccountError => 'অ্যাকাউন্ট মুছে ফেলার সময় ত্রুটি হয়েছে';

  @override
  String get logoutTitle => 'লগআউট';

  @override
  String get logoutMessage => 'আপনি কি নিশ্চিত যে আপনি লগআউট করতে চান?';

  @override
  String get termsPrivacyTitle => 'শর্তাবলী এবং গোপনীয়তা';

  @override
  String get privacyPolicyTitle => 'গোপনীয়তা নীতি';

  @override
  String get termsConditionsTitle => 'শর্তাবলী';

  @override
  String get dataControlTitle => 'ডেটা নিয়ন্ত্রণ';

  @override
  String get cancelButton => 'বাতিল করুন';

  @override
  String get confirmButton => 'নিশ্চিত করুন';

  @override
  String get clearQuestionsSuccess => 'সকল প্রশ্ন সফলভাবে মুছে ফেলা হয়েছে।';

  @override
  String get yoginiLabel => 'যোগিনী';

  @override
  String get lordLabel => 'প্রভু';

  @override
  String get startLabel => 'শুরু করুন';

  @override
  String get recoverAccount => 'অ্যাকাউন্ট পুনরুদ্ধার করুন';

  @override
  String get endLabel => 'শেষ';

  @override
  String get startDateLabel => 'শুরুর তারিখ';

  @override
  String get endDateLabel => 'শেষ তারিখ';

  @override
  String get notAvailable => 'পাওয়া যায় না';

  @override
  String get noData => 'কোন তথ্য নেই';

  @override
  String get unknownError => 'অজানা ত্রুটি';

  @override
  String get retryButton => 'পুনরায় চেষ্টা করুন';

  @override
  String get kundaliGeneratorTitle => 'কুণ্ডলী জেনারেটর';

  @override
  String get natalChartTitle => 'জন্ম তালিকা';

  @override
  String get lagnaLabel => 'লগ্না';

  @override
  String get rashiLabel => 'রাশি';

  @override
  String get ascDegreeLabel => 'আরোহী ডিগ্রি';

  @override
  String get vimshottariDashaTitle => 'বিমশোত্তরী দশা';

  @override
  String get yoginiDashaTitle => 'যোগিনী দশা';

  @override
  String get unknown => 'অজানা';

  @override
  String get clearHoroscope => 'পরিষ্কার রাশিফল';

  @override
  String get clearNotifications => 'বিজ্ঞপ্তি সাফ করুন';

  @override
  String get clearChatHistory => 'চ্যাট ইতিহাস সাফ করুন';

  @override
  String get logout => 'লগআউট';

  @override
  String get deleteAccount => 'অ্যাকাউন্ট মুছুন';

  @override
  String get allFieldsRequired => 'সকল ক্ষেত্র আবশ্যক।';

  @override
  String get accountRecoveredSuccess =>
      'অ্যাকাউন্ট সফলভাবে পুনরুদ্ধার করা হয়েছে।';

  @override
  String get recoveryFailed =>
      'পুনরুদ্ধার ব্যর্থ হয়েছে। আপনার তথ্য পরীক্ষা করুন।';

  @override
  String get recoverySecretLabel => 'পুনরুদ্ধারের গোপনীয়তা:';

  @override
  String get aboutUsTitle => 'আমাদের সম্পর্কে';

  @override
  String get aboutOurCompany => 'আমাদের কোম্পানি সম্পর্কে';

  @override
  String get aboutCompanyDescription =>
      'কর্মে, আমরা আপনাকে বৈদিক জ্যোতিষশাস্ত্রের চিরন্তন জ্ঞানের মাধ্যমে আপনার প্রকৃত জীবনের পথ উন্মোচন করতে সাহায্য করি। প্রতিটি অন্তর্দৃষ্টি বাস্তব, অভিজ্ঞ জ্যোতিষীদের কাছ থেকে আসে, যা আপনার অনন্য জন্ম তালিকার উপর ভিত্তি করে যত্ন সহকারে তৈরি করা হয়। দৈনিক রাশিফল থেকে শুরু করে ব্যক্তিগতকৃত নির্দেশনা পর্যন্ত, কর্ম প্রাচীন জ্ঞানকে ১০০ টিরও বেশি ভাষায় অ্যাক্সেসযোগ্য করে তোলে।';

  @override
  String get ourMission => 'আমাদের লক্ষ্য';

  @override
  String get missionDescription =>
      'আমাদের লক্ষ্য সহজ: খাঁটি, মানব-চালিত জ্যোতিষশাস্ত্রীয় নির্দেশনা প্রদান করা যা আপনাকে আত্মবিশ্বাসী, তথ্যবহুল সিদ্ধান্ত নিতে সক্ষম করে। প্রতিটি ভবিষ্যদ্বাণী এবং পরামর্শ স্বয়ংক্রিয় অ্যালগরিদম নয়, বছরের পর বছর ধরে পেশাদার দক্ষতার প্রতিফলন ঘটায়।';

  @override
  String get ourVision => 'আমাদের দৃষ্টিভঙ্গি';

  @override
  String get visionDescription =>
      'আমরা বৈদিক জ্যোতিষশাস্ত্রের জন্য বিশ্বের সবচেয়ে বিশ্বস্ত প্ল্যাটফর্ম হতে চেষ্টা করি, যা সর্বত্র মানুষকে নিজেদের, তাদের পছন্দ এবং তাদের জীবনযাত্রাকে স্পষ্টতা এবং আত্মবিশ্বাসের সাথে বুঝতে সাহায্য করে।';

  @override
  String get ourValues => 'আমাদের মূল্যবোধ';

  @override
  String get valuesDescription =>
      'কর্মে, আমরা সত্যতা, নির্ভুলতা এবং বিশ্বাসকে মূল্য দিই। আমরা এমন নির্দেশনা প্রদানের জন্য প্রতিশ্রুতিবদ্ধ যা কেবল সঠিকই নয়, অর্থপূর্ণও, যা আপনাকে অন্তর্দৃষ্টি এবং আত্মবিশ্বাসের সাথে জীবন পরিচালনা করতে সহায়তা করবে।';

  @override
  String get contactUs => 'আমাদের সাথে যোগাযোগ করুন';

  @override
  String get contactEmail => 'ইমেইল: support@yourcompany.com';

  @override
  String get contactWebsite => 'ওয়েবসাইট: www.yourcompany.com';

  @override
  String get customerSupport => 'গ্রাহক সহায়তা';

  @override
  String get supportHeroTitle => 'আমরা সাহায্য করতে এখানে আছি';

  @override
  String get supportHeroDescription =>
      'নিচের ফর্মটি পূরণ করুন এবং আমাদের সহায়তা দল যত তাড়াতাড়ি সম্ভব আপনার সাথে যোগাযোগ করবে।';

  @override
  String get yourName => 'তোমার নাম';

  @override
  String get yourEmail => 'তোমার ইমেইল';

  @override
  String get message => 'বার্তা';

  @override
  String get enterEmail => 'আপনার ইমেল লিখুন';

  @override
  String get enterValidEmail => 'একটি বৈধ ইমেল ঠিকানা লিখুন';

  @override
  String enterField(Object fieldName) {
    return '$fieldName লিখুন';
  }

  @override
  String get send => 'পাঠান';

  @override
  String get sending => 'পাঠানো হচ্ছে...';

  @override
  String get emailSentSuccess => '✅ ইমেল সফলভাবে পাঠানো হয়েছে!';

  @override
  String get emailSendFailed => '❌ ইমেল পাঠাতে ব্যর্থ';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary সম্পর্কে';

  @override
  String get searchTermsHint => 'অনুসন্ধান পদ...';

  @override
  String get noTermsFound => 'কোন পদ পাওয়া যায়নি';

  @override
  String get buyQuestionsTitle => 'প্রশ্ন কিনুন';

  @override
  String get userNotAuthenticated => 'ব্যবহারকারী প্রমাণিত হয়নি';

  @override
  String get loadStoreDataFailed => 'স্টোর ডেটা লোড করতে ব্যর্থ হয়েছে';

  @override
  String get missingAuthToken => 'প্রমাণীকরণ টোকেন অনুপস্থিত';

  @override
  String get merchantDisplayName => 'অ্যাস্ট্রো চ্যাট অ্যাপ';

  @override
  String get paymentSuccessful => '✅ পেমেন্ট সফল! প্রশ্ন পাঠানো হয়েছে';

  @override
  String paymentFailed(Object error) {
    return '❌ পেমেন্ট ব্যর্থ হয়েছে: $error';
  }

  @override
  String get yourBalance => 'আপনার ব্যালেন্স';

  @override
  String questionsBalance(Object count) {
    return '$count প্রশ্ন';
  }

  @override
  String get availableOffers => 'উপলব্ধ অফার';

  @override
  String questionsCount(Object count) {
    return '$count প্রশ্ন';
  }

  @override
  String get buyButton => 'কেনা';

  @override
  String get dailyHoroscopeTitle => '🌟 দৈনিক রাশিফল';

  @override
  String get userIdMissing => 'ব্যবহারকারী আইডি অনুপস্থিত।';

  @override
  String get fetchHoroscopesFailed => 'রাশিফল আনতে ব্যর্থ হয়েছে';

  @override
  String get noHoroscopeFound => 'কোন রাশিফল পাওয়া যায়নি।';

  @override
  String get signLabel => 'চিহ্ন';

  @override
  String get todayLabel => 'আজ';

  @override
  String get yesterdayLabel => 'গতকাল';

  @override
  String get thisWeekLabel => 'এই সপ্তাহে';

  @override
  String get lastMonthLabel => 'গত মাস';

  @override
  String get chatTitle => 'চ্যাট';

  @override
  String get typeYourQuestionHint => 'আপনার প্রশ্নটি টাইপ করুন...';

  @override
  String get paymentRequired => 'পেমেন্ট প্রয়োজন';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'তুমি তোমার বিনামূল্যের প্রশ্নগুলো ব্যবহার করেছ। চালিয়ে যেতে $amount পেমেন্ট করো।';
  }

  @override
  String get payNowButton => 'এখনই পেমেন্ট করুন';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count বিনামূল্যে প্রশ্ন বাকি আছে';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count বাকি পেমেন্ট করা প্রশ্ন';
  }

  @override
  String get thankYouFeedback => 'আপনার প্রতিক্রিয়ার জন্য ধন্যবাদ!';

  @override
  String get ratingSubmitted => 'রেটিং জমা দেওয়া হয়েছে!';

  @override
  String get setUserIdFirst => 'প্রথমে আপনার ব্যবহারকারী আইডি সেট করুন।';

  @override
  String get failedToFetchPrevious =>
      'পূর্ববর্তী প্রশ্ন এবং উত্তরগুলি আনা যায়নি';

  @override
  String errorOccurred(Object error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get drawerAstroProfile => 'অ্যাস্ট্রো প্রোফাইল';

  @override
  String get drawerDailyHoroscope => 'দৈনিক রাশিফল';

  @override
  String get drawerBuyQuestions => 'প্রশ্ন কিনুন';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary সম্পর্কে';

  @override
  String get drawerSettings => 'সেটিংস';

  @override
  String get drawerCustomerSupport => 'গ্রাহক সহায়তা';

  @override
  String get drawerAbout => 'সম্পর্কে';

  @override
  String get drawerProfileSettings => 'প্রোফাইল সেটিংস';

  @override
  String get demoNotificationTitle => '🔔 ডেমো বিজ্ঞপ্তি';

  @override
  String get demoNotificationBody =>
      'এটি আপনার অ্যাপ থেকে একটি পরীক্ষামূলক বিজ্ঞপ্তি!';

  @override
  String get notificationsTitle => 'বিজ্ঞপ্তি';

  @override
  String get noNotifications => 'কোনও বিজ্ঞপ্তি নেই';

  @override
  String get allTab => 'সব';

  @override
  String get markAllAsRead => 'সব পড়া হয়েছে হিসেবে চিহ্নিত করুন';

  @override
  String get notificationMarkedRead =>
      'বিজ্ঞপ্তিটি পঠিত হিসেবে চিহ্নিত করা হয়েছে';

  @override
  String get failedToLoadNotifications => 'বিজ্ঞপ্তি লোড করা যায়নি';

  @override
  String get failedToMarkRead => 'পঠিত হিসেবে চিহ্নিত করা যায়নি';

  @override
  String get failedToMarkAllRead => 'সবগুলো পড়া হয়েছে হিসেবে চিহ্নিত করা যায়নি';

  @override
  String get socketConnected => 'সকেট সংযুক্ত';

  @override
  String get socketDisconnected => 'সকেট সংযোগ বিচ্ছিন্ন হয়েছে';

  @override
  String get newNotificationReceived => 'নতুন বিজ্ঞপ্তি পাওয়া গেছে';

  @override
  String get generalCategory => 'সাধারণ';

  @override
  String get horoscopeCategory => 'রাশিফল';

  @override
  String get chatCategory => 'চ্যাট';

  @override
  String get systemCategory => 'সিস্টেম';

  @override
  String get updateCategory => 'আপডেট';

  @override
  String get howToAskTitle => 'কিভাবে জিজ্ঞাসা করবেন';

  @override
  String get noQuestionsAvailable => 'কোনও প্রশ্ন নেই';

  @override
  String get failedToLoadQuestions => 'প্রশ্ন লোড করা যায়নি';

  @override
  String get pullToRefresh => 'রিফ্রেশ করতে টানুন';

  @override
  String get careerCategory => 'কেরিয়ার';

  @override
  String get loveCategory => 'প্রেম ও সম্পর্ক';

  @override
  String get healthCategory => 'স্বাস্থ্য';

  @override
  String get financeCategory => 'অর্থনীতি';

  @override
  String get familyCategory => 'পরিবার';

  @override
  String get educationCategory => 'শিক্ষা';

  @override
  String get travelCategory => 'ভ্রমণ';

  @override
  String get spiritualCategory => 'আধ্যাত্মিক';

  @override
  String get profileLoaded => 'প্রোফাইল সফলভাবে লোড হয়েছে';

  @override
  String get imageUploaded => 'ছবি আপলোড করা হয়েছে';

  @override
  String get savedInformationConfirmation => 'আমি এই তথ্যটি সংরক্ষণ করেছি।';

  @override
  String get noHistoryAvailable => 'কোনও ইতিহাস উপলব্ধ নেই';

  @override
  String get missingUserIdError => 'ব্যবহারকারীর আইডি প্রয়োজন';

  @override
  String get networkError => 'নেটওয়ার্ক ত্রুটি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get timeoutError => 'অনুরোধের সময় শেষ হয়ে গেছে';

  @override
  String get genericError => 'কিছু সমস্যা হয়েছে।';

  @override
  String get reactionUpdateError => 'প্রতিক্রিয়া আপডেট করা যায়নি';

  @override
  String get noSearchResults => 'কোন অনুসন্ধান ফলাফল পাওয়া যায়নি।';

  @override
  String get clearSearch => 'অনুসন্ধান সাফ করুন';

  @override
  String get resultsFound => 'ফলাফল পাওয়া গেছে';

  @override
  String get recoverySecretHint =>
      'কপি-পেস্ট কাজ নাও করতে পারে, ম্যানুয়ালি টাইপ করুন।';

  @override
  String get recoverAccountDescription =>
      'আপনার অ্যাকাউন্ট পুনরুদ্ধার করতে এই পদক্ষেপগুলি অনুসরণ করুন';

  @override
  String get processingLabel => 'প্রক্রিয়াজাতকরণ...';

  @override
  String get clearChatSuccess => 'চ্যাট সফলভাবে সাফ করা হয়েছে';

  @override
  String get notificationsEnabled => 'বিজ্ঞপ্তিগুলি সক্ষম করা হয়েছে';

  @override
  String get notificationsDisabled => 'বিজ্ঞপ্তিগুলি অক্ষম করা হয়েছে';

  @override
  String get securityNotice =>
      'আপনার ডেটা নিরাপদে এনক্রিপ্ট করা এবং সংরক্ষণ করা হয়েছে';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get selectLanguage => 'ভাষা নির্বাচন কর';

  @override
  String get onboardingGetStartedDesc => 'আপনার ভাষা বেছে নিয়ে শুরু করুন';

  @override
  String get accountRecoveryTitle => '🔐 অ্যাকাউন্ট পুনরুদ্ধারের বিবরণ';

  @override
  String get recoveryInstructions =>
      'দয়া করে এই তথ্যটি নিরাপদে সংরক্ষণ করুন। আপনার অ্যাকাউন্ট পুনরুদ্ধার করতে এটির প্রয়োজন হবে।';

  @override
  String get importantNotice => '⚠️ গুরুত্বপূর্ণ:';

  @override
  String get astrologerProfileTitle => 'জ্যোতিষীর প্রোফাইল';

  @override
  String get personalAstrologer => 'ব্যক্তিগত জ্যোতিষী';

  @override
  String get makePersonalAstrologer => 'ব্যক্তিগত জ্যোতিষী তৈরি করুন';

  @override
  String get favoriteDescription =>
      'আপনার প্রশ্নগুলি এই জ্যোতিষীর কাছে অগ্রাধিকার দেওয়া হবে। যদি অনুপলব্ধ হন, তাহলে অন্য একজন যোগ্য জ্যোতিষী আপনাকে সাহায্য করবেন।';

  @override
  String get educationQualifications => 'শিক্ষা ও যোগ্যতা';

  @override
  String get aboutSection => 'সম্পর্কে';

  @override
  String get shareProfile => 'প্রোফাইল শেয়ার করুন';

  @override
  String get loadingAstrologer => 'জ্যোতিষীর বিবরণ লোড হচ্ছে...';

  @override
  String get failedToLoadAstrologer => 'জ্যোতিষীর বিবরণ লোড করা যায়নি';

  @override
  String get authenticationRequired =>
      'প্রমাণীকরণ প্রয়োজন। অনুগ্রহ করে লগ ইন করুন।';

  @override
  String securityCheckFailed(Object error) {
    return 'নিরাপত্তা পরীক্ষা ব্যর্থ হয়েছে: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name এখন আপনার ব্যক্তিগত জ্যোতিষী';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ পছন্দের তালিকা থেকে $name সরানো হয়েছে';
  }

  @override
  String get toggleFavoriteError => 'প্রিয় স্ট্যাটাস আপডেট করা যায়নি';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 শিক্ষা: $education\n📜 যোগ্যতা: $qualification\n⏳ অভিজ্ঞতা: $experience';
  }

  @override
  String get notProvided => 'প্রদান করা হয়নি';

  @override
  String reviews(Object count) {
    return '($count পর্যালোচনা)';
  }

  @override
  String get specialties => 'বিশেষত্ব';

  @override
  String get experience => 'অভিজ্ঞতা';

  @override
  String get qualification => 'যোগ্যতা';

  @override
  String get education => 'শিক্ষা';

  @override
  String get recoveryTips =>
      '• এই তথ্যের একটি স্ক্রিনশট নিন\n• এটি একটি নিরাপদ স্থানে সংরক্ষণ করুন\n• কারো সাথে শেয়ার করবেন না\n• এটি শুধুমাত্র একবার দেখানো হবে';

  @override
  String get themeSettingsTitle => 'থিম সেটিংস';

  @override
  String get lightThemeLabel => 'আলো';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'অন্ধকার';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'সিস্টেম';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'আমাদের টিম';

  @override
  String get teamDescription =>
      'আমাদের পেশাদার বৈদিক জ্যোতিষীদের দল গ্রহের প্রভাব এবং জীবনধারা ব্যাখ্যা করার ক্ষেত্রে বছরের পর বছর অভিজ্ঞতা অর্জন করে। একটি নিবেদিতপ্রাণ সহায়তা এবং উন্নয়ন দলের সহায়তায়, কর্মা প্রতিটি ব্যবহারকারীর জন্য একটি নিরবচ্ছিন্ন, নির্ভরযোগ্য এবং বিশ্বব্যাপী অভিজ্ঞতা প্রদান করে।';
}
