// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get notificationSettings => 'Meddelelsesindstillinger';

  @override
  String get privacySettings => 'Privatlivsindstillinger';

  @override
  String get accountSettings => 'Kontoindstillinger';

  @override
  String get languageSettings => 'Sprogindstillinger';

  @override
  String get languageChanged => 'Sprog ændret';

  @override
  String get existingUserButton => 'Jeg er en eksisterende bruger';

  @override
  String get chooseCountryTitle => 'Vælg land';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Ingen';

  @override
  String get appBarTitle => 'Profilindstillinger';

  @override
  String get userIdLabel => 'Bruger-ID *';

  @override
  String get nameLabel => 'Navn';

  @override
  String get birthCountryLabel => 'Fødeland';

  @override
  String get birthCityLabel => 'Fødeby';

  @override
  String get countrySelectionTitle => 'Vælg dit land';

  @override
  String get maleLabel => 'Han';

  @override
  String get femaleLabel => 'Kvinde';

  @override
  String get birthDateLabel => 'Fødselsdato';

  @override
  String get birthDatePlaceholder => 'Vælg fødselsdato';

  @override
  String get birthTimeLabel => 'Fødselstidspunkt';

  @override
  String get birthTimePlaceholder => 'Vælg fødselstidspunkt';

  @override
  String get saveProfileButton => 'Gem profil';

  @override
  String get noCitiesFound => 'Ingen byer fundet';

  @override
  String cityPlaceholder(Object country) {
    return 'Indtast by i $country';
  }

  @override
  String get countryFirstPlaceholder => 'Vælg land først';

  @override
  String get versionHistoryTitle => 'Versionshistorik';

  @override
  String get notSetText => 'Ikke indstillet';

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
    return 'Køn: $gender';
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
    return 'Placering: $latitude, $longitude';
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
    return 'Opdateret den $date';
  }

  @override
  String get userIdRequired => 'Bruger-ID er påkrævet';

  @override
  String get profileSaved => 'Profilen er gemt';

  @override
  String get saveFailed => 'Profilen kunne ikke gemmes';

  @override
  String get errorPrefix => 'Fejl:';

  @override
  String get onboardingChooseLanguage => 'Vælg dit sprog';

  @override
  String get onboardingChooseLanguageDesc =>
      'Vælg dit foretrukne sprog for at fortsætte.';

  @override
  String get onboardingWhatIsAstrology => 'Hvad er astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi er studiet af himmellegemer ...';

  @override
  String get onboardingWhyUseApp => 'Hvorfor bruge denne app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Få personlige horoskoper, daglige forudsigelser og vejledning til at træffe informerede beslutninger.';

  @override
  String get onboardingHowToUse => 'Hvordan bruger man denne app?';

  @override
  String get onboardingHowToUseDesc =>
      'Naviger nemt, tjek daglige horoskoper, og administrer din profil for at få præcise forudsigelser.';

  @override
  String get onboardingGetStarted => 'Kom i gang';

  @override
  String get onboardingNewUser => 'Ny bruger';

  @override
  String get onboardingExistingUser => 'Eksisterende bruger';

  @override
  String get onboardingBack => 'Tilbage';

  @override
  String get onboardingNext => 'Næste';

  @override
  String get userIdNotFound =>
      'Bruger-ID ikke fundet. Log venligst ind eller opret din profil.';

  @override
  String get clearNotificationsTitle => 'Ryd notifikationer';

  @override
  String get clearNotificationsMessage =>
      'Er du sikker på, at du vil rydde alle notifikationer?';

  @override
  String get clearNotificationsSuccess =>
      'Alle notifikationer er blevet slettet.';

  @override
  String get clearHoroscopeTitle => 'Klart horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Er du sikker på, at du vil slette dine horoskopdata?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopet er ryddet.';

  @override
  String get clearChatTitle => 'Ryd chathistorik';

  @override
  String get clearChatMessage =>
      'Er du sikker på, at du vil slette hele din chathistorik?';

  @override
  String get clearChatLocal => 'Chatten er ryddet lokalt.';

  @override
  String get deleteAccountTitle => 'Slet konto';

  @override
  String get deleteAccountMessage =>
      'Er du sikker på, at du vil slette din konto? Dette vil også rydde al din chathistorik og alle dine notifikationer.';

  @override
  String get deleteAccountSuccess =>
      'Din konto og alle data er blevet fjernet.';

  @override
  String get deleteAccountError => 'Fejl ved sletning af konto';

  @override
  String get logoutTitle => 'Log ud';

  @override
  String get logoutMessage => 'Er du sikker på, at du vil logge ud?';

  @override
  String get termsPrivacyTitle => 'Vilkår og privatliv';

  @override
  String get privacyPolicyTitle => 'Privatlivspolitik';

  @override
  String get termsConditionsTitle => 'Vilkår og betingelser';

  @override
  String get dataControlTitle => 'Datakontrol';

  @override
  String get cancelButton => 'Ophæve';

  @override
  String get confirmButton => 'Bekræfte';

  @override
  String get clearQuestionsSuccess => 'Alle spørgsmål er slettet.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Herre';

  @override
  String get startLabel => 'Starte';

  @override
  String get recoverAccount => 'Gendan konto';

  @override
  String get endLabel => 'Ende';

  @override
  String get startDateLabel => 'Startdato';

  @override
  String get endDateLabel => 'Slutdato';

  @override
  String get notAvailable => 'Ikke tilgængelig';

  @override
  String get noData => 'Ingen data';

  @override
  String get unknownError => 'Ukendt fejl';

  @override
  String get retryButton => 'Prøv igen';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generator';

  @override
  String get natalChartTitle => 'Fødselshoroskop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Ascendantgrad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ukendt';

  @override
  String get clearHoroscope => 'Klart horoskop';

  @override
  String get clearNotifications => 'Ryd notifikationer';

  @override
  String get clearChatHistory => 'Ryd chathistorik';

  @override
  String get logout => 'Log ud';

  @override
  String get deleteAccount => 'Slet konto';

  @override
  String get allFieldsRequired => 'Alle felter er obligatoriske.';

  @override
  String get accountRecoveredSuccess => 'Kontoen er blevet gendannet.';

  @override
  String get recoveryFailed =>
      'Gendannelse mislykkedes. Tjek dine oplysninger.';

  @override
  String get recoverySecretLabel => 'Genopretningshemmeligheden:';

  @override
  String get aboutUsTitle => 'Om os';

  @override
  String get aboutOurCompany => 'Om vores virksomhed';

  @override
  String get aboutCompanyDescription =>
      'Vi er forpligtet til at levere den bedste astrologioplevelse til vores brugere.';

  @override
  String get ourMission => 'Vores mission';

  @override
  String get missionDescription =>
      'At give præcise og personlige astrologiske indsigter for at hjælpe brugerne med at træffe informerede beslutninger i deres liv.';

  @override
  String get ourVision => 'Vores vision';

  @override
  String get visionDescription =>
      'At blive den mest betroede astrologiplatform, der kombinerer teknologi og ældgammel visdom.';

  @override
  String get ourValues => 'Vores værdier';

  @override
  String get valuesDescription =>
      'Integritet, nøjagtighed, brugercentreret design og kontinuerlig innovation.';

  @override
  String get contactUs => 'Kontakt os';

  @override
  String get contactEmail => 'E-mail: support@dinvirksomhed.com';

  @override
  String get contactWebsite => 'Hjemmeside: www.dinvirksomhed.com';

  @override
  String get customerSupport => 'Kundesupport';

  @override
  String get supportHeroTitle => 'Vi er her for at hjælpe';

  @override
  String get supportHeroDescription =>
      'Udfyld formularen nedenfor, så vender vores supportteam tilbage til dig hurtigst muligt.';

  @override
  String get yourName => 'Dit navn';

  @override
  String get yourEmail => 'Din e-mail';

  @override
  String get message => 'Besked';

  @override
  String get enterEmail => 'Indtast din e-mail';

  @override
  String get enterValidEmail => 'Indtast en gyldig e-mailadresse';

  @override
  String enterField(Object fieldName) {
    return 'Indtast $fieldName';
  }

  @override
  String get send => 'Sende';

  @override
  String get sending => 'Sender...';

  @override
  String get emailSentSuccess => '✅ E-mail sendt!';

  @override
  String get emailSendFailed => '❌ Kunne ikke sende e-mail';

  @override
  String get astroDictionaryTitle => 'Astro-ordbog';

  @override
  String get searchTermsHint => 'Søgeord...';

  @override
  String get noTermsFound => 'Ingen termer fundet';

  @override
  String get buyQuestionsTitle => 'Køb spørgsmål';

  @override
  String get userNotAuthenticated => 'Brugeren er ikke godkendt';

  @override
  String get loadStoreDataFailed => 'Kunne ikke indlæse butiksdata';

  @override
  String get missingAuthToken => 'Manglende godkendelsestoken';

  @override
  String get merchantDisplayName => 'Astro Chat-app';

  @override
  String get paymentSuccessful => '✅ Betaling gennemført! Spørgsmål sendt';

  @override
  String paymentFailed(Object error) {
    return '❌ Betaling mislykkedes: $error';
  }

  @override
  String get yourBalance => 'Din saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Spørgsmål';
  }

  @override
  String get availableOffers => 'Tilgængelige tilbud';

  @override
  String questionsCount(Object count) {
    return '$count Spørgsmål';
  }

  @override
  String get buyButton => 'Købe';

  @override
  String get dailyHoroscopeTitle => '🌟 Dagligt horoskop';

  @override
  String get userIdMissing => 'Bruger-ID mangler';

  @override
  String get fetchHoroscopesFailed => 'Kunne ikke hente horoskoper';

  @override
  String get noHoroscopeFound => 'Intet horoskop fundet.';

  @override
  String get signLabel => 'Tegn';

  @override
  String get todayLabel => 'I dag';

  @override
  String get yesterdayLabel => 'I går';

  @override
  String get thisWeekLabel => 'Denne uge';

  @override
  String get lastMonthLabel => 'Sidste måned';

  @override
  String get chatTitle => 'Snak';

  @override
  String get typeYourQuestionHint => 'Skriv dit spørgsmål...';

  @override
  String get paymentRequired => 'Betaling påkrævet';

  @override
  String get paymentRequiredMessage =>
      'Du har brugt dine gratis spørgsmål. Betal ₹50 for at fortsætte.';

  @override
  String get payNowButton => 'Betal nu';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ledige spørgsmål tilbage';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betalte spørgsmål tilbage';
  }

  @override
  String get thankYouFeedback => 'Tak for din feedback!';

  @override
  String get ratingSubmitted => 'Bedømmelse indsendt!';

  @override
  String get setUserIdFirst => 'Angiv venligst dit bruger-ID først';

  @override
  String get failedToFetchPrevious =>
      'Kunne ikke hente tidligere spørgsmål og svar';

  @override
  String errorOccurred(Object error) {
    return 'Fejl: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-profil';

  @override
  String get drawerDailyHoroscope => 'Dagligt horoskop';

  @override
  String get drawerBuyQuestions => 'Køb spørgsmål';

  @override
  String get drawerAstroDictionary => 'Astro-ordbog';

  @override
  String get drawerSettings => 'Indstillinger';

  @override
  String get drawerCustomerSupport => 'Kundesupport';

  @override
  String get drawerAbout => 'Om';

  @override
  String get drawerProfileSettings => 'Profilindstillinger';

  @override
  String get demoNotificationTitle => '🔔 Demo-notifikation';

  @override
  String get demoNotificationBody =>
      'Dette er en testnotifikation fra din app!';

  @override
  String get notificationsTitle => 'Notifikationer';

  @override
  String get noNotifications => 'Ingen notifikationer';

  @override
  String get allTab => 'Alle';

  @override
  String get markAllAsRead => 'Markér alle som læst';

  @override
  String get notificationMarkedRead => 'Notifikation markeret som læst';

  @override
  String get failedToLoadNotifications => 'Kunne ikke indlæse notifikationer';

  @override
  String get failedToMarkRead => 'Kunne ikke markere som læst';

  @override
  String get failedToMarkAllRead => 'Kunne ikke markere alt som læst';

  @override
  String get socketConnected => 'Stikkontakt tilsluttet';

  @override
  String get socketDisconnected => 'Stikkontakten er frakoblet';

  @override
  String get newNotificationReceived => 'Ny meddelelse modtaget';

  @override
  String get generalCategory => 'Generel';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Snak';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Opdateringer';

  @override
  String get howToAskTitle => 'Sådan spørger du';

  @override
  String get noQuestionsAvailable => 'Ingen spørgsmål tilgængelige';

  @override
  String get failedToLoadQuestions => 'Spørgsmålene kunne ikke indlæses';

  @override
  String get pullToRefresh => 'Træk for at opdatere';

  @override
  String get careerCategory => 'Karriere';

  @override
  String get loveCategory => 'Kærlighed og forhold';

  @override
  String get healthCategory => 'Sundhed';

  @override
  String get financeCategory => 'Finansiere';

  @override
  String get familyCategory => 'Familie';

  @override
  String get educationCategory => 'Undervisning';

  @override
  String get travelCategory => 'Rejse';

  @override
  String get spiritualCategory => 'Åndelig';

  @override
  String get profileLoaded => 'Profilen er indlæst';

  @override
  String get imageUploaded => 'Billedet er blevet uploadet';

  @override
  String get savedInformationConfirmation => 'Jeg har gemt disse oplysninger';

  @override
  String get noHistoryAvailable => 'Ingen historik tilgængelig';

  @override
  String get missingUserIdError => 'Bruger-ID er påkrævet';

  @override
  String get networkError => 'Netværksfejl. Prøv igen.';

  @override
  String get timeoutError => 'Anmodningen udløb';

  @override
  String get genericError => 'Noget gik galt';

  @override
  String get reactionUpdateError => 'Reaktionen kunne ikke opdateres';

  @override
  String get noSearchResults => 'Ingen søgeresultater fundet';

  @override
  String get clearSearch => 'Ryd søgning';

  @override
  String get resultsFound => 'Resultater fundet';

  @override
  String get recoverySecretHint =>
      'Kopiér/indsæt virker muligvis ikke, skriv manuelt';

  @override
  String get recoverAccountDescription =>
      'Følg disse trin for at gendanne din konto';

  @override
  String get processingLabel => 'Forarbejdning...';

  @override
  String get clearChatSuccess => 'Chatten er blevet ryddet';

  @override
  String get notificationsEnabled => 'Notifikationer aktiveret';

  @override
  String get notificationsDisabled => 'Notifikationer deaktiveret';

  @override
  String get securityNotice => 'Dine data er sikkert krypteret og gemt';

  @override
  String get loading => 'Indlæser...';

  @override
  String get selectLanguage => 'Vælg sprog';

  @override
  String get onboardingGetStartedDesc => 'Kom i gang ved at vælge dit sprog';

  @override
  String get accountRecoveryTitle => '🔐 Oplysninger om kontogendannelse';

  @override
  String get recoveryInstructions =>
      'Gem venligst disse oplysninger sikkert. Du skal bruge dem for at gendanne din konto.';

  @override
  String get importantNotice => '⚠️ Vigtigt:';

  @override
  String get astrologerProfileTitle => 'Astrologprofil';

  @override
  String get personalAstrologer => 'Personlig astrolog';

  @override
  String get makePersonalAstrologer => 'Bliv personlig astrolog';

  @override
  String get favoriteDescription =>
      'Dine spørgsmål vil blive prioriteret til denne astrolog. Hvis denne ikke er tilgængelig, vil en anden kvalificeret astrolog hjælpe dig.';

  @override
  String get educationQualifications => 'Uddannelse og kvalifikationer';

  @override
  String get aboutSection => 'Om';

  @override
  String get shareProfile => 'Del profil';

  @override
  String get loadingAstrologer => 'Indlæser astrologoplysninger...';

  @override
  String get failedToLoadAstrologer => 'Kunne ikke indlæse astrologoplysninger';

  @override
  String get authenticationRequired => 'Godkendelse kræves. Log venligst ind.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sikkerhedstjek mislykkedes: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name er nu din personlige astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Fjernet $name fra favoritter';
  }

  @override
  String get toggleFavoriteError => 'Kunne ikke opdatere favoritstatus';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Uddannelse: $education\n📜 Kvalifikation: $qualification\n⏳ Erfaring: $experience';
  }

  @override
  String get notProvided => 'Ikke angivet';

  @override
  String reviews(Object count) {
    return '($count anmeldelser)';
  }

  @override
  String get specialties => 'Specialiteter';

  @override
  String get experience => 'Erfaring';

  @override
  String get qualification => 'Kvalifikation';

  @override
  String get education => 'Undervisning';

  @override
  String get recoveryTips =>
      '• Tag et skærmbillede af disse oplysninger\n• Gem dem et sikkert sted\n• Del dem ikke med nogen\n• Dette vises kun én gang';
}
