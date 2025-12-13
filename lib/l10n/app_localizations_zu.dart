// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AppLocalizationsZu extends AppLocalizations {
  AppLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get settingsTitle => 'Izilungiselelo';

  @override
  String get notificationSettings => 'Izilungiselelo zezaziso';

  @override
  String get privacySettings => 'Izilungiselelo Zobumfihlo';

  @override
  String get accountSettings => 'Amasethingi we-akhawunti';

  @override
  String get languageSettings => 'Izilungiselelo Zolimi';

  @override
  String get languageChanged => 'Ulimi lushintshile';

  @override
  String get existingUserButton => 'Ngingumsebenzisi okhona';

  @override
  String get chooseCountryTitle => 'Khetha Izwe';

  @override
  String get yesText => 'Yebo';

  @override
  String get noText => 'Cha';

  @override
  String get appBarTitle => 'Izilungiselelo Zephrofayela';

  @override
  String get userIdLabel => 'I-ID Yomsebenzisi *';

  @override
  String get nameLabel => 'Igama';

  @override
  String get birthCountryLabel => 'Izwe Lokuzalwa';

  @override
  String get birthCityLabel => 'Umuzi Wokuzalwa';

  @override
  String get countrySelectionTitle => 'Khetha izwe lakini';

  @override
  String get maleLabel => 'Owesilisa';

  @override
  String get femaleLabel => 'Owesifazane';

  @override
  String get birthDateLabel => 'Usuku lokuzalwa';

  @override
  String get birthDatePlaceholder => 'Khetha Usuku Lokuzalwa';

  @override
  String get birthTimeLabel => 'Isikhathi Sokuzalwa';

  @override
  String get birthTimePlaceholder => 'Khetha Isikhathi Sokuzalwa';

  @override
  String get saveProfileButton => 'Londoloza Iphrofayela';

  @override
  String get noCitiesFound => 'Awekho amadolobha atholiwe';

  @override
  String cityPlaceholder(Object country) {
    return 'Faka idolobha $country';
  }

  @override
  String get countryFirstPlaceholder => 'Khetha izwe kuqala';

  @override
  String get versionHistoryTitle => 'Umlando Wenguqulo';

  @override
  String get notSetText => 'Akusethiwe';

  @override
  String nameHistory(Object name) {
    return 'Igama: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Idolobha: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Izwe: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Ubulili: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Usuku lokuzalwa: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Isikhathi Sokuzalwa: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Indawo: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Indawo yesikhathi: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'I-DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Isimo: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Kubuyekezwe ngo-$date';
  }

  @override
  String get userIdRequired => 'I-ID yomsebenzisi iyadingeka';

  @override
  String get profileSaved => 'Iphrofayela ilondolozwe ngempumelelo';

  @override
  String get saveFailed => 'Yehlulekile ukulondoloza iphrofayela';

  @override
  String get errorPrefix => 'Iphutha:';

  @override
  String get onboardingChooseLanguage => 'Khetha Ulimi Lwakho';

  @override
  String get onboardingChooseLanguageDesc =>
      'Khetha ulimi oluncamelayo ukuze uqhubeke.';

  @override
  String get onboardingWhatIsAstrology => 'Kuyini Ukubhula Ngezinkanyezi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'I-Astrology isifundo sasendulo sokunyakaza kwesibhakabhaka kanye nomthelela wako empilweni yomuntu, enikeza ukuqonda ngobuntu, ubudlelwano, nezenzakalo zokuphila.';

  @override
  String get onboardingWhyUseApp =>
      'Kungani Usebenzisa Lolu hlelo lokusebenza?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Thola ama-horoscope anembile, akhiqizwe umuntu kanye nesiqondiso esifanelana neshadi lakho lokuzalwa. Yenza izinqumo ezinolwazi ngezibikezelo zansuku zonke nezeluleko eziqondene nawe ezivela kubabhula ngezinkanyezi abanolwazi.';

  @override
  String get onboardingHowToUse =>
      'Isetshenziswa kanjani lolu hlelo lokusebenza?';

  @override
  String get onboardingHowToUseDesc =>
      'Vele ufake idethi yakho yokuzalwa, isikhathi esiqondile, indawo yokuzalwa, kanye nanoma yimiphi eminye imininingwane efanele ukuze uqalise ngokushesha. Hlola izinkanyezi zansuku zonke, buza imibuzo kubabhula ngezinkanyezi abangongoti, futhi uphathe iphrofayela yakho ukuze uthole izibikezelo ezinembayo, eziqondene nawe—akukho kungena ngemvume okudingekayo.';

  @override
  String get onboardingGetStarted => 'Qalisa';

  @override
  String get onboardingNewUser => 'Umsebenzisi Omusha';

  @override
  String get onboardingExistingUser => 'Umsebenzisi okhona';

  @override
  String get onboardingBack => 'Emuva';

  @override
  String get onboardingNext => 'Olandelayo';

  @override
  String get userIdNotFound =>
      'I-ID yomsebenzisi ayitholakali. Sicela ungene ngemvume noma usethe iphrofayela yakho.';

  @override
  String get clearNotificationsTitle => 'Sula Izaziso';

  @override
  String get clearNotificationsMessage =>
      'Uqinisekile ukuthi ufuna ukusula zonke izaziso?';

  @override
  String get clearNotificationsSuccess => 'Zonke izaziso zisulwe ngempumelelo.';

  @override
  String get clearHoroscopeTitle => 'Sula i-Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Uqinisekile ukuthi ufuna ukusula idatha yakho ye-horoscope?';

  @override
  String get clearHoroscopeSuccess => 'I-Horoscope isulwe ngempumelelo.';

  @override
  String get clearChatTitle => 'Sula Umlando Wengxoxo';

  @override
  String get clearChatMessage =>
      'Uqinisekile ukuthi ufuna ukususa wonke umlando wakho wengxoxo?';

  @override
  String get clearChatLocal => 'Ingxoxo isuliwe endaweni.';

  @override
  String get deleteAccountTitle => 'Susa i-akhawunti';

  @override
  String get deleteAccountMessage =>
      'Uqinisekile ukuthi ufuna ukususa i-akhawunti yakho? Lokhu kuzosula wonke umlando wakho wengxoxo nezaziso.';

  @override
  String get deleteAccountSuccess =>
      'I-akhawunti yakho nayo yonke imininingwane isusiwe.';

  @override
  String get deleteAccountError => 'Iphutha ekusuleni i-akhawunti';

  @override
  String get logoutTitle => 'Phuma';

  @override
  String get logoutMessage => 'Uqinisekile ukuthi ufuna ukuphuma?';

  @override
  String get termsPrivacyTitle => 'Imigomo Nobumfihlo';

  @override
  String get privacyPolicyTitle => 'Inqubomgomo yobumfihlo';

  @override
  String get termsConditionsTitle => 'Imigomo Nemibandela';

  @override
  String get dataControlTitle => 'Ukulawulwa Kwedatha';

  @override
  String get cancelButton => 'Khansela';

  @override
  String get confirmButton => 'Qinisekisa';

  @override
  String get clearQuestionsSuccess => 'Yonke imibuzo isuswe ngempumelelo.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Nkosi';

  @override
  String get startLabel => 'Qala';

  @override
  String get recoverAccount => 'Buyisela I-akhawunti';

  @override
  String get endLabel => 'Qeda';

  @override
  String get startDateLabel => 'Usuku okuqalwa ngalo';

  @override
  String get endDateLabel => 'Idethi Yokuphela';

  @override
  String get notAvailable => 'Akutholakali';

  @override
  String get noData => 'Ayikho idatha';

  @override
  String get unknownError => 'Iphutha elingaziwa';

  @override
  String get retryButton => 'Zama futhi';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Ishadi LaseNatali';

  @override
  String get lagnaLabel => 'I-Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'I-Ascendant Degree';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Akwaziwa';

  @override
  String get clearHoroscope => 'Sula i-Horoscope';

  @override
  String get clearNotifications => 'Sula Izaziso';

  @override
  String get clearChatHistory => 'Sula Umlando Wengxoxo';

  @override
  String get logout => 'Phuma';

  @override
  String get deleteAccount => 'Susa i-akhawunti';

  @override
  String get allFieldsRequired => 'Zonke izinkambu ziyadingeka.';

  @override
  String get accountRecoveredSuccess => 'I-akhawunti itholwe ngempumelelo.';

  @override
  String get recoveryFailed => 'Ukubuyisela kuhlulekile. Hlola ulwazi lwakho.';

  @override
  String get recoverySecretLabel => 'Imfihlo Yokubuyisela:';

  @override
  String get aboutUsTitle => 'Mayelana NATHI';

  @override
  String get aboutOurCompany => 'Mayelana Nenkampani Yethu';

  @override
  String get aboutCompanyDescription =>
      'Kwa-Karma, sikusiza ukuthi wembule indlela yakho yempilo yangempela ngobuhlakani obungaphelelwa yisikhathi be-Vedic astrology. Yonke imininingwane ivela kubabhula ngezinkanyezi bangempela, abanolwazi, abaklanywe ngokucophelela ngokusekelwe eshadini lakho lokuzalwa eliyingqayizivele. Kusukela ku-horoscope yansuku zonke kuya ekuqondisweni komuntu siqu, i-Karma yenza ulwazi lwakudala lufinyeleleke ngezilimi ezingaphezu kwe-100.';

  @override
  String get ourMission => 'Umgomo Wethu';

  @override
  String get missionDescription =>
      'Umgomo wethu ulula: ukuhlinzeka ngeziqondiso eziyiqiniso, eziholwa ngumuntu zezinkanyezi ezikunika amandla okwenza izinqumo eziqinisekayo nezinolwazi. Konke ukubikezela nokuxhumana kubonisa iminyaka yobungcweti bomsebenzi, hhayi ama-algorithms azenzakalelayo.';

  @override
  String get ourVision => 'Umbono Wethu';

  @override
  String get visionDescription =>
      'Silwela ukuba inkundla ethembeke kakhulu emhlabeni ye-Vedic astrology, sisiza abantu yonke indawo ukuthi baziqonde, ukukhetha kwabo, kanye nohambo lwabo lwempilo ngokucacile nangokuzethemba.';

  @override
  String get ourValues => 'Izimiso Zethu';

  @override
  String get valuesDescription =>
      'Kwa-Karma, siyabazisa ubuqiniso, ukunemba, nokwethenjwa. Sizibophezele ekunikezeni isiqondiso esingagcini nje ngokunembile kodwa futhi esinenjongo, esikusiza ukuba uzulazule empilweni ngokuqondisisa nangokuzethemba.';

  @override
  String get contactUs => 'Xhumana nathi';

  @override
  String get contactEmail => 'I-imeyili: support@yourcompany.com';

  @override
  String get contactWebsite => 'Iwebhusayithi: www.yourcompany.com';

  @override
  String get customerSupport => 'Ukwesekwa Kwamakhasimende';

  @override
  String get supportHeroTitle => 'Silapha Ukuzosiza';

  @override
  String get supportHeroDescription =>
      'Gcwalisa leli fomu elingezansi futhi ithimba lethu labasekeli lizobuyela kuwe ngokushesha okukhulu.';

  @override
  String get yourName => 'Igama lakho';

  @override
  String get yourEmail => 'Imeyili yakho';

  @override
  String get message => 'Umlayezo';

  @override
  String get enterEmail => 'Faka i-imeyili yakho';

  @override
  String get enterValidEmail => 'Faka ikheli le-imeyili elivumelekile';

  @override
  String enterField(Object fieldName) {
    return 'Faka $fieldName';
  }

  @override
  String get send => 'Thumela';

  @override
  String get sending => 'Iyathumela...';

  @override
  String get emailSentSuccess => '✅ I-imeyili ithunyelwe ngempumelelo!';

  @override
  String get emailSendFailed => '❌ Yehlulekile ukuthumela i-imeyili';

  @override
  String get astroDictionaryTitle => 'Isichazamazwi se-Astro';

  @override
  String get searchTermsHint => 'Amatemu okusesha...';

  @override
  String get noTermsFound => 'Awekho imigomo etholiwe';

  @override
  String get buyQuestionsTitle => 'Thenga Imibuzo';

  @override
  String get userNotAuthenticated => 'Umsebenzisi akaqinisekisiwe';

  @override
  String get loadStoreDataFailed => 'Yehlulekile ukulayisha idatha yesitolo';

  @override
  String get missingAuthToken => 'Ithokheni yokuqinisekisa ayikho';

  @override
  String get merchantDisplayName => 'I-Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Inkokhelo iphumelele! Umbuzo uthunyelwe';

  @override
  String paymentFailed(Object error) {
    return '❌ Inkokhelo yehlulekile: $error';
  }

  @override
  String get yourBalance => 'Ibhalansi Yakho';

  @override
  String questionsBalance(Object count) {
    return '$count Imibuzo';
  }

  @override
  String get availableOffers => 'Izipesheli Ezitholakalayo';

  @override
  String questionsCount(Object count) {
    return '$count Umbuzo';
  }

  @override
  String get buyButton => 'Thenga';

  @override
  String get dailyHoroscopeTitle => '🌟 IHoroscope Yansuku zonke';

  @override
  String get userIdMissing => 'I-ID yomsebenzisi ayikho';

  @override
  String get fetchHoroscopesFailed => 'Yehlulekile ukulanda izinkanyezi';

  @override
  String get noHoroscopeFound => 'Ayikho i-horoscope etholiwe.';

  @override
  String get signLabel => 'Sayina';

  @override
  String get todayLabel => 'Namuhla';

  @override
  String get yesterdayLabel => 'Izolo';

  @override
  String get thisWeekLabel => 'Kuleli viki';

  @override
  String get lastMonthLabel => 'Inyanga edlule';

  @override
  String get chatTitle => 'Xoxa';

  @override
  String get typeYourQuestionHint => 'Thayipha umbuzo wakho...';

  @override
  String get paymentRequired => 'Inkokhelo iyadingeka';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Usebenzise imibuzo yakho yamahhala. Khokha $amount ukuze uqhubeke.';
  }

  @override
  String get payNowButton => 'Khokha Manje';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count imibuzo yamahhala esele';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count imibuzo ekhokhelwe esele';
  }

  @override
  String get thankYouFeedback => 'Siyabonga ngempendulo yakho!';

  @override
  String get ratingSubmitted => 'Isilinganiso sithunyelwe!';

  @override
  String get setUserIdFirst => 'Sicela usethe i-ID yakho Yomsebenzisi kuqala';

  @override
  String get failedToFetchPrevious =>
      'Yehlulekile ukulanda imibuzo nezimpendulo ezedlule';

  @override
  String errorOccurred(Object error) {
    return 'Iphutha: $error';
  }

  @override
  String get drawerAstroProfile => 'Iphrofayili ye-Astro';

  @override
  String get drawerDailyHoroscope => 'I-Horoscope Yansuku zonke';

  @override
  String get drawerBuyQuestions => 'Thenga Imibuzo';

  @override
  String get drawerAstroDictionary => 'Isichazamazwi se-Astro';

  @override
  String get drawerSettings => 'Izilungiselelo';

  @override
  String get drawerCustomerSupport => 'Ukwesekwa Kwamakhasimende';

  @override
  String get drawerAbout => 'Mayelana';

  @override
  String get drawerProfileSettings => 'Izilungiselelo Zephrofayela';

  @override
  String get demoNotificationTitle => '🔔 Isaziso sedemo';

  @override
  String get demoNotificationBody =>
      'Lesi isaziso sokuhlola esivela kuhlelo lwakho lokusebenza!';

  @override
  String get notificationsTitle => 'Izaziso';

  @override
  String get noNotifications => 'Azikho izaziso';

  @override
  String get allTab => 'Konke';

  @override
  String get markAllAsRead => 'Maka konke njengokufundiwe';

  @override
  String get notificationMarkedRead => 'Isaziso simakwe njengesifundiwe';

  @override
  String get failedToLoadNotifications => 'Yehlulekile ukulayisha izaziso';

  @override
  String get failedToMarkRead => 'Yehlulekile ukumaka njengokufundiwe';

  @override
  String get failedToMarkAllRead => 'Yehlulekile ukumaka konke njengokufundiwe';

  @override
  String get socketConnected => 'Isokhethi ixhunyiwe';

  @override
  String get socketDisconnected => 'Isokhethi inqanyuliwe';

  @override
  String get newNotificationReceived => 'Kutholwe isaziso esisha';

  @override
  String get generalCategory => 'Okujwayelekile';

  @override
  String get horoscopeCategory => 'IHoroscope';

  @override
  String get chatCategory => 'Xoxa';

  @override
  String get systemCategory => 'Uhlelo';

  @override
  String get updateCategory => 'Izibuyekezo';

  @override
  String get howToAskTitle => 'Ungabuza Kanjani';

  @override
  String get noQuestionsAvailable => 'Ayikho imibuzo etholakalayo';

  @override
  String get failedToLoadQuestions => 'Yehlulekile ukulayisha imibuzo';

  @override
  String get pullToRefresh => 'Donsa ukuze uvuselele';

  @override
  String get careerCategory => 'Umsebenzi';

  @override
  String get loveCategory => 'Ezothando Nobudlelwano';

  @override
  String get healthCategory => 'Impilo';

  @override
  String get financeCategory => 'Ezezimali';

  @override
  String get familyCategory => 'Umndeni';

  @override
  String get educationCategory => 'Imfundo';

  @override
  String get travelCategory => 'Ukuhamba';

  @override
  String get spiritualCategory => 'Engokomoya';

  @override
  String get profileLoaded => 'Iphrofayela ilayishwe ngempumelelo';

  @override
  String get imageUploaded => 'Isithombe silayishwe ngempumelelo';

  @override
  String get savedInformationConfirmation => 'Ngilugcinile Lolu lwazi';

  @override
  String get noHistoryAvailable => 'Awukho umlando otholakalayo';

  @override
  String get missingUserIdError => 'I-ID yomsebenzisi iyadingeka';

  @override
  String get networkError => 'Iphutha lenethiwekhi. Sicela uzame futhi.';

  @override
  String get timeoutError => 'Isicelo siphelelwe yisikhathi';

  @override
  String get genericError => 'Kukhona into engahambanga kahle';

  @override
  String get reactionUpdateError => 'Yehlulekile ukubuyekeza ukusabela';

  @override
  String get noSearchResults => 'Ayikho imiphumela yosesho etholiwe';

  @override
  String get clearSearch => 'Sula ukusesha';

  @override
  String get resultsFound => 'Imiphumela itholakele';

  @override
  String get recoverySecretHint =>
      'Copy-paste ingase ingasebenzi, thayipha ngokwenza';

  @override
  String get recoverAccountDescription =>
      'Landela lezi zinyathelo ukuze ubuyisele i-akhawunti yakho';

  @override
  String get processingLabel => 'Iyacubungula...';

  @override
  String get clearChatSuccess => 'Ingxoxo isulwe ngempumelelo';

  @override
  String get notificationsEnabled => 'Izaziso zinikwe amandla';

  @override
  String get notificationsDisabled => 'Izaziso zikhutshaziwe';

  @override
  String get securityNotice =>
      'Idatha yakho ibethelwe ngokuvikelekile futhi igcinwe';

  @override
  String get loading => 'Iyalayisha...';

  @override
  String get selectLanguage => 'Khetha Ulimi';

  @override
  String get onboardingGetStartedDesc => 'Qalisa ngokukhetha ulimi lwakho';

  @override
  String get accountRecoveryTitle =>
      '🔐 Imininingwane Yokutholwa Kwe-akhawunti';

  @override
  String get recoveryInstructions =>
      'Sicela ulondoloze lolu lwazi ngokuphephile. Uzoyidinga ukuze ubuyisele i-akhawunti yakho.';

  @override
  String get importantNotice => '⚠️ Okubalulekile:';

  @override
  String get astrologerProfileTitle => 'Iphrofayela Yezinkanyezi';

  @override
  String get personalAstrologer => 'Isazi Sezinkanyezi Siqu';

  @override
  String get makePersonalAstrologer => 'Yenza Isazi Sezinkanyezi Siqu';

  @override
  String get favoriteDescription =>
      'Imibuzo yakho izobekwa phambili kulo mfundi wezinkanyezi. Uma ingatholakali, esinye isazi sezinkanyezi esiqeqeshiwe sizokusiza.';

  @override
  String get educationQualifications => 'Imfundo Neziqu';

  @override
  String get aboutSection => 'Mayelana';

  @override
  String get shareProfile => 'Yabelana Ngephrofayela';

  @override
  String get loadingAstrologer => 'Ilayisha imininingwane yezinkanyezi...';

  @override
  String get failedToLoadAstrologer =>
      'Yehlulekile ukulayisha imininingwane yezinkanyezi';

  @override
  String get authenticationRequired =>
      'Ukuqinisekisa kuyadingeka. Sicela ungene ngemvume.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ukuhlola ukuphepha kwehlulekile: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name manje isiSibhula Sezinkanyezi Sakho Siqu';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Kukhishwe $name ezintandokazini';
  }

  @override
  String get toggleFavoriteError =>
      'Yehlulekile ukubuyekeza isimo esiyintandokazi';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Imfundo: $education\n📜 Ukufaneleka: $qualification\n⏳ Isipiliyoni: $experience';
  }

  @override
  String get notProvided => 'Akuhlinzekiwe';

  @override
  String reviews(Object count) {
    return '($count izibuyekezo)';
  }

  @override
  String get specialties => 'Okukhethekile';

  @override
  String get experience => 'Isipiliyoni';

  @override
  String get qualification => 'Ukufaneleka';

  @override
  String get education => 'Imfundo';

  @override
  String get recoveryTips =>
      '• Thatha isithombe-skrini salolu lwazi\n• Yigcine endaweni evikelekile\n• Ungabelani namuntu\n• Lokhu kuzokhonjiswa kanye kuphela';

  @override
  String get themeSettingsTitle => 'Izilungiselelo Zetimu';

  @override
  String get lightThemeLabel => 'Ukukhanya';

  @override
  String get lightThemeDescription => 'Sebenzisa itimu ekhanyayo njalo';

  @override
  String get darkThemeLabel => 'Kumnyama';

  @override
  String get darkThemeDescription => 'Sebenzisa itimu emnyama njalo';

  @override
  String get systemThemeLabel => 'Uhlelo';

  @override
  String get systemThemeDarkDescription =>
      'Landela izilungiselelo zesistimu zetimu emnyama';

  @override
  String get systemThemeLightDescription =>
      'Landela ukulungiselelwa kwesistimu kwetimu ekhanyayo';

  @override
  String get switchToLight => 'Shintshela Ekukhanyeni';

  @override
  String get switchToDark => 'Shintshela ku-Dark';

  @override
  String get ourTeam => 'Ithimba lethu';

  @override
  String get teamDescription =>
      'Ithimba lethu lezazi zezinkanyezi ze-Vedic liletha isipiliyoni seminyaka sokuhumusha amathonya eplanethi namaphethini okuphila. Isekelwa ithimba elizinikele elisekelayo nelokuthuthukisa, i-Karma iletha ulwazi olungenazihibe, oluthembekile, nolwembulunga yonke kuwo wonke umsebenzisi.';
}
