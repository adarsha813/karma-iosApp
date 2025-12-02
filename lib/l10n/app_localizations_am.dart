// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get settingsTitle => 'ቅንብሮች';

  @override
  String get notificationSettings => 'የማሳወቂያ ቅንብሮች';

  @override
  String get privacySettings => 'የግላዊነት ቅንብሮች';

  @override
  String get accountSettings => 'የመለያ ቅንብሮች';

  @override
  String get languageSettings => 'የቋንቋ ቅንብሮች';

  @override
  String get languageChanged => 'ቋንቋ ተለውጧል';

  @override
  String get existingUserButton => 'እኔ ነባር ተጠቃሚ ነኝ';

  @override
  String get chooseCountryTitle => 'አገር ይምረጡ';

  @override
  String get yesText => 'አዎ';

  @override
  String get noText => 'አይ';

  @override
  String get appBarTitle => 'የመገለጫ ቅንብሮች';

  @override
  String get userIdLabel => 'የተጠቃሚ መታወቂያ *';

  @override
  String get nameLabel => 'ስም';

  @override
  String get birthCountryLabel => 'የትውልድ ሀገር';

  @override
  String get birthCityLabel => 'የትውልድ ከተማ';

  @override
  String get countrySelectionTitle => 'አገርህን ምረጥ';

  @override
  String get maleLabel => 'ወንድ';

  @override
  String get femaleLabel => 'ሴት';

  @override
  String get birthDateLabel => 'የልደት ቀን';

  @override
  String get birthDatePlaceholder => 'የልደት ቀን ይምረጡ';

  @override
  String get birthTimeLabel => 'የልደት ጊዜ';

  @override
  String get birthTimePlaceholder => 'የልደት ጊዜን ይምረጡ';

  @override
  String get saveProfileButton => 'መገለጫ አስቀምጥ';

  @override
  String get noCitiesFound => 'ምንም ከተሞች አልተገኙም።';

  @override
  String cityPlaceholder(Object country) {
    return 'በ$country ውስጥ ከተማ አስገባ';
  }

  @override
  String get countryFirstPlaceholder => 'መጀመሪያ አገር ይምረጡ';

  @override
  String get versionHistoryTitle => 'የስሪት ታሪክ';

  @override
  String get notSetText => 'አልተዘጋጀም።';

  @override
  String nameHistory(Object name) {
    return 'ስም፡ $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ከተማ፡ $city';
  }

  @override
  String countryHistory(Object country) {
    return 'አገር፡ $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ጾታ፡ $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'የትውልድ ቀን፡ $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'የትውልድ ጊዜ፡ $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'አካባቢ፡ $latitude፣ $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'የሰዓት ሰቅ፡ GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST፡ $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ግዛት፡ $state';
  }

  @override
  String versionFromText(Object date) {
    return 'በ$date ተዘምኗል';
  }

  @override
  String get userIdRequired => 'የተጠቃሚ መታወቂያ ያስፈልጋል';

  @override
  String get profileSaved => 'መገለጫ በተሳካ ሁኔታ ተቀምጧል';

  @override
  String get saveFailed => 'መገለጫን ማስቀመጥ አልተሳካም።';

  @override
  String get errorPrefix => 'ስህተት፡-';

  @override
  String get onboardingChooseLanguage => 'ቋንቋዎን ይምረጡ';

  @override
  String get onboardingChooseLanguageDesc => 'ለመቀጠል የመረጡትን ቋንቋ ይምረጡ።';

  @override
  String get onboardingWhatIsAstrology => 'ኮከብ ቆጠራ ምንድን ነው?';

  @override
  String get onboardingWhatIsAstrologyDesc => 'አስትሮሎጂ የሰለስቲያል አካላት ጥናት ነው...';

  @override
  String get onboardingWhyUseApp => 'ለምን ይህን መተግበሪያ ይጠቀሙ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'በመረጃ ላይ የተመሰረተ ውሳኔ ለማድረግ ለግል የተበጁ ሆሮስኮፖችን፣ ዕለታዊ ትንበያዎችን እና መመሪያን ያግኙ።';

  @override
  String get onboardingHowToUse => 'ይህን መተግበሪያ እንዴት መጠቀም ይቻላል?';

  @override
  String get onboardingHowToUseDesc =>
      'በቀላሉ ያስሱ፣ ዕለታዊ የኮከብ ቆጠራዎችን ይፈትሹ እና ለትክክለኛ ትንበያዎች መገለጫዎን ያስተዳድሩ።';

  @override
  String get onboardingGetStarted => 'እንጀምር';

  @override
  String get onboardingNewUser => 'አዲስ ተጠቃሚ';

  @override
  String get onboardingExistingUser => 'ነባር ተጠቃሚ';

  @override
  String get onboardingBack => 'ተመለስ';

  @override
  String get onboardingNext => 'ቀጥሎ';

  @override
  String get userIdNotFound => 'የተጠቃሚ መታወቂያ አልተገኘም። እባክዎ ይግቡ ወይም መገለጫዎን ያዘጋጁ።';

  @override
  String get clearNotificationsTitle => 'ማሳወቂያዎችን ያጽዱ';

  @override
  String get clearNotificationsMessage => 'እርግጠኛ ነዎት ሁሉንም ማሳወቂያዎች ማጽዳት ይፈልጋሉ?';

  @override
  String get clearNotificationsSuccess => 'ሁሉም ማሳወቂያዎች በተሳካ ሁኔታ ጸድተዋል።';

  @override
  String get clearHoroscopeTitle => 'ሆሮስኮፕን አጽዳ';

  @override
  String get clearHoroscopeMessage => 'እርግጠኛ ነዎት የኮከብ ቆጠራ ውሂብዎን ማጽዳት ይፈልጋሉ?';

  @override
  String get clearHoroscopeSuccess => 'ሆሮስኮፕ በተሳካ ሁኔታ ጸድቷል።';

  @override
  String get clearChatTitle => 'የውይይት ታሪክ አጽዳ';

  @override
  String get clearChatMessage => 'እርግጠኛ ነህ ሁሉንም የውይይት ታሪክህን መሰረዝ ትፈልጋለህ?';

  @override
  String get clearChatLocal => 'ውይይት በአካባቢው ጸድቷል።';

  @override
  String get deleteAccountTitle => 'መለያ ሰርዝ';

  @override
  String get deleteAccountMessage =>
      'እርግጠኛ ነህ መለያህን መሰረዝ ትፈልጋለህ? ይህ ሁሉንም የውይይት ታሪክዎን እና ማሳወቂያዎችን ያጸዳል።';

  @override
  String get deleteAccountSuccess => 'የእርስዎ መለያ እና ሁሉም ውሂብ ተወግደዋል።';

  @override
  String get deleteAccountError => 'መለያን መሰረዝ ላይ ስህተት';

  @override
  String get logoutTitle => 'ውጣ';

  @override
  String get logoutMessage => 'እርግጠኛ ነህ መውጣት ትፈልጋለህ?';

  @override
  String get termsPrivacyTitle => 'ውሎች እና ግላዊነት';

  @override
  String get privacyPolicyTitle => 'የግላዊነት ፖሊሲ';

  @override
  String get termsConditionsTitle => 'ውሎች እና ሁኔታዎች';

  @override
  String get dataControlTitle => 'የውሂብ ቁጥጥር';

  @override
  String get cancelButton => 'ሰርዝ';

  @override
  String get confirmButton => 'አረጋግጥ';

  @override
  String get clearQuestionsSuccess => 'ሁሉም ጥያቄዎች በተሳካ ሁኔታ ተሰርዘዋል።';

  @override
  String get yoginiLabel => 'ዮጊኒ';

  @override
  String get lordLabel => 'ጌታ';

  @override
  String get startLabel => 'ጀምር';

  @override
  String get recoverAccount => 'መለያ መልሰው ያግኙ';

  @override
  String get endLabel => 'መጨረሻ';

  @override
  String get startDateLabel => 'የመጀመሪያ ቀን';

  @override
  String get endDateLabel => 'የመጨረሻ ቀን';

  @override
  String get notAvailable => 'አይገኝም';

  @override
  String get noData => 'ምንም ውሂብ የለም';

  @override
  String get unknownError => 'ያልታወቀ ስህተት';

  @override
  String get retryButton => 'እንደገና ይሞክሩ';

  @override
  String get kundaliGeneratorTitle => 'Kundali ጄኔሬተር';

  @override
  String get natalChartTitle => 'ናታል ገበታ';

  @override
  String get lagnaLabel => 'ላግና';

  @override
  String get rashiLabel => 'ራሺ';

  @override
  String get ascDegreeLabel => 'አስከሬን ዲግሪ';

  @override
  String get vimshottariDashaTitle => 'ቪምሾታሪ ዳሻ';

  @override
  String get yoginiDashaTitle => 'ዮጊኒ ዳሻ';

  @override
  String get unknown => 'ያልታወቀ';

  @override
  String get clearHoroscope => 'ሆሮስኮፕን አጽዳ';

  @override
  String get clearNotifications => 'ማሳወቂያዎችን ያጽዱ';

  @override
  String get clearChatHistory => 'የውይይት ታሪክ አጽዳ';

  @override
  String get logout => 'ውጣ';

  @override
  String get deleteAccount => 'መለያ ሰርዝ';

  @override
  String get allFieldsRequired => 'ሁሉም መስኮች ያስፈልጋሉ።';

  @override
  String get accountRecoveredSuccess => 'መለያ በተሳካ ሁኔታ ተመልሷል።';

  @override
  String get recoveryFailed => 'መልሶ ማግኘት አልተሳካም። መረጃዎን ያረጋግጡ።';

  @override
  String get recoverySecretLabel => 'የመልሶ ማግኛ ሚስጥር';

  @override
  String get aboutUsTitle => 'ስለ እኛ';

  @override
  String get aboutOurCompany => 'ስለ ኩባንያችን';

  @override
  String get aboutCompanyDescription =>
      'ምርጡን የኮከብ ቆጠራ ልምድ ለተጠቃሚዎቻችን ለማድረስ ቁርጠኞች ነን።';

  @override
  String get ourMission => 'የእኛ ተልዕኮ';

  @override
  String get missionDescription =>
      'ተጠቃሚዎች በሕይወታቸው ውስጥ በመረጃ ላይ የተመሰረተ ውሳኔ እንዲያደርጉ ለማገዝ ትክክለኛ እና ግላዊ የኮከብ ቆጠራ ግንዛቤዎችን ለማቅረብ።';

  @override
  String get ourVision => 'የእኛ እይታ';

  @override
  String get visionDescription =>
      'ቴክኖሎጂን እና ጥንታዊ ጥበብን በማጣመር በጣም የታመነ የኮከብ ቆጠራ መድረክ ለመሆን።';

  @override
  String get ourValues => 'የእኛ እሴቶች';

  @override
  String get valuesDescription =>
      'ታማኝነት፣ ትክክለኛነት፣ በተጠቃሚ ያማከለ ንድፍ እና ቀጣይነት ያለው ፈጠራ።';

  @override
  String get contactUs => 'ያግኙን';

  @override
  String get contactEmail => 'ኢሜል፡ support@yourcompany.com';

  @override
  String get contactWebsite => 'ድር ጣቢያ: www.yourcompany.com';

  @override
  String get customerSupport => 'የደንበኛ ድጋፍ';

  @override
  String get supportHeroTitle => 'እኛ ለመርዳት እዚህ ነን';

  @override
  String get supportHeroDescription =>
      'ከዚህ በታች ያለውን ቅጽ ይሙሉ እና የድጋፍ ቡድናችን በተቻለ ፍጥነት ወደ እርስዎ ይመለሳል።';

  @override
  String get yourName => 'የእርስዎ ስም';

  @override
  String get yourEmail => 'የእርስዎ ኢሜይል';

  @override
  String get message => 'መልእክት';

  @override
  String get enterEmail => 'ኢሜልዎን ያስገቡ';

  @override
  String get enterValidEmail => 'የሚሰራ የኢሜይል አድራሻ አስገባ';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ያስገቡ';
  }

  @override
  String get send => 'ላክ';

  @override
  String get sending => 'በመላክ ላይ...';

  @override
  String get emailSentSuccess => '✅ ኢሜል በተሳካ ሁኔታ ተልኳል!';

  @override
  String get emailSendFailed => '❌ ኢሜል መላክ አልተሳካም።';

  @override
  String get astroDictionaryTitle => 'አስትሮ መዝገበ ቃላት';

  @override
  String get searchTermsHint => 'የፍለጋ ቃላት...';

  @override
  String get noTermsFound => 'ምንም ውሎች አልተገኙም።';

  @override
  String get buyQuestionsTitle => 'ጥያቄዎችን ይግዙ';

  @override
  String get userNotAuthenticated => 'ተጠቃሚው አልተረጋገጠም።';

  @override
  String get loadStoreDataFailed => 'የማከማቻ ውሂብን መጫን አልተሳካም።';

  @override
  String get missingAuthToken => 'የጠፋ ማረጋገጫ ማስመሰያ';

  @override
  String get merchantDisplayName => 'የአስትሮ ውይይት መተግበሪያ';

  @override
  String get paymentSuccessful => '✅ ክፍያ ተሳክቷል! ጥያቄ ተልኳል።';

  @override
  String paymentFailed(Object error) {
    return '❌ ክፍያ አልተሳካም፦ $error';
  }

  @override
  String get yourBalance => 'የእርስዎ ሚዛን';

  @override
  String questionsBalance(Object count) {
    return '$count ጥያቄዎች';
  }

  @override
  String get availableOffers => 'የሚገኙ ቅናሾች';

  @override
  String questionsCount(Object count) {
    return '$count ጥያቄ';
  }

  @override
  String get buyButton => 'ይግዙ';

  @override
  String get dailyHoroscopeTitle => '🌟 ዕለታዊ ሆሮስኮፕ';

  @override
  String get userIdMissing => 'የተጠቃሚ መታወቂያ ይጎድላል';

  @override
  String get fetchHoroscopesFailed => 'ሆሮስኮፖችን ማምጣት አልተሳካም።';

  @override
  String get noHoroscopeFound => 'ምንም የኮከብ ቆጠራ አልተገኘም።';

  @override
  String get signLabel => 'ይፈርሙ';

  @override
  String get todayLabel => 'ዛሬ';

  @override
  String get yesterdayLabel => 'ትናንት';

  @override
  String get thisWeekLabel => 'በዚህ ሳምንት';

  @override
  String get lastMonthLabel => 'ባለፈው ወር';

  @override
  String get chatTitle => 'ተወያይ';

  @override
  String get typeYourQuestionHint => 'ጥያቄህን ተይብ...';

  @override
  String get paymentRequired => 'ክፍያ ያስፈልጋል';

  @override
  String get paymentRequiredMessage => 'ነፃ ጥያቄዎችዎን ተጠቅመዋል። ለመቀጠል 50 ብር ይክፈሉ።';

  @override
  String get payNowButton => 'አሁን ይክፈሉ።';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ነጻ ጥያቄዎች ይቀራሉ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count የሚከፈልባቸው ጥያቄዎች ይቀራሉ';
  }

  @override
  String get thankYouFeedback => 'ለአስተያየትዎ እናመሰግናለን!';

  @override
  String get ratingSubmitted => 'ደረጃ ገብቷል!';

  @override
  String get setUserIdFirst => 'እባክዎ መጀመሪያ የተጠቃሚ መታወቂያዎን ያዘጋጁ';

  @override
  String get failedToFetchPrevious => 'ቀዳሚ ጥያቄዎችን እና መልሶችን ማምጣት አልተሳካም።';

  @override
  String errorOccurred(Object error) {
    return 'ስህተት፡ $error';
  }

  @override
  String get drawerAstroProfile => 'የአስትሮ መገለጫ';

  @override
  String get drawerDailyHoroscope => 'ዕለታዊ ሆሮስኮፕ';

  @override
  String get drawerBuyQuestions => 'ጥያቄዎችን ይግዙ';

  @override
  String get drawerAstroDictionary => 'አስትሮ መዝገበ ቃላት';

  @override
  String get drawerSettings => 'ቅንብሮች';

  @override
  String get drawerCustomerSupport => 'የደንበኛ ድጋፍ';

  @override
  String get drawerAbout => 'ስለ';

  @override
  String get drawerProfileSettings => 'የመገለጫ ቅንብሮች';

  @override
  String get demoNotificationTitle => '🔔 የማሳያ ማስታወቂያ';

  @override
  String get demoNotificationBody => 'ይህ ከእርስዎ መተግበሪያ የመጣ የሙከራ ማሳወቂያ ነው!';

  @override
  String get notificationsTitle => 'ማሳወቂያዎች';

  @override
  String get noNotifications => 'ምንም ማሳወቂያዎች የሉም';

  @override
  String get allTab => 'ሁሉም';

  @override
  String get markAllAsRead => 'ሁሉንም እንደተነበቡ ምልክት ያድርጉበት';

  @override
  String get notificationMarkedRead => 'ማስታወቂያ እንደተነበበ ምልክት ተደርጎበታል።';

  @override
  String get failedToLoadNotifications => 'ማሳወቂያዎችን መጫን አልተሳካም።';

  @override
  String get failedToMarkRead => 'እንደተነበበ ምልክት ማድረግ አልተሳካም።';

  @override
  String get failedToMarkAllRead => 'ሁሉንም እንደተነበቡ ምልክት ማድረግ አልተሳካም።';

  @override
  String get socketConnected => 'ሶኬት ተገናኝቷል።';

  @override
  String get socketDisconnected => 'ሶኬት ተቋርጧል';

  @override
  String get newNotificationReceived => 'አዲስ ማሳወቂያ ደርሷል';

  @override
  String get generalCategory => 'አጠቃላይ';

  @override
  String get horoscopeCategory => 'ሆሮስኮፕ';

  @override
  String get chatCategory => 'ተወያይ';

  @override
  String get systemCategory => 'ስርዓት';

  @override
  String get updateCategory => 'ዝማኔዎች';

  @override
  String get howToAskTitle => 'እንዴት መጠየቅ እንደሚቻል';

  @override
  String get noQuestionsAvailable => 'ምንም ጥያቄዎች የሉም';

  @override
  String get failedToLoadQuestions => 'ጥያቄዎችን መጫን አልተሳካም።';

  @override
  String get pullToRefresh => 'ለማደስ ይጎትቱ';

  @override
  String get careerCategory => 'ሙያ';

  @override
  String get loveCategory => 'ፍቅር እና ግንኙነቶች';

  @override
  String get healthCategory => 'ጤና';

  @override
  String get financeCategory => 'ፋይናንስ';

  @override
  String get familyCategory => 'ቤተሰብ';

  @override
  String get educationCategory => 'ትምህርት';

  @override
  String get travelCategory => 'ጉዞ';

  @override
  String get spiritualCategory => 'መንፈሳዊ';

  @override
  String get profileLoaded => 'መገለጫ በተሳካ ሁኔታ ተጭኗል';

  @override
  String get imageUploaded => 'ምስል በተሳካ ሁኔታ ተሰቅሏል።';

  @override
  String get savedInformationConfirmation => 'ይህን መረጃ አስቀምጫለሁ።';

  @override
  String get noHistoryAvailable => 'ምንም ታሪክ አይገኝም';

  @override
  String get missingUserIdError => 'የተጠቃሚ መታወቂያ ያስፈልጋል';

  @override
  String get networkError => 'የአውታረ መረብ ስህተት። እባክዎ እንደገና ይሞክሩ።';

  @override
  String get timeoutError => 'ጥያቄ ጊዜው አልፏል';

  @override
  String get genericError => 'የሆነ ችግር ተፈጥሯል።';

  @override
  String get reactionUpdateError => 'ምላሽን ማዘመን አልተሳካም።';

  @override
  String get noSearchResults => 'ምንም የፍለጋ ውጤቶች አልተገኙም።';

  @override
  String get clearSearch => 'ፍለጋን አጽዳ';

  @override
  String get resultsFound => 'ውጤቶች ተገኝተዋል';

  @override
  String get recoverySecretHint => 'ኮፒ ለጥፍ ላይሰራ ይችላል፣ በእጅ ይተይቡ';

  @override
  String get recoverAccountDescription => 'መለያዎን መልሰው ለማግኘት እነዚህን ደረጃዎች ይከተሉ';

  @override
  String get processingLabel => 'በማሰናዳት ላይ...';

  @override
  String get clearChatSuccess => 'ውይይት በተሳካ ሁኔታ ጸድቷል።';

  @override
  String get notificationsEnabled => 'ማሳወቂያዎች ነቅተዋል።';

  @override
  String get notificationsDisabled => 'ማሳወቂያዎች ተሰናክለዋል።';

  @override
  String get securityNotice => 'የእርስዎ ውሂብ ደህንነቱ በተጠበቀ ሁኔታ የተመሰጠረ እና የተከማቸ ነው።';

  @override
  String get loading => 'በመጫን ላይ...';

  @override
  String get selectLanguage => 'ቋንቋ ይምረጡ';

  @override
  String get onboardingGetStartedDesc => 'ቋንቋዎን በመምረጥ ይጀምሩ';

  @override
  String get accountRecoveryTitle => '🔐 የመለያ መልሶ ማግኛ ዝርዝሮች';

  @override
  String get recoveryInstructions =>
      'እባክዎ ይህንን መረጃ ደህንነቱ በተጠበቀ ሁኔታ ያስቀምጡ። መለያዎን መልሰው ለማግኘት ያስፈልግዎታል።';

  @override
  String get importantNotice => '⚠️ ጠቃሚ፡-';

  @override
  String get astrologerProfileTitle => 'ኮከብ ቆጣሪዎች መገለጫ';

  @override
  String get personalAstrologer => 'የግል ኮከብ ቆጣሪ';

  @override
  String get makePersonalAstrologer => 'የግል ኮከብ ቆጣሪ ያድርጉ';

  @override
  String get favoriteDescription =>
      'ለዚህ ኮከብ ቆጣሪ ጥያቄዎቻችሁ ቅድሚያ ይሰጣሉ። የማይገኝ ከሆነ ሌላ ብቃት ያለው ኮከብ ቆጣሪ ይረዳሃል።';

  @override
  String get educationQualifications => 'ትምህርት እና ብቃቶች';

  @override
  String get aboutSection => 'ስለ';

  @override
  String get shareProfile => 'መገለጫ አጋራ';

  @override
  String get loadingAstrologer => 'የኮከብ ቆጣሪ ዝርዝሮችን በመጫን ላይ...';

  @override
  String get failedToLoadAstrologer => 'የኮከብ ቆጣሪ ዝርዝሮችን መጫን አልተሳካም።';

  @override
  String get authenticationRequired => 'ማረጋገጥ ያስፈልጋል። እባክዎ ይግቡ።';

  @override
  String securityCheckFailed(Object error) {
    return 'የደህንነት ፍተሻ አልተሳካም፦ $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name አሁን የእርስዎ የግል ኮከብ ቆጣሪ ነው።';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name ከተወዳጆች ተወግዷል';
  }

  @override
  String get toggleFavoriteError => 'ተወዳጅ ሁኔታን ማዘመን አልተሳካም።';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ትምህርት፡ $education\n📜 ብቃት፡ $qualification\n⏳ ልምድ፡ $experience';
  }

  @override
  String get notProvided => 'አልተሰጠም።';

  @override
  String reviews(Object count) {
    return '($count ግምገማዎች)';
  }

  @override
  String get specialties => 'ስፔሻሊስቶች';

  @override
  String get experience => 'ልምድ';

  @override
  String get qualification => 'ብቃት';

  @override
  String get education => 'ትምህርት';

  @override
  String get recoveryTips =>
      '• የዚህን መረጃ ቅጽበታዊ ገጽ እይታ ያንሱ\n• ደህንነቱ በተጠበቀ ቦታ ያስቀምጡት።\n• ለማንም አያካፍሉ።\n• ይህ አንድ ጊዜ ብቻ ነው የሚታየው';

  @override
  String get themeSettingsTitle => 'የገጽታ ቅንብሮች';

  @override
  String get lightThemeLabel => 'ብርሃን';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'ጨለማ';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ስርዓት';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
