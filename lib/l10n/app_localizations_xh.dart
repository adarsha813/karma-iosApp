// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Xhosa (`xh`).
class AppLocalizationsXh extends AppLocalizations {
  AppLocalizationsXh([String locale = 'xh']) : super(locale);

  @override
  String get settingsTitle => 'Iisetingi';

  @override
  String get notificationSettings => 'Iisetingi zesaziso';

  @override
  String get privacySettings => 'Iisetingi zabucala';

  @override
  String get accountSettings => 'Iisetingi ze-akhawunti';

  @override
  String get languageSettings => 'Iisetingi zolwimi';

  @override
  String get languageChanged => 'Ulwimi lutshintshile';

  @override
  String get existingUserButton => 'Ndingumsebenzisi okhoyo';

  @override
  String get chooseCountryTitle => 'Khetha Ilizwe';

  @override
  String get yesText => 'Ewe';

  @override
  String get noText => 'Hayi';

  @override
  String get appBarTitle => 'Izicwangciso zeProfayili';

  @override
  String get userIdLabel => 'Isazisi somsebenzisi *';

  @override
  String get nameLabel => 'Igama';

  @override
  String get birthCountryLabel => 'Ilizwe Lokuzalwa';

  @override
  String get birthCityLabel => 'IsiXeko sokuzalwa';

  @override
  String get countrySelectionTitle => 'Khetha ilizwe lakho';

  @override
  String get maleLabel => 'Indoda';

  @override
  String get femaleLabel => 'Ibhinqa';

  @override
  String get birthDateLabel => 'Usuku lokuzalwa';

  @override
  String get birthDatePlaceholder => 'Khetha Umhla wokuzalwa';

  @override
  String get birthTimeLabel => 'Ixesha Lokuzalwa';

  @override
  String get birthTimePlaceholder => 'Khetha Ixesha Lokuzalwa';

  @override
  String get saveProfileButton => 'Gcina iProfayile';

  @override
  String get noCitiesFound => 'Akukho zixeko zifunyenwe';

  @override
  String cityPlaceholder(Object country) {
    return 'Ngena kwisixeko $country';
  }

  @override
  String get countryFirstPlaceholder => 'Khetha ilizwe kuqala';

  @override
  String get versionHistoryTitle => 'Imbali yenguqulelo';

  @override
  String get notSetText => 'Akumiselwanga';

  @override
  String nameHistory(Object name) {
    return 'Igama: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Isixeko: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ilizwe: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Isini: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Umhla wokuzalwa: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ixesha lokuzalwa: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Indawo: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Ixesha lexesha: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Isimo: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ihlaziywe kwi $date';
  }

  @override
  String get userIdRequired => 'Isazisi somsebenzisi siyafuneka';

  @override
  String get profileSaved => 'Iprofayile igcinwe ngempumelelo';

  @override
  String get saveFailed => 'Ayiphumelelanga ukugcina inkangeleko yesimo';

  @override
  String get errorPrefix => 'Impazamo:';

  @override
  String get onboardingChooseLanguage => 'Khetha Ulwimi Lwakho';

  @override
  String get onboardingChooseLanguageDesc =>
      'Khetha ulwimi olukhethayo ukuqhubeka.';

  @override
  String get onboardingWhatIsAstrology => 'Yintoni ukuvumisa ngeenkwenkwezi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ukuvumisa ngeenkwenkwezi kukufunda ngezinto ezisesibhakabhakeni...';

  @override
  String get onboardingWhyUseApp => 'Kutheni usebenzisa le app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Fumana i-horoscopes eyeyakho, uqikelelo lwemihla ngemihla, kunye nesikhokelo sokwenza izigqibo ezinolwazi.';

  @override
  String get onboardingHowToUse => 'Uyisebenzisa njani le app?';

  @override
  String get onboardingHowToUseDesc =>
      'Hamba ngokulula, jonga i-horoscopes yemihla ngemihla, kwaye ulawule iprofayile yakho ukuze ufumane uqikelelo oluchanekileyo.';

  @override
  String get onboardingGetStarted => 'Qalisa';

  @override
  String get onboardingNewUser => 'Umsebenzisi omtsha';

  @override
  String get onboardingExistingUser => 'Umsebenzisi okhoyo';

  @override
  String get onboardingBack => 'Emva';

  @override
  String get onboardingNext => 'Okulandelayo';

  @override
  String get userIdNotFound =>
      'Isazisi somsebenzisi asifunyenwanga. Nceda ungene okanye usete iprofayile yakho.';

  @override
  String get clearNotificationsTitle => 'Izaziso ezicacileyo';

  @override
  String get clearNotificationsMessage =>
      'Uqinisekile ufuna ukucima zonke izaziso?';

  @override
  String get clearNotificationsSuccess =>
      'Zonke izaziso zicinywe ngempumelelo.';

  @override
  String get clearHoroscopeTitle => 'I-Horoscope ecacileyo';

  @override
  String get clearHoroscopeMessage =>
      'Ngaba uqinisekile ukuba ufuna ukucima idatha yakho ye-horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Ihoroscope isuswe ngempumelelo.';

  @override
  String get clearChatTitle => 'Coca Imbali yeNcoko';

  @override
  String get clearChatMessage =>
      'Ngaba uqinisekile ukuba ufuna ukucima yonke imbali yakho yengxoxo?';

  @override
  String get clearChatLocal => 'Incoko isusiwe ekuhlaleni.';

  @override
  String get deleteAccountTitle => 'Cima iAkhawunti';

  @override
  String get deleteAccountMessage =>
      'Uqinisekile ufuna ukucima iakhawunti yakho? Oku kuya kucima yonke imbali yakho yengxoxo kunye nezaziso.';

  @override
  String get deleteAccountSuccess =>
      'Iakhawunti yakho kunye nayo yonke idatha isusiwe.';

  @override
  String get deleteAccountError => 'Impazamo yokucima iakhawunti';

  @override
  String get logoutTitle => 'Phuma';

  @override
  String get logoutMessage => 'Uqinisekile ufuna ukuphuma?';

  @override
  String get termsPrivacyTitle => 'Imigaqo kunye noBucala';

  @override
  String get privacyPolicyTitle => 'Umthetho wabucala';

  @override
  String get termsConditionsTitle => 'Immimiselo & nemiqathango';

  @override
  String get dataControlTitle => 'Ulawulo Lwedatha';

  @override
  String get cancelButton => 'Rhoxisa';

  @override
  String get confirmButton => 'Qinisekisa';

  @override
  String get clearQuestionsSuccess => 'Yonke imibuzo icinywe ngempumelelo.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Nkosi';

  @override
  String get startLabel => 'Qala';

  @override
  String get recoverAccount => 'Fumana iAkhawunti';

  @override
  String get endLabel => 'Isiphelo';

  @override
  String get startDateLabel => 'Umhla wokuqala';

  @override
  String get endDateLabel => 'Umhla wokuphela';

  @override
  String get notAvailable => 'Ayifumaneki';

  @override
  String get noData => 'Akukho datha';

  @override
  String get unknownError => 'Imposiso engaziwayo';

  @override
  String get retryButton => 'Zama kwakhona';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Itshathi yaseNatal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'URashi';

  @override
  String get ascDegreeLabel => 'iDegree yokunyuka';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Akwaziwa';

  @override
  String get clearHoroscope => 'I-Horoscope ecacileyo';

  @override
  String get clearNotifications => 'Izaziso ezicacileyo';

  @override
  String get clearChatHistory => 'Sula iMbali yeNcoko';

  @override
  String get logout => 'Phuma';

  @override
  String get deleteAccount => 'Cima iAkhawunti';

  @override
  String get allFieldsRequired => 'Zonke iindawo ziyafuneka.';

  @override
  String get accountRecoveredSuccess => 'I-akhawunti ifunyenwe ngempumelelo.';

  @override
  String get recoveryFailed =>
      'Ukubuyisela akuphumelelanga. Jonga ulwazi lwakho.';

  @override
  String get recoverySecretLabel => 'Imfihlo yoBuyiselo:';

  @override
  String get aboutUsTitle => 'Ngathi';

  @override
  String get aboutOurCompany => 'Malunga neNkampani yethu';

  @override
  String get aboutCompanyDescription =>
      'EKarma, siyakunceda ukuba utyhile indlela yakho yobomi bokwenyani ngobulumko obungaphelelwa lixesha beVedic ngeenkwenkwezi. Yonke ingqiqo ivela kubavumisi ngeenkwenkwezi bokwenyani, abanamava, eyilwe ngononophelo ngokusekelwe kwitshathi yakho yokuzalwa eyodwa. Ukusuka kwi-horoscope yemihla ngemihla ukuya kwisikhokelo somntu, iKarma yenza ukuba ulwazi lwakudala lufikeleleke ngeelwimi ezingaphezu kwe-100.';

  @override
  String get ourMission => 'Injongo yethu';

  @override
  String get missionDescription =>
      'Injongo yethu ilula: ukubonelela ngeenkwenkwezi ezithembekileyo, ezikhokelwa ngabantu ezikuxhobisayo ukuba wenze izigqibo ezizithembayo nezinolwazi. Lonke uqikelelo kunye nothethwano lubonisa iminyaka yobuchwephesha, hayi ialgorithms ezenzekelayo.';

  @override
  String get ourVision => 'Umbono wethu';

  @override
  String get visionDescription =>
      'Sizama ukuba lelona qonga lithembekileyo lehlabathi lokuvumisa ngeenkwenkwezi kweVedic, ukunceda abantu kuyo yonke indawo baziqonde, ukhetho lwabo, kunye nohambo lwabo lobomi ngokucacileyo nangokuzithemba.';

  @override
  String get ourValues => 'Imilinganiselo Yethu';

  @override
  String get valuesDescription =>
      'KwiKarma, siyabuxabisa ubunyani, ukuchaneka kunye nokuthembeka. Sizibophelele ekunikeni isikhokelo esingachanekanga nje kuphela kodwa esinentsingiselo, sikunceda ulawule ubomi bakho ngengqiqo nokuzithemba.';

  @override
  String get contactUs => 'Qhagamshelana nathi';

  @override
  String get contactEmail => 'I-imeyile: support@yourcompany.com';

  @override
  String get contactWebsite => 'Iwebhusayithi: www.yourcompany.com';

  @override
  String get customerSupport => 'Uxhaso lwabathengi';

  @override
  String get supportHeroTitle => 'Silapha ukuze Sincede';

  @override
  String get supportHeroDescription =>
      'Gcwalisa le fomu ingezantsi kwaye iqela lethu lenkxaso liya kubuyela kuwe ngokukhawuleza.';

  @override
  String get yourName => 'Ingama lakho';

  @override
  String get yourEmail => 'Imeyile yakho';

  @override
  String get message => 'Umyalezo';

  @override
  String get enterEmail => 'Faka i-imeyile yakho';

  @override
  String get enterValidEmail => 'Ngenisa idilesi ye-imeyile esebenzayo';

  @override
  String enterField(Object fieldName) {
    return 'Ngena $fieldName';
  }

  @override
  String get send => 'Thumela';

  @override
  String get sending => 'Iyathumela...';

  @override
  String get emailSentSuccess => '✅ I-imeyile ithunyelwe ngempumelelo!';

  @override
  String get emailSendFailed => '❌ Ayiphumelelanga ukuthumela i-imeyile';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Amagama okukhangela...';

  @override
  String get noTermsFound => 'Akukho migaqo ifunyenweyo';

  @override
  String get buyQuestionsTitle => 'Thenga Imibuzo';

  @override
  String get userNotAuthenticated => 'Umsebenzisi akaqinisekiswanga';

  @override
  String get loadStoreDataFailed =>
      'Ayiphumelelanga ukulayisha idatha yokugcina';

  @override
  String get missingAuthToken => 'Akukho uphawu lobungqina';

  @override
  String get merchantDisplayName => 'I-Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Intlawulo iphumelele! Umbuzo uthunyelwe';

  @override
  String paymentFailed(Object error) {
    return '❌ Intlawulo ayiphumelelanga: $error';
  }

  @override
  String get yourBalance => 'Ibhalansi yakho';

  @override
  String questionsBalance(Object count) {
    return '$count Imibuzo';
  }

  @override
  String get availableOffers => 'Unikezelo olufumanekayo';

  @override
  String questionsCount(Object count) {
    return '$count Umbuzo';
  }

  @override
  String get buyButton => 'Thenga';

  @override
  String get dailyHoroscopeTitle => '🌟 IHoroscope yemihla ngemihla';

  @override
  String get userIdMissing => 'Isazisi somsebenzisi asikho';

  @override
  String get fetchHoroscopesFailed => 'Ayiphumelelanga ukulanda iinkwenkwezi';

  @override
  String get noHoroscopeFound => 'Akukho horoscope ifunyenweyo.';

  @override
  String get signLabel => 'Sayina';

  @override
  String get todayLabel => 'Namhlanje';

  @override
  String get yesterdayLabel => 'Izolo';

  @override
  String get thisWeekLabel => 'Kule veki';

  @override
  String get lastMonthLabel => 'Kwinyanga ephelile';

  @override
  String get chatTitle => 'Ncokola';

  @override
  String get typeYourQuestionHint => 'Chwetheza umbuzo wakho...';

  @override
  String get paymentRequired => 'Intlawulo iyafuneka';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Uyisebenzisile imibuzo yakho yasimahla. Hlawula $amount ukuze uqhubeke.';
  }

  @override
  String get payNowButton => 'Bhatala ngoku';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count imibuzo yasimahla eseleyo';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count imibuzo ehlawulweyo eseleyo';
  }

  @override
  String get thankYouFeedback => 'Enkosi ngempendulo yakho!';

  @override
  String get ratingSubmitted => 'Umlinganiselo ungenisiwe!';

  @override
  String get setUserIdFirst => 'Nceda useta i-ID yakho yoMsebenzisi kuqala';

  @override
  String get failedToFetchPrevious =>
      'Ayiphumelelanga ukulanda imibuzo edlulileyo kunye neempendulo';

  @override
  String errorOccurred(Object error) {
    return 'Imposiso: $error';
  }

  @override
  String get drawerAstroProfile => 'Iprofayile ye-Astro';

  @override
  String get drawerDailyHoroscope => 'I-Horoscope yemihla ngemihla';

  @override
  String get drawerBuyQuestions => 'Thenga Imibuzo';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Iisetingi';

  @override
  String get drawerCustomerSupport => 'Uxhaso lwabathengi';

  @override
  String get drawerAbout => 'Malunga';

  @override
  String get drawerProfileSettings => 'Izicwangciso zeProfayili';

  @override
  String get demoNotificationTitle => '🔔 Isaziso sedemo';

  @override
  String get demoNotificationBody => 'Esi sisaziso sovavanyo kwi-app yakho!';

  @override
  String get notificationsTitle => 'Izaziso';

  @override
  String get noNotifications => 'Akukho zaziso';

  @override
  String get allTab => 'Konke';

  @override
  String get markAllAsRead => 'Phawula zonke njengoko zifundiwe';

  @override
  String get notificationMarkedRead => 'Isaziso siphawulwe njengesifundiwe';

  @override
  String get failedToLoadNotifications => 'Ayiphumelelanga ukulayisha izaziso';

  @override
  String get failedToMarkRead => 'Ayiphumelelanga ukuphawula njengefundiweyo';

  @override
  String get failedToMarkAllRead =>
      'Ayiphumelelanga ukuphawula zonke njengezifundiweyo';

  @override
  String get socketConnected => 'Isokethi iqhagamshelwe';

  @override
  String get socketDisconnected => 'Isokethi iqhawulwe';

  @override
  String get newNotificationReceived => 'Isaziso esitsha sifunyenwe';

  @override
  String get generalCategory => 'Ngokubanzi';

  @override
  String get horoscopeCategory => 'IHoroscope';

  @override
  String get chatCategory => 'Ncokola';

  @override
  String get systemCategory => 'Inkqubo';

  @override
  String get updateCategory => 'Uhlaziyo';

  @override
  String get howToAskTitle => 'Indlela yokubuza';

  @override
  String get noQuestionsAvailable => 'Akukho mibuzo ikhoyo';

  @override
  String get failedToLoadQuestions => 'Ayiphumelelanga ukulayisha imibuzo';

  @override
  String get pullToRefresh => 'Tsala ukuze uhlaziye';

  @override
  String get careerCategory => 'Umsebenzi';

  @override
  String get loveCategory => 'Uthando kunye nobudlelwane';

  @override
  String get healthCategory => 'Impilo';

  @override
  String get financeCategory => 'Ezemali';

  @override
  String get familyCategory => 'Usapho';

  @override
  String get educationCategory => 'Imfundo';

  @override
  String get travelCategory => 'Ukuhamba';

  @override
  String get spiritualCategory => 'Ezomoya';

  @override
  String get profileLoaded => 'Iprofayile ilayishwe ngempumelelo';

  @override
  String get imageUploaded => 'Umfanekiso ulayishwe ngempumelelo';

  @override
  String get savedInformationConfirmation => 'Ndilugcinile Olu Lwazi';

  @override
  String get noHistoryAvailable => 'Akukho mbali ikhoyo';

  @override
  String get missingUserIdError => 'Isazisi somsebenzisi siyafuneka';

  @override
  String get networkError => 'Impazamo yenethiwekhi. Nceda zama kwakhona.';

  @override
  String get timeoutError => 'Isicelo siphelelwe lixesha';

  @override
  String get genericError => 'Into ayihamba kakuhle';

  @override
  String get reactionUpdateError => 'Ayiphumelelanga ukuhlaziya impendulo';

  @override
  String get noSearchResults => 'Akukho ziphumo zophendlo zifunyenweyo';

  @override
  String get clearSearch => 'Cima uphendlo';

  @override
  String get resultsFound => 'Iziphumo zifunyenwe';

  @override
  String get recoverySecretHint =>
      'Copy-copy isenokungasebenzi, chwetheza ngesandla';

  @override
  String get recoverAccountDescription =>
      'Landela la manyathelo ukubuyisela iakhawunti yakho';

  @override
  String get processingLabel => 'Iyaqhuba...';

  @override
  String get clearChatSuccess => 'Incoko isuswe ngempumelelo';

  @override
  String get notificationsEnabled => 'Izaziso zenziwe zasebenza';

  @override
  String get notificationsDisabled => 'Izaziso zivaliwe';

  @override
  String get securityNotice =>
      'Idatha yakho ifihliwe ngokukhuselekileyo kwaye igcinwe';

  @override
  String get loading => 'Iyalayisha...';

  @override
  String get selectLanguage => 'Khetha ulwimi';

  @override
  String get onboardingGetStartedDesc => 'Qalisa ngokukhetha ulwimi lwakho';

  @override
  String get accountRecoveryTitle => '🔐 IiNkcukacha zokuBuyisa iakhawunti';

  @override
  String get recoveryInstructions =>
      'Nceda ugcine olu lwazi ngokukhuselekileyo. Uyakuyidinga ukuze ufumane i-akhawunti yakho.';

  @override
  String get importantNotice => '⚠️ Kubalulekile:';

  @override
  String get astrologerProfileTitle => 'Iprofayile yoMvumisi ngeenkwenkwezi';

  @override
  String get personalAstrologer => 'ISivumisi ngeenkwenkwezi sobuqu';

  @override
  String get makePersonalAstrologer => 'Zenzele Isivumisi Ngeenkwenkwezi';

  @override
  String get favoriteDescription =>
      'Imibuzo yakho iya kubekwa phambili kwesi sivumisi ngeenkwenkwezi. Ukuba akafumaneki, esinye isazi ngeenkwenkwezi siya kukunceda.';

  @override
  String get educationQualifications => 'IMfundo neziQinisekiso';

  @override
  String get aboutSection => 'Malunga';

  @override
  String get shareProfile => 'Yabelana ngeProfayile';

  @override
  String get loadingAstrologer => 'Ilayisha iinkcukacha zeenkwenkwezi...';

  @override
  String get failedToLoadAstrologer =>
      'Ayiphumelelanga ukulayisha iinkcukacha zeenkwenkwezi';

  @override
  String get authenticationRequired => 'Kufuneka uqinisekiso. Nceda ungene.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ukhangelo lokhuseleko aluphumelelanga: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ngoku siSivumisi ngeenkwenkwezi sakho';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Isusiwe $name kwezithandwayo';
  }

  @override
  String get toggleFavoriteError => 'Isilele ukuhlaziya isimo esithandwayo';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Imfundo: $education\n📜 Isiqinisekiso: $qualification\n⏳ Amava: $experience';
  }

  @override
  String get notProvided => 'Ayinikezwanga';

  @override
  String reviews(Object count) {
    return '($count uphononongo)';
  }

  @override
  String get specialties => 'Iingcali';

  @override
  String get experience => 'Amava';

  @override
  String get qualification => 'Isiqinisekiso';

  @override
  String get education => 'Imfundo';

  @override
  String get recoveryTips =>
      '• Thatha umfanekiso weskrini wolu lwazi\n• Yigcine kwindawo ekhuselekileyo\n• Ungabelani nabani na\n• Oku kuya kuboniswa kube kanye kuphela';

  @override
  String get themeSettingsTitle => 'Iisetingi zomxholo';

  @override
  String get lightThemeLabel => 'Ukukhanya';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Mnyama';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Inkqubo';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Iqela lethu';

  @override
  String get teamDescription =>
      'Iqela lethu labavumisi ngeenkwenkwezi beVedic bazisa iminyaka yamava okutolika iimpembelelo zeplanethi kunye neepatheni zobomi. Ixhaswa liqela elizinikeleyo lenkxaso kunye nophuhliso, iKarma inikezela ngomthungo, okuthembekileyo, kunye namava ehlabathi kuye wonke umsebenzisi.';
}
