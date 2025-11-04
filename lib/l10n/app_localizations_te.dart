// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get settingsTitle => 'సెట్టింగులు';

  @override
  String get notificationSettings => 'నోటిఫికేషన్ సెట్టింగ్‌లు';

  @override
  String get privacySettings => 'ప్రైవసీ సెటింగ్స్';

  @override
  String get accountSettings => 'ఖాతా సెట్టింగ్‌లు';

  @override
  String get languageSettings => 'భాషా సెట్టింగ్‌లు';

  @override
  String get languageChanged => 'భాష మారింది';

  @override
  String get existingUserButton => 'నేను ఇప్పటికే ఉన్న వినియోగదారుని';

  @override
  String get chooseCountryTitle => 'దేశాన్ని ఎంచుకోండి';

  @override
  String get yesText => 'అవును';

  @override
  String get noText => 'లేదు';

  @override
  String get appBarTitle => 'ప్రొఫైల్ సెట్టింగ్‌లు';

  @override
  String get userIdLabel => 'వినియోగదారు ఐడి *';

  @override
  String get nameLabel => 'పేరు';

  @override
  String get birthCountryLabel => 'జన్మ దేశం';

  @override
  String get birthCityLabel => 'జన్మ నగరం';

  @override
  String get countrySelectionTitle => 'మీ దేశాన్ని ఎంచుకోండి';

  @override
  String get maleLabel => 'పురుషుడు';

  @override
  String get femaleLabel => 'స్త్రీ';

  @override
  String get birthDateLabel => 'పుట్టిన తేదీ';

  @override
  String get birthDatePlaceholder => 'పుట్టిన తేదీని ఎంచుకోండి';

  @override
  String get birthTimeLabel => 'పుట్టిన సమయం';

  @override
  String get birthTimePlaceholder => 'జనన సమయాన్ని ఎంచుకోండి';

  @override
  String get saveProfileButton => 'ప్రొఫైల్‌ను సేవ్ చేయి';

  @override
  String get noCitiesFound => 'నగరాలు ఏవీ కనుగొనబడలేదు';

  @override
  String cityPlaceholder(Object country) {
    return '$country లో నగరాన్ని నమోదు చేయండి';
  }

  @override
  String get countryFirstPlaceholder => 'ముందుగా దేశాన్ని ఎంచుకోండి';

  @override
  String get versionHistoryTitle => 'వెర్షన్ చరిత్ర';

  @override
  String get notSetText => 'సెట్ చేయబడలేదు';

  @override
  String nameHistory(Object name) {
    return 'పేరు: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'నగరం: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'దేశం: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'లింగం: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'పుట్టిన తేదీ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'జనన సమయం: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'స్థానం: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'టైమ్‌జోన్: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'స్థితి: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$dateన నవీకరించబడింది';
  }

  @override
  String get userIdRequired => 'యూజర్ ఐడి అవసరం';

  @override
  String get profileSaved => 'ప్రొఫైల్ విజయవంతంగా సేవ్ చేయబడింది';

  @override
  String get saveFailed => 'ప్రొఫైల్‌ను సేవ్ చేయడంలో విఫలమైంది.';

  @override
  String get errorPrefix => 'లోపం:';

  @override
  String get onboardingChooseLanguage => 'మీ భాషను ఎంచుకోండి';

  @override
  String get onboardingChooseLanguageDesc =>
      'కొనసాగించడానికి మీకు నచ్చిన భాషను ఎంచుకోండి.';

  @override
  String get onboardingWhatIsAstrology => 'జ్యోతిష్యం అంటే ఏమిటి?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'జ్యోతిషశాస్త్రం అంటే ఖగోళ వస్తువుల అధ్యయనం...';

  @override
  String get onboardingWhyUseApp => 'ఈ యాప్‌ను ఎందుకు ఉపయోగించాలి?';

  @override
  String get onboardingWhyUseAppDesc =>
      'వ్యక్తిగతీకరించిన జాతకాలు, రోజువారీ అంచనాలు మరియు సమాచారంతో కూడిన నిర్ణయాలు తీసుకోవడానికి మార్గదర్శకత్వం పొందండి.';

  @override
  String get onboardingHowToUse => 'ఈ యాప్‌ను ఎలా ఉపయోగించాలి?';

  @override
  String get onboardingHowToUseDesc =>
      'సులభంగా నావిగేట్ చేయండి, రోజువారీ జాతకాలను తనిఖీ చేయండి మరియు ఖచ్చితమైన అంచనాల కోసం మీ ప్రొఫైల్‌ను నిర్వహించండి.';

  @override
  String get onboardingGetStarted => 'ప్రారంభించడానికి';

  @override
  String get onboardingNewUser => 'కొత్త వినియోగదారు';

  @override
  String get onboardingExistingUser => 'ఇప్పటికే ఉన్న వినియోగదారు';

  @override
  String get onboardingBack => 'వెనుకకు';

  @override
  String get onboardingNext => 'తరువాతి';

  @override
  String get userIdNotFound =>
      'యూజర్ ఐడి దొరకలేదు. దయచేసి లాగిన్ అవ్వండి లేదా మీ ప్రొఫైల్ సెట్ చేసుకోండి.';

  @override
  String get clearNotificationsTitle => 'నోటిఫికేషన్‌లను క్లియర్ చేయి';

  @override
  String get clearNotificationsMessage =>
      'మీరు ఖచ్చితంగా అన్ని నోటిఫికేషన్‌లను క్లియర్ చేయాలనుకుంటున్నారా?';

  @override
  String get clearNotificationsSuccess =>
      'అన్ని నోటిఫికేషన్‌లు విజయవంతంగా క్లియర్ చేయబడ్డాయి.';

  @override
  String get clearHoroscopeTitle => 'స్పష్టమైన జాతకం';

  @override
  String get clearHoroscopeMessage =>
      'మీరు మీ జాతక డేటాను ఖచ్చితంగా క్లియర్ చేయాలనుకుంటున్నారా?';

  @override
  String get clearHoroscopeSuccess => 'జాతకం విజయవంతంగా క్లియర్ చేయబడింది.';

  @override
  String get clearChatTitle => 'చాట్ చరిత్రను క్లియర్ చేయి';

  @override
  String get clearChatMessage =>
      'మీరు మీ చాట్ హిస్టరీ మొత్తాన్ని తొలగించాలనుకుంటున్నారా?';

  @override
  String get clearChatLocal => 'స్థానికంగా చాట్ క్లియర్ చేయబడింది.';

  @override
  String get deleteAccountTitle => 'ఖాతాను తొలగించండి';

  @override
  String get deleteAccountMessage =>
      'మీరు మీ ఖాతాను ఖచ్చితంగా తొలగించాలనుకుంటున్నారా? ఇది మీ చాట్ చరిత్ర మరియు నోటిఫికేషన్‌లన్నింటినీ కూడా క్లియర్ చేస్తుంది.';

  @override
  String get deleteAccountSuccess =>
      'మీ ఖాతా మరియు దానిలోని మొత్తం డేటా తొలగించబడ్డాయి.';

  @override
  String get deleteAccountError => 'ఖాతాను తొలగించడంలో లోపం ఏర్పడింది';

  @override
  String get logoutTitle => 'లాగ్అవుట్';

  @override
  String get logoutMessage => 'మీరు ఖచ్చితంగా లాగ్ అవుట్ చేయాలనుకుంటున్నారా?';

  @override
  String get termsPrivacyTitle => 'నిబంధనలు & గోప్యత';

  @override
  String get privacyPolicyTitle => 'గోప్యతా విధానం';

  @override
  String get termsConditionsTitle => 'నిబంధనలు & షరతులు';

  @override
  String get dataControlTitle => 'డేటా నియంత్రణ';

  @override
  String get cancelButton => 'రద్దు చేయి';

  @override
  String get confirmButton => 'నిర్ధారించండి';

  @override
  String get clearQuestionsSuccess =>
      'అన్ని ప్రశ్నలు విజయవంతంగా తొలగించబడ్డాయి.';

  @override
  String get yoginiLabel => 'యోగిని';

  @override
  String get lordLabel => 'ప్రభువు';

  @override
  String get startLabel => 'ప్రారంభించండి';

  @override
  String get recoverAccount => 'ఖాతాను పునరుద్ధరించండి';

  @override
  String get endLabel => 'ముగింపు';

  @override
  String get startDateLabel => 'ప్రారంభ తేదీ';

  @override
  String get endDateLabel => 'ముగింపు తేదీ';

  @override
  String get notAvailable => 'అందుబాటులో లేదు';

  @override
  String get noData => 'డేటా లేదు';

  @override
  String get unknownError => 'తెలియని లోపం';

  @override
  String get retryButton => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String get kundaliGeneratorTitle => 'కుండలి జనరేటర్';

  @override
  String get natalChartTitle => 'జన్మ నక్షత్రం';

  @override
  String get lagnaLabel => 'లగ్నము';

  @override
  String get rashiLabel => 'రాశి';

  @override
  String get ascDegreeLabel => 'అసెన్డెంట్ డిగ్రీ';

  @override
  String get vimshottariDashaTitle => 'వింషోత్తరి దశ';

  @override
  String get yoginiDashaTitle => 'యోగిని దశ';

  @override
  String get unknown => 'తెలియదు';

  @override
  String get clearHoroscope => 'స్పష్టమైన జాతకం';

  @override
  String get clearNotifications => 'నోటిఫికేషన్‌లను క్లియర్ చేయి';

  @override
  String get clearChatHistory => 'చాట్ చరిత్రను క్లియర్ చేయి';

  @override
  String get logout => 'లాగ్అవుట్';

  @override
  String get deleteAccount => 'ఖాతాను తొలగించండి';

  @override
  String get allFieldsRequired => 'అన్ని ఫీల్డ్‌లు తప్పనిసరి.';

  @override
  String get accountRecoveredSuccess => 'ఖాతా విజయవంతంగా పునరుద్ధరించబడింది.';

  @override
  String get recoveryFailed =>
      'పునరుద్ధరణ విఫలమైంది. మీ సమాచారాన్ని తనిఖీ చేయండి.';

  @override
  String get recoverySecretLabel => 'రికవరీ రహస్యం:';

  @override
  String get aboutUsTitle => 'మా గురించి';

  @override
  String get aboutOurCompany => 'మా కంపెనీ గురించి';

  @override
  String get aboutCompanyDescription =>
      'మా వినియోగదారులకు ఉత్తమ జ్యోతిషశాస్త్ర అనుభవాన్ని అందించడానికి మేము కట్టుబడి ఉన్నాము.';

  @override
  String get ourMission => 'మా లక్ష్యం';

  @override
  String get missionDescription =>
      'వినియోగదారులు తమ జీవితాల్లో సమాచారంతో కూడిన నిర్ణయాలు తీసుకోవడంలో సహాయపడటానికి ఖచ్చితమైన మరియు వ్యక్తిగతీకరించిన జ్యోతిషశాస్త్ర అంతర్దృష్టులను అందించడానికి.';

  @override
  String get ourVision => 'మా దృష్టి';

  @override
  String get visionDescription =>
      'సాంకేతికత మరియు ప్రాచీన జ్ఞానాన్ని కలిపి అత్యంత విశ్వసనీయ జ్యోతిషశాస్త్ర వేదికగా మారడం.';

  @override
  String get ourValues => 'మా విలువలు';

  @override
  String get valuesDescription =>
      'సమగ్రత, ఖచ్చితత్వం, వినియోగదారు కేంద్రీకృత రూపకల్పన మరియు నిరంతర ఆవిష్కరణ.';

  @override
  String get contactUs => 'మమ్మల్ని సంప్రదించండి';

  @override
  String get contactEmail => 'ఇమెయిల్: support@yourcompany.com';

  @override
  String get contactWebsite => 'వెబ్‌సైట్: www.yourcompany.com';

  @override
  String get customerSupport => 'కస్టమర్ మద్దతు';

  @override
  String get supportHeroTitle => 'మేము సహాయం చేయడానికి ఇక్కడ ఉన్నాము';

  @override
  String get supportHeroDescription =>
      'దిగువన ఉన్న ఫారమ్ నింపండి, మా మద్దతు బృందం వీలైనంత త్వరగా మిమ్మల్ని సంప్రదిస్తుంది.';

  @override
  String get yourName => 'మీ పేరు';

  @override
  String get yourEmail => 'మీ ఇమెయిల్';

  @override
  String get message => 'సందేశం';

  @override
  String get enterEmail => 'మీ ఇమెయిల్‌ను నమోదు చేయండి';

  @override
  String get enterValidEmail =>
      'చెల్లుబాటు అయ్యే ఇమెయిల్ చిరునామాను నమోదు చేయండి';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ఎంటర్ చేయండి';
  }

  @override
  String get send => 'పంపండి';

  @override
  String get sending => 'పంపుతోంది...';

  @override
  String get emailSentSuccess => '✅ ఇమెయిల్ విజయవంతంగా పంపబడింది!';

  @override
  String get emailSendFailed => '❌ ఇమెయిల్ పంపడంలో విఫలమైంది';

  @override
  String get astroDictionaryTitle => 'ఆస్ట్రో నిఘంటువు';

  @override
  String get searchTermsHint => 'శోధన పదాలు...';

  @override
  String get noTermsFound => 'పదాలు కనుగొనబడలేదు';

  @override
  String get buyQuestionsTitle => 'ప్రశ్నలు కొనండి';

  @override
  String get userNotAuthenticated => 'వినియోగదారు ప్రామాణీకరించబడలేదు';

  @override
  String get loadStoreDataFailed => 'స్టోర్ డేటాను లోడ్ చేయడంలో విఫలమైంది.';

  @override
  String get missingAuthToken => 'ప్రామాణీకరణ టోకెన్ లేదు';

  @override
  String get merchantDisplayName => 'ఆస్ట్రో చాట్ యాప్';

  @override
  String get paymentSuccessful => '✅ చెల్లింపు విజయవంతమైంది! ప్రశ్న పంపబడింది';

  @override
  String paymentFailed(Object error) {
    return '❌ చెల్లింపు విఫలమైంది: $error';
  }

  @override
  String get yourBalance => 'మీ బ్యాలెన్స్';

  @override
  String questionsBalance(Object count) {
    return '$count ప్రశ్నలు';
  }

  @override
  String get availableOffers => 'అందుబాటులో ఉన్న ఆఫర్లు';

  @override
  String questionsCount(Object count) {
    return '$count ప్రశ్న';
  }

  @override
  String get buyButton => 'కొనుగోలు';

  @override
  String get dailyHoroscopeTitle => '🌟 రోజువారీ జాతకం';

  @override
  String get userIdMissing => 'యూజర్ ఐడి లేదు.';

  @override
  String get fetchHoroscopesFailed => 'జాతకాలను పొందడంలో విఫలమైంది';

  @override
  String get noHoroscopeFound => 'జాతకం దొరకలేదు.';

  @override
  String get signLabel => 'సంతకం చేయండి';

  @override
  String get todayLabel => 'ఈరోజు';

  @override
  String get yesterdayLabel => 'నిన్న';

  @override
  String get thisWeekLabel => 'ఈ వారం';

  @override
  String get lastMonthLabel => 'గత నెల';

  @override
  String get chatTitle => 'చాట్';

  @override
  String get typeYourQuestionHint => 'మీ ప్రశ్నను టైప్ చేయండి...';

  @override
  String get paymentRequired => 'చెల్లింపు అవసరం';

  @override
  String get paymentRequiredMessage =>
      'మీరు మీ ఉచిత ప్రశ్నలను ఉపయోగించారు. కొనసాగించడానికి ₹50 చెల్లించండి.';

  @override
  String get payNowButton => 'ఇప్పుడే చెల్లించండి';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ఇంకా ఉచిత ప్రశ్నలు మిగిలి ఉన్నాయి';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count చెల్లింపు ప్రశ్నలు మిగిలి ఉన్నాయి';
  }

  @override
  String get thankYouFeedback => 'మీ అభిప్రాయం తెలియచేసినందుకు ధన్యవాదాలు!';

  @override
  String get ratingSubmitted => 'రేటింగ్ సమర్పించబడింది!';

  @override
  String get setUserIdFirst => 'దయచేసి ముందుగా మీ యూజర్ ఐడిని సెట్ చేయండి.';

  @override
  String get failedToFetchPrevious =>
      'మునుపటి ప్రశ్నలు మరియు సమాధానాలను పొందడంలో విఫలమైంది.';

  @override
  String errorOccurred(Object error) {
    return 'లోపం: $error';
  }

  @override
  String get drawerAstroProfile => 'ఆస్ట్రో ప్రొఫైల్';

  @override
  String get drawerDailyHoroscope => 'రోజువారీ జాతకం';

  @override
  String get drawerBuyQuestions => 'ప్రశ్నలు కొనండి';

  @override
  String get drawerAstroDictionary => 'ఆస్ట్రో నిఘంటువు';

  @override
  String get drawerSettings => 'సెట్టింగులు';

  @override
  String get drawerCustomerSupport => 'కస్టమర్ మద్దతు';

  @override
  String get drawerAbout => 'మా గురించి';

  @override
  String get drawerProfileSettings => 'ప్రొఫైల్ సెట్టింగ్‌లు';

  @override
  String get demoNotificationTitle => '🔔 డెమో నోటిఫికేషన్';

  @override
  String get demoNotificationBody =>
      'ఇది మీ యాప్ నుండి వచ్చిన పరీక్ష నోటిఫికేషన్!';

  @override
  String get notificationsTitle => 'నోటిఫికేషన్‌లు';

  @override
  String get noNotifications => 'నోటిఫికేషన్‌లు లేవు';

  @override
  String get allTab => 'అన్నీ';

  @override
  String get markAllAsRead => 'అన్నీ చదివినట్లు గుర్తు పెట్టు';

  @override
  String get notificationMarkedRead =>
      'నోటిఫికేషన్ చదివినట్లుగా గుర్తించబడింది';

  @override
  String get failedToLoadNotifications =>
      'నోటిఫికేషన్‌లను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get failedToMarkRead => 'చదివినట్లుగా గుర్తు పెట్టడంలో విఫలమైంది';

  @override
  String get failedToMarkAllRead =>
      'అన్నీ చదివినట్లు గుర్తు పెట్టడంలో విఫలమైంది.';

  @override
  String get socketConnected => 'సాకెట్ కనెక్ట్ చేయబడింది';

  @override
  String get socketDisconnected => 'సాకెట్ డిస్‌కనెక్ట్ చేయబడింది';

  @override
  String get newNotificationReceived => 'కొత్త నోటిఫికేషన్ అందింది';

  @override
  String get generalCategory => 'జనరల్';

  @override
  String get horoscopeCategory => 'జాతకం';

  @override
  String get chatCategory => 'చాట్';

  @override
  String get systemCategory => 'వ్యవస్థ';

  @override
  String get updateCategory => 'నవీకరణలు';

  @override
  String get howToAskTitle => 'ఎలా అడగాలి';

  @override
  String get noQuestionsAvailable => 'ప్రశ్నలు అందుబాటులో లేవు';

  @override
  String get failedToLoadQuestions => 'ప్రశ్నలను లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get pullToRefresh => 'రిఫ్రెష్ చేయడానికి లాగండి';

  @override
  String get careerCategory => 'కెరీర్';

  @override
  String get loveCategory => 'ప్రేమ & సంబంధాలు';

  @override
  String get healthCategory => 'ఆరోగ్య';

  @override
  String get financeCategory => 'ఫైనాన్స్';

  @override
  String get familyCategory => 'కుటుంబం';

  @override
  String get educationCategory => 'విద్య';

  @override
  String get travelCategory => 'ప్రయాణం';

  @override
  String get spiritualCategory => 'ఆధ్యాత్మికం';

  @override
  String get profileLoaded => 'ప్రొఫైల్ విజయవంతంగా లోడ్ అయింది.';

  @override
  String get imageUploaded => 'చిత్రం విజయవంతంగా అప్‌లోడ్ చేయబడింది';

  @override
  String get savedInformationConfirmation => 'నేను ఈ సమాచారాన్ని సేవ్ చేసాను.';

  @override
  String get noHistoryAvailable => 'చరిత్ర అందుబాటులో లేదు';

  @override
  String get missingUserIdError => 'యూజర్ ఐడి అవసరం';

  @override
  String get networkError => 'నెట్‌వర్క్ లోపం. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get timeoutError => 'అభ్యర్థన సమయం ముగిసింది';

  @override
  String get genericError => 'ఏదో తప్పు జరిగింది.';

  @override
  String get reactionUpdateError => 'ప్రతిస్పందనను నవీకరించడంలో విఫలమైంది';

  @override
  String get noSearchResults => 'శోధన ఫలితాలు ఏవీ కనుగొనబడలేదు';

  @override
  String get clearSearch => 'శోధనను క్లియర్ చేయి';

  @override
  String get resultsFound => 'ఫలితాలు కనుగొనబడ్డాయి';

  @override
  String get recoverySecretHint =>
      'కాపీ-పేస్ట్ పనిచేయకపోవచ్చు, మాన్యువల్‌గా టైప్ చేయండి';

  @override
  String get recoverAccountDescription =>
      'మీ ఖాతాను పునరుద్ధరించడానికి ఈ దశలను అనుసరించండి.';

  @override
  String get processingLabel => 'ప్రాసెస్ చేస్తోంది...';

  @override
  String get clearChatSuccess => 'చాట్ విజయవంతంగా క్లియర్ చేయబడింది';

  @override
  String get notificationsEnabled => 'నోటిఫికేషన్‌లు ప్రారంభించబడ్డాయి';

  @override
  String get notificationsDisabled => 'నోటిఫికేషన్‌లు నిలిపివేయబడ్డాయి';

  @override
  String get securityNotice =>
      'మీ డేటా సురక్షితంగా గుప్తీకరించబడింది మరియు నిల్వ చేయబడుతుంది';

  @override
  String get loading => 'లోడ్ అవుతోంది...';

  @override
  String get selectLanguage => 'భాషను ఎంచుకోండి';

  @override
  String get onboardingGetStartedDesc =>
      'మీ భాషను ఎంచుకోవడం ద్వారా ప్రారంభించండి';

  @override
  String get accountRecoveryTitle => '🔐 ఖాతా రికవరీ వివరాలు';

  @override
  String get recoveryInstructions =>
      'దయచేసి ఈ సమాచారాన్ని సురక్షితంగా సేవ్ చేయండి. మీ ఖాతాను పునరుద్ధరించడానికి మీకు ఇది అవసరం.';

  @override
  String get importantNotice => '⚠️ ముఖ్యమైనది:';

  @override
  String get astrologerProfileTitle => 'జ్యోతిష్కుడి ప్రొఫైల్';

  @override
  String get personalAstrologer => 'వ్యక్తిగత జ్యోతిష్కుడు';

  @override
  String get makePersonalAstrologer => 'వ్యక్తిగత జ్యోతిష్కుడిని చేసుకోండి';

  @override
  String get favoriteDescription =>
      'మీ ప్రశ్నలకు ఈ జ్యోతిష్కుడు ప్రాధాన్యత ఇస్తాడు. అందుబాటులో లేకపోతే, మరొక అర్హత కలిగిన జ్యోతిష్కుడు మీకు సహాయం చేస్తాడు.';

  @override
  String get educationQualifications => 'విద్య & అర్హతలు';

  @override
  String get aboutSection => 'మా గురించి';

  @override
  String get shareProfile => 'ప్రొఫైల్‌ను షేర్ చేయండి';

  @override
  String get loadingAstrologer => 'జ్యోతిష్కుల వివరాలను లోడ్ చేస్తోంది...';

  @override
  String get failedToLoadAstrologer =>
      'జ్యోతిష్కుల వివరాలను లోడ్ చేయడంలో విఫలమైంది.';

  @override
  String get authenticationRequired =>
      'ప్రామాణీకరణ అవసరం. దయచేసి లాగిన్ అవ్వండి.';

  @override
  String securityCheckFailed(Object error) {
    return 'భద్రతా తనిఖీ విఫలమైంది: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ఇప్పుడు మీ వ్యక్తిగత జ్యోతిష్కుడు.';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ఇష్టమైన వాటి నుండి $name తీసివేయబడింది';
  }

  @override
  String get toggleFavoriteError => 'ఇష్టమైన స్థితిని నవీకరించడంలో విఫలమైంది';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 విద్య: $education\n📜 అర్హత: $qualification\n⏳ అనుభవం: $experience';
  }

  @override
  String get notProvided => 'అందించబడలేదు';

  @override
  String reviews(Object count) {
    return '($count సమీక్షలు)';
  }

  @override
  String get specialties => 'ప్రత్యేకతలు';

  @override
  String get experience => 'అనుభవం';

  @override
  String get qualification => 'అర్హత';

  @override
  String get education => 'విద్య';

  @override
  String get recoveryTips =>
      '• ఈ సమాచారం యొక్క స్క్రీన్‌షాట్ తీసుకోండి\n• దీన్ని సురక్షితమైన స్థలంలో నిల్వ చేయండి\n• ఎవరితోనూ భాగస్వామ్యం చేయవద్దు\n• ఇది ఒక్కసారి మాత్రమే చూపబడుతుంది';
}
