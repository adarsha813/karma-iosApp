// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Samoan (`sm`).
class AppLocalizationsSm extends AppLocalizations {
  AppLocalizationsSm([String locale = 'sm']) : super(locale);

  @override
  String get settingsTitle => 'Fa\'atonu';

  @override
  String get notificationSettings => 'Fa\'aaliga Fa\'aaliga';

  @override
  String get privacySettings => 'Fa\'atonu Fa\'atonu';

  @override
  String get accountSettings => 'Fa\'atonu Fa\'amatalaga';

  @override
  String get languageSettings => 'Gagana Fa\'atonu';

  @override
  String get languageChanged => 'Ua suia le gagana';

  @override
  String get existingUserButton => 'O aʻu o se tagata faʻaoga o loʻo i ai nei';

  @override
  String get chooseCountryTitle => 'Filifili Atunuu';

  @override
  String get yesText => 'Ioe';

  @override
  String get noText => 'Leai';

  @override
  String get appBarTitle => 'Fa\'asologa o Tala\'aga';

  @override
  String get userIdLabel => 'ID fa\'aoga *';

  @override
  String get nameLabel => 'Igoa';

  @override
  String get birthCountryLabel => 'Atunuu Fanau';

  @override
  String get birthCityLabel => 'Aai Fanau';

  @override
  String get countrySelectionTitle => 'Filifili lou atunuu';

  @override
  String get maleLabel => 'Male';

  @override
  String get femaleLabel => 'Fafine';

  @override
  String get birthDateLabel => 'Aso Fanau';

  @override
  String get birthDatePlaceholder => 'Filifili Aso Fanau';

  @override
  String get birthTimeLabel => 'Taimi Fanau mai';

  @override
  String get birthTimePlaceholder => 'Filifili Taimi Fanau';

  @override
  String get saveProfileButton => 'Fa\'asaoina Tala\'aga';

  @override
  String get noCitiesFound => 'Leai ni aai na maua';

  @override
  String cityPlaceholder(Object country) {
    return 'Ulufale le aai i $country';
  }

  @override
  String get countryFirstPlaceholder => 'Filifili muamua le atunuu';

  @override
  String get versionHistoryTitle => 'Tala fa\'asolopito';

  @override
  String get notSetText => 'E le\'i setiina';

  @override
  String nameHistory(Object name) {
    return 'Igoa: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Aai: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Atunu\'u: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Itupa: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Aso Fanau: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Taimi Fanau: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Nofoaga: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Sone Taimi: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Setete: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Fa\'afou ile $date';
  }

  @override
  String get userIdRequired => 'E mana\'omia le ID fa\'aoga';

  @override
  String get profileSaved => 'Ua manuia le teuina o talaaga';

  @override
  String get saveFailed => 'Ua le mafai ona sefe le talaaga';

  @override
  String get errorPrefix => 'Sese:';

  @override
  String get onboardingChooseLanguage => 'Filifili Lau Gagana';

  @override
  String get onboardingChooseLanguageDesc =>
      'Filifili lau gagana e te mana\'o e fa\'aauau.';

  @override
  String get onboardingWhatIsAstrology => 'O le a le Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology o le suʻesuʻega anamua o gaioiga faʻaselesitila ma o latou aafiaga i le olaga o le tagata, e ofoina atu ai faʻamatalaga i uiga, mafutaga, ma mea e tutupu i le olaga.';

  @override
  String get onboardingWhyUseApp => 'Aisea e Fa\'aaoga ai Lenei App?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Maua sa\'o, fa\'ata\'ita\'iga a tagata ma ta\'iala e fa\'atatau i lau siata fanau. Fai fa\'ai\'uga fa\'apitoa ma valo\'aga i aso ta\'itasi ma fautuaga fa\'apitoa mai tagata su\'esu\'e fa\'apitoa.';

  @override
  String get onboardingHowToUse => 'Fa\'afefea ona Fa\'aoga Lenei App?';

  @override
  String get onboardingHowToUseDesc =>
      'Na\'o le fa\'aofiina o lou aso fanau, taimi sa\'o, nofoaga na fanau ai, ma so\'o se isi fa\'amatalaga talafeagai e amata vave ai. Saili su\'esu\'ega i aso ta\'itasi, fai fesili i tagata su\'esu\'e fa\'apitoa, ma pulea lau fa\'amatalaga mo fa\'amatalaga sa\'o, fa\'apitoa—leai se saini e mana\'omia.';

  @override
  String get onboardingGetStarted => 'Amata';

  @override
  String get onboardingNewUser => 'Tagata fou';

  @override
  String get onboardingExistingUser => 'Tagata fa\'aoga o iai nei';

  @override
  String get onboardingBack => 'Tua';

  @override
  String get onboardingNext => 'Sosoo ai';

  @override
  String get userIdNotFound =>
      'E le\'i maua le ID fa\'aoga. Fa\'amolemole saini pe seti lau talaaga.';

  @override
  String get clearNotificationsTitle => 'Fa\'ailoa manino';

  @override
  String get clearNotificationsMessage =>
      'E te mautinoa e te mana\'o e tape uma fa\'amatalaga?';

  @override
  String get clearNotificationsSuccess => 'Na manuia fa\'aaliga uma.';

  @override
  String get clearHoroscopeTitle => 'Fa\'aaliga manino';

  @override
  String get clearHoroscopeMessage =>
      'E te mautinoa e te mana\'o e tape au fa\'amatalaga o le horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Ua manuia le kilia o le Horoscope.';

  @override
  String get clearChatTitle => 'Fa\'amama Tala Talafaasolopito';

  @override
  String get clearChatMessage =>
      'E te mautinoa e te mana\'o e tape uma au tala fa\'asolopito?';

  @override
  String get clearChatLocal => 'Ua kilia talanoaga i le lotoifale.';

  @override
  String get deleteAccountTitle => 'Ave\'ese Fa\'amatalaga';

  @override
  String get deleteAccountMessage =>
      'E te mautinoa e te mana\'o e tape lau tala? Ole a fa\'amama uma ai lau tala fa\'asolopito ma fa\'amatalaga.';

  @override
  String get deleteAccountSuccess => 'Ua aveese lau tala ma fa\'amaumauga uma.';

  @override
  String get deleteAccountError => 'Sese ile tapeina ole tala';

  @override
  String get logoutTitle => 'Saini ese j';

  @override
  String get logoutMessage => 'E te mautinoa e te mana\'o e alu ese?';

  @override
  String get termsPrivacyTitle => 'Tulaga & Fa\'alilolilo';

  @override
  String get privacyPolicyTitle => 'Faiga Fa\'alilolilo';

  @override
  String get termsConditionsTitle => 'Tuutuuga & Tulaga';

  @override
  String get dataControlTitle => 'Puleaina o Faamatalaga';

  @override
  String get cancelButton => 'Fa\'aleaogaina';

  @override
  String get confirmButton => 'Faamaonia';

  @override
  String get clearQuestionsSuccess => 'Ua soloi lelei fesili uma.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Alii e';

  @override
  String get startLabel => 'Amata';

  @override
  String get recoverAccount => 'Toe Fa\'afo\'i Fa\'amatalaga';

  @override
  String get endLabel => 'Fa\'ai\'uga';

  @override
  String get startDateLabel => 'Aso Amata';

  @override
  String get endDateLabel => 'Aso Fa\'ai\'u';

  @override
  String get notAvailable => 'Le avanoa';

  @override
  String get noData => 'Leai ni fa\'amatalaga';

  @override
  String get unknownError => 'Sese le iloa';

  @override
  String get retryButton => 'Toe taumafai';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Natal Siata';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Fa\'ailoga Maualuga';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Le iloa';

  @override
  String get clearHoroscope => 'Fa\'aaliga manino';

  @override
  String get clearNotifications => 'Fa\'ailoa manino';

  @override
  String get clearChatHistory => 'Fa\'amama Tala Talafaasolopito';

  @override
  String get logout => 'Saini ese j';

  @override
  String get deleteAccount => 'Ave\'ese Fa\'amatalaga';

  @override
  String get allFieldsRequired => 'E mana\'omia uma fanua.';

  @override
  String get accountRecoveredSuccess => 'Fa\'aola manuia le tala.';

  @override
  String get recoveryFailed => 'Ua le manuia. Siaki lau fa\'amatalaga.';

  @override
  String get recoverySecretLabel => 'Toe Fa\'aleleia Mea lilo:';

  @override
  String get aboutUsTitle => 'Faatatau ia tatou';

  @override
  String get aboutOurCompany => 'E uiga i le tatou Kamupani';

  @override
  String get aboutCompanyDescription =>
      'I Karma, matou te fesoasoani ia te oe e faʻaalia lou ala moni o le olaga e ala i le poto le tumau o Vedic astrology. O fa\'amatalaga uma e sau mai tagata su\'esu\'e fa\'apitoa, fa\'apitoa, e fa\'atatau i lau siata fanau fa\'apitoa. Mai su\'esu\'ega i aso ta\'itasi e o\'o atu i ta\'iala fa\'apitoa, ua fa\'aavanoaina e Karma le poto anamua i le silia ma le 100 gagana.';

  @override
  String get ourMission => 'La Tatou Misiona';

  @override
  String get missionDescription =>
      'O la matou misiona e faigofie: ia tuʻuina atu taʻiala faʻapitoa, taʻitaʻia e tagata e faʻamalosia oe e faia faʻamatalaga mautinoa, faʻamaonia. O valo\'aga ma fa\'atalanoaga uma e atagia mai ai tausaga o tomai fa\'apolofesa, ae le\'o fa\'autometi algorithms.';

  @override
  String get ourVision => 'La Tatou Vaaiga';

  @override
  String get visionDescription =>
      'Matou te taumafai e avea ma faʻavae sili ona faʻalagolago i le lalolagi mo Vedic astrology, fesoasoani i tagata i soʻo se mea ia malamalama ia i latou lava, a latou filifiliga, ma la latou malaga i le olaga ma le manino ma le mautinoa.';

  @override
  String get ourValues => 'O tatou Tulaga Faatauaina';

  @override
  String get valuesDescription =>
      'I Karma, matou te faʻatauaina le moni, saʻo, ma le faʻatuatuaina. Matou te tuuto atu i le ofoina atu o taʻiala e le gata ina saʻo ae aoga foi, e fesoasoani ia te oe e faʻatautaia ai le olaga ma le malamalama ma le mautinoa.';

  @override
  String get contactUs => 'Faafesootai matou';

  @override
  String get contactEmail => 'Imeli: support@yourcompany.com';

  @override
  String get contactWebsite => 'Upega tafa\'ilagi: www.yourcompany.com';

  @override
  String get customerSupport => 'Lagolago Tagata Fa\'atau';

  @override
  String get supportHeroTitle => 'Ua matou i ai e Fesoasoani';

  @override
  String get supportHeroDescription =>
      'Faatumu le fomu o lo\'o i lalo ma o le a toe fo\'i atu la matou \'au lagolago ia te oe i se taimi vave e mafai ai.';

  @override
  String get yourName => 'Lou Suafa';

  @override
  String get yourEmail => 'Lau Email';

  @override
  String get message => 'Savali';

  @override
  String get enterEmail => 'Ulufale lau imeli';

  @override
  String get enterValidEmail => 'Ulufale se tuatusi imeli aoga';

  @override
  String enterField(Object fieldName) {
    return 'Ulufale $fieldName';
  }

  @override
  String get send => 'Auina atu';

  @override
  String get sending => 'Tuuina atu...';

  @override
  String get emailSentSuccess => '✅ Na manuia le lafoina o imeli!';

  @override
  String get emailSendFailed => '❌ Ua le mafai ona lafo imeli';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Su\'e upu...';

  @override
  String get noTermsFound => 'Leai ni upu na maua';

  @override
  String get buyQuestionsTitle => 'Fa\'atau Fesili';

  @override
  String get userNotAuthenticated => 'E le fa\'amaonia le tagata fa\'aoga';

  @override
  String get loadStoreDataFailed =>
      'Ua le mafai ona la\'uina fa\'amatalaga teu';

  @override
  String get missingAuthToken => 'Ua misi le fa\'ailoga fa\'amaonia';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Manuia le totogi! Fesili lafo';

  @override
  String paymentFailed(Object error) {
    return '❌ Ua le mafai ona totogi: $error';
  }

  @override
  String get yourBalance => 'Lou Paleni';

  @override
  String questionsBalance(Object count) {
    return '$count Fesili';
  }

  @override
  String get availableOffers => 'Avanoa ofo';

  @override
  String questionsCount(Object count) {
    return '$count Fesili';
  }

  @override
  String get buyButton => 'Fa\'atau';

  @override
  String get dailyHoroscopeTitle => '🌟 Fa\'ailo o aso ta\'itasi';

  @override
  String get userIdMissing => 'O lo\'o misi le ID fa\'aoga';

  @override
  String get fetchHoroscopesFailed => 'Ua le mafai ona aumai su\'esu\'ega';

  @override
  String get noHoroscopeFound => 'Leai se su\'esu\'ega na maua.';

  @override
  String get signLabel => 'Faailoga';

  @override
  String get todayLabel => 'I aso nei';

  @override
  String get yesterdayLabel => 'O ananafi';

  @override
  String get thisWeekLabel => 'Ole Vaiaso lenei';

  @override
  String get lastMonthLabel => 'O le masina ua mavae';

  @override
  String get chatTitle => 'Talanoaga';

  @override
  String get typeYourQuestionHint => 'Tusi lau fesili...';

  @override
  String get paymentRequired => 'Totogi Manaomia';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Ua e fa\'aogaina au fesili maua fua. Totogi $amount e fa\'aauau.';
  }

  @override
  String get payNowButton => 'Totogi Nei';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count fesili saoloto o totoe';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count fesili totogi o totoe';
  }

  @override
  String get thankYouFeedback => 'Faafetai mo lou finagalo faaalia!';

  @override
  String get ratingSubmitted => 'Fa\'ailoga ua tu\'uina atu!';

  @override
  String get setUserIdFirst => 'Fa\'amolemole seti muamua lau ID Fa\'aoga';

  @override
  String get failedToFetchPrevious =>
      'Ua le mafai ona aumai fesili ma tali muamua';

  @override
  String errorOccurred(Object error) {
    return 'Sese: $error';
  }

  @override
  String get drawerAstroProfile => 'Tala\'aga a Astro';

  @override
  String get drawerDailyHoroscope => 'Fa\'ailo o aso ta\'itasi';

  @override
  String get drawerBuyQuestions => 'Fa\'atau Fesili';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Fa\'atonu';

  @override
  String get drawerCustomerSupport => 'Lagolago Tagata Fa\'atau';

  @override
  String get drawerAbout => 'E uiga i';

  @override
  String get drawerProfileSettings => 'Fa\'asologa o Tala\'aga';

  @override
  String get demoNotificationTitle => '🔔 Fa\'aaliga Fa\'aaliga';

  @override
  String get demoNotificationBody =>
      'Ole fa\'aaliga lea ole su\'ega mai lau app!';

  @override
  String get notificationsTitle => 'Fa\'asilasilaga';

  @override
  String get noNotifications => 'Leai ni fa\'amatalaga';

  @override
  String get allTab => 'O mea uma';

  @override
  String get markAllAsRead => 'Faailoga uma ua faitau';

  @override
  String get notificationMarkedRead => 'Fa\'asilasilaga fa\'ailoga ua faitau';

  @override
  String get failedToLoadNotifications => 'Ua le mafai ona uta fa\'amatalaga';

  @override
  String get failedToMarkRead => 'Ua le mafai ona makaina ua faitau';

  @override
  String get failedToMarkAllRead => 'Ua le mafai ona maka uma ua faitau';

  @override
  String get socketConnected => 'Socket so\'o';

  @override
  String get socketDisconnected => 'Ua motu le so\'o';

  @override
  String get newNotificationReceived => 'Fa\'asilasilaga fou ua maua';

  @override
  String get generalCategory => 'lautele';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Talanoaga';

  @override
  String get systemCategory => 'Faiga';

  @override
  String get updateCategory => 'Fa\'afouga';

  @override
  String get howToAskTitle => 'Auala e Fesili';

  @override
  String get noQuestionsAvailable => 'E leai ni fesili e maua';

  @override
  String get failedToLoadQuestions => 'Ua le mafai ona utaina fesili';

  @override
  String get pullToRefresh => 'Toso e faafou';

  @override
  String get careerCategory => 'Galuega';

  @override
  String get loveCategory => 'Alofa & Mafutaga';

  @override
  String get healthCategory => 'Soifua Maloloina';

  @override
  String get financeCategory => 'Tupe';

  @override
  String get familyCategory => 'Aiga';

  @override
  String get educationCategory => 'A\'oga';

  @override
  String get travelCategory => 'Malaga';

  @override
  String get spiritualCategory => 'Faaleagaga';

  @override
  String get profileLoaded => 'Ua manuia le utaina o talaaga';

  @override
  String get imageUploaded => 'Ua manuia le la\'uina o ata';

  @override
  String get savedInformationConfirmation =>
      'Ua Ou Faasaoina Lenei Faamatalaga';

  @override
  String get noHistoryAvailable => 'Leai se tala fa\'asolopito e maua';

  @override
  String get missingUserIdError => 'E mana\'omia le ID fa\'aoga';

  @override
  String get networkError => 'Sese feso\'otaiga. Fa\'amolemole toe taumafai.';

  @override
  String get timeoutError => 'Taimi ua uma le talosaga';

  @override
  String get genericError => 'Sa i ai se mea na faaletonu';

  @override
  String get reactionUpdateError => 'Ua le mafai ona faafou le tali';

  @override
  String get noSearchResults => 'Leai se su\'esu\'ega na maua';

  @override
  String get clearSearch => 'Fa\'amama su\'esu\'ega';

  @override
  String get resultsFound => 'I\'uga maua';

  @override
  String get recoverySecretHint =>
      'Kopi-pepe atonu e le aoga, lolomi ma le lima';

  @override
  String get recoverAccountDescription =>
      'Mulimuli i laasaga nei e toe maua ai lau tala';

  @override
  String get processingLabel => 'Fa\'agasolo...';

  @override
  String get clearChatSuccess => 'Ua manuia le kilia o talanoaga';

  @override
  String get notificationsEnabled => 'Fa\'asilasilaga ua mafai';

  @override
  String get notificationsDisabled => 'Fa\'asilasilaga fa\'aletonu';

  @override
  String get securityNotice =>
      'O au fa\'amatalaga o lo\'o fa\'ailoga ma teu lelei';

  @override
  String get loading => 'utaina...';

  @override
  String get selectLanguage => 'Filifili Gagana';

  @override
  String get onboardingGetStartedDesc => 'Amata i le filifilia o lau gagana';

  @override
  String get accountRecoveryTitle => '🔐 Fa\'amatalaga Toe Fa\'aleleia';

  @override
  String get recoveryInstructions =>
      'Fa\'amolemole fa\'asaoina lelei lenei fa\'amatalaga. E te mana\'omia e toe maua ai lau tala.';

  @override
  String get importantNotice => '⚠️ Taua:';

  @override
  String get astrologerProfileTitle => 'Tala\'aga o Tagata Fetu';

  @override
  String get personalAstrologer => 'Tagata Fetu Patino';

  @override
  String get makePersonalAstrologer => 'Fai Tagata Va\'aiga Fetu';

  @override
  String get favoriteDescription =>
      'O au fesili o le a faʻamuamua i lenei tagata suʻesuʻe fetu. Afai e lē maua, o le a fesoasoani atu se isi tagata suʻesuʻe fetu agavaa iā te oe.';

  @override
  String get educationQualifications => 'A\'oga & Fa\'ailoga';

  @override
  String get aboutSection => 'E uiga i';

  @override
  String get shareProfile => 'Fa\'asoa Fa\'amatalaga';

  @override
  String get loadingAstrologer =>
      'O lo\'o uta fa\'amatalaga a le tagata fetu...';

  @override
  String get failedToLoadAstrologer =>
      'Ua le mafai ona la\'uina fa\'amatalaga a le au fetu';

  @override
  String get authenticationRequired =>
      'Manaomia le fa\'amaoni. Faamolemole saini i totonu.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ua le mafai ona siaki le puipuiga: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ua avea nei ma sau Tagata Vaai Fetu';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Aveese $name mai mea e fiafia i ai';
  }

  @override
  String get toggleFavoriteError =>
      'Ua le mafai ona faafou le tulaga e fiafia iai';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 A\'oa\'oga: $education\n📜 Fa\'ailoga: $qualification\n⏳ Aafiaga: $experience';
  }

  @override
  String get notProvided => 'E le\'i saunia';

  @override
  String reviews(Object count) {
    return '($count iloiloga)';
  }

  @override
  String get specialties => 'Fa\'apitoa';

  @override
  String get experience => 'Aafiaga';

  @override
  String get qualification => 'Fa\'ailoga';

  @override
  String get education => 'A\'oga';

  @override
  String get recoveryTips =>
      '• Ave se fa\'amalama o lenei fa\'amatalaga\n• Teu i se nofoaga malupuipuia\n• Aua le faasoa atu i se tasi\n• O le a na\'o le tasi ona fa\'aalia';

  @override
  String get themeSettingsTitle => 'Fa\'atonu Autu';

  @override
  String get lightThemeLabel => 'Malamalama';

  @override
  String get lightThemeDescription => 'Faaaoga i taimi uma le autu malamalama';

  @override
  String get darkThemeLabel => 'Pogisa';

  @override
  String get darkThemeDescription => 'Faaaoga pea le autu pogisa';

  @override
  String get systemThemeLabel => 'Faiga';

  @override
  String get systemThemeDarkDescription =>
      'Mulimuli i le fa\'atulagaga a le polokalama mo le autu pogisa';

  @override
  String get systemThemeLightDescription =>
      'Mulimuli i le fa\'atulagaga o le polokalama mo le autu malamalama';

  @override
  String get switchToLight => 'Sui i le Moli';

  @override
  String get switchToDark => 'Sui i le Pogisa';

  @override
  String get ourTeam => 'La matou Au';

  @override
  String get teamDescription =>
      'O la matou \'au o tagata su\'esu\'e Vedic fa\'apolofesa latou te aumaia le tele o tausaga o le poto masani i le fa\'amatalaina o aafiaga o paneta ma fa\'asologa o le olaga. Faʻalagolago e se lagolago faʻapitoa ma atinaʻe au, Karma e tuʻuina atu se poto masani, faʻatuatuaina, ma le lalolagi mo tagata uma.';
}
