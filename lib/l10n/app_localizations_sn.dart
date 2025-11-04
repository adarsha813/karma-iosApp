// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Shona (`sn`).
class AppLocalizationsSn extends AppLocalizations {
  AppLocalizationsSn([String locale = 'sn']) : super(locale);

  @override
  String get settingsTitle => 'Settings';

  @override
  String get notificationSettings => 'Notification Settings';

  @override
  String get privacySettings => 'Zvakavanzika Settings';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get languageSettings => 'Mutauro Settings';

  @override
  String get languageChanged => 'Mutauro wakachinja';

  @override
  String get existingUserButton => 'Ndiri mushandisi aripo';

  @override
  String get chooseCountryTitle => 'Sarudza Nyika';

  @override
  String get yesText => 'Ehe';

  @override
  String get noText => 'Aihwa';

  @override
  String get appBarTitle => 'Profile Settings';

  @override
  String get userIdLabel => 'User ID *';

  @override
  String get nameLabel => 'Zita';

  @override
  String get birthCountryLabel => 'Nyika Yekuzvarwa';

  @override
  String get birthCityLabel => 'Birth City';

  @override
  String get countrySelectionTitle => 'Sarudza nyika yako';

  @override
  String get maleLabel => 'Murume';

  @override
  String get femaleLabel => 'Mukadzi';

  @override
  String get birthDateLabel => 'Birth Date';

  @override
  String get birthDatePlaceholder => 'Sarudza Zuva Rekuzvarwa';

  @override
  String get birthTimeLabel => 'Nguva Yekuzvarwa';

  @override
  String get birthTimePlaceholder => 'Sarudza Nguva Yekuzvarwa';

  @override
  String get saveProfileButton => 'Sevha Profile';

  @override
  String get noCitiesFound => 'Hapana maguta awanikwa';

  @override
  String cityPlaceholder(Object country) {
    return 'Pinda muguta mu $country';
  }

  @override
  String get countryFirstPlaceholder => 'Sarudza nyika kutanga';

  @override
  String get versionHistoryTitle => 'Version History';

  @override
  String get notSetText => 'Not set';

  @override
  String nameHistory(Object name) {
    return 'Zita: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Guta: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Nyika: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Zuva rekuzvarwa: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Nguva yekuzvarwa: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Nzvimbo: $latitude, $longitude';
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
    return 'Nyika: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Yakagadziridzwa pa $date';
  }

  @override
  String get userIdRequired => 'Mushandisi ID inodiwa';

  @override
  String get profileSaved => 'Profile yakachengetedzwa zvakanaka';

  @override
  String get saveFailed => 'Tatadza kuchengetedza chimiro';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Sarudza Mutauro Wako';

  @override
  String get onboardingChooseLanguageDesc =>
      'Sarudza mutauro waunoda kuti uenderere mberi.';

  @override
  String get onboardingWhatIsAstrology => 'Chii chinonzi Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology chidzidzo chemiviri yemudenga...';

  @override
  String get onboardingWhyUseApp => 'Sei kushandisa iyi app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Tora yakasarudzika horoscopes, kufanotaura kwemazuva ese, uye nhungamiro yekuita sarudzo dzine ruzivo.';

  @override
  String get onboardingHowToUse => 'Nzira yekushandisa sei iyi app?';

  @override
  String get onboardingHowToUseDesc =>
      'Famba zviri nyore, tarisa horoscopes zuva nezuva, uye tonga chimiro chako kuti uwane fungidziro chaiyo.';

  @override
  String get onboardingGetStarted => 'Tanga';

  @override
  String get onboardingNewUser => 'Mushandisi Mutsva';

  @override
  String get onboardingExistingUser => 'Mushandisi Aripo';

  @override
  String get onboardingBack => 'Back';

  @override
  String get onboardingNext => 'Next';

  @override
  String get userIdNotFound =>
      'ID yemushandisi haina kuwanikwa. Ndokumbira upinde kana kuseta profil yako.';

  @override
  String get clearNotificationsTitle => 'Clear Notifications';

  @override
  String get clearNotificationsMessage =>
      'Une chokwadi chekuti unoda kudzima zviziviso zvese?';

  @override
  String get clearNotificationsSuccess =>
      'Zvese zviziviso zvabviswa zvinobudirira.';

  @override
  String get clearHoroscopeTitle => 'Clear Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Une chokwadi chekuti unoda kudzima data rako rehoroscope?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope yapedzwa zvinobudirira.';

  @override
  String get clearChatTitle => 'Bvisa Chat History';

  @override
  String get clearChatMessage =>
      'Une chokwadi chekuti unoda kudzima nhoroondo yako yese yekutaura?';

  @override
  String get clearChatLocal => 'Nhaurirano yadzimwa munharaunda.';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountMessage =>
      'Une chokwadi chekuti unoda kudzima account yako? Izvi zvichabvisawo nhoroondo yako yese yekutaura uye zviziviso.';

  @override
  String get deleteAccountSuccess => 'Akaunti yako nedata rese zvabviswa.';

  @override
  String get deleteAccountError => 'Pakanganisika pakudzima account';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutMessage => 'Une chokwadi chekuti unoda kubuda?';

  @override
  String get termsPrivacyTitle => 'Terms & Privacy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get termsConditionsTitle => 'Terms & Conditions';

  @override
  String get dataControlTitle => 'Data Control';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get clearQuestionsSuccess => 'Mibvunzo yese yadzimwa zvakanaka.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Ishe';

  @override
  String get startLabel => 'Tanga';

  @override
  String get recoverAccount => 'Dzorera Akaunti';

  @override
  String get endLabel => 'End';

  @override
  String get startDateLabel => 'Zuva Rokutanga';

  @override
  String get endDateLabel => 'End Date';

  @override
  String get notAvailable => 'Not available';

  @override
  String get noData => 'Hapana data';

  @override
  String get unknownError => 'Kukanganisa kusingazivikanwe';

  @override
  String get retryButton => 'Edza zvakare';

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
  String get unknown => 'Unknown';

  @override
  String get clearHoroscope => 'Clear Horoscope';

  @override
  String get clearNotifications => 'Clear Notifications';

  @override
  String get clearChatHistory => 'Bvisa Chat History';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get allFieldsRequired => 'Minda yese inodiwa.';

  @override
  String get accountRecoveredSuccess => 'Akaunti yawanazve zvakanaka.';

  @override
  String get recoveryFailed => 'Kupora kwakundikana. Tarisa ruzivo rwako.';

  @override
  String get recoverySecretLabel => 'Recovery Secret:';

  @override
  String get aboutUsTitle => 'Nezvedu';

  @override
  String get aboutOurCompany => 'Nezve Kambani Yedu';

  @override
  String get aboutCompanyDescription =>
      'Isu takazvipira kuendesa yakanakisa ruzivo rwenyeredzi kune vashandisi vedu.';

  @override
  String get ourMission => 'Basa Redu';

  @override
  String get missionDescription =>
      'Kupa kwakaringana uye yakasarudzika nyeredzi ruzivo rwekubatsira vashandisi kuita sarudzo dzine ruzivo muhupenyu hwavo.';

  @override
  String get ourVision => 'Muono Wedu';

  @override
  String get visionDescription =>
      'Kuti ive iyo yakavimbika kwazvo nyeredzi chikuva, kubatanidza tekinoroji uye huchenjeri hwekare.';

  @override
  String get ourValues => 'Tsika dzedu';

  @override
  String get valuesDescription =>
      'Kuvimbika, Kururama, Mushandisi-Yepakati Dhizaini, uye Inoenderera Innovation.';

  @override
  String get contactUs => 'Taura nesu';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webhusaiti: www.yourcompany.com';

  @override
  String get customerSupport => 'Mutengi Tsigiro';

  @override
  String get supportHeroTitle => 'Tiripo Kukubatsira';

  @override
  String get supportHeroDescription =>
      'Zadza fomu riri pazasi uye timu yedu yekutsigira ichadzoka kwauri nekukurumidza sezvinobvira.';

  @override
  String get yourName => 'Zita renyu';

  @override
  String get yourEmail => 'Email yako';

  @override
  String get message => 'Mharidzo';

  @override
  String get enterEmail => 'Isa email yako';

  @override
  String get enterValidEmail => 'Isa kero yeemail inoshanda';

  @override
  String enterField(Object fieldName) {
    return 'Pinda $fieldName';
  }

  @override
  String get send => 'Send';

  @override
  String get sending => 'Kutumira...';

  @override
  String get emailSentSuccess => '✅ Email yakatumirwa zvinobudirira!';

  @override
  String get emailSendFailed => '❌ Tatadza kutumira email';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Matemu ekutsvaga...';

  @override
  String get noTermsFound => 'Hapana mazwi awanikwa';

  @override
  String get buyQuestionsTitle => 'Tenga Mibvunzo';

  @override
  String get userNotAuthenticated => 'Mushandisi haana chokwadi';

  @override
  String get loadStoreDataFailed => 'Tatadza kurodha data remuchitoro';

  @override
  String get missingAuthToken => 'Chipo chechiratidzo chisipo';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Kubhadhara kwakabudirira! Mubvunzo wakatumirwa';

  @override
  String paymentFailed(Object error) {
    return '❌ Kubhadhara kwatadza: $error';
  }

  @override
  String get yourBalance => 'Yako Balance';

  @override
  String questionsBalance(Object count) {
    return '$count Mibvunzo';
  }

  @override
  String get availableOffers => 'Available Offers';

  @override
  String questionsCount(Object count) {
    return '$count Mubvunzo';
  }

  @override
  String get buyButton => 'Buy';

  @override
  String get dailyHoroscopeTitle => '🌟 Zuva Nezuva Horoscope';

  @override
  String get userIdMissing => 'ID yemushandisi haipo';

  @override
  String get fetchHoroscopesFailed => 'Tatadza kutora mahoroscope';

  @override
  String get noHoroscopeFound => 'Hapana horoscope yawanikwa.';

  @override
  String get signLabel => 'Sign';

  @override
  String get todayLabel => 'Nhasi';

  @override
  String get yesterdayLabel => 'Nezuro';

  @override
  String get thisWeekLabel => 'Svondo rino';

  @override
  String get lastMonthLabel => 'Mwedzi Wapera';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Nyora mubvunzo wako...';

  @override
  String get paymentRequired => 'Kubhadhara Kunodiwa';

  @override
  String get paymentRequiredMessage =>
      'Washandisa mibvunzo yako yemahara. Bhadhara ₹50 kuti uenderere mberi.';

  @override
  String get payNowButton => 'Pay Now';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count mibvunzo yemahara yasara';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count mibvunzo yakabhadharwa yasara';
  }

  @override
  String get thankYouFeedback => 'Ndatenda nemhinduro yako!';

  @override
  String get ratingSubmitted => 'Rating yatumirwa!';

  @override
  String get setUserIdFirst => 'Ndokumbira uise ID yako yeMushandisi kutanga';

  @override
  String get failedToFetchPrevious =>
      'Tatadza kutora mibvunzo nemhinduro dzapfuura';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'Daily Horoscope';

  @override
  String get drawerBuyQuestions => 'Tenga Mibvunzo';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Settings';

  @override
  String get drawerCustomerSupport => 'Mutengi Tsigiro';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerProfileSettings => 'Profile Settings';

  @override
  String get demoNotificationTitle => '🔔 Demo Notification';

  @override
  String get demoNotificationBody =>
      'Ichi chiziviso chekuyedza kubva kuapp yako!';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get noNotifications => 'Hapana zviziviso';

  @override
  String get allTab => 'Zvose';

  @override
  String get markAllAsRead => 'Maka zvese sekuverengwa';

  @override
  String get notificationMarkedRead => 'Chiziviso chakanyorwa sechaverengwa';

  @override
  String get failedToLoadNotifications => 'Tatadza kuisa zviziviso';

  @override
  String get failedToMarkRead => 'Watadza kumaka sekuverengwa';

  @override
  String get failedToMarkAllRead => 'Tatadza kumaka ese seaverengwa';

  @override
  String get socketConnected => 'Socket yakabatana';

  @override
  String get socketDisconnected => 'Socket yakabviswa';

  @override
  String get newNotificationReceived => 'Chiziviso chitsva chagamuchirwa';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Updates';

  @override
  String get howToAskTitle => 'Mabvunza Sei';

  @override
  String get noQuestionsAvailable => 'Hapana mibvunzo iripo';

  @override
  String get failedToLoadQuestions => 'Yatadza kuburitsa mibvunzo';

  @override
  String get pullToRefresh => 'Dhonza kuti uvandudze';

  @override
  String get careerCategory => 'Basa';

  @override
  String get loveCategory => 'Rudo & Hukama';

  @override
  String get healthCategory => 'Utano';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Mhuri';

  @override
  String get educationCategory => 'Dzidzo';

  @override
  String get travelCategory => 'Travel';

  @override
  String get spiritualCategory => 'Zvemweya';

  @override
  String get profileLoaded => 'Profile yakabudirira';

  @override
  String get imageUploaded => 'Mufananidzo wakwikwidzwa zvakanaka';

  @override
  String get savedInformationConfirmation => 'Ndachengeta Ruzivo urwu';

  @override
  String get noHistoryAvailable => 'Hapana nhoroondo iripo';

  @override
  String get missingUserIdError => 'Mushandisi ID inodiwa';

  @override
  String get networkError => 'Network kukanganisa. Ndapota edza zvakare.';

  @override
  String get timeoutError => 'Chikumbiro chapera';

  @override
  String get genericError => 'Pane chakaipa';

  @override
  String get reactionUpdateError => 'Tatadza kugadzirisa maitiro';

  @override
  String get noSearchResults => 'Hapana mibairo yekutsvaga yawanikwa';

  @override
  String get clearSearch => 'Bvisa kutsvaga';

  @override
  String get resultsFound => 'Mhinduro dzawanikwa';

  @override
  String get recoverySecretHint =>
      'Copy-paste inogona kusashanda, nyora nemaoko';

  @override
  String get recoverAccountDescription =>
      'Tevedza nhanho idzi kuti udzore account yako';

  @override
  String get processingLabel => 'Kugadzira...';

  @override
  String get clearChatSuccess => 'Chat yadzimwa';

  @override
  String get notificationsEnabled => 'Zviziviso zvagoneswa';

  @override
  String get notificationsDisabled => 'Zviziviso zvadzimwa';

  @override
  String get securityNotice =>
      'Yako data yakavharidzirwa zvakachengeteka uye kuchengetwa';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLanguage => 'Sarudza Mutauro';

  @override
  String get onboardingGetStartedDesc => 'Tanga nekusarudza mutauro wako';

  @override
  String get accountRecoveryTitle => '🔐 Nhoroondo Yekudzoreredza Akaundi';

  @override
  String get recoveryInstructions =>
      'Ndapota chengetedza ruzivo urwu zvakachengeteka. Unochida kuti utore account yako.';

  @override
  String get importantNotice => '⚠️ Zvakakosha:';

  @override
  String get astrologerProfileTitle => 'Nhoroondo Yevazivi venyeredzi';

  @override
  String get personalAstrologer => 'Muzivi Wenyeredzi Pachako';

  @override
  String get makePersonalAstrologer => 'Ita Muzivi Wenyeredzi Pachako';

  @override
  String get favoriteDescription =>
      'Mibvunzo yako inozokosheswa kumuzivi wenyeredzi uyu. Kana usingawanikwe, mumwe muongorori wenyeredzi achakubatsira.';

  @override
  String get educationQualifications => 'Dzidzo & Zvakakodzera';

  @override
  String get aboutSection => 'About';

  @override
  String get shareProfile => 'Share Profile';

  @override
  String get loadingAstrologer => 'Kurodha ruzivo rwevazivi venyeredzi...';

  @override
  String get failedToLoadAstrologer =>
      'Tatadza kuburitsa ruzivo rwevazivi venyeredzi';

  @override
  String get authenticationRequired => 'Kusimbisa kunodiwa. Ndapota pinda.';

  @override
  String securityCheckFailed(Object error) {
    return 'Chengetedzo yechengetedzo yakundikana: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is now your Personal Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Yakabviswa $name kubva kune vanofarira';
  }

  @override
  String get toggleFavoriteError => 'Tatadza kugadzirisa favourite status';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Dzidzo: $education\n📜 Kukodzera: $qualification\n⏳ Zvakaitika: $experience';
  }

  @override
  String get notProvided => 'Haana kupihwa';

  @override
  String reviews(Object count) {
    return '($count wongororo)';
  }

  @override
  String get specialties => 'Specialties';

  @override
  String get experience => 'Zvakaitika';

  @override
  String get qualification => 'Qualification';

  @override
  String get education => 'Dzidzo';

  @override
  String get recoveryTips =>
      '• Tora skrini yeruzivo urwu\n• Zvichengete munzvimbo yakachengeteka\n• Usagovana nemunhu\n• Izvi zvicharatidzwa kamwe chete';
}
