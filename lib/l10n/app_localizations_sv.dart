// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get notificationSettings => 'Aviseringsinställningar';

  @override
  String get privacySettings => 'Sekretessinställningar';

  @override
  String get accountSettings => 'Kontoinställningar';

  @override
  String get languageSettings => 'Språkinställningar';

  @override
  String get languageChanged => 'Språket har ändrats';

  @override
  String get existingUserButton => 'Jag är en befintlig användare';

  @override
  String get chooseCountryTitle => 'Välj land';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Inga';

  @override
  String get appBarTitle => 'Profilinställningar';

  @override
  String get userIdLabel => 'Användar-ID *';

  @override
  String get nameLabel => 'Namn';

  @override
  String get birthCountryLabel => 'Födelseland';

  @override
  String get birthCityLabel => 'Födelsestad';

  @override
  String get countrySelectionTitle => 'Välj ditt land';

  @override
  String get maleLabel => 'Manlig';

  @override
  String get femaleLabel => 'Kvinnlig';

  @override
  String get birthDateLabel => 'Födelsedatum';

  @override
  String get birthDatePlaceholder => 'Välj födelsedatum';

  @override
  String get birthTimeLabel => 'Födelsetid';

  @override
  String get birthTimePlaceholder => 'Välj födelsetid';

  @override
  String get saveProfileButton => 'Spara profil';

  @override
  String get noCitiesFound => 'Inga städer hittades';

  @override
  String cityPlaceholder(Object country) {
    return 'Ange stad i $country';
  }

  @override
  String get countryFirstPlaceholder => 'Välj land först';

  @override
  String get versionHistoryTitle => 'Versionshistorik';

  @override
  String get notSetText => 'Inte inställd';

  @override
  String nameHistory(Object name) {
    return 'Namn: $name';
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
    return 'Kön: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Födelsedatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Födelsetid: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Plats: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Sommartid: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Tillstånd: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Uppdaterad $date';
  }

  @override
  String get userIdRequired => 'Användar-ID krävs';

  @override
  String get profileSaved => 'Profilen har sparats';

  @override
  String get saveFailed => 'Kunde inte spara profilen';

  @override
  String get errorPrefix => 'Fel:';

  @override
  String get onboardingChooseLanguage => 'Välj ditt språk';

  @override
  String get onboardingChooseLanguageDesc =>
      'Välj ditt önskade språk för att fortsätta.';

  @override
  String get onboardingWhatIsAstrology => 'Vad är astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi är läran om himlakroppar...';

  @override
  String get onboardingWhyUseApp => 'Varför använda den här appen?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Få personliga horoskop, dagliga förutsägelser och vägledning för att fatta välgrundade beslut.';

  @override
  String get onboardingHowToUse => 'Hur använder man den här appen?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigera enkelt, kolla dagliga horoskop och hantera din profil för korrekta förutsägelser.';

  @override
  String get onboardingGetStarted => 'Kom igång';

  @override
  String get onboardingNewUser => 'Ny användare';

  @override
  String get onboardingExistingUser => 'Befintlig användare';

  @override
  String get onboardingBack => 'Tillbaka';

  @override
  String get onboardingNext => 'Nästa';

  @override
  String get userIdNotFound =>
      'Användar-ID hittades inte. Vänligen logga in eller skapa din profil.';

  @override
  String get clearNotificationsTitle => 'Rensa aviseringar';

  @override
  String get clearNotificationsMessage =>
      'Är du säker på att du vill rensa alla aviseringar?';

  @override
  String get clearNotificationsSuccess => 'Alla aviseringar har raderats.';

  @override
  String get clearHoroscopeTitle => 'Tydligt horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Är du säker på att du vill rensa dina horoskopdata?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopet har rensats.';

  @override
  String get clearChatTitle => 'Rensa chatthistorik';

  @override
  String get clearChatMessage =>
      'Är du säker på att du vill radera all din chatthistorik?';

  @override
  String get clearChatLocal => 'Chatten har rensats lokalt.';

  @override
  String get deleteAccountTitle => 'Ta bort konto';

  @override
  String get deleteAccountMessage =>
      'Är du säker på att du vill radera ditt konto? Detta kommer även att rensa all din chatthistorik och alla aviseringar.';

  @override
  String get deleteAccountSuccess => 'Ditt konto och all data har tagits bort.';

  @override
  String get deleteAccountError => 'Fel vid borttagning av konto';

  @override
  String get logoutTitle => 'Utloggning';

  @override
  String get logoutMessage => 'Är du säker på att du vill logga ut?';

  @override
  String get termsPrivacyTitle => 'Villkor och sekretess';

  @override
  String get privacyPolicyTitle => 'Integritetspolicy';

  @override
  String get termsConditionsTitle => 'Villkor';

  @override
  String get dataControlTitle => 'Datakontroll';

  @override
  String get cancelButton => 'Avboka';

  @override
  String get confirmButton => 'Bekräfta';

  @override
  String get clearQuestionsSuccess => 'Alla frågor har raderats.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Återställ konto';

  @override
  String get endLabel => 'Avsluta';

  @override
  String get startDateLabel => 'Startdatum';

  @override
  String get endDateLabel => 'Slutdatum';

  @override
  String get notAvailable => 'Inte tillgänglig';

  @override
  String get noData => 'Inga uppgifter';

  @override
  String get unknownError => 'Okänt fel';

  @override
  String get retryButton => 'Försöka igen';

  @override
  String get kundaliGeneratorTitle => 'Kundali-generator';

  @override
  String get natalChartTitle => 'Födelsehoroskop';

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
  String get unknown => 'Okänd';

  @override
  String get clearHoroscope => 'Tydligt horoskop';

  @override
  String get clearNotifications => 'Rensa aviseringar';

  @override
  String get clearChatHistory => 'Rensa chatthistorik';

  @override
  String get logout => 'Utloggning';

  @override
  String get deleteAccount => 'Ta bort konto';

  @override
  String get allFieldsRequired => 'Alla fält är obligatoriska.';

  @override
  String get accountRecoveredSuccess => 'Kontot har återställts.';

  @override
  String get recoveryFailed =>
      'Återställningen misslyckades. Kontrollera din information.';

  @override
  String get recoverySecretLabel => 'Återhämtningshemligheten:';

  @override
  String get aboutUsTitle => 'Om oss';

  @override
  String get aboutOurCompany => 'Om vårt företag';

  @override
  String get aboutCompanyDescription =>
      'Vi strävar efter att leverera den bästa astrologiupplevelsen till våra användare.';

  @override
  String get ourMission => 'Vårt uppdrag';

  @override
  String get missionDescription =>
      'Att ge korrekta och personliga astrologiska insikter för att hjälpa användare att fatta välgrundade beslut i sina liv.';

  @override
  String get ourVision => 'Vår vision';

  @override
  String get visionDescription =>
      'Att bli den mest betrodda astrologiplattformen, som kombinerar teknologi och uråldrig visdom.';

  @override
  String get ourValues => 'Våra värderingar';

  @override
  String get valuesDescription =>
      'Integritet, noggrannhet, användarcentrerad design och kontinuerlig innovation.';

  @override
  String get contactUs => 'Kontakta oss';

  @override
  String get contactEmail => 'E-post: support@dittföretag.com';

  @override
  String get contactWebsite => 'Webbplats: www.dittföretag.com';

  @override
  String get customerSupport => 'Kundsupport';

  @override
  String get supportHeroTitle => 'Vi finns här för att hjälpa till';

  @override
  String get supportHeroDescription =>
      'Fyll i formuläret nedan så återkommer vårt supportteam till dig så snart som möjligt.';

  @override
  String get yourName => 'Ditt namn';

  @override
  String get yourEmail => 'Din e-postadress';

  @override
  String get message => 'Meddelande';

  @override
  String get enterEmail => 'Ange din e-postadress';

  @override
  String get enterValidEmail => 'Ange en giltig e-postadress';

  @override
  String enterField(Object fieldName) {
    return 'Ange $fieldName';
  }

  @override
  String get send => 'Skicka';

  @override
  String get sending => 'Sändning...';

  @override
  String get emailSentSuccess => '✅ E-postmeddelandet har skickats!';

  @override
  String get emailSendFailed => '❌ Misslyckades med att skicka e-post';

  @override
  String get astroDictionaryTitle => 'Astro-ordbok';

  @override
  String get searchTermsHint => 'Söktermer...';

  @override
  String get noTermsFound => 'Inga termer hittades';

  @override
  String get buyQuestionsTitle => 'Köpfrågor';

  @override
  String get userNotAuthenticated => 'Användaren är inte autentiserad';

  @override
  String get loadStoreDataFailed => 'Misslyckades med att ladda butiksdata';

  @override
  String get missingAuthToken => 'Saknad autentiseringstoken';

  @override
  String get merchantDisplayName => 'Astro Chat-appen';

  @override
  String get paymentSuccessful => '✅ Betalning lyckad! Fråga skickad';

  @override
  String paymentFailed(Object error) {
    return '❌ Betalningen misslyckades: $error';
  }

  @override
  String get yourBalance => 'Ditt saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Frågor';
  }

  @override
  String get availableOffers => 'Tillgängliga erbjudanden';

  @override
  String questionsCount(Object count) {
    return '$count Fråga';
  }

  @override
  String get buyButton => 'Köpa';

  @override
  String get dailyHoroscopeTitle => '🌟 Dagligt horoskop';

  @override
  String get userIdMissing => 'Användar-ID saknas';

  @override
  String get fetchHoroscopesFailed => 'Misslyckades med att hämta horoskop';

  @override
  String get noHoroscopeFound => 'Inget horoskop hittades.';

  @override
  String get signLabel => 'Tecken';

  @override
  String get todayLabel => 'I dag';

  @override
  String get yesterdayLabel => 'I går';

  @override
  String get thisWeekLabel => 'Denna vecka';

  @override
  String get lastMonthLabel => 'Förra månaden';

  @override
  String get chatTitle => 'Chatt';

  @override
  String get typeYourQuestionHint => 'Skriv din fråga...';

  @override
  String get paymentRequired => 'Betalning krävs';

  @override
  String get paymentRequiredMessage =>
      'Du har använt dina gratisfrågor. Betala ₹50 för att fortsätta.';

  @override
  String get payNowButton => 'Betala nu';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count lediga frågor kvar';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betalda frågor kvar';
  }

  @override
  String get thankYouFeedback => 'Tack för din feedback!';

  @override
  String get ratingSubmitted => 'Betyg skickat!';

  @override
  String get setUserIdFirst => 'Vänligen ange ditt användar-ID först';

  @override
  String get failedToFetchPrevious =>
      'Misslyckades med att hämta tidigare frågor och svar';

  @override
  String errorOccurred(Object error) {
    return 'Fel: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro-profil';

  @override
  String get drawerDailyHoroscope => 'Dagligt horoskop';

  @override
  String get drawerBuyQuestions => 'Köpfrågor';

  @override
  String get drawerAstroDictionary => 'Astro-ordbok';

  @override
  String get drawerSettings => 'Inställningar';

  @override
  String get drawerCustomerSupport => 'Kundsupport';

  @override
  String get drawerAbout => 'Om';

  @override
  String get drawerProfileSettings => 'Profilinställningar';

  @override
  String get demoNotificationTitle => '🔔 Demomeddelande';

  @override
  String get demoNotificationBody => 'Detta är en testavisering från din app!';

  @override
  String get notificationsTitle => 'Aviseringar';

  @override
  String get noNotifications => 'Inga aviseringar';

  @override
  String get allTab => 'Alla';

  @override
  String get markAllAsRead => 'Markera alla som lästa';

  @override
  String get notificationMarkedRead => 'Avisering markerad som läst';

  @override
  String get failedToLoadNotifications =>
      'Det gick inte att läsa in aviseringar';

  @override
  String get failedToMarkRead => 'Kunde inte markera som läst';

  @override
  String get failedToMarkAllRead =>
      'Misslyckades med att markera alla som lästa';

  @override
  String get socketConnected => 'Uttag anslutet';

  @override
  String get socketDisconnected => 'Uttaget frånkopplat';

  @override
  String get newNotificationReceived => 'Ny anmälan mottagen';

  @override
  String get generalCategory => 'Allmän';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Chatt';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Uppdateringar';

  @override
  String get howToAskTitle => 'Hur man frågar';

  @override
  String get noQuestionsAvailable => 'Inga frågor tillgängliga';

  @override
  String get failedToLoadQuestions => 'Misslyckades med att ladda frågorna';

  @override
  String get pullToRefresh => 'Dra för att uppdatera';

  @override
  String get careerCategory => 'Karriär';

  @override
  String get loveCategory => 'Kärlek och relationer';

  @override
  String get healthCategory => 'Hälsa';

  @override
  String get financeCategory => 'Finansiera';

  @override
  String get familyCategory => 'Familj';

  @override
  String get educationCategory => 'Utbildning';

  @override
  String get travelCategory => 'Resa';

  @override
  String get spiritualCategory => 'Andlig';

  @override
  String get profileLoaded => 'Profilen har laddats';

  @override
  String get imageUploaded => 'Bilden har laddats upp';

  @override
  String get savedInformationConfirmation =>
      'Jag har sparat den här informationen';

  @override
  String get noHistoryAvailable => 'Ingen historik tillgänglig';

  @override
  String get missingUserIdError => 'Användar-ID krävs';

  @override
  String get networkError => 'Nätverksfel. Försök igen.';

  @override
  String get timeoutError => 'Begäran har nått tidsgränsen';

  @override
  String get genericError => 'Något gick fel';

  @override
  String get reactionUpdateError => 'Misslyckades med att uppdatera reaktionen';

  @override
  String get noSearchResults => 'Inga sökresultat hittades';

  @override
  String get clearSearch => 'Rensa sökningen';

  @override
  String get resultsFound => 'Resultat funna';

  @override
  String get recoverySecretHint =>
      'Kopiera och klistra kanske inte fungerar, skriv manuellt';

  @override
  String get recoverAccountDescription =>
      'Följ dessa steg för att återställa ditt konto';

  @override
  String get processingLabel => 'Bearbetar...';

  @override
  String get clearChatSuccess => 'Chatten har rensats';

  @override
  String get notificationsEnabled => 'Aviseringar aktiverade';

  @override
  String get notificationsDisabled => 'Aviseringar inaktiverade';

  @override
  String get securityNotice => 'Dina data är säkert krypterade och lagrade';

  @override
  String get loading => 'Belastning...';

  @override
  String get selectLanguage => 'Välj språk';

  @override
  String get onboardingGetStartedDesc => 'Kom igång genom att välja ditt språk';

  @override
  String get accountRecoveryTitle => '🔐 Detaljer om kontoåterställning';

  @override
  String get recoveryInstructions =>
      'Spara informationen på ett säkert sätt. Du behöver den för att återställa ditt konto.';

  @override
  String get importantNotice => '⚠️ Viktigt:';

  @override
  String get astrologerProfileTitle => 'Astrologprofil';

  @override
  String get personalAstrologer => 'Personlig astrolog';

  @override
  String get makePersonalAstrologer => 'Gör dig till personlig astrolog';

  @override
  String get favoriteDescription =>
      'Dina frågor kommer att prioriteras till denna astrolog. Om du inte är tillgänglig kommer en annan kvalificerad astrolog att hjälpa dig.';

  @override
  String get educationQualifications => 'Utbildning och kvalifikationer';

  @override
  String get aboutSection => 'Om';

  @override
  String get shareProfile => 'Dela profil';

  @override
  String get loadingAstrologer => 'Laddar astrologuppgifter...';

  @override
  String get failedToLoadAstrologer =>
      'Misslyckades med att ladda astrologuppgifter';

  @override
  String get authenticationRequired =>
      'Autentisering krävs. Vänligen logga in.';

  @override
  String securityCheckFailed(Object error) {
    return 'Säkerhetskontrollen misslyckades: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name är nu din personliga astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Tog bort $name från favoriter';
  }

  @override
  String get toggleFavoriteError =>
      'Misslyckades med att uppdatera favoritstatusen';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Utbildning: $education\n📜 Kvalifikation: $qualification\n⏳ Erfarenhet: $experience';
  }

  @override
  String get notProvided => 'Inte tillhandahållet';

  @override
  String reviews(Object count) {
    return '($count recensioner)';
  }

  @override
  String get specialties => 'Specialiteter';

  @override
  String get experience => 'Uppleva';

  @override
  String get qualification => 'Kompetens';

  @override
  String get education => 'Utbildning';

  @override
  String get recoveryTips =>
      '• Ta en skärmdump av informationen\n• Förvara den på ett säkert ställe\n• Dela den inte med någon\n• Detta visas bara en gång';

  @override
  String get themeSettingsTitle => 'Temainställningar';

  @override
  String get lightThemeLabel => 'Ljus';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Mörk';

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
}
