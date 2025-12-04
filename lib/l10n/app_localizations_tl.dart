// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class AppLocalizationsTl extends AppLocalizations {
  AppLocalizationsTl([String locale = 'tl']) : super(locale);

  @override
  String get settingsTitle => 'Mga setting';

  @override
  String get notificationSettings => 'Mga Setting ng Notification';

  @override
  String get privacySettings => 'Mga Setting ng Privacy';

  @override
  String get accountSettings => 'Mga Setting ng Account';

  @override
  String get languageSettings => 'Mga Setting ng Wika';

  @override
  String get languageChanged => 'Nagbago ang wika';

  @override
  String get existingUserButton => 'Ako ay isang umiiral na gumagamit';

  @override
  String get chooseCountryTitle => 'Piliin ang Bansa';

  @override
  String get yesText => 'Oo';

  @override
  String get noText => 'Hindi';

  @override
  String get appBarTitle => 'Mga Setting ng Profile';

  @override
  String get userIdLabel => 'User ID *';

  @override
  String get nameLabel => 'Pangalan';

  @override
  String get birthCountryLabel => 'Bansa ng Kapanganakan';

  @override
  String get birthCityLabel => 'Lungsod ng Kapanganakan';

  @override
  String get countrySelectionTitle => 'Piliin ang iyong bansa';

  @override
  String get maleLabel => 'Lalaki';

  @override
  String get femaleLabel => 'Babae';

  @override
  String get birthDateLabel => 'Petsa ng Kapanganakan';

  @override
  String get birthDatePlaceholder => 'Piliin ang Petsa ng Kapanganakan';

  @override
  String get birthTimeLabel => 'Oras ng Kapanganakan';

  @override
  String get birthTimePlaceholder => 'Piliin ang Oras ng Kapanganakan';

  @override
  String get saveProfileButton => 'I-save ang Profile';

  @override
  String get noCitiesFound => 'Walang nakitang mga lungsod';

  @override
  String cityPlaceholder(Object country) {
    return 'Ipasok ang lungsod sa $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pumili muna ng bansa';

  @override
  String get versionHistoryTitle => 'Kasaysayan ng Bersyon';

  @override
  String get notSetText => 'Hindi nakatakda';

  @override
  String nameHistory(Object name) {
    return 'Pangalan: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Lungsod: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Bansa: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Kasarian: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Petsa ng Kapanganakan: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Oras ng Kapanganakan: $time';
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
    return 'Na-update noong $date';
  }

  @override
  String get userIdRequired => 'Kinakailangan ang User ID';

  @override
  String get profileSaved => 'Matagumpay na na-save ang profile';

  @override
  String get saveFailed => 'Nabigong i-save ang profile';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Piliin ang Iyong Wika';

  @override
  String get onboardingChooseLanguageDesc =>
      'Piliin ang iyong gustong wika upang magpatuloy.';

  @override
  String get onboardingWhatIsAstrology => 'Ano ang Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ang astrolohiya ay ang pag-aaral ng celestial bodies...';

  @override
  String get onboardingWhyUseApp => 'Bakit gagamitin ang app na ito?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Kumuha ng mga personalized na horoscope, pang-araw-araw na hula, at gabay upang makagawa ng matalinong mga pagpapasya.';

  @override
  String get onboardingHowToUse => 'Paano gamitin ang app na ito?';

  @override
  String get onboardingHowToUseDesc =>
      'Madaling mag-navigate, tingnan ang mga araw-araw na horoscope, at pamahalaan ang iyong profile para sa mga tumpak na hula.';

  @override
  String get onboardingGetStarted => 'Magsimula';

  @override
  String get onboardingNewUser => 'Bagong User';

  @override
  String get onboardingExistingUser => 'Umiiral na Gumagamit';

  @override
  String get onboardingBack => 'Bumalik';

  @override
  String get onboardingNext => 'Susunod';

  @override
  String get userIdNotFound =>
      'Hindi nahanap ang user ID. Mangyaring mag-login o itakda ang iyong profile.';

  @override
  String get clearNotificationsTitle => 'I-clear ang Mga Notification';

  @override
  String get clearNotificationsMessage =>
      'Sigurado ka bang gusto mong i-clear ang lahat ng notification?';

  @override
  String get clearNotificationsSuccess =>
      'Matagumpay na na-clear ang lahat ng notification.';

  @override
  String get clearHoroscopeTitle => 'Malinaw na Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Sigurado ka bang gusto mong i-clear ang iyong data ng horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Matagumpay na na-clear ang horoscope.';

  @override
  String get clearChatTitle => 'I-clear ang History ng Chat';

  @override
  String get clearChatMessage =>
      'Sigurado ka bang gusto mong tanggalin ang lahat ng iyong kasaysayan ng chat?';

  @override
  String get clearChatLocal => 'Na-clear ang chat nang lokal.';

  @override
  String get deleteAccountTitle => 'Tanggalin ang Account';

  @override
  String get deleteAccountMessage =>
      'Sigurado ka bang gusto mong tanggalin ang iyong account? Iki-clear din nito ang lahat ng iyong history ng chat at mga notification.';

  @override
  String get deleteAccountSuccess =>
      'Inalis ang iyong account at lahat ng data.';

  @override
  String get deleteAccountError => 'Error sa pagtanggal ng account';

  @override
  String get logoutTitle => 'Mag-logout';

  @override
  String get logoutMessage => 'Sigurado ka bang gusto mong mag-logout?';

  @override
  String get termsPrivacyTitle => 'Mga Tuntunin at Privacy';

  @override
  String get privacyPolicyTitle => 'Patakaran sa Privacy';

  @override
  String get termsConditionsTitle => 'Mga Tuntunin at Kundisyon';

  @override
  String get dataControlTitle => 'Kontrol ng Data';

  @override
  String get cancelButton => 'Kanselahin';

  @override
  String get confirmButton => 'Kumpirmahin';

  @override
  String get clearQuestionsSuccess =>
      'Matagumpay na natanggal ang lahat ng tanong.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Panginoon';

  @override
  String get startLabel => 'Magsimula';

  @override
  String get recoverAccount => 'I-recover ang Account';

  @override
  String get endLabel => 'Tapusin';

  @override
  String get startDateLabel => 'Petsa ng Pagsisimula';

  @override
  String get endDateLabel => 'Petsa ng Pagtatapos';

  @override
  String get notAvailable => 'Hindi available';

  @override
  String get noData => 'Walang data';

  @override
  String get unknownError => 'Hindi kilalang error';

  @override
  String get retryButton => 'Subukan muli';

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
  String get unknown => 'Hindi alam';

  @override
  String get clearHoroscope => 'Malinaw na Horoscope';

  @override
  String get clearNotifications => 'I-clear ang Mga Notification';

  @override
  String get clearChatHistory => 'I-clear ang History ng Chat';

  @override
  String get logout => 'Mag-logout';

  @override
  String get deleteAccount => 'Tanggalin ang Account';

  @override
  String get allFieldsRequired => 'Kinakailangan ang lahat ng field.';

  @override
  String get accountRecoveredSuccess => 'Matagumpay na nabawi ang account.';

  @override
  String get recoveryFailed =>
      'Nabigo ang pagbawi. Suriin ang iyong impormasyon.';

  @override
  String get recoverySecretLabel => 'Lihim sa Pagbawi:';

  @override
  String get aboutUsTitle => 'Tungkol sa Amin';

  @override
  String get aboutOurCompany => 'Tungkol sa Aming Kumpanya';

  @override
  String get aboutCompanyDescription =>
      'Sa Karma, tinutulungan ka naming matuklasan ang iyong tunay na landas sa buhay sa pamamagitan ng walang hanggang karunungan ng Vedic na astrolohiya. Ang bawat insight ay nagmumula sa mga tunay, may karanasang mga astrologo, na maingat na ginawa batay sa iyong natatanging birth chart. Mula sa pang-araw-araw na horoscope hanggang sa personalized na patnubay, ginagawang accessible ng Karma ang sinaunang kaalaman sa mahigit 100 wika.';

  @override
  String get ourMission => 'Ang Aming Misyon';

  @override
  String get missionDescription =>
      'Ang aming misyon ay simple: upang magbigay ng tunay, pinamumunuan ng tao na patnubay sa astrolohiya na nagbibigay-kapangyarihan sa iyo na gumawa ng tiwala at matalinong mga desisyon. Ang bawat hula at konsultasyon ay sumasalamin sa mga taon ng propesyonal na kadalubhasaan, hindi mga awtomatikong algorithm.';

  @override
  String get ourVision => 'Ang Ating Pananaw';

  @override
  String get visionDescription =>
      'Nagsusumikap kaming maging pinakapinagkakatiwalaang plataporma sa mundo para sa Vedic na astrolohiya, na tinutulungan ang mga tao sa lahat ng dako na maunawaan ang kanilang sarili, ang kanilang mga pagpipilian, at ang kanilang paglalakbay sa buhay nang may kalinawan at kumpiyansa.';

  @override
  String get ourValues => 'Ang aming mga Halaga';

  @override
  String get valuesDescription =>
      'Sa Karma, pinahahalagahan namin ang pagiging tunay, katumpakan, at tiwala. Nakatuon kami sa pagbibigay ng patnubay na hindi lamang tumpak ngunit makabuluhan din, na tumutulong sa iyong i-navigate ang buhay nang may pananaw at kumpiyansa.';

  @override
  String get contactUs => 'Makipag-ugnayan sa Amin';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Website: www.yourcompany.com';

  @override
  String get customerSupport => 'Suporta sa Customer';

  @override
  String get supportHeroTitle => 'Narito Kami para Tumulong';

  @override
  String get supportHeroDescription =>
      'Punan ang form sa ibaba at babalikan ka ng aming team ng suporta sa lalong madaling panahon.';

  @override
  String get yourName => 'Pangalan mo';

  @override
  String get yourEmail => 'Iyong Email';

  @override
  String get message => 'Mensahe';

  @override
  String get enterEmail => 'Ilagay ang iyong email';

  @override
  String get enterValidEmail => 'Maglagay ng wastong email address';

  @override
  String enterField(Object fieldName) {
    return 'Ilagay ang $fieldName';
  }

  @override
  String get send => 'Ipadala';

  @override
  String get sending => 'Ipinapadala...';

  @override
  String get emailSentSuccess => '✅ Matagumpay na naipadala ang email!';

  @override
  String get emailSendFailed => '❌ Nabigong magpadala ng email';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Mga termino para sa paghahanap...';

  @override
  String get noTermsFound => 'Walang nakitang mga termino';

  @override
  String get buyQuestionsTitle => 'Bumili ng Mga Tanong';

  @override
  String get userNotAuthenticated => 'Hindi na-authenticate ang user';

  @override
  String get loadStoreDataFailed => 'Nabigong i-load ang data ng tindahan';

  @override
  String get missingAuthToken => 'Nawawalang auth token';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Matagumpay ang pagbabayad! Ipinadala ang tanong';

  @override
  String paymentFailed(Object error) {
    return '❌ Nabigo ang pagbabayad: $error';
  }

  @override
  String get yourBalance => 'Iyong Balanse';

  @override
  String questionsBalance(Object count) {
    return '$count Mga Tanong';
  }

  @override
  String get availableOffers => 'Magagamit na Mga Alok';

  @override
  String questionsCount(Object count) {
    return '$count Tanong';
  }

  @override
  String get buyButton => 'Bumili';

  @override
  String get dailyHoroscopeTitle => '🌟 Araw-araw na Horoscope';

  @override
  String get userIdMissing => 'Nawawala ang user ID';

  @override
  String get fetchHoroscopesFailed => 'Nabigong kumuha ng mga horoscope';

  @override
  String get noHoroscopeFound => 'Walang nakitang horoscope.';

  @override
  String get signLabel => 'Lagda';

  @override
  String get todayLabel => 'Ngayong araw';

  @override
  String get yesterdayLabel => 'Kahapon';

  @override
  String get thisWeekLabel => 'Ngayong Linggo';

  @override
  String get lastMonthLabel => 'Noong nakaraang Buwan';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'I-type ang iyong tanong...';

  @override
  String get paymentRequired => 'Kinakailangan ang Pagbabayad';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Nagamit mo na ang iyong mga libreng tanong. Magbayad ng $amount upang magpatuloy.';
  }

  @override
  String get payNowButton => 'Magbayad na';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count libreng tanong ang natitira';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count mga bayad na tanong ang natitira';
  }

  @override
  String get thankYouFeedback => 'Salamat sa iyong feedback!';

  @override
  String get ratingSubmitted => 'Naisumite ang rating!';

  @override
  String get setUserIdFirst => 'Mangyaring itakda muna ang iyong User ID';

  @override
  String get failedToFetchPrevious =>
      'Nabigong makuha ang mga nakaraang tanong at sagot';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Profile ng Astro';

  @override
  String get drawerDailyHoroscope => 'Araw-araw na Horoscope';

  @override
  String get drawerBuyQuestions => 'Bumili ng Mga Tanong';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Mga setting';

  @override
  String get drawerCustomerSupport => 'Suporta sa Customer';

  @override
  String get drawerAbout => 'Tungkol sa';

  @override
  String get drawerProfileSettings => 'Mga Setting ng Profile';

  @override
  String get demoNotificationTitle => '🔔 Abiso sa Demo';

  @override
  String get demoNotificationBody =>
      'Isa itong pansubok na notification mula sa iyong app!';

  @override
  String get notificationsTitle => 'Mga abiso';

  @override
  String get noNotifications => 'Walang notification';

  @override
  String get allTab => 'Lahat';

  @override
  String get markAllAsRead => 'Markahan ang lahat bilang nabasa na';

  @override
  String get notificationMarkedRead =>
      'Ang abiso ay minarkahan bilang nabasa na';

  @override
  String get failedToLoadNotifications =>
      'Nabigong i-load ang mga notification';

  @override
  String get failedToMarkRead => 'Nabigong markahan bilang nabasa na';

  @override
  String get failedToMarkAllRead =>
      'Nabigong markahan ang lahat bilang nabasa na';

  @override
  String get socketConnected => 'Nakakonekta ang socket';

  @override
  String get socketDisconnected => 'Nadiskonekta ang socket';

  @override
  String get newNotificationReceived => 'Bagong abiso ang natanggap';

  @override
  String get generalCategory => 'Heneral';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Mga update';

  @override
  String get howToAskTitle => 'Paano Magtanong';

  @override
  String get noQuestionsAvailable => 'Walang available na katanungan';

  @override
  String get failedToLoadQuestions => 'Nabigong i-load ang mga tanong';

  @override
  String get pullToRefresh => 'Hilahin para i-refresh';

  @override
  String get careerCategory => 'Karera';

  @override
  String get loveCategory => 'Pag-ibig at Relasyon';

  @override
  String get healthCategory => 'Kalusugan';

  @override
  String get financeCategory => 'Pananalapi';

  @override
  String get familyCategory => 'Pamilya';

  @override
  String get educationCategory => 'Edukasyon';

  @override
  String get travelCategory => 'Paglalakbay';

  @override
  String get spiritualCategory => 'Espirituwal';

  @override
  String get profileLoaded => 'Matagumpay na na-load ang profile';

  @override
  String get imageUploaded => 'Matagumpay na na-upload ang larawan';

  @override
  String get savedInformationConfirmation => 'Nai-save Ko ang Impormasyong Ito';

  @override
  String get noHistoryAvailable => 'Walang available na history';

  @override
  String get missingUserIdError => 'Kinakailangan ang User ID';

  @override
  String get networkError => 'Error sa network. Pakisubukang muli.';

  @override
  String get timeoutError => 'Nag-time out ang kahilingan';

  @override
  String get genericError => 'Nagkaproblema';

  @override
  String get reactionUpdateError => 'Nabigong i-update ang reaksyon';

  @override
  String get noSearchResults => 'Walang nakitang resulta ng paghahanap';

  @override
  String get clearSearch => 'I-clear ang paghahanap';

  @override
  String get resultsFound => 'Nakita ang mga resulta';

  @override
  String get recoverySecretHint =>
      'Maaaring hindi gumana ang copy-paste, manu-mano ang pag-type';

  @override
  String get recoverAccountDescription =>
      'Sundin ang mga hakbang na ito upang mabawi ang iyong account';

  @override
  String get processingLabel => 'Pinoproseso...';

  @override
  String get clearChatSuccess => 'Matagumpay na na-clear ang chat';

  @override
  String get notificationsEnabled => 'Pinagana ang mga notification';

  @override
  String get notificationsDisabled => 'Na-disable ang mga notification';

  @override
  String get securityNotice =>
      'Ang iyong data ay ligtas na naka-encrypt at nakaimbak';

  @override
  String get loading => 'Naglo-load...';

  @override
  String get selectLanguage => 'Piliin ang Wika';

  @override
  String get onboardingGetStartedDesc =>
      'Magsimula sa pamamagitan ng pagpili ng iyong wika';

  @override
  String get accountRecoveryTitle => '🔐 Mga Detalye ng Pagbawi ng Account';

  @override
  String get recoveryInstructions =>
      'Mangyaring i-save ang impormasyong ito nang ligtas. Kakailanganin mo ito para mabawi ang iyong account.';

  @override
  String get importantNotice => '⚠️ Mahalaga:';

  @override
  String get astrologerProfileTitle => 'Profile ng Astrologo';

  @override
  String get personalAstrologer => 'Personal na Astrologo';

  @override
  String get makePersonalAstrologer => 'Gumawa ng Personal na Astrologo';

  @override
  String get favoriteDescription =>
      'Ang iyong mga katanungan ay uunahin sa astrologong ito. Kung hindi available, tutulungan ka ng isa pang kwalipikadong astrologo.';

  @override
  String get educationQualifications => 'Edukasyon at Kwalipikasyon';

  @override
  String get aboutSection => 'Tungkol sa';

  @override
  String get shareProfile => 'Ibahagi ang Profile';

  @override
  String get loadingAstrologer => 'Nilo-load ang mga detalye ng astrologo...';

  @override
  String get failedToLoadAstrologer =>
      'Nabigong i-load ang mga detalye ng astrologo';

  @override
  String get authenticationRequired =>
      'Kinakailangan ang pagpapatunay. Mangyaring mag-log in.';

  @override
  String securityCheckFailed(Object error) {
    return 'Nabigo ang pagsusuri sa seguridad: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ay ang iyong Personal na Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Inalis ang $name sa mga paborito';
  }

  @override
  String get toggleFavoriteError => 'Nabigong i-update ang paboritong status';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Edukasyon: $education\n📜 Kwalipikasyon: $qualification\n⏳ Karanasan: $experience';
  }

  @override
  String get notProvided => 'Hindi ibinigay';

  @override
  String reviews(Object count) {
    return '($count mga review)';
  }

  @override
  String get specialties => 'Mga espesyalidad';

  @override
  String get experience => 'Karanasan';

  @override
  String get qualification => 'Kwalipikasyon';

  @override
  String get education => 'Edukasyon';

  @override
  String get recoveryTips =>
      '• Kumuha ng screenshot ng impormasyong ito\n• Itago ito sa isang ligtas na lugar\n• Huwag ibahagi sa sinuman\n• Isang beses lang ito ipapakita';

  @override
  String get themeSettingsTitle => 'Mga Setting ng Tema';

  @override
  String get lightThemeLabel => 'Liwanag';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Madilim';

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

  @override
  String get ourTeam => 'Ang aming Team';

  @override
  String get teamDescription =>
      'Ang aming pangkat ng mga propesyonal na Vedic astrologo ay nagdadala ng mga taon ng karanasan sa pagbibigay kahulugan sa mga impluwensya ng planeta at mga pattern ng buhay. Na-back sa pamamagitan ng isang dedikadong suporta at development team, ang Karma ay naghahatid ng tuluy-tuloy, maaasahan, at pandaigdigang karanasan para sa bawat user.';
}
