// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malagasy (`mg`).
class AppLocalizationsMg extends AppLocalizations {
  AppLocalizationsMg([String locale = 'mg']) : super(locale);

  @override
  String get settingsTitle => 'Fikirana';

  @override
  String get notificationSettings => 'Fikirana fampahafantarana';

  @override
  String get privacySettings => 'Fikirana tsiambaratelo';

  @override
  String get accountSettings => 'Tefin\'ny kaonty';

  @override
  String get languageSettings => 'Fikirana fiteny';

  @override
  String get languageChanged => 'Niova ny fiteny';

  @override
  String get existingUserButton => 'Mpampiasa efa misy aho';

  @override
  String get chooseCountryTitle => 'Mifidiana Firenena';

  @override
  String get yesText => 'ENY';

  @override
  String get noText => 'tsy misy';

  @override
  String get appBarTitle => 'Fikirana mombamomba';

  @override
  String get userIdLabel => 'Anara-mpampiasa *';

  @override
  String get nameLabel => 'Anarana';

  @override
  String get birthCountryLabel => 'Firenena nahaterahana';

  @override
  String get birthCityLabel => 'Tanàna nahaterahana';

  @override
  String get countrySelectionTitle => 'Fidio ny firenenao';

  @override
  String get maleLabel => 'Lahy';

  @override
  String get femaleLabel => 'vehivavy';

  @override
  String get birthDateLabel => 'Daty nahaterahana';

  @override
  String get birthDatePlaceholder => 'Safidio ny daty nahaterahana';

  @override
  String get birthTimeLabel => 'Fotoana nahaterahana';

  @override
  String get birthTimePlaceholder => 'Safidio ny fotoana nahaterahana';

  @override
  String get saveProfileButton => 'Save Profile';

  @override
  String get noCitiesFound => 'Tsy nisy tanàna hita';

  @override
  String cityPlaceholder(Object country) {
    return 'Ampidiro tanàna ao amin\'ny $country';
  }

  @override
  String get countryFirstPlaceholder => 'Fidio firenena aloha';

  @override
  String get versionHistoryTitle => 'Version History';

  @override
  String get notSetText => 'Tsy napetraka';

  @override
  String nameHistory(Object name) {
    return 'Anarana: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Tanàna: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Firenena: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Fananahana: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Daty nahaterahana: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Fotoana nahaterahana: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Toerana: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Faritra ora: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Fanjakana: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Nohavaozina tamin\'ny $date';
  }

  @override
  String get userIdRequired => 'Ilaina ny ID mpampiasa';

  @override
  String get profileSaved => 'Voatahiry soa aman-tsara ny mombamomba azy';

  @override
  String get saveFailed => 'Tsy voatahiry ny mombamomba azy';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Fidio ny fiteninao';

  @override
  String get onboardingChooseLanguageDesc =>
      'Fidio ny fiteny tianao hanohizana.';

  @override
  String get onboardingWhatIsAstrology => 'Inona no atao hoe Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ny astrolojia dia ny fandalinana ny zavatra eny amin\'ny lanitra...';

  @override
  String get onboardingWhyUseApp => 'Nahoana no mampiasa ity fampiharana ity?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Makà horoscope manokana, vinavina isan\'andro ary torolalana handraisana fanapahan-kevitra tsara.';

  @override
  String get onboardingHowToUse => 'Ahoana ny fampiasana ity fampiharana ity?';

  @override
  String get onboardingHowToUseDesc =>
      'Mandehana mora foana, jereo ny horoscope isan\'andro, ary tantano ny mombamomba anao mba hahazoana faminaniana marina.';

  @override
  String get onboardingGetStarted => 'Manomboha';

  @override
  String get onboardingNewUser => 'Mpampiasa vaovao';

  @override
  String get onboardingExistingUser => 'Mpampiasa efa misy';

  @override
  String get onboardingBack => 'indray';

  @override
  String get onboardingNext => 'Manaraka';

  @override
  String get userIdNotFound =>
      'Tsy hita ny ID mpampiasa. Midira na mametraka ny mombamomba anao azafady.';

  @override
  String get clearNotificationsTitle => 'Fampandrenesana mazava';

  @override
  String get clearNotificationsMessage =>
      'Tena te-hamafa ny fampandrenesana rehetra ve ianao?';

  @override
  String get clearNotificationsSuccess =>
      'Voafafa soa aman-tsara ny fampahafantarana rehetra.';

  @override
  String get clearHoroscopeTitle => 'Horoscope mazava';

  @override
  String get clearHoroscopeMessage =>
      'Tena te-hamafa ny angona horoscope-nao ve ianao?';

  @override
  String get clearHoroscopeSuccess => 'Voafafa soa aman-tsara ny horoscope.';

  @override
  String get clearChatTitle => 'Fadio ny tantaran\'ny chat';

  @override
  String get clearChatMessage =>
      'Tena te-hamafa ny tantaran\'ny chat rehetra ve ianao?';

  @override
  String get clearChatLocal => 'Voafafa teo an-toerana ny chat.';

  @override
  String get deleteAccountTitle => 'Fafao ny kaonty';

  @override
  String get deleteAccountMessage =>
      'Tena te-hamafa ny kaontinao tokoa ve ianao? Izany koa dia hamafa ny tantaran\'ny chat sy ny fampandrenesanao rehetra.';

  @override
  String get deleteAccountSuccess =>
      'Nesorina ny kaontinao sy ny angona rehetra.';

  @override
  String get deleteAccountError => 'Error famafana kaonty';

  @override
  String get logoutTitle => 'Hivoaka';

  @override
  String get logoutMessage => 'Tena te-hivoaka ve ianao?';

  @override
  String get termsPrivacyTitle => 'Fepetra & tsiambaratelo';

  @override
  String get privacyPolicyTitle => 'politika fiarovana fiainan\'olona';

  @override
  String get termsConditionsTitle => 'Fepetra sy fepetra';

  @override
  String get dataControlTitle => 'Fanaraha-maso ny angona';

  @override
  String get cancelButton => 'hanafoana';

  @override
  String get confirmButton => 'Manamarina';

  @override
  String get clearQuestionsSuccess =>
      'Voafafa soa aman-tsara ny fanontaniana rehetra.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tompo';

  @override
  String get startLabel => 'fanombohana';

  @override
  String get recoverAccount => 'Recover Account';

  @override
  String get endLabel => 'Tapitra';

  @override
  String get startDateLabel => 'Daty nanombohana';

  @override
  String get endDateLabel => 'Daty famaranana';

  @override
  String get notAvailable => 'Tsy misy';

  @override
  String get noData => 'Tsy misy angona';

  @override
  String get unknownError => 'Error tsy fantatra';

  @override
  String get retryButton => 'Hanandrana indray';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Tabilao Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Ascendant Degree';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'TSY FANTATRA';

  @override
  String get clearHoroscope => 'Horoscope mazava';

  @override
  String get clearNotifications => 'Fampandrenesana mazava';

  @override
  String get clearChatHistory => 'Fadio ny tantaran\'ny chat';

  @override
  String get logout => 'Hivoaka';

  @override
  String get deleteAccount => 'Fafao ny kaonty';

  @override
  String get allFieldsRequired => 'Ilaina ny saha rehetra.';

  @override
  String get accountRecoveredSuccess => 'Tafaverina soa aman-tsara ny kaonty.';

  @override
  String get recoveryFailed =>
      'Tsy nahomby ny fanarenana. Jereo ny mombamomba anao.';

  @override
  String get recoverySecretLabel => 'Tsiambaratelon\'ny fanarenana:';

  @override
  String get aboutUsTitle => 'Momba anay';

  @override
  String get aboutOurCompany => 'Momba ny orinasanay';

  @override
  String get aboutCompanyDescription =>
      'Nanolo-tena izahay hanome traikefa astrolojia tsara indrindra ho an\'ireo mpampiasa anay.';

  @override
  String get ourMission => 'Ny Iraka';

  @override
  String get missionDescription =>
      'Mba hanomezana hevitra momba ny fanandroana marina sy manokana mba hanampiana ireo mpampiasa handray fanapahan-kevitra tsara eo amin\'ny fiainany.';

  @override
  String get ourVision => 'Ny Vinantsika';

  @override
  String get visionDescription =>
      'Mba ho lasa sehatra fanandroana azo itokisana indrindra, manambatra ny teknolojia sy ny fahendrena taloha.';

  @override
  String get ourValues => 'Ny Soatoavinay';

  @override
  String get valuesDescription =>
      'Ny fahamendrehana, ny fahamendrehana, ny famolavolana mifototra amin\'ny mpampiasa, ary ny fanavaozana mitohy.';

  @override
  String get contactUs => 'Mifandraisa aminay';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Tranonkala: www.yourcompany.com';

  @override
  String get customerSupport => 'Fanohanana ny mpanjifa';

  @override
  String get supportHeroTitle => 'Eto izahay hanampy';

  @override
  String get supportHeroDescription =>
      'Fenoy ny taratasy etsy ambany dia hiverina aminao haingana araka izay azo atao ny ekipa mpanohana anay.';

  @override
  String get yourName => 'Ny anaranao';

  @override
  String get yourEmail => 'Ny mailakao';

  @override
  String get message => 'hAFATRA';

  @override
  String get enterEmail => 'Ampidiro ny mailakao';

  @override
  String get enterValidEmail => 'Ampidiro adiresy mailaka manan-kery';

  @override
  String enterField(Object fieldName) {
    return 'Ampidiro $fieldName';
  }

  @override
  String get send => 'Alefaso';

  @override
  String get sending => 'Mandefa...';

  @override
  String get emailSentSuccess => '✅ Nalefa soa aman-tsara ny mailaka!';

  @override
  String get emailSendFailed => '❌ Tsy nahavita nandefa mailaka';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Teny fikarohana...';

  @override
  String get noTermsFound => 'Tsy misy teny hita';

  @override
  String get buyQuestionsTitle => 'Mividiana fanontaniana';

  @override
  String get userNotAuthenticated => 'Tsy voamarina ny mpampiasa';

  @override
  String get loadStoreDataFailed =>
      'Tsy nahomby ny fampidirana ny angona fitehirizana';

  @override
  String get missingAuthToken => 'Tsy misy mari-pamantarana fanamarinana';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Tafita ny fandoavam-bola! Nalefa ny fanontaniana';

  @override
  String paymentFailed(Object error) {
    return '❌ Tsy nahomby ny fandoavam-bola: $error';
  }

  @override
  String get yourBalance => 'Ny fandanjalanjanao';

  @override
  String questionsBalance(Object count) {
    return '$count Fanontaniana';
  }

  @override
  String get availableOffers => 'Tolotra azo';

  @override
  String questionsCount(Object count) {
    return '$count Fanontaniana';
  }

  @override
  String get buyButton => 'Buy';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope isan\'andro';

  @override
  String get userIdMissing => 'Tsy misy ny ID mpampiasa';

  @override
  String get fetchHoroscopesFailed => 'Tsy nahavita naka horoscope';

  @override
  String get noHoroscopeFound => 'Tsy hita ny horoscope.';

  @override
  String get signLabel => 'Sign';

  @override
  String get todayLabel => 'ankehitriny';

  @override
  String get yesterdayLabel => 'Omaly';

  @override
  String get thisWeekLabel => 'Ity herinandro ity';

  @override
  String get lastMonthLabel => 'Volana lasa';

  @override
  String get chatTitle => 'hiresaka';

  @override
  String get typeYourQuestionHint => 'Soraty ny fanontanianao...';

  @override
  String get paymentRequired => 'Ilaina ny fandoavam-bola';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Nampiasa ny fanontanianao maimaim-poana ianao. Mandoa $amount hanohizana.';
  }

  @override
  String get payNowButton => 'Aloavy izao';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count fanontaniana maimaim-poana sisa';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count fanontaniana misy karama sisa';
  }

  @override
  String get thankYouFeedback => 'Misaotra anao tamin\'ny fanehoan-kevitrao!';

  @override
  String get ratingSubmitted => 'Natolotra ny naoty!';

  @override
  String get setUserIdFirst => 'Apetraho aloha ny ID-nao';

  @override
  String get failedToFetchPrevious =>
      'Tsy nahavita naka fanontaniana sy valiny teo aloha';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'Horoscope isan\'andro';

  @override
  String get drawerBuyQuestions => 'Mividiana fanontaniana';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Fikirana';

  @override
  String get drawerCustomerSupport => 'Fanohanana ny mpanjifa';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerProfileSettings => 'Fikirana mombamomba';

  @override
  String get demoNotificationTitle => '🔔 Fampahafantarana Demo';

  @override
  String get demoNotificationBody =>
      'Fampandrenesana fitsapana avy amin\'ny fampiharanao ity!';

  @override
  String get notificationsTitle => 'fampahatsiahivana';

  @override
  String get noNotifications => 'Tsy misy fampahafantarana';

  @override
  String get allTab => 'rehetra';

  @override
  String get markAllAsRead => 'Mariho ho voavaky ny rehetra';

  @override
  String get notificationMarkedRead => 'Fampandrenesana voamarika ho voavaky';

  @override
  String get failedToLoadNotifications => 'Tsy nahomby ny fampandrenesana';

  @override
  String get failedToMarkRead => 'Tsy voamarika ho novakiana';

  @override
  String get failedToMarkAllRead => 'Tsy voamarika ho voavaky ny rehetra';

  @override
  String get socketConnected => 'Socket mifandray';

  @override
  String get socketDisconnected => 'Tapaka ny socket';

  @override
  String get newNotificationReceived => 'Fampandrenesana vaovao voaray';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'tonon\'andro';

  @override
  String get chatCategory => 'hiresaka';

  @override
  String get systemCategory => 'RAFITRA';

  @override
  String get updateCategory => 'vaovao farany';

  @override
  String get howToAskTitle => 'Ahoana ny fanontaniana';

  @override
  String get noQuestionsAvailable => 'Tsy misy fanontaniana azo';

  @override
  String get failedToLoadQuestions => 'Tsy nahomby ny fametrahana fanontaniana';

  @override
  String get pullToRefresh => 'Sintonina hamelombelona';

  @override
  String get careerCategory => 'FIVELOMANA';

  @override
  String get loveCategory => 'Fitiavana & Fifandraisana';

  @override
  String get healthCategory => 'FAHASALAMANA';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Family';

  @override
  String get educationCategory => 'FAMPIANARANA';

  @override
  String get travelCategory => 'Tsangatsangana';

  @override
  String get spiritualCategory => 'ARA-PANAHY';

  @override
  String get profileLoaded => 'Vita soa aman-tsara ny mombamomba azy';

  @override
  String get imageUploaded => 'Tafiditra soa aman-tsara ny sary';

  @override
  String get savedInformationConfirmation => 'Notahiriko ity fampahalalana ity';

  @override
  String get noHistoryAvailable => 'Tsy misy tantara azo';

  @override
  String get missingUserIdError => 'Ilaina ny ID mpampiasa';

  @override
  String get networkError =>
      'Error amin\'ny tambajotra. Andramo indray azafady.';

  @override
  String get timeoutError => 'Tapitra ny fangatahana';

  @override
  String get genericError => 'Nisy zavatra tsy nety';

  @override
  String get reactionUpdateError =>
      'Tsy nahomby ny fanavaozana ny fanehoan-kevitra';

  @override
  String get noSearchResults => 'Tsy hita ny valin\'ny fikarohana';

  @override
  String get clearSearch => 'Fafao ny fikarohana';

  @override
  String get resultsFound => 'Hita ny valiny';

  @override
  String get recoverySecretHint =>
      'Mety tsy mandeha ny kopia mametaka, soraty amin\'ny tanana';

  @override
  String get recoverAccountDescription =>
      'Araho ireto dingana ireto mba hamerenana ny kaontinao';

  @override
  String get processingLabel => 'Mikarakara...';

  @override
  String get clearChatSuccess => 'Voafafa soa aman-tsara ny chat';

  @override
  String get notificationsEnabled => 'Nalefa ny fampahafantarana';

  @override
  String get notificationsDisabled => 'Tsy nety ny fampandrenesana';

  @override
  String get securityNotice => 'Voafefy sy voatahiry tsara ny angonao';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get onboardingGetStartedDesc =>
      'Manomboha amin\'ny fisafidianana ny fiteninao';

  @override
  String get accountRecoveryTitle => '🔐 Antsipirihan\'ny fanarenana ny kaonty';

  @override
  String get recoveryInstructions =>
      'Tehirizo tsara ity fampahalalana ity azafady. Mila izany ianao hamerenana ny kaontinao.';

  @override
  String get importantNotice => '⚠️ Zava-dehibe:';

  @override
  String get astrologerProfileTitle => 'mombamomba ny mpanandro';

  @override
  String get personalAstrologer => 'Mpanandroa manokana';

  @override
  String get makePersonalAstrologer => 'Manaova mpanandro manokana';

  @override
  String get favoriteDescription =>
      'Ny fanontanianao dia ho laharam-pahamehana amin\'ity mpanandro ity. Raha tsy misy dia misy mpanandro mahay hafa hanampy anao.';

  @override
  String get educationQualifications => 'Fanabeazana & Fepetra';

  @override
  String get aboutSection => 'About';

  @override
  String get shareProfile => 'Zarao ny mombamomba';

  @override
  String get loadingAstrologer => 'Mametraka ny antsipirian\'ny mpanandro...';

  @override
  String get failedToLoadAstrologer =>
      'Tsy nahomby ny fampidirana ny antsipirian\'ny mpanandro';

  @override
  String get authenticationRequired =>
      'Ilaina ny fanamarinana. Midira azafady.';

  @override
  String securityCheckFailed(Object error) {
    return 'Tsy nahomby ny fisavana fiarovana: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name no mpanandro manokana anao izao';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Nesorina ny $name tamin\'ny ankafiziny';
  }

  @override
  String get toggleFavoriteError =>
      'Tsy nahomby ny fanavaozana ny sata tianao indrindra';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Fanabeazana: $education\n📜 Fahafahana: $qualification\n⏳ Traikefa: $experience';
  }

  @override
  String get notProvided => 'Tsy nomena';

  @override
  String reviews(Object count) {
    return '($count hevitra)';
  }

  @override
  String get specialties => 'specialties';

  @override
  String get experience => 'Experience';

  @override
  String get qualification => 'fahaizana';

  @override
  String get education => 'FAMPIANARANA';

  @override
  String get recoveryTips =>
      '• Makà pikantsary amin\'ity fampahalalana ity\n• Tehirizo ao amin\'ny toerana azo antoka izy io\n• Aza mizara amin\'iza na iza\n• Indray mandeha ihany no hiseho ity';

  @override
  String get themeSettingsTitle => 'Fanitsiana lohahevitra';

  @override
  String get lightThemeLabel => 'fahazavana';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Maizina';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'RAFITRA';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
