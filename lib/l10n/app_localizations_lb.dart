// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Luxembourgish Letzeburgesch (`lb`).
class AppLocalizationsLb extends AppLocalizations {
  AppLocalizationsLb([String locale = 'lb']) : super(locale);

  @override
  String get settingsTitle => 'Astellungen';

  @override
  String get notificationSettings => 'Notifikatiounsastellungen';

  @override
  String get privacySettings => 'Dateschutzastellungen';

  @override
  String get accountSettings => 'Kontastellungen';

  @override
  String get languageSettings => 'Sproochastellungen';

  @override
  String get languageChanged => 'Sprooch geännert';

  @override
  String get existingUserButton => 'Ech sinn e bestehenden Benotzer';

  @override
  String get chooseCountryTitle => 'Land auswielen';

  @override
  String get yesText => 'Jo';

  @override
  String get noText => 'Nee';

  @override
  String get appBarTitle => 'Profilastellungen';

  @override
  String get userIdLabel => 'Benotzer-ID *';

  @override
  String get nameLabel => 'Numm';

  @override
  String get birthCountryLabel => 'Gebuertsland';

  @override
  String get birthCityLabel => 'Gebuertsstad';

  @override
  String get countrySelectionTitle => 'Wielt Äert Land';

  @override
  String get maleLabel => 'Männlech';

  @override
  String get femaleLabel => 'Weiblech';

  @override
  String get birthDateLabel => 'Gebuertsdatum';

  @override
  String get birthDatePlaceholder => 'Gebuertsdatum auswielen';

  @override
  String get birthTimeLabel => 'Gebuertszäit';

  @override
  String get birthTimePlaceholder => 'Gebuertszäit auswielen';

  @override
  String get saveProfileButton => 'Profil späicheren';

  @override
  String get noCitiesFound => 'Keng Stied fonnt';

  @override
  String cityPlaceholder(Object country) {
    return 'Gitt d\'Stad an $country an';
  }

  @override
  String get countryFirstPlaceholder => 'Wielt als éischt d\'Land';

  @override
  String get versionHistoryTitle => 'Versiounsgeschicht';

  @override
  String get notSetText => 'Net agestallt';

  @override
  String nameHistory(Object name) {
    return 'Numm: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Stad: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Land: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Geschlecht: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Gebuertsdatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Gebuertszäit: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Standuert: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zäitzon: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Zoustand: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aktualiséiert den $date';
  }

  @override
  String get userIdRequired => 'Benotzer-ID ass erfuerderlech';

  @override
  String get profileSaved => 'Profil erfollegräich gespäichert';

  @override
  String get saveFailed => 'Konnt de Profil net späicheren';

  @override
  String get errorPrefix => 'Feeler:';

  @override
  String get onboardingChooseLanguage => 'Wielt Är Sprooch';

  @override
  String get onboardingChooseLanguageDesc =>
      'Wielt Är bevorzugt Sprooch fir weiderzemaachen.';

  @override
  String get onboardingWhatIsAstrology => 'Wat ass Astrologie?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologie ass déi antik Studie vun den Himmelsbeweegungen an hirem Afloss op d\'mënschlecht Liewen, a bitt Abléck an d\'Perséinlechkeet, Bezéiungen a Liewenserfarungen.';

  @override
  String get onboardingWhyUseApp => 'Firwat dës App benotzen?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Kritt korrekt, vum Mënsch generéiert Horoskoper a Berodung, déi op Är Gebuertshoroskop zougeschnidden sinn. Trefft informéiert Entscheedungen mat deegleche Prognosen a personaliséierte Rotschléi vun erfuerene Astrologen.';

  @override
  String get onboardingHowToUse => 'Wéi benotzt een dës App?';

  @override
  String get onboardingHowToUseDesc =>
      'Gitt einfach Äert Gebuertsdatum, Är genee Zäit, Äert Gebuertsuert an all aner relevant Detailer an, fir direkt unzefänken. Entdeckt deeglech Horoskoper, stellt Froen un Expert-Astrologen a verwaltet Äert Profil fir präzis, personaliséiert Prognosen - kee Login néideg.';

  @override
  String get onboardingGetStarted => 'Ufänken';

  @override
  String get onboardingNewUser => 'Neie Benotzer';

  @override
  String get onboardingExistingUser => 'Bestehenden Benotzer';

  @override
  String get onboardingBack => 'Zréck';

  @override
  String get onboardingNext => 'Weider';

  @override
  String get userIdNotFound =>
      'Benotzer-ID net fonnt. Mellt Iech w.e.g. un oder setzt Äre Profil an.';

  @override
  String get clearNotificationsTitle => 'Notifikatiounen läschen';

  @override
  String get clearNotificationsMessage =>
      'Bass du sécher, datt du all Notifikatioune läschen wëlls?';

  @override
  String get clearNotificationsSuccess =>
      'All Notifikatioune goufen erfollegräich geläscht.';

  @override
  String get clearHoroscopeTitle => 'Kloert Horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Bass du sécher, datt du deng Horoskopdaten läschen wëlls?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop erfollegräich geläscht.';

  @override
  String get clearChatTitle => 'Chat-Verlaf läschen';

  @override
  String get clearChatMessage =>
      'Bass du sécher, datt du däi ganze Chat-Verlaf läsche wëlls?';

  @override
  String get clearChatLocal => 'Chat lokal geläscht.';

  @override
  String get deleteAccountTitle => 'Kont läschen';

  @override
  String get deleteAccountMessage =>
      'Bass du sécher, datt du däi Kont läschen wëlls? Dëst läscht och deng ganz Chatgeschicht an all d\'Notifikatiounen.';

  @override
  String get deleteAccountSuccess =>
      'Äre Kont an all Är Donnéeë goufen geläscht.';

  @override
  String get deleteAccountError => 'Feeler beim Läschen vum Kont';

  @override
  String get logoutTitle => 'Ausloggen';

  @override
  String get logoutMessage => 'Bass du sécher, datt du dech auslogge wëlls?';

  @override
  String get termsPrivacyTitle => 'Konditiounen & Dateschutz';

  @override
  String get privacyPolicyTitle => 'Dateschutzbestimmungen';

  @override
  String get termsConditionsTitle => 'Konditioune & Bedéngungen';

  @override
  String get dataControlTitle => 'Datenkontroll';

  @override
  String get cancelButton => 'Ofbriechen';

  @override
  String get confirmButton => 'Bestätegen';

  @override
  String get clearQuestionsSuccess => 'All Froen erfollegräich geläscht.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Här';

  @override
  String get startLabel => 'Ufank';

  @override
  String get recoverAccount => 'Kont erëmkréien';

  @override
  String get endLabel => 'Enn';

  @override
  String get startDateLabel => 'Ufanksdatum';

  @override
  String get endDateLabel => 'Enndatum';

  @override
  String get notAvailable => 'Net verfügbar';

  @override
  String get noData => 'Keng Donnéeën';

  @override
  String get unknownError => 'Onbekannte Feeler';

  @override
  String get retryButton => 'Probéieren nach eng Kéier';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Gebuertshoroskop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raschi';

  @override
  String get ascDegreeLabel => 'Aszendentgrad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Onbekannt';

  @override
  String get clearHoroscope => 'Kloert Horoskop';

  @override
  String get clearNotifications => 'Notifikatiounen läschen';

  @override
  String get clearChatHistory => 'Chat-Verlaf läschen';

  @override
  String get logout => 'Ausloggen';

  @override
  String get deleteAccount => 'Kont läschen';

  @override
  String get allFieldsRequired => 'All Felder sinn obligatoresch.';

  @override
  String get accountRecoveredSuccess => 'Kont erfollegräich restauréiert.';

  @override
  String get recoveryFailed =>
      'D\'Wiederherstellung ass gescheitert. Iwwerpréift Är Informatiounen.';

  @override
  String get recoverySecretLabel => 'Geheimnis vun der Erhuelung:';

  @override
  String get aboutUsTitle => 'Iwwer eis';

  @override
  String get aboutOurCompany => 'Iwwer eis Firma';

  @override
  String get aboutCompanyDescription =>
      'Bei Karma hëllefe mir Iech, Äre richtege Liewenswee duerch déi zäitlos Wäisheet vun der vedescher Astrologie z\'entdecken. All Abléck kënnt vun echte, erfuerene Astrologen, suergfälteg op Basis vun Ärem eenzegaartege Gebuertshoroskop ausgeschafft. Vu deeglechen Horoskoper bis zu personaliséierter Berodung mécht Karma antikt Wëssen an iwwer 100 Sproochen zougänglech.';

  @override
  String get ourMission => 'Eis Missioun';

  @override
  String get missionDescription =>
      'Eis Missioun ass einfach: authentesch, mënschorientéiert astrologesch Berodung ze bidden, déi Iech ermächtegt, zouversiichtlech an informéiert Entscheedungen ze treffen. All Prognose a Berodung reflektéiert Joere vun professioneller Expertise, net automatiséiert Algorithmen.';

  @override
  String get ourVision => 'Eis Visioun';

  @override
  String get visionDescription =>
      'Mir beméien eis, déi weltwäit vertrauenswierdegst Plattform fir vedesch Astrologie ze sinn, an de Leit iwwerall ze hëllefen, sech selwer, hir Entscheedungen an hire Liewenswee mat Kloerheet a Vertrauen ze verstoen.';

  @override
  String get ourValues => 'Eis Wäerter';

  @override
  String get valuesDescription =>
      'Bei Karma leeë mir Wäert op Authentizitéit, Präzisioun a Vertrauen. Mir engagéieren eis fir Berodung ze bidden, déi net nëmme korrekt, mee och sënnvoll ass, an Iech hëlleft, d\'Liewen mat Abléck a Vertrauen ze navigéieren.';

  @override
  String get contactUs => 'Kontaktéiert eis';

  @override
  String get contactEmail => 'E-Mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Websäit: www.ÄrFirma.com';

  @override
  String get customerSupport => 'Clientssupport';

  @override
  String get supportHeroTitle => 'Mir sinn hei fir ze hëllefen';

  @override
  String get supportHeroDescription =>
      'Fëllt de Formulaire hei ënnendrënner aus an eis Supportéquipe mellt sech sou séier wéi méiglech bei Iech zréck.';

  @override
  String get yourName => 'Ären Numm';

  @override
  String get yourEmail => 'Är E-Mail';

  @override
  String get message => 'Message';

  @override
  String get enterEmail => 'Gitt Är E-Mail-Adress an';

  @override
  String get enterValidEmail => 'Gitt eng gülteg E-Mailadress an';

  @override
  String enterField(Object fieldName) {
    return 'Gitt $fieldName an';
  }

  @override
  String get send => 'Schécken';

  @override
  String get sending => 'Schécken...';

  @override
  String get emailSentSuccess => '✅ E-Mail erfollegräich geschéckt!';

  @override
  String get emailSendFailed => '❌ Konnt d\'E-Mail net schécken';

  @override
  String get astroDictionaryTitle => 'Astro-Wierderbuch';

  @override
  String get searchTermsHint => 'Sichbegrëffer...';

  @override
  String get noTermsFound => 'Keng Begrëffer fonnt';

  @override
  String get buyQuestionsTitle => 'Froen zum Kaafen';

  @override
  String get userNotAuthenticated => 'Benotzer net authentifizéiert';

  @override
  String get loadStoreDataFailed =>
      'D\'Luede vun de Butteksdaten ass fehlgeschloen';

  @override
  String get missingAuthToken => 'Fehlenden Autorisatiounstoken';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Bezuelung erfollegräich! Fro geschéckt';

  @override
  String paymentFailed(Object error) {
    return '❌ Bezuelung feelgeschloen: $error';
  }

  @override
  String get yourBalance => 'Äre Saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Froen';
  }

  @override
  String get availableOffers => 'Verfügbar Offeren';

  @override
  String questionsCount(Object count) {
    return '$count Fro';
  }

  @override
  String get buyButton => 'Kaafen';

  @override
  String get dailyHoroscopeTitle => '🌟 Deeglecht Horoskop';

  @override
  String get userIdMissing => 'Benotzer-ID feelt';

  @override
  String get fetchHoroscopesFailed => 'Horoskoper konnten net ofgeruff ginn';

  @override
  String get noHoroscopeFound => 'Kee Horoskop fonnt.';

  @override
  String get signLabel => 'Ënnerschreift';

  @override
  String get todayLabel => 'Haut';

  @override
  String get yesterdayLabel => 'Gëschter';

  @override
  String get thisWeekLabel => 'Des woch';

  @override
  String get lastMonthLabel => 'Läschte Mount';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Schreift Är Fro an...';

  @override
  String get paymentRequired => 'Bezuelung erfuerderlech';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Dir hutt Är gratis Froen benotzt. Bezuelt $amount fir weiderzemaachen.';
  }

  @override
  String get payNowButton => 'Bezuelt elo';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count fräi Froen bleiwen';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count bezuelte Froen bleiwen';
  }

  @override
  String get thankYouFeedback => 'Merci fir Äre Feedback!';

  @override
  String get ratingSubmitted => 'Bewäertung geschéckt!';

  @override
  String get setUserIdFirst => 'Gitt w.e.g. als éischt Är Benotzer-ID an';

  @override
  String get failedToFetchPrevious =>
      'Konnt fréier Froen an Äntwerten net ofruffen';

  @override
  String errorOccurred(Object error) {
    return 'Feeler: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profil';

  @override
  String get drawerDailyHoroscope => 'Deeglecht Horoskop';

  @override
  String get drawerBuyQuestions => 'Froen zum Kaafen';

  @override
  String get drawerAstroDictionary => 'Astro-Wierderbuch';

  @override
  String get drawerSettings => 'Astellungen';

  @override
  String get drawerCustomerSupport => 'Clientssupport';

  @override
  String get drawerAbout => 'Iwwer';

  @override
  String get drawerProfileSettings => 'Profilastellungen';

  @override
  String get demoNotificationTitle => '🔔 Demo-Notifikatioun';

  @override
  String get demoNotificationBody =>
      'Dëst ass eng Testnotifikatioun vun Ärer App!';

  @override
  String get notificationsTitle => 'Notifikatiounen';

  @override
  String get noNotifications => 'Keng Notifikatiounen';

  @override
  String get allTab => 'Alles';

  @override
  String get markAllAsRead => 'Alles als gelies markéieren';

  @override
  String get notificationMarkedRead => 'Notifikatioun als gelies markéiert';

  @override
  String get failedToLoadNotifications => 'Konnt d\'Notifikatioune net lueden';

  @override
  String get failedToMarkRead => 'Konnt net als gelies markéieren';

  @override
  String get failedToMarkAllRead => 'Konnt alles net als gelies markéieren';

  @override
  String get socketConnected => 'Steckdous ugeschloss';

  @override
  String get socketDisconnected => 'Steckdous getrennt';

  @override
  String get newNotificationReceived => 'Nei Notifikatioun kritt';

  @override
  String get generalCategory => 'Allgemeng';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Aktualiséierungen';

  @override
  String get howToAskTitle => 'Wéi froen';

  @override
  String get noQuestionsAvailable => 'Keng Froen verfügbar';

  @override
  String get failedToLoadQuestions => 'D\'Froen konnten net geluede ginn';

  @override
  String get pullToRefresh => 'Zéien fir ze aktualiséieren';

  @override
  String get careerCategory => 'Carrière';

  @override
  String get loveCategory => 'Léift & Bezéiungen';

  @override
  String get healthCategory => 'Gesondheet';

  @override
  String get financeCategory => 'Finanzen';

  @override
  String get familyCategory => 'Famill';

  @override
  String get educationCategory => 'Ausbildung';

  @override
  String get travelCategory => 'Reesen';

  @override
  String get spiritualCategory => 'Geeschtlech';

  @override
  String get profileLoaded => 'Profil erfollegräich gelueden';

  @override
  String get imageUploaded => 'Bild erfollegräich eropgelueden';

  @override
  String get savedInformationConfirmation =>
      'Ech hunn dës Informatioun gespäichert';

  @override
  String get noHistoryAvailable => 'Kee Verlaf verfügbar';

  @override
  String get missingUserIdError => 'Benotzer-ID ass erfuerderlech';

  @override
  String get networkError => 'Netzwierkfehler. Probéiert et nach eng Kéier.';

  @override
  String get timeoutError => 'Ufro ass ofgelaf';

  @override
  String get genericError => 'Eppes ass schifgaang';

  @override
  String get reactionUpdateError =>
      'D\'Aktualiséierung vun der Reaktioun ass fehlgeschloen';

  @override
  String get noSearchResults => 'Keng Sichresultater fonnt';

  @override
  String get clearSearch => 'Sich läschen';

  @override
  String get resultsFound => 'Resultater fonnt';

  @override
  String get recoverySecretHint =>
      'Kopéieren a Paste funktionéiert vläicht net, tippt manuell';

  @override
  String get recoverAccountDescription =>
      'Follegt dës Schrëtt fir Äre Kont ze recuperéieren';

  @override
  String get processingLabel => 'Veraarbechtung...';

  @override
  String get clearChatSuccess => 'Chat erfollegräich geläscht';

  @override
  String get notificationsEnabled => 'Notifikatiounen aktivéiert';

  @override
  String get notificationsDisabled => 'Notifikatiounen deaktivéiert';

  @override
  String get securityNotice =>
      'Är Donnéeë sinn sécher verschlësselt a gespäichert';

  @override
  String get loading => 'Lueden...';

  @override
  String get selectLanguage => 'Sprooch auswielen';

  @override
  String get onboardingGetStartedDesc =>
      'Fänkt un andeems Dir Är Sprooch auswielt';

  @override
  String get accountRecoveryTitle => '🔐 Detailer fir d\'Kont-Erhuelung';

  @override
  String get recoveryInstructions =>
      'Späichert dës Informatioun w.e.g. sécher. Dir braucht se fir Äre Kont erëmzestellen.';

  @override
  String get importantNotice => '⚠️ Wichteg:';

  @override
  String get astrologerProfileTitle => 'Profil vum Astrolog';

  @override
  String get personalAstrologer => 'Perséinlechen Astrolog';

  @override
  String get makePersonalAstrologer => 'Perséinlechen Astrolog maachen';

  @override
  String get favoriteDescription =>
      'Är Froen ginn un dësen Astrolog prioritär behandelt. Wann hien net verfügbar ass, hëlleft Iech en aneren qualifizéierten Astrolog.';

  @override
  String get educationQualifications => 'Ausbildung & Qualifikatiounen';

  @override
  String get aboutSection => 'Iwwer';

  @override
  String get shareProfile => 'Profil deelen';

  @override
  String get loadingAstrologer => 'Detailer vum Astrolog ginn gelueden...';

  @override
  String get failedToLoadAstrologer =>
      'Konnt d\'Detailer vum Astrolog net lueden';

  @override
  String get authenticationRequired =>
      'Authentifikatioun erfuerderlech. Mellt Iech w.e.g. un.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sécherheetskontroll gescheitert: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ass elo Äre perséinlechen Astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name aus de Favoritten ewechgeholl';
  }

  @override
  String get toggleFavoriteError => 'Konnt de Favoritstatus net aktualiséieren';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Ausbildung: $education\n📜 Qualifikatioun: $qualification\n⏳ Erfahrung: $experience';
  }

  @override
  String get notProvided => 'Net geliwwert';

  @override
  String reviews(Object count) {
    return '($count Bewäertungen)';
  }

  @override
  String get specialties => 'Spezialitéiten';

  @override
  String get experience => 'Erfahrung';

  @override
  String get qualification => 'Qualifikatioun';

  @override
  String get education => 'Ausbildung';

  @override
  String get recoveryTips =>
      '• Maacht e Screenshot vun dëser Informatioun\n• Späichert se op enger sécherer Plaz\n• Deelt se mat kengem\n• Dëst gëtt nëmmen eemol ugewisen';

  @override
  String get themeSettingsTitle => 'Theme-Astellungen';

  @override
  String get lightThemeLabel => 'Liicht';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Däischter';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'System';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Eis Equipe';

  @override
  String get teamDescription =>
      'Eis Equipe vu professionelle vedeschen Astrologen huet Joeren Erfahrung an der Interpretatioun vu planetareschen Aflëss a Liewensmuster. Ënnerstëtzt vun engem engagéierten Support- an Entwécklungsteam bitt Karma eng nahtlos, zouverlässeg a global Erfahrung fir all Benotzer.';
}
