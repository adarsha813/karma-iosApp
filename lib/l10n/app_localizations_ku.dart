// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kurdish (`ku`).
class AppLocalizationsKu extends AppLocalizations {
  AppLocalizationsKu([String locale = 'ku']) : super(locale);

  @override
  String get settingsTitle => 'Mîheng';

  @override
  String get notificationSettings => 'Mîhengên Agahdariyê';

  @override
  String get privacySettings => 'Mîhengên Taybetîtiyê';

  @override
  String get accountSettings => 'Mîhengên Hesabê';

  @override
  String get languageSettings => 'Mîhengên Ziman';

  @override
  String get languageChanged => 'Ziman guherî';

  @override
  String get existingUserButton => 'Ez bikarhênerekî heyî me';

  @override
  String get chooseCountryTitle => 'Welat Hilbijêre';

  @override
  String get yesText => 'Erê';

  @override
  String get noText => 'Na';

  @override
  String get appBarTitle => 'Mîhengên Profîlê';

  @override
  String get userIdLabel => 'Nasnameya Bikarhêner *';

  @override
  String get nameLabel => 'Nav';

  @override
  String get birthCountryLabel => 'Welatê Jidayikbûnê';

  @override
  String get birthCityLabel => 'Bajarê Jidayikbûnê';

  @override
  String get countrySelectionTitle => 'Welatê xwe hilbijêre';

  @override
  String get maleLabel => 'Nêrî';

  @override
  String get femaleLabel => 'Mê';

  @override
  String get birthDateLabel => 'Dîroka Jidayikbûnê';

  @override
  String get birthDatePlaceholder => 'Dîroka Jidayikbûnê Hilbijêre';

  @override
  String get birthTimeLabel => 'Dema Jidayikbûnê';

  @override
  String get birthTimePlaceholder => 'Dema Jidayikbûnê Hilbijêre';

  @override
  String get saveProfileButton => 'Profîlê Tomar Bike';

  @override
  String get noCitiesFound => 'Ti bajar nehatin dîtin';

  @override
  String cityPlaceholder(Object country) {
    return 'Bajar li $country binivîse';
  }

  @override
  String get countryFirstPlaceholder => 'Pêşî welat hilbijêre';

  @override
  String get versionHistoryTitle => 'Dîroka Guhertoyan';

  @override
  String get notSetText => 'Nehatiye danîn';

  @override
  String nameHistory(Object name) {
    return 'Nav: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Bajar: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Welat: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Zayend: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dîroka Jidayikbûnê: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Dema Jidayikbûnê: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Cih: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Herêma demjimêrê: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Rewş: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Nûvekirin li ser $date';
  }

  @override
  String get userIdRequired => 'Nasnameya bikarhêner pêwîst e';

  @override
  String get profileSaved => 'Profîl bi serkeftî hat tomarkirin';

  @override
  String get saveFailed => 'Tomarkirina profîlê bi ser neket';

  @override
  String get errorPrefix => 'Şaşî:';

  @override
  String get onboardingChooseLanguage => 'Zimanê Xwe Hilbijêre';

  @override
  String get onboardingChooseLanguageDesc =>
      'Ji bo berdewamkirinê zimanê xwe yê bijarte hilbijêre.';

  @override
  String get onboardingWhatIsAstrology => 'Astrolojî çi ye?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrolojî lêkolîna cismên ezmanî ye ...';

  @override
  String get onboardingWhyUseApp => 'Çima vê sepanê bi kar tînin?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ji bo girtina biryarên agahdar, horoskopên kesane, pêşbîniyên rojane û rêbernameyê bistînin.';

  @override
  String get onboardingHowToUse => 'Meriv çawa vê sepanê bikar tîne?';

  @override
  String get onboardingHowToUseDesc =>
      'Bi hêsanî bigerin, horoskopên rojane kontrol bikin, û profîla xwe ji bo pêşbîniyên rast birêve bibin.';

  @override
  String get onboardingGetStarted => 'Dest pê bike';

  @override
  String get onboardingNewUser => 'Bikarhênerê Nû';

  @override
  String get onboardingExistingUser => 'Bikarhênerê Heyî';

  @override
  String get onboardingBack => 'Paş';

  @override
  String get onboardingNext => 'Piştî';

  @override
  String get userIdNotFound =>
      'Nasnameya bikarhêner nehat dîtin. Ji kerema xwe têkevinê an jî profîla xwe saz bikin.';

  @override
  String get clearNotificationsTitle => 'Agahdariyên Paqij Bike';

  @override
  String get clearNotificationsMessage =>
      'Ma tu piştrast î ku dixwazî hemû agahdariyan paqij bikî?';

  @override
  String get clearNotificationsSuccess =>
      'Hemû agahdarî bi serkeftî hatin paqijkirin.';

  @override
  String get clearHoroscopeTitle => 'Falkêşiya Zelal';

  @override
  String get clearHoroscopeMessage =>
      'Ma tu piştrast î ku dixwazî daneyên horoskopê xwe paqij bikî?';

  @override
  String get clearHoroscopeSuccess => 'Fal bi serkeftî hate paqijkirin.';

  @override
  String get clearChatTitle => 'Dîroka Sohbetê Paqij Bike';

  @override
  String get clearChatMessage =>
      'Ma tu piştrast î ku dixwazî hemû dîroka sohbeta xwe jê bibî?';

  @override
  String get clearChatLocal => 'Sohbet bi awayekî herêmî hat paqijkirin.';

  @override
  String get deleteAccountTitle => 'Hesabê Jê Bibe';

  @override
  String get deleteAccountMessage =>
      'Ma tu piştrast î ku dixwazî hesabê xwe jê bibî? Ev ê hemû dîrok û agahdariyên te yên sohbetê jî jê bibe.';

  @override
  String get deleteAccountSuccess =>
      'Hesabê te û hemû daneyên te hatine jêbirin.';

  @override
  String get deleteAccountError => 'Çewtî di jêbirina hesabê de çêbû';

  @override
  String get logoutTitle => 'Derkeve';

  @override
  String get logoutMessage => 'Ma tu piştrast î ku dixwazî derkevî?';

  @override
  String get termsPrivacyTitle => 'Merc û Nepenî';

  @override
  String get privacyPolicyTitle => 'Siyaseta Taybetîtiyê';

  @override
  String get termsConditionsTitle => 'Merc û Şert';

  @override
  String get dataControlTitle => 'Kontrola Daneyan';

  @override
  String get cancelButton => 'Bişûndekirin';

  @override
  String get confirmButton => 'Tesdîqkirin';

  @override
  String get clearQuestionsSuccess => 'Hemû pirs bi serkeftî hatin jêbirin.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Mirze';

  @override
  String get startLabel => 'Destpêkirin';

  @override
  String get recoverAccount => 'Hesabê Vegerîne';

  @override
  String get endLabel => 'Dawî';

  @override
  String get startDateLabel => 'Dîroka Destpêkê';

  @override
  String get endDateLabel => 'Dîroka Dawîkirinê';

  @override
  String get notAvailable => 'Ne berdest e';

  @override
  String get noData => 'Dane tune ne';

  @override
  String get unknownError => 'Çewtiyek nenas';

  @override
  String get retryButton => 'Dubare biceribîne';

  @override
  String get kundaliGeneratorTitle => 'Generatorê Kundali';

  @override
  String get natalChartTitle => 'Nexşeya Zayînê';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raşî';

  @override
  String get ascDegreeLabel => 'Pileya Bilindbûnê';

  @override
  String get vimshottariDashaTitle => 'Vimşottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Nenas';

  @override
  String get clearHoroscope => 'Falkêşiya Zelal';

  @override
  String get clearNotifications => 'Agahdariyên Paqij Bike';

  @override
  String get clearChatHistory => 'Dîroka Sohbetê Paqij Bike';

  @override
  String get logout => 'Derkeve';

  @override
  String get deleteAccount => 'Hesabê Jê Bibe';

  @override
  String get allFieldsRequired => 'Hemû qad pêwîst in.';

  @override
  String get accountRecoveredSuccess => 'Hesab bi serkeftî hate vegerandin.';

  @override
  String get recoveryFailed =>
      'Vegerandin bi ser neket. Agahiyên xwe kontrol bike.';

  @override
  String get recoverySecretLabel => 'Veşartina Vegerandinê:';

  @override
  String get aboutUsTitle => 'Çûna nava';

  @override
  String get aboutOurCompany => 'Derbarê Şirketa me de';

  @override
  String get aboutCompanyDescription =>
      'Em pabend in ku ezmûna astrolojiyê ya çêtirîn pêşkêşî bikarhênerên xwe bikin.';

  @override
  String get ourMission => 'Mîsyona me';

  @override
  String get missionDescription =>
      'Ji bo peyda kirina têgihiştinên astrolojiyê yên rast û kesane da ku alîkariya bikarhêneran bike ku di jiyana xwe de biryarên agahdar bidin.';

  @override
  String get ourVision => 'Vîzyona me';

  @override
  String get visionDescription =>
      'Ji bo ku bibe platforma astrolojiyê ya herî pêbawer, teknolojiyê û şehrezayiya kevnar bi hev re dike yek.';

  @override
  String get ourValues => 'Nirxên me';

  @override
  String get valuesDescription =>
      'Yekparebûn, Rastbûn, Sêwirana Bikarhêner-Navendî, û Nûjeniya Berdewam.';

  @override
  String get contactUs => 'Paqij bûn';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Malper: www.kompaniyawe.com';

  @override
  String get customerSupport => 'Piştgiriya Xerîdaran';

  @override
  String get supportHeroTitle => 'Em li vir in ji bo alîkariyê';

  @override
  String get supportHeroDescription =>
      'Forma li jêr dagirin û tîma piştgiriyê ya me dê di zûtirîn dem de bi we re têkilî daynin.';

  @override
  String get yourName => 'Navê Te';

  @override
  String get yourEmail => 'E-nameya Te';

  @override
  String get message => 'Agah';

  @override
  String get enterEmail => 'E-nameya xwe binivîse';

  @override
  String get enterValidEmail => 'Navnîşaneke e-nameyeke derbasdar binivîse';

  @override
  String enterField(Object fieldName) {
    return '$fieldName binivîse';
  }

  @override
  String get send => 'Şandin';

  @override
  String get sending => 'Dişîne...';

  @override
  String get emailSentSuccess => '✅ E-name bi serkeftî hat şandin!';

  @override
  String get emailSendFailed => '❌ Şandina e-nameyê neserkeftî bû';

  @override
  String get astroDictionaryTitle => 'Ferhenga Astro';

  @override
  String get searchTermsHint => 'Peyvên lêgerînê...';

  @override
  String get noTermsFound => 'Peyv nehatin dîtin';

  @override
  String get buyQuestionsTitle => 'Pirsên Kirînê';

  @override
  String get userNotAuthenticated => 'Bikarhêner nehatiye pejirandin';

  @override
  String get loadStoreDataFailed => 'Barkirina daneyên firotgehê neserket';

  @override
  String get missingAuthToken => 'Nîşana destûrdayînê winda ye';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Pere bi serkeftî hate dayîn! Pirs hat şandin';

  @override
  String paymentFailed(Object error) {
    return '❌ Pere bi ser neket: $error';
  }

  @override
  String get yourBalance => 'Balansa Te';

  @override
  String questionsBalance(Object count) {
    return '$count Pirs';
  }

  @override
  String get availableOffers => 'Pêşniyarên Berdest';

  @override
  String questionsCount(Object count) {
    return '$count Pirs';
  }

  @override
  String get buyButton => 'Kirrîn';

  @override
  String get dailyHoroscopeTitle => '🌟 Falnameya Rojane';

  @override
  String get userIdMissing => 'Nasnameya bikarhêner tune ye';

  @override
  String get fetchHoroscopesFailed => 'Nekarî horoskopan bistîne';

  @override
  String get noHoroscopeFound => 'Horoskop nehat dîtin.';

  @override
  String get signLabel => 'Nîşan';

  @override
  String get todayLabel => 'Îro';

  @override
  String get yesterdayLabel => 'Do';

  @override
  String get thisWeekLabel => 'Vê Hefteyê';

  @override
  String get lastMonthLabel => 'Meha Dawî';

  @override
  String get chatTitle => 'Galgalkirin';

  @override
  String get typeYourQuestionHint => 'Pirsa xwe binivîse...';

  @override
  String get paymentRequired => 'Pêdivî bi dravdanê heye';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Te pirsên xwe yên belaş bi kar anîn. Ji bo berdewamkirinê pere bidin $amount.';
  }

  @override
  String get payNowButton => 'Niha Bide';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count pirsên belaş mane';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pirsên dravî yên mayî';
  }

  @override
  String get thankYouFeedback => 'Spas ji bo bersiva te!';

  @override
  String get ratingSubmitted => 'Nirxandin hat şandin!';

  @override
  String get setUserIdFirst =>
      'Ji kerema xwe pêşî Nasnameya Bikarhênerê xwe destnîşan bikin';

  @override
  String get failedToFetchPrevious => 'Nekarî pirs û bersivên berê bîne';

  @override
  String errorOccurred(Object error) {
    return 'Çewtî: $error';
  }

  @override
  String get drawerAstroProfile => 'Profîla Astro';

  @override
  String get drawerDailyHoroscope => 'Falografiya Rojane';

  @override
  String get drawerBuyQuestions => 'Pirsên Kirînê';

  @override
  String get drawerAstroDictionary => 'Ferhenga Astro';

  @override
  String get drawerSettings => 'Mîheng';

  @override
  String get drawerCustomerSupport => 'Piştgiriya Xerîdaran';

  @override
  String get drawerAbout => 'Ji dor';

  @override
  String get drawerProfileSettings => 'Mîhengên Profîlê';

  @override
  String get demoNotificationTitle => '🔔 Agahdariya Demo';

  @override
  String get demoNotificationBody =>
      'Ev agahdariyek ceribandinê ye ji sepanê we!';

  @override
  String get notificationsTitle => 'Agahdarî';

  @override
  String get noNotifications => 'Agahdarî tune ne';

  @override
  String get allTab => 'Gişt';

  @override
  String get markAllAsRead => 'Hemûyan wekî xwendî nîşan bike';

  @override
  String get notificationMarkedRead => 'Agahdarî wekî xwendî hatiye nîşankirin';

  @override
  String get failedToLoadNotifications => 'Barkirina agahdariyan neserket';

  @override
  String get failedToMarkRead => 'Nehat nîşankirin wekî xwendî';

  @override
  String get failedToMarkAllRead => 'Nîşankirina hemûyan wekî xwendî neserket';

  @override
  String get socketConnected => 'Soket girêdayî ye';

  @override
  String get socketDisconnected => 'Soket qut bû';

  @override
  String get newNotificationReceived => 'Agahdariya nû hat wergirtin';

  @override
  String get generalCategory => 'Giştî';

  @override
  String get horoscopeCategory => 'Fal';

  @override
  String get chatCategory => 'Galgalkirin';

  @override
  String get systemCategory => 'Sîstem';

  @override
  String get updateCategory => 'Nûvekirin';

  @override
  String get howToAskTitle => 'Çawa Bipirsin';

  @override
  String get noQuestionsAvailable => 'Pirs tune ne';

  @override
  String get failedToLoadQuestions => 'Barkirina pirsan neserket';

  @override
  String get pullToRefresh => 'Ji bo nûjenkirinê bikşîne';

  @override
  String get careerCategory => 'Pêşveçûnî';

  @override
  String get loveCategory => 'Evîn û Têkilî';

  @override
  String get healthCategory => 'Tendûrûstî';

  @override
  String get financeCategory => 'Malî';

  @override
  String get familyCategory => 'Malbat';

  @override
  String get educationCategory => 'Zanyarî';

  @override
  String get travelCategory => 'Gerrîn';

  @override
  String get spiritualCategory => 'Fikrî';

  @override
  String get profileLoaded => 'Profîl bi serkeftî hate barkirin';

  @override
  String get imageUploaded => 'Wêne bi serkeftî hate barkirin';

  @override
  String get savedInformationConfirmation => 'Min ev agahî tomar kir';

  @override
  String get noHistoryAvailable => 'Dîrok tune ye';

  @override
  String get missingUserIdError => 'Nasnameya bikarhêner pêwîst e';

  @override
  String get networkError => 'Çewtiya torê. Ji kerema xwe dîsa biceribînin.';

  @override
  String get timeoutError => 'Demê daxwazê qediya';

  @override
  String get genericError => 'Tiştek xelet çû';

  @override
  String get reactionUpdateError => 'Nûvekirina reaksiyonê bi ser neket';

  @override
  String get noSearchResults => 'Encamên lêgerînê nehatin dîtin';

  @override
  String get clearSearch => 'Lêgerînê paqij bike';

  @override
  String get resultsFound => 'Encam hatin dîtin';

  @override
  String get recoverySecretHint =>
      'Kopîkirin-pêvekirin dibe ku nexebite, bi destan binivîse';

  @override
  String get recoverAccountDescription =>
      'Ji bo vegerandina hesabê xwe van gavan bişopînin';

  @override
  String get processingLabel => 'Xebitandinî...';

  @override
  String get clearChatSuccess => 'Sohbet bi serkeftî hate paqijkirin';

  @override
  String get notificationsEnabled => 'Agahdarî çalak in';

  @override
  String get notificationsDisabled => 'Agahdarî hatine astengkirin';

  @override
  String get securityNotice => 'Agahiyên te bi ewlehî tên şîfrekirin û hilanîn';

  @override
  String get loading => 'Barkirin...';

  @override
  String get selectLanguage => 'Ziman Hilbijêre';

  @override
  String get onboardingGetStartedDesc =>
      'Bi hilbijartina zimanê xwe dest pê bike';

  @override
  String get accountRecoveryTitle => '🔐 Hûrguliyên Vegerandina Hesabê';

  @override
  String get recoveryInstructions =>
      'Ji kerema xwe vê agahiyê bi ewlehî hilînin. Hûn ê hewceyê wê bin da ku hûn hesabê xwe vegerînin.';

  @override
  String get importantNotice => '⚠️ Girîng:';

  @override
  String get astrologerProfileTitle => 'Profîla Stêrnas';

  @override
  String get personalAstrologer => 'Stêrnasê Şexsî';

  @override
  String get makePersonalAstrologer => 'Astrologê Şexsî Biafirîne';

  @override
  String get favoriteDescription =>
      'Pirsên te dê ji bo vî astrologî werin şandin. Ger ne amade be, astrologekî din ê pispor dê alîkariya te bike.';

  @override
  String get educationQualifications => 'Perwerde û Jêhatîbûn';

  @override
  String get aboutSection => 'Ji dor';

  @override
  String get shareProfile => 'Profîlê Parve Bike';

  @override
  String get loadingAstrologer => 'Hûrguliyên astrologan tên barkirin...';

  @override
  String get failedToLoadAstrologer =>
      'Barkirina hûrguliyên astrologan bi ser neket';

  @override
  String get authenticationRequired =>
      'Pêdivî bi pejirandinê heye. Ji kerema xwe têkevinê.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kontrola ewlehiyê bi ser neket: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name niha Stêrnasê te yê Kesane ye';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name ji bijareyan hat rakirin';
  }

  @override
  String get toggleFavoriteError => 'Nûvekirina rewşa bijare bi ser neket';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Perwerde: $education\n📜 Jêhatîbûn: $qualification\n⏳ Ezmûn: $experience';
  }

  @override
  String get notProvided => 'Nehatiye peyda kirin';

  @override
  String reviews(Object count) {
    return '($count nirxandin)';
  }

  @override
  String get specialties => 'Taybetî';

  @override
  String get experience => 'Tecribe';

  @override
  String get qualification => 'Zanyarî';

  @override
  String get education => 'Zanyarî';

  @override
  String get recoveryTips =>
      '• Wêneyê ekranê yê vê agahiyê bigirin\n• Li cîhekî ewle hilînin\n• Bi kesî re parve nekin\n• Ev tenê carekê tê nîşandan';

  @override
  String get themeSettingsTitle => 'Mîhengên Mijarê';

  @override
  String get lightThemeLabel => 'Sivik';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tarî';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sîstem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
