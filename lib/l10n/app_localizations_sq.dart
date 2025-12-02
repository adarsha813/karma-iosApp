// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get settingsTitle => 'Cilësimet';

  @override
  String get notificationSettings => 'Cilësimet e njoftimeve';

  @override
  String get privacySettings => 'Cilësimet e privatësisë';

  @override
  String get accountSettings => 'Cilësimet e llogarisë';

  @override
  String get languageSettings => 'Cilësimet e gjuhës';

  @override
  String get languageChanged => 'Gjuha ndryshoi';

  @override
  String get existingUserButton => 'Unë jam një përdorues ekzistues';

  @override
  String get chooseCountryTitle => 'Zgjidh Vendin';

  @override
  String get yesText => 'Po';

  @override
  String get noText => 'Jo';

  @override
  String get appBarTitle => 'Cilësimet e profilit';

  @override
  String get userIdLabel => 'ID e përdoruesit *';

  @override
  String get nameLabel => 'Emri';

  @override
  String get birthCountryLabel => 'Vendi i lindjes';

  @override
  String get birthCityLabel => 'Qyteti i lindjes';

  @override
  String get countrySelectionTitle => 'Zgjidhni vendin tuaj';

  @override
  String get maleLabel => 'Mashkull';

  @override
  String get femaleLabel => 'Femër';

  @override
  String get birthDateLabel => 'Data e lindjes';

  @override
  String get birthDatePlaceholder => 'Zgjidhni datën e lindjes';

  @override
  String get birthTimeLabel => 'Ora e Lindjes';

  @override
  String get birthTimePlaceholder => 'Zgjidhni Kohën e Lindjes';

  @override
  String get saveProfileButton => 'Ruaj Profilin';

  @override
  String get noCitiesFound => 'Nuk u gjetën qytete';

  @override
  String cityPlaceholder(Object country) {
    return 'Shkruani qytetin në $country';
  }

  @override
  String get countryFirstPlaceholder => 'Zgjidhni vendin së pari';

  @override
  String get versionHistoryTitle => 'Historiku i Versioneve';

  @override
  String get notSetText => 'Nuk është vendosur';

  @override
  String nameHistory(Object name) {
    return 'Emri: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Qyteti: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Vendi: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gjinia: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data e lindjes: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ora e Lindjes: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Vendndodhja: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zona kohore: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Gjendja: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Përditësuar më $date';
  }

  @override
  String get userIdRequired => 'Kërkohet ID-ja e përdoruesit';

  @override
  String get profileSaved => 'Profili u ruajt me sukses';

  @override
  String get saveFailed => 'Ruajtja e profilit dështoi';

  @override
  String get errorPrefix => 'Gabim:';

  @override
  String get onboardingChooseLanguage => 'Zgjidhni gjuhën tuaj';

  @override
  String get onboardingChooseLanguageDesc =>
      'Zgjidhni gjuhën tuaj të preferuar për të vazhduar.';

  @override
  String get onboardingWhatIsAstrology => 'Çfarë është Astrologjia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologjia është studimi i trupave qiellorë...';

  @override
  String get onboardingWhyUseApp => 'Pse ta përdorni këtë aplikacion?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Merrni horoskopë të personalizuar, parashikime ditore dhe udhëzime për të marrë vendime të informuara.';

  @override
  String get onboardingHowToUse => 'Si ta përdorni këtë aplikacion?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigoni lehtësisht, kontrolloni horoskopët ditorë dhe menaxhoni profilin tuaj për parashikime të sakta.';

  @override
  String get onboardingGetStarted => 'Filloni';

  @override
  String get onboardingNewUser => 'Përdorues i Ri';

  @override
  String get onboardingExistingUser => 'Përdorues ekzistues';

  @override
  String get onboardingBack => 'Mbrapa';

  @override
  String get onboardingNext => 'Tjetra';

  @override
  String get userIdNotFound =>
      'ID-ja e përdoruesit nuk u gjet. Ju lutemi identifikoheni ose caktoni profilin tuaj.';

  @override
  String get clearNotificationsTitle => 'Fshij njoftimet';

  @override
  String get clearNotificationsMessage =>
      'Je i sigurt që dëshiron të fshish të gjitha njoftimet?';

  @override
  String get clearNotificationsSuccess =>
      'Të gjitha njoftimet u fshinë me sukses.';

  @override
  String get clearHoroscopeTitle => 'Horoskop i Qartë';

  @override
  String get clearHoroscopeMessage =>
      'Je i sigurt që dëshiron të fshish të dhënat e horoskopit tënd?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopi u fshi me sukses.';

  @override
  String get clearChatTitle => 'Fshij Historikun e Bisedave';

  @override
  String get clearChatMessage =>
      'Je i sigurt që dëshiron të fshish të gjithë historikun tënd të bisedave?';

  @override
  String get clearChatLocal => 'Biseda u fshi lokalisht.';

  @override
  String get deleteAccountTitle => 'Fshij llogarinë';

  @override
  String get deleteAccountMessage =>
      'Je i sigurt që dëshiron ta fshish llogarinë tënde? Kjo do të fshijë gjithashtu të gjithë historikun e bisedave dhe njoftimet e tua.';

  @override
  String get deleteAccountSuccess =>
      'Llogaria juaj dhe të gjitha të dhënat janë hequr.';

  @override
  String get deleteAccountError =>
      'Gabim gjatë fshirjes së llogarisë gjatë fshirjes së saj. Llogaria u fshi në gabim.';

  @override
  String get logoutTitle => 'Dilni';

  @override
  String get logoutMessage => 'Je i sigurt që dëshiron të dalësh?';

  @override
  String get termsPrivacyTitle => 'Kushtet dhe Privatësia';

  @override
  String get privacyPolicyTitle => 'Politika e Privatësisë';

  @override
  String get termsConditionsTitle => 'Kushtet dhe Rregullat';

  @override
  String get dataControlTitle => 'Kontrolli i të Dhënave';

  @override
  String get cancelButton => 'Anulo';

  @override
  String get confirmButton => 'Konfirmo';

  @override
  String get clearQuestionsSuccess => 'Të gjitha pyetjet u fshinë me sukses.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Zot';

  @override
  String get startLabel => 'Filloni';

  @override
  String get recoverAccount => 'Rikuperimi i llogarisë';

  @override
  String get endLabel => 'Fund';

  @override
  String get startDateLabel => 'Data e fillimit';

  @override
  String get endDateLabel => 'Data e përfundimit';

  @override
  String get notAvailable => 'Nuk është i disponueshëm';

  @override
  String get noData => 'Pa të dhëna';

  @override
  String get unknownError => 'Gabim i panjohur';

  @override
  String get retryButton => 'Riprovo';

  @override
  String get kundaliGeneratorTitle => 'Gjeneratori Kundali';

  @override
  String get natalChartTitle => 'Karta e Lindjes';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Shkalla Ascendent';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'I panjohur';

  @override
  String get clearHoroscope => 'Horoskop i Qartë';

  @override
  String get clearNotifications => 'Fshij njoftimet';

  @override
  String get clearChatHistory => 'Fshij Historikun e Bisedave';

  @override
  String get logout => 'Dilni';

  @override
  String get deleteAccount => 'Fshij llogarinë';

  @override
  String get allFieldsRequired => 'Të gjitha fushat janë të detyrueshme.';

  @override
  String get accountRecoveredSuccess => 'Llogaria u rikuperua me sukses.';

  @override
  String get recoveryFailed =>
      'Rikuperimi dështoi. Kontrolloni informacionin tuaj.';

  @override
  String get recoverySecretLabel => 'Sekreti i Rimëkëmbjes:';

  @override
  String get aboutUsTitle => 'Rreth Nesh';

  @override
  String get aboutOurCompany => 'Rreth Kompanisë Sonë';

  @override
  String get aboutCompanyDescription =>
      'Ne jemi të përkushtuar t\'u ofrojmë përdoruesve tanë përvojën më të mirë astrologjike.';

  @override
  String get ourMission => 'Misioni ynë';

  @override
  String get missionDescription =>
      'Për të ofruar njohuri të sakta dhe të personalizuara astrologjike për të ndihmuar përdoruesit të marrin vendime të informuara në jetën e tyre.';

  @override
  String get ourVision => 'Vizioni ynë';

  @override
  String get visionDescription =>
      'Të bëhet platforma më e besueshme e astrologjisë, duke kombinuar teknologjinë dhe mençurinë e lashtë.';

  @override
  String get ourValues => 'Vlerat tona';

  @override
  String get valuesDescription =>
      'Integritet, Saktësi, Dizajn i Përqendruar te Përdoruesi dhe Inovacion i Vazhdueshëm.';

  @override
  String get contactUs => 'Na Kontaktoni';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Uebfaqe: www.kompaniajuaj.com';

  @override
  String get customerSupport => 'Ndihma për klientët';

  @override
  String get supportHeroTitle => 'Ne jemi këtu për të ndihmuar';

  @override
  String get supportHeroDescription =>
      'Plotësoni formularin më poshtë dhe ekipi ynë i mbështetjes do t\'ju kontaktojë sa më shpejt të jetë e mundur.';

  @override
  String get yourName => 'Emri Juaj';

  @override
  String get yourEmail => 'Email-i juaj';

  @override
  String get message => 'Mesazh';

  @override
  String get enterEmail => 'Fut email-in tënd';

  @override
  String get enterValidEmail => 'Fut një adresë të vlefshme email-i';

  @override
  String enterField(Object fieldName) {
    return 'Shkruani $fieldName';
  }

  @override
  String get send => 'Dërgo';

  @override
  String get sending => 'Duke dërguar...';

  @override
  String get emailSentSuccess => '✅ Email-i u dërgua me sukses!';

  @override
  String get emailSendFailed => '❌ Dështoi në dërgimin e email-it';

  @override
  String get astroDictionaryTitle => 'Fjalor Astro';

  @override
  String get searchTermsHint => 'Termat e kërkimit...';

  @override
  String get noTermsFound => 'Nuk u gjetën terma';

  @override
  String get buyQuestionsTitle => 'Pyetje për blerjen';

  @override
  String get userNotAuthenticated => 'Përdoruesi nuk është autentifikuar';

  @override
  String get loadStoreDataFailed =>
      'Dështoi në ngarkimin e të dhënave të dyqanit';

  @override
  String get missingAuthToken => 'Mungon tokeni i autorizimit';

  @override
  String get merchantDisplayName => 'Aplikacioni Astro Chat';

  @override
  String get paymentSuccessful => '✅ Pagesa u krye me sukses! Pyetja u dërgua!';

  @override
  String paymentFailed(Object error) {
    return '❌ Pagesa dështoi: $error';
  }

  @override
  String get yourBalance => 'Bilanci juaj';

  @override
  String questionsBalance(Object count) {
    return '$count Pyetje';
  }

  @override
  String get availableOffers => 'Ofertat e disponueshme';

  @override
  String questionsCount(Object count) {
    return '$count Pyetje';
  }

  @override
  String get buyButton => 'Bli';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoskopi i përditshëm';

  @override
  String get userIdMissing => 'ID-ja e përdoruesit mungon';

  @override
  String get fetchHoroscopesFailed => 'Horoskopët dështuan në marrjen e tyre';

  @override
  String get noHoroscopeFound => 'Nuk u gjet horoskop.';

  @override
  String get signLabel => 'Shenjë';

  @override
  String get todayLabel => 'Sot';

  @override
  String get yesterdayLabel => 'Dje';

  @override
  String get thisWeekLabel => 'Këtë javë';

  @override
  String get lastMonthLabel => 'Muajin e kaluar';

  @override
  String get chatTitle => 'Bisedë';

  @override
  String get typeYourQuestionHint => 'Shkruani pyetjen tuaj...';

  @override
  String get paymentRequired => 'Pagesa e kërkuar';

  @override
  String get paymentRequiredMessage =>
      'I ke përdorur pyetjet falas. Paguaj ₹50 për të vazhduar.';

  @override
  String get payNowButton => 'Paguaj Tani';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count pyetje falas të mbetura';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pyetje me pagesë të mbetura';
  }

  @override
  String get thankYouFeedback => 'Faleminderit për reagimet tuaja!';

  @override
  String get ratingSubmitted => 'Vlerësimi u dorëzua!';

  @override
  String get setUserIdFirst =>
      'Ju lutemi vendosni së pari ID-në tuaj të përdoruesit';

  @override
  String get failedToFetchPrevious =>
      'Dështoi në marrjen e pyetjeve dhe përgjigjeve të mëparshme';

  @override
  String errorOccurred(Object error) {
    return 'Gabim: $error';
  }

  @override
  String get drawerAstroProfile => 'Profili i Astros';

  @override
  String get drawerDailyHoroscope => 'Horoskopi i përditshëm';

  @override
  String get drawerBuyQuestions => 'Pyetje për blerjen';

  @override
  String get drawerAstroDictionary => 'Fjalor Astro';

  @override
  String get drawerSettings => 'Cilësimet';

  @override
  String get drawerCustomerSupport => 'Ndihma për klientët';

  @override
  String get drawerAbout => 'Rreth';

  @override
  String get drawerProfileSettings => 'Cilësimet e profilit';

  @override
  String get demoNotificationTitle => '🔔 Njoftim Demo';

  @override
  String get demoNotificationBody =>
      'Ky është një njoftim provë nga aplikacioni juaj!';

  @override
  String get notificationsTitle => 'Njoftime';

  @override
  String get noNotifications => 'Asnjë njoftim';

  @override
  String get allTab => 'Të gjitha';

  @override
  String get markAllAsRead => 'Shëno të gjitha si të lexuara';

  @override
  String get notificationMarkedRead => 'Njoftimi u shënua si i lexuar';

  @override
  String get failedToLoadNotifications => 'Ngarkimi i njoftimeve dështoi';

  @override
  String get failedToMarkRead => 'Shënimi si i lexuar dështoi';

  @override
  String get failedToMarkAllRead =>
      'Shënimi i të gjithave si të lexuara dështoi';

  @override
  String get socketConnected => 'Soketa e lidhur';

  @override
  String get socketDisconnected => 'Priza u shkëput';

  @override
  String get newNotificationReceived => 'Njoftim i ri u mor';

  @override
  String get generalCategory => 'Gjeneral';

  @override
  String get horoscopeCategory => 'Horoskopi';

  @override
  String get chatCategory => 'Bisedë';

  @override
  String get systemCategory => 'Sistemi';

  @override
  String get updateCategory => 'Përditësime';

  @override
  String get howToAskTitle => 'Si të pyesësh';

  @override
  String get noQuestionsAvailable => 'Nuk ka pyetje në dispozicion';

  @override
  String get failedToLoadQuestions => 'Ngarkimi i pyetjeve dështoi';

  @override
  String get pullToRefresh => 'Tërhiq për të rifreskuar';

  @override
  String get careerCategory => 'Karriera';

  @override
  String get loveCategory => 'Dashuri dhe Marrëdhënie';

  @override
  String get healthCategory => 'Shëndetësia';

  @override
  String get financeCategory => 'Financë';

  @override
  String get familyCategory => 'Familja';

  @override
  String get educationCategory => 'Arsimi';

  @override
  String get travelCategory => 'Udhëtim';

  @override
  String get spiritualCategory => 'Shpirtërore';

  @override
  String get profileLoaded => 'Profili u ngarkua me sukses.';

  @override
  String get imageUploaded => 'Imazhi u ngarkua me sukses.';

  @override
  String get savedInformationConfirmation => 'E kam ruajtur këtë informacion';

  @override
  String get noHistoryAvailable => 'Nuk ka histori të disponueshme';

  @override
  String get missingUserIdError => 'Kërkohet ID-ja e përdoruesit';

  @override
  String get networkError => 'Gabim rrjeti. Ju lutemi provoni përsëri.';

  @override
  String get timeoutError => 'Kërkesa skadoi';

  @override
  String get genericError => 'Diçka shkoi keq';

  @override
  String get reactionUpdateError => 'Reagimi nuk u përditësua';

  @override
  String get noSearchResults => 'Nuk u gjetën rezultate kërkimi';

  @override
  String get clearSearch => 'Pastro kërkimin';

  @override
  String get resultsFound => 'Rezultatet e gjetura';

  @override
  String get recoverySecretHint =>
      'Kopjimi dhe ngjitja mund të mos funksionojnë, shkruani manualisht';

  @override
  String get recoverAccountDescription =>
      'Ndiqni këto hapa për të rikuperuar llogarinë tuaj';

  @override
  String get processingLabel => 'Duke u përpunuar...';

  @override
  String get clearChatSuccess => 'Biseda u pastrua me sukses.';

  @override
  String get notificationsEnabled => 'Njoftimet u aktivizuan';

  @override
  String get notificationsDisabled => 'Njoftimet u çaktivizuan';

  @override
  String get securityNotice =>
      'Të dhënat tuaja janë të koduara dhe të ruajtura në mënyrë të sigurt';

  @override
  String get loading => 'Duke u ngarkuar...';

  @override
  String get selectLanguage => 'Zgjidh Gjuhën';

  @override
  String get onboardingGetStartedDesc => 'Filloni duke zgjedhur gjuhën tuaj';

  @override
  String get accountRecoveryTitle => '🔐 Detajet e Rimëkëmbjes së Llogarisë';

  @override
  String get recoveryInstructions =>
      'Ju lutemi ruajeni këtë informacion në mënyrë të sigurt. Do t\'ju duhet për të rikuperuar llogarinë tuaj.';

  @override
  String get importantNotice => '⚠️ E rëndësishme:';

  @override
  String get astrologerProfileTitle => 'Profili i Astrologut';

  @override
  String get personalAstrologer => 'Astrolog Personal';

  @override
  String get makePersonalAstrologer => 'Bëhuni një Astrolog Personal';

  @override
  String get favoriteDescription =>
      'Pyetjet tuaja do t\'i jepen përparësi këtij astrologu. Nëse nuk jeni i disponueshëm, një astrolog tjetër i kualifikuar do t\'ju ndihmojë.';

  @override
  String get educationQualifications => 'Arsimi dhe Kualifikimet';

  @override
  String get aboutSection => 'Rreth';

  @override
  String get shareProfile => 'Shpërndaj Profilin';

  @override
  String get loadingAstrologer => 'Duke ngarkuar detajet e astrologut...';

  @override
  String get failedToLoadAstrologer =>
      'Ngarkimi i detajeve të astrologut dështoi.';

  @override
  String get authenticationRequired =>
      'Kërkohet vërtetim. Ju lutemi, identifikohuni.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kontrolli i sigurisë dështoi: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name tani është Astrologu juaj Personal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name u hoq nga të preferuarat';
  }

  @override
  String get toggleFavoriteError =>
      'Dështoi në përditësimin e statusit të preferuar';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Arsimi: $education\n📜 Kualifikimi: $qualification\n⏳ Përvoja: $experience';
  }

  @override
  String get notProvided => 'Nuk është dhënë';

  @override
  String reviews(Object count) {
    return '($count vlerësime)';
  }

  @override
  String get specialties => 'Specialitete';

  @override
  String get experience => 'Përvoja';

  @override
  String get qualification => 'Kualifikimi';

  @override
  String get education => 'Arsimi';

  @override
  String get recoveryTips =>
      '• Bëni një pamje të ekranit të këtij informacioni\n• Ruajeni në një vend të sigurt\n• Mos e ndani me askënd\n• Kjo do të shfaqet vetëm një herë';

  @override
  String get themeSettingsTitle => 'Cilësimet e Temës';

  @override
  String get lightThemeLabel => 'Dritë';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'E errët';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistemi';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
