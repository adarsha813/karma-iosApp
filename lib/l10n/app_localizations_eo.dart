// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get settingsTitle => 'Agordoj';

  @override
  String get notificationSettings => 'Sciigaj Agordoj';

  @override
  String get privacySettings => 'Privatecaj Agordoj';

  @override
  String get accountSettings => 'Konto-Agordoj';

  @override
  String get languageSettings => 'Lingvaj Agordoj';

  @override
  String get languageChanged => 'Lingvo ŝanĝiĝis';

  @override
  String get existingUserButton => 'Mi estas ekzistanta uzanto';

  @override
  String get chooseCountryTitle => 'Elektu Landon';

  @override
  String get yesText => 'Jes';

  @override
  String get noText => 'Ne';

  @override
  String get appBarTitle => 'Profilaj Agordoj';

  @override
  String get userIdLabel => 'Uzanto-identigilo *';

  @override
  String get nameLabel => 'Nomo';

  @override
  String get birthCountryLabel => 'Naskiĝlando';

  @override
  String get birthCityLabel => 'Naskiĝurbo';

  @override
  String get countrySelectionTitle => 'Elektu vian landon';

  @override
  String get maleLabel => 'Vira';

  @override
  String get femaleLabel => 'Ina';

  @override
  String get birthDateLabel => 'Naskiĝdato';

  @override
  String get birthDatePlaceholder => 'Elektu Naskiĝdaton';

  @override
  String get birthTimeLabel => 'Naskiĝtempo';

  @override
  String get birthTimePlaceholder => 'Elektu Naskiĝtempon';

  @override
  String get saveProfileButton => 'Konservi Profilon';

  @override
  String get noCitiesFound => 'Neniuj urboj trovitaj';

  @override
  String cityPlaceholder(Object country) {
    return 'Enigu urbon en $country';
  }

  @override
  String get countryFirstPlaceholder => 'Unue elektu landon';

  @override
  String get versionHistoryTitle => 'Versihistorio';

  @override
  String get notSetText => 'Ne agordita';

  @override
  String nameHistory(Object name) {
    return 'Nomo: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Urbo: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Lando: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sekso: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Naskiĝdato: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Naskiĝtempo: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Loko: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Horzono: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Ŝtato: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ĝisdatigita je $date';
  }

  @override
  String get userIdRequired => 'Uzanto-identigilo estas necesa';

  @override
  String get profileSaved => 'Profilo sukcese konservita';

  @override
  String get saveFailed => 'Malsukcesis konservi profilon';

  @override
  String get errorPrefix => 'Eraro:';

  @override
  String get onboardingChooseLanguage => 'Elektu Vian Lingvon';

  @override
  String get onboardingChooseLanguageDesc =>
      'Elektu vian preferatan lingvon por daŭrigi.';

  @override
  String get onboardingWhatIsAstrology => 'Kio estas Astrologio?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologio estas la studo de ĉielaj korpoj...';

  @override
  String get onboardingWhyUseApp => 'Kial uzi ĉi tiun aplikaĵon?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ricevu personigitajn horoskopojn, ĉiutagajn prognozojn kaj gvidon por fari informitajn decidojn.';

  @override
  String get onboardingHowToUse => 'Kiel uzi ĉi tiun aplikaĵon?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigu facile, kontrolu ĉiutagajn horoskopojn kaj administru vian profilon por precizaj antaŭdiroj.';

  @override
  String get onboardingGetStarted => 'Komencu';

  @override
  String get onboardingNewUser => 'Nova uzanto';

  @override
  String get onboardingExistingUser => 'Ekzistanta uzanto';

  @override
  String get onboardingBack => 'Reen';

  @override
  String get onboardingNext => 'Sekva';

  @override
  String get userIdNotFound =>
      'Uzanto-identigilo ne trovita. Bonvolu ensaluti aŭ agordi vian profilon.';

  @override
  String get clearNotificationsTitle => 'Forigi Sciigojn';

  @override
  String get clearNotificationsMessage =>
      'Ĉu vi certas, ke vi volas forigi ĉiujn sciigojn?';

  @override
  String get clearNotificationsSuccess => 'Ĉiuj sciigoj sukcese malaperis.';

  @override
  String get clearHoroscopeTitle => 'Klara Horoskopo';

  @override
  String get clearHoroscopeMessage =>
      'Ĉu vi certas, ke vi volas forigi viajn horoskopajn datumojn?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopo sukcese malplenigita.';

  @override
  String get clearChatTitle => 'Forigi Babilejan Historion';

  @override
  String get clearChatMessage =>
      'Ĉu vi certas, ke vi volas forigi vian tutan babilhistorion?';

  @override
  String get clearChatLocal => 'Babilado malplenigita loke.';

  @override
  String get deleteAccountTitle => 'Forigi Konton';

  @override
  String get deleteAccountMessage =>
      'Ĉu vi certas, ke vi volas forigi vian konton? Tio ankaŭ forigos vian tutan babilhistorion kaj sciigojn.';

  @override
  String get deleteAccountSuccess =>
      'Via konto kaj ĉiuj datumoj estas forigitaj.';

  @override
  String get deleteAccountError => 'Eraro forigante konton';

  @override
  String get logoutTitle => 'Elsaluti';

  @override
  String get logoutMessage => 'Ĉu vi certas, ke vi volas elsaluti?';

  @override
  String get termsPrivacyTitle => 'Kondiĉoj kaj Privateco';

  @override
  String get privacyPolicyTitle => 'Regularo pri Privateco';

  @override
  String get termsConditionsTitle => 'Kondiĉoj kaj Regularoj';

  @override
  String get dataControlTitle => 'Datuma Kontrolo';

  @override
  String get cancelButton => 'Nuligi';

  @override
  String get confirmButton => 'Konfirmi';

  @override
  String get clearQuestionsSuccess => 'Ĉiuj demandoj sukcese forigitaj.';

  @override
  String get yoginiLabel => 'Jogini';

  @override
  String get lordLabel => 'Sinjoro';

  @override
  String get startLabel => 'Komencu';

  @override
  String get recoverAccount => 'Reakiri Konton';

  @override
  String get endLabel => 'Fino';

  @override
  String get startDateLabel => 'Komencdato';

  @override
  String get endDateLabel => 'Findato';

  @override
  String get notAvailable => 'Ne havebla';

  @override
  String get noData => 'Neniuj datumoj';

  @override
  String get unknownError => 'Nekonata eraro';

  @override
  String get retryButton => 'Reprovi';

  @override
  String get kundaliGeneratorTitle => 'Kundali-Generatoro';

  @override
  String get natalChartTitle => 'Naska diagramo';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raŝi';

  @override
  String get ascDegreeLabel => 'Ascenda Grado';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Nekonata';

  @override
  String get clearHoroscope => 'Klara Horoskopo';

  @override
  String get clearNotifications => 'Forigi Sciigojn';

  @override
  String get clearChatHistory => 'Forigi Babilejan Historion';

  @override
  String get logout => 'Elsaluti';

  @override
  String get deleteAccount => 'Forigi Konton';

  @override
  String get allFieldsRequired => 'Ĉiuj kampoj estas devigaj.';

  @override
  String get accountRecoveredSuccess => 'Konto sukcese reakiriĝis.';

  @override
  String get recoveryFailed => 'Reakiro malsukcesis. Kontrolu viajn informojn.';

  @override
  String get recoverySecretLabel => 'Sekreto de Resaniĝo:';

  @override
  String get aboutUsTitle => 'Pri Ni';

  @override
  String get aboutOurCompany => 'Pri Nia Firmao';

  @override
  String get aboutCompanyDescription =>
      'Ni celas liveri la plej bonan astrologian sperton al niaj uzantoj.';

  @override
  String get ourMission => 'Nia Misio';

  @override
  String get missionDescription =>
      'Provizi precizajn kaj personigitajn astrologiajn komprenojn por helpi uzantojn fari informitajn decidojn en siaj vivoj.';

  @override
  String get ourVision => 'Nia Vizio';

  @override
  String get visionDescription =>
      'Fariĝi la plej fidinda astrologia platformo, kombinante teknologion kaj antikvan saĝon.';

  @override
  String get ourValues => 'Niaj Valoroj';

  @override
  String get valuesDescription =>
      'Integreco, Precizeco, Uzanto-Centra Dezajno, kaj Kontinua Novigado.';

  @override
  String get contactUs => 'Kontaktu nin';

  @override
  String get contactEmail => 'Retpoŝto: subteno@viafirmao.com';

  @override
  String get contactWebsite => 'Retejo: www.viafirmao.com';

  @override
  String get customerSupport => 'Klienta Subteno';

  @override
  String get supportHeroTitle => 'Ni estas ĉi tie por helpi';

  @override
  String get supportHeroDescription =>
      'Plenigu la suban formularon kaj nia subtena teamo kontaktos vin kiel eble plej baldaŭ.';

  @override
  String get yourName => 'Via Nomo';

  @override
  String get yourEmail => 'Via Retpoŝto';

  @override
  String get message => 'Mesaĝo';

  @override
  String get enterEmail => 'Enigu vian retpoŝtadreson';

  @override
  String get enterValidEmail => 'Enigu validan retpoŝtadreson';

  @override
  String enterField(Object fieldName) {
    return 'Enigu $fieldName';
  }

  @override
  String get send => 'Sendi';

  @override
  String get sending => 'Sendante...';

  @override
  String get emailSentSuccess => '✅ Retpoŝto sukcese sendita!';

  @override
  String get emailSendFailed => '❌ Malsukcesis sendi retpoŝton';

  @override
  String get astroDictionaryTitle => 'Astro-Vortaro';

  @override
  String get searchTermsHint => 'Serĉvortoj...';

  @override
  String get noTermsFound => 'Neniuj terminoj trovitaj';

  @override
  String get buyQuestionsTitle => 'Aĉetu Demandojn';

  @override
  String get userNotAuthenticated => 'Uzanto ne aŭtentikigita';

  @override
  String get loadStoreDataFailed => 'Malsukcesis ŝargi vendejajn datumojn';

  @override
  String get missingAuthToken => 'Mankas aŭtentiga ĵetono';

  @override
  String get merchantDisplayName => 'Astro-babileja aplikaĵo';

  @override
  String get paymentSuccessful => '✅ Pago sukcesa! Demando sendita';

  @override
  String paymentFailed(Object error) {
    return '❌ Pago malsukcesis: $error';
  }

  @override
  String get yourBalance => 'Via Ekvilibro';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Haveblaj Ofertoj';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Aĉeti';

  @override
  String get dailyHoroscopeTitle => '🌟 Ĉiutaga Horoskopo';

  @override
  String get userIdMissing => 'Uzanto-identigilo mankas';

  @override
  String get fetchHoroscopesFailed => 'Malsukcesis akiri horoskopojn';

  @override
  String get noHoroscopeFound => 'Neniu horoskopo trovita.';

  @override
  String get signLabel => 'Subskribi';

  @override
  String get todayLabel => 'Hodiaŭ';

  @override
  String get yesterdayLabel => 'Hieraŭ';

  @override
  String get thisWeekLabel => 'Ĉi tiu Semajno';

  @override
  String get lastMonthLabel => 'Lasta Monato';

  @override
  String get chatTitle => 'Babilejo';

  @override
  String get typeYourQuestionHint => 'Tajpu vian demandon...';

  @override
  String get paymentRequired => 'Pago Bezonata';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Vi uzis viajn senpagajn demandojn. Pagu ₹50 por daŭrigi.';
  }

  @override
  String get payNowButton => 'Pagu Nun';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count liberaj demandoj restas';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pagitaj demandoj restantaj';
  }

  @override
  String get thankYouFeedback => 'Dankon pro via komento!';

  @override
  String get ratingSubmitted => 'Takso sendita!';

  @override
  String get setUserIdFirst => 'Bonvolu unue agordi vian uzant-identigilon';

  @override
  String get failedToFetchPrevious =>
      'Malsukcesis preni antaŭajn demandojn kaj respondojn';

  @override
  String errorOccurred(Object error) {
    return 'Eraro: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-Profilo';

  @override
  String get drawerDailyHoroscope => 'Ĉiutaga Horoskopo';

  @override
  String get drawerBuyQuestions => 'Aĉetu Demandojn';

  @override
  String get drawerAstroDictionary => 'Astro-Vortaro';

  @override
  String get drawerSettings => 'Agordoj';

  @override
  String get drawerCustomerSupport => 'Klienta Subteno';

  @override
  String get drawerAbout => 'Pri';

  @override
  String get drawerProfileSettings => 'Profilaj Agordoj';

  @override
  String get demoNotificationTitle => '🔔 Demonstraĵa Sciigo';

  @override
  String get demoNotificationBody => 'Jen testa sciigo de via aplikaĵo!';

  @override
  String get notificationsTitle => 'Sciigoj';

  @override
  String get noNotifications => 'Neniuj sciigoj';

  @override
  String get allTab => 'Ĉiuj';

  @override
  String get markAllAsRead => 'Marki ĉion kiel legitan';

  @override
  String get notificationMarkedRead => 'Sciigo markita kiel legita';

  @override
  String get failedToLoadNotifications => 'Malsukcesis ŝargi sciigojn';

  @override
  String get failedToMarkRead => 'Malsukcesis marki kiel legita';

  @override
  String get failedToMarkAllRead => 'Malsukcesis marki ĉion kiel legitan';

  @override
  String get socketConnected => 'Ingo konektita';

  @override
  String get socketDisconnected => 'Ingo malkonektita';

  @override
  String get newNotificationReceived => 'Nova sciigo ricevita';

  @override
  String get generalCategory => 'Generalo';

  @override
  String get horoscopeCategory => 'Horoskopo';

  @override
  String get chatCategory => 'Babilejo';

  @override
  String get systemCategory => 'Sistemo';

  @override
  String get updateCategory => 'Ĝisdatigoj';

  @override
  String get howToAskTitle => 'Kiel Demandi';

  @override
  String get noQuestionsAvailable => 'Neniuj demandoj haveblaj';

  @override
  String get failedToLoadQuestions => 'Malsukcesis ŝargi demandojn';

  @override
  String get pullToRefresh => 'Tiru por refreŝigi';

  @override
  String get careerCategory => 'Kariero';

  @override
  String get loveCategory => 'Amo kaj Rilatoj';

  @override
  String get healthCategory => 'Sano';

  @override
  String get financeCategory => 'Financo';

  @override
  String get familyCategory => 'Familio';

  @override
  String get educationCategory => 'Edukado';

  @override
  String get travelCategory => 'Vojaĝado';

  @override
  String get spiritualCategory => 'Spirita';

  @override
  String get profileLoaded => 'Profilo sukcese ŝarĝita';

  @override
  String get imageUploaded => 'Bildo sukcese alŝutita';

  @override
  String get savedInformationConfirmation => 'Mi konservis ĉi tiun informon';

  @override
  String get noHistoryAvailable => 'Neniu historio havebla';

  @override
  String get missingUserIdError => 'Uzanto-identigilo estas bezonata';

  @override
  String get networkError => 'Reta eraro. Bonvolu provi denove.';

  @override
  String get timeoutError => 'Peto eksvalidiĝis';

  @override
  String get genericError => 'Io misfunkciis';

  @override
  String get reactionUpdateError => 'Malsukcesis ĝisdatigi reagon';

  @override
  String get noSearchResults => 'Neniuj serĉrezultoj trovitaj';

  @override
  String get clearSearch => 'Forigi serĉon';

  @override
  String get resultsFound => 'Rezultoj trovitaj';

  @override
  String get recoverySecretHint =>
      'Kopii-alglui eble ne funkcios, tajpu permane';

  @override
  String get recoverAccountDescription =>
      'Sekvu ĉi tiujn paŝojn por reakiri vian konton';

  @override
  String get processingLabel => 'Prilaborado...';

  @override
  String get clearChatSuccess => 'Babilejo sukcese forigita';

  @override
  String get notificationsEnabled => 'Sciigoj ebligitaj';

  @override
  String get notificationsDisabled => 'Sciigoj malŝaltitaj';

  @override
  String get securityNotice =>
      'Viaj datumoj estas sekure ĉifritaj kaj konservitaj';

  @override
  String get loading => 'Ŝarĝante...';

  @override
  String get selectLanguage => 'Elektu lingvon';

  @override
  String get onboardingGetStartedDesc => 'Komencu elektante vian lingvon';

  @override
  String get accountRecoveryTitle => '🔐 Detaloj pri Reakiro de Konto';

  @override
  String get recoveryInstructions =>
      'Bonvolu konservi ĉi tiun informon sekure. Vi bezonos ĝin por reakiri vian konton.';

  @override
  String get importantNotice => '⚠️ Grave:';

  @override
  String get astrologerProfileTitle => 'Astrologa Profilo';

  @override
  String get personalAstrologer => 'Persona Astrologo';

  @override
  String get makePersonalAstrologer => 'Fari Personan Astrologon';

  @override
  String get favoriteDescription =>
      'Viaj demandoj estos prioritatigitaj al ĉi tiu astrologo. Se ne disponebla, alia kvalifikita astrologo helpos vin.';

  @override
  String get educationQualifications => 'Edukado kaj Kvalifikoj';

  @override
  String get aboutSection => 'Pri';

  @override
  String get shareProfile => 'Kunhavigi Profilon';

  @override
  String get loadingAstrologer => 'Ŝarĝante detalojn pri astrologo...';

  @override
  String get failedToLoadAstrologer =>
      'Malsukcesis ŝargi detalojn pri astrologo';

  @override
  String get authenticationRequired => 'Aŭtentigo necesas. Bonvolu ensaluti.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sekureckontrolo malsukcesis: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name nun estas via Persona Astrologo';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Forigis $name el la plej ŝatataj';
  }

  @override
  String get toggleFavoriteError => 'Malsukcesis ĝisdatigi ŝatostaton';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Edukado: $education\n📜 Kvalifiko: $qualification\n⏳ Sperto: $experience';
  }

  @override
  String get notProvided => 'Ne provizita';

  @override
  String reviews(Object count) {
    return '($count recenzoj)';
  }

  @override
  String get specialties => 'Specialaĵoj';

  @override
  String get experience => 'Sperto';

  @override
  String get qualification => 'Kvalifiko';

  @override
  String get education => 'Edukado';

  @override
  String get recoveryTips =>
      '• Faru ekranfoton de ĉi tiu informo\n• Konservu ĝin en sekura loko\n• Ne dividu kun iu ajn\n• Ĉi tio estos montrata nur unufoje';

  @override
  String get themeSettingsTitle => 'Temaj Agordoj';

  @override
  String get lightThemeLabel => 'Lumo';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Malluma';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistemo';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
