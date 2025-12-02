// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get settingsTitle => 'ဆက်တင်များ';

  @override
  String get notificationSettings => 'အကြောင်းကြားချက် ဆက်တင်များ';

  @override
  String get privacySettings => 'ကိုယ်ရေးကိုယ်တာ ဆက်တင်များ';

  @override
  String get accountSettings => 'အကောင့်ဆက်တင်များ';

  @override
  String get languageSettings => 'ဘာသာစကား ဆက်တင်များ';

  @override
  String get languageChanged => 'ဘာသာစကား ပြောင်းသွားတယ်။';

  @override
  String get existingUserButton => 'ကျွန်ုပ်သည် လက်ရှိအသုံးပြုသူဖြစ်သည်။';

  @override
  String get chooseCountryTitle => 'နိုင်ငံကို ရွေးပါ။';

  @override
  String get yesText => 'ဟုတ်ကဲ့';

  @override
  String get noText => 'မရှိ';

  @override
  String get appBarTitle => 'ပရိုဖိုင် ဆက်တင်များ';

  @override
  String get userIdLabel => 'သုံးစွဲသူအိုင်ဒီ *';

  @override
  String get nameLabel => 'နာမည်';

  @override
  String get birthCountryLabel => 'မွေးရပ်မြေ';

  @override
  String get birthCityLabel => 'မွေးရပ်မြို့';

  @override
  String get countrySelectionTitle => 'သင်၏နိုင်ငံကိုရွေးချယ်ပါ။';

  @override
  String get maleLabel => 'အထီး';

  @override
  String get femaleLabel => 'အပျို';

  @override
  String get birthDateLabel => 'မွေးနေ့';

  @override
  String get birthDatePlaceholder => 'မွေးရက်ကို ရွေးပါ။';

  @override
  String get birthTimeLabel => 'မွေးချိန်';

  @override
  String get birthTimePlaceholder => 'မွေးဖွားချိန်ကို ရွေးပါ။';

  @override
  String get saveProfileButton => 'Profile ကို သိမ်းဆည်းပါ။';

  @override
  String get noCitiesFound => 'မြို့များကိုမတွေ့ပါ။';

  @override
  String cityPlaceholder(Object country) {
    return '$country တွင် မြို့ကိုထည့်ပါ။';
  }

  @override
  String get countryFirstPlaceholder => 'နိုင်ငံကို အရင်ရွေးပါ။';

  @override
  String get versionHistoryTitle => 'ဗားရှင်းမှတ်တမ်း';

  @override
  String get notSetText => 'မသတ်မှတ်ထားဘူး။';

  @override
  String nameHistory(Object name) {
    return 'အမည်- $name';
  }

  @override
  String cityHistory(Object city) {
    return 'မြို့- $city';
  }

  @override
  String countryHistory(Object country) {
    return 'နိုင်ငံ- $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'လိင်- $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'မွေးရက်- $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'မွေးချိန်- $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'တည်နေရာ- $latitude၊ $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'အချိန်ဇုန်- GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST- $value';
  }

  @override
  String stateHistory(Object state) {
    return 'အခြေအနေ- $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date တွင် အပ်ဒိတ်လုပ်ထားသည်။';
  }

  @override
  String get userIdRequired => 'အသုံးပြုသူ ID လိုအပ်ပါသည်။';

  @override
  String get profileSaved => 'ပရိုဖိုင်ကို အောင်မြင်စွာ သိမ်းဆည်းပြီးပါပြီ။';

  @override
  String get saveFailed => 'ပရိုဖိုင်ကို သိမ်းဆည်းရန် မအောင်မြင်ပါ။';

  @override
  String get errorPrefix => 'အမှား-';

  @override
  String get onboardingChooseLanguage => 'သင်၏ဘာသာစကားကိုရွေးချယ်ပါ။';

  @override
  String get onboardingChooseLanguageDesc =>
      'ရှေ့ဆက်ရန် သင်နှစ်သက်သော ဘာသာစကားကို ရွေးချယ်ပါ။';

  @override
  String get onboardingWhatIsAstrology => 'ဗေဒင်ဆိုတာဘာလဲ။';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'နက္ခတ်ဗေဒင်သည် ကောင်းကင်ဘုံကို လေ့လာခြင်းဖြစ်သည်...';

  @override
  String get onboardingWhyUseApp => 'ဘာကြောင့် ဒီအက်ပ်ကို သုံးတာလဲ။';

  @override
  String get onboardingWhyUseAppDesc =>
      'အသိဥာဏ်ရှိသော ဆုံးဖြတ်ချက်များချရန်အတွက် စိတ်ကြိုက်ဇာတာများ၊ နေ့စဥ်ခန့်မှန်းချက်များနှင့် လမ်းညွှန်မှုများကို ရယူပါ။';

  @override
  String get onboardingHowToUse => 'ဒီအက်ပ်ကို ဘယ်လိုသုံးမလဲ။';

  @override
  String get onboardingHowToUseDesc =>
      'အလွယ်တကူ သွားလာပါ၊ နေ့စဉ် ဇာတာများကို စစ်ဆေးပြီး တိကျသော ခန့်မှန်းချက်များ အတွက် သင့်ပရိုဖိုင်ကို စီမံပါ။';

  @override
  String get onboardingGetStarted => 'စတင်လိုက်ပါ။';

  @override
  String get onboardingNewUser => 'အသုံးပြုသူအသစ်';

  @override
  String get onboardingExistingUser => 'လက်ရှိအသုံးပြုသူ';

  @override
  String get onboardingBack => 'ကျော';

  @override
  String get onboardingNext => 'နောက်တစ်ခု';

  @override
  String get userIdNotFound =>
      'အသုံးပြုသူ ID မတွေ့ပါ။ ကျေးဇူးပြု၍ ဝင်ရောက်ပါ သို့မဟုတ် သင့်ပရိုဖိုင်ကို သတ်မှတ်ပါ။';

  @override
  String get clearNotificationsTitle => 'အကြောင်းကြားချက်များကို ရှင်းလင်းပါ။';

  @override
  String get clearNotificationsMessage =>
      'အကြောင်းကြားချက်များအားလုံးကို ရှင်းလင်းလိုသည်မှာ သေချာပါသလား။';

  @override
  String get clearNotificationsSuccess =>
      'အကြောင်းကြားချက်အားလုံးကို အောင်မြင်စွာ ရှင်းလင်းပြီးပါပြီ။';

  @override
  String get clearHoroscopeTitle => 'Horoscope ရှင်းပါ။';

  @override
  String get clearHoroscopeMessage =>
      'သင့်ဇာတာအချက်အလက်ကို ရှင်းလင်းလိုသည်မှာ သေချာပါသလား။';

  @override
  String get clearHoroscopeSuccess =>
      'ဇာတာရှင်သည် ရှင်းရှင်းလင်းလင်း အောင်မြင်ခဲ့သည်။';

  @override
  String get clearChatTitle => 'ချတ်မှတ်တမ်းကို ရှင်းလင်းပါ။';

  @override
  String get clearChatMessage =>
      'သင့်ချတ်မှတ်တမ်းအားလုံးကို ဖျက်လိုသည်မှာ သေချာပါသလား။';

  @override
  String get clearChatLocal => 'ဒေသအလိုက် ချတ်ကို ရှင်းလင်းထားသည်။';

  @override
  String get deleteAccountTitle => 'အကောင့်ဖျက်ပါ။';

  @override
  String get deleteAccountMessage =>
      'သင့်အကောင့်ကို ဖျက်လိုသည်မှာ သေချာပါသလား။ ၎င်းသည် သင့်ချတ်မှတ်တမ်းနှင့် အကြောင်းကြားချက်များအားလုံးကိုလည်း ရှင်းလင်းပါမည်။';

  @override
  String get deleteAccountSuccess =>
      'သင့်အကောင့်နှင့် ဒေတာအားလုံးကို ဖယ်ရှားလိုက်ပါပြီ။';

  @override
  String get deleteAccountError => 'အကောင့်ဖျက်ရာတွင် အမှားအယွင်းရှိနေသည်။';

  @override
  String get logoutTitle => 'ထွက်လိုက်ပါ။';

  @override
  String get logoutMessage => 'ထွက်လိုသည်မှာ သေချာပါသလား။';

  @override
  String get termsPrivacyTitle => 'စည်းမျဥ်းစည်းကမ်းများနှင့် ကိုယ်ရေးကိုယ်တာ';

  @override
  String get privacyPolicyTitle => 'ကိုယ်ရေးအချက်အလက်မူဝါဒ';

  @override
  String get termsConditionsTitle => 'စည်းကမ်းသတ်မှတ်ချက်များ';

  @override
  String get dataControlTitle => 'ဒေတာထိန်းချုပ်ရေး';

  @override
  String get cancelButton => 'မလုပ်တော့';

  @override
  String get confirmButton => 'အတည်ပြုပါ။';

  @override
  String get clearQuestionsSuccess =>
      'မေးခွန်းအားလုံးကို အောင်မြင်စွာ ဖျက်လိုက်ပါပြီ။';

  @override
  String get yoginiLabel => 'ယောဂီ';

  @override
  String get lordLabel => 'သခင်';

  @override
  String get startLabel => 'စတင်ပါ။';

  @override
  String get recoverAccount => 'အကောင့်ပြန်လည်ရယူပါ။';

  @override
  String get endLabel => 'အဆုံး';

  @override
  String get startDateLabel => 'စတင်သည့်ရက်စွဲ';

  @override
  String get endDateLabel => 'ကုန်ဆုံးရက်စွဲ';

  @override
  String get notAvailable => 'မရရှိနိုင်ပါ';

  @override
  String get noData => 'ဒေတာမရှိပါ။';

  @override
  String get unknownError => 'အမည်မသိ အမှား';

  @override
  String get retryButton => 'ပြန်ကြိုးစားပါ။';

  @override
  String get kundaliGeneratorTitle => 'Kundali မီးစက်';

  @override
  String get natalChartTitle => 'Natal Chart';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'ရာရှီ';

  @override
  String get ascDegreeLabel => 'Ascendant ဘွဲ့';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'မသိ';

  @override
  String get clearHoroscope => 'Horoscope ရှင်းပါ။';

  @override
  String get clearNotifications => 'အကြောင်းကြားချက်များကို ရှင်းလင်းပါ။';

  @override
  String get clearChatHistory => 'ချတ်မှတ်တမ်းကို ရှင်းလင်းပါ။';

  @override
  String get logout => 'ထွက်လိုက်ပါ။';

  @override
  String get deleteAccount => 'အကောင့်ဖျက်ပါ။';

  @override
  String get allFieldsRequired => 'အကွက်အားလုံး လိုအပ်သည်။';

  @override
  String get accountRecoveredSuccess =>
      'အကောင့်ကို အောင်မြင်စွာ ပြန်လည်ရယူနိုင်ပါပြီ။';

  @override
  String get recoveryFailed =>
      'ပြန်လည်ရယူခြင်း မအောင်မြင်ပါ။ သင်၏အချက်အလက်များကိုစစ်ဆေးပါ။';

  @override
  String get recoverySecretLabel => 'ပြန်လည်ရယူခြင်းလျှို့ဝှက်ချက်-';

  @override
  String get aboutUsTitle => 'ကြှနျုပျတို့အကွောငျး';

  @override
  String get aboutOurCompany => 'ကျွန်ုပ်တို့၏ကုမ္ပဏီအကြောင်း';

  @override
  String get aboutCompanyDescription =>
      'ကျွန်ုပ်တို့၏အသုံးပြုသူများအတွက် အကောင်းဆုံး နက္ခတ်ဗေဒင်အတွေ့အကြုံကို ပေးအပ်ရန် ကျွန်ုပ်တို့ကတိပြုပါသည်။';

  @override
  String get ourMission => 'ကျွန်ုပ်တို့၏သာသနာ';

  @override
  String get missionDescription =>
      'သုံးစွဲသူများသည် ၎င်းတို့၏ဘဝတွင် အသိဉာဏ်ဖြင့် ဆုံးဖြတ်ချက်များချရာတွင် ကူညီပေးရန်အတွက် တိကျပြီး စိတ်ကြိုက်နက္ခတ်ဗေဒင် ထိုးထွင်းသိမြင်မှုများကို ပေးဆောင်ရန်။';

  @override
  String get ourVision => 'ကျွန်ုပ်တို့၏အမြင်';

  @override
  String get visionDescription =>
      'အယုံကြည်ရဆုံး နက္ခတ်ဗေဒင် ပလက်ဖောင်း ဖြစ်လာစေရန်၊ နည်းပညာနှင့် ရှေးပညာများကို ပေါင်းစပ်ထားသည်။';

  @override
  String get ourValues => 'ကျွန်ုပ်တို့၏တန်ဖိုးများ';

  @override
  String get valuesDescription =>
      'သမာဓိ၊ တိကျမှု၊ သုံးစွဲသူဗဟိုပြု ဒီဇိုင်းနှင့် စဉ်ဆက်မပြတ် ဆန်းသစ်တီထွင်မှု။';

  @override
  String get contactUs => 'ကြှနျုပျတို့ကိုဆကျသှယျရနျ';

  @override
  String get contactEmail => 'အီးမေးလ်- support@yourcompany.com';

  @override
  String get contactWebsite => 'ဝဘ်ဆိုဒ်- www.yourcompany.com';

  @override
  String get customerSupport => 'ဖောက်သည်ပံ့ပိုးမှု';

  @override
  String get supportHeroTitle => 'ကူညီရန် ကျွန်ုပ်တို့ ဤနေရာတွင် ရှိနေပါသည်။';

  @override
  String get supportHeroDescription =>
      'အောက်ပါဖောင်ကိုဖြည့်ပြီး ကျွန်ုပ်တို့၏ ပံ့ပိုးကူညီရေးအဖွဲ့သည် သင့်ထံ အမြန်ဆုံးပြန်လည်ရောက်ရှိပါမည်။';

  @override
  String get yourName => 'သင့်နာမည်';

  @override
  String get yourEmail => 'သင့်အီးမေးလ်';

  @override
  String get message => 'မက်ဆေ့ချ်';

  @override
  String get enterEmail => 'သင့်အီးမေးလ်ကို ထည့်ပါ။';

  @override
  String get enterValidEmail => 'တရားဝင်အီးမေးလ်လိပ်စာကို ထည့်ပါ။';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ထည့်ပါ။';
  }

  @override
  String get send => 'ပို့ပါ။';

  @override
  String get sending => 'ပို့နေသည်...';

  @override
  String get emailSentSuccess => '✅ Email အောင်မြင်စွာ ပို့ပြီးပါပြီ။';

  @override
  String get emailSendFailed => '❌ အီးမေးလ်ပို့၍မရပါ။';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'ရှာဖွေမှု ဝေါဟာရများ...';

  @override
  String get noTermsFound => 'ဝေါဟာရ ရှာမတွေ့ပါ။';

  @override
  String get buyQuestionsTitle => 'မေးခွန်းများဝယ်ယူပါ။';

  @override
  String get userNotAuthenticated =>
      'အသုံးပြုသူကို စစ်မှန်ကြောင်း အထောက်အထား မပြပါ။';

  @override
  String get loadStoreDataFailed => 'သိမ်းဆည်းဒေတာကို တင်၍မရပါ။';

  @override
  String get missingAuthToken => 'အထောက်အထား သင်္ကေတ ပျောက်နေပါသည်။';

  @override
  String get merchantDisplayName => 'Astro Chat အက်ပ်';

  @override
  String get paymentSuccessful =>
      '✅ ငွေပေးချေမှု အောင်မြင်ပါသည်။ မေးခွန်းပို့လိုက်ပါပြီ။';

  @override
  String paymentFailed(Object error) {
    return '❌ ငွေပေးချေမှု မအောင်မြင်ပါ- $error';
  }

  @override
  String get yourBalance => 'သင်၏လက်ကျန်ငွေ';

  @override
  String questionsBalance(Object count) {
    return '$count မေးခွန်းများ';
  }

  @override
  String get availableOffers => 'ရနိုင်သောကမ်းလှမ်းချက်များ';

  @override
  String questionsCount(Object count) {
    return '$count မေးခွန်း';
  }

  @override
  String get buyButton => 'ဝယ်ပါ။';

  @override
  String get dailyHoroscopeTitle => '🌟 နေ့စဉ် Horoscope';

  @override
  String get userIdMissing => 'အသုံးပြုသူ ID ပျောက်ဆုံးနေပါသည်။';

  @override
  String get fetchHoroscopesFailed => 'ဇာတာများ မအောင်မြင်ပါ။';

  @override
  String get noHoroscopeFound => 'ဇာတာမတွေ့။';

  @override
  String get signLabel => 'ဆိုင်းဘုတ်';

  @override
  String get todayLabel => 'ဒီနေ့';

  @override
  String get yesterdayLabel => 'မနေ့က';

  @override
  String get thisWeekLabel => 'ဒီတစ်ပတ်';

  @override
  String get lastMonthLabel => 'ပြီးခဲ့သည့်လ';

  @override
  String get chatTitle => 'စကားစမြည်';

  @override
  String get typeYourQuestionHint => 'သင့်မေးခွန်းကို ရိုက်ထည့်ပါ...';

  @override
  String get paymentRequired => 'ငွေပေးချေမှု လိုအပ်ပါသည်။';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'သင့်အခမဲ့မေးခွန်းများကို သင်အသုံးပြုပြီးပါပြီ။ ရှေ့ဆက်ရန် ₹50 ပေးချေပါ။';
  }

  @override
  String get payNowButton => 'ယခုငွေပေးချေပါ။';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count အခမဲ့မေးခွန်းများ ကျန်ရှိပါသည်။';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count အခပေးမေးခွန်းများ ကျန်ရှိပါသည်။';
  }

  @override
  String get thankYouFeedback => 'သင့်အကြံပြုချက်အတွက် ကျေးဇူးတင်ပါသည်။';

  @override
  String get ratingSubmitted => 'အဆင့်သတ်မှတ်ခြင်းကို တင်သွင်းခဲ့သည်။';

  @override
  String get setUserIdFirst => 'သင်၏ User ID ကို ဦးစွာ သတ်မှတ်ပါ။';

  @override
  String get failedToFetchPrevious =>
      'ယခင်မေးခွန်းများနှင့် အဖြေများကို ရယူ၍မရပါ။';

  @override
  String errorOccurred(Object error) {
    return 'အမှား- $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'နေ့စဉ် Horoscope';

  @override
  String get drawerBuyQuestions => 'မေးခွန်းများဝယ်ယူပါ။';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'ဆက်တင်များ';

  @override
  String get drawerCustomerSupport => 'ဖောက်သည်ပံ့ပိုးမှု';

  @override
  String get drawerAbout => 'အကြောင်း';

  @override
  String get drawerProfileSettings => 'ပရိုဖိုင် ဆက်တင်များ';

  @override
  String get demoNotificationTitle => '🔔 သရုပ်ပြ အသိပေးချက်';

  @override
  String get demoNotificationBody =>
      '၎င်းသည် သင့်အက်ပ်မှ စမ်းသပ်မှုသတိပေးချက်ဖြစ်သည်။';

  @override
  String get notificationsTitle => 'အသိပေးချက်များ';

  @override
  String get noNotifications => 'အကြောင်းကြားချက်များမရှိပါ။';

  @override
  String get allTab => 'အားလုံး';

  @override
  String get markAllAsRead => 'အားလုံးကို ဖတ်ပြီးကြောင်း အမှတ်အသားပြုပါ။';

  @override
  String get notificationMarkedRead =>
      'အကြောင်းကြားချက်ကို ဖတ်ပြီးကြောင်း အမှတ်အသားပြုထားသည်။';

  @override
  String get failedToLoadNotifications =>
      'အကြောင်းကြားချက်များကို တင်ရန် မအောင်မြင်ပါ။';

  @override
  String get failedToMarkRead => 'ဖတ်ပြီးကြောင်း အမှတ်အသားလုပ်၍ မရပါ။';

  @override
  String get failedToMarkAllRead =>
      'အားလုံးကို ဖတ်ပြီးကြောင်း အမှတ်အသားလုပ်၍ မရပါ။';

  @override
  String get socketConnected => 'Socket ချိတ်ဆက်ထားသည်။';

  @override
  String get socketDisconnected => 'ပလပ်ပေါက်ကို ဖြုတ်ထားသည်။';

  @override
  String get newNotificationReceived =>
      'အကြောင်းကြားချက်အသစ်ကို လက်ခံရရှိခဲ့သည်။';

  @override
  String get generalCategory => 'အထွေထွေ';

  @override
  String get horoscopeCategory => 'ဇာတာရှင်';

  @override
  String get chatCategory => 'စကားစမြည်';

  @override
  String get systemCategory => 'စနစ်';

  @override
  String get updateCategory => 'အပ်ဒိတ်များ';

  @override
  String get howToAskTitle => 'မေးနည်း';

  @override
  String get noQuestionsAvailable => 'မေးခွန်းများ မရရှိနိုင်ပါ။';

  @override
  String get failedToLoadQuestions => 'မေးခွန်းများကို တင်၍မရပါ။';

  @override
  String get pullToRefresh => 'ပြန်လည်ဆန်းသစ်ရန် ဆွဲပါ။';

  @override
  String get careerCategory => 'အသက်မွေးဝမ်းကြောင်း';

  @override
  String get loveCategory => 'အချစ်နှင့်ဆက်ဆံရေး';

  @override
  String get healthCategory => 'ကျန်းမာရေး';

  @override
  String get financeCategory => 'ဘဏ္ဍာရေး';

  @override
  String get familyCategory => 'မိသားစု';

  @override
  String get educationCategory => 'ပညာရေး';

  @override
  String get travelCategory => 'ခရီးသွား';

  @override
  String get spiritualCategory => 'ဝိညာဏ';

  @override
  String get profileLoaded => 'ပရိုဖိုင်ကို အောင်မြင်စွာ တင်ပြီးပါပြီ။';

  @override
  String get imageUploaded => 'ပုံကို အောင်မြင်စွာ အပ်လုဒ်လုပ်ပါ။';

  @override
  String get savedInformationConfirmation =>
      'ဒီအချက်အလက်ကို ကျွန်တော် သိမ်းဆည်းပြီးပါပြီ။';

  @override
  String get noHistoryAvailable => 'မှတ်တမ်းမရရှိနိုင်ပါ။';

  @override
  String get missingUserIdError => 'အသုံးပြုသူ ID လိုအပ်ပါသည်။';

  @override
  String get networkError => 'ကွန်ရက် အမှားအယွင်း ထပ်စမ်းကြည့်ပါ။';

  @override
  String get timeoutError => 'တောင်းဆိုမှု အချိန်ကုန်သွားသည်။';

  @override
  String get genericError => 'တစ်ခုခုမှားသွားသည်။';

  @override
  String get reactionUpdateError => 'တုံ့ပြန်မှုကို အပ်ဒိတ်လုပ်၍မရပါ။';

  @override
  String get noSearchResults => 'ရှာဖွေမှုရလဒ်များ မတွေ့ပါ။';

  @override
  String get clearSearch => 'ရှာဖွေမှုကို ရှင်းလင်းပါ။';

  @override
  String get resultsFound => 'ရလဒ်များ တွေ့ရှိခဲ့သည်။';

  @override
  String get recoverySecretHint =>
      'ကော်ပီကူးထည့်ခြင်း အလုပ်မဖြစ်နိုင်ပါ၊ ကိုယ်တိုင်ရိုက်ထည့်ပါ။';

  @override
  String get recoverAccountDescription =>
      'သင့်အကောင့်ကို ပြန်လည်ရယူရန် ဤအဆင့်များကို လိုက်နာပါ။';

  @override
  String get processingLabel => 'လုပ်ဆောင်နေသည်...';

  @override
  String get clearChatSuccess => 'ချတ်ကို အောင်မြင်စွာ ရှင်းလင်းခဲ့သည်။';

  @override
  String get notificationsEnabled => 'အကြောင်းကြားချက်များကို ဖွင့်ထားသည်။';

  @override
  String get notificationsDisabled => 'အကြောင်းကြားချက်များကို ပိတ်ထားသည်။';

  @override
  String get securityNotice =>
      'သင့်ဒေတာကို လုံခြုံစွာ ကုဒ်ဝှက်ပြီး သိမ်းဆည်းထားသည်။';

  @override
  String get loading => 'ဖွင့်နေသည်...';

  @override
  String get selectLanguage => 'ဘာသာစကားကို ရွေးပါ။';

  @override
  String get onboardingGetStartedDesc =>
      'သင့်ဘာသာစကားကို ရွေးချယ်ခြင်းဖြင့် စတင်လိုက်ပါ။';

  @override
  String get accountRecoveryTitle => '🔐 အကောင့်ပြန်လည်ရယူခြင်းအသေးစိတ်';

  @override
  String get recoveryInstructions =>
      'ဤအချက်အလက်ကို လုံခြုံစွာသိမ်းဆည်းပါ။ သင့်အကောင့်ကို ပြန်လည်ရယူရန် ၎င်းကို လိုအပ်မည်ဖြစ်သည်။';

  @override
  String get importantNotice => '⚠️ အရေးကြီးသည်-';

  @override
  String get astrologerProfileTitle => 'ဗေဒင်ဆရာကိုယ်ရေးအကျဉ်း';

  @override
  String get personalAstrologer => 'ကိုယ်ပိုင်ဗေဒင်ဆရာ';

  @override
  String get makePersonalAstrologer => 'ကိုယ်ပိုင်ဗေဒင်ဆရာလုပ်ပါ။';

  @override
  String get favoriteDescription =>
      'သင်၏မေးခွန်းများကို ဤဗေဒင်ဆရာအတွက် ဦးစားပေးပါမည်။ မရရှိနိုင်ပါက အခြားသော အရည်အချင်းပြည့်မီသော နက္ခတ်ဗေဒင်ဆရာက သင့်ကို ကူညီပေးပါမည်။';

  @override
  String get educationQualifications => 'ပညာရေးနှင့် အရည်အချင်းများ';

  @override
  String get aboutSection => 'အကြောင်း';

  @override
  String get shareProfile => 'Profile ကို မျှဝေပါ။';

  @override
  String get loadingAstrologer => 'ဗေဒင်ဆရာ အသေးစိတ်ကို တင်ပေးနေသည်...';

  @override
  String get failedToLoadAstrologer => 'ဗေဒင်ဆရာအသေးစိတ်ကို တင်၍မရပါ။';

  @override
  String get authenticationRequired =>
      'စစ်မှန်ကြောင်းအထောက်အထားလိုအပ်သည်။ ကျေးဇူးပြု၍ ဝင်ရောက်ပါ။';

  @override
  String securityCheckFailed(Object error) {
    return 'လုံခြုံရေးစစ်ဆေးမှု မအောင်မြင်ပါ- $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name သည် ယခုအခါ သင့်ကိုယ်ပိုင်ဗေဒင်ဆရာဖြစ်သည်။';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ စိတ်ကြိုက်များမှ $name ကို ဖယ်ရှားခဲ့သည်။';
  }

  @override
  String get toggleFavoriteError => 'အကြိုက်ဆုံး အခြေအနေကို အပ်ဒိတ်လုပ်၍မရပါ။';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ပညာရေး- $education\n📜 အရည်အချင်း- $qualification\n⏳ အတွေ့အကြုံ- $experience';
  }

  @override
  String get notProvided => 'မပေးထားပါ။';

  @override
  String reviews(Object count) {
    return '($count သုံးသပ်ချက်)';
  }

  @override
  String get specialties => 'အထူးပြု';

  @override
  String get experience => 'အတွေ့အကြုံ';

  @override
  String get qualification => 'အရည်အချင်း';

  @override
  String get education => 'ပညာရေး';

  @override
  String get recoveryTips =>
      '• ဤအချက်အလက်ကို ဖန်သားပြင်ဓာတ်ပုံရိုက်ပါ။\n• လုံခြုံသောနေရာတွင် သိမ်းဆည်းပါ။\n• မည်သူနှင့်မျှ မမျှဝေပါနှင့်\n• ၎င်းကို တစ်ကြိမ်သာ ပြသပါမည်။';

  @override
  String get themeSettingsTitle => 'အပြင်အဆင် ဆက်တင်များ';

  @override
  String get lightThemeLabel => 'အလင်း';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'အမှောင်';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'စနစ်';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
