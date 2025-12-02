// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get settingsTitle => 'Setări';

  @override
  String get notificationSettings => 'Setări de notificare';

  @override
  String get privacySettings => 'Setări de confidențialitate';

  @override
  String get accountSettings => 'Setările contului';

  @override
  String get languageSettings => 'Setări de limbă';

  @override
  String get languageChanged => 'Limba a fost schimbată';

  @override
  String get existingUserButton => 'Sunt un utilizator existent';

  @override
  String get chooseCountryTitle => 'Alegeți țara';

  @override
  String get yesText => 'Da';

  @override
  String get noText => 'Nu';

  @override
  String get appBarTitle => 'Setări profil';

  @override
  String get userIdLabel => 'ID-ul de utilizator *';

  @override
  String get nameLabel => 'Nume';

  @override
  String get birthCountryLabel => 'Țara de naștere';

  @override
  String get birthCityLabel => 'Orașul nașterii';

  @override
  String get countrySelectionTitle => 'Alege-ți țara';

  @override
  String get maleLabel => 'Bărbat';

  @override
  String get femaleLabel => 'Femeie';

  @override
  String get birthDateLabel => 'Data de naștere';

  @override
  String get birthDatePlaceholder => 'Selectați data nașterii';

  @override
  String get birthTimeLabel => 'Ora nașterii';

  @override
  String get birthTimePlaceholder => 'Selectați ora nașterii';

  @override
  String get saveProfileButton => 'Salvați profilul';

  @override
  String get noCitiesFound => 'Nu s-au găsit orașe';

  @override
  String cityPlaceholder(Object country) {
    return 'Introduceți orașul în $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selectați mai întâi țara';

  @override
  String get versionHistoryTitle => 'Istoricul versiunilor';

  @override
  String get notSetText => 'Nesetat';

  @override
  String nameHistory(Object name) {
    return 'Nume: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Oraș: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Țară: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sex: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data nașterii: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ora nașterii: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Locație: $latitude, $longitude';
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
    return 'Stat: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Actualizat pe $date';
  }

  @override
  String get userIdRequired => 'ID-ul de utilizator este obligatoriu';

  @override
  String get profileSaved => 'Profilul a fost salvat cu succes';

  @override
  String get saveFailed => 'Profilul nu a putut fi salvat.';

  @override
  String get errorPrefix => 'Eroare:';

  @override
  String get onboardingChooseLanguage => 'Alege-ți limba';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selectați limba preferată pentru a continua.';

  @override
  String get onboardingWhatIsAstrology => 'Ce este Astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologia este studiul corpurilor cerești...';

  @override
  String get onboardingWhyUseApp => 'De ce să folosești această aplicație?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Obține horoscop personalizat, predicții zilnice și îndrumări pentru a lua decizii informate.';

  @override
  String get onboardingHowToUse => 'Cum se folosește această aplicație?';

  @override
  String get onboardingHowToUseDesc =>
      'Navighează cu ușurință, verifică horoscopul zilnic și gestionează-ți profilul pentru predicții precise.';

  @override
  String get onboardingGetStarted => 'Începeți';

  @override
  String get onboardingNewUser => 'Utilizator nou';

  @override
  String get onboardingExistingUser => 'Utilizator existent';

  @override
  String get onboardingBack => 'Spate';

  @override
  String get onboardingNext => 'Următorul';

  @override
  String get userIdNotFound =>
      'ID-ul utilizatorului nu a fost găsit. Vă rugăm să vă conectați sau să vă configurați profilul.';

  @override
  String get clearNotificationsTitle => 'Ștergeți notificările';

  @override
  String get clearNotificationsMessage =>
      'Sigur vrei să ștergi toate notificările?';

  @override
  String get clearNotificationsSuccess =>
      'Toate notificările au fost șterse cu succes.';

  @override
  String get clearHoroscopeTitle => 'Horoscop clar';

  @override
  String get clearHoroscopeMessage =>
      'Sigur vrei să ștergi datele horoscopului tău?';

  @override
  String get clearHoroscopeSuccess => 'Horoscop șters cu succes.';

  @override
  String get clearChatTitle => 'Ștergeți istoricul chatului';

  @override
  String get clearChatMessage =>
      'Sigur vrei să ștergi tot istoricul chat-urilor?';

  @override
  String get clearChatLocal => 'Chatul a fost șters local.';

  @override
  String get deleteAccountTitle => 'Șterge contul';

  @override
  String get deleteAccountMessage =>
      'Sigur vrei să-ți ștergi contul? Această acțiune va șterge și tot istoricul chat-urilor și notificările.';

  @override
  String get deleteAccountSuccess =>
      'Contul tău și toate datele au fost eliminate.';

  @override
  String get deleteAccountError => 'Eroare la ștergerea contului';

  @override
  String get logoutTitle => 'Deconectare';

  @override
  String get logoutMessage => 'Sigur vrei să te deconectezi?';

  @override
  String get termsPrivacyTitle => 'Termeni și confidențialitate';

  @override
  String get privacyPolicyTitle => 'Politica de confidențialitate';

  @override
  String get termsConditionsTitle => 'Termeni și condiții';

  @override
  String get dataControlTitle => 'Controlul datelor';

  @override
  String get cancelButton => 'Anula';

  @override
  String get confirmButton => 'Confirma';

  @override
  String get clearQuestionsSuccess =>
      'Toate întrebările au fost șterse cu succes.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Domnul';

  @override
  String get startLabel => 'Început';

  @override
  String get recoverAccount => 'Recuperează contul';

  @override
  String get endLabel => 'Sfârşit';

  @override
  String get startDateLabel => 'Data de începere';

  @override
  String get endDateLabel => 'Data de încheiere';

  @override
  String get notAvailable => 'Nu este disponibil';

  @override
  String get noData => 'Fără date';

  @override
  String get unknownError => 'Eroare necunoscută';

  @override
  String get retryButton => 'Reîncercați';

  @override
  String get kundaliGeneratorTitle => 'Generator Kundali';

  @override
  String get natalChartTitle => 'Harta natală';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rași';

  @override
  String get ascDegreeLabel => 'Grad Ascendent';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get clearHoroscope => 'Horoscop clar';

  @override
  String get clearNotifications => 'Ștergeți notificările';

  @override
  String get clearChatHistory => 'Ștergeți istoricul chatului';

  @override
  String get logout => 'Deconectare';

  @override
  String get deleteAccount => 'Șterge contul';

  @override
  String get allFieldsRequired => 'Toate câmpurile sunt obligatorii.';

  @override
  String get accountRecoveredSuccess => 'Contul a fost recuperat cu succes.';

  @override
  String get recoveryFailed =>
      'Recuperarea a eșuat. Verificați-vă informațiile.';

  @override
  String get recoverySecretLabel => 'Secretul recuperării:';

  @override
  String get aboutUsTitle => 'Despre noi';

  @override
  String get aboutOurCompany => 'Despre compania noastră';

  @override
  String get aboutCompanyDescription =>
      'Ne angajăm să oferim cea mai bună experiență de astrologie utilizatorilor noștri.';

  @override
  String get ourMission => 'Misiunea noastră';

  @override
  String get missionDescription =>
      'Pentru a oferi informații astrologice precise și personalizate, care să ajute utilizatorii să ia decizii informate în viața lor.';

  @override
  String get ourVision => 'Viziunea noastră';

  @override
  String get visionDescription =>
      'Să devenim cea mai de încredere platformă de astrologie, combinând tehnologia și înțelepciunea străveche.';

  @override
  String get ourValues => 'Valorile noastre';

  @override
  String get valuesDescription =>
      'Integritate, Precizie, Design Centrat pe Utilizator și Inovație Continuă.';

  @override
  String get contactUs => 'Contactaţi-ne';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Site web: www.companiatavoastră.com';

  @override
  String get customerSupport => 'Asistență clienți';

  @override
  String get supportHeroTitle => 'Suntem aici pentru a vă ajuta';

  @override
  String get supportHeroDescription =>
      'Completați formularul de mai jos și echipa noastră de asistență vă va răspunde cât mai curând posibil.';

  @override
  String get yourName => 'Numele dumneavoastră';

  @override
  String get yourEmail => 'Adresa dvs. de e-mail';

  @override
  String get message => 'Mesaj';

  @override
  String get enterEmail => 'Introdu adresa ta de e-mail';

  @override
  String get enterValidEmail => 'Introduceți o adresă de e-mail validă';

  @override
  String enterField(Object fieldName) {
    return 'Introduceți $fieldName';
  }

  @override
  String get send => 'Trimite';

  @override
  String get sending => 'Se trimite...';

  @override
  String get emailSentSuccess => '✅ E-mail trimis cu succes!';

  @override
  String get emailSendFailed => '❌ Nu s-a putut trimite e-mailul';

  @override
  String get astroDictionaryTitle => 'Dicționar Astrologic';

  @override
  String get searchTermsHint => 'Termeni de căutare...';

  @override
  String get noTermsFound => 'Nu s-au găsit termeni';

  @override
  String get buyQuestionsTitle => 'Întrebări de cumpărare';

  @override
  String get userNotAuthenticated => 'Utilizator neautentificat';

  @override
  String get loadStoreDataFailed => 'Nu s-au putut încărca datele din magazin';

  @override
  String get missingAuthToken => 'Lipsește jetonul de autentificare';

  @override
  String get merchantDisplayName => 'Aplicația de chat Astro';

  @override
  String get paymentSuccessful => '✅ Plată reușită! Întrebare trimisă';

  @override
  String paymentFailed(Object error) {
    return '❌ Plata a eșuat: $error';
  }

  @override
  String get yourBalance => 'Soldul dumneavoastră';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Oferte disponibile';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Cumpăra';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscop zilnic';

  @override
  String get userIdMissing => 'ID-ul utilizatorului lipsește';

  @override
  String get fetchHoroscopesFailed => 'Horoscopul nu a putut fi preluat';

  @override
  String get noHoroscopeFound => 'Nu s-a găsit niciun horoscop.';

  @override
  String get signLabel => 'Semn';

  @override
  String get todayLabel => 'Astăzi';

  @override
  String get yesterdayLabel => 'Ieri';

  @override
  String get thisWeekLabel => 'În această săptămână';

  @override
  String get lastMonthLabel => 'Luna trecută';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Scrieți întrebarea dvs...';

  @override
  String get paymentRequired => 'Plată necesară';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Ți-ai folosit întrebările gratuite. Plătește 50 ₹ pentru a continua.';
  }

  @override
  String get payNowButton => 'Plătește acum';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count întrebări libere rămase';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count întrebări plătite rămase';
  }

  @override
  String get thankYouFeedback => 'Mulțumesc pentru feedback!';

  @override
  String get ratingSubmitted => 'Evaluare trimisă!';

  @override
  String get setUserIdFirst =>
      'Vă rugăm să setați mai întâi ID-ul de utilizator';

  @override
  String get failedToFetchPrevious =>
      'Nu s-au putut prelua întrebările și răspunsurile anterioare';

  @override
  String errorOccurred(Object error) {
    return 'Eroare: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscop zilnic';

  @override
  String get drawerBuyQuestions => 'Întrebări de cumpărare';

  @override
  String get drawerAstroDictionary => 'Dicționar Astrologic';

  @override
  String get drawerSettings => 'Setări';

  @override
  String get drawerCustomerSupport => 'Asistență clienți';

  @override
  String get drawerAbout => 'Despre';

  @override
  String get drawerProfileSettings => 'Setări profil';

  @override
  String get demoNotificationTitle => '🔔 Notificare demonstrație';

  @override
  String get demoNotificationBody =>
      'Aceasta este o notificare de test de la aplicația ta!';

  @override
  String get notificationsTitle => 'Notificări';

  @override
  String get noNotifications => 'Nicio notificare';

  @override
  String get allTab => 'Toate';

  @override
  String get markAllAsRead => 'Marchează toate ca citite';

  @override
  String get notificationMarkedRead => 'Notificare marcată ca citită';

  @override
  String get failedToLoadNotifications => 'Nu s-au putut încărca notificările';

  @override
  String get failedToMarkRead => 'Marcarea ca citită a eșuat';

  @override
  String get failedToMarkAllRead => 'Nu s-au putut marca toate ca citite';

  @override
  String get socketConnected => 'Priză conectată';

  @override
  String get socketDisconnected => 'Priză deconectată';

  @override
  String get newNotificationReceived => 'Notificare nouă primită';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoscop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Actualizări';

  @override
  String get howToAskTitle => 'Cum să întrebi';

  @override
  String get noQuestionsAvailable => 'Nu sunt disponibile întrebări';

  @override
  String get failedToLoadQuestions => 'Întrebările nu au putut fi încărcate';

  @override
  String get pullToRefresh => 'Trageți pentru a reîmprospăta';

  @override
  String get careerCategory => 'Carieră';

  @override
  String get loveCategory => 'Dragoste și relații';

  @override
  String get healthCategory => 'Sănătate';

  @override
  String get financeCategory => 'Finanţa';

  @override
  String get familyCategory => 'Familial';

  @override
  String get educationCategory => 'Educaţie';

  @override
  String get travelCategory => 'Voiaj';

  @override
  String get spiritualCategory => 'Spiritual';

  @override
  String get profileLoaded => 'Profilul a fost încărcat cu succes';

  @override
  String get imageUploaded => 'Imaginea a fost încărcată cu succes';

  @override
  String get savedInformationConfirmation => 'Am salvat aceste informații';

  @override
  String get noHistoryAvailable => 'Nu este disponibil istoricul';

  @override
  String get missingUserIdError => 'ID-ul de utilizator este obligatoriu';

  @override
  String get networkError => 'Eroare de rețea. Vă rugăm să încercați din nou.';

  @override
  String get timeoutError => 'Solicitarea a expirat';

  @override
  String get genericError => 'Ceva nu a mers bine';

  @override
  String get reactionUpdateError => 'Reacția nu a putut fi actualizată';

  @override
  String get noSearchResults => 'Nu s-au găsit rezultate ale căutării';

  @override
  String get clearSearch => 'Șterge căutarea';

  @override
  String get resultsFound => 'Rezultate găsite';

  @override
  String get recoverySecretHint =>
      'Copiere-lipire s-ar putea să nu funcționeze, tastați manual';

  @override
  String get recoverAccountDescription =>
      'Urmați acești pași pentru a vă recupera contul';

  @override
  String get processingLabel => 'Prelucrare...';

  @override
  String get clearChatSuccess => 'Chatul a fost șters cu succes';

  @override
  String get notificationsEnabled => 'Notificări activate';

  @override
  String get notificationsDisabled => 'Notificări dezactivate';

  @override
  String get securityNotice =>
      'Datele dumneavoastră sunt criptate și stocate în siguranță';

  @override
  String get loading => 'Încărcare...';

  @override
  String get selectLanguage => 'Selectați limba';

  @override
  String get onboardingGetStartedDesc => 'Începeți prin a alege limba';

  @override
  String get accountRecoveryTitle => '🔐 Detalii despre recuperarea contului';

  @override
  String get recoveryInstructions =>
      'Vă rugăm să salvați aceste informații în siguranță. Veți avea nevoie de ele pentru a vă recupera contul.';

  @override
  String get importantNotice => '⚠️ Important:';

  @override
  String get astrologerProfileTitle => 'Profilul astrologului';

  @override
  String get personalAstrologer => 'Astrolog personal';

  @override
  String get makePersonalAstrologer => 'Devino astrolog personal';

  @override
  String get favoriteDescription =>
      'Întrebările dumneavoastră vor fi transmise cu prioritate acestui astrolog. Dacă nu este disponibil, vă va ajuta un alt astrolog calificat.';

  @override
  String get educationQualifications => 'Educație și calificări';

  @override
  String get aboutSection => 'Despre';

  @override
  String get shareProfile => 'Distribuiți profilul';

  @override
  String get loadingAstrologer => 'Se încarcă detaliile astrologului...';

  @override
  String get failedToLoadAstrologer =>
      'Nu s-au putut încărca detaliile astrologului';

  @override
  String get authenticationRequired =>
      'Autentificare necesară. Vă rugăm să vă conectați.';

  @override
  String securityCheckFailed(Object error) {
    return 'Verificarea de securitate a eșuat: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name este acum Astrologul tău Personal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name a fost eliminat din favorite';
  }

  @override
  String get toggleFavoriteError => 'Nu s-a putut actualiza starea favoritelor';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Educație: $education\n📜 Calificare: $qualification\n⏳ Experiență: $experience';
  }

  @override
  String get notProvided => 'Nefurnizat';

  @override
  String reviews(Object count) {
    return '($count recenzii)';
  }

  @override
  String get specialties => 'Specialități';

  @override
  String get experience => 'Experienţă';

  @override
  String get qualification => 'Calificare';

  @override
  String get education => 'Educaţie';

  @override
  String get recoveryTips =>
      '• Faceți o captură de ecran a acestor informații\n• Păstrați-o într-un loc sigur\n• Nu o partajați cu nimeni\n• Aceasta va fi afișată o singură dată';

  @override
  String get themeSettingsTitle => 'Setări temă';

  @override
  String get lightThemeLabel => 'Aprinde';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Întuneric';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
