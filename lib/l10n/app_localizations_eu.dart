// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get settingsTitle => 'Ezarpenak';

  @override
  String get notificationSettings => 'Jakinarazpenen ezarpenak';

  @override
  String get privacySettings => 'Pribatutasun ezarpenak';

  @override
  String get accountSettings => 'Kontuaren ezarpenak';

  @override
  String get languageSettings => 'Hizkuntza-ezarpenak';

  @override
  String get languageChanged => 'Hizkuntza aldatu da';

  @override
  String get existingUserButton => 'Erabiltzaile bat naiz';

  @override
  String get chooseCountryTitle => 'Aukeratu herrialdea';

  @override
  String get yesText => 'Bai';

  @override
  String get noText => 'Ez';

  @override
  String get appBarTitle => 'Profilaren ezarpenak';

  @override
  String get userIdLabel => 'Erabiltzaile IDa *';

  @override
  String get nameLabel => 'Izena';

  @override
  String get birthCountryLabel => 'Jaioterria';

  @override
  String get birthCityLabel => 'Jaioterria';

  @override
  String get countrySelectionTitle => 'Aukeratu zure herrialdea';

  @override
  String get maleLabel => 'Gizonezkoa';

  @override
  String get femaleLabel => 'Emakumezkoa';

  @override
  String get birthDateLabel => 'Jaiotze data';

  @override
  String get birthDatePlaceholder => 'Hautatu jaiotze data';

  @override
  String get birthTimeLabel => 'Jaiotze ordua';

  @override
  String get birthTimePlaceholder => 'Aukeratu jaiotze ordua';

  @override
  String get saveProfileButton => 'Gorde profila';

  @override
  String get noCitiesFound => 'Ez da hiririk aurkitu';

  @override
  String cityPlaceholder(Object country) {
    return 'Sartu hiria hemen: $country';
  }

  @override
  String get countryFirstPlaceholder => 'Hautatu herrialdea lehenik';

  @override
  String get versionHistoryTitle => 'Bertsioen historia';

  @override
  String get notSetText => 'Ezarri gabe';

  @override
  String nameHistory(Object name) {
    return 'Izena: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Hiria: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Herrialdea: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Generoa: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Jaiotze data: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Jaiotze ordua: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Kokapena: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Ordu-zona: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Estatua: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Eguneratua $date';
  }

  @override
  String get userIdRequired => 'Erabiltzaile IDa beharrezkoa da';

  @override
  String get profileSaved => 'Profila behar bezala gorde da';

  @override
  String get saveFailed => 'Ezin izan da profila gorde';

  @override
  String get errorPrefix => 'Errorea:';

  @override
  String get onboardingChooseLanguage => 'Aukeratu zure hizkuntza';

  @override
  String get onboardingChooseLanguageDesc =>
      'Hautatu nahiago duzun hizkuntza jarraitzeko.';

  @override
  String get onboardingWhatIsAstrology => 'Zer da Astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologia zeruko gorputzen azterketa da...';

  @override
  String get onboardingWhyUseApp => 'Zergatik erabili aplikazio hau?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Lortu horoskopo pertsonalizatuak, eguneroko iragarpenak eta erabaki informatuak hartzeko orientazioa.';

  @override
  String get onboardingHowToUse => 'Nola erabili aplikazio hau?';

  @override
  String get onboardingHowToUseDesc =>
      'Erraz nabigatu, eguneroko horoskopoak kontsultatu eta zure profila kudeatu iragarpen zehatzak lortzeko.';

  @override
  String get onboardingGetStarted => 'Hasi';

  @override
  String get onboardingNewUser => 'Erabiltzaile berria';

  @override
  String get onboardingExistingUser => 'Erabiltzaile zaharra';

  @override
  String get onboardingBack => 'Atzera';

  @override
  String get onboardingNext => 'Hurrengoa';

  @override
  String get userIdNotFound =>
      'Erabiltzaile IDa ez da aurkitu. Mesedez, hasi saioa edo konfiguratu zure profila.';

  @override
  String get clearNotificationsTitle => 'Garbitu jakinarazpenak';

  @override
  String get clearNotificationsMessage =>
      'Ziur zaude jakinarazpen guztiak garbitu nahi dituzula?';

  @override
  String get clearNotificationsSuccess =>
      'Jakinarazpen guztiak behar bezala garbitu dira.';

  @override
  String get clearHoroscopeTitle => 'Horoskopo garbia';

  @override
  String get clearHoroscopeMessage =>
      'Ziur zaude zure horoskopoaren datuak garbitu nahi dituzula?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopoa behar bezala garbitu da.';

  @override
  String get clearChatTitle => 'Garbitu txataren historia';

  @override
  String get clearChatMessage =>
      'Ziur zaude txat-historia guztia ezabatu nahi duzula?';

  @override
  String get clearChatLocal => 'Txata tokian bertan garbitu da.';

  @override
  String get deleteAccountTitle => 'Ezabatu kontua';

  @override
  String get deleteAccountMessage =>
      'Ziur zaude zure kontua ezabatu nahi duzula? Honek zure txat-historia eta jakinarazpen guztiak ere garbituko ditu.';

  @override
  String get deleteAccountSuccess => 'Zure kontua eta datu guztiak kendu dira.';

  @override
  String get deleteAccountError => 'Errorea kontua ezabatzean';

  @override
  String get logoutTitle => 'Saioa itxi';

  @override
  String get logoutMessage => 'Ziur zaude saioa itxi nahi duzula?';

  @override
  String get termsPrivacyTitle => 'Baldintzak eta pribatutasuna';

  @override
  String get privacyPolicyTitle => 'Pribatutasun Politika';

  @override
  String get termsConditionsTitle => 'Baldintzak eta zehaztapenak';

  @override
  String get dataControlTitle => 'Datuen kontrola';

  @override
  String get cancelButton => 'Utzi';

  @override
  String get confirmButton => 'Berretsi';

  @override
  String get clearQuestionsSuccess =>
      'Galdera guztiak behar bezala ezabatu dira.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Jauna';

  @override
  String get startLabel => 'Hasi';

  @override
  String get recoverAccount => 'Berreskuratu kontua';

  @override
  String get endLabel => 'Amaiera';

  @override
  String get startDateLabel => 'Hasiera data';

  @override
  String get endDateLabel => 'Amaiera data';

  @override
  String get notAvailable => 'Ez dago eskuragarri';

  @override
  String get noData => 'Daturik ez';

  @override
  String get unknownError => 'Errore ezezaguna';

  @override
  String get retryButton => 'Saiatu berriro';

  @override
  String get kundaliGeneratorTitle => 'Kundali Sorgailua';

  @override
  String get natalChartTitle => 'Jaiotza-karta';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Goranzko gradua';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Ezezaguna';

  @override
  String get clearHoroscope => 'Horoskopo garbia';

  @override
  String get clearNotifications => 'Garbitu jakinarazpenak';

  @override
  String get clearChatHistory => 'Garbitu txataren historia';

  @override
  String get logout => 'Saioa itxi';

  @override
  String get deleteAccount => 'Ezabatu kontua';

  @override
  String get allFieldsRequired => 'Eremu guztiak bete behar dira.';

  @override
  String get accountRecoveredSuccess => 'Kontua arrakastaz berreskuratu da.';

  @override
  String get recoveryFailed =>
      'Berreskuratzea huts egin du. Egiaztatu zure informazioa.';

  @override
  String get recoverySecretLabel => 'Berreskuratzeko sekretua:';

  @override
  String get aboutUsTitle => 'Guri buruz';

  @override
  String get aboutOurCompany => 'Gure Enpresari Buruz';

  @override
  String get aboutCompanyDescription =>
      'Gure erabiltzaileei astrologia esperientzia onena eskaintzeko konpromisoa dugu.';

  @override
  String get ourMission => 'Gure Misioa';

  @override
  String get missionDescription =>
      'Erabiltzaileei bizitzan erabaki informatuak hartzen laguntzeko astrologia-informazio zehatza eta pertsonalizatua eskaintzea.';

  @override
  String get ourVision => 'Gure ikuspegia';

  @override
  String get visionDescription =>
      'Teknologia eta antzinako jakinduria konbinatuz, astrologia plataforma fidagarriena bihurtzea.';

  @override
  String get ourValues => 'Gure balioak';

  @override
  String get valuesDescription =>
      'Osotasuna, Zehaztasuna, Erabiltzailean Zentratutako Diseinua eta Etengabeko Berrikuntza.';

  @override
  String get contactUs => 'Jarri gurekin harremanetan';

  @override
  String get contactEmail => 'Helbide elektronikoa: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webgunea: www.zureenpresa.com';

  @override
  String get customerSupport => 'Bezeroarentzako Arreta';

  @override
  String get supportHeroTitle => 'Laguntzeko hemen gaude';

  @override
  String get supportHeroDescription =>
      'Bete beheko formularioa eta gure laguntza taldeak ahalik eta azkarren jarriko da zurekin harremanetan.';

  @override
  String get yourName => 'Zure izena';

  @override
  String get yourEmail => 'Zure posta elektronikoa';

  @override
  String get message => 'Mezua';

  @override
  String get enterEmail => 'Sartu zure helbide elektronikoa';

  @override
  String get enterValidEmail => 'Sartu baliozko helbide elektroniko bat';

  @override
  String enterField(Object fieldName) {
    return 'Sartu $fieldName';
  }

  @override
  String get send => 'Bidali';

  @override
  String get sending => 'Bidaltzen...';

  @override
  String get emailSentSuccess => '✅ Mezu elektronikoa behar bezala bidali da!';

  @override
  String get emailSendFailed => '❌ Ezin izan da mezu elektronikoa bidali';

  @override
  String get astroDictionaryTitle => 'Astro Hiztegia';

  @override
  String get searchTermsHint => 'Bilaketa-terminoak...';

  @override
  String get noTermsFound => 'Ez da terminorik aurkitu';

  @override
  String get buyQuestionsTitle => 'Erosketa galderak';

  @override
  String get userNotAuthenticated => 'Erabiltzailea ez dago autentifikatuta';

  @override
  String get loadStoreDataFailed => 'Ezin izan dira dendako datuak kargatu';

  @override
  String get missingAuthToken => 'Baimen-tokena falta da';

  @override
  String get merchantDisplayName => 'Astro Txat Aplikazioa';

  @override
  String get paymentSuccessful =>
      '✅ Ordainketa arrakastatsua! Galdera bidali da';

  @override
  String paymentFailed(Object error) {
    return '❌ Ordainketa huts egin du: $error';
  }

  @override
  String get yourBalance => 'Zure saldoa';

  @override
  String questionsBalance(Object count) {
    return '$count Galderak';
  }

  @override
  String get availableOffers => 'Eskuragarri dauden eskaintzak';

  @override
  String questionsCount(Object count) {
    return '$count Galdera';
  }

  @override
  String get buyButton => 'Erosi';

  @override
  String get dailyHoroscopeTitle => '🌟 Eguneko Horoskopoa';

  @override
  String get userIdMissing => 'Erabiltzaile IDa falta da';

  @override
  String get fetchHoroscopesFailed => 'Ezin izan dira horoskopoak eskuratu';

  @override
  String get noHoroscopeFound => 'Ez da horoskoporik aurkitu.';

  @override
  String get signLabel => 'Sinatu';

  @override
  String get todayLabel => 'Gaur';

  @override
  String get yesterdayLabel => 'Atzo';

  @override
  String get thisWeekLabel => 'Aste honetan';

  @override
  String get lastMonthLabel => 'Aurreko hilabetean';

  @override
  String get chatTitle => 'Txata';

  @override
  String get typeYourQuestionHint => 'Idatzi zure galdera...';

  @override
  String get paymentRequired => 'Ordainketa beharrezkoa';

  @override
  String get paymentRequiredMessage =>
      'Doako galderak erabili dituzu. Ordaindu 50 ₹ jarraitzeko.';

  @override
  String get payNowButton => 'Ordaindu orain';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count galdera libre geratzen dira';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ordainpeko galderak geratzen dira';
  }

  @override
  String get thankYouFeedback => 'Eskerrik asko zure iritziagatik!';

  @override
  String get ratingSubmitted => 'Balorazioa bidali da!';

  @override
  String get setUserIdFirst => 'Mesedez, ezarri zure erabiltzaile IDa lehenik';

  @override
  String get failedToFetchPrevious =>
      'Aurreko galderak eta erantzunak berreskuratzea huts egin da';

  @override
  String errorOccurred(Object error) {
    return 'Errorea: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profila';

  @override
  String get drawerDailyHoroscope => 'Eguneroko Horoskopoa';

  @override
  String get drawerBuyQuestions => 'Erosketa galderak';

  @override
  String get drawerAstroDictionary => 'Astro Hiztegia';

  @override
  String get drawerSettings => 'Ezarpenak';

  @override
  String get drawerCustomerSupport => 'Bezeroarentzako Arreta';

  @override
  String get drawerAbout => 'Buruz';

  @override
  String get drawerProfileSettings => 'Profilaren ezarpenak';

  @override
  String get demoNotificationTitle => '🔔 Demo jakinarazpena';

  @override
  String get demoNotificationBody =>
      'Hau zure aplikazioaren proba-jakinarazpen bat da!';

  @override
  String get notificationsTitle => 'Jakinarazpenak';

  @override
  String get noNotifications => 'Ez dago jakinarazpenik';

  @override
  String get allTab => 'Guztiak';

  @override
  String get markAllAsRead => 'Markatu dena irakurrita bezala';

  @override
  String get notificationMarkedRead =>
      'Irakurritako gisa markatutako jakinarazpena';

  @override
  String get failedToLoadNotifications =>
      'Ezin izan dira jakinarazpenak kargatu';

  @override
  String get failedToMarkRead => 'Irakurritako gisa markatzea huts egin da';

  @override
  String get failedToMarkAllRead =>
      'Huts egin da dena irakurrita bezala markatzean';

  @override
  String get socketConnected => 'Entxufea konektatuta';

  @override
  String get socketDisconnected => 'Entxufea deskonektatuta';

  @override
  String get newNotificationReceived => 'Jakinarazpen berria jaso da';

  @override
  String get generalCategory => 'Orokorra';

  @override
  String get horoscopeCategory => 'Horoskopoa';

  @override
  String get chatCategory => 'Txata';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Eguneraketak';

  @override
  String get howToAskTitle => 'Nola galdetu';

  @override
  String get noQuestionsAvailable => 'Ez dago galderarik eskuragarri';

  @override
  String get failedToLoadQuestions => 'Galderak kargatzea huts egin da';

  @override
  String get pullToRefresh => 'Tira freskatzeko';

  @override
  String get careerCategory => 'Karrera';

  @override
  String get loveCategory => 'Maitasuna eta harremanak';

  @override
  String get healthCategory => 'Osasuna';

  @override
  String get financeCategory => 'Finantzak';

  @override
  String get familyCategory => 'Familia';

  @override
  String get educationCategory => 'Hezkuntza';

  @override
  String get travelCategory => 'Bidaiak';

  @override
  String get spiritualCategory => 'Espirituala';

  @override
  String get profileLoaded => 'Profila behar bezala kargatu da';

  @override
  String get imageUploaded => 'Irudia behar bezala kargatu da';

  @override
  String get savedInformationConfirmation => 'Informazio hau gorde dut';

  @override
  String get noHistoryAvailable => 'Ez dago historiarik eskuragarri';

  @override
  String get missingUserIdError => 'Erabiltzaile IDa beharrezkoa da';

  @override
  String get networkError => 'Sareko errorea. Saiatu berriro.';

  @override
  String get timeoutError => 'Eskaera denbora-muga gainditu da';

  @override
  String get genericError => 'Zerbait gaizki joan da';

  @override
  String get reactionUpdateError => 'Erreakzioa eguneratzea huts egin da';

  @override
  String get noSearchResults => 'Ez da bilaketa-emaitzarik aurkitu';

  @override
  String get clearSearch => 'Garbitu bilaketa';

  @override
  String get resultsFound => 'Emaitzak aurkitu dira';

  @override
  String get recoverySecretHint =>
      'Kopiatu-itsatsi aukerak agian ez du funtzionatuko, idatzi eskuz';

  @override
  String get recoverAccountDescription =>
      'Jarraitu urrats hauek zure kontua berreskuratzeko';

  @override
  String get processingLabel => 'Prozesatzen...';

  @override
  String get clearChatSuccess => 'Txata behar bezala garbitu da';

  @override
  String get notificationsEnabled => 'Jakinarazpenak gaituta';

  @override
  String get notificationsDisabled => 'Jakinarazpenak desgaituta';

  @override
  String get securityNotice =>
      'Zure datuak modu seguruan enkriptatuta eta gordeta daude';

  @override
  String get loading => 'Kargatzen...';

  @override
  String get selectLanguage => 'Hautatu hizkuntza';

  @override
  String get onboardingGetStartedDesc => 'Hasi zure hizkuntza aukeratuz';

  @override
  String get accountRecoveryTitle => '🔐 Kontua berreskuratzeko xehetasunak';

  @override
  String get recoveryInstructions =>
      'Gorde informazio hau modu seguruan. Zure kontua berreskuratzeko beharko duzu.';

  @override
  String get importantNotice => '⚠️ Garrantzitsua:';

  @override
  String get astrologerProfileTitle => 'Astrologoaren profila';

  @override
  String get personalAstrologer => 'Astrologo pertsonala';

  @override
  String get makePersonalAstrologer => 'Egin astrologo pertsonala';

  @override
  String get favoriteDescription =>
      'Zure galderak astrologo honi lehentasuna emango zaizkio. Eskuragarri ez bazaude, beste astrologo kualifikatu batek lagunduko dizu.';

  @override
  String get educationQualifications => 'Hezkuntza eta Tituluak';

  @override
  String get aboutSection => 'Buruz';

  @override
  String get shareProfile => 'Partekatu profila';

  @override
  String get loadingAstrologer => 'Astrologoaren xehetasunak kargatzen...';

  @override
  String get failedToLoadAstrologer =>
      'Astrologoaren xehetasunak kargatzea huts egin du';

  @override
  String get authenticationRequired =>
      'Autentifikazioa beharrezkoa da. Mesedez, hasi saioa.';

  @override
  String securityCheckFailed(Object error) {
    return 'Segurtasun-egiaztapena huts egin du: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name zure Astrologo Pertsonala da orain';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name gogokoetatik kendu da';
  }

  @override
  String get toggleFavoriteError => 'Gogokoen egoera eguneratzea huts egin da';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Hezkuntza: $education\n📜 Titulazioa: $qualification\n⏳ Esperientzia: $experience';
  }

  @override
  String get notProvided => 'Ez da eman';

  @override
  String reviews(Object count) {
    return '($count iritziak)';
  }

  @override
  String get specialties => 'Espezialitateak';

  @override
  String get experience => 'Esperientzia';

  @override
  String get qualification => 'Titulazioa';

  @override
  String get education => 'Hezkuntza';

  @override
  String get recoveryTips =>
      '• Atera informazio honen pantaila-argazki bat\n• Gorde leku seguru batean\n• Ez partekatu inorekin\n• Behin bakarrik erakutsiko da';
}
