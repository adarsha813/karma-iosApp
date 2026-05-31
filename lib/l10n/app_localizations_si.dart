// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get settingsTitle => 'සැකසුම්';

  @override
  String get notificationSettings => 'දැනුම්දීම් සැකසුම්';

  @override
  String get privacySettings => 'රහස්‍යතා සැකසුම්';

  @override
  String get accountSettings => 'ගිණුම් සැකසුම්';

  @override
  String get languageSettings => 'භාෂා සැකසුම්';

  @override
  String get languageChanged => 'භාෂාව වෙනස් විය';

  @override
  String get existingUserButton => 'මම දැනට සිටින පරිශීලකයෙක්.';

  @override
  String get chooseCountryTitle => 'රට තෝරන්න';

  @override
  String get yesText => 'ඔව්';

  @override
  String get noText => 'නැත';

  @override
  String get appBarTitle => 'පැතිකඩ සැකසුම්';

  @override
  String get userIdLabel => 'පරිශීලක ID *';

  @override
  String get nameLabel => 'නම';

  @override
  String get birthCountryLabel => 'උපන් රට';

  @override
  String get birthCityLabel => 'උපන් නගරය';

  @override
  String get countrySelectionTitle => 'ඔබේ රට තෝරන්න';

  @override
  String get maleLabel => 'පිරිමි';

  @override
  String get femaleLabel => 'ගැහැණු';

  @override
  String get birthDateLabel => 'උපන් දිනය';

  @override
  String get birthDatePlaceholder => 'උපන් දිනය තෝරන්න';

  @override
  String get birthTimeLabel => 'උපන් වේලාව';

  @override
  String get birthTimePlaceholder => 'උපන් වේලාව තෝරන්න';

  @override
  String get saveProfileButton => 'පැතිකඩ සුරකින්න';

  @override
  String get noCitiesFound => 'නගර කිසිවක් හමු නොවීය';

  @override
  String cityPlaceholder(Object country) {
    return '$country හි නගරය ඇතුළත් කරන්න';
  }

  @override
  String get countryFirstPlaceholder => 'පළමුව රට තෝරන්න';

  @override
  String get versionHistoryTitle => 'අනුවාද ඉතිහාසය';

  @override
  String get notSetText => 'සකසා නැත';

  @override
  String nameHistory(Object name) {
    return 'නම: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'නගරය: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'රට: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ස්ත්‍රී පුරුෂ භාවය: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'උපන් දිනය: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'උපන් වේලාව: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ස්ථානය: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'වේලා කලාපය: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'තත්වය: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date දින යාවත්කාලීන කරන ලදී.';
  }

  @override
  String get userIdRequired => 'පරිශීලක හැඳුනුම්පත අවශ්‍යයි';

  @override
  String get profileSaved => 'පැතිකඩ සාර්ථකව සුරකින ලදී';

  @override
  String get saveFailed => 'පැතිකඩ සුරැකීමට අසමත් විය.';

  @override
  String get errorPrefix => 'දෝෂය:';

  @override
  String get onboardingChooseLanguage => 'ඔබේ භාෂාව තෝරන්න';

  @override
  String get onboardingChooseLanguageDesc =>
      'ඉදිරියට යාමට ඔබ කැමති භාෂාව තෝරන්න.';

  @override
  String get onboardingWhatIsAstrology => 'ජ්‍යොතිෂය යනු කුමක්ද?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ජ්‍යොතිෂය යනු ආකාශ චලනයන් සහ මිනිස් ජීවිතයට ඒවායේ බලපෑම පිළිබඳ පුරාණ අධ්‍යයනය වන අතර, පෞරුෂය, සබඳතා සහ ජීවිත සිදුවීම් පිළිබඳ අවබෝධයක් ලබා දෙයි.';

  @override
  String get onboardingWhyUseApp => 'මෙම යෙදුම භාවිතා කරන්නේ ඇයි?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ඔබේ ජන්ම පත්‍රයට ගැලපෙන පරිදි නිවැරදි, මිනිසා විසින් ජනනය කරන ලද කේන්දර සහ මග පෙන්වීම් ලබා ගන්න. පළපුරුදු ජ්‍යෝතිඃ ශාස්ත්‍රඥයින්ගේ දෛනික අනාවැකි සහ පුද්ගලාරෝපිත උපදෙස් සමඟ දැනුවත් තීරණ ගන්න.';

  @override
  String get onboardingHowToUse => 'මෙම යෙදුම භාවිතා කරන්නේ කෙසේද?';

  @override
  String get onboardingHowToUseDesc =>
      'ක්ෂණිකව ආරම්භ කිරීම සඳහා ඔබේ උපන් දිනය, නිශ්චිත වේලාව, උපන් ස්ථානය සහ වෙනත් අදාළ විස්තර ඇතුළත් කරන්න. දිනපතා කේන්දර ගවේෂණය කරන්න, විශේෂඥ ජ්‍යෝතිඃ ශාස්ත්‍රඥයින්ගෙන් ප්‍රශ්න අසන්න, සහ නිරවද්‍ය, පුද්ගලාරෝපිත අනාවැකි සඳහා ඔබේ පැතිකඩ කළමනාකරණය කරන්න - පුරනය වීම අවශ්‍ය නොවේ.';

  @override
  String get onboardingGetStarted => 'ආරම්භ කරන්න';

  @override
  String get onboardingNewUser => 'නව පරිශීලකයා';

  @override
  String get onboardingExistingUser => 'පවතින පරිශීලකයා';

  @override
  String get onboardingBack => 'ආපසු';

  @override
  String get onboardingNext => 'ඊළඟ';

  @override
  String get userIdNotFound =>
      'පරිශීලක හැඳුනුම්පත හමු නොවීය. කරුණාකර පුරනය වන්න හෝ ඔබේ පැතිකඩ සකසන්න.';

  @override
  String get clearNotificationsTitle => 'දැනුම්දීම් හිස් කරන්න';

  @override
  String get clearNotificationsMessage =>
      'ඔබට සියලුම දැනුම්දීම් හිස් කිරීමට අවශ්‍ය බව ඔබට විශ්වාසද?';

  @override
  String get clearNotificationsSuccess =>
      'සියලුම දැනුම්දීම් සාර්ථකව හිස් කරන ලදී.';

  @override
  String get clearHoroscopeTitle => 'පැහැදිලි කේන්දර සටහන';

  @override
  String get clearHoroscopeMessage =>
      'ඔබේ කේන්දර දත්ත හිස් කිරීමට ඔබට අවශ්‍ය බව ඔබට විශ්වාසද?';

  @override
  String get clearHoroscopeSuccess => 'කේන්දර සටහන සාර්ථකව නිෂ්කාශනය විය.';

  @override
  String get clearChatTitle => 'කතාබස් ඉතිහාසය හිස් කරන්න';

  @override
  String get clearChatMessage =>
      'ඔබට ඔබේ සියලු කතාබස් ඉතිහාසය මකා දැමීමට අවශ්‍ය බව ඔබට විශ්වාසද?';

  @override
  String get clearChatLocal => 'කතාබහ දේශීයව හිස් කරන ලදී.';

  @override
  String get deleteAccountTitle => 'ගිණුම මකන්න';

  @override
  String get deleteAccountMessage =>
      'ඔබගේ ගිණුම මකා දැමීමට ඔබට අවශ්‍ය බව ඔබට විශ්වාසද? මෙය ඔබගේ සියලු කතාබස් ඉතිහාසය සහ දැනුම්දීම් ද හිස් කරනු ඇත.';

  @override
  String get deleteAccountSuccess => 'ඔබගේ ගිණුම සහ සියලු දත්ත ඉවත් කර ඇත.';

  @override
  String get deleteAccountError => 'ගිණුම මැකීමේ දෝෂයකි';

  @override
  String get logoutTitle => 'පිටවීම';

  @override
  String get logoutMessage => 'ඔබට ලොග් අවුට් වීමට අවශ්‍ය බව විශ්වාසද?';

  @override
  String get termsPrivacyTitle => 'නියමයන් සහ රහස්‍යතාව';

  @override
  String get privacyPolicyTitle => 'රහස්යතා ප්රතිපත්තිය';

  @override
  String get termsConditionsTitle => 'නියමයන් සහ කොන්දේසි';

  @override
  String get dataControlTitle => 'දත්ත පාලනය';

  @override
  String get cancelButton => 'අවලංගු කරන්න';

  @override
  String get confirmButton => 'තහවුරු කරන්න';

  @override
  String get clearQuestionsSuccess => 'සියලුම ප්‍රශ්න සාර්ථකව මකා දමන ලදී.';

  @override
  String get yoginiLabel => 'යෝගිනි';

  @override
  String get lordLabel => 'සමිඳාණන්';

  @override
  String get startLabel => 'ආරම්භ කරන්න';

  @override
  String get recoverAccount => 'ගිණුම ප්‍රතිසාධනය කරන්න';

  @override
  String get endLabel => 'අවසානය';

  @override
  String get startDateLabel => 'ආරම්භක දිනය';

  @override
  String get endDateLabel => 'අවසන් දිනය';

  @override
  String get notAvailable => 'ලද නොහැක';

  @override
  String get noData => 'දත්ත නැත';

  @override
  String get unknownError => 'නොදන්නා දෝෂයකි';

  @override
  String get retryButton => 'නැවත උත්සාහ කරන්න';

  @override
  String get kundaliGeneratorTitle => 'කුණ්ඩලි උත්පාදක යන්ත්‍රය';

  @override
  String get natalChartTitle => 'ජන්ම පත්‍රය';

  @override
  String get lagnaLabel => 'ලග්නය';

  @override
  String get rashiLabel => 'රාෂි';

  @override
  String get ascDegreeLabel => 'ආරෝහණ උපාධිය';

  @override
  String get vimshottariDashaTitle => 'විම්ෂෝත්තරි දශා';

  @override
  String get yoginiDashaTitle => 'යෝගිනී දශා';

  @override
  String get unknown => 'නොදන්නා';

  @override
  String get clearHoroscope => 'පැහැදිලි කේන්දර සටහන';

  @override
  String get clearNotifications => 'දැනුම්දීම් හිස් කරන්න';

  @override
  String get clearChatHistory => 'කතාබස් ඉතිහාසය හිස් කරන්න';

  @override
  String get logout => 'පිටවීම';

  @override
  String get deleteAccount => 'ගිණුම මකන්න';

  @override
  String get allFieldsRequired => 'සියලුම ක්ෂේත්‍ර අවශ්‍යයි.';

  @override
  String get accountRecoveredSuccess => 'ගිණුම සාර්ථකව ප්‍රතිසාධනය කරන ලදී.';

  @override
  String get recoveryFailed =>
      'ප්‍රතිසාධනය අසාර්ථක විය. ඔබේ තොරතුරු පරීක්ෂා කරන්න.';

  @override
  String get recoverySecretLabel => 'ප්‍රතිසාධන රහස:';

  @override
  String get aboutUsTitle => 'අපි ගැන';

  @override
  String get aboutOurCompany => 'අපගේ සමාගම ගැන';

  @override
  String get aboutCompanyDescription =>
      'කර්ම හිදී, වෛදික ජ්‍යොතිෂයේ අකාලික ප්‍රඥාව හරහා ඔබේ සැබෑ ජීවන මාර්ගය අනාවරණය කර ගැනීමට අපි ඔබට උදව් කරන්නෙමු. සෑම අවබෝධයක්ම පැමිණෙන්නේ සැබෑ, පළපුරුදු ජ්‍යොතිෂවේදීන්ගෙනි, ඔබේ අද්විතීය ජන්ම පත්‍රය මත පදනම්ව ප්‍රවේශමෙන් සකස් කර ඇත. දෛනික කේන්දරවල සිට පුද්ගලාරෝපිත මග පෙන්වීම දක්වා, කර්මය පුරාණ දැනුම භාෂා 100 කට වඩා ප්‍රවේශ විය හැකිය.';

  @override
  String get ourMission => 'අපගේ මෙහෙවර';

  @override
  String get missionDescription =>
      'අපගේ මෙහෙවර සරලයි: විශ්වාසදායක, දැනුවත් තීරණ ගැනීමට ඔබට බලය ලබා දෙන අව්‍යාජ, මිනිසුන් විසින් මෙහෙයවන ජ්‍යොතිෂ මග පෙන්වීමක් ලබා දීම. සෑම පුරෝකථනයක්ම සහ උපදේශනයක්ම ස්වයංක්‍රීය ඇල්ගොරිතම නොව, වසර ගණනාවක වෘත්තීය විශේෂඥතාව පිළිබිඹු කරයි.';

  @override
  String get ourVision => 'අපගේ දැක්ම';

  @override
  String get visionDescription =>
      'අපි ලොව පුරා සිටින මිනිසුන්ට තමන්ව, ඔවුන්ගේ තේරීම් සහ ඔවුන්ගේ ජීවන ගමන පැහැදිලිකමෙන් සහ විශ්වාසයෙන් යුතුව තේරුම් ගැනීමට උපකාර කරමින්, වෛදික ජ්‍යොතිෂය සඳහා ලෝකයේ වඩාත්ම විශ්වාසදායක වේදිකාව වීමට උත්සාහ කරමු.';

  @override
  String get ourValues => 'අපගේ වටිනාකම්';

  @override
  String get valuesDescription =>
      'කර්ම හිදී අපි අව්‍යාජභාවය, නිරවද්‍යතාවය සහ විශ්වාසය අගය කරමු. ජීවිතය තීක්ෂ්ණ බුද්ධියෙන් හා විශ්වාසයෙන් යුතුව ගමන් කිරීමට උපකාරී වන, නිවැරදි පමණක් නොව අර්ථවත් මඟ පෙන්වීමක් ලබා දීමට අපි කැපවී සිටිමු.';

  @override
  String get contactUs => 'අපව අමතන්න';

  @override
  String get contactEmail => 'විද්‍යුත් තැපෑල: care@karmalifepath.com';

  @override
  String get contactWebsite => 'වෙබ් අඩවිය: www.karmalifepath.com';

  @override
  String get customerSupport => 'පාරිභෝගික සහාය';

  @override
  String get supportHeroTitle => 'අපි උදව් කිරීමට මෙහි සිටිමු';

  @override
  String get supportHeroDescription =>
      'පහත පෝරමය පුරවන්න, අපගේ සහාය කණ්ඩායම හැකි ඉක්මනින් ඔබ හා සම්බන්ධ වනු ඇත.';

  @override
  String get yourName => 'ඔයාගේ නම';

  @override
  String get yourEmail => 'ඔබගේ විද්‍යුත් තැපෑල';

  @override
  String get message => 'පණිවිඩය';

  @override
  String get enterEmail => 'ඔබගේ විද්‍යුත් තැපෑල ඇතුළත් කරන්න';

  @override
  String get enterValidEmail => 'වලංගු විද්‍යුත් තැපැල් ලිපිනයක් ඇතුළත් කරන්න.';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ඇතුළත් කරන්න';
  }

  @override
  String get send => 'යවන්න';

  @override
  String get sending => 'යවමින්...';

  @override
  String get emailSentSuccess => '✅ විද්‍යුත් තැපෑල සාර්ථකව යවන ලදී!';

  @override
  String get emailSendFailed => '❌ ඊමේල් යැවීමට අසමත් විය.';

  @override
  String get astroDictionaryTitle => 'තාරකා ශබ්දකෝෂය';

  @override
  String get searchTermsHint => 'සෙවුම් පද...';

  @override
  String get noTermsFound => 'පද කිසිවක් හමු නොවීය';

  @override
  String get buyQuestionsTitle => 'ප්‍රශ්න මිලදී ගන්න';

  @override
  String get userNotAuthenticated => 'පරිශීලකයා සත්‍යාපනය කර නොමැත.';

  @override
  String get loadStoreDataFailed => 'ගබඩා දත්ත පූරණය කිරීමට අසමත් විය.';

  @override
  String get missingAuthToken => 'සත්‍යාපන ටෝකනය අස්ථානගත වී ඇත';

  @override
  String get merchantDisplayName => 'ඇස්ට්‍රෝ චැට් යෙදුම';

  @override
  String get paymentSuccessful => '✅ ගෙවීම සාර්ථකයි! ප්‍රශ්නය යවන ලදී.';

  @override
  String paymentFailed(Object error) {
    return '❌ ගෙවීම අසාර්ථක විය: $error';
  }

  @override
  String get yourBalance => 'ඔබේ ශේෂය';

  @override
  String questionsBalance(Object count) {
    return '$count ප්‍රශ්න';
  }

  @override
  String get availableOffers => 'ලබා ගත හැකි දීමනා';

  @override
  String questionsCount(Object count) {
    return '$count ප්‍රශ්නය';
  }

  @override
  String get buyButton => 'මිලදී ගන්න';

  @override
  String get dailyHoroscopeTitle => ' දෛනික කේන්දර සටහන';

  @override
  String get userIdMissing => 'පරිශීලක හැඳුනුම්පත අස්ථානගත වී ඇත.';

  @override
  String get fetchHoroscopesFailed => 'කේන්දර ලබා ගැනීමට අසමත් විය.';

  @override
  String get noHoroscopeFound => 'කේන්දරයක් හමු නොවීය.';

  @override
  String get signLabel => 'ලකුණ';

  @override
  String get todayLabel => 'අද';

  @override
  String get yesterdayLabel => 'ඊයේ';

  @override
  String get thisWeekLabel => 'මෙම සතිය';

  @override
  String get lastMonthLabel => 'පසුගිය මාසයේ';

  @override
  String get chatTitle => 'කතාබස් කරන්න';

  @override
  String get typeYourQuestionHint => 'ඔබේ ප්‍රශ්නය ටයිප් කරන්න...';

  @override
  String get paymentRequired => 'ගෙවීම අවශ්‍යයි';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'ඔබ ඔබේ නොමිලේ ප්‍රශ්න භාවිතා කර ඇත. ඉදිරියට යාමට $amount ගෙවන්න.';
  }

  @override
  String get payNowButton => 'දැන් ගෙවන්න';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count නොමිලේ ප්‍රශ්න ඉතිරිව ඇත';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ඉතිරිව ඇති ගෙවූ ප්‍රශ්න';
  }

  @override
  String get thankYouFeedback => 'ඔබගේ ප්‍රතිපෝෂණයට ස්තූතියි!';

  @override
  String get ratingSubmitted => 'ඇගයීම ඉදිරිපත් කරන ලදී!';

  @override
  String get setUserIdFirst => 'කරුණාකර පළමුව ඔබගේ පරිශීලක හැඳුනුම්පත සකසන්න.';

  @override
  String get failedToFetchPrevious =>
      'පෙර ප්‍රශ්න සහ පිළිතුරු ලබා ගැනීමට අපොහොසත් විය.';

  @override
  String errorOccurred(Object error) {
    return 'දෝෂය: $error';
  }

  @override
  String get drawerAstroProfile => 'තාරකා පැතිකඩ';

  @override
  String get drawerDailyHoroscope => 'දෛනික කේන්දර සටහන';

  @override
  String get drawerBuyQuestions => 'ප්‍රශ්න මිලදී ගන්න';

  @override
  String get drawerAstroDictionary => 'තාරකා ශබ්දකෝෂය';

  @override
  String get drawerSettings => 'සැකසුම්';

  @override
  String get drawerCustomerSupport => 'පාරිභෝගික සහාය';

  @override
  String get drawerAbout => 'ගැන';

  @override
  String get drawerProfileSettings => 'පැතිකඩ සැකසුම්';

  @override
  String get demoNotificationTitle => '🔔 ආදර්ශන දැනුම්දීම';

  @override
  String get demoNotificationBody =>
      'මෙය ඔබගේ යෙදුමෙන් ලැබුණු පරීක්ෂණ දැනුම්දීමකි!';

  @override
  String get notificationsTitle => 'දැනුම්දීම්';

  @override
  String get noNotifications => 'දැනුම්දීම් නැත';

  @override
  String get allTab => 'සියල්ල';

  @override
  String get markAllAsRead => 'සියල්ල කියවූ ලෙස සලකුණු කරන්න';

  @override
  String get notificationMarkedRead => 'දැනුම්දීම කියවූ ලෙස සලකුණු කරන ලදී';

  @override
  String get failedToLoadNotifications => 'දැනුම්දීම් පූරණය කිරීමට අසමත් විය.';

  @override
  String get failedToMarkRead => 'කියවූ ලෙස සලකුණු කිරීමට අසමත් විය.';

  @override
  String get failedToMarkAllRead => 'සියල්ල කියවූ ලෙස සලකුණු කිරීමට අසමත් විය.';

  @override
  String get socketConnected => 'සොකට් එක සම්බන්ධයි';

  @override
  String get socketDisconnected => 'සොකට් එක විසන්ධි විය';

  @override
  String get newNotificationReceived => 'නව දැනුම්දීමක් ලැබුණි';

  @override
  String get generalCategory => 'ජනරාල්';

  @override
  String get horoscopeCategory => 'කේන්දර සටහන';

  @override
  String get chatCategory => 'කතාබස් කරන්න';

  @override
  String get systemCategory => 'පද්ධතිය';

  @override
  String get updateCategory => 'යාවත්කාලීන කිරීම්';

  @override
  String get howToAskTitle => 'අසන්නේ කෙසේද?';

  @override
  String get noQuestionsAvailable => 'ප්‍රශ්න නොමැත';

  @override
  String get failedToLoadQuestions => 'ප්‍රශ්න පූරණය කිරීමට අසමත් විය.';

  @override
  String get pullToRefresh => 'නැවුම් කිරීමට අදින්න';

  @override
  String get careerCategory => 'වෘත්තීය ජීවිතය';

  @override
  String get loveCategory => 'ආදරය සහ සබඳතා';

  @override
  String get healthCategory => 'සෞඛ්‍යය';

  @override
  String get financeCategory => 'මූල්‍ය';

  @override
  String get familyCategory => 'පවුල';

  @override
  String get educationCategory => 'අධ්‍යාපනය';

  @override
  String get travelCategory => 'ගමන්';

  @override
  String get spiritualCategory => 'ආධ්‍යාත්මික';

  @override
  String get profileLoaded => 'පැතිකඩ සාර්ථකව පූරණය විය';

  @override
  String get imageUploaded => 'රූපය සාර්ථකව උඩුගත කරන ලදී.';

  @override
  String get savedInformationConfirmation => 'මම මෙම තොරතුරු සුරකින ලදී.';

  @override
  String get noHistoryAvailable => 'ඉතිහාසයක් නොමැත';

  @override
  String get missingUserIdError => 'පරිශීලක හැඳුනුම්පත අවශ්‍යයි';

  @override
  String get networkError => 'ජාල දෝෂයකි. කරුණාකර නැවත උත්සාහ කරන්න.';

  @override
  String get timeoutError => 'ඉල්ලීම කල් ඉකුත් විය';

  @override
  String get genericError => 'යමක් වැරදී ඇත.';

  @override
  String get reactionUpdateError => 'ප්‍රතිචාරය යාවත්කාලීන කිරීමට අසමත් විය';

  @override
  String get noSearchResults => 'සෙවුම් ප්‍රතිඵල හමු නොවීය.';

  @override
  String get clearSearch => 'සෙවීම හිස් කරන්න';

  @override
  String get resultsFound => 'ප්‍රතිඵල හමු විය';

  @override
  String get recoverySecretHint =>
      'පිටපත් කිරීම සහ ඇලවීම ක්‍රියා නොකරනු ඇත, අතින් ටයිප් කරන්න.';

  @override
  String get recoverAccountDescription =>
      'ඔබගේ ගිණුම ප්‍රතිසාධනය කිරීමට මෙම පියවර අනුගමනය කරන්න.';

  @override
  String get processingLabel => 'සකසමින්...';

  @override
  String get clearChatSuccess => 'කතාබහ සාර්ථකව හිස් කරන ලදී';

  @override
  String get notificationsEnabled => 'දැනුම්දීම් සබල කර ඇත';

  @override
  String get notificationsDisabled => 'දැනුම්දීම් අබල කර ඇත';

  @override
  String get securityNotice => 'ඔබගේ දත්ත ආරක්ෂිතව සංකේතනය කර ගබඩා කර ඇත';

  @override
  String get loading => 'පූරණය වෙමින්...';

  @override
  String get selectLanguage => 'භාෂාව තෝරන්න';

  @override
  String get onboardingGetStartedDesc => 'ඔබේ භාෂාව තෝරා ගැනීමෙන් ආරම්භ කරන්න';

  @override
  String get accountRecoveryTitle => '🔐 ගිණුම් ප්‍රතිසාධන විස්තර';

  @override
  String get recoveryInstructions =>
      'කරුණාකර මෙම තොරතුරු ආරක්ෂිතව සුරකින්න. ඔබේ ගිණුම ප්‍රතිසාධනය කිරීමට ඔබට එය අවශ්‍ය වනු ඇත.';

  @override
  String get importantNotice => '⚠️ වැදගත්:';

  @override
  String get astrologerProfileTitle => 'ජ්‍යෝතිඃ ශාස්ත්‍රඥ පැතිකඩ';

  @override
  String get personalAstrologer => 'පුද්ගලික ජ්‍යෝතිඃ ශාස්ත්‍රඥයා';

  @override
  String get makePersonalAstrologer => 'පුද්ගලික ජ්‍යෝතිඃ ශාස්ත්‍රඥයෙකු සාදන්න';

  @override
  String get favoriteDescription =>
      'ඔබේ ප්‍රශ්න මෙම ජ්‍යෝතිඃ ශාස්ත්‍රඥයාට ප්‍රමුඛත්වය දෙනු ලැබේ. නොමැති නම්, වෙනත් සුදුසුකම් ලත් ජ්‍යෝතිඃ ශාස්ත්‍රඥයෙකු ඔබට සහාය වනු ඇත.';

  @override
  String get educationQualifications => 'අධ්‍යාපනය සහ සුදුසුකම්';

  @override
  String get aboutSection => 'ගැන';

  @override
  String get shareProfile => 'පැතිකඩ බෙදා ගන්න';

  @override
  String get loadingAstrologer => 'ජ්‍යෝතිඃ ශාස්ත්‍රඥ විස්තර පූරණය වෙමින්...';

  @override
  String get failedToLoadAstrologer =>
      'ජ්‍යෝතිඃ ශාස්ත්‍රඥ විස්තර පූරණය කිරීමට අසමත් විය.';

  @override
  String get authenticationRequired =>
      'සත්‍යාපනය අවශ්‍යයි. කරුණාකර පුරනය වන්න.';

  @override
  String securityCheckFailed(Object error) {
    return 'ආරක්ෂක පරීක්ෂාව අසාර්ථක විය: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name දැන් ඔබේ පුද්ගලික ජ්‍යෝතිඃ ශාස්ත්‍රඥයායි';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name ප්‍රියතමයන්ගෙන් ඉවත් කරන ලදී.';
  }

  @override
  String get toggleFavoriteError =>
      'ප්‍රියතම තත්ත්වය යාවත්කාලීන කිරීමට අසමත් විය.';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 අධ්‍යාපනය: $education\n📜 සුදුසුකම්: $qualification\n⏳ පළපුරුද්ද: $experience';
  }

  @override
  String get notProvided => 'සපයා නැත';

  @override
  String reviews(Object count) {
    return '($count සමාලෝචන)';
  }

  @override
  String get specialties => 'විශේෂතා';

  @override
  String get experience => 'අත්දැකීම්';

  @override
  String get qualification => 'සුදුසුකම්';

  @override
  String get education => 'අධ්‍යාපනය';

  @override
  String get recoveryTips =>
      '• මෙම තොරතුරු වල තිර රුවක් ගන්න\n• එය ආරක්ෂිත ස්ථානයක ගබඩා කරන්න\n• කිසිවෙකු සමඟ බෙදා නොගන්න\n• මෙය එක් වරක් පමණක් පෙන්වනු ලැබේ';

  @override
  String get themeSettingsTitle => 'තේමා සැකසුම්';

  @override
  String get lightThemeLabel => 'ආලෝකය';

  @override
  String get lightThemeDescription => 'සැමවිටම සැහැල්ලු තේමාව භාවිතා කරන්න';

  @override
  String get darkThemeLabel => 'අඳුරු';

  @override
  String get darkThemeDescription => 'සැමවිටම අඳුරු තේමාව භාවිතා කරන්න';

  @override
  String get systemThemeLabel => 'පද්ධතිය';

  @override
  String get systemThemeDarkDescription =>
      'අඳුරු තේමාව සඳහා පද්ධති සැකසුම අනුගමනය කරන්න';

  @override
  String get systemThemeLightDescription =>
      'ආලෝක තේමාව සඳහා පද්ධති සැකසුම අනුගමනය කරන්න';

  @override
  String get switchToLight => 'ආලෝකයට මාරු වන්න';

  @override
  String get switchToDark => 'අඳුරු වෙත මාරු වන්න';

  @override
  String get ourTeam => 'අපේ කණ්ඩායම';

  @override
  String get teamDescription =>
      'අපගේ වෘත්තීය වෛදික ජ්‍යෝතිඃ ශාස්ත්‍රඥ කණ්ඩායම ග්‍රහලෝක බලපෑම් සහ ජීවන රටා අර්ථකථනය කිරීමේ වසර ගණනාවක අත්දැකීම් ගෙන එයි. කැපවූ සහාය සහ සංවර්ධන කණ්ඩායමක සහාය ඇතිව, කර්ම සෑම පරිශීලකයෙකුටම බාධාවකින් තොරව, විශ්වාසදායක සහ ගෝලීය අත්දැකීමක් ලබා දෙයි.';
}
