// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Somali (`so`).
class AppLocalizationsSo extends AppLocalizations {
  AppLocalizationsSo([String locale = 'so']) : super(locale);

  @override
  String get settingsTitle => 'Dejinta';

  @override
  String get notificationSettings => 'Dejinta Ogeysiinta';

  @override
  String get privacySettings => 'Dejinta Qarsoodiga';

  @override
  String get accountSettings => 'Dejinta Akoonka';

  @override
  String get languageSettings => 'Dejinta Luuqadda';

  @override
  String get languageChanged => 'Luuqada ayaa is badashay';

  @override
  String get existingUserButton => 'Waxaan ahay isticmaale jira';

  @override
  String get chooseCountryTitle => 'Dal dooro';

  @override
  String get yesText => 'Haa';

  @override
  String get noText => 'Maya';

  @override
  String get appBarTitle => 'Dejinta Xogta';

  @override
  String get userIdLabel => 'Aqoonsiga isticmaalaha *';

  @override
  String get nameLabel => 'Magaca';

  @override
  String get birthCountryLabel => 'Dalka dhalashada';

  @override
  String get birthCityLabel => 'Magaalada dhalashada';

  @override
  String get countrySelectionTitle => 'Dooro dalkaaga';

  @override
  String get maleLabel => 'Lab';

  @override
  String get femaleLabel => 'Dheddig';

  @override
  String get birthDateLabel => 'Taariikhda Dhalashada';

  @override
  String get birthDatePlaceholder => 'Dooro Taariikhda Dhalashada';

  @override
  String get birthTimeLabel => 'Waqtiga Dhalashada';

  @override
  String get birthTimePlaceholder => 'Dooro Waqtiga Dhalashada';

  @override
  String get saveProfileButton => 'Keydi Profile';

  @override
  String get noCitiesFound => 'Lama helin magaalooyin';

  @override
  String cityPlaceholder(Object country) {
    return 'Geli magaalada gudaha $country';
  }

  @override
  String get countryFirstPlaceholder => 'Marka hore dalka dooro';

  @override
  String get versionHistoryTitle => 'Nooca Taariikhda';

  @override
  String get notSetText => 'Lama dejin';

  @override
  String nameHistory(Object name) {
    return 'Magaca: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'City: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Dalka: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jinsiga: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Taariikhda Dhalashada: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Waqtiga Dhalashada: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Goobta: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Waqtiga: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'State: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'La cusboonaysiiyay $date';
  }

  @override
  String get userIdRequired => 'Aqoonsiga isticmaale ayaa loo baahan yahay';

  @override
  String get profileSaved => 'Xogta si guul leh loo keydiyay';

  @override
  String get saveFailed => 'Ku guul daraystay in la kaydiyo profile';

  @override
  String get errorPrefix => 'Khalad:';

  @override
  String get onboardingChooseLanguage => 'Dooro Luuqadaada';

  @override
  String get onboardingChooseLanguageDesc =>
      'Dooro luqadda aad doorbidayso si aad u sii waddo.';

  @override
  String get onboardingWhatIsAstrology => 'Waa maxay xiddigiska?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astroloji waa daraasad qadiimi ah oo lagu sameeyo dhaqdhaqaaqyada samada iyo saamaynta ay ku leeyihiin nolosha bini\'aadamka, iyagoo siinaya aragtiyo ku saabsan shakhsiyadda, xidhiidhada, iyo dhacdooyinka nolosha.';

  @override
  String get onboardingWhyUseApp => 'Waa maxay sababta loo isticmaalo App-kan?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Hel horoscopes sax ah, bani-aadmigu soo saaray iyo hagitaan ku habboon shaxda dhalashadaada. Samee go\'aamo xog-ogaal ah oo leh saadaalin maalinle ah iyo talo shakhsiyeed oo ka imanaya xiddigiyayaal khibrad leh.';

  @override
  String get onboardingHowToUse => 'Sidee loo Isticmaalaa Appkan?';

  @override
  String get onboardingHowToUseDesc =>
      'Si fudud u geli taariikhda dhalashadaada, wakhtiga saxda ah, goobta dhalashada, iyo wixii faahfaahin kale ee khuseeya si aad isla markiiba u bilowdo. Sahami horoscopes maalinlaha ah, waydii su\'aalo xiddigiyayaal khabiir ah, oo maamul profile kaaga si sax ah, saadaal shaqsiyeed-looma baahna.';

  @override
  String get onboardingGetStarted => 'Bilow';

  @override
  String get onboardingNewUser => 'Isticmaale Cusub';

  @override
  String get onboardingExistingUser => 'Isticmaale jira';

  @override
  String get onboardingBack => 'Dib u noqo';

  @override
  String get onboardingNext => 'Xiga';

  @override
  String get userIdNotFound =>
      'Aqoonsiga isticmaalaha lama helin Fadlan gal ama deji astaantaada';

  @override
  String get clearNotificationsTitle => 'Nadiifi Ogeysiisyada';

  @override
  String get clearNotificationsMessage =>
      'Ma hubtaa inaad rabto inaad tirtirto dhammaan ogeysiisyada?';

  @override
  String get clearNotificationsSuccess =>
      'Dhammaan ogeysiisyada waa la nadiifiyey si guul leh';

  @override
  String get clearHoroscopeTitle => 'Nadiifi Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Ma hubtaa inaad rabto inaad nadiifiso xogta horoscope-kaaga?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope ayaa si guul leh u nadiifiyay';

  @override
  String get clearChatTitle => 'Nadiifi Taariikhda Sheekaysiga';

  @override
  String get clearChatMessage =>
      'Ma hubtaa inaad rabto inaad tirtirto dhammaan taariikhdaada wada sheekaysiga?';

  @override
  String get clearChatLocal => 'Sheekada waa la nadiifiyay.';

  @override
  String get deleteAccountTitle => 'Tirtir Koontada';

  @override
  String get deleteAccountMessage =>
      'Ma hubtaa inaad doonayso inaad tirtirto akoonkaaga? Tani waxay sidoo kale tirtiri doontaa dhammaan taariikhdaada wada sheekaysiga iyo ogeysiisyada';

  @override
  String get deleteAccountSuccess =>
      'Koontadaada iyo dhammaan xogta waa laga saaray';

  @override
  String get deleteAccountError => 'Khalad tirtirida akoontiga';

  @override
  String get logoutTitle => 'Ka bax';

  @override
  String get logoutMessage => 'Ma hubtaa inaad doonayso inaad ka baxdo?';

  @override
  String get termsPrivacyTitle => 'Shuruudaha & Qarsoonaanta';

  @override
  String get privacyPolicyTitle => 'Siyaasadda Qarsoonnimada';

  @override
  String get termsConditionsTitle => 'Shuruudaha & Shuruudaha';

  @override
  String get dataControlTitle => 'Xakamaynta Xogta';

  @override
  String get cancelButton => 'Jooji';

  @override
  String get confirmButton => 'Xaqiiji';

  @override
  String get clearQuestionsSuccess =>
      'Dhammaan su\'aalaha waa la tirtiray si guul leh.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Rabbiyow';

  @override
  String get startLabel => 'Bilow';

  @override
  String get recoverAccount => 'Soo kabso Akoonka';

  @override
  String get endLabel => 'Dhammaad';

  @override
  String get startDateLabel => 'Taariikhda Bilawga';

  @override
  String get endDateLabel => 'Taariikhda dhamaadka';

  @override
  String get notAvailable => 'Lama heli karo';

  @override
  String get noData => 'Xog malaha';

  @override
  String get unknownError => 'Khalad aan la garanayn';

  @override
  String get retryButton => 'Isku day';

  @override
  String get kundaliGeneratorTitle => 'Generator Kundali';

  @override
  String get natalChartTitle => 'Jaantuska Dhalashada';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Darajada Koritaanka';

  @override
  String get vimshottariDashaTitle => 'Vimhottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Lama garanayo';

  @override
  String get clearHoroscope => 'Nadiifi Horoscope';

  @override
  String get clearNotifications => 'Nadiifi Ogeysiisyada';

  @override
  String get clearChatHistory => 'Nadiifi Taariikhda Sheekaysiga';

  @override
  String get logout => 'Ka bax';

  @override
  String get deleteAccount => 'Tirtir Koontada';

  @override
  String get allFieldsRequired => 'Dhammaan beeraha ayaa loo baahan yahay.';

  @override
  String get accountRecoveredSuccess => 'Akoonka si guul leh ayaa loo helay';

  @override
  String get recoveryFailed =>
      'Soo kabashada waa fashilantay Hubi macluumaadkaaga.';

  @override
  String get recoverySecretLabel => 'Sirta Soo kabashada:';

  @override
  String get aboutUsTitle => 'Annaga';

  @override
  String get aboutOurCompany => 'Ku saabsan Shirkaddayada';

  @override
  String get aboutCompanyDescription =>
      'Karma, waxaanu kaa caawinaynaa inaad daaha ka qaaddo jidkaaga nolosha dhabta ah adiga oo u maraya xigmadda aan wakhtiga lahayn ee falaga Vedic. Aragti kastaa waxay ka timaadaa xiddigiyayaal khibrad leh oo dhab ah, oo si taxadar leh loo sameeyay iyadoo lagu salaynayo shaxda dhalashadaada gaarka ah. Laga soo bilaabo horoscopes maalinlaha ah ilaa hagitaan shaqsiyeed, Karma waxay ka dhigtaa aqoon qadiimi ah oo lagu heli karo in ka badan 100 luqadood.';

  @override
  String get ourMission => 'Himiladayada';

  @override
  String get missionDescription =>
      'Hadafkayagu waa sahlan yahay: inaan bixino hagitaan xiddigiya oo dhab ah, oo bini\'aadmigu hoggaamiyo kaasoo awood kuu siinaya inaad si kalsooni leh, go\'aanno xog ogaal ah u qaadato. Saadaal kasta iyo la tashi kastaa waxay ka tarjumaysaa sannado khibrad xirfadeed ah, ma aha algorithms-ka tooska ah.';

  @override
  String get ourVision => 'Aragtideena';

  @override
  String get visionDescription =>
      'Waxaan ku dadaaleynaa inaan noqono goobta ugu kalsoonida badan adduunka ee falaga Vedic, ka caawinta dadka meel kasta oo ay joogaan inay fahmaan naftooda, doorashadooda, iyo socdaalkooda nololeed si cad oo kalsooni leh.';

  @override
  String get ourValues => 'Qiimahayada';

  @override
  String get valuesDescription =>
      'Karma, waxaan ku qiimeynaa runnimada, saxnaanta, iyo kalsoonida. Waxaa naga go\'an inaan bixino hagitaan aan sax ahayn oo keliya balse sidoo kale macno leh, kaa caawinaysa inaad nolosha ugu dhex socoto aragti iyo kalsooni.';

  @override
  String get contactUs => 'Nala Soo Xidhiidh';

  @override
  String get contactEmail => 'Iimayl: care@karmalifepath.com';

  @override
  String get contactWebsite => 'Website: www.karmalifepath.com';

  @override
  String get customerSupport => 'Taageerada Macmiilka';

  @override
  String get supportHeroTitle => 'Waxaan u joognaa inaan caawinno';

  @override
  String get supportHeroDescription =>
      'Buuxi foomka hoose kooxdayada taageerada ayaa kuugu soo celin doonta sida ugu dhakhsaha badan.';

  @override
  String get yourName => 'Magacaaga';

  @override
  String get yourEmail => 'Iimaylkaaga';

  @override
  String get message => 'Fariinta';

  @override
  String get enterEmail => 'Geli iimaylkaga';

  @override
  String get enterValidEmail => 'Geli ciwaan email sax ah';

  @override
  String enterField(Object fieldName) {
    return 'Geli $fieldName';
  }

  @override
  String get send => 'Dir';

  @override
  String get sending => 'Diraya...';

  @override
  String get emailSentSuccess => '✅ Iimayl si guul leh ayaa loo soo diray!';

  @override
  String get emailSendFailed => '❌ Waa ku guul daraystay in ay dirto iimaylka';

  @override
  String get astroDictionaryTitle => 'Qaamuuska Astro';

  @override
  String get searchTermsHint => 'Erayada raadinta...';

  @override
  String get noTermsFound => 'Shuruudo lagama helin';

  @override
  String get buyQuestionsTitle => 'Su\'aalaha iibso';

  @override
  String get userNotAuthenticated => 'Isticmaalaha lama xaqiijin';

  @override
  String get loadStoreDataFailed => 'Ku guuldarraystay in la raro xogta kaydka';

  @override
  String get missingAuthToken => 'Calaamada aqoonsiga maqan';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful =>
      '✅ Lacag bixintu waa lagu guulaystay! Su\'aal la diray';

  @override
  String paymentFailed(Object error) {
    return '❌ Lacag-bixinta ayaa fashilantay: $error';
  }

  @override
  String get yourBalance => 'Dheelitirkaaga';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Dalabyo La heli karo';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Iibso';

  @override
  String get dailyHoroscopeTitle => ' Horoscope maalinle ah';

  @override
  String get userIdMissing => 'Aqoonsiga isticmaalaha ayaa maqan';

  @override
  String get fetchHoroscopesFailed => 'Ku guuldarraystay inuu keeno horoscopes';

  @override
  String get noHoroscopeFound => 'Lama helin horoscope';

  @override
  String get signLabel => 'Saxeex';

  @override
  String get todayLabel => 'Maanta';

  @override
  String get yesterdayLabel => 'Shalay';

  @override
  String get thisWeekLabel => 'Todobaadkan';

  @override
  String get lastMonthLabel => 'Bishii hore';

  @override
  String get chatTitle => 'Sheekaysi';

  @override
  String get typeYourQuestionHint => 'Ku qor su\'aashaada...';

  @override
  String get paymentRequired => 'Lacag-bixinta ayaa loo baahan yahay';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Waxaad isticmaashay su\'aalahaaga bilaashka ah. Bixi $amount si aad u sii wadato.';
  }

  @override
  String get payNowButton => 'Hadda Bixi';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count su\'aalo bilaash ah ayaa hadhsan';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count paid questions remaining';
  }

  @override
  String get thankYouFeedback => 'Waad ku mahadsan tahay faallo celintaada!';

  @override
  String get ratingSubmitted => 'Qiimaynta waa la gudbiyay!';

  @override
  String get setUserIdFirst => 'Fadlan marka hore deji aqoonsigaaga isticmaale';

  @override
  String get failedToFetchPrevious =>
      'Ku guuldareystay inuu keeno su\'aalo iyo jawaabo hore';

  @override
  String errorOccurred(Object error) {
    return 'Khalad: $error';
  }

  @override
  String get drawerAstroProfile => 'Profile Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope maalinle ah';

  @override
  String get drawerBuyQuestions => 'Su\'aalaha iibso';

  @override
  String get drawerAstroDictionary => 'Qaamuuska Astro';

  @override
  String get drawerSettings => 'Dejinta';

  @override
  String get drawerCustomerSupport => 'Taageerada Macmiilka';

  @override
  String get drawerAbout => 'Ku saabsan';

  @override
  String get drawerProfileSettings => 'Dejinta Xogta';

  @override
  String get demoNotificationTitle => '🔔 Ogeysiinta Bandhigga';

  @override
  String get demoNotificationBody =>
      'Kani waa ogeysiis tijaabo ah oo ka yimid abkaaga!';

  @override
  String get notificationsTitle => 'Ogeysiisyada';

  @override
  String get noNotifications => 'Ogeysiis ma jiro';

  @override
  String get allTab => 'Dhammaan';

  @override
  String get markAllAsRead => 'Ku calaamadee dhammaan sida loo akhriyay';

  @override
  String get notificationMarkedRead =>
      'Ogeysiinta loo calaamadeeyay sidii loo akhriyay';

  @override
  String get failedToLoadNotifications =>
      'Ku guuldarreystay in la soo geliyo ogeysiisyada';

  @override
  String get failedToMarkRead =>
      'Ku guuldareystay inuu calaamadiyo sidii wax loo akhriyay';

  @override
  String get failedToMarkAllRead =>
      'Ku guuldarraystay inuu dhammaan u calaamadiyo sidii wax loo akhriyay';

  @override
  String get socketConnected => 'Socket ku xiran';

  @override
  String get socketDisconnected => 'Socket go\'ay';

  @override
  String get newNotificationReceived => 'Ogeysiis cusub ayaa helay';

  @override
  String get generalCategory => 'Guud ahaan';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Sheekaysi';

  @override
  String get systemCategory => 'Nidaamka';

  @override
  String get updateCategory => 'Cusbooneysii';

  @override
  String get howToAskTitle => 'Sida Loo Weydiiyo';

  @override
  String get noQuestionsAvailable => 'Su\'aalo lama hayo';

  @override
  String get failedToLoadQuestions =>
      'Ku guuldarraystay inuu soo raro su\'aalaha';

  @override
  String get pullToRefresh => 'Jiid si aad dib ugu soo kiciso';

  @override
  String get careerCategory => 'Xirfad';

  @override
  String get loveCategory => 'Jacaylka & Xiriirka';

  @override
  String get healthCategory => 'Caafimaadka';

  @override
  String get financeCategory => 'Maaliyadda';

  @override
  String get familyCategory => 'Qoyska';

  @override
  String get educationCategory => 'Waxbarashada';

  @override
  String get travelCategory => 'Safarka';

  @override
  String get spiritualCategory => 'Ruuxa';

  @override
  String get profileLoaded => 'Xogta si guul leh ayaa loo raray';

  @override
  String get imageUploaded => 'Sawirka si guul leh ayaa loo soo raray';

  @override
  String get savedInformationConfirmation => 'Waan kaydiyay macluumaadkan';

  @override
  String get noHistoryAvailable => 'Taariikh lama hayo';

  @override
  String get missingUserIdError => 'Aqoonsiga isticmaale ayaa loo baahan yahay';

  @override
  String get networkError => 'Cilada shabakada Fadlan isku day mar kale';

  @override
  String get timeoutError => 'Codsiga waa dhacay';

  @override
  String get genericError => 'Wax baa khaldamay';

  @override
  String get reactionUpdateError =>
      'Ku guuldareystay inuu cusboonaysiiyo falcelinta';

  @override
  String get noSearchResults => 'Wax natiijooyin raadin ah lama helin';

  @override
  String get clearSearch => 'Nadiifi raadinta';

  @override
  String get resultsFound => 'Natiijooyinka waa la helay';

  @override
  String get recoverySecretHint => 'Copy-paste ma shaqayn karo, gacanta ku qor';

  @override
  String get recoverAccountDescription =>
      'Raac tillaabooyinkan si aad u soo ceshato akoonkaaga';

  @override
  String get processingLabel => 'Hagaajinta...';

  @override
  String get clearChatSuccess => 'Sheekada si guul leh ayaa loo nadiifiyay';

  @override
  String get notificationsEnabled => 'Ogeysiinta waa la furay';

  @override
  String get notificationsDisabled => 'Ogeysiinta waa la joojiyay';

  @override
  String get securityNotice =>
      'Xogtaada si ammaan ah ayaa loo xafiday oo loo kaydiyay';

  @override
  String get loading => 'Soodejinaya...';

  @override
  String get selectLanguage => 'Dooro Luuqad';

  @override
  String get onboardingGetStartedDesc =>
      'Ku bilow adiga oo dooranaya luqadaada';

  @override
  String get accountRecoveryTitle => '🔐 Faahfaahinta Soo Celinta Akoonka';

  @override
  String get recoveryInstructions =>
      'Fadlan u xafid macluumaadkan si ammaan ah. Waxaad u baahan doontaa si aad u soo ceshato akoonkaaga';

  @override
  String get importantNotice => '⚠️ Muhiim:';

  @override
  String get astrologerProfileTitle => 'Profile Falimka';

  @override
  String get personalAstrologer => 'Xiddigaha Shakhsiyeed';

  @override
  String get makePersonalAstrologer => 'Samee xiddigiye shaqsiyeed';

  @override
  String get favoriteDescription =>
      'Su\'aalahaaga waxa la hor marin doonaa xiddiggan. Haddii aan la heli karin, xiddigiye kale oo u qalma ayaa ku caawin doona.';

  @override
  String get educationQualifications => 'Waxbarashada & Shahaadooyinka';

  @override
  String get aboutSection => 'Ku saabsan';

  @override
  String get shareProfile => 'La wadaag Profile';

  @override
  String get loadingAstrologer => 'Soo raraysa faahfaahinta xiddigiyaha...';

  @override
  String get failedToLoadAstrologer =>
      'Ku guuldarraystay in la soo geliyo faahfaahinta xiddigiyaha';

  @override
  String get authenticationRequired =>
      'Xaqiijinta ayaa loo baahan yahay Fadlan gal';

  @override
  String securityCheckFailed(Object error) {
    return 'Hubinta amniga ayaa guuldareystay: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name hadda waa xiddigiyahaaga gaarka ah';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Waxaa laga saaray $name kuwa ugu cadcad';
  }

  @override
  String get toggleFavoriteError =>
      'Waa lagu guul daraystay in la cusboonaysiiyo heerka aad jeceshahay';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '<span data-placeholder=\"name\"> </span>\n🎓 Waxbarashada: $education\n📜 Aqoonta: $qualification\nKhibrad: $experience';
  }

  @override
  String get notProvided => 'Lama bixin';

  @override
  String reviews(Object count) {
    return '($count faallooyin)';
  }

  @override
  String get specialties => 'Takhasusyada';

  @override
  String get experience => 'Khibrad';

  @override
  String get qualification => 'U qalmida';

  @override
  String get education => 'Waxbarashada';

  @override
  String get recoveryTips =>
      '• Sawir qaade xogtan\n• Ku kaydi meel ammaan ah\n• Cidna ha la wadaagin\nTan waxa la tusi doonaa hal mar oo kaliya';

  @override
  String get themeSettingsTitle => 'Dejinta mawduuca';

  @override
  String get lightThemeLabel => 'Iftiin';

  @override
  String get lightThemeDescription => 'Had iyo jeer isticmaal mawduuc fudud';

  @override
  String get darkThemeLabel => 'Madow';

  @override
  String get darkThemeDescription =>
      'Had iyo jeer isticmaal dulucda mugdiga ah';

  @override
  String get systemThemeLabel => 'Nidaamka';

  @override
  String get systemThemeDarkDescription =>
      'Raac dejinta nidaamka si aad u hesho dulucda mugdiga ah';

  @override
  String get systemThemeLightDescription =>
      'Raac dejinta nidaamka si aad u hesho dulucda fudud';

  @override
  String get switchToLight => 'U beddel Iftiin';

  @override
  String get switchToDark => 'U beddel Madow';

  @override
  String get ourTeam => 'Kooxdayada';

  @override
  String get teamDescription =>
      'Kooxdayada xiddigiyayaasha Vedic ee xirfadleyda ah waxay keenaan sannado waayo-aragnimo ah oo ay ku turjumayaan saamaynta meeraha iyo qaababka nolosha. Iyadoo ay taageerayaan koox u heellan taageerada iyo horumarinta, Karma waxay soo bandhigtaa khibrad la\'aan, la isku halayn karo, oo caalami ah isticmaale kasta.';
}
