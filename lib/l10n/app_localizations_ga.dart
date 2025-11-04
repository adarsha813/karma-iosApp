// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get settingsTitle => 'Socruithe';

  @override
  String get notificationSettings => 'Socruithe Fógra';

  @override
  String get privacySettings => 'Socruithe Príobháideachta';

  @override
  String get accountSettings => 'Socruithe Cuntais';

  @override
  String get languageSettings => 'Socruithe Teanga';

  @override
  String get languageChanged => 'Athraíodh an teanga';

  @override
  String get existingUserButton => 'Is úsáideoir reatha mé';

  @override
  String get chooseCountryTitle => 'Roghnaigh Tír';

  @override
  String get yesText => 'Tá';

  @override
  String get noText => 'Níl';

  @override
  String get appBarTitle => 'Socruithe Próifíle';

  @override
  String get userIdLabel => 'Aitheantas Úsáideora *';

  @override
  String get nameLabel => 'Ainm';

  @override
  String get birthCountryLabel => 'Tír Bhreithe';

  @override
  String get birthCityLabel => 'Cathair Bhreithe';

  @override
  String get countrySelectionTitle => 'Roghnaigh do thír';

  @override
  String get maleLabel => 'Fireann';

  @override
  String get femaleLabel => 'Baineann';

  @override
  String get birthDateLabel => 'Dáta Breithe';

  @override
  String get birthDatePlaceholder => 'Roghnaigh Dáta Breithe';

  @override
  String get birthTimeLabel => 'Am Breithe';

  @override
  String get birthTimePlaceholder => 'Roghnaigh Am Breithe';

  @override
  String get saveProfileButton => 'Sábháil Próifíl';

  @override
  String get noCitiesFound => 'Níor aimsíodh aon chathracha';

  @override
  String cityPlaceholder(Object country) {
    return 'Cuir isteach cathair i $country';
  }

  @override
  String get countryFirstPlaceholder => 'Roghnaigh tír ar dtús';

  @override
  String get versionHistoryTitle => 'Stair Leagan';

  @override
  String get notSetText => 'Gan socrú';

  @override
  String nameHistory(Object name) {
    return 'Ainm: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Cathair: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Tír: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Inscne: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dáta Breithe: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Am Breithe: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Suíomh: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Stát: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Nuashonraithe ar $date';
  }

  @override
  String get userIdRequired => 'Tá ID úsáideora ag teastáil';

  @override
  String get profileSaved => 'Sábháilte go rathúil an phróifíl';

  @override
  String get saveFailed => 'Theip ar an bpróifíl a shábháil';

  @override
  String get errorPrefix => 'Earráid:';

  @override
  String get onboardingChooseLanguage => 'Roghnaigh Do Theanga';

  @override
  String get onboardingChooseLanguageDesc =>
      'Roghnaigh do theanga is fearr leat le leanúint ar aghaidh.';

  @override
  String get onboardingWhatIsAstrology => 'Cad is Réalteolaíocht ann?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Is í an réalteolaíocht staidéar na gcorp neamhaí...';

  @override
  String get onboardingWhyUseApp => 'Cén fáth a n-úsáidfeá an aip seo?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Faigh horoscóip phearsantaithe, réamhaisnéisí laethúla, agus treoir chun cinntí eolasacha a dhéanamh.';

  @override
  String get onboardingHowToUse => 'Conas an aip seo a úsáid?';

  @override
  String get onboardingHowToUseDesc =>
      'Déan nascleanúint go héasca, seiceáil horoscóip laethúla, agus bainistigh do phróifíl le haghaidh tuartha cruinne.';

  @override
  String get onboardingGetStarted => 'Tosaigh';

  @override
  String get onboardingNewUser => 'Úsáideoir Nua';

  @override
  String get onboardingExistingUser => 'Úsáideoir atá ann cheana';

  @override
  String get onboardingBack => 'Ar ais';

  @override
  String get onboardingNext => 'Ar Aghaidh';

  @override
  String get userIdNotFound =>
      'Níor aimsíodh ID úsáideora. Logáil isteach nó socraigh do phróifíl le do thoil.';

  @override
  String get clearNotificationsTitle => 'Fógraí Glan';

  @override
  String get clearNotificationsMessage =>
      'An bhfuil tú cinnte gur mian leat gach fógra a ghlanadh?';

  @override
  String get clearNotificationsSuccess =>
      'Glanadh na fógraí go léir go rathúil.';

  @override
  String get clearHoroscopeTitle => 'Horoscóp Glan';

  @override
  String get clearHoroscopeMessage =>
      'An bhfuil tú cinnte gur mian leat do shonraí horoscóipe a ghlanadh?';

  @override
  String get clearHoroscopeSuccess => 'Glanadh an horoscóp go rathúil.';

  @override
  String get clearChatTitle => 'Glan Stair Comhrá';

  @override
  String get clearChatMessage =>
      'An bhfuil tú cinnte gur mian leat do stair comhrá go léir a scriosadh?';

  @override
  String get clearChatLocal => 'Glanadh an comhrá go háitiúil.';

  @override
  String get deleteAccountTitle => 'Scrios Cuntas';

  @override
  String get deleteAccountMessage =>
      'An bhfuil tú cinnte gur mian leat do chuntas a scriosadh? Glanfaidh sé seo do stair comhrá agus fógraí go léir freisin.';

  @override
  String get deleteAccountSuccess =>
      'Tá do chuntas agus na sonraí go léir bainte.';

  @override
  String get deleteAccountError => 'Earráid ag scriosadh cuntais';

  @override
  String get logoutTitle => 'Logáil Amach';

  @override
  String get logoutMessage => 'An bhfuil tú cinnte gur mian leat logáil amach?';

  @override
  String get termsPrivacyTitle => 'Téarmaí & Príobháideacht';

  @override
  String get privacyPolicyTitle => 'Polasaí Príobháideachais';

  @override
  String get termsConditionsTitle => 'Téarmaí & Coinníollacha';

  @override
  String get dataControlTitle => 'Rialú Sonraí';

  @override
  String get cancelButton => 'Cealaigh';

  @override
  String get confirmButton => 'Deimhnigh';

  @override
  String get clearQuestionsSuccess =>
      'Scriosadh na ceisteanna go léir go rathúil.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tiarna';

  @override
  String get startLabel => 'Tosaigh';

  @override
  String get recoverAccount => 'Aisghabháil Cuntas';

  @override
  String get endLabel => 'Deireadh';

  @override
  String get startDateLabel => 'Dáta Tosaigh';

  @override
  String get endDateLabel => 'Dáta Deiridh';

  @override
  String get notAvailable => 'Níl sé ar fáil';

  @override
  String get noData => 'Gan aon sonraí';

  @override
  String get unknownError => 'Earráid anaithnid';

  @override
  String get retryButton => 'Déan iarracht eile';

  @override
  String get kundaliGeneratorTitle => 'Gineadóir Kundali';

  @override
  String get natalChartTitle => 'Cairt Breithe';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Ráshi';

  @override
  String get ascDegreeLabel => 'Céim Ardaitheach';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Anaithnid';

  @override
  String get clearHoroscope => 'Horoscóp Glan';

  @override
  String get clearNotifications => 'Fógraí Glan';

  @override
  String get clearChatHistory => 'Glan Stair Comhrá';

  @override
  String get logout => 'Logáil Amach';

  @override
  String get deleteAccount => 'Scrios Cuntas';

  @override
  String get allFieldsRequired => 'Tá gach réimse riachtanach.';

  @override
  String get accountRecoveredSuccess => 'Aisghabhadh an cuntas go rathúil.';

  @override
  String get recoveryFailed =>
      'Theip ar an aisghabháil. Seiceáil do chuid faisnéise.';

  @override
  String get recoverySecretLabel => 'Rún Aisghabhála:';

  @override
  String get aboutUsTitle => 'Fúinn';

  @override
  String get aboutOurCompany => 'Maidir lenár gCuideachta';

  @override
  String get aboutCompanyDescription =>
      'Táimid tiomanta don taithí réalteolaíochta is fearr a sholáthar dár n-úsáideoirí.';

  @override
  String get ourMission => 'Ár Misean';

  @override
  String get missionDescription =>
      'Chun léargais réalteolaíochta cruinne agus pearsantaithe a sholáthar chun cabhrú le húsáideoirí cinntí eolasacha a dhéanamh ina saol.';

  @override
  String get ourVision => 'Ár bhFís';

  @override
  String get visionDescription =>
      'Chun bheith ar an ardán réalteolaíochta is iontaofa, ag comhcheangal teicneolaíochta agus eagna ársa.';

  @override
  String get ourValues => 'Ár Luachanna';

  @override
  String get valuesDescription =>
      'Ionracas, Cruinneas, Dearadh Dírithe ar an Úsáideoir, agus Nuálaíocht Leanúnach.';

  @override
  String get contactUs => 'Déan Teagmháil Linn';

  @override
  String get contactEmail => 'Ríomhphost: support@yourcompany.com';

  @override
  String get contactWebsite => 'Suíomh Gréasáin: www.yourcompany.com';

  @override
  String get customerSupport => 'Tacaíocht do Chustaiméirí';

  @override
  String get supportHeroTitle => 'Táimid anseo chun cabhrú leat';

  @override
  String get supportHeroDescription =>
      'Líon isteach an fhoirm thíos agus rachaidh ár bhfoireann tacaíochta i dteagmháil leat a luaithe is féidir.';

  @override
  String get yourName => 'D\'ainm';

  @override
  String get yourEmail => 'Do Ríomhphost';

  @override
  String get message => 'Teachtaireacht';

  @override
  String get enterEmail => 'Cuir isteach do sheoladh ríomhphoist';

  @override
  String get enterValidEmail => 'Cuir isteach seoladh ríomhphoist bailí';

  @override
  String enterField(Object fieldName) {
    return 'Cuir isteach $fieldName';
  }

  @override
  String get send => 'Seol';

  @override
  String get sending => 'Ag seoladh...';

  @override
  String get emailSentSuccess => '✅ Seoladh an ríomhphost go rathúil!';

  @override
  String get emailSendFailed => '❌ Theip ar ríomhphost a sheoladh';

  @override
  String get astroDictionaryTitle => 'Foclóir Réalteolaíochta';

  @override
  String get searchTermsHint => 'Téarmaí cuardaigh...';

  @override
  String get noTermsFound => 'Níor aimsíodh aon téarmaí';

  @override
  String get buyQuestionsTitle => 'Ceisteanna Ceannaigh';

  @override
  String get userNotAuthenticated => 'Níl an t-úsáideoir fíordheimhnithe';

  @override
  String get loadStoreDataFailed => 'Theip ar shonraí an tsiopa a lódáil';

  @override
  String get missingAuthToken => 'Comhartha údaraithe ar iarraidh';

  @override
  String get merchantDisplayName => 'Aip Comhrá Astro';

  @override
  String get paymentSuccessful => '✅ Íocaíocht rathúil! Ceist seolta';

  @override
  String paymentFailed(Object error) {
    return '❌ Theip ar an íocaíocht: $error';
  }

  @override
  String get yourBalance => 'Do Iarmhéid';

  @override
  String questionsBalance(Object count) {
    return 'Ceisteanna $count';
  }

  @override
  String get availableOffers => 'Tairiscintí atá ar Fáil';

  @override
  String questionsCount(Object count) {
    return 'Ceist $count';
  }

  @override
  String get buyButton => 'Ceannaigh';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscóp Laethúil';

  @override
  String get userIdMissing => 'Tá ID úsáideora ar iarraidh';

  @override
  String get fetchHoroscopesFailed => 'Theip ar horoscopes a fháil';

  @override
  String get noHoroscopeFound => 'Níor aimsíodh aon horoscóp.';

  @override
  String get signLabel => 'Sínigh';

  @override
  String get todayLabel => 'Inniu';

  @override
  String get yesterdayLabel => 'Inné';

  @override
  String get thisWeekLabel => 'An tSeachtain seo';

  @override
  String get lastMonthLabel => 'An Mhí Seo Caite';

  @override
  String get chatTitle => 'Comhrá';

  @override
  String get typeYourQuestionHint => 'Clóscríobh do cheist...';

  @override
  String get paymentRequired => 'Íocaíocht Riachtanach';

  @override
  String get paymentRequiredMessage =>
      'Tá do cheisteanna saor in aisce úsáidte agat. Íoc ₹50 le leanúint ar aghaidh.';

  @override
  String get payNowButton => 'Íoc Anois';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ceisteanna saora fágtha';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ceisteanna íoctha fágtha';
  }

  @override
  String get thankYouFeedback => 'Go raibh maith agat as d\'aiseolas!';

  @override
  String get ratingSubmitted => 'Rátáil curtha isteach!';

  @override
  String get setUserIdFirst =>
      'Socraigh d\'Aitheantas Úsáideora ar dtús le do thoil';

  @override
  String get failedToFetchPrevious =>
      'Theip ar cheisteanna agus freagraí roimhe seo a fháil';

  @override
  String errorOccurred(Object error) {
    return 'Earráid: $error';
  }

  @override
  String get drawerAstroProfile => 'Próifíl Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscóp Laethúil';

  @override
  String get drawerBuyQuestions => 'Ceisteanna Ceannaigh';

  @override
  String get drawerAstroDictionary => 'Foclóir Réalteolaíochta';

  @override
  String get drawerSettings => 'Socruithe';

  @override
  String get drawerCustomerSupport => 'Tacaíocht do Chustaiméirí';

  @override
  String get drawerAbout => 'Maidir';

  @override
  String get drawerProfileSettings => 'Socruithe Próifíle';

  @override
  String get demoNotificationTitle => '🔔 Fógra Taispeána';

  @override
  String get demoNotificationBody => 'Is fógra tástála é seo ó d\'aip!';

  @override
  String get notificationsTitle => 'Fógraí';

  @override
  String get noNotifications => 'Gan aon fhógraí';

  @override
  String get allTab => 'Gach';

  @override
  String get markAllAsRead => 'Marcáil gach rud mar léite';

  @override
  String get notificationMarkedRead => 'Fógra marcáilte mar léite';

  @override
  String get failedToLoadNotifications => 'Theip ar fhógraí a lódáil';

  @override
  String get failedToMarkRead => 'Theip ar mharcáil mar léite';

  @override
  String get failedToMarkAllRead => 'Theip ar gach rud a mharcáil mar léite';

  @override
  String get socketConnected => 'Soicéad ceangailte';

  @override
  String get socketDisconnected => 'Soicéad dícheangailte';

  @override
  String get newNotificationReceived => 'Fógra nua faighte';

  @override
  String get generalCategory => 'Ginearálta';

  @override
  String get horoscopeCategory => 'Horoscóp';

  @override
  String get chatCategory => 'Comhrá';

  @override
  String get systemCategory => 'Córas';

  @override
  String get updateCategory => 'Nuashonruithe';

  @override
  String get howToAskTitle => 'Conas a Iarraidh';

  @override
  String get noQuestionsAvailable => 'Níl aon cheisteanna ar fáil';

  @override
  String get failedToLoadQuestions => 'Theip ar lódáil na ceisteanna';

  @override
  String get pullToRefresh => 'Tarraing chun athnuachan';

  @override
  String get careerCategory => 'Gairme';

  @override
  String get loveCategory => 'Grá & Caidrimh';

  @override
  String get healthCategory => 'Sláinte';

  @override
  String get financeCategory => 'Airgeadas';

  @override
  String get familyCategory => 'Teaghlach';

  @override
  String get educationCategory => 'Oideachas';

  @override
  String get travelCategory => 'Taisteal';

  @override
  String get spiritualCategory => 'Spioradálta';

  @override
  String get profileLoaded => 'Luchtaithe go rathúil an phróifíl';

  @override
  String get imageUploaded => 'Uaslódáilte go rathúil an íomhá';

  @override
  String get savedInformationConfirmation =>
      'Tá an fhaisnéis seo sábháilte agam';

  @override
  String get noHistoryAvailable => 'Níl aon stair ar fáil';

  @override
  String get missingUserIdError => 'Tá ID úsáideora ag teastáil';

  @override
  String get networkError => 'Earráid líonra. Déan iarracht arís.';

  @override
  String get timeoutError => 'Iarratas imithe thar an am';

  @override
  String get genericError => 'Chuaigh rud éigin mícheart';

  @override
  String get reactionUpdateError => 'Theip ar an imoibriú a nuashonrú';

  @override
  String get noSearchResults => 'Níor aimsíodh aon torthaí cuardaigh';

  @override
  String get clearSearch => 'Glan an cuardach';

  @override
  String get resultsFound => 'Torthaí a fuarthas';

  @override
  String get recoverySecretHint =>
      'B’fhéidir nach n-oibreoidh cóipeáil-ghreamú, clóscríobh de láimh';

  @override
  String get recoverAccountDescription =>
      'Lean na céimeanna seo chun do chuntas a aisghabháil';

  @override
  String get processingLabel => 'Ag próiseáil...';

  @override
  String get clearChatSuccess => 'Glanadh an comhrá go rathúil';

  @override
  String get notificationsEnabled => 'Fógraí cumasaithe';

  @override
  String get notificationsDisabled => 'Fógraí díchumasaithe';

  @override
  String get securityNotice => 'Tá do shonraí criptithe agus stóráilte go slán';

  @override
  String get loading => 'Ag lódáil...';

  @override
  String get selectLanguage => 'Roghnaigh Teanga';

  @override
  String get onboardingGetStartedDesc => 'Tosaigh trí do theanga a roghnú';

  @override
  String get accountRecoveryTitle => '🔐 Sonraí Aisghabhála Cuntais';

  @override
  String get recoveryInstructions =>
      'Sábháil an fhaisnéis seo go slán le do thoil. Beidh sí ag teastáil uait chun do chuntas a aisghabháil.';

  @override
  String get importantNotice => '⚠️ Tábhachtach:';

  @override
  String get astrologerProfileTitle => 'Próifíl Réalteolaithe';

  @override
  String get personalAstrologer => 'Réalteolaithe Pearsanta';

  @override
  String get makePersonalAstrologer => 'Déan Réalteolaithe Pearsanta';

  @override
  String get favoriteDescription =>
      'Tabharfar tús áite do do cheisteanna don réalteolaí seo. Mura bhfuil sé ar fáil, cabhróidh réalteolaí cáilithe eile leat.';

  @override
  String get educationQualifications => 'Oideachas & Cáilíochtaí';

  @override
  String get aboutSection => 'Maidir';

  @override
  String get shareProfile => 'Comhroinn Próifíl';

  @override
  String get loadingAstrologer => 'Ag lódáil sonraí an réalteolaithe...';

  @override
  String get failedToLoadAstrologer =>
      'Theip ar shonraí an réalteolaithe a lódáil';

  @override
  String get authenticationRequired =>
      'Tá fíordheimhniú ag teastáil. Logáil isteach le do thoil.';

  @override
  String securityCheckFailed(Object error) {
    return 'Theip ar an seiceáil slándála: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 Is é $name d\'Astrólaí Pearsanta anois';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Baineadh $name de na cinn is ansa liom';
  }

  @override
  String get toggleFavoriteError => 'Theip ar stádas is fearr leat a nuashonrú';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Oideachas: $education\n📜 Cáilíocht: $qualification\n⏳ Taithí: $experience';
  }

  @override
  String get notProvided => 'Níor soláthraíodh';

  @override
  String reviews(Object count) {
    return '($count léirmheasanna)';
  }

  @override
  String get specialties => 'Speisialtachtaí';

  @override
  String get experience => 'Taithí';

  @override
  String get qualification => 'Cáilíocht';

  @override
  String get education => 'Oideachas';

  @override
  String get recoveryTips =>
      '• Glac pictiúr scáileáin den fhaisnéis seo\n• Stóráil in áit shábháilte í\n• Ná roinn le duine ar bith í\n• Ní thaispeánfar í seo ach uair amháin';
}
