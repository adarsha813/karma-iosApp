// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Cebuano (`ceb`).
class AppLocalizationsCeb extends AppLocalizations {
  AppLocalizationsCeb([String locale = 'ceb']) : super(locale);

  @override
  String get settingsTitle => 'Mga setting';

  @override
  String get notificationSettings => 'Mga Setting sa Pagpahibalo';

  @override
  String get privacySettings => 'Mga Setting sa Pagkapribado';

  @override
  String get accountSettings => 'Mga Setting sa Account';

  @override
  String get languageSettings => 'Mga Setting sa Pinulongan';

  @override
  String get languageChanged => 'Nausab ang pinulongan';

  @override
  String get existingUserButton => 'Usa ako ka kasamtangan nga tiggamit';

  @override
  String get chooseCountryTitle => 'Pilia ang Nasud';

  @override
  String get yesText => 'Oo';

  @override
  String get noText => 'Dili';

  @override
  String get appBarTitle => 'Mga Setting sa Profile';

  @override
  String get userIdLabel => 'User ID *';

  @override
  String get nameLabel => 'Ngalan';

  @override
  String get birthCountryLabel => 'Natawhan nga Nasud';

  @override
  String get birthCityLabel => 'Lungsod sa Pagkatawo';

  @override
  String get countrySelectionTitle => 'Pilia ang imong nasud';

  @override
  String get maleLabel => 'Lalaki';

  @override
  String get femaleLabel => 'Babaye';

  @override
  String get birthDateLabel => 'Petsa sa Pagkatawo';

  @override
  String get birthDatePlaceholder => 'Pilia ang Petsa sa Pagkatawo';

  @override
  String get birthTimeLabel => 'Panahon sa Pagkatawo';

  @override
  String get birthTimePlaceholder => 'Pilia ang Panahon sa Pagkatawo';

  @override
  String get saveProfileButton => 'I-save ang Profile';

  @override
  String get noCitiesFound => 'Walay mga siyudad nga nakit-an';

  @override
  String cityPlaceholder(Object country) {
    return 'Pagsulod sa siyudad sa $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pilia una ang nasud';

  @override
  String get versionHistoryTitle => 'Kasaysayan sa Bersyon';

  @override
  String get notSetText => 'Wala gitakda';

  @override
  String nameHistory(Object name) {
    return 'Ngalan: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Lungsod: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Nasud: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Petsa sa Pagkatawo: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Oras sa Pagkatawo: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokasyon: $latitude, $longitude';
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
    return 'Estado: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Gi-update sa $date';
  }

  @override
  String get userIdRequired => 'User ID gikinahanglan';

  @override
  String get profileSaved => 'Malampuson nga na-save ang profile';

  @override
  String get saveFailed => 'Napakyas sa pagluwas sa profile';

  @override
  String get errorPrefix => 'Sayop:';

  @override
  String get onboardingChooseLanguage => 'Pilia ang Imong Pinulongan';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pilia ang imong gusto nga pinulongan aron magpadayon.';

  @override
  String get onboardingWhatIsAstrology => 'Unsa ang Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ang astrolohiya mao ang pagtuon sa celestial nga mga butang...';

  @override
  String get onboardingWhyUseApp => 'Nganong gamiton kini nga app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Pagkuha ug personal nga mga horoscope, adlaw-adlaw nga mga panagna, ug giya aron makahimo og mga desisyon nga nahibal-an.';

  @override
  String get onboardingHowToUse => 'Giunsa paggamit kini nga app?';

  @override
  String get onboardingHowToUseDesc =>
      'Dali nga pag-navigate, susiha ang adlaw-adlaw nga mga horoscope, ug pagdumala sa imong profile alang sa tukma nga mga panagna.';

  @override
  String get onboardingGetStarted => 'Pagsugod';

  @override
  String get onboardingNewUser => 'Bag-ong Gumagamit';

  @override
  String get onboardingExistingUser => 'Anaa nga Gumagamit';

  @override
  String get onboardingBack => 'Balik';

  @override
  String get onboardingNext => 'Sunod';

  @override
  String get userIdNotFound =>
      'Wala makit-an ang user ID. Palihug login o itakda ang imong profile.';

  @override
  String get clearNotificationsTitle => 'Klaro nga Notifications';

  @override
  String get clearNotificationsMessage =>
      'Sigurado ka ba nga gusto nimong tangtangon ang tanan nga mga pahibalo?';

  @override
  String get clearNotificationsSuccess =>
      'Ang tanan nga mga pahibalo malampuson nga natangtang.';

  @override
  String get clearHoroscopeTitle => 'Klaro nga Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Sigurado ka ba nga gusto nimong hawanan ang imong data sa horoscope?';

  @override
  String get clearHoroscopeSuccess =>
      'Malampuson nga natangtang ang horoscope.';

  @override
  String get clearChatTitle => 'Tin-aw nga Kasaysayan sa Chat';

  @override
  String get clearChatMessage =>
      'Sigurado ka ba nga gusto nimong papason ang tanan nimong kasaysayan sa chat?';

  @override
  String get clearChatLocal => 'Gi-clear ang chat sa lokal.';

  @override
  String get deleteAccountTitle => 'Pagtangtang sa Account';

  @override
  String get deleteAccountMessage =>
      'Sigurado ka ba nga gusto nimong papason ang imong account? Matangtang usab niini ang tanan nimong kasaysayan sa chat ug mga pahibalo.';

  @override
  String get deleteAccountSuccess =>
      'Ang imong account ug ang tanan nga datos gitangtang.';

  @override
  String get deleteAccountError => 'Sayop sa pagtangtang sa account';

  @override
  String get logoutTitle => 'Pag-logout';

  @override
  String get logoutMessage => 'Sigurado ka nga gusto ka nga mo-logout?';

  @override
  String get termsPrivacyTitle => 'Mga Termino ug Pagkapribado';

  @override
  String get privacyPolicyTitle => 'Patakaran sa Pagkapribado';

  @override
  String get termsConditionsTitle => 'Mga Termino ug Kondisyon';

  @override
  String get dataControlTitle => 'Pagkontrol sa Data';

  @override
  String get cancelButton => 'Pagkanselar';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get clearQuestionsSuccess =>
      'Ang tanang pangutana malampusong natangtang.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Ginoo';

  @override
  String get startLabel => 'Pagsugod';

  @override
  String get recoverAccount => 'Pagbawi sa Account';

  @override
  String get endLabel => 'Katapusan';

  @override
  String get startDateLabel => 'Petsa sa Pagsugod';

  @override
  String get endDateLabel => 'Petsa sa Katapusan';

  @override
  String get notAvailable => 'Dili magamit';

  @override
  String get noData => 'Walay datos';

  @override
  String get unknownError => 'Wala mailhi nga sayup';

  @override
  String get retryButton => 'Sulayi pag-usab';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Natal Chart';

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
  String get unknown => 'Wala mailhi';

  @override
  String get clearHoroscope => 'Klaro nga Horoscope';

  @override
  String get clearNotifications => 'Klaro nga Notifications';

  @override
  String get clearChatHistory => 'Tin-aw nga Kasaysayan sa Chat';

  @override
  String get logout => 'Pag-logout';

  @override
  String get deleteAccount => 'Pagtangtang sa Account';

  @override
  String get allFieldsRequired => 'Kinahanglan ang tanang field.';

  @override
  String get accountRecoveredSuccess => 'Malampuson nga nabawi ang account.';

  @override
  String get recoveryFailed =>
      'Napakyas ang pagkaayo. Susiha ang imong impormasyon.';

  @override
  String get recoverySecretLabel => 'Sekreto sa Pagbawi:';

  @override
  String get aboutUsTitle => 'Mahitungod Kanato';

  @override
  String get aboutOurCompany => 'Mahitungod sa Atong Kompanya';

  @override
  String get aboutCompanyDescription =>
      'Kami komitido sa paghatud sa labing kaayo nga kasinatian sa astrolohiya sa among mga tiggamit.';

  @override
  String get ourMission => 'Atong Misyon';

  @override
  String get missionDescription =>
      'Aron mahatagan ang tukma ug personal nga mga panan-aw sa astrolohiya aron matabangan ang mga tiggamit sa paghimo og nahibal-an nga mga desisyon sa ilang kinabuhi.';

  @override
  String get ourVision => 'Atong Panan-awon';

  @override
  String get visionDescription =>
      'Aron mahimong labing kasaligan nga plataporma sa astrolohiya, paghiusa sa teknolohiya ug karaan nga kaalam.';

  @override
  String get ourValues => 'Atong mga Mithi';

  @override
  String get valuesDescription =>
      'Integridad, Katukma, Gisentro sa Gumagamit nga Disenyo, ug Padayon nga Pagbag-o.';

  @override
  String get contactUs => 'Kontaka Kami';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Website: www.yourcompany.com';

  @override
  String get customerSupport => 'Suporta sa Kustomer';

  @override
  String get supportHeroTitle => 'Ania Kami Aron Motabang';

  @override
  String get supportHeroDescription =>
      'Sulati ang porma sa ubos ug ang among support team mobalik kanimo sa labing madali.';

  @override
  String get yourName => 'Imong Ngalan';

  @override
  String get yourEmail => 'Imong Email';

  @override
  String get message => 'Mensahe';

  @override
  String get enterEmail => 'Pagsulod sa imong email';

  @override
  String get enterValidEmail => 'Pagsulod ug balido nga email address';

  @override
  String enterField(Object fieldName) {
    return 'Pagsulod $fieldName';
  }

  @override
  String get send => 'Ipadala';

  @override
  String get sending => 'Nagpadala...';

  @override
  String get emailSentSuccess => '✅ Malampusong gipadala ang email!';

  @override
  String get emailSendFailed => '❌ Napakyas sa pagpadala sa email';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Mga termino sa pagpangita...';

  @override
  String get noTermsFound => 'Walay termino nga nakit-an';

  @override
  String get buyQuestionsTitle => 'Pagpalit og mga Pangutana';

  @override
  String get userNotAuthenticated => 'Ang user wala ma-authenticate';

  @override
  String get loadStoreDataFailed => 'Napakyas sa pagkarga sa datos sa tindahan';

  @override
  String get missingAuthToken => 'Nawala ang auth token';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Malampuson ang pagbayad! Gipadala ang pangutana';

  @override
  String paymentFailed(Object error) {
    return '❌ Napakyas ang pagbayad: $error';
  }

  @override
  String get yourBalance => 'Ang imong Balanse';

  @override
  String questionsBalance(Object count) {
    return '$count Mga pangutana';
  }

  @override
  String get availableOffers => 'Anaa nga mga Tanyag';

  @override
  String questionsCount(Object count) {
    return '$count Pangutana';
  }

  @override
  String get buyButton => 'Palita';

  @override
  String get dailyHoroscopeTitle => '🌟 Adlaw-adlaw nga Horoscope';

  @override
  String get userIdMissing => 'Nawala ang user ID';

  @override
  String get fetchHoroscopesFailed => 'Napakyas sa pagkuha sa mga horoscope';

  @override
  String get noHoroscopeFound => 'Walay nakita nga horoscope.';

  @override
  String get signLabel => 'Sign';

  @override
  String get todayLabel => 'Karon';

  @override
  String get yesterdayLabel => 'Kagahapon';

  @override
  String get thisWeekLabel => 'Karong Semana';

  @override
  String get lastMonthLabel => 'Sa miaging Bulan';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Isulat ang imong pangutana...';

  @override
  String get paymentRequired => 'Gikinahanglan ang Pagbayad';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Gigamit nimo ang imong libre nga mga pangutana. Pagbayad og ₹50 aron makapadayon.';
  }

  @override
  String get payNowButton => 'Bayad Karon';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count libre nga pangutana ang nahabilin';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count bayad nga mga pangutana ang nahabilin';
  }

  @override
  String get thankYouFeedback => 'Salamat sa imong feedback!';

  @override
  String get ratingSubmitted => 'Gisumite ang rating!';

  @override
  String get setUserIdFirst => 'Palihug ibutang una ang imong User ID';

  @override
  String get failedToFetchPrevious =>
      'Napakyas sa pagkuha sa nangaging mga pangutana ug tubag';

  @override
  String errorOccurred(Object error) {
    return 'Sayop: $error';
  }

  @override
  String get drawerAstroProfile => 'Profile sa Astro';

  @override
  String get drawerDailyHoroscope => 'Adlaw-adlaw nga Horoscope';

  @override
  String get drawerBuyQuestions => 'Pagpalit og mga Pangutana';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Mga setting';

  @override
  String get drawerCustomerSupport => 'Suporta sa Kustomer';

  @override
  String get drawerAbout => 'Mahitungod sa';

  @override
  String get drawerProfileSettings => 'Mga Setting sa Profile';

  @override
  String get demoNotificationTitle => '🔔 Pagpahibalo sa Demo';

  @override
  String get demoNotificationBody =>
      'Kini usa ka pagsulay nga pahibalo gikan sa imong app!';

  @override
  String get notificationsTitle => 'Mga pahibalo';

  @override
  String get noNotifications => 'Walay mga pahibalo';

  @override
  String get allTab => 'Tanan';

  @override
  String get markAllAsRead => 'Markahi ang tanan nga nabasa na';

  @override
  String get notificationMarkedRead => 'Ang pahibalo gimarkahan nga nabasa na';

  @override
  String get failedToLoadNotifications =>
      'Napakyas sa pagkarga sa mga pahibalo';

  @override
  String get failedToMarkRead => 'Napakyas sa pagmarka ingon nga nabasa na';

  @override
  String get failedToMarkAllRead =>
      'Napakyas sa pagmarka sa tanan ingon nga nabasa na';

  @override
  String get socketConnected => 'Socket konektado';

  @override
  String get socketDisconnected => 'Naputol ang socket';

  @override
  String get newNotificationReceived => 'Bag-ong pahibalo nadawat';

  @override
  String get generalCategory => 'Heneral';

  @override
  String get horoscopeCategory => 'Horoskopyo';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Mga update';

  @override
  String get howToAskTitle => 'Unsaon Pagpangutana';

  @override
  String get noQuestionsAvailable => 'Walay mga pangutana nga magamit';

  @override
  String get failedToLoadQuestions => 'Napakyas sa pagkarga sa mga pangutana';

  @override
  String get pullToRefresh => 'Ibira aron ma-refresh';

  @override
  String get careerCategory => 'Karera';

  @override
  String get loveCategory => 'Gugma ug Relasyon';

  @override
  String get healthCategory => 'Panglawas';

  @override
  String get financeCategory => 'Panalapi';

  @override
  String get familyCategory => 'Pamilya';

  @override
  String get educationCategory => 'Edukasyon';

  @override
  String get travelCategory => 'Pagbiyahe';

  @override
  String get spiritualCategory => 'Espirituwal';

  @override
  String get profileLoaded => 'Malampuson nga nakarga ang profile';

  @override
  String get imageUploaded => 'Malampusong na-upload ang hulagway';

  @override
  String get savedInformationConfirmation =>
      'Gitipigan Ko Kini nga Impormasyon';

  @override
  String get noHistoryAvailable => 'Walay kasaysayan nga magamit';

  @override
  String get missingUserIdError => 'User ID gikinahanglan';

  @override
  String get networkError => 'Sayop sa network. Palihug sulayi pag-usab.';

  @override
  String get timeoutError => 'Nag-time out ang hangyo';

  @override
  String get genericError => 'Naay nahitabo';

  @override
  String get reactionUpdateError => 'Napakyas sa pag-update sa reaksyon';

  @override
  String get noSearchResults => 'Walay nakit-an nga resulta sa pagpangita';

  @override
  String get clearSearch => 'Klaro nga pagpangita';

  @override
  String get resultsFound => 'Nakaplagan ang mga resulta';

  @override
  String get recoverySecretHint =>
      'Mahimong dili mugana ang copy-paste, mano-mano ang pag-type';

  @override
  String get recoverAccountDescription =>
      'Sunda kini nga mga lakang aron mabawi ang imong account';

  @override
  String get processingLabel => 'Nagproseso...';

  @override
  String get clearChatSuccess => 'Malampuson nga natangtang ang chat';

  @override
  String get notificationsEnabled => 'Gipaandar ang mga pahibalo';

  @override
  String get notificationsDisabled => 'Gi-disable ang mga pahibalo';

  @override
  String get securityNotice =>
      'Ang imong data luwas nga na-encrypt ug gitipigan';

  @override
  String get loading => 'Nagkarga...';

  @override
  String get selectLanguage => 'Pilia ang Pinulongan';

  @override
  String get onboardingGetStartedDesc =>
      'Pagsugod pinaagi sa pagpili sa imong pinulongan';

  @override
  String get accountRecoveryTitle => '🔐 Mga Detalye sa Pagbawi sa Account';

  @override
  String get recoveryInstructions =>
      'Palihug tipigi kini nga impormasyon nga luwas. Kinahanglan nimo kini aron mabawi ang imong account.';

  @override
  String get importantNotice => '⚠️ Importante:';

  @override
  String get astrologerProfileTitle => 'Profile sa Astrologo';

  @override
  String get personalAstrologer => 'Personal nga Astrologo';

  @override
  String get makePersonalAstrologer => 'Paghimo ug Personal nga Astrologo';

  @override
  String get favoriteDescription =>
      'Ang imong mga pangutana unahon sa kini nga astrologo. Kung dili magamit, laing kwalipikado nga astrologo ang motabang kanimo.';

  @override
  String get educationQualifications => 'Edukasyon ug Kwalipikasyon';

  @override
  String get aboutSection => 'Mahitungod sa';

  @override
  String get shareProfile => 'Ipakigbahin ang Profile';

  @override
  String get loadingAstrologer => 'Nagkarga sa mga detalye sa astrologo...';

  @override
  String get failedToLoadAstrologer =>
      'Napakyas sa pagkarga sa mga detalye sa astrologo';

  @override
  String get authenticationRequired =>
      'Gikinahanglan ang authentication. Palihug log in.';

  @override
  String securityCheckFailed(Object error) {
    return 'Napakyas ang pagsusi sa seguridad: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name mao na ang imong Personal nga Astrologo';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Gitangtang ang $name gikan sa mga paborito';
  }

  @override
  String get toggleFavoriteError =>
      'Napakyas sa pag-update sa paborito nga kahimtang';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Edukasyon: $education\n📜 Kwalipikasyon: $qualification\n⏳ Kasinatian: $experience';
  }

  @override
  String get notProvided => 'Wala gihatag';

  @override
  String reviews(Object count) {
    return '($count mga review)';
  }

  @override
  String get specialties => 'Mga Espesyalista';

  @override
  String get experience => 'Kasinatian';

  @override
  String get qualification => 'Kwalipikasyon';

  @override
  String get education => 'Edukasyon';

  @override
  String get recoveryTips =>
      '• Pagkuha og screenshot niini nga impormasyon\n• Ibutang kini sa luwas nga dapit\n• Ayaw ipaambit ni bisan kinsa\n• Kini ipakita kausa ra';

  @override
  String get themeSettingsTitle => 'Mga Setting sa Tema';

  @override
  String get lightThemeLabel => 'Kahayag';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Ngitngit';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
