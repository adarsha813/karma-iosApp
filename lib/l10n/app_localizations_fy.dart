// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Western Frisian (`fy`).
class AppLocalizationsFy extends AppLocalizations {
  AppLocalizationsFy([String locale = 'fy']) : super(locale);

  @override
  String get settingsTitle => 'Ynstellings';

  @override
  String get notificationSettings => 'Notifikaasje-ynstellings';

  @override
  String get privacySettings => 'Privacyynstellingen';

  @override
  String get accountSettings => 'Akkountynstellingen';

  @override
  String get languageSettings => 'Taalynstellingen';

  @override
  String get languageChanged => 'Taal feroare';

  @override
  String get existingUserButton => 'Ik bin in besteande brûker';

  @override
  String get chooseCountryTitle => 'Kies lân';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Nee';

  @override
  String get appBarTitle => 'Profylynstellingen';

  @override
  String get userIdLabel => 'Brûkers-ID *';

  @override
  String get nameLabel => 'Namme';

  @override
  String get birthCountryLabel => 'Bertelân';

  @override
  String get birthCityLabel => 'Bertestêd';

  @override
  String get countrySelectionTitle => 'Kies dyn lân';

  @override
  String get maleLabel => 'Manlik';

  @override
  String get femaleLabel => 'Froulik';

  @override
  String get birthDateLabel => 'Bertedatum';

  @override
  String get birthDatePlaceholder => 'Selektearje bertedatum';

  @override
  String get birthTimeLabel => 'Bertetiid';

  @override
  String get birthTimePlaceholder => 'Selektearje bertetiid';

  @override
  String get saveProfileButton => 'Profyl bewarje';

  @override
  String get noCitiesFound => 'Gjin stêden fûn';

  @override
  String cityPlaceholder(Object country) {
    return 'Fier stêd yn yn $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selektearje earst lân';

  @override
  String get versionHistoryTitle => 'Ferzjehistoarje';

  @override
  String get notSetText => 'Net ynsteld';

  @override
  String nameHistory(Object name) {
    return 'Namme: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Stêd: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Lân: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Geslacht: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Bertedatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Bertetiid: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokaasje: $latitude, $longitude';
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
    return 'Steat: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Bywurke op $date';
  }

  @override
  String get userIdRequired => 'Brûkers-ID is fereaske';

  @override
  String get profileSaved => 'Profyl mei súkses bewarre';

  @override
  String get saveFailed => 'Koe profyl net bewarje';

  @override
  String get errorPrefix => 'Fersin:';

  @override
  String get onboardingChooseLanguage => 'Kies dyn taal';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selektearje jo foarkarstaal om troch te gean.';

  @override
  String get onboardingWhatIsAstrology => 'Wat is astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrology is de stúdzje fan himellichems ...';

  @override
  String get onboardingWhyUseApp => 'Wêrom dizze app brûke?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Krij personaliseare horoskopen, deistige foarsizzingen en begelieding om ynformearre besluten te nimmen.';

  @override
  String get onboardingHowToUse => 'Hoe kinne jo dizze app brûke?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigearje maklik, kontrolearje deistige horoskopen en beheare jo profyl foar krekte foarsizzingen.';

  @override
  String get onboardingGetStarted => 'Begjinne';

  @override
  String get onboardingNewUser => 'Nije brûker';

  @override
  String get onboardingExistingUser => 'Besteande brûker';

  @override
  String get onboardingBack => 'Rêch';

  @override
  String get onboardingNext => 'Folgjende';

  @override
  String get userIdNotFound =>
      'Brûkers-ID net fûn. Meld jo oan of stel jo profyl yn.';

  @override
  String get clearNotificationsTitle => 'Notifikaasjes wiskje';

  @override
  String get clearNotificationsMessage =>
      'Binne jo wis dat jo alle notifikaasjes wiskje wolle?';

  @override
  String get clearNotificationsSuccess =>
      'Alle notifikaasjes binne mei súkses wiske.';

  @override
  String get clearHoroscopeTitle => 'Dúdlike horoskoop';

  @override
  String get clearHoroscopeMessage =>
      'Binne jo wis dat jo jo horoskoopgegevens wiskje wolle?';

  @override
  String get clearHoroscopeSuccess => 'Horoskoop mei súkses wiske.';

  @override
  String get clearChatTitle => 'Chathistoarje wiskje';

  @override
  String get clearChatMessage =>
      'Binne jo wis dat jo al jo petearhistoarje wiskje wolle?';

  @override
  String get clearChatLocal => 'Chat lokaal wiske.';

  @override
  String get deleteAccountTitle => 'Akkoant wiskje';

  @override
  String get deleteAccountMessage =>
      'Binne jo wis dat jo jo akkount wiskje wolle? Dit sil ek al jo petearhistoarje en notifikaasjes wiskje.';

  @override
  String get deleteAccountSuccess =>
      'Dyn akkount en alle gegevens binne fuortsmiten.';

  @override
  String get deleteAccountError => 'Fout by it wiskjen fan akkount';

  @override
  String get logoutTitle => 'Útlogge';

  @override
  String get logoutMessage => 'Binne jo wis dat jo útlogge wolle?';

  @override
  String get termsPrivacyTitle => 'Betingsten en privacy';

  @override
  String get privacyPolicyTitle => 'Privacybelied';

  @override
  String get termsConditionsTitle => 'Betingsten en Kondysjes';

  @override
  String get dataControlTitle => 'Gegevenskontrôle';

  @override
  String get cancelButton => 'Annulearje';

  @override
  String get confirmButton => 'Befêstigje';

  @override
  String get clearQuestionsSuccess => 'Alle fragen mei súkses wiske.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Hear';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Akkoant weromhelje';

  @override
  String get endLabel => 'Ein';

  @override
  String get startDateLabel => 'Begjindatum';

  @override
  String get endDateLabel => 'Eindatum';

  @override
  String get notAvailable => 'Net beskikber';

  @override
  String get noData => 'Gjin gegevens';

  @override
  String get unknownError => 'Unbekende flater';

  @override
  String get retryButton => 'Opnij besykje';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generator';

  @override
  String get natalChartTitle => 'Geboortehoroskoop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rasji';

  @override
  String get ascDegreeLabel => 'Ascendantgraad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ûnbekend';

  @override
  String get clearHoroscope => 'Dúdlike horoskoop';

  @override
  String get clearNotifications => 'Notifikaasjes wiskje';

  @override
  String get clearChatHistory => 'Chathistoarje wiskje';

  @override
  String get logout => 'Útlogge';

  @override
  String get deleteAccount => 'Akkoant wiskje';

  @override
  String get allFieldsRequired => 'Alle fjilden binne ferplicht.';

  @override
  String get accountRecoveredSuccess => 'Akkoant mei súkses weromhelle.';

  @override
  String get recoveryFailed =>
      'Herstel mislearre. Kontrolearje jo ynformaasje.';

  @override
  String get recoverySecretLabel => 'Geheim fan herstel:';

  @override
  String get aboutUsTitle => 'Oer ús';

  @override
  String get aboutOurCompany => 'Oer ús bedriuw';

  @override
  String get aboutCompanyDescription =>
      'Wy binne fan doel om ús brûkers de bêste astrologyske ûnderfining te jaan.';

  @override
  String get ourMission => 'Us missy';

  @override
  String get missionDescription =>
      'Om krekte en personaliseare astrologyske ynsjoch te jaan om brûkers te helpen ynformearre besluten te nimmen yn har libben.';

  @override
  String get ourVision => 'Us fisy';

  @override
  String get visionDescription =>
      'Om it meast fertroude astrologyplatfoarm te wurden, kombinearret technology en âlde wiisheid.';

  @override
  String get ourValues => 'Us wearden';

  @override
  String get valuesDescription =>
      'Yntegriteit, krektens, brûker-sintraal ûntwerp en trochgeande ynnovaasje.';

  @override
  String get contactUs => 'Kontakt mei ús opnimme';

  @override
  String get contactEmail => 'E-post: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webside: www.jobedriuw.com';

  @override
  String get customerSupport => 'Klanttsjinst';

  @override
  String get supportHeroTitle => 'Wy binne hjir om te helpen';

  @override
  String get supportHeroDescription =>
      'Folje it ûndersteande formulier yn en ús stipeteam sil sa gau mooglik kontakt mei jo opnimme.';

  @override
  String get yourName => 'Dyn namme';

  @override
  String get yourEmail => 'Dyn e-postadres';

  @override
  String get message => 'Berjocht';

  @override
  String get enterEmail => 'Fier jo e-postadres yn';

  @override
  String get enterValidEmail => 'Fier in jildich e-mailadres yn';

  @override
  String enterField(Object fieldName) {
    return 'Fier $fieldName yn';
  }

  @override
  String get send => 'Stjoere';

  @override
  String get sending => 'Ferstjoere...';

  @override
  String get emailSentSuccess => '✅ E-post mei súkses ferstjoerd!';

  @override
  String get emailSendFailed => '❌ Koe e-post net ferstjoere';

  @override
  String get astroDictionaryTitle => 'Astro Wurdboek';

  @override
  String get searchTermsHint => 'Syktermen...';

  @override
  String get noTermsFound => 'Gjin termen fûn';

  @override
  String get buyQuestionsTitle => 'Keapje fragen';

  @override
  String get userNotAuthenticated => 'Brûker net autentisearre';

  @override
  String get loadStoreDataFailed => 'Koe winkelgegevens net laden';

  @override
  String get missingAuthToken => 'Untbrekkende autorisaasjetoken';

  @override
  String get merchantDisplayName => 'Astro Chat-app';

  @override
  String get paymentSuccessful => '✅ Betelling slagge! Fraach ferstjoerd';

  @override
  String paymentFailed(Object error) {
    return '❌ Betelling mislearre: $error';
  }

  @override
  String get yourBalance => 'Dyn saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Fragen';
  }

  @override
  String get availableOffers => 'Beskikbere oanbiedingen';

  @override
  String questionsCount(Object count) {
    return '$count Fraach';
  }

  @override
  String get buyButton => 'Keapje';

  @override
  String get dailyHoroscopeTitle => '🌟 Deistige horoskoop';

  @override
  String get userIdMissing => 'Brûkers-ID ûntbrekt';

  @override
  String get fetchHoroscopesFailed => 'Koe horoskopen net ophelje';

  @override
  String get noHoroscopeFound => 'Gjin horoskoop fûn.';

  @override
  String get signLabel => 'Teken';

  @override
  String get todayLabel => 'Hjoed';

  @override
  String get yesterdayLabel => 'Juster';

  @override
  String get thisWeekLabel => 'Dizze wike';

  @override
  String get lastMonthLabel => 'Ferline moanne';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Typ jo fraach...';

  @override
  String get paymentRequired => 'Betelling fereaske';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Jo hawwe jo fergese fragen brûkt. Betelje $amount om troch te gean.';
  }

  @override
  String get payNowButton => 'Betelje no';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count frije fragen oer';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betelle fragen oer';
  }

  @override
  String get thankYouFeedback => 'Tankewol foar jo feedback!';

  @override
  String get ratingSubmitted => 'Beoardieling yntsjinne!';

  @override
  String get setUserIdFirst => 'Stel earst jo brûkers-ID yn';

  @override
  String get failedToFetchPrevious =>
      'Koe foarige fragen en antwurden net ophelje';

  @override
  String errorOccurred(Object error) {
    return 'Fout: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-profyl';

  @override
  String get drawerDailyHoroscope => 'Deistige horoskoop';

  @override
  String get drawerBuyQuestions => 'Keapje fragen';

  @override
  String get drawerAstroDictionary => 'Astro Wurdboek';

  @override
  String get drawerSettings => 'Ynstellings';

  @override
  String get drawerCustomerSupport => 'Klanttsjinst';

  @override
  String get drawerAbout => 'Oer';

  @override
  String get drawerProfileSettings => 'Profylynstellingen';

  @override
  String get demoNotificationTitle => '🔔 Demo-notifikaasje';

  @override
  String get demoNotificationBody => 'Dit is in testnotifikaasje fan jo app!';

  @override
  String get notificationsTitle => 'Notifikaasjes';

  @override
  String get noNotifications => 'Gjin notifikaasjes';

  @override
  String get allTab => 'Alle';

  @override
  String get markAllAsRead => 'Markearje alles as lêzen';

  @override
  String get notificationMarkedRead => 'Notifikaasje markearre as lêzen';

  @override
  String get failedToLoadNotifications => 'Koe notifikaasjes net laden';

  @override
  String get failedToMarkRead => 'Markearjen as lêzen mislearre';

  @override
  String get failedToMarkAllRead => 'Koe net alles as lêzen markearje';

  @override
  String get socketConnected => 'Socket ferbûn';

  @override
  String get socketDisconnected => 'Socket loskeppele';

  @override
  String get newNotificationReceived => 'Nije melding ûntfongen';

  @override
  String get generalCategory => 'Algemien';

  @override
  String get horoscopeCategory => 'Horoskoop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Systeem';

  @override
  String get updateCategory => 'Updates';

  @override
  String get howToAskTitle => 'Hoe te freegjen';

  @override
  String get noQuestionsAvailable => 'Gjin fragen beskikber';

  @override
  String get failedToLoadQuestions => 'Koe fragen net laden';

  @override
  String get pullToRefresh => 'Lûke om te ferfarskjen';

  @override
  String get careerCategory => 'Karriêre';

  @override
  String get loveCategory => 'Leafde en relaasjes';

  @override
  String get healthCategory => 'Sûnens';

  @override
  String get financeCategory => 'Finânsjes';

  @override
  String get familyCategory => 'Famylje';

  @override
  String get educationCategory => 'Oplieding';

  @override
  String get travelCategory => 'Reizgje';

  @override
  String get spiritualCategory => 'Geastlik';

  @override
  String get profileLoaded => 'Profyl mei súkses laden';

  @override
  String get imageUploaded => 'Ofbylding mei súkses uploaden';

  @override
  String get savedInformationConfirmation => 'Ik haw dizze ynformaasje bewarre';

  @override
  String get noHistoryAvailable => 'Gjin skiednis beskikber';

  @override
  String get missingUserIdError => 'Brûkers-ID is fereaske';

  @override
  String get networkError => 'Netwurkflater. Besykje it nochris.';

  @override
  String get timeoutError => 'Fersyk ferrûn';

  @override
  String get genericError => 'Der gie wat mis';

  @override
  String get reactionUpdateError => 'Koe reaksje net bywurkje';

  @override
  String get noSearchResults => 'Gjin sykresultaten fûn';

  @override
  String get clearSearch => 'Sykje wiskje';

  @override
  String get resultsFound => 'Resultaten fûn';

  @override
  String get recoverySecretHint =>
      'Kopiearje-plakke wurket miskien net, typ mei de hân';

  @override
  String get recoverAccountDescription =>
      'Folgje dizze stappen om jo akkount te herstellen';

  @override
  String get processingLabel => 'Ferwurkjen...';

  @override
  String get clearChatSuccess => 'Chat mei súkses wiske';

  @override
  String get notificationsEnabled => 'Notifikaasjes ynskeakele';

  @override
  String get notificationsDisabled => 'Notifikaasjes útskeakele';

  @override
  String get securityNotice =>
      'Dyn gegevens wurde feilich fersifere en opslein';

  @override
  String get loading => 'Ynladen...';

  @override
  String get selectLanguage => 'Selektearje taal';

  @override
  String get onboardingGetStartedDesc => 'Begjin troch jo taal te kiezen';

  @override
  String get accountRecoveryTitle => '🔐 Details foar akkountherstel';

  @override
  String get recoveryInstructions =>
      'Bewarje dizze ynformaasje feilich. Jo sille it nedich hawwe om jo akkount te herstellen.';

  @override
  String get importantNotice => '⚠️ Wichtich:';

  @override
  String get astrologerProfileTitle => 'Profyl fan astrolooch';

  @override
  String get personalAstrologer => 'Persoanlike astrolooch';

  @override
  String get makePersonalAstrologer => 'Meitsje in persoanlike astrolooch';

  @override
  String get favoriteDescription =>
      'Dyn fragen sille prioriteit krije by dizze astrolooch. As dy net beskikber is, sil in oare kwalifisearre astrolooch dy helpe.';

  @override
  String get educationQualifications => 'Oplieding en kwalifikaasjes';

  @override
  String get aboutSection => 'Oer';

  @override
  String get shareProfile => 'Profyl diele';

  @override
  String get loadingAstrologer => 'Details fan astrolooch wurde laden...';

  @override
  String get failedToLoadAstrologer => 'Koe details fan astrolooch net laden';

  @override
  String get authenticationRequired => 'Autentikaasje fereaske. Meld jo oan.';

  @override
  String securityCheckFailed(Object error) {
    return 'Feiligenskontrôle mislearre: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is no dyn Persoanlike Astrolooch';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name út favoriten helle';
  }

  @override
  String get toggleFavoriteError => 'Koe gjin favorite status bywurkje';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Oplieding: $education\n📜 Kwalifikaasje: $qualification\n⏳ Ervaring: $experience';
  }

  @override
  String get notProvided => 'Net foarsjoen';

  @override
  String reviews(Object count) {
    return '($count resinsjes)';
  }

  @override
  String get specialties => 'Spesjaliteiten';

  @override
  String get experience => 'Ûnderfining';

  @override
  String get qualification => 'Kwalifikaasje';

  @override
  String get education => 'Oplieding';

  @override
  String get recoveryTips =>
      '• Meitsje in skermôfbylding fan dizze ynformaasje\n• Bewarje it op in feilich plak\n• Diel it net mei oaren\n• Dit wurdt mar ien kear werjûn';

  @override
  String get themeSettingsTitle => 'Tema-ynstellings';

  @override
  String get lightThemeLabel => 'Ljocht';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tsjuster';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Systeem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
