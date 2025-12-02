// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get settingsTitle => 'Seaded';

  @override
  String get notificationSettings => 'Teavitusseaded';

  @override
  String get privacySettings => 'Privaatsusseaded';

  @override
  String get accountSettings => 'Konto seaded';

  @override
  String get languageSettings => 'Keeleseaded';

  @override
  String get languageChanged => 'Keel muudetud';

  @override
  String get existingUserButton => 'Olen olemasolev kasutaja';

  @override
  String get chooseCountryTitle => 'Vali riik';

  @override
  String get yesText => 'Jah';

  @override
  String get noText => 'Ei';

  @override
  String get appBarTitle => 'Profiili seaded';

  @override
  String get userIdLabel => 'Kasutaja ID *';

  @override
  String get nameLabel => 'Nimi';

  @override
  String get birthCountryLabel => 'Sünnimaa';

  @override
  String get birthCityLabel => 'Sünnilinn';

  @override
  String get countrySelectionTitle => 'Vali oma riik';

  @override
  String get maleLabel => 'Mees';

  @override
  String get femaleLabel => 'Naine';

  @override
  String get birthDateLabel => 'Sünnikuupäev';

  @override
  String get birthDatePlaceholder => 'Valige sünnikuupäev';

  @override
  String get birthTimeLabel => 'Sünniaeg';

  @override
  String get birthTimePlaceholder => 'Valige sünniaeg';

  @override
  String get saveProfileButton => 'Salvesta profiil';

  @override
  String get noCitiesFound => 'Linnasid ei leitud';

  @override
  String cityPlaceholder(Object country) {
    return 'Sisesta linn riigis $country';
  }

  @override
  String get countryFirstPlaceholder => 'Valige esmalt riik';

  @override
  String get versionHistoryTitle => 'Versiooniajalugu';

  @override
  String get notSetText => 'Pole määratud';

  @override
  String nameHistory(Object name) {
    return 'Nimi: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Linn: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Riik: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sugu: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Sünnikuupäev: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Sünniaeg: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Asukoht: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Ajavöönd: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Suveaeg: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Olek: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Uuendatud kuupäeval $date';
  }

  @override
  String get userIdRequired => 'Kasutaja ID on nõutav';

  @override
  String get profileSaved => 'Profiili salvestamine õnnestus';

  @override
  String get saveFailed => 'Profiili salvestamine ebaõnnestus';

  @override
  String get errorPrefix => 'Viga:';

  @override
  String get onboardingChooseLanguage => 'Valige oma keel';

  @override
  String get onboardingChooseLanguageDesc =>
      'Jätkamiseks valige oma eelistatud keel.';

  @override
  String get onboardingWhatIsAstrology => 'Mis on astroloogia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astroloogia on taevakehade uurimine...';

  @override
  String get onboardingWhyUseApp => 'Miks seda rakendust kasutada?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Hankige isikupärastatud horoskoope, päevaprognoose ja juhiseid teadlike otsuste langetamiseks.';

  @override
  String get onboardingHowToUse => 'Kuidas seda rakendust kasutada?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigeeri hõlpsalt, vaata igapäevaseid horoskoope ja halda oma profiili täpsete ennustuste saamiseks.';

  @override
  String get onboardingGetStarted => 'Alustamine';

  @override
  String get onboardingNewUser => 'Uus kasutaja';

  @override
  String get onboardingExistingUser => 'Olemasolev kasutaja';

  @override
  String get onboardingBack => 'Tagasi';

  @override
  String get onboardingNext => 'Järgmine';

  @override
  String get userIdNotFound =>
      'Kasutaja ID-d ei leitud. Palun logi sisse või seadista oma profiil.';

  @override
  String get clearNotificationsTitle => 'Tühjenda märguanded';

  @override
  String get clearNotificationsMessage =>
      'Kas oled kindel, et soovid kõik märguanded kustutada?';

  @override
  String get clearNotificationsSuccess => 'Kõik märguanded kustutati edukalt.';

  @override
  String get clearHoroscopeTitle => 'Selge horoskoop';

  @override
  String get clearHoroscopeMessage =>
      'Kas oled kindel, et soovid oma horoskoobi andmed kustutada?';

  @override
  String get clearHoroscopeSuccess => 'Horoskoop edukalt kustutatud.';

  @override
  String get clearChatTitle => 'Tühjenda vestlusajalugu';

  @override
  String get clearChatMessage =>
      'Kas oled kindel, et soovid kogu oma vestlusajaloo kustutada?';

  @override
  String get clearChatLocal => 'Vestlus kustutati lokaalselt.';

  @override
  String get deleteAccountTitle => 'Kustuta konto';

  @override
  String get deleteAccountMessage =>
      'Kas oled kindel, et soovid oma konto kustutada? See kustutab ka kogu sinu vestlusajaloo ja märguanded.';

  @override
  String get deleteAccountSuccess => 'Teie konto ja kõik andmed on eemaldatud.';

  @override
  String get deleteAccountError => 'Viga konto kustutamisel';

  @override
  String get logoutTitle => 'Logi välja';

  @override
  String get logoutMessage => 'Kas oled kindel, et soovid välja logida?';

  @override
  String get termsPrivacyTitle => 'Tingimused ja privaatsus';

  @override
  String get privacyPolicyTitle => 'Privaatsuspoliitika';

  @override
  String get termsConditionsTitle => 'Tingimused';

  @override
  String get dataControlTitle => 'Andmekontroll';

  @override
  String get cancelButton => 'Tühista';

  @override
  String get confirmButton => 'Kinnita';

  @override
  String get clearQuestionsSuccess => 'Kõik küsimused on edukalt kustutatud.';

  @override
  String get yoginiLabel => 'Joogini';

  @override
  String get lordLabel => 'Issand';

  @override
  String get startLabel => 'Alusta';

  @override
  String get recoverAccount => 'Konto taastamine';

  @override
  String get endLabel => 'Lõpp';

  @override
  String get startDateLabel => 'Alguskuupäev';

  @override
  String get endDateLabel => 'Lõppkuupäev';

  @override
  String get notAvailable => 'Pole saadaval';

  @override
  String get noData => 'Andmeid pole';

  @override
  String get unknownError => 'Tundmatu viga';

  @override
  String get retryButton => 'Proovi uuesti';

  @override
  String get kundaliGeneratorTitle => 'Kundali generaator';

  @override
  String get natalChartTitle => 'Natali diagramm';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Tõusev kraad';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Daša';

  @override
  String get yoginiDashaTitle => 'Joogini Daša';

  @override
  String get unknown => 'Tundmatu';

  @override
  String get clearHoroscope => 'Selge horoskoop';

  @override
  String get clearNotifications => 'Tühjenda märguanded';

  @override
  String get clearChatHistory => 'Tühjenda vestlusajalugu';

  @override
  String get logout => 'Logi välja';

  @override
  String get deleteAccount => 'Kustuta konto';

  @override
  String get allFieldsRequired => 'Kõik väljad on kohustuslikud.';

  @override
  String get accountRecoveredSuccess => 'Konto taastati edukalt.';

  @override
  String get recoveryFailed =>
      'Taastamine ebaõnnestus. Kontrollige oma andmeid.';

  @override
  String get recoverySecretLabel => 'Taastumise saladus:';

  @override
  String get aboutUsTitle => 'Meist';

  @override
  String get aboutOurCompany => 'Meie ettevõttest';

  @override
  String get aboutCompanyDescription =>
      'Oleme pühendunud pakkuma oma kasutajatele parimat astroloogiakogemust.';

  @override
  String get ourMission => 'Meie missioon';

  @override
  String get missionDescription =>
      'Pakkuda täpseid ja isikupärastatud astroloogiaalaseid teadmisi, mis aitavad kasutajatel oma elus teadlikke otsuseid langetada.';

  @override
  String get ourVision => 'Meie visioon';

  @override
  String get visionDescription =>
      'Et saada kõige usaldusväärsemaks astroloogiaplatvormiks, mis ühendab tehnoloogia ja iidse tarkuse.';

  @override
  String get ourValues => 'Meie väärtused';

  @override
  String get valuesDescription =>
      'Ausus, täpsus, kasutajakeskne disain ja pidev innovatsioon.';

  @override
  String get contactUs => 'Võta meiega ühendust';

  @override
  String get contactEmail => 'Meiliaadress: support@yourcompany.com';

  @override
  String get contactWebsite => 'Veebisait: www.yourcompany.com';

  @override
  String get customerSupport => 'Klienditugi';

  @override
  String get supportHeroTitle => 'Oleme siin, et aidata';

  @override
  String get supportHeroDescription =>
      'Täitke allolev vorm ja meie tugimeeskond võtab teiega esimesel võimalusel ühendust.';

  @override
  String get yourName => 'Sinu nimi';

  @override
  String get yourEmail => 'Teie e-post';

  @override
  String get message => 'Sõnum';

  @override
  String get enterEmail => 'Sisesta oma e-posti aadress';

  @override
  String get enterValidEmail => 'Sisestage kehtiv e-posti aadress';

  @override
  String enterField(Object fieldName) {
    return 'Sisesta $fieldName';
  }

  @override
  String get send => 'Saada';

  @override
  String get sending => 'Saadetakse...';

  @override
  String get emailSentSuccess => '✅ E-kiri saadeti edukalt!';

  @override
  String get emailSendFailed => '❌ E-kirja saatmine ebaõnnestus';

  @override
  String get astroDictionaryTitle => 'Astro sõnaraamat';

  @override
  String get searchTermsHint => 'Otsinguterminid...';

  @override
  String get noTermsFound => 'Termineid ei leitud';

  @override
  String get buyQuestionsTitle => 'Ostuküsimused';

  @override
  String get userNotAuthenticated => 'Kasutaja pole autentitud';

  @override
  String get loadStoreDataFailed => 'Poe andmete laadimine ebaõnnestus';

  @override
  String get missingAuthToken => 'Puudub autoriseerimistunnus';

  @override
  String get merchantDisplayName => 'Astro vestlusrakendus';

  @override
  String get paymentSuccessful => '✅ Makse õnnestus! Küsimus saadetud';

  @override
  String paymentFailed(Object error) {
    return '❌ Makse ebaõnnestus: $error';
  }

  @override
  String get yourBalance => 'Teie saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Saadaval olevad pakkumised';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Osta';

  @override
  String get dailyHoroscopeTitle => '🌟 Päevahoroskoop';

  @override
  String get userIdMissing => 'Kasutaja ID puudub';

  @override
  String get fetchHoroscopesFailed => 'Horoskoopide toomine ebaõnnestus';

  @override
  String get noHoroscopeFound => 'Horoskoopi ei leitud.';

  @override
  String get signLabel => 'Märk';

  @override
  String get todayLabel => 'Täna';

  @override
  String get yesterdayLabel => 'Eile';

  @override
  String get thisWeekLabel => 'Sel nädalal';

  @override
  String get lastMonthLabel => 'Eelmisel kuul';

  @override
  String get chatTitle => 'Vestlus';

  @override
  String get typeYourQuestionHint => 'Tippige oma küsimus...';

  @override
  String get paymentRequired => 'Makse nõutav';

  @override
  String get paymentRequiredMessage =>
      'Oled oma tasuta küsimused ära kasutanud. Jätkamiseks maksa 50 ₹.';

  @override
  String get payNowButton => 'Maksa kohe';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count tasuta küsimust on jäänud';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count tasulist küsimust on jäänud';
  }

  @override
  String get thankYouFeedback => 'Täname tagasiside eest!';

  @override
  String get ratingSubmitted => 'Hinnang esitatud!';

  @override
  String get setUserIdFirst => 'Palun määrake kõigepealt oma kasutajatunnus';

  @override
  String get failedToFetchPrevious =>
      'Eelmiste küsimuste ja vastuste toomine ebaõnnestus';

  @override
  String errorOccurred(Object error) {
    return 'Viga: $error';
  }

  @override
  String get drawerAstroProfile => 'Astroprofiil';

  @override
  String get drawerDailyHoroscope => 'Päevahoroskoop';

  @override
  String get drawerBuyQuestions => 'Ostuküsimused';

  @override
  String get drawerAstroDictionary => 'Astro sõnaraamat';

  @override
  String get drawerSettings => 'Seaded';

  @override
  String get drawerCustomerSupport => 'Klienditugi';

  @override
  String get drawerAbout => 'Teave';

  @override
  String get drawerProfileSettings => 'Profiili seaded';

  @override
  String get demoNotificationTitle => '🔔 Demoteatis';

  @override
  String get demoNotificationBody => 'See on teie rakenduse testteade!';

  @override
  String get notificationsTitle => 'Teavitused';

  @override
  String get noNotifications => 'Teavitusi pole';

  @override
  String get allTab => 'Kõik';

  @override
  String get markAllAsRead => 'Märgi kõik loetuks';

  @override
  String get notificationMarkedRead => 'Teade märgitud loetuks';

  @override
  String get failedToLoadNotifications => 'Teavituste laadimine ebaõnnestus';

  @override
  String get failedToMarkRead => 'Loetuks märkimine ebaõnnestus';

  @override
  String get failedToMarkAllRead => 'Kõikide loetuks märkimine ebaõnnestus';

  @override
  String get socketConnected => 'Pistikupesa ühendatud';

  @override
  String get socketDisconnected => 'Pistikupesa lahti ühendatud';

  @override
  String get newNotificationReceived => 'Uus teade saabus';

  @override
  String get generalCategory => 'Üldine';

  @override
  String get horoscopeCategory => 'Horoskoop';

  @override
  String get chatCategory => 'Vestlus';

  @override
  String get systemCategory => 'Süsteem';

  @override
  String get updateCategory => 'Värskendused';

  @override
  String get howToAskTitle => 'Kuidas küsida';

  @override
  String get noQuestionsAvailable => 'Küsimusi pole saadaval';

  @override
  String get failedToLoadQuestions => 'Küsimuste laadimine ebaõnnestus';

  @override
  String get pullToRefresh => 'Värskendamiseks tõmmake';

  @override
  String get careerCategory => 'Karjäär';

  @override
  String get loveCategory => 'Armastus ja suhted';

  @override
  String get healthCategory => 'Tervis';

  @override
  String get financeCategory => 'Rahandus';

  @override
  String get familyCategory => 'Perekond';

  @override
  String get educationCategory => 'Haridus';

  @override
  String get travelCategory => 'Reisimine';

  @override
  String get spiritualCategory => 'Vaimne';

  @override
  String get profileLoaded => 'Profiil laaditi edukalt';

  @override
  String get imageUploaded => 'Pilt on edukalt üles laaditud';

  @override
  String get savedInformationConfirmation => 'Olen selle teabe salvestanud';

  @override
  String get noHistoryAvailable => 'Ajalugu pole saadaval';

  @override
  String get missingUserIdError => 'Kasutaja ID on nõutav';

  @override
  String get networkError => 'Võrgu viga. Palun proovige uuesti.';

  @override
  String get timeoutError => 'Päring aegus';

  @override
  String get genericError => 'Midagi läks valesti';

  @override
  String get reactionUpdateError => 'Reaktsiooni värskendamine ebaõnnestus';

  @override
  String get noSearchResults => 'Otsingutulemusi ei leitud';

  @override
  String get clearSearch => 'Tühjenda otsing';

  @override
  String get resultsFound => 'Tulemused leiti';

  @override
  String get recoverySecretHint =>
      'Kopeerimine ja kleepimine ei pruugi töötada, tippige käsitsi';

  @override
  String get recoverAccountDescription =>
      'Konto taastamiseks järgige neid samme';

  @override
  String get processingLabel => 'Töötlemine...';

  @override
  String get clearChatSuccess => 'Vestlus edukalt tühistatud';

  @override
  String get notificationsEnabled => 'Teavitused on lubatud';

  @override
  String get notificationsDisabled => 'Märguanded on keelatud';

  @override
  String get securityNotice =>
      'Teie andmed on turvaliselt krüpteeritud ja salvestatud';

  @override
  String get loading => 'Laadimine...';

  @override
  String get selectLanguage => 'Valige keel';

  @override
  String get onboardingGetStartedDesc => 'Alustage keele valimisega';

  @override
  String get accountRecoveryTitle => '🔐 Konto taastamise üksikasjad';

  @override
  String get recoveryInstructions =>
      'Palun salvestage see teave turvaliselt. Teil on seda vaja oma konto taastamiseks.';

  @override
  String get importantNotice => '⚠️ Tähtis:';

  @override
  String get astrologerProfileTitle => 'Astroloogi profiil';

  @override
  String get personalAstrologer => 'Isiklik astroloog';

  @override
  String get makePersonalAstrologer => 'Loo isiklik astroloog';

  @override
  String get favoriteDescription =>
      'Teie küsimused edastatakse sellele astroloogile prioriteetselt. Kui ta pole saadaval, aitab teid teine kvalifitseeritud astroloog.';

  @override
  String get educationQualifications => 'Haridus ja kvalifikatsioon';

  @override
  String get aboutSection => 'Teave';

  @override
  String get shareProfile => 'Jaga profiili';

  @override
  String get loadingAstrologer => 'Astroloogi andmete laadimine...';

  @override
  String get failedToLoadAstrologer =>
      'Astroloogi andmete laadimine ebaõnnestus';

  @override
  String get authenticationRequired =>
      'Autentimine on vajalik. Palun logige sisse.';

  @override
  String securityCheckFailed(Object error) {
    return 'Turvakontroll ebaõnnestus: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name on nüüd teie isiklik astroloog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Eemaldas $name lemmikute hulgast';
  }

  @override
  String get toggleFavoriteError =>
      'Lemmikute staatuse värskendamine ebaõnnestus';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Haridus: $education\n📜 Kvalifikatsioon: $qualification\n⏳ Kogemus: $experience';
  }

  @override
  String get notProvided => 'Pole esitatud';

  @override
  String reviews(Object count) {
    return '($count arvustust)';
  }

  @override
  String get specialties => 'Erialad';

  @override
  String get experience => 'Kogemus';

  @override
  String get qualification => 'Kvalifikatsioon';

  @override
  String get education => 'Haridus';

  @override
  String get recoveryTips =>
      '• Tehke sellest teabest ekraanipilt\n• Hoidke seda turvalises kohas\n• Ärge jagage seda kellegagi\n• Seda kuvatakse ainult üks kord';

  @override
  String get themeSettingsTitle => 'Teema seaded';

  @override
  String get lightThemeLabel => 'Valgus';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tume';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Süsteem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
