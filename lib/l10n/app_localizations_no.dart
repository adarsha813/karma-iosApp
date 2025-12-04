// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get notificationSettings => 'Varslingsinnstillinger';

  @override
  String get privacySettings => 'Personverninnstillinger';

  @override
  String get accountSettings => 'Kontoinnstillinger';

  @override
  String get languageSettings => 'Språkinnstillinger';

  @override
  String get languageChanged => 'Språk endret';

  @override
  String get existingUserButton => 'Jeg er en eksisterende bruker';

  @override
  String get chooseCountryTitle => 'Velg land';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Ingen';

  @override
  String get appBarTitle => 'Profilinnstillinger';

  @override
  String get userIdLabel => 'Bruker-ID *';

  @override
  String get nameLabel => 'Navn';

  @override
  String get birthCountryLabel => 'Fødselsland';

  @override
  String get birthCityLabel => 'Fødested';

  @override
  String get countrySelectionTitle => 'Velg ditt land';

  @override
  String get maleLabel => 'Mann';

  @override
  String get femaleLabel => 'Hunn';

  @override
  String get birthDateLabel => 'Fødselsdato';

  @override
  String get birthDatePlaceholder => 'Velg fødselsdato';

  @override
  String get birthTimeLabel => 'Fødselstid';

  @override
  String get birthTimePlaceholder => 'Velg fødselstidspunkt';

  @override
  String get saveProfileButton => 'Lagre profil';

  @override
  String get noCitiesFound => 'Ingen byer funnet';

  @override
  String cityPlaceholder(Object country) {
    return 'Skriv inn by i $country';
  }

  @override
  String get countryFirstPlaceholder => 'Velg land først';

  @override
  String get versionHistoryTitle => 'Versjonshistorikk';

  @override
  String get notSetText => 'Ikke angitt';

  @override
  String nameHistory(Object name) {
    return 'Navn: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'By: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Land: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Kjønn: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Fødselsdato: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Fødselstidspunkt: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Sted: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Sommertid: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Tilstand: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Oppdatert $date';
  }

  @override
  String get userIdRequired => 'Bruker-ID kreves';

  @override
  String get profileSaved => 'Profilen er lagret';

  @override
  String get saveFailed => 'Kunne ikke lagre profilen';

  @override
  String get errorPrefix => 'Feil:';

  @override
  String get onboardingChooseLanguage => 'Velg språket ditt';

  @override
  String get onboardingChooseLanguageDesc =>
      'Velg ditt foretrukne språk for å fortsette.';

  @override
  String get onboardingWhatIsAstrology => 'Hva er astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi er den eldgamle studien av himmelbevegelser og deres innflytelse på menneskelivet, og gir innsikt i personlighet, forhold og livshendelser.';

  @override
  String get onboardingWhyUseApp => 'Hvorfor bruke denne appen?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Motta nøyaktige, menneskeskapte horoskoper og veiledning skreddersydd til fødselshoroskopet ditt. Ta informerte beslutninger med daglige spådommer og personlige råd fra erfarne astrologer.';

  @override
  String get onboardingHowToUse => 'Hvordan bruker man denne appen?';

  @override
  String get onboardingHowToUseDesc =>
      'Bare skriv inn fødselsdato, nøyaktig tidspunkt, fødested og andre relevante detaljer for å komme i gang umiddelbart. Utforsk daglige horoskoper, still spørsmål til ekspertastrologer og administrer profilen din for presise, personlige spådommer – uten behov for innlogging.';

  @override
  String get onboardingGetStarted => 'Kom i gang';

  @override
  String get onboardingNewUser => 'Ny bruker';

  @override
  String get onboardingExistingUser => 'Eksisterende bruker';

  @override
  String get onboardingBack => 'Tilbake';

  @override
  String get onboardingNext => 'Neste';

  @override
  String get userIdNotFound =>
      'Bruker-ID ikke funnet. Vennligst logg inn eller angi profilen din.';

  @override
  String get clearNotificationsTitle => 'Fjern varsler';

  @override
  String get clearNotificationsMessage =>
      'Er du sikker på at du vil slette alle varsler?';

  @override
  String get clearNotificationsSuccess => 'Alle varsler ble slettet.';

  @override
  String get clearHoroscopeTitle => 'Klart horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Er du sikker på at du vil slette horoskopdataene dine?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopet er slettet.';

  @override
  String get clearChatTitle => 'Tøm chatteloggen';

  @override
  String get clearChatMessage =>
      'Er du sikker på at du vil slette hele chatloggen din?';

  @override
  String get clearChatLocal => 'Chatten er slettet lokalt.';

  @override
  String get deleteAccountTitle => 'Slett konto';

  @override
  String get deleteAccountMessage =>
      'Er du sikker på at du vil slette kontoen din? Dette vil også slette all chatlogg og alle varsler.';

  @override
  String get deleteAccountSuccess =>
      'Kontoen din og alle dataene dine er fjernet.';

  @override
  String get deleteAccountError => 'Feil ved sletting av konto';

  @override
  String get logoutTitle => 'Logg ut';

  @override
  String get logoutMessage => 'Er du sikker på at du vil logge ut?';

  @override
  String get termsPrivacyTitle => 'Vilkår og personvern';

  @override
  String get privacyPolicyTitle => 'Personvernerklæring';

  @override
  String get termsConditionsTitle => 'Vilkår og betingelser';

  @override
  String get dataControlTitle => 'Datakontroll';

  @override
  String get cancelButton => 'Kansellere';

  @override
  String get confirmButton => 'Bekrefte';

  @override
  String get clearQuestionsSuccess => 'Alle spørsmålene er slettet.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Gjenopprett konto';

  @override
  String get endLabel => 'Slutt';

  @override
  String get startDateLabel => 'Startdato';

  @override
  String get endDateLabel => 'Sluttdato';

  @override
  String get notAvailable => 'Ikke tilgjengelig';

  @override
  String get noData => 'Ingen data';

  @override
  String get unknownError => 'Ukjent feil';

  @override
  String get retryButton => 'Prøv på nytt';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generator';

  @override
  String get natalChartTitle => 'Fødselshoroskop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rasji';

  @override
  String get ascDegreeLabel => 'Ascendantgrad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ukjent';

  @override
  String get clearHoroscope => 'Klart horoskop';

  @override
  String get clearNotifications => 'Fjern varsler';

  @override
  String get clearChatHistory => 'Tøm chatteloggen';

  @override
  String get logout => 'Logg ut';

  @override
  String get deleteAccount => 'Slett konto';

  @override
  String get allFieldsRequired => 'Alle felt er obligatoriske.';

  @override
  String get accountRecoveredSuccess => 'Kontoen er gjenopprettet.';

  @override
  String get recoveryFailed =>
      'Gjenopprettingen mislyktes. Sjekk informasjonen din.';

  @override
  String get recoverySecretLabel => 'Hemmeligheten med gjenoppretting:';

  @override
  String get aboutUsTitle => 'Om oss';

  @override
  String get aboutOurCompany => 'Om selskapet vårt';

  @override
  String get aboutCompanyDescription =>
      'Hos Karma hjelper vi deg med å avdekke din sanne livssti gjennom den tidløse visdommen i vedisk astrologi. All innsikt kommer fra ekte, erfarne astrologer, nøye utformet basert på ditt unike fødselshoroskop. Fra daglige horoskoper til personlig veiledning gjør Karma eldgammel kunnskap tilgjengelig på over 100 språk.';

  @override
  String get ourMission => 'Vårt oppdrag';

  @override
  String get missionDescription =>
      'Vårt oppdrag er enkelt: å gi autentisk, menneskeledet astrologisk veiledning som gir deg mulighet til å ta trygge og informerte beslutninger. Hver prediksjon og konsultasjon gjenspeiler årelang profesjonell ekspertise, ikke automatiserte algoritmer.';

  @override
  String get ourVision => 'Vår visjon';

  @override
  String get visionDescription =>
      'Vi streber etter å være verdens mest pålitelige plattform for vedisk astrologi, og hjelpe folk overalt med å forstå seg selv, sine valg og sin livsreise med klarhet og selvtillit.';

  @override
  String get ourValues => 'Våre verdier';

  @override
  String get valuesDescription =>
      'Hos Karma verdsetter vi autentisitet, presisjon og tillit. Vi er opptatt av å tilby veiledning som ikke bare er nøyaktig, men også meningsfull, og som hjelper deg med å navigere livet med innsikt og selvtillit.';

  @override
  String get contactUs => 'Kontakt oss';

  @override
  String get contactEmail => 'E-post: support@yourcompany.com';

  @override
  String get contactWebsite => 'Nettside: www.dittselskap.com';

  @override
  String get customerSupport => 'Kundestøtte';

  @override
  String get supportHeroTitle => 'Vi er her for å hjelpe';

  @override
  String get supportHeroDescription =>
      'Fyll ut skjemaet nedenfor, så vil supportteamet vårt kontakte deg så snart som mulig.';

  @override
  String get yourName => 'Ditt navn';

  @override
  String get yourEmail => 'Din e-post';

  @override
  String get message => 'Beskjed';

  @override
  String get enterEmail => 'Skriv inn e-postadressen din';

  @override
  String get enterValidEmail => 'Skriv inn en gyldig e-postadresse';

  @override
  String enterField(Object fieldName) {
    return 'Skriv inn $fieldName';
  }

  @override
  String get send => 'Sende';

  @override
  String get sending => 'Sender...';

  @override
  String get emailSentSuccess => '✅ E-post sendt!';

  @override
  String get emailSendFailed => '❌ Kunne ikke sende e-post';

  @override
  String get astroDictionaryTitle => 'Astro-ordbok';

  @override
  String get searchTermsHint => 'Søkeord...';

  @override
  String get noTermsFound => 'Ingen termer funnet';

  @override
  String get buyQuestionsTitle => 'Kjøpsspørsmål';

  @override
  String get userNotAuthenticated => 'Brukeren er ikke autentisert';

  @override
  String get loadStoreDataFailed => 'Kunne ikke laste inn butikkdata';

  @override
  String get missingAuthToken => 'Mangler autentiseringstoken';

  @override
  String get merchantDisplayName => 'Astro Chat-appen';

  @override
  String get paymentSuccessful => '✅ Betaling vellykket! Spørsmål sendt';

  @override
  String paymentFailed(Object error) {
    return '❌ Betalingen mislyktes: $error';
  }

  @override
  String get yourBalance => 'Din saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Spørsmål';
  }

  @override
  String get availableOffers => 'Tilgjengelige tilbud';

  @override
  String questionsCount(Object count) {
    return '$count Spørsmål';
  }

  @override
  String get buyButton => 'Kjøpe';

  @override
  String get dailyHoroscopeTitle => '🌟 Daglig horoskop';

  @override
  String get userIdMissing => 'Bruker-ID mangler';

  @override
  String get fetchHoroscopesFailed => 'Kunne ikke hente horoskoper';

  @override
  String get noHoroscopeFound => 'Ingen horoskop funnet.';

  @override
  String get signLabel => 'Skilt';

  @override
  String get todayLabel => 'I dag';

  @override
  String get yesterdayLabel => 'I går';

  @override
  String get thisWeekLabel => 'Denne uken';

  @override
  String get lastMonthLabel => 'Forrige måned';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Skriv inn spørsmålet ditt...';

  @override
  String get paymentRequired => 'Betaling kreves';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Du har brukt opp de gratis spørsmålene dine. Betal $amount for å fortsette.';
  }

  @override
  String get payNowButton => 'Betal nå';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ledige spørsmål igjen';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betalte spørsmål gjenstår';
  }

  @override
  String get thankYouFeedback => 'Takk for tilbakemeldingen din!';

  @override
  String get ratingSubmitted => 'Vurdering sendt inn!';

  @override
  String get setUserIdFirst => 'Vennligst angi bruker-ID-en din først';

  @override
  String get failedToFetchPrevious =>
      'Kunne ikke hente tidligere spørsmål og svar';

  @override
  String errorOccurred(Object error) {
    return 'Feil: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-profil';

  @override
  String get drawerDailyHoroscope => 'Daglig horoskop';

  @override
  String get drawerBuyQuestions => 'Kjøpsspørsmål';

  @override
  String get drawerAstroDictionary => 'Astro-ordbok';

  @override
  String get drawerSettings => 'Innstillinger';

  @override
  String get drawerCustomerSupport => 'Kundestøtte';

  @override
  String get drawerAbout => 'Om';

  @override
  String get drawerProfileSettings => 'Profilinnstillinger';

  @override
  String get demoNotificationTitle => '🔔 Demovarsel';

  @override
  String get demoNotificationBody => 'Dette er et testvarsel fra appen din!';

  @override
  String get notificationsTitle => 'Varsler';

  @override
  String get noNotifications => 'Ingen varsler';

  @override
  String get allTab => 'Alle';

  @override
  String get markAllAsRead => 'Merk alle som lest';

  @override
  String get notificationMarkedRead => 'Varsel merket som lest';

  @override
  String get failedToLoadNotifications => 'Kunne ikke laste inn varsler';

  @override
  String get failedToMarkRead => 'Kunne ikke markere som lest';

  @override
  String get failedToMarkAllRead => 'Kunne ikke merke alle som lest';

  @override
  String get socketConnected => 'Stikkontakt tilkoblet';

  @override
  String get socketDisconnected => 'Stikkontakt frakoblet';

  @override
  String get newNotificationReceived => 'Nytt varsel mottatt';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Oppdateringer';

  @override
  String get howToAskTitle => 'Hvordan spørre';

  @override
  String get noQuestionsAvailable => 'Ingen spørsmål tilgjengelig';

  @override
  String get failedToLoadQuestions => 'Kunne ikke laste inn spørsmål';

  @override
  String get pullToRefresh => 'Trekk for å oppdatere';

  @override
  String get careerCategory => 'Karriere';

  @override
  String get loveCategory => 'Kjærlighet og forhold';

  @override
  String get healthCategory => 'Helse';

  @override
  String get financeCategory => 'Finansiere';

  @override
  String get familyCategory => 'Familie';

  @override
  String get educationCategory => 'Utdannelse';

  @override
  String get travelCategory => 'Reise';

  @override
  String get spiritualCategory => 'Åndelig';

  @override
  String get profileLoaded => 'Profilen var lastet inn';

  @override
  String get imageUploaded => 'Bildet er lastet opp';

  @override
  String get savedInformationConfirmation =>
      'Jeg har lagret denne informasjonen';

  @override
  String get noHistoryAvailable => 'Ingen historikk tilgjengelig';

  @override
  String get missingUserIdError => 'Bruker-ID kreves';

  @override
  String get networkError => 'Nettverksfeil. Prøv på nytt.';

  @override
  String get timeoutError => 'Forespørselen er tidsavbrutt';

  @override
  String get genericError => 'Noe gikk galt';

  @override
  String get reactionUpdateError => 'Kunne ikke oppdatere reaksjonen';

  @override
  String get noSearchResults => 'Ingen søkeresultater funnet';

  @override
  String get clearSearch => 'Tøm søk';

  @override
  String get resultsFound => 'Resultater funnet';

  @override
  String get recoverySecretHint =>
      'Kopier og lim inn fungerer kanskje ikke, skriv manuelt';

  @override
  String get recoverAccountDescription =>
      'Følg disse trinnene for å gjenopprette kontoen din';

  @override
  String get processingLabel => 'Behandling...';

  @override
  String get clearChatSuccess => 'Chatten er slettet';

  @override
  String get notificationsEnabled => 'Varsler aktivert';

  @override
  String get notificationsDisabled => 'Varsler deaktivert';

  @override
  String get securityNotice => 'Dataene dine er sikkert kryptert og lagret';

  @override
  String get loading => 'Laster inn...';

  @override
  String get selectLanguage => 'Velg språk';

  @override
  String get onboardingGetStartedDesc => 'Kom i gang ved å velge språk';

  @override
  String get accountRecoveryTitle => '🔐 Detaljer om kontogjenoppretting';

  @override
  String get recoveryInstructions =>
      'Vennligst lagre denne informasjonen på et trygt sted. Du trenger den for å gjenopprette kontoen din.';

  @override
  String get importantNotice => '⚠️ Viktig:';

  @override
  String get astrologerProfileTitle => 'Astrologprofil';

  @override
  String get personalAstrologer => 'Personlig astrolog';

  @override
  String get makePersonalAstrologer => 'Bli personlig astrolog';

  @override
  String get favoriteDescription =>
      'Spørsmålene dine vil bli prioritert til denne astrologen. Hvis denne ikke er tilgjengelig, vil en annen kvalifisert astrolog hjelpe deg.';

  @override
  String get educationQualifications => 'Utdanning og kvalifikasjoner';

  @override
  String get aboutSection => 'Om';

  @override
  String get shareProfile => 'Del profil';

  @override
  String get loadingAstrologer => 'Laster inn detaljer om astrologen ...';

  @override
  String get failedToLoadAstrologer => 'Kunne ikke laste inn astrologdetaljer';

  @override
  String get authenticationRequired =>
      'Autentisering kreves. Vennligst logg inn.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sikkerhetssjekken mislyktes: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name er nå din personlige astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Fjernet $name fra favoritter';
  }

  @override
  String get toggleFavoriteError => 'Kunne ikke oppdatere favorittstatusen';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Utdanning: $education\n📜 Kvalifikasjon: $qualification\n⏳ Erfaring: $experience';
  }

  @override
  String get notProvided => 'Ikke oppgitt';

  @override
  String reviews(Object count) {
    return '($count anmeldelser)';
  }

  @override
  String get specialties => 'Spesialiteter';

  @override
  String get experience => 'Erfaring';

  @override
  String get qualification => 'Kvalifikasjon';

  @override
  String get education => 'Utdannelse';

  @override
  String get recoveryTips =>
      '• Ta et skjermbilde av denne informasjonen\n• Oppbevar den på et sikkert sted\n• Ikke del den med noen\n• Dette vises bare én gang';

  @override
  String get themeSettingsTitle => 'Temainnstillinger';

  @override
  String get lightThemeLabel => 'Lys';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Mørk';

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
  String get ourTeam => 'Vårt team';

  @override
  String get teamDescription =>
      'Vårt team av profesjonelle vediske astrologer har mange års erfaring med å tolke planetariske påvirkninger og livsmønstre. Med støtte fra et dedikert support- og utviklingsteam leverer Karma en sømløs, pålitelig og global opplevelse for alle brukere.';
}
