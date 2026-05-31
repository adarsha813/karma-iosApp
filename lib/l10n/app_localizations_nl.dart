// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get notificationSettings => 'Meldingsinstellingen';

  @override
  String get privacySettings => 'Privacy-instellingen';

  @override
  String get accountSettings => 'Accountinstellingen';

  @override
  String get languageSettings => 'Taalinstellingen';

  @override
  String get languageChanged => 'Taal gewijzigd';

  @override
  String get existingUserButton => 'Ik ben een bestaande gebruiker';

  @override
  String get chooseCountryTitle => 'Kies land';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Nee';

  @override
  String get appBarTitle => 'Profielinstellingen';

  @override
  String get userIdLabel => 'Gebruikers-ID *';

  @override
  String get nameLabel => 'Naam';

  @override
  String get birthCountryLabel => 'Geboorteland';

  @override
  String get birthCityLabel => 'Geboortestad';

  @override
  String get countrySelectionTitle => 'Kies uw land';

  @override
  String get maleLabel => 'Mannelijk';

  @override
  String get femaleLabel => 'Vrouwelijk';

  @override
  String get birthDateLabel => 'Geboortedatum';

  @override
  String get birthDatePlaceholder => 'Selecteer geboortedatum';

  @override
  String get birthTimeLabel => 'Geboortetijd';

  @override
  String get birthTimePlaceholder => 'Selecteer geboortetijd';

  @override
  String get saveProfileButton => 'Profiel opslaan';

  @override
  String get noCitiesFound => 'Geen steden gevonden';

  @override
  String cityPlaceholder(Object country) {
    return 'Voer een stad in $country in';
  }

  @override
  String get countryFirstPlaceholder => 'Selecteer eerst een land';

  @override
  String get versionHistoryTitle => 'Versiegeschiedenis';

  @override
  String get notSetText => 'Niet ingesteld';

  @override
  String nameHistory(Object name) {
    return 'Naam: $name';
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
    return 'Geslacht: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Geboortedatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Geboortetijd: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Locatie: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Tijdzone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Zomertijd: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Status: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Bijgewerkt op $date';
  }

  @override
  String get userIdRequired => 'Gebruikers-ID is vereist';

  @override
  String get profileSaved => 'Profiel succesvol opgeslagen';

  @override
  String get saveFailed => 'Profiel opslaan mislukt';

  @override
  String get errorPrefix => 'Fout:';

  @override
  String get onboardingChooseLanguage => 'Kies uw taal';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selecteer uw voorkeurstaal om verder te gaan.';

  @override
  String get onboardingWhatIsAstrology => 'Wat is astrologie?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologie is de eeuwenoude studie van de hemelbewegingen en hun invloed op het menselijk leven. Het biedt inzicht in persoonlijkheid, relaties en levensgebeurtenissen.';

  @override
  String get onboardingWhyUseApp => 'Waarom deze app gebruiken?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ontvang nauwkeurige, door mensen gegenereerde horoscopen en begeleiding afgestemd op je geboortehoroscoop. Neem weloverwogen beslissingen met dagelijkse voorspellingen en persoonlijk advies van ervaren astrologen.';

  @override
  String get onboardingHowToUse => 'Hoe gebruik je deze app?';

  @override
  String get onboardingHowToUseDesc =>
      'Voer eenvoudig je geboortedatum, exacte tijd, geboorteplaats en andere relevante gegevens in om direct aan de slag te gaan. Bekijk dagelijkse horoscopen, stel vragen aan deskundige astrologen en beheer je profiel voor nauwkeurige, persoonlijke voorspellingen – inloggen is niet nodig.';

  @override
  String get onboardingGetStarted => 'Aan de slag';

  @override
  String get onboardingNewUser => 'Nieuwe gebruiker';

  @override
  String get onboardingExistingUser => 'Bestaande gebruiker';

  @override
  String get onboardingBack => 'Rug';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get userIdNotFound =>
      'Gebruikers-ID niet gevonden. Log in of stel uw profiel in.';

  @override
  String get clearNotificationsTitle => 'Meldingen wissen';

  @override
  String get clearNotificationsMessage =>
      'Weet u zeker dat u alle meldingen wilt wissen?';

  @override
  String get clearNotificationsSuccess =>
      'Alle meldingen zijn succesvol verwijderd.';

  @override
  String get clearHoroscopeTitle => 'Heldere horoscoop';

  @override
  String get clearHoroscopeMessage =>
      'Weet u zeker dat u uw horoscoopgegevens wilt wissen?';

  @override
  String get clearHoroscopeSuccess => 'Horoscoop succesvol gewist.';

  @override
  String get clearChatTitle => 'Chatgeschiedenis wissen';

  @override
  String get clearChatMessage =>
      'Weet u zeker dat u uw volledige chatgeschiedenis wilt verwijderen?';

  @override
  String get clearChatLocal => 'Chat lokaal gewist.';

  @override
  String get deleteAccountTitle => 'Account verwijderen';

  @override
  String get deleteAccountMessage =>
      'Weet je zeker dat je je account wilt verwijderen? Hiermee worden ook al je chatgeschiedenis en meldingen gewist.';

  @override
  String get deleteAccountSuccess =>
      'Uw account en alle gegevens zijn verwijderd.';

  @override
  String get deleteAccountError => 'Fout bij het verwijderen van account';

  @override
  String get logoutTitle => 'Uitloggen';

  @override
  String get logoutMessage => 'Weet u zeker dat u wilt uitloggen?';

  @override
  String get termsPrivacyTitle => 'Voorwaarden en privacy';

  @override
  String get privacyPolicyTitle => 'Privacybeleid';

  @override
  String get termsConditionsTitle => 'Algemene voorwaarden';

  @override
  String get dataControlTitle => 'Gegevensbeheer';

  @override
  String get cancelButton => 'Annuleren';

  @override
  String get confirmButton => 'Bevestigen';

  @override
  String get clearQuestionsSuccess => 'Alle vragen zijn succesvol verwijderd.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Heer';

  @override
  String get startLabel => 'Begin';

  @override
  String get recoverAccount => 'Account herstellen';

  @override
  String get endLabel => 'Einde';

  @override
  String get startDateLabel => 'Startdatum';

  @override
  String get endDateLabel => 'Einddatum';

  @override
  String get notAvailable => 'Niet beschikbaar';

  @override
  String get noData => 'Geen gegevens';

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get retryButton => 'Opnieuw proberen';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generator';

  @override
  String get natalChartTitle => 'Geboortehoroscoop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rasji';

  @override
  String get ascDegreeLabel => 'Opgaande graad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Onbekend';

  @override
  String get clearHoroscope => 'Heldere horoscoop';

  @override
  String get clearNotifications => 'Meldingen wissen';

  @override
  String get clearChatHistory => 'Chatgeschiedenis wissen';

  @override
  String get logout => 'Uitloggen';

  @override
  String get deleteAccount => 'Account verwijderen';

  @override
  String get allFieldsRequired => 'Alle velden zijn verplicht.';

  @override
  String get accountRecoveredSuccess => 'Account succesvol hersteld.';

  @override
  String get recoveryFailed => 'Herstel mislukt. Controleer uw gegevens.';

  @override
  String get recoverySecretLabel => 'Herstelgeheim:';

  @override
  String get aboutUsTitle => 'Over ons';

  @override
  String get aboutOurCompany => 'Over ons bedrijf';

  @override
  String get aboutCompanyDescription =>
      'Bij Karma helpen we je je ware levenspad te ontdekken door de tijdloze wijsheid van de Vedische astrologie. Elk inzicht komt van echte, ervaren astrologen, zorgvuldig samengesteld op basis van jouw unieke geboortehoroscoop. Van dagelijkse horoscopen tot persoonlijke begeleiding, Karma maakt eeuwenoude kennis toegankelijk in meer dan 100 talen.';

  @override
  String get ourMission => 'Onze missie';

  @override
  String get missionDescription =>
      'Onze missie is simpel: authentieke, door mensen geleide astrologische begeleiding bieden die u in staat stelt om zelfverzekerde, weloverwogen beslissingen te nemen. Elke voorspelling en elk consult weerspiegelt jarenlange professionele expertise, niet geautomatiseerde algoritmes.';

  @override
  String get ourVision => 'Onze visie';

  @override
  String get visionDescription =>
      'Wij streven ernaar om het meest betrouwbare platform ter wereld te zijn voor Vedische astrologie, en mensen overal ter wereld te helpen zichzelf, hun keuzes en hun levensreis met helderheid en vertrouwen te begrijpen.';

  @override
  String get ourValues => 'Onze waarden';

  @override
  String get valuesDescription =>
      'Bij Karma hechten we waarde aan authenticiteit, precisie en vertrouwen. We streven ernaar om begeleiding te bieden die niet alleen accuraat, maar ook betekenisvol is, zodat u met inzicht en vertrouwen door het leven kunt navigeren.';

  @override
  String get contactUs => 'Neem contact met ons op';

  @override
  String get contactEmail => 'E-mailadres: support@uwbedrijf.com';

  @override
  String get contactWebsite => 'Website: www.uwbedrijf.com';

  @override
  String get customerSupport => 'Klantenservice';

  @override
  String get supportHeroTitle => 'Wij zijn er om te helpen';

  @override
  String get supportHeroDescription =>
      'Vul onderstaand formulier in, dan neemt ons supportteam zo snel mogelijk contact met u op.';

  @override
  String get yourName => 'Jouw naam';

  @override
  String get yourEmail => 'Uw e-mailadres';

  @override
  String get message => 'Bericht';

  @override
  String get enterEmail => 'Voer uw e-mailadres in';

  @override
  String get enterValidEmail => 'Voer een geldig e-mailadres in';

  @override
  String enterField(Object fieldName) {
    return 'Voer $fieldName in';
  }

  @override
  String get send => 'Versturen';

  @override
  String get sending => 'Verzenden...';

  @override
  String get emailSentSuccess => '✅ E-mail succesvol verzonden!';

  @override
  String get emailSendFailed => '❌ E-mail verzenden mislukt';

  @override
  String get astroDictionaryTitle => 'Astro Woordenboek';

  @override
  String get searchTermsHint => 'Zoektermen...';

  @override
  String get noTermsFound => 'Geen termen gevonden';

  @override
  String get buyQuestionsTitle => 'Koopvragen';

  @override
  String get userNotAuthenticated => 'Gebruiker niet geauthenticeerd';

  @override
  String get loadStoreDataFailed => 'Het laden van winkelgegevens is mislukt';

  @override
  String get missingAuthToken => 'Ontbrekend autorisatietoken';

  @override
  String get merchantDisplayName => 'Astro Chat-app';

  @override
  String get paymentSuccessful => '✅ Betaling succesvol! Vraag verzonden';

  @override
  String paymentFailed(Object error) {
    return '❌ Betaling mislukt: $error';
  }

  @override
  String get yourBalance => 'Uw saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Vragen';
  }

  @override
  String get availableOffers => 'Beschikbare aanbiedingen';

  @override
  String questionsCount(Object count) {
    return '$count Vraag';
  }

  @override
  String get buyButton => 'Kopen';

  @override
  String get dailyHoroscopeTitle => ' Dagelijkse horoscoop';

  @override
  String get userIdMissing => 'Gebruikers-ID ontbreekt';

  @override
  String get fetchHoroscopesFailed => 'Het ophalen van horoscopen is mislukt';

  @override
  String get noHoroscopeFound => 'Geen horoscoop gevonden.';

  @override
  String get signLabel => 'Teken';

  @override
  String get todayLabel => 'Vandaag';

  @override
  String get yesterdayLabel => 'Gisteren';

  @override
  String get thisWeekLabel => 'Deze week';

  @override
  String get lastMonthLabel => 'Vorige maand';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Typ uw vraag...';

  @override
  String get paymentRequired => 'Betaling vereist';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Je hebt je gratis vragen gebruikt. Betaal $amount om verder te gaan.';
  }

  @override
  String get payNowButton => 'Nu betalen';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count resterende vrije vragen';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betaalde vragen resterend';
  }

  @override
  String get thankYouFeedback => 'Bedankt voor uw feedback!';

  @override
  String get ratingSubmitted => 'Beoordeling ingediend!';

  @override
  String get setUserIdFirst => 'Stel eerst uw gebruikers-ID in';

  @override
  String get failedToFetchPrevious =>
      'Het is niet gelukt om eerdere vragen en antwoorden op te halen';

  @override
  String errorOccurred(Object error) {
    return 'Fout: $error';
  }

  @override
  String get drawerAstroProfile => 'Astroprofiel';

  @override
  String get drawerDailyHoroscope => 'Dagelijkse horoscoop';

  @override
  String get drawerBuyQuestions => 'Koopvragen';

  @override
  String get drawerAstroDictionary => 'Astro Woordenboek';

  @override
  String get drawerSettings => 'Instellingen';

  @override
  String get drawerCustomerSupport => 'Klantenservice';

  @override
  String get drawerAbout => 'Over';

  @override
  String get drawerProfileSettings => 'Profielinstellingen';

  @override
  String get demoNotificationTitle => '🔔 Demo-melding';

  @override
  String get demoNotificationBody => 'Dit is een testmelding van uw app!';

  @override
  String get notificationsTitle => 'Meldingen';

  @override
  String get noNotifications => 'Geen meldingen';

  @override
  String get allTab => 'Alle';

  @override
  String get markAllAsRead => 'Markeer alles als gelezen';

  @override
  String get notificationMarkedRead => 'Melding gemarkeerd als gelezen';

  @override
  String get failedToLoadNotifications => 'Het laden van meldingen is mislukt';

  @override
  String get failedToMarkRead =>
      'Het is niet gelukt om het bericht als gelezen te markeren';

  @override
  String get failedToMarkAllRead =>
      'Het is niet gelukt om alles als gelezen te markeren';

  @override
  String get socketConnected => 'Stopcontact aangesloten';

  @override
  String get socketDisconnected => 'Stopcontact losgekoppeld';

  @override
  String get newNotificationReceived => 'Nieuwe melding ontvangen';

  @override
  String get generalCategory => 'Algemeen';

  @override
  String get horoscopeCategory => 'Horoscoop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Systeem';

  @override
  String get updateCategory => 'Updates';

  @override
  String get howToAskTitle => 'Hoe te vragen';

  @override
  String get noQuestionsAvailable => 'Geen vragen beschikbaar';

  @override
  String get failedToLoadQuestions => 'Vragen laden mislukt';

  @override
  String get pullToRefresh => 'Trekken om te vernieuwen';

  @override
  String get careerCategory => 'Carrière';

  @override
  String get loveCategory => 'Liefde en relaties';

  @override
  String get healthCategory => 'Gezondheid';

  @override
  String get financeCategory => 'Financiën';

  @override
  String get familyCategory => 'Familie';

  @override
  String get educationCategory => 'Onderwijs';

  @override
  String get travelCategory => 'Reis';

  @override
  String get spiritualCategory => 'Spiritueel';

  @override
  String get profileLoaded => 'Profiel succesvol geladen';

  @override
  String get imageUploaded => 'Afbeelding succesvol geüpload';

  @override
  String get savedInformationConfirmation =>
      'Ik heb deze informatie opgeslagen';

  @override
  String get noHistoryAvailable => 'Geen geschiedenis beschikbaar';

  @override
  String get missingUserIdError => 'Gebruikers-ID is vereist';

  @override
  String get networkError => 'Netwerkfout. Probeer het opnieuw.';

  @override
  String get timeoutError => 'Verzoek is verlopen';

  @override
  String get genericError => 'Er is iets misgegaan';

  @override
  String get reactionUpdateError => 'Reactie kon niet worden bijgewerkt';

  @override
  String get noSearchResults => 'Geen zoekresultaten gevonden';

  @override
  String get clearSearch => 'Zoekopdracht wissen';

  @override
  String get resultsFound => 'Resultaten gevonden';

  @override
  String get recoverySecretHint =>
      'Kopiëren en plakken werkt mogelijk niet, typ handmatig';

  @override
  String get recoverAccountDescription =>
      'Volg deze stappen om uw account te herstellen';

  @override
  String get processingLabel => 'Verwerken...';

  @override
  String get clearChatSuccess => 'Chat succesvol gewist';

  @override
  String get notificationsEnabled => 'Meldingen ingeschakeld';

  @override
  String get notificationsDisabled => 'Meldingen uitgeschakeld';

  @override
  String get securityNotice =>
      'Uw gegevens worden veilig versleuteld en opgeslagen';

  @override
  String get loading => 'Bezig met laden...';

  @override
  String get selectLanguage => 'Selecteer taal';

  @override
  String get onboardingGetStartedDesc => 'Begin met het kiezen van uw taal';

  @override
  String get accountRecoveryTitle => '🔐 Details over accountherstel';

  @override
  String get recoveryInstructions =>
      'Bewaar deze informatie veilig. U heeft deze nodig om uw account te herstellen.';

  @override
  String get importantNotice => '⚠️ Belangrijk:';

  @override
  String get astrologerProfileTitle => 'Astroloog Profiel';

  @override
  String get personalAstrologer => 'Persoonlijke Astroloog';

  @override
  String get makePersonalAstrologer => 'Maak een persoonlijke astroloog';

  @override
  String get favoriteDescription =>
      'Uw vragen worden met voorrang aan deze astroloog voorgelegd. Indien deze niet beschikbaar is, zal een andere gekwalificeerde astroloog u helpen.';

  @override
  String get educationQualifications => 'Onderwijs en kwalificaties';

  @override
  String get aboutSection => 'Over';

  @override
  String get shareProfile => 'Profiel delen';

  @override
  String get loadingAstrologer => 'Gegevens van astroloog worden geladen...';

  @override
  String get failedToLoadAstrologer =>
      'Het laden van de astrolooggegevens is mislukt';

  @override
  String get authenticationRequired => 'Authenticatie vereist. Log in.';

  @override
  String securityCheckFailed(Object error) {
    return 'Beveiligingscontrole mislukt: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is nu uw persoonlijke astroloog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name verwijderd uit favorieten';
  }

  @override
  String get toggleFavoriteError =>
      'Het is niet gelukt om de favorietenstatus bij te werken';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Opleiding: $education\n📜 Kwalificatie: $qualification\n⏳ Ervaring: $experience';
  }

  @override
  String get notProvided => 'Niet verstrekt';

  @override
  String reviews(Object count) {
    return '($count beoordelingen)';
  }

  @override
  String get specialties => 'Specialiteiten';

  @override
  String get experience => 'Ervaring';

  @override
  String get qualification => 'Kwalificatie';

  @override
  String get education => 'Onderwijs';

  @override
  String get recoveryTips =>
      '• Maak een screenshot van deze informatie\n• Bewaar deze op een veilige plek\n• Deel deze niet met anderen\n• Deze informatie wordt slechts één keer weergegeven';

  @override
  String get themeSettingsTitle => 'Thema-instellingen';

  @override
  String get lightThemeLabel => 'Licht';

  @override
  String get lightThemeDescription => 'Gebruik altijd het lichte thema.';

  @override
  String get darkThemeLabel => 'Donker';

  @override
  String get darkThemeDescription => 'Gebruik altijd het donkere thema.';

  @override
  String get systemThemeLabel => 'Systeem';

  @override
  String get systemThemeDarkDescription =>
      'Volg de systeeminstellingen voor het donkere thema.';

  @override
  String get systemThemeLightDescription =>
      'Volg de systeeminstellingen voor het lichte thema.';

  @override
  String get switchToLight => 'Schakel over naar Licht';

  @override
  String get switchToDark => 'Schakel over naar Donker';

  @override
  String get ourTeam => 'Ons team';

  @override
  String get teamDescription =>
      'Ons team van professionele Vedische astrologen heeft jarenlange ervaring met het interpreteren van planetaire invloeden en levenspatronen. Ondersteund door een toegewijd support- en ontwikkelteam biedt Karma een naadloze, betrouwbare en wereldwijde ervaring voor elke gebruiker.';
}
