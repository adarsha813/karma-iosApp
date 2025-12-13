// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get settingsTitle => 'Instellings';

  @override
  String get notificationSettings => 'Kennisgewinginstellings';

  @override
  String get privacySettings => 'Privaatheidsinstellings';

  @override
  String get accountSettings => 'Rekeninginstellings';

  @override
  String get languageSettings => 'Taalinstellings';

  @override
  String get languageChanged => 'Taal verander';

  @override
  String get existingUserButton => 'Ek is \'n bestaande gebruiker';

  @override
  String get chooseCountryTitle => 'Kies Land';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'Nee';

  @override
  String get appBarTitle => 'Profielinstellings';

  @override
  String get userIdLabel => 'Gebruikers-ID *';

  @override
  String get nameLabel => 'Naam';

  @override
  String get birthCountryLabel => 'Geboorteland';

  @override
  String get birthCityLabel => 'Geboortestad';

  @override
  String get countrySelectionTitle => 'Kies jou land';

  @override
  String get maleLabel => 'Manlik';

  @override
  String get femaleLabel => 'Vroulik';

  @override
  String get birthDateLabel => 'Geboortedatum';

  @override
  String get birthDatePlaceholder => 'Kies Geboortedatum';

  @override
  String get birthTimeLabel => 'Geboortetyd';

  @override
  String get birthTimePlaceholder => 'Kies Geboortetyd';

  @override
  String get saveProfileButton => 'Stoor Profiel';

  @override
  String get noCitiesFound => 'Geen stede gevind nie';

  @override
  String cityPlaceholder(Object country) {
    return 'Voer stad in $country in';
  }

  @override
  String get countryFirstPlaceholder => 'Kies eers land';

  @override
  String get versionHistoryTitle => 'Weergawegeskiedenis';

  @override
  String get notSetText => 'Nie gestel nie';

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
    return 'Geslag: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Geboortedatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Geboortetyd: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Ligging: $latitude, $longitude';
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
    return 'Staat: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Opgedateer op $date';
  }

  @override
  String get userIdRequired => 'Gebruikers-ID word vereis';

  @override
  String get profileSaved => 'Profiel suksesvol gestoor';

  @override
  String get saveFailed => 'Kon nie profiel stoor nie';

  @override
  String get errorPrefix => 'Fout:';

  @override
  String get onboardingChooseLanguage => 'Kies jou taal';

  @override
  String get onboardingChooseLanguageDesc =>
      'Kies jou voorkeurtaal om voort te gaan.';

  @override
  String get onboardingWhatIsAstrology => 'Wat is Astrologie?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologie is die antieke studie van hemelse bewegings en hul invloed op die menslike lewe, en bied insigte in persoonlikheid, verhoudings en lewensgebeure.';

  @override
  String get onboardingWhyUseApp => 'Waarom hierdie toepassing gebruik?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ontvang akkurate, mensgegenereerde horoskope en leiding wat op jou geboortekaart afgestem is. Neem ingeligte besluite met daaglikse voorspellings en persoonlike advies van ervare astroloë.';

  @override
  String get onboardingHowToUse => 'Hoe om hierdie toepassing te gebruik?';

  @override
  String get onboardingHowToUseDesc =>
      'Voer eenvoudig jou geboortedatum, presiese tyd, geboorteplek en enige ander relevante besonderhede in om onmiddellik te begin. Verken daaglikse horoskope, vra vrae aan kundige astroloë en bestuur jou profiel vir presiese, gepersonaliseerde voorspellings – geen aanmelding nodig nie.';

  @override
  String get onboardingGetStarted => 'Begin';

  @override
  String get onboardingNewUser => 'Nuwe Gebruiker';

  @override
  String get onboardingExistingUser => 'Bestaande Gebruiker';

  @override
  String get onboardingBack => 'Terug';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get userIdNotFound =>
      'Gebruikers-ID nie gevind nie. Meld asseblief aan of stel jou profiel op.';

  @override
  String get clearNotificationsTitle => 'Vee Kennisgewings Uit';

  @override
  String get clearNotificationsMessage =>
      'Is jy seker jy wil alle kennisgewings uitvee?';

  @override
  String get clearNotificationsSuccess =>
      'Alle kennisgewings suksesvol uitgevee.';

  @override
  String get clearHoroscopeTitle => 'Duidelike Horoskoop';

  @override
  String get clearHoroscopeMessage =>
      'Is jy seker jy wil jou horoskoopdata uitvee?';

  @override
  String get clearHoroscopeSuccess => 'Horoskoop suksesvol skoongemaak.';

  @override
  String get clearChatTitle => 'Vee kletsgeskiedenis uit';

  @override
  String get clearChatMessage =>
      'Is jy seker jy wil al jou kletsgeskiedenis uitvee?';

  @override
  String get clearChatLocal => 'Klets is plaaslik uitgevee.';

  @override
  String get deleteAccountTitle => 'Vee rekening uit';

  @override
  String get deleteAccountMessage =>
      'Is jy seker jy wil jou rekening verwyder? Dit sal ook al jou kletsgeskiedenis en kennisgewings uitvee.';

  @override
  String get deleteAccountSuccess => 'Jou rekening en alle data is verwyder.';

  @override
  String get deleteAccountError => 'Fout by die verwydering van rekening';

  @override
  String get logoutTitle => 'Uitteken';

  @override
  String get logoutMessage => 'Is jy seker jy wil uitmeld?';

  @override
  String get termsPrivacyTitle => 'Voorwaardes en privaatheid';

  @override
  String get privacyPolicyTitle => 'Privaatheidsbeleid';

  @override
  String get termsConditionsTitle => 'Terme en voorwaardes';

  @override
  String get dataControlTitle => 'Databeheer';

  @override
  String get cancelButton => 'Kanselleer';

  @override
  String get confirmButton => 'Bevestig';

  @override
  String get clearQuestionsSuccess => 'Alle vrae suksesvol uitgevee.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Here';

  @override
  String get startLabel => 'Begin';

  @override
  String get recoverAccount => 'Herstel rekening';

  @override
  String get endLabel => 'Einde';

  @override
  String get startDateLabel => 'Begindatum';

  @override
  String get endDateLabel => 'Einddatum';

  @override
  String get notAvailable => 'Nie beskikbaar nie';

  @override
  String get noData => 'Geen data nie';

  @override
  String get unknownError => 'Onbekende fout';

  @override
  String get retryButton => 'Probeer weer';

  @override
  String get kundaliGeneratorTitle => 'Kundali-kragopwekker';

  @override
  String get natalChartTitle => 'Geboortekaart';

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
  String get unknown => 'Onbekend';

  @override
  String get clearHoroscope => 'Duidelike Horoskoop';

  @override
  String get clearNotifications => 'Vee Kennisgewings Uit';

  @override
  String get clearChatHistory => 'Vee kletsgeskiedenis uit';

  @override
  String get logout => 'Uitteken';

  @override
  String get deleteAccount => 'Vee rekening uit';

  @override
  String get allFieldsRequired => 'Alle velde is verpligtend.';

  @override
  String get accountRecoveredSuccess => 'Rekening suksesvol herstel.';

  @override
  String get recoveryFailed => 'Herstel het misluk. Gaan jou inligting na.';

  @override
  String get recoverySecretLabel => 'Herstelgeheim:';

  @override
  String get aboutUsTitle => 'Oor Ons';

  @override
  String get aboutOurCompany => 'Oor Ons Maatskappy';

  @override
  String get aboutCompanyDescription =>
      'By Karma help ons jou om jou ware lewenspad te ontdek deur die tydlose wysheid van Vediese astrologie. Elke insig kom van ware, ervare astroloë, noukeurig saamgestel gebaseer op jou unieke geboortekaart. Van daaglikse horoskope tot persoonlike leiding, maak Karma antieke kennis toeganklik in meer as 100 tale.';

  @override
  String get ourMission => 'Ons Missie';

  @override
  String get missionDescription =>
      'Ons missie is eenvoudig: om outentieke, mensgeleide astrologiese leiding te bied wat jou in staat stel om selfversekerde, ingeligte besluite te neem. Elke voorspelling en konsultasie weerspieël jare se professionele kundigheid, nie outomatiese algoritmes nie.';

  @override
  String get ourVision => 'Ons Visie';

  @override
  String get visionDescription =>
      'Ons streef daarna om die wêreld se mees vertroude platform vir Vediese astrologie te wees, en mense oral te help om hulself, hul keuses en hul lewensreis met duidelikheid en selfvertroue te verstaan.';

  @override
  String get ourValues => 'Ons Waardes';

  @override
  String get valuesDescription =>
      'By Karma waardeer ons egtheid, presisie en vertroue. Ons is daartoe verbind om leiding te bied wat nie net akkuraat is nie, maar ook betekenisvol, wat jou help om die lewe met insig en selfvertroue te navigeer.';

  @override
  String get contactUs => 'Kontak Ons';

  @override
  String get contactEmail => 'E-pos: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webwerf: www.joumaatskappy.com';

  @override
  String get customerSupport => 'Kliëntediens';

  @override
  String get supportHeroTitle => 'Ons is hier om te help';

  @override
  String get supportHeroDescription =>
      'Voltooi die onderstaande vorm en ons ondersteuningspan sal so gou as moontlik met jou in verbinding tree.';

  @override
  String get yourName => 'Jou Naam';

  @override
  String get yourEmail => 'Jou e-pos';

  @override
  String get message => 'Boodskap';

  @override
  String get enterEmail => 'Voer jou e-posadres in';

  @override
  String get enterValidEmail => 'Voer \'n geldige e-posadres in';

  @override
  String enterField(Object fieldName) {
    return 'Voer $fieldName in';
  }

  @override
  String get send => 'Stuur';

  @override
  String get sending => 'Stuur tans...';

  @override
  String get emailSentSuccess => '✅ E-pos suksesvol gestuur!';

  @override
  String get emailSendFailed => '❌ Kon nie e-pos stuur nie';

  @override
  String get astroDictionaryTitle => 'Astro Woordeboek';

  @override
  String get searchTermsHint => 'Soekterme...';

  @override
  String get noTermsFound => 'Geen terme gevind nie';

  @override
  String get buyQuestionsTitle => 'Koopvrae';

  @override
  String get userNotAuthenticated => 'Gebruiker nie geverifieer nie';

  @override
  String get loadStoreDataFailed => 'Kon nie winkeldata laai nie';

  @override
  String get missingAuthToken => 'Ontbrekende outoriseringstoken';

  @override
  String get merchantDisplayName => 'Astro-klets-app';

  @override
  String get paymentSuccessful => '✅ Betaling suksesvol! Vraag gestuur';

  @override
  String paymentFailed(Object error) {
    return '❌ Betaling het misluk: $error';
  }

  @override
  String get yourBalance => 'Jou Saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Vrae';
  }

  @override
  String get availableOffers => 'Beskikbare aanbiedinge';

  @override
  String questionsCount(Object count) {
    return '$count Vraag';
  }

  @override
  String get buyButton => 'Koop';

  @override
  String get dailyHoroscopeTitle => '🌟 Daaglikse Horoskoop';

  @override
  String get userIdMissing => 'Gebruikers-ID ontbreek';

  @override
  String get fetchHoroscopesFailed => 'Kon nie horoskope haal nie';

  @override
  String get noHoroscopeFound => 'Geen horoskoop gevind nie.';

  @override
  String get signLabel => 'Teken';

  @override
  String get todayLabel => 'Vandag';

  @override
  String get yesterdayLabel => 'Gister';

  @override
  String get thisWeekLabel => 'Hierdie Week';

  @override
  String get lastMonthLabel => 'Verlede Maand';

  @override
  String get chatTitle => 'Klets';

  @override
  String get typeYourQuestionHint => 'Tik jou vraag...';

  @override
  String get paymentRequired => 'Betaling Vereis';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Jy het jou gratis vrae gebruik. Betaal $amount om voort te gaan.';
  }

  @override
  String get payNowButton => 'Betaal Nou';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count gratis vrae oor';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count betaalde vrae oor';
  }

  @override
  String get thankYouFeedback => 'Dankie vir jou terugvoer!';

  @override
  String get ratingSubmitted => 'Gradering ingedien!';

  @override
  String get setUserIdFirst => 'Stel asseblief eers u gebruikers-ID in';

  @override
  String get failedToFetchPrevious =>
      'Kon nie vorige vrae en antwoorde ophaal nie';

  @override
  String errorOccurred(Object error) {
    return 'Fout: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profiel';

  @override
  String get drawerDailyHoroscope => 'Daaglikse Horoskoop';

  @override
  String get drawerBuyQuestions => 'Koopvrae';

  @override
  String get drawerAstroDictionary => 'Astro Woordeboek';

  @override
  String get drawerSettings => 'Instellings';

  @override
  String get drawerCustomerSupport => 'Kliëntediens';

  @override
  String get drawerAbout => 'Oor';

  @override
  String get drawerProfileSettings => 'Profielinstellings';

  @override
  String get demoNotificationTitle => '🔔 Demo-kennisgewing';

  @override
  String get demoNotificationBody =>
      'Hierdie is \'n toetskennisgewing vanaf jou toepassing!';

  @override
  String get notificationsTitle => 'Kennisgewings';

  @override
  String get noNotifications => 'Geen kennisgewings nie';

  @override
  String get allTab => 'Alles';

  @override
  String get markAllAsRead => 'Merk alles as gelees';

  @override
  String get notificationMarkedRead => 'Kennisgewing gemerk as gelees';

  @override
  String get failedToLoadNotifications => 'Kon nie kennisgewings laai nie';

  @override
  String get failedToMarkRead => 'Kon nie as gelees merk nie';

  @override
  String get failedToMarkAllRead => 'Kon nie alles as gelees merk nie';

  @override
  String get socketConnected => 'Sok gekoppel';

  @override
  String get socketDisconnected => 'Sok ontkoppel';

  @override
  String get newNotificationReceived => 'Nuwe kennisgewing ontvang';

  @override
  String get generalCategory => 'Algemeen';

  @override
  String get horoscopeCategory => 'Horoskoop';

  @override
  String get chatCategory => 'Klets';

  @override
  String get systemCategory => 'Stelsel';

  @override
  String get updateCategory => 'Opdaterings';

  @override
  String get howToAskTitle => 'Hoe om te vra';

  @override
  String get noQuestionsAvailable => 'Geen vrae beskikbaar nie';

  @override
  String get failedToLoadQuestions => 'Kon nie vrae laai nie';

  @override
  String get pullToRefresh => 'Trek om te verfris';

  @override
  String get careerCategory => 'Loopbaan';

  @override
  String get loveCategory => 'Liefde en Verhoudings';

  @override
  String get healthCategory => 'Gesondheid';

  @override
  String get financeCategory => 'Finansies';

  @override
  String get familyCategory => 'Familie';

  @override
  String get educationCategory => 'Onderwys';

  @override
  String get travelCategory => 'Reis';

  @override
  String get spiritualCategory => 'Geestelik';

  @override
  String get profileLoaded => 'Profiel suksesvol gelaai';

  @override
  String get imageUploaded => 'Beeld suksesvol opgelaai';

  @override
  String get savedInformationConfirmation => 'Ek het hierdie inligting gestoor';

  @override
  String get noHistoryAvailable => 'Geen geskiedenis beskikbaar nie';

  @override
  String get missingUserIdError => 'Gebruikers-ID word vereis';

  @override
  String get networkError => 'Netwerkfout. Probeer asseblief weer.';

  @override
  String get timeoutError => 'Versoek het uitgetel';

  @override
  String get genericError => 'Iets het verkeerd geloop';

  @override
  String get reactionUpdateError => 'Kon nie reaksie opdateer nie';

  @override
  String get noSearchResults => 'Geen soekresultate gevind nie';

  @override
  String get clearSearch => 'Vee soektog uit';

  @override
  String get resultsFound => 'Resultate gevind';

  @override
  String get recoverySecretHint => 'Kopieer-plak werk dalk nie, tik handmatig';

  @override
  String get recoverAccountDescription =>
      'Volg hierdie stappe om jou rekening te herstel';

  @override
  String get processingLabel => 'Verwerk...';

  @override
  String get clearChatSuccess => 'Klets suksesvol uitgevee';

  @override
  String get notificationsEnabled => 'Kennisgewings geaktiveer';

  @override
  String get notificationsDisabled => 'Kennisgewings gedeaktiveer';

  @override
  String get securityNotice => 'Jou data word veilig geïnkripteer en gestoor';

  @override
  String get loading => 'Laai tans...';

  @override
  String get selectLanguage => 'Kies Taal';

  @override
  String get onboardingGetStartedDesc => 'Begin deur jou taal te kies';

  @override
  String get accountRecoveryTitle => '🔐 Rekeningherstelbesonderhede';

  @override
  String get recoveryInstructions =>
      'Stoor asseblief hierdie inligting veilig. Jy sal dit nodig hê om jou rekening te herstel.';

  @override
  String get importantNotice => '⚠️ Belangrik:';

  @override
  String get astrologerProfileTitle => 'Astroloog Profiel';

  @override
  String get personalAstrologer => 'Persoonlike Astroloog';

  @override
  String get makePersonalAstrologer => 'Maak Persoonlike Astroloog';

  @override
  String get favoriteDescription =>
      'Jou vrae sal voorkeur kry by hierdie astroloog. Indien nie beskikbaar nie, sal \'n ander gekwalifiseerde astroloog jou help.';

  @override
  String get educationQualifications => 'Opleiding en kwalifikasies';

  @override
  String get aboutSection => 'Oor';

  @override
  String get shareProfile => 'Deel Profiel';

  @override
  String get loadingAstrologer => 'Laai tans astroloogbesonderhede...';

  @override
  String get failedToLoadAstrologer => 'Kon nie astroloogbesonderhede laai nie';

  @override
  String get authenticationRequired =>
      'Verifikasie vereis. Meld asseblief aan.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sekuriteitstoets het misluk: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name is nou jou Persoonlike Astroloog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name van gunstelinge verwyder';
  }

  @override
  String get toggleFavoriteError => 'Kon nie gunstelingstatus opdateer nie';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Opleiding: $education\n📜 Kwalifikasie: $qualification\n⏳ Ondervinding: $experience';
  }

  @override
  String get notProvided => 'Nie verskaf nie';

  @override
  String reviews(Object count) {
    return '($count resensies)';
  }

  @override
  String get specialties => 'Spesialiteite';

  @override
  String get experience => 'Ervaring';

  @override
  String get qualification => 'Kwalifikasie';

  @override
  String get education => 'Onderwys';

  @override
  String get recoveryTips =>
      '• Neem \'n skermkiekie van hierdie inligting\n• Stoor dit op \'n veilige plek\n• Moenie met enigiemand deel nie\n• Dit sal slegs een keer gewys word';

  @override
  String get themeSettingsTitle => 'Tema-instellings';

  @override
  String get lightThemeLabel => 'Lig';

  @override
  String get lightThemeDescription => 'Gebruik altyd ligte tema';

  @override
  String get darkThemeLabel => 'Donker';

  @override
  String get darkThemeDescription => 'Gebruik altyd donker tema';

  @override
  String get systemThemeLabel => 'Stelsel';

  @override
  String get systemThemeDarkDescription =>
      'Volg stelselinstellings vir donker tema';

  @override
  String get systemThemeLightDescription =>
      'Volg stelselinstellings vir ligte tema';

  @override
  String get switchToLight => 'Skakel oor na Lig';

  @override
  String get switchToDark => 'Skakel oor na Donker';

  @override
  String get ourTeam => 'Ons span';

  @override
  String get teamDescription =>
      'Ons span professionele Vediese astroloë het jare se ondervinding in die interpretasie van planetêre invloede en lewenspatrone. Gerugsteun deur \'n toegewyde ondersteunings- en ontwikkelingspan, lewer Karma \'n naatlose, betroubare en globale ervaring vir elke gebruiker.';
}
