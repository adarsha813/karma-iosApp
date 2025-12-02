// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([String locale = 'ha']) : super(locale);

  @override
  String get settingsTitle => 'Saituna';

  @override
  String get notificationSettings => 'Saitunan Sanarwa';

  @override
  String get privacySettings => 'Saitunan Sirri';

  @override
  String get accountSettings => 'Saitunan Asusu';

  @override
  String get languageSettings => 'Saitunan Harshe';

  @override
  String get languageChanged => 'An canza harshe';

  @override
  String get existingUserButton => 'Ni mai amfani ne';

  @override
  String get chooseCountryTitle => 'Zabi Ƙasa';

  @override
  String get yesText => 'Ee';

  @override
  String get noText => 'A\'a';

  @override
  String get appBarTitle => 'Saitunan Bayani';

  @override
  String get userIdLabel => 'ID mai amfani*';

  @override
  String get nameLabel => 'Suna';

  @override
  String get birthCountryLabel => 'Ƙasar Haihuwa';

  @override
  String get birthCityLabel => 'Birnin Haihuwa';

  @override
  String get countrySelectionTitle => 'Zabi ƙasar ku';

  @override
  String get maleLabel => 'Namiji';

  @override
  String get femaleLabel => 'Mace';

  @override
  String get birthDateLabel => 'Ranar haifuwa';

  @override
  String get birthDatePlaceholder => 'Zaɓi Ranar Haihuwa';

  @override
  String get birthTimeLabel => 'Lokacin Haihuwa';

  @override
  String get birthTimePlaceholder => 'Zaɓi Lokacin Haihuwa';

  @override
  String get saveProfileButton => 'Ajiye bayanan martaba';

  @override
  String get noCitiesFound => 'Babu garuruwan da aka samu';

  @override
  String cityPlaceholder(Object country) {
    return 'Shigar da birni a cikin $country';
  }

  @override
  String get countryFirstPlaceholder => 'Zaɓi ƙasa tukuna';

  @override
  String get versionHistoryTitle => 'Tarihin Sigar';

  @override
  String get notSetText => 'Ba a saita ba';

  @override
  String nameHistory(Object name) {
    return 'Name: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'City: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ƙasa: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jinsi: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Birth Date: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Birth Time: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Wuri: <span data-placeholder=\"latitude\"> </span>, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Yankin lokaci: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'State: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'An sabunta shi a kan $date';
  }

  @override
  String get userIdRequired => 'Ana buƙatar ID mai amfani';

  @override
  String get profileSaved => 'An adana bayanan martaba cikin nasara';

  @override
  String get saveFailed => 'An kasa ajiye bayanin martaba';

  @override
  String get errorPrefix => 'Kuskure:';

  @override
  String get onboardingChooseLanguage => 'Zaɓi Harshenku';

  @override
  String get onboardingChooseLanguageDesc =>
      'Zaɓi harshen da kuka fi so don ci gaba.';

  @override
  String get onboardingWhatIsAstrology => 'Menene Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology shine nazarin jikunan sama...';

  @override
  String get onboardingWhyUseApp => 'Me yasa amfani da wannan app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Samo keɓaɓɓen horoscopes, tsinkaya na yau da kullun, da jagora don yanke shawara na yau da kullun.';

  @override
  String get onboardingHowToUse => 'Yadda ake amfani da wannan app?';

  @override
  String get onboardingHowToUseDesc =>
      'Yi kewayawa cikin sauƙi, bincika horoscopes na yau da kullun, kuma sarrafa bayanan martaba don ingantattun tsinkaya.';

  @override
  String get onboardingGetStarted => 'Fara';

  @override
  String get onboardingNewUser => 'Sabon Mai Amfani';

  @override
  String get onboardingExistingUser => 'Mai Amfani';

  @override
  String get onboardingBack => 'Baya';

  @override
  String get onboardingNext => 'Na gaba';

  @override
  String get userIdNotFound =>
      'Ba a sami ID na mai amfani ba. Da fatan za a shiga ko saita bayanin martaba.';

  @override
  String get clearNotificationsTitle => 'Share Fadakarwa';

  @override
  String get clearNotificationsMessage =>
      'Shin kun tabbata kuna son share duk sanarwar?';

  @override
  String get clearNotificationsSuccess => 'An share duk sanarwar cikin nasara.';

  @override
  String get clearHoroscopeTitle => 'Share Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Shin kun tabbata kuna son share bayanan horoscope ɗin ku?';

  @override
  String get clearHoroscopeSuccess => 'An share horoscope cikin nasara.';

  @override
  String get clearChatTitle => 'Share Tarihin Taɗi';

  @override
  String get clearChatMessage =>
      'Shin kun tabbata kuna son share duk tarihin taɗi na ku?';

  @override
  String get clearChatLocal => 'An share taɗi a cikin gida.';

  @override
  String get deleteAccountTitle => 'Share Account';

  @override
  String get deleteAccountMessage =>
      'Ka tabbata kana son share asusunka? Wannan kuma zai share duk tarihin taɗi da sanarwarku.';

  @override
  String get deleteAccountSuccess => 'An cire asusun ku da duk bayanan.';

  @override
  String get deleteAccountError => 'Kuskuren share asusun';

  @override
  String get logoutTitle => 'Fita';

  @override
  String get logoutMessage => 'Kun tabbata kuna son fita?';

  @override
  String get termsPrivacyTitle => 'Sharuɗɗa & Keɓantawa';

  @override
  String get privacyPolicyTitle => 'takardar kebantawa';

  @override
  String get termsConditionsTitle => 'Sharuɗɗa & Sharuɗɗa';

  @override
  String get dataControlTitle => 'Kula da bayanai';

  @override
  String get cancelButton => 'Soke';

  @override
  String get confirmButton => 'Tabbatar';

  @override
  String get clearQuestionsSuccess => 'An goge duk tambayoyin cikin nasara.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Ubangiji';

  @override
  String get startLabel => 'Fara';

  @override
  String get recoverAccount => 'Maida Asusu';

  @override
  String get endLabel => 'Ƙarshe';

  @override
  String get startDateLabel => 'Ranar farawa';

  @override
  String get endDateLabel => 'Kwanan Ƙarshen';

  @override
  String get notAvailable => 'Babu';

  @override
  String get noData => 'Babu bayanai';

  @override
  String get unknownError => 'Kuskuren da ba a sani ba';

  @override
  String get retryButton => 'Sake gwadawa';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Natal Chart';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Matsayin Digiri';

  @override
  String get vimshottariDashaTitle => 'Vimshotari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ba a sani ba';

  @override
  String get clearHoroscope => 'Share Horoscope';

  @override
  String get clearNotifications => 'Share Fadakarwa';

  @override
  String get clearChatHistory => 'Share Tarihin Taɗi';

  @override
  String get logout => 'Fita';

  @override
  String get deleteAccount => 'Share Account';

  @override
  String get allFieldsRequired => 'Ana buƙatar duk filayen.';

  @override
  String get accountRecoveredSuccess => 'An dawo da asusun cikin nasara.';

  @override
  String get recoveryFailed => 'An kasa farfadowa. Duba bayanan ku.';

  @override
  String get recoverySecretLabel => 'Sirrin farfadowa:';

  @override
  String get aboutUsTitle => 'Game da Mu';

  @override
  String get aboutOurCompany => 'Game da Kamfaninmu';

  @override
  String get aboutCompanyDescription =>
      'Mun himmatu don isar da mafi kyawun ƙwarewar taurari ga masu amfani da mu.';

  @override
  String get ourMission => 'Manufar Mu';

  @override
  String get missionDescription =>
      'Don samar da ingantattun bayanan taurari na keɓaɓɓen don taimakawa masu amfani su yanke shawara mai zurfi a rayuwarsu.';

  @override
  String get ourVision => 'Burinmu';

  @override
  String get visionDescription =>
      'Don zama mafi amintaccen dandalin taurari, haɗa fasaha da tsohuwar hikima.';

  @override
  String get ourValues => 'Darajojin mu';

  @override
  String get valuesDescription =>
      'Mutunci, Daidaito, Tsara-Cintar Mai Amfani, da Cigaba da Ƙirƙiri.';

  @override
  String get contactUs => 'Tuntube Mu';

  @override
  String get contactEmail => 'Imel: support@yourcompany.com';

  @override
  String get contactWebsite => 'Yanar Gizo: www.yourcompany.com';

  @override
  String get customerSupport => 'Tallafin Abokin Ciniki';

  @override
  String get supportHeroTitle => 'Muna nan don Taimakawa';

  @override
  String get supportHeroDescription =>
      'Cika fom ɗin da ke ƙasa kuma ƙungiyar tallafin mu za ta dawo gare ku da wuri-wuri.';

  @override
  String get yourName => 'Sunan ku';

  @override
  String get yourEmail => 'Imel ɗin ku';

  @override
  String get message => 'Sako';

  @override
  String get enterEmail => 'Shigar da imel ɗin ku';

  @override
  String get enterValidEmail => 'Shigar da ingantaccen adireshin imel';

  @override
  String enterField(Object fieldName) {
    return 'Shigar da $fieldName';
  }

  @override
  String get send => 'Aika';

  @override
  String get sending => 'Ana aikawa...';

  @override
  String get emailSentSuccess => '✅ An aika imel cikin nasara!';

  @override
  String get emailSendFailed => '❌ An kasa aika imel';

  @override
  String get astroDictionaryTitle => 'Kamus na Astro';

  @override
  String get searchTermsHint => 'Neman sharuddan...';

  @override
  String get noTermsFound => 'Ba a sami sharuɗɗan ba';

  @override
  String get buyQuestionsTitle => 'Sayi Tambayoyi';

  @override
  String get userNotAuthenticated => 'Ba a tantance mai amfani ba';

  @override
  String get loadStoreDataFailed => 'An kasa loda bayanan ajiya';

  @override
  String get missingAuthToken => 'Babu alamar auth';

  @override
  String get merchantDisplayName => 'Bayanin App na Astro Chat';

  @override
  String get paymentSuccessful => '✅ Biyan ya yi nasara! An aika tambaya';

  @override
  String paymentFailed(Object error) {
    return '❌ Biyan kuɗi ya gaza: $error';
  }

  @override
  String get yourBalance => 'Balance ku';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Akwai Abubuwan Taimako';

  @override
  String questionsCount(Object count) {
    return '$count Tambaya';
  }

  @override
  String get buyButton => 'Saya';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope na yau da kullun';

  @override
  String get userIdMissing => 'ID mai amfani ya ɓace';

  @override
  String get fetchHoroscopesFailed => 'Ba a yi nasarar debo horoscopes ba';

  @override
  String get noHoroscopeFound => 'Ba a sami horoscope ba.';

  @override
  String get signLabel => 'Alama';

  @override
  String get todayLabel => 'Yau';

  @override
  String get yesterdayLabel => 'Jiya';

  @override
  String get thisWeekLabel => 'Wannan Makon';

  @override
  String get lastMonthLabel => 'A watan da ya gabata';

  @override
  String get chatTitle => 'Taɗi';

  @override
  String get typeYourQuestionHint => 'Buga tambayar ku...';

  @override
  String get paymentRequired => 'Ana Bukatar Biyan Kuɗi';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Kun yi amfani da tambayoyinku kyauta. Biya ₹50 don ci gaba.';
  }

  @override
  String get payNowButton => 'Biya Yanzu';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count free questions remaining';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count paid questions remaining';
  }

  @override
  String get thankYouFeedback => 'Na gode da ra\'ayin ku!';

  @override
  String get ratingSubmitted => 'An ƙaddamar da ƙima!';

  @override
  String get setUserIdFirst => 'Da fatan za a saita ID na mai amfani tukuna';

  @override
  String get failedToFetchPrevious =>
      'An kasa kawo tambayoyi da amsoshi na baya';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Bayanan Bayani na Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope na yau da kullun';

  @override
  String get drawerBuyQuestions => 'Sayi Tambayoyi';

  @override
  String get drawerAstroDictionary => 'Kamus na Astro';

  @override
  String get drawerSettings => 'Saituna';

  @override
  String get drawerCustomerSupport => 'Tallafin Abokin Ciniki';

  @override
  String get drawerAbout => 'Game da';

  @override
  String get drawerProfileSettings => 'Saitunan Bayani';

  @override
  String get demoNotificationTitle => '🔔 Sanarwa Demo';

  @override
  String get demoNotificationBody =>
      'Wannan sanarwar gwaji ce daga app ɗin ku!';

  @override
  String get notificationsTitle => 'Sanarwa';

  @override
  String get noNotifications => 'Babu sanarwa';

  @override
  String get allTab => 'Duka';

  @override
  String get markAllAsRead => 'Yi alama duka kamar yadda aka karanta';

  @override
  String get notificationMarkedRead =>
      'Sanarwa alama kamar yadda ake karantawa';

  @override
  String get failedToLoadNotifications => 'An kasa loda sanarwar';

  @override
  String get failedToMarkRead => 'An kasa yin alama kamar yadda ake karantawa';

  @override
  String get failedToMarkAllRead =>
      'An kasa yiwa duk alama kamar yadda aka karanta';

  @override
  String get socketConnected => 'An haɗa soket';

  @override
  String get socketDisconnected => 'An katse soket';

  @override
  String get newNotificationReceived => 'An karɓi sabon sanarwar';

  @override
  String get generalCategory => 'Gabaɗaya';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Taɗi';

  @override
  String get systemCategory => 'Tsari';

  @override
  String get updateCategory => 'Sabuntawa';

  @override
  String get howToAskTitle => 'Yadda Ake Tambaya';

  @override
  String get noQuestionsAvailable => 'Babu tambayoyi akwai';

  @override
  String get failedToLoadQuestions => 'An kasa loda tambayoyi';

  @override
  String get pullToRefresh => 'Ja don sabuntawa';

  @override
  String get careerCategory => 'Sana\'a';

  @override
  String get loveCategory => 'Soyayya & Dangantaka';

  @override
  String get healthCategory => 'Lafiya';

  @override
  String get financeCategory => 'Kudi';

  @override
  String get familyCategory => 'Iyali';

  @override
  String get educationCategory => 'Ilimi';

  @override
  String get travelCategory => 'Tafiya';

  @override
  String get spiritualCategory => 'Ruhaniya';

  @override
  String get profileLoaded => 'An ɗora bayanin martaba cikin nasara';

  @override
  String get imageUploaded => 'An ɗora hoton cikin nasara';

  @override
  String get savedInformationConfirmation => 'Na Ajiye Wannan Bayanin';

  @override
  String get noHistoryAvailable => 'Babu tarihi akwai';

  @override
  String get missingUserIdError => 'Ana buƙatar ID mai amfani';

  @override
  String get networkError =>
      'Kuskuren hanyar sadarwa. Da fatan za a sake gwadawa.';

  @override
  String get timeoutError => 'Neman ya ƙare';

  @override
  String get genericError => 'Wani abu ya faru';

  @override
  String get reactionUpdateError => 'An kasa sabunta martani';

  @override
  String get noSearchResults => 'Ba a sami sakamakon bincike ba';

  @override
  String get clearSearch => 'Share bincike';

  @override
  String get resultsFound => 'An samo sakamako';

  @override
  String get recoverySecretHint =>
      'Kwafi-manna bazai yi aiki ba, rubuta da hannu';

  @override
  String get recoverAccountDescription =>
      'Bi waɗannan matakan don dawo da asusunku';

  @override
  String get processingLabel => 'Ana aiwatarwa...';

  @override
  String get clearChatSuccess => 'An share taɗi cikin nasara';

  @override
  String get notificationsEnabled => 'An kunna sanarwar';

  @override
  String get notificationsDisabled => 'An kashe sanarwar';

  @override
  String get securityNotice =>
      'An rufaffen bayanan ku cikin aminci kuma an adana shi';

  @override
  String get loading => 'Ana lodawa...';

  @override
  String get selectLanguage => 'Zaɓi Harshe';

  @override
  String get onboardingGetStartedDesc => 'Fara ta hanyar zabar yaren ku';

  @override
  String get accountRecoveryTitle => '🔐 Bayanin Maido da Asusu';

  @override
  String get recoveryInstructions =>
      'Da fatan za a adana wannan bayanin amintacce. Kuna buƙatar shi don dawo da asusun ku.';

  @override
  String get importantNotice => '⚠️ Muhimmanci:';

  @override
  String get astrologerProfileTitle => 'Bayanin Taurari';

  @override
  String get personalAstrologer => 'Masanin Taurari na Kai';

  @override
  String get makePersonalAstrologer => 'Yi Tauraron Dan Adam';

  @override
  String get favoriteDescription =>
      'Tambayoyinku za a ba su fifiko ga wannan masanin taurari. Idan babu, wani ƙwararren masanin taurari zai taimake ku.';

  @override
  String get educationQualifications => 'Ilimi & Kwarewa';

  @override
  String get aboutSection => 'Game da';

  @override
  String get shareProfile => 'Raba Bayanan martaba';

  @override
  String get loadingAstrologer => 'Ana loda bayanan taurari...';

  @override
  String get failedToLoadAstrologer => 'An kasa loda bayanan taurari';

  @override
  String get authenticationRequired =>
      'Ana buƙatar tabbaci. Da fatan za a shiga';

  @override
  String securityCheckFailed(Object error) {
    return 'Binciken tsaro ya kasa: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is now your Personal Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ An cire $name daga abubuwan da aka fi so';
  }

  @override
  String get toggleFavoriteError => 'An kasa sabunta matsayin da aka fi so';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '<span data-placeholder=\"name\"> </span>\n🎓 Ilimi: $education\n📜 Qualification: $qualification\n⏳ Kwarewa: $experience';
  }

  @override
  String get notProvided => 'Ba a bayar ba';

  @override
  String reviews(Object count) {
    return '($count sake dubawa)';
  }

  @override
  String get specialties => 'Musamman';

  @override
  String get experience => 'Kwarewa';

  @override
  String get qualification => 'cancanta';

  @override
  String get education => 'Ilimi';

  @override
  String get recoveryTips =>
      '• Ɗauki hoton wannan bayanin\n• Ajiye shi a wuri mai tsaro\n• Kada ku raba tare da kowa\nZa a nuna wannan sau ɗaya kawai';

  @override
  String get themeSettingsTitle => 'Saitunan Jigo';

  @override
  String get lightThemeLabel => 'Haske';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Duhu';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Tsari';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
