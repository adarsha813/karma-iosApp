// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Corsican (`co`).
class AppLocalizationsCo extends AppLocalizations {
  AppLocalizationsCo([String locale = 'co']) : super(locale);

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get notificationSettings => 'Impostazioni di notificazione';

  @override
  String get privacySettings => 'Impostazioni di privacy';

  @override
  String get accountSettings => 'Impostazioni di u contu';

  @override
  String get languageSettings => 'Impostazioni di lingua';

  @override
  String get languageChanged => 'Lingua cambiata';

  @override
  String get existingUserButton => 'Sò un utilizatore esistente';

  @override
  String get chooseCountryTitle => 'Sceglie u paese';

  @override
  String get yesText => 'Iè';

  @override
  String get noText => 'Innò';

  @override
  String get appBarTitle => 'Impostazioni di u prufilu';

  @override
  String get userIdLabel => 'ID utilizatore *';

  @override
  String get nameLabel => 'Nome';

  @override
  String get birthCountryLabel => 'Paese di nascita';

  @override
  String get birthCityLabel => 'Cità di nascita';

  @override
  String get countrySelectionTitle => 'Sceglite u vostru paese';

  @override
  String get maleLabel => 'Maschile';

  @override
  String get femaleLabel => 'Femina';

  @override
  String get birthDateLabel => 'Data di nascita';

  @override
  String get birthDatePlaceholder => 'Selezziunate a data di nascita';

  @override
  String get birthTimeLabel => 'Ora di nascita';

  @override
  String get birthTimePlaceholder => 'Selezziunate l\'ora di nascita';

  @override
  String get saveProfileButton => 'Salvà u prufilu';

  @override
  String get noCitiesFound => 'Nisuna cità truvata';

  @override
  String cityPlaceholder(Object country) {
    return 'Inserite a cità in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selezziunate prima u paese';

  @override
  String get versionHistoryTitle => 'Cronologia di e versioni';

  @override
  String get notSetText => 'Micca stabilitu';

  @override
  String nameHistory(Object name) {
    return 'Nome: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Cità: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Paese: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sessu: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data di nascita: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ora di nascita: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Locu: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Fusu orariu: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Statu: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aghjurnatu u $date';
  }

  @override
  String get userIdRequired => 'L\'ID utilizatore hè necessariu';

  @override
  String get profileSaved => 'U prufilu hè statu salvatu cù successu';

  @override
  String get saveFailed => 'Ùn hè micca statu pussibule di salvà u prufilu';

  @override
  String get errorPrefix => 'Errore:';

  @override
  String get onboardingChooseLanguage => 'Sceglite a vostra lingua';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selezziunate a vostra lingua preferita per cuntinuà.';

  @override
  String get onboardingWhatIsAstrology => 'Chì ghjè l\'Astrologia ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'L\'astrologia hè u studiu anticu di i muvimenti celesti è a so influenza nantu à a vita umana, chì offre insights nantu à a personalità, e relazioni è l\'avvenimenti di a vita.';

  @override
  String get onboardingWhyUseApp => 'Perchè aduprà sta app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ricevi oroscopi precisi, generati da l\'omu, è cunsiglii adattati à a to carta natale. Piglia decisioni infurmate cù previsioni ghjurnaliere è cunsiglii persunalizati da astrologi sperimentati.';

  @override
  String get onboardingHowToUse => 'Cumu aduprà sta app?';

  @override
  String get onboardingHowToUseDesc =>
      'Basta à inserisce a vostra data di nascita, l\'ora esatta, u locu di nascita è qualsiasi altri dettagli pertinenti per cumincià subitu. Esplorate l\'oroscopu di ogni ghjornu, fate dumande à astrologi esperti è gestite u vostru prufilu per previsioni precise è persunalizate, senza bisognu di cunnessione.';

  @override
  String get onboardingGetStarted => 'Cumincià';

  @override
  String get onboardingNewUser => 'Novu utilizatore';

  @override
  String get onboardingExistingUser => 'Utilizatore esistente';

  @override
  String get onboardingBack => 'Indietro';

  @override
  String get onboardingNext => 'Dopu';

  @override
  String get userIdNotFound =>
      'ID utilizatore micca trovu. Per piacè cunnettatevi o cunfigurate u vostru prufilu.';

  @override
  String get clearNotificationsTitle => 'Sguassà e Notificazioni';

  @override
  String get clearNotificationsMessage =>
      'Site sicuru di vulè sguassà tutte e notificazioni ?';

  @override
  String get clearNotificationsSuccess =>
      'Tutte e notificazioni sò state sguassate cù successu.';

  @override
  String get clearHoroscopeTitle => 'Oroscopu chjaru';

  @override
  String get clearHoroscopeMessage =>
      'Site sicuru di vulè sguassà i dati di u vostru oroscopu ?';

  @override
  String get clearHoroscopeSuccess =>
      'L\'oroscopu hè statu sbulicatu cù successu.';

  @override
  String get clearChatTitle => 'Sguassà a storia di e chat';

  @override
  String get clearChatMessage =>
      'Site sicuru di vulè sguassà tutta a vostra storia di chat?';

  @override
  String get clearChatLocal => 'Chat sbulicata lucalmente.';

  @override
  String get deleteAccountTitle => 'Sguassà u contu';

  @override
  String get deleteAccountMessage =>
      'Site sicuru di vulè sguassà u vostru contu ? Questu sguasserà ancu tutta a vostra storia di chat è e notificazioni.';

  @override
  String get deleteAccountSuccess =>
      'U vostru contu è tutti i dati sò stati eliminati.';

  @override
  String get deleteAccountError => 'Errore di sguassà u contu';

  @override
  String get logoutTitle => 'Scunnettà si';

  @override
  String get logoutMessage => 'Site sicuru di vulè disconnettevi ?';

  @override
  String get termsPrivacyTitle => 'Termini è privacy';

  @override
  String get privacyPolicyTitle => 'Pulitica di privacy';

  @override
  String get termsConditionsTitle => 'Termini è Cundizioni';

  @override
  String get dataControlTitle => 'Cuntrollu di i dati';

  @override
  String get cancelButton => 'Annulà';

  @override
  String get confirmButton => 'Cunfirmà';

  @override
  String get clearQuestionsSuccess =>
      'Tutte e dumande sò state sguassate cù successu.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Signore';

  @override
  String get startLabel => 'Principià';

  @override
  String get recoverAccount => 'Recuperà u contu';

  @override
  String get endLabel => 'Fine';

  @override
  String get startDateLabel => 'Data d\'iniziu';

  @override
  String get endDateLabel => 'Data di fine';

  @override
  String get notAvailable => 'Micca dispunibule';

  @override
  String get noData => 'Nisuna data';

  @override
  String get unknownError => 'Errore scunnisciutu';

  @override
  String get retryButton => 'Pruvà torna';

  @override
  String get kundaliGeneratorTitle => 'Generatore di Kundali';

  @override
  String get natalChartTitle => 'Carta Natale';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Gradu Ascendente';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Scunnisciutu';

  @override
  String get clearHoroscope => 'Oroscopu chjaru';

  @override
  String get clearNotifications => 'Sguassà e Notificazioni';

  @override
  String get clearChatHistory => 'Sguassà a storia di e chat';

  @override
  String get logout => 'Scunnettà si';

  @override
  String get deleteAccount => 'Sguassà u contu';

  @override
  String get allFieldsRequired => 'Tutti i campi sò ubligatorii.';

  @override
  String get accountRecoveredSuccess =>
      'U contu hè statu recuperatu cù successu.';

  @override
  String get recoveryFailed =>
      'A ricuperazione hà fiascatu. Verificate e vostre informazioni.';

  @override
  String get recoverySecretLabel => 'Secretu di Ripresa:';

  @override
  String get aboutUsTitle => 'Nantu à noi';

  @override
  String get aboutOurCompany => 'À propositu di a nostra cumpagnia';

  @override
  String get aboutCompanyDescription =>
      'À Karma, vi aiutemu à scopre u vostru veru percorsu di vita attraversu a saviezza senza tempu di l\'astrologia vedica. Ogni intuizione vene da astrologi veri è sperimentati, attentamente elaborati in basa à a vostra carta natale unica. Da l\'oroscopu di ogni ghjornu à a guida persunalizata, Karma rende accessibile a cunniscenza antica in più di 100 lingue.';

  @override
  String get ourMission => 'A nostra missione';

  @override
  String get missionDescription =>
      'A nostra missione hè simplice: furnisce una guida astrologica autentica, guidata da l\'omu, chì vi permette di piglià decisioni sicure è infurmate. Ogni previsione è cunsultazione riflette anni di cumpetenze prufessiunale, micca algoritmi automatizati.';

  @override
  String get ourVision => 'A nostra visione';

  @override
  String get visionDescription =>
      'Facemu di tuttu per esse a piattaforma più affidabile di u mondu per l\'astrologia vedica, aiutendu e persone in ogni locu à capisce si stesse, e so scelte è u so viaghju di vita cun chiarezza è fiducia.';

  @override
  String get ourValues => 'I nostri valori';

  @override
  String get valuesDescription =>
      'À Karma, apprezzemu l\'autenticità, a precisione è a fiducia. Semu impegnati à offre una guida chì ùn hè micca solu precisa ma ancu significativa, aiutenduvi à navigà in a vita cun intuizione è fiducia.';

  @override
  String get contactUs => 'Cuntatta ci';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Situ web: www.a vostra cumpagnia.com';

  @override
  String get customerSupport => 'Assistenza à i clienti';

  @override
  String get supportHeroTitle => 'Semu quì per aiutà';

  @override
  String get supportHeroDescription =>
      'Riempite u furmulariu quì sottu è a nostra squadra di supportu vi cuntatterà u più prestu pussibule.';

  @override
  String get yourName => 'U vostru nome';

  @override
  String get yourEmail => 'U vostru email';

  @override
  String get message => 'Missaghju';

  @override
  String get enterEmail => 'Inserite u vostru indirizzu email';

  @override
  String get enterValidEmail => 'Inserite un indirizzu email validu';

  @override
  String enterField(Object fieldName) {
    return 'Inserite $fieldName';
  }

  @override
  String get send => 'Mandà';

  @override
  String get sending => 'Inviendu...';

  @override
  String get emailSentSuccess => '✅ Email mandatu cù successu!';

  @override
  String get emailSendFailed => '❌ Impossibile mandà l\'email';

  @override
  String get astroDictionaryTitle => 'Dizziunariu Astrologicu';

  @override
  String get searchTermsHint => 'Termini di ricerca...';

  @override
  String get noTermsFound => 'Nisun termine trovu';

  @override
  String get buyQuestionsTitle => 'Cumprà Dumande';

  @override
  String get userNotAuthenticated => 'Utilizatore micca autenticatu';

  @override
  String get loadStoreDataFailed => 'Impossibile caricà i dati di u magazinu';

  @override
  String get missingAuthToken => 'Manca u token d\'autentificazione';

  @override
  String get merchantDisplayName => 'Applicazione di Chat Astro';

  @override
  String get paymentSuccessful => '✅ Pagamentu riesciutu! Quistione mandata';

  @override
  String paymentFailed(Object error) {
    return '❌ Pagamentu fiascatu: $error';
  }

  @override
  String get yourBalance => 'U vostru equilibriu';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Offerte dispunibili';

  @override
  String questionsCount(Object count) {
    return '$count Quistione';
  }

  @override
  String get buyButton => 'Cumprà';

  @override
  String get dailyHoroscopeTitle => '🌟 Oroscopu di u ghjornu';

  @override
  String get userIdMissing => 'L\'ID utilizatore manca';

  @override
  String get fetchHoroscopesFailed => 'Impussibile di recuperà l\'oroscopu';

  @override
  String get noHoroscopeFound => 'Nisun oroscopu trovu.';

  @override
  String get signLabel => 'Firmà';

  @override
  String get todayLabel => 'Oghje';

  @override
  String get yesterdayLabel => 'Eri';

  @override
  String get thisWeekLabel => 'Sta settimana';

  @override
  String get lastMonthLabel => 'U mese scorsu';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Scrivite a vostra dumanda...';

  @override
  String get paymentRequired => 'Pagamentu necessariu';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Avete adupratu e vostre dumande gratuite. Pagate $amount per cuntinuà.';
  }

  @override
  String get payNowButton => 'Pagà Avà';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count dumande libere rimanenti';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count dumande pagate rimanenti';
  }

  @override
  String get thankYouFeedback => 'Grazie per u vostru feedback!';

  @override
  String get ratingSubmitted => 'Valutazione sottumessa!';

  @override
  String get setUserIdFirst =>
      'Per piacè, impostate prima u vostru ID utilizatore';

  @override
  String get failedToFetchPrevious =>
      'Ùn hè statu pussibule di recuperà e dumande è e risposte precedenti';

  @override
  String errorOccurred(Object error) {
    return 'Errore: $error';
  }

  @override
  String get drawerAstroProfile => 'Profilu Astro';

  @override
  String get drawerDailyHoroscope => 'Oroscopu cutidianu';

  @override
  String get drawerBuyQuestions => 'Cumprà Dumande';

  @override
  String get drawerAstroDictionary => 'Dizziunariu Astrologicu';

  @override
  String get drawerSettings => 'Impostazioni';

  @override
  String get drawerCustomerSupport => 'Assistenza à i clienti';

  @override
  String get drawerAbout => 'À propositu';

  @override
  String get drawerProfileSettings => 'Impostazioni di u prufilu';

  @override
  String get demoNotificationTitle => '🔔 Notificazione di Dimostrazione';

  @override
  String get demoNotificationBody =>
      'Questa hè una notificazione di prova da a vostra applicazione!';

  @override
  String get notificationsTitle => 'Notificazioni';

  @override
  String get noNotifications => 'Nisuna notificazione';

  @override
  String get allTab => 'Tuttu';

  @override
  String get markAllAsRead => 'Marcà tuttu cum\'è lettu';

  @override
  String get notificationMarkedRead => 'Notificazione marcata cum\'è letta';

  @override
  String get failedToLoadNotifications =>
      'Ùn hè micca statu pussibule di caricà e notificazioni';

  @override
  String get failedToMarkRead => 'Ùn hè statu pussibule di marcà cum\'è lettu';

  @override
  String get failedToMarkAllRead =>
      'Ùn hè micca statu pussibule di marcà tuttu cum\'è lettu';

  @override
  String get socketConnected => 'Presa cunnessa';

  @override
  String get socketDisconnected => 'Presa scollegata';

  @override
  String get newNotificationReceived => 'Nova notificazione ricevuta';

  @override
  String get generalCategory => 'Generale';

  @override
  String get horoscopeCategory => 'Oroscopu';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Aghjurnamenti';

  @override
  String get howToAskTitle => 'Cumu dumandà';

  @override
  String get noQuestionsAvailable => 'Nisuna dumanda dispunibile';

  @override
  String get failedToLoadQuestions =>
      'Ùn hè micca statu pussibule di caricà e dumande';

  @override
  String get pullToRefresh => 'Tira per rinfrescà';

  @override
  String get careerCategory => 'Carriera';

  @override
  String get loveCategory => 'Amore è Relazioni';

  @override
  String get healthCategory => 'Salute';

  @override
  String get financeCategory => 'Finanza';

  @override
  String get familyCategory => 'Famiglia';

  @override
  String get educationCategory => 'Educazione';

  @override
  String get travelCategory => 'Viaghju';

  @override
  String get spiritualCategory => 'Spirituale';

  @override
  String get profileLoaded => 'U prufilu hè statu caricatu cù successu';

  @override
  String get imageUploaded => 'L\'imagine hè stata caricata cù successu';

  @override
  String get savedInformationConfirmation => 'Aghju salvatu sta infurmazione';

  @override
  String get noHistoryAvailable => 'Nisuna storia dispunibile';

  @override
  String get missingUserIdError => 'L\'ID utilizatore hè necessariu';

  @override
  String get networkError => 'Errore di rete. Per piacè pruvate torna.';

  @override
  String get timeoutError => 'A dumanda hè scaduta';

  @override
  String get genericError => 'Qualcosa hè andatu male';

  @override
  String get reactionUpdateError =>
      'Ùn hè micca statu pussibule d\'aghjurnà a reazione';

  @override
  String get noSearchResults => 'Nisun risultatu di ricerca trovu';

  @override
  String get clearSearch => 'Sguassà a ricerca';

  @override
  String get resultsFound => 'Risultati truvati';

  @override
  String get recoverySecretHint =>
      'A copia-incolla ùn pò micca funziunà, scrivite manualmente';

  @override
  String get recoverAccountDescription =>
      'Segui sti passi per ricuperà u vostru contu';

  @override
  String get processingLabel => 'Trasfurmazione...';

  @override
  String get clearChatSuccess => 'A chat hè stata sbulicata cù successu';

  @override
  String get notificationsEnabled => 'Notificazioni attivate';

  @override
  String get notificationsDisabled => 'Notificazioni disattivate';

  @override
  String get securityNotice =>
      'I vostri dati sò criptati è almacenati in modu sicuru';

  @override
  String get loading => 'Caricamentu in corsu...';

  @override
  String get selectLanguage => 'Selezziunate a lingua';

  @override
  String get onboardingGetStartedDesc =>
      'Cuminciate scegliendu a vostra lingua';

  @override
  String get accountRecoveryTitle => '🔐 Dettagli di Recuperazione di u Contu';

  @override
  String get recoveryInstructions =>
      'Per piacè, salvate sta infurmazione in modu sicuru. Ne averete bisognu per recuperà u vostru contu.';

  @override
  String get importantNotice => '⚠️ Impurtante:';

  @override
  String get astrologerProfileTitle => 'Profilu di l\'astrologu';

  @override
  String get personalAstrologer => 'Astrologu persunale';

  @override
  String get makePersonalAstrologer => 'Fate un Astrologu Persunale';

  @override
  String get favoriteDescription =>
      'E vostre dumande seranu prioritizate à questu astrologu. S\'ellu ùn hè micca dispunibule, un altru astrologu qualificatu vi assisterà.';

  @override
  String get educationQualifications => 'Educazione è Qualificazioni';

  @override
  String get aboutSection => 'À propositu';

  @override
  String get shareProfile => 'Sparte u prufilu';

  @override
  String get loadingAstrologer =>
      'Caricamentu di i dettagli di l\'astrologu...';

  @override
  String get failedToLoadAstrologer =>
      'Ùn hè micca statu pussibule di caricà i dettagli di l\'astrologu';

  @override
  String get authenticationRequired =>
      'Autentificazione necessaria. Per piacè cunnettatevi.';

  @override
  String securityCheckFailed(Object error) {
    return 'A verificazione di sicurezza hà fiascatu: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name hè avà u vostru Astrologu Personale';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Eliminatu $name da i preferiti';
  }

  @override
  String get toggleFavoriteError =>
      'Ùn hè micca statu pussibule d\'aghjurnà u statutu di i preferiti';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Educazione: $education\n📜 Qualificazione: $qualification\n⏳ Esperienza: $experience';
  }

  @override
  String get notProvided => 'Micca furnitu';

  @override
  String reviews(Object count) {
    return '($count recensioni)';
  }

  @override
  String get specialties => 'Specialità';

  @override
  String get experience => 'Esperienza';

  @override
  String get qualification => 'Qualificazione';

  @override
  String get education => 'Educazione';

  @override
  String get recoveryTips =>
      '• Fate una cattura di schermu di sta infurmazione\n• Conservatela in un locu sicuru\n• Ùn spartetela cù nimu\n• Questu serà mostratu solu una volta';

  @override
  String get themeSettingsTitle => 'Impostazioni di u tema';

  @override
  String get lightThemeLabel => 'Luce';

  @override
  String get lightThemeDescription => 'Aduprate sempre un tema chjaru';

  @override
  String get darkThemeLabel => 'Scuru';

  @override
  String get darkThemeDescription => 'Aduprate sempre un tema scuru';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription =>
      'Segui i paràmetri di u sistema per u tema scuru';

  @override
  String get systemThemeLightDescription =>
      'Segui l\'impostazioni di u sistema per u tema chjaru';

  @override
  String get switchToLight => 'Passà à a Luce';

  @override
  String get switchToDark => 'Passà à Scuru';

  @override
  String get ourTeam => 'A nostra squadra';

  @override
  String get teamDescription =>
      'A nostra squadra d\'astrologi vedichi prufessiunali porta anni d\'esperienza in l\'interpretazione di l\'influenze planetarie è di i mudelli di vita. Sustenuta da una squadra di supportu è di sviluppu dedicata, Karma offre una sperienza senza intoppi, affidabile è glubale per ogni utilizatore.';
}
