// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hmong Mong (`hmn`).
class AppLocalizationsHmn extends AppLocalizations {
  AppLocalizationsHmn([String locale = 'hmn']) : super(locale);

  @override
  String get settingsTitle => 'Chaw';

  @override
  String get notificationSettings => 'Kev ceeb toom chaw';

  @override
  String get privacySettings => 'Kev ceev ntiag tug';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get languageSettings => 'Kev teeb tsa lus';

  @override
  String get languageChanged => 'Lus hloov';

  @override
  String get existingUserButton => 'Kuv yog ib tug neeg siv uas twb muaj lawm';

  @override
  String get chooseCountryTitle => 'Xaiv lub teb chaws';

  @override
  String get yesText => 'Yog lawm';

  @override
  String get noText => 'Tsis muaj';

  @override
  String get appBarTitle => 'Kev teeb tsa Profile';

  @override
  String get userIdLabel => 'Tus neeg siv ID *';

  @override
  String get nameLabel => 'Lub npe';

  @override
  String get birthCountryLabel => 'Lub Tebchaws yug';

  @override
  String get birthCityLabel => 'Lub nroog yug';

  @override
  String get countrySelectionTitle => 'Xaiv koj lub tebchaws';

  @override
  String get maleLabel => 'Txiv neej';

  @override
  String get femaleLabel => 'Poj niam';

  @override
  String get birthDateLabel => 'Hnub yug';

  @override
  String get birthDatePlaceholder => 'Xaiv Hnub Yug';

  @override
  String get birthTimeLabel => 'Hnub yug';

  @override
  String get birthTimePlaceholder => 'Xaiv Lub Sijhawm Yug';

  @override
  String get saveProfileButton => 'Txuag Profile';

  @override
  String get noCitiesFound => 'Tsis pom lub nroog';

  @override
  String cityPlaceholder(Object country) {
    return 'Nkag mus hauv nroog hauv $country';
  }

  @override
  String get countryFirstPlaceholder => 'Xaiv lub teb chaws ua ntej';

  @override
  String get versionHistoryTitle => 'Version Keeb Kwm';

  @override
  String get notSetText => 'Tsis teem';

  @override
  String nameHistory(Object name) {
    return 'Lub npe: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Lub zos: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Lub teb chaws: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Tub los ntxhais: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Hnub yug: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hnub yug: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Qhov chaw: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT $offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Xeev: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Hloov tshiab ntawm $date';
  }

  @override
  String get userIdRequired => 'Tus neeg siv ID yuav tsum tau';

  @override
  String get profileSaved => 'Txuag Profile tiav';

  @override
  String get saveFailed => 'Khaws qhov profile tsis tau';

  @override
  String get errorPrefix => 'yuam kev:';

  @override
  String get onboardingChooseLanguage => 'Xaiv Koj Hom Lus';

  @override
  String get onboardingChooseLanguageDesc =>
      'Xaiv hom lus koj nyiam mus txuas ntxiv.';

  @override
  String get onboardingWhatIsAstrology => 'Dab tsi yog Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology yog kev kawm ntawm lub cev xilethi-aus ...';

  @override
  String get onboardingWhyUseApp => 'Vim li cas thiaj siv cov app no?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Tau txais tus kheej horoscopes, kev kwv yees txhua hnub, thiab kev taw qhia kom paub txog kev txiav txim siab.';

  @override
  String get onboardingHowToUse => 'Yuav siv cov app no li cas?';

  @override
  String get onboardingHowToUseDesc =>
      'Taug kev yooj yim, tshawb xyuas txhua hnub horoscopes, thiab tswj koj qhov profile kom raug kwv yees.';

  @override
  String get onboardingGetStarted => 'Pib pib';

  @override
  String get onboardingNewUser => 'Tus neeg siv tshiab';

  @override
  String get onboardingExistingUser => 'Cov neeg siv tam sim no';

  @override
  String get onboardingBack => 'Rov qab';

  @override
  String get onboardingNext => 'Tom ntej no';

  @override
  String get userIdNotFound =>
      'Tsis pom tus neeg siv ID. Thov sau npe lossis teeb tsa koj qhov profile.';

  @override
  String get clearNotificationsTitle => 'Kev ceeb toom meej meej';

  @override
  String get clearNotificationsMessage =>
      'Koj puas paub tseeb tias koj xav tshem tag nrho cov ntawv ceeb toom?';

  @override
  String get clearNotificationsSuccess =>
      'Tag nrho cov ntawv ceeb toom tshem tawm tiav.';

  @override
  String get clearHoroscopeTitle => 'Clear Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Koj puas paub tseeb tias koj xav tshem koj cov ntaub ntawv horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope cleared tiav.';

  @override
  String get clearChatTitle => 'Clear Chat History';

  @override
  String get clearChatMessage =>
      'Koj puas paub tseeb tias koj xav rho tawm tag nrho koj cov keeb kwm sib tham?';

  @override
  String get clearChatLocal => 'Tham tau tshem tawm hauv zos.';

  @override
  String get deleteAccountTitle => 'Rho tawm Account';

  @override
  String get deleteAccountMessage =>
      'Koj puas paub tseeb tias koj xav rho tawm koj tus account? Qhov no tseem yuav tshem tag nrho koj cov keeb kwm sib tham thiab cov ntawv ceeb toom.';

  @override
  String get deleteAccountSuccess =>
      'Koj tus account thiab tag nrho cov ntaub ntawv tau raug tshem tawm.';

  @override
  String get deleteAccountError => 'yuam kev deletion account';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutMessage => 'Koj puas paub tseeb tias koj xav rho tawm?';

  @override
  String get termsPrivacyTitle => 'Cov ntsiab lus & Tsis pub twg paub';

  @override
  String get privacyPolicyTitle => 'Txoj Cai Tswjfwm Ntiag Tug';

  @override
  String get termsConditionsTitle => 'Cov Cai & Cov Cai';

  @override
  String get dataControlTitle => 'Cov Ntaub Ntawv Tswj';

  @override
  String get cancelButton => 'Tso tseg';

  @override
  String get confirmButton => 'Paub meej';

  @override
  String get clearQuestionsSuccess => 'Tag nrho cov lus nug deleted tiav.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tswv';

  @override
  String get startLabel => 'Pib';

  @override
  String get recoverAccount => 'Rov qab Account';

  @override
  String get endLabel => 'Xaus';

  @override
  String get startDateLabel => 'Pib Hnub';

  @override
  String get endDateLabel => 'Hnub Kawg';

  @override
  String get notAvailable => 'Tsis muaj';

  @override
  String get noData => 'Tsis muaj ntaub ntawv';

  @override
  String get unknownError => 'Unknown yuam kev';

  @override
  String get retryButton => 'Rov sim dua';

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
  String get unknown => 'Tsis paub';

  @override
  String get clearHoroscope => 'Clear Horoscope';

  @override
  String get clearNotifications => 'Kev ceeb toom meej meej';

  @override
  String get clearChatHistory => 'Clear Chat History';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Rho tawm Account';

  @override
  String get allFieldsRequired => 'Txhua qhov chaw yuav tsum muaj.';

  @override
  String get accountRecoveredSuccess => 'Tus account tau rov qab ua tiav.';

  @override
  String get recoveryFailed =>
      'Rov qab ua tsis tiav. Tshawb xyuas koj cov ntaub ntawv.';

  @override
  String get recoverySecretLabel => 'Rov qab Secret:';

  @override
  String get aboutUsTitle => 'Txog Peb';

  @override
  String get aboutOurCompany => 'Txog Peb Lub Tuam Txhab';

  @override
  String get aboutCompanyDescription =>
      'Peb tau cog lus tias yuav xa cov kev paub zoo tshaj plaws hauv hnub qub rau peb cov neeg siv.';

  @override
  String get ourMission => 'Peb Lub Hom Phiaj';

  @override
  String get missionDescription =>
      'Txhawm rau muab qhov tseeb thiab tus kheej kev nkag siab txog astrology los pab cov neeg siv txiav txim siab paub hauv lawv lub neej.';

  @override
  String get ourVision => 'Peb Lub Zeem Muag';

  @override
  String get visionDescription =>
      'Los ua qhov kev ntseeg siab tshaj plaws astrology platform, sib txuas thev naus laus zis thiab kev txawj ntse thaum ub.';

  @override
  String get ourValues => 'Peb Qhov Tseem Ceeb';

  @override
  String get valuesDescription =>
      'Kev ncaj ncees, raug, neeg siv-Centric tsim, thiab txuas ntxiv Innovation.';

  @override
  String get contactUs => 'Tiv tauj peb';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Lub Vev Xaib: www.yourcompany.com';

  @override
  String get customerSupport => 'Kev Pab Txhawb Cov Neeg Siv Khoom';

  @override
  String get supportHeroTitle => 'Peb nyob ntawm no los pab';

  @override
  String get supportHeroDescription =>
      'Sau daim foos hauv qab no thiab peb pab neeg txhawb nqa yuav rov qab los rau koj sai li sai tau.';

  @override
  String get yourName => 'Koj Lub Npe';

  @override
  String get yourEmail => 'Koj Email';

  @override
  String get message => 'Xov xwm';

  @override
  String get enterEmail => 'Sau koj tus email';

  @override
  String get enterValidEmail => 'Sau tus email chaw nyob siv tau';

  @override
  String enterField(Object fieldName) {
    return 'Sau $fieldName';
  }

  @override
  String get send => 'Xa';

  @override
  String get sending => 'Xa...';

  @override
  String get emailSentSuccess => '✅ Email xa tuaj!';

  @override
  String get emailSendFailed => '❌ Xa email tsis tau';

  @override
  String get astroDictionaryTitle => 'Astro phau ntawv txhais lus';

  @override
  String get searchTermsHint => 'Cov ntsiab lus tshawb nrhiav...';

  @override
  String get noTermsFound => 'Tsis pom cov ntsiab lus';

  @override
  String get buyQuestionsTitle => 'Yuav Cov Lus Nug';

  @override
  String get userNotAuthenticated => 'Tus neeg siv tsis tau authenticated';

  @override
  String get loadStoreDataFailed => 'Ua tsis tiav cov ntaub ntawv khaws cia';

  @override
  String get missingAuthToken => 'Tsis muaj auth token';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Kev them nyiaj tiav! Lus nug xa';

  @override
  String paymentFailed(Object error) {
    return '❌ Them tsis tau: $error';
  }

  @override
  String get yourBalance => 'Koj tshuav nyiaj li cas';

  @override
  String questionsBalance(Object count) {
    return '$count Cov lus nug';
  }

  @override
  String get availableOffers => 'Muaj Kev Muaj';

  @override
  String questionsCount(Object count) {
    return '$count Lus nug';
  }

  @override
  String get buyButton => 'Yuav';

  @override
  String get dailyHoroscopeTitle => '🌟 Txhua hnub Horoscope';

  @override
  String get userIdMissing => 'Tus neeg siv ID ploj lawm';

  @override
  String get fetchHoroscopesFailed => 'Ua tsis tiav mus nqa horoscopes';

  @override
  String get noHoroscopeFound => 'Tsis pom horoscope.';

  @override
  String get signLabel => 'Kos npe';

  @override
  String get todayLabel => 'Hnub no';

  @override
  String get yesterdayLabel => 'Nag hmo';

  @override
  String get thisWeekLabel => 'Lub lim tiam no';

  @override
  String get lastMonthLabel => 'Lub hli tas los';

  @override
  String get chatTitle => 'Tham';

  @override
  String get typeYourQuestionHint => 'Ntaus koj cov lus nug ...';

  @override
  String get paymentRequired => 'Yuav tsum tau them nyiaj';

  @override
  String get paymentRequiredMessage =>
      'Koj tau siv koj cov lus nug dawb. Them ₹50 mus ntxiv.';

  @override
  String get payNowButton => 'Them Tam sim no';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count cov lus nug dawb ntxiv';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count them cov lus nug tseem tshuav';
  }

  @override
  String get thankYouFeedback => 'Ua tsaug rau koj cov lus teb!';

  @override
  String get ratingSubmitted => 'Kev ntsuam xyuas xa!';

  @override
  String get setUserIdFirst => 'Thov teev koj tus User ID ua ntej';

  @override
  String get failedToFetchPrevious =>
      'Ua tsis tiav mus nqa cov lus nug thiab lus teb dhau los';

  @override
  String errorOccurred(Object error) {
    return 'yuam kev: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profile';

  @override
  String get drawerDailyHoroscope => 'Hnub Horoscope';

  @override
  String get drawerBuyQuestions => 'Yuav Cov Lus Nug';

  @override
  String get drawerAstroDictionary => 'Astro phau ntawv txhais lus';

  @override
  String get drawerSettings => 'Chaw';

  @override
  String get drawerCustomerSupport => 'Kev Pab Txhawb Cov Neeg Siv Khoom';

  @override
  String get drawerAbout => 'Txog';

  @override
  String get drawerProfileSettings => 'Kev teeb tsa Profile';

  @override
  String get demoNotificationTitle => '🔔 Demo Ceeb Toom';

  @override
  String get demoNotificationBody => 'Nov yog kev ceeb toom ntawm koj lub app!';

  @override
  String get notificationsTitle => 'Kev ceeb toom';

  @override
  String get noNotifications => 'Tsis muaj ntawv ceeb toom';

  @override
  String get allTab => 'Tag nrho';

  @override
  String get markAllAsRead => 'Kos tag nrho raws li nyeem';

  @override
  String get notificationMarkedRead => 'Kev ceeb toom cim tias nyeem';

  @override
  String get failedToLoadNotifications => 'Ua tsis tiav cov ntawv ceeb toom';

  @override
  String get failedToMarkRead => 'Ua tsis tau tejyam cim raws li nyeem';

  @override
  String get failedToMarkAllRead =>
      'Ua tsis tiav los cim tag nrho raws li nyeem';

  @override
  String get socketConnected => 'Qhov (socket) txuas';

  @override
  String get socketDisconnected => 'Lub qhov (socket) txiav tawm';

  @override
  String get newNotificationReceived => 'Kev ceeb toom tshiab tau txais';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Tham';

  @override
  String get systemCategory => 'Qhov system';

  @override
  String get updateCategory => 'Hloov tshiab';

  @override
  String get howToAskTitle => 'Yuav Nug Li Cas';

  @override
  String get noQuestionsAvailable => 'Tsis muaj lus nug';

  @override
  String get failedToLoadQuestions => 'Ua tsis tiav cov lus nug';

  @override
  String get pullToRefresh => 'Rub kom refresh';

  @override
  String get careerCategory => 'Kev ua haujlwm';

  @override
  String get loveCategory => 'Kev Hlub & Kev Sib Raug Zoo';

  @override
  String get healthCategory => 'Kev noj qab haus huv';

  @override
  String get financeCategory => 'Nyiaj txiag';

  @override
  String get familyCategory => 'Tsev neeg';

  @override
  String get educationCategory => 'Kev kawm';

  @override
  String get travelCategory => 'Mus ncig';

  @override
  String get spiritualCategory => 'sab ntsuj plig';

  @override
  String get profileLoaded => 'Profile loaded tiav';

  @override
  String get imageUploaded => 'Duab uploaded tiav';

  @override
  String get savedInformationConfirmation => 'Kuv tau khaws cov ntaub ntawv no';

  @override
  String get noHistoryAvailable => 'Tsis muaj keeb kwm muaj';

  @override
  String get missingUserIdError => 'Tus neeg siv ID yuav tsum tau';

  @override
  String get networkError => 'Network yuam kev. Thov rov sim dua.';

  @override
  String get timeoutError => 'Thov ncua sij hawm';

  @override
  String get genericError => 'Ib yam dab tsi mus tsis ncaj ncees lawm';

  @override
  String get reactionUpdateError =>
      'Ua tsis tau tejyam hloov tshiab cov tshuaj tiv thaiv';

  @override
  String get noSearchResults => 'Tsis muaj kev tshawb nrhiav pom';

  @override
  String get clearSearch => 'Nrhiav kom meej';

  @override
  String get resultsFound => 'Cov txiaj ntsig pom';

  @override
  String get recoverySecretHint =>
      'Luam-paste yuav tsis ua haujlwm, ntaus ntawv manually';

  @override
  String get recoverAccountDescription =>
      'Ua raws li cov kauj ruam no kom rov qab tau koj tus account';

  @override
  String get processingLabel => 'Kev ua...';

  @override
  String get clearChatSuccess => 'Kev sib tham tau ua tiav tiav';

  @override
  String get notificationsEnabled => 'Kev ceeb toom tau qhib';

  @override
  String get notificationsDisabled => 'Kev ceeb toom raug kaw';

  @override
  String get securityNotice =>
      'Koj cov ntaub ntawv tau ruaj ntseg encrypted thiab khaws cia';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLanguage => 'Xaiv hom lus';

  @override
  String get onboardingGetStartedDesc => 'Pib los ntawm kev xaiv koj hom lus';

  @override
  String get accountRecoveryTitle =>
      '🔐 Cov ntaub ntawv rov qab rau tus account';

  @override
  String get recoveryInstructions =>
      'Thov khaws cov ntaub ntawv no kom ruaj ntseg. Koj yuav xav tau nws kom rov qab tau koj tus account.';

  @override
  String get importantNotice => '⚠️ Qhov tseem ceeb:';

  @override
  String get astrologerProfileTitle => 'Astrologer Profile';

  @override
  String get personalAstrologer => 'Tus Kheej Astrologer';

  @override
  String get makePersonalAstrologer => 'Ua Tus Kheej Astrologer';

  @override
  String get favoriteDescription =>
      'Koj cov lus nug yuav raug muab ua ntej rau tus kws qhia hnub qub no. Yog tias tsis muaj, lwm tus kws qhia hnub qub uas tsim nyog yuav pab koj.';

  @override
  String get educationQualifications => 'Kev Kawm & Kev Tsim Nyog';

  @override
  String get aboutSection => 'Txog';

  @override
  String get shareProfile => 'Share Profile';

  @override
  String get loadingAstrologer => 'Loading astrologer details...';

  @override
  String get failedToLoadAstrologer =>
      'Ua tsis tiav cov ntsiab lus ntawm astrologer';

  @override
  String get authenticationRequired =>
      'Yuav tsum muaj kev lees paub. Thov nkag rau hauv.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kev kuaj xyuas kev nyab xeeb ua tsis tiav: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name tam sim no yog koj Tus Kheej Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Tshem tawm $name los ntawm cov nyiam';
  }

  @override
  String get toggleFavoriteError =>
      'Ua tsis tiav los hloov kho cov xwm txheej nyiam';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Education: $education\n📜 Kev Tsim Nyog: $qualification\n⏳ Kev paub: $experience';
  }

  @override
  String get notProvided => 'Tsis muab';

  @override
  String reviews(Object count) {
    return '($count tshuaj xyuas)';
  }

  @override
  String get specialties => 'Tshwj xeeb';

  @override
  String get experience => 'Kev paub';

  @override
  String get qualification => 'Kev tsim nyog';

  @override
  String get education => 'Kev kawm';

  @override
  String get recoveryTips =>
      '• Coj ib lub screenshot ntawm cov ntaub ntawv no\n• Khaws rau hauv qhov chaw ruaj ntseg\n• Tsis txhob koom nrog lwm tus\n• Qhov no tsuas yog qhia ib zaug xwb';

  @override
  String get themeSettingsTitle => 'Ntsiab lus chaw';

  @override
  String get lightThemeLabel => 'Teeb';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tsaus';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Qhov system';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
