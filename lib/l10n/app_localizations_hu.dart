// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get notificationSettings => 'Értesítési beállítások';

  @override
  String get privacySettings => 'Adatvédelmi beállítások';

  @override
  String get accountSettings => 'Fiókbeállítások';

  @override
  String get languageSettings => 'Nyelvi beállítások';

  @override
  String get languageChanged => 'Nyelv megváltozott';

  @override
  String get existingUserButton => 'Meglévő felhasználó vagyok';

  @override
  String get chooseCountryTitle => 'Válasszon országot';

  @override
  String get yesText => 'Igen';

  @override
  String get noText => 'Nem';

  @override
  String get appBarTitle => 'Profilbeállítások';

  @override
  String get userIdLabel => 'Felhasználói azonosító *';

  @override
  String get nameLabel => 'Név';

  @override
  String get birthCountryLabel => 'Születési ország';

  @override
  String get birthCityLabel => 'Születési város';

  @override
  String get countrySelectionTitle => 'Válassza ki az országát';

  @override
  String get maleLabel => 'Férfi';

  @override
  String get femaleLabel => 'Női';

  @override
  String get birthDateLabel => 'Születési dátum';

  @override
  String get birthDatePlaceholder => 'Születési dátum kiválasztása';

  @override
  String get birthTimeLabel => 'Születési idő';

  @override
  String get birthTimePlaceholder => 'Születési idő kiválasztása';

  @override
  String get saveProfileButton => 'Profil mentése';

  @override
  String get noCitiesFound => 'Nem található város';

  @override
  String cityPlaceholder(Object country) {
    return 'Adja meg a várost ebben az országban: $country';
  }

  @override
  String get countryFirstPlaceholder => 'Először válasszon országot';

  @override
  String get versionHistoryTitle => 'Verzióelőzmények';

  @override
  String get notSetText => 'Nincs beállítva';

  @override
  String nameHistory(Object name) {
    return 'Név: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Város: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ország: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Nem: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Születési dátum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Születési idő: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Helyszín: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Időzóna: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Nyári idő: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Állam: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Frissítve: $date';
  }

  @override
  String get userIdRequired => 'Felhasználói azonosító megadása kötelező';

  @override
  String get profileSaved => 'Profil sikeresen mentve';

  @override
  String get saveFailed => 'Nem sikerült menteni a profilt';

  @override
  String get errorPrefix => 'Hiba:';

  @override
  String get onboardingChooseLanguage => 'Válassza ki a nyelvét';

  @override
  String get onboardingChooseLanguageDesc =>
      'A folytatáshoz válassza ki a kívánt nyelvet.';

  @override
  String get onboardingWhatIsAstrology => 'Mi az asztrológia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Az asztrológia az égitestek mozgásának és az emberi életre gyakorolt hatásának ősi tanulmányozása, amely betekintést nyújt a személyiségbe, a kapcsolatokba és az élet eseményeibe.';

  @override
  String get onboardingWhyUseApp =>
      'Miért érdemes ezt az alkalmazást használni?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Kapj pontos, ember által generált horoszkópokat és útmutatást, amelyek a születési képletedhez igazodnak. Hozz megalapozott döntéseket napi jóslatokkal és tapasztalt asztrológusok személyre szabott tanácsaival.';

  @override
  String get onboardingHowToUse => 'Hogyan kell használni ezt az alkalmazást?';

  @override
  String get onboardingHowToUseDesc =>
      'Egyszerűen add meg a születési dátumodat, a pontos időpontot, a születési helyet és minden egyéb releváns adatot, hogy azonnal elkezdhesd. Fedezz fel napi horoszkópokat, tegyél fel kérdéseket szakértő asztrológusoknak, és kezeld a profilodat a pontos, személyre szabott előrejelzésekért – bejelentkezés nélkül.';

  @override
  String get onboardingGetStarted => 'Kezdés';

  @override
  String get onboardingNewUser => 'Új felhasználó';

  @override
  String get onboardingExistingUser => 'Meglévő felhasználó';

  @override
  String get onboardingBack => 'Vissza';

  @override
  String get onboardingNext => 'Következő';

  @override
  String get userIdNotFound =>
      'Felhasználói azonosító nem található. Kérjük, jelentkezzen be, vagy állítsa be a profilját.';

  @override
  String get clearNotificationsTitle => 'Értesítések törlése';

  @override
  String get clearNotificationsMessage =>
      'Biztosan törölni szeretné az összes értesítést?';

  @override
  String get clearNotificationsSuccess => 'Minden értesítés sikeresen törölve.';

  @override
  String get clearHoroscopeTitle => 'Tiszta horoszkóp';

  @override
  String get clearHoroscopeMessage =>
      'Biztosan törölni szeretnéd a horoszkópadataidat?';

  @override
  String get clearHoroscopeSuccess => 'Horoszkóp sikeresen törölve.';

  @override
  String get clearChatTitle => 'Csevegési előzmények törlése';

  @override
  String get clearChatMessage =>
      'Biztosan törölni szeretnéd az összes csevegési előzményedet?';

  @override
  String get clearChatLocal => 'A csevegés helyben törölve.';

  @override
  String get deleteAccountTitle => 'Fiók törlése';

  @override
  String get deleteAccountMessage =>
      'Biztosan törölni szeretnéd a fiókodat? Ezzel a csevegési előzményeidet és az értesítéseidet is törlöd.';

  @override
  String get deleteAccountSuccess =>
      'A fiókját és az összes adatát eltávolítottuk.';

  @override
  String get deleteAccountError => 'Hiba a fiók törlésekor';

  @override
  String get logoutTitle => 'Kijelentkezés';

  @override
  String get logoutMessage => 'Biztosan kijelentkezni szeretne?';

  @override
  String get termsPrivacyTitle => 'Felhasználási feltételek és adatvédelem';

  @override
  String get privacyPolicyTitle => 'Adatvédelmi irányelvek';

  @override
  String get termsConditionsTitle => 'Felhasználási feltételek';

  @override
  String get dataControlTitle => 'Adatkezelés';

  @override
  String get cancelButton => 'Mégsem';

  @override
  String get confirmButton => 'Megerősítés';

  @override
  String get clearQuestionsSuccess => 'Minden kérdés sikeresen törölve.';

  @override
  String get yoginiLabel => 'Jógini';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Indul';

  @override
  String get recoverAccount => 'Fiók helyreállítása';

  @override
  String get endLabel => 'Vége';

  @override
  String get startDateLabel => 'Kezdő dátum';

  @override
  String get endDateLabel => 'Befejezési dátum';

  @override
  String get notAvailable => 'Nem elérhető';

  @override
  String get noData => 'Nincsenek adatok';

  @override
  String get unknownError => 'Ismeretlen hiba';

  @override
  String get retryButton => 'Újrapróbálkozás';

  @override
  String get kundaliGeneratorTitle => 'Kundali generátor';

  @override
  String get natalChartTitle => 'Születési képlet';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rási';

  @override
  String get ascDegreeLabel => 'Felemelkedő fokozat';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dása';

  @override
  String get yoginiDashaTitle => 'Jogini Dása';

  @override
  String get unknown => 'Ismeretlen';

  @override
  String get clearHoroscope => 'Tiszta horoszkóp';

  @override
  String get clearNotifications => 'Értesítések törlése';

  @override
  String get clearChatHistory => 'Csevegési előzmények törlése';

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get deleteAccount => 'Fiók törlése';

  @override
  String get allFieldsRequired => 'Minden mező kitöltése kötelező.';

  @override
  String get accountRecoveredSuccess => 'Fiók sikeresen helyreállítva.';

  @override
  String get recoveryFailed =>
      'A helyreállítás sikertelen. Ellenőrizze az adatait.';

  @override
  String get recoverySecretLabel => 'Helyreállítási titok:';

  @override
  String get aboutUsTitle => 'Rólunk';

  @override
  String get aboutOurCompany => 'Cégünkről';

  @override
  String get aboutCompanyDescription =>
      'A Karmánál segítünk felfedezni az igazi életutad a védikus asztrológia időtlen bölcsességén keresztül. Minden meglátás valódi, tapasztalt asztrológusoktól származik, gondosan kidolgozva az egyedi születési képleted alapján. A napi horoszkópoktól a személyre szabott útmutatásig a Karma több mint 100 nyelven teszi elérhetővé az ősi tudást.';

  @override
  String get ourMission => 'Küldetésünk';

  @override
  String get missionDescription =>
      'Küldetésünk egyszerű: hiteles, ember által vezetett asztrológiai útmutatást nyújtani, amely képessé tesz arra, hogy magabiztos, megalapozott döntéseket hozzon. Minden jóslat és konzultáció több éves szakmai tapasztalatot tükröz, nem pedig automatizált algoritmusokat.';

  @override
  String get ourVision => 'Víziónk';

  @override
  String get visionDescription =>
      'Arra törekszünk, hogy a világ legmegbízhatóbb védikus asztrológiai platformja legyünk, segítve az embereket mindenhol abban, hogy tisztán és magabiztosan megértsék önmagukat, választásaikat és életútjukat.';

  @override
  String get ourValues => 'Értékeink';

  @override
  String get valuesDescription =>
      'A Karmánál nagyra értékeljük a hitelességet, a precizitást és a bizalmat. Elkötelezettek vagyunk amellett, hogy olyan útmutatást nyújtsunk, amely nemcsak pontos, hanem értelmes is, segítve Önt abban, hogy betekintéssel és magabiztosan navigáljon az életben.';

  @override
  String get contactUs => 'Kapcsolat';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Weboldal: www.yourcompany.com';

  @override
  String get customerSupport => 'Ügyfélszolgálat';

  @override
  String get supportHeroTitle => 'Segítünk';

  @override
  String get supportHeroDescription =>
      'Töltse ki az alábbi űrlapot, és ügyfélszolgálatunk a lehető leghamarabb felveszi Önnel a kapcsolatot.';

  @override
  String get yourName => 'A neved';

  @override
  String get yourEmail => 'Az Ön e-mail címe';

  @override
  String get message => 'Üzenet';

  @override
  String get enterEmail => 'Add meg az e-mail címed';

  @override
  String get enterValidEmail => 'Adjon meg egy érvényes e-mail címet';

  @override
  String enterField(Object fieldName) {
    return 'Írja be a $fieldName mezőt.';
  }

  @override
  String get send => 'Elküld';

  @override
  String get sending => 'Küldés...';

  @override
  String get emailSentSuccess => '✅ E-mail sikeresen elküldve!';

  @override
  String get emailSendFailed => '❌ Nem sikerült elküldeni az e-mailt';

  @override
  String get astroDictionaryTitle => 'Asztro szótár';

  @override
  String get searchTermsHint => 'Keresési kifejezések...';

  @override
  String get noTermsFound => 'Nem található kifejezés';

  @override
  String get buyQuestionsTitle => 'Vásárlási kérdések';

  @override
  String get userNotAuthenticated => 'A felhasználó nincs hitelesítve';

  @override
  String get loadStoreDataFailed => 'Nem sikerült betölteni az áruház adatait';

  @override
  String get missingAuthToken => 'Hiányzó hitelesítési token';

  @override
  String get merchantDisplayName => 'Astro Chat alkalmazás';

  @override
  String get paymentSuccessful => '✅ Sikeres fizetés! Kérdés elküldve';

  @override
  String paymentFailed(Object error) {
    return '❌ Fizetés sikertelen: $error';
  }

  @override
  String get yourBalance => 'Az egyenleged';

  @override
  String questionsBalance(Object count) {
    return '$count Kérdések';
  }

  @override
  String get availableOffers => 'Elérhető ajánlatok';

  @override
  String questionsCount(Object count) {
    return '$count Kérdés';
  }

  @override
  String get buyButton => 'Vétel';

  @override
  String get dailyHoroscopeTitle => '🌟 Napi horoszkóp';

  @override
  String get userIdMissing => 'Hiányzik a felhasználói azonosító';

  @override
  String get fetchHoroscopesFailed => 'Nem sikerült lekérni a horoszkópokat';

  @override
  String get noHoroscopeFound => 'Nem található horoszkóp.';

  @override
  String get signLabel => 'Jel';

  @override
  String get todayLabel => 'Ma';

  @override
  String get yesterdayLabel => 'Tegnap';

  @override
  String get thisWeekLabel => 'Ez a hét';

  @override
  String get lastMonthLabel => 'Múlt hónap';

  @override
  String get chatTitle => 'Csevegés';

  @override
  String get typeYourQuestionHint => 'Írd be a kérdésedet...';

  @override
  String get paymentRequired => 'Fizetés szükséges';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Felhasználtad az ingyenes kérdéseidet. Fizess $amount összeget a folytatáshoz.';
  }

  @override
  String get payNowButton => 'Fizessen most';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count szabad kérdés maradt';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count fizetős kérdés maradt';
  }

  @override
  String get thankYouFeedback => 'Köszönjük a visszajelzését!';

  @override
  String get ratingSubmitted => 'Értékelés elküldve!';

  @override
  String get setUserIdFirst =>
      'Kérjük, először állítsa be a felhasználói azonosítóját';

  @override
  String get failedToFetchPrevious =>
      'Nem sikerült lekérni a korábbi kérdéseket és válaszokat';

  @override
  String errorOccurred(Object error) {
    return 'Hiba: $error';
  }

  @override
  String get drawerAstroProfile => 'Asztro profil';

  @override
  String get drawerDailyHoroscope => 'Napi horoszkóp';

  @override
  String get drawerBuyQuestions => 'Vásárlási kérdések';

  @override
  String get drawerAstroDictionary => 'Asztro szótár';

  @override
  String get drawerSettings => 'Beállítások';

  @override
  String get drawerCustomerSupport => 'Ügyfélszolgálat';

  @override
  String get drawerAbout => 'Körülbelül';

  @override
  String get drawerProfileSettings => 'Profilbeállítások';

  @override
  String get demoNotificationTitle => '🔔 Demó értesítés';

  @override
  String get demoNotificationBody =>
      'Ez egy tesztértesítés az alkalmazásodtól!';

  @override
  String get notificationsTitle => 'Értesítések';

  @override
  String get noNotifications => 'Nincsenek értesítések';

  @override
  String get allTab => 'Minden';

  @override
  String get markAllAsRead => 'Összes megjelölése olvasottként';

  @override
  String get notificationMarkedRead => 'Értesítés megjelölve olvasottként';

  @override
  String get failedToLoadNotifications =>
      'Nem sikerült betölteni az értesítéseket';

  @override
  String get failedToMarkRead => 'Nem sikerült olvasottként megjelölni';

  @override
  String get failedToMarkAllRead =>
      'Nem sikerült az összeset olvasottként megjelölni';

  @override
  String get socketConnected => 'Aljzat csatlakoztatva';

  @override
  String get socketDisconnected => 'Aljzat leválasztva';

  @override
  String get newNotificationReceived => 'Új értesítés érkezett';

  @override
  String get generalCategory => 'Általános';

  @override
  String get horoscopeCategory => 'Horoszkóp';

  @override
  String get chatCategory => 'Csevegés';

  @override
  String get systemCategory => 'Rendszer';

  @override
  String get updateCategory => 'Frissítések';

  @override
  String get howToAskTitle => 'Hogyan kérdezzünk';

  @override
  String get noQuestionsAvailable => 'Nincsenek elérhető kérdések';

  @override
  String get failedToLoadQuestions => 'Nem sikerült betölteni a kérdéseket';

  @override
  String get pullToRefresh => 'Húzza a frissítéshez';

  @override
  String get careerCategory => 'Karrier';

  @override
  String get loveCategory => 'Szerelem és kapcsolatok';

  @override
  String get healthCategory => 'Egészség';

  @override
  String get financeCategory => 'Pénzügy';

  @override
  String get familyCategory => 'Család';

  @override
  String get educationCategory => 'Oktatás';

  @override
  String get travelCategory => 'Utazási';

  @override
  String get spiritualCategory => 'Lelki';

  @override
  String get profileLoaded => 'Profil sikeresen betöltve';

  @override
  String get imageUploaded => 'Kép feltöltése sikeresen';

  @override
  String get savedInformationConfirmation => 'Elmentettem ezt az információt';

  @override
  String get noHistoryAvailable => 'Nincsenek elérhető előzmények';

  @override
  String get missingUserIdError => 'Felhasználói azonosító megadása kötelező';

  @override
  String get networkError => 'Hálózati hiba. Kérjük, próbálja újra.';

  @override
  String get timeoutError => 'A kérés időtúllépést szenvedett';

  @override
  String get genericError => 'Valami rosszul sült el';

  @override
  String get reactionUpdateError => 'Nem sikerült frissíteni a reakciót';

  @override
  String get noSearchResults => 'Nincsenek keresési eredmények';

  @override
  String get clearSearch => 'Keresés törlése';

  @override
  String get resultsFound => 'Találatok';

  @override
  String get recoverySecretHint =>
      'A másolás-beillesztés nem biztos, hogy működik, gépelj be kézzel';

  @override
  String get recoverAccountDescription =>
      'Kövesse ezeket a lépéseket fiókja helyreállításához';

  @override
  String get processingLabel => 'Feldolgozás...';

  @override
  String get clearChatSuccess => 'Csevegés sikeresen törölve';

  @override
  String get notificationsEnabled => 'Értesítések engedélyezve';

  @override
  String get notificationsDisabled => 'Értesítések letiltva';

  @override
  String get securityNotice =>
      'Az adatait biztonságosan titkosítjuk és tároljuk';

  @override
  String get loading => 'Terhelés...';

  @override
  String get selectLanguage => 'Nyelv kiválasztása';

  @override
  String get onboardingGetStartedDesc => 'Kezdje a nyelv kiválasztásával';

  @override
  String get accountRecoveryTitle => '🔐 Fiók-helyreállítási részletek';

  @override
  String get recoveryInstructions =>
      'Kérjük, őrizze meg ezeket az információkat biztonságosan. Szüksége lesz rájuk fiókja helyreállításához.';

  @override
  String get importantNotice => '⚠️ Fontos:';

  @override
  String get astrologerProfileTitle => 'Asztrológus profilja';

  @override
  String get personalAstrologer => 'Személyes asztrológus';

  @override
  String get makePersonalAstrologer => 'Személyes asztrológus létrehozása';

  @override
  String get favoriteDescription =>
      'Kérdéseidet ez az asztrológus fogja elsőbbséggel intézni. Ha nem elérhető, egy másik képzett asztrológus fog segíteni.';

  @override
  String get educationQualifications => 'Oktatás és képesítések';

  @override
  String get aboutSection => 'Körülbelül';

  @override
  String get shareProfile => 'Profil megosztása';

  @override
  String get loadingAstrologer => 'Asztrológus adatainak betöltése...';

  @override
  String get failedToLoadAstrologer =>
      'Nem sikerült betölteni az asztrológus adatait';

  @override
  String get authenticationRequired =>
      'Hitelesítés szükséges. Kérjük, jelentkezzen be.';

  @override
  String securityCheckFailed(Object error) {
    return 'Biztonsági ellenőrzés sikertelen: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name mostantól a személyes asztrológusod';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Eltávolította a(z) $name elemet a kedvencek közül';
  }

  @override
  String get toggleFavoriteError =>
      'Nem sikerült frissíteni a kedvenc állapotot';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Végzettség: $education\n📜 Végzettség: $qualification\n⏳ Tapasztalat: $experience';
  }

  @override
  String get notProvided => 'Nincs megadva';

  @override
  String reviews(Object count) {
    return '($count értékelés)';
  }

  @override
  String get specialties => 'Specialitások';

  @override
  String get experience => 'Tapasztalat';

  @override
  String get qualification => 'Képesítés';

  @override
  String get education => 'Oktatás';

  @override
  String get recoveryTips =>
      '• Készítsen képernyőképet erről az információról\n• Tárolja biztonságos helyen\n• Ne ossza meg senkivel\n• Ez csak egyszer jelenik meg';

  @override
  String get themeSettingsTitle => 'Témabeállítások';

  @override
  String get lightThemeLabel => 'Fény';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Sötét';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Rendszer';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Csapatunk';

  @override
  String get teamDescription =>
      'Professzionális védikus asztrológusokból álló csapatunk több éves tapasztalattal rendelkezik a bolygóhatások és az életminták értelmezésében. Elkötelezett támogató és fejlesztő csapatunk támogatásával a Karma zökkenőmentes, megbízható és globális élményt nyújt minden felhasználó számára.';
}
