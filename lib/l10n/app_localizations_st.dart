// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Southern Sotho (`st`).
class AppLocalizationsSt extends AppLocalizations {
  AppLocalizationsSt([String locale = 'st']) : super(locale);

  @override
  String get settingsTitle => 'Litlhophiso';

  @override
  String get notificationSettings => 'Litlhophiso tsa Tsebiso';

  @override
  String get privacySettings => 'Litlhophiso tsa Lekunutu';

  @override
  String get accountSettings => 'Litlhophiso tsa akhaonte';

  @override
  String get languageSettings => 'Litlhophiso tsa Puo';

  @override
  String get languageChanged => 'Puo e fetohile';

  @override
  String get existingUserButton => 'Ke mosebelisi ea teng';

  @override
  String get chooseCountryTitle => 'Khetha Naha';

  @override
  String get yesText => 'Ee';

  @override
  String get noText => 'Che';

  @override
  String get appBarTitle => 'Litlhophiso tsa Profaele';

  @override
  String get userIdLabel => 'Theneketso *';

  @override
  String get nameLabel => 'Lebitso';

  @override
  String get birthCountryLabel => 'Naha ea Tsoalo';

  @override
  String get birthCityLabel => 'Motse oa Tsoalo';

  @override
  String get countrySelectionTitle => 'Khetha naha ea heno';

  @override
  String get maleLabel => 'Monna';

  @override
  String get femaleLabel => 'E tšehali';

  @override
  String get birthDateLabel => 'Letsatsi la tsoalo';

  @override
  String get birthDatePlaceholder => 'Kgetha Letsatsi la Tswalo';

  @override
  String get birthTimeLabel => 'Nako ea Tsoalo';

  @override
  String get birthTimePlaceholder => 'Kgetha Nako ya Tswalo';

  @override
  String get saveProfileButton => 'Boloka Profile';

  @override
  String get noCitiesFound => 'Ha ho litoropo tse fumanoeng';

  @override
  String cityPlaceholder(Object country) {
    return 'Kena toropong $country';
  }

  @override
  String get countryFirstPlaceholder => 'Khetha naha pele';

  @override
  String get versionHistoryTitle => 'Histori ea Phetolelo';

  @override
  String get notSetText => 'Ha ea behoa';

  @override
  String nameHistory(Object name) {
    return 'Lebitso: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Toropo: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Naha: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Bong: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Letsatsi la tsoalo: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Nako ea Tsoalo: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Sebaka: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Nako: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Naha: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'E ntlafalitsoe ka $date';
  }

  @override
  String get userIdRequired => 'ID ea mosebelisi ea hlokahala';

  @override
  String get profileSaved => 'Boemo bo bolokiloe ka katleho';

  @override
  String get saveFailed => 'E hlolehile ho boloka boemo';

  @override
  String get errorPrefix => 'Phoso:';

  @override
  String get onboardingChooseLanguage => 'Kgetha Puo ya Hao';

  @override
  String get onboardingChooseLanguageDesc =>
      'Khetha puo eo u e ratang hore u tsoele pele.';

  @override
  String get onboardingWhatIsAstrology => 'Bonohe ba Linaleli ke Eng?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Bonohe ba linaleli ke thuto ea khale ea metsamao ea leholimo le tšusumetso ea tsona bophelong ba motho, e fanang ka temohisiso mabapi le botho, likamano le liketsahalo tsa bophelo.';

  @override
  String get onboardingWhyUseApp => 'Ke Hobane\'ng ha U Sebelisa App Ee?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Fumana li-horoscope tse nepahetseng, tse entsoeng ke batho le tataiso e lumellanang le chate ea hau ea tsoalo. Etsa liqeto tse nang le tsebo ka likhakanyo tsa letsatsi le letsatsi le likeletso tsa motho ka mong ho tsoa ho linohe tsa linaleli tse nang le boiphihlelo.';

  @override
  String get onboardingHowToUse => 'Mokhoa oa ho Sebelisa App ee?';

  @override
  String get onboardingHowToUseDesc =>
      'Kenya feela letsatsi la hau la tsoalo, nako e nepahetseng, sebaka sa tsoalo, le lintlha tse ling tse bohlokoa ho qala hanghang. Lekola linaleli tsa linaleli tsa letsatsi le letsatsi, botsa linohe tsa linaleli, \'me u tsamaise boemo ba hau bakeng sa likhakanyo tse nepahetseng, tse etselitsoeng motho ka mong - ha ho hlokahale ho kena.';

  @override
  String get onboardingGetStarted => 'Qala';

  @override
  String get onboardingNewUser => 'Mosebelisi e Mocha';

  @override
  String get onboardingExistingUser => 'Mosebelisi ea teng';

  @override
  String get onboardingBack => 'Morao';

  @override
  String get onboardingNext => 'E \'ngoe';

  @override
  String get userIdNotFound =>
      'ID ea mosebelisi ha e fumanehe. Ka kopo, kena kapa u hlophise boemo ba hau.';

  @override
  String get clearNotificationsTitle => 'Hlakola Litsebiso';

  @override
  String get clearNotificationsMessage =>
      'Na ehlile u batla ho hlakola litemoso kaofela?';

  @override
  String get clearNotificationsSuccess =>
      'Litsebiso tsohle li hlakotsoe ka katleho.';

  @override
  String get clearHoroscopeTitle => 'Horoscope e hlakileng';

  @override
  String get clearHoroscopeMessage =>
      'Na u na le bonnete ba hore u batla ho hlakola lintlha tsa hau tsa linaleli?';

  @override
  String get clearHoroscopeSuccess =>
      'Linaleli tsa linaleli li hlakotsoe ka katleho.';

  @override
  String get clearChatTitle => 'Hlakola Nalane ea Chat';

  @override
  String get clearChatMessage =>
      'Na ehlile u batla ho hlakola nalane eohle ea meqoqo?';

  @override
  String get clearChatLocal => 'Puisano e tlositsoe sebakeng sa heno.';

  @override
  String get deleteAccountTitle => 'Hlakola Account';

  @override
  String get deleteAccountMessage =>
      'Na ehlile u batla ho hlakola ak\'haonte ea hau? Sena se tla hlakola nalane eohle ea meqoqo le litemoso.';

  @override
  String get deleteAccountSuccess =>
      'Ak\'haonte ea hau le data kaofela li tlositsoe.';

  @override
  String get deleteAccountError => 'Phoso ea ho hlakola ak\'haonte';

  @override
  String get logoutTitle => 'Tsoa';

  @override
  String get logoutMessage => 'Na ehlile u batla ho tsoa?';

  @override
  String get termsPrivacyTitle => 'Melao le Lekunutu';

  @override
  String get privacyPolicyTitle => 'leano la lekunutu';

  @override
  String get termsConditionsTitle => 'Melao le Lipehelo';

  @override
  String get dataControlTitle => 'Taolo ea Boitsebiso';

  @override
  String get cancelButton => 'Hlakola';

  @override
  String get confirmButton => 'Netefatsa';

  @override
  String get clearQuestionsSuccess => 'Lipotso tsohle li hlakotsoe ka katleho.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Morena';

  @override
  String get startLabel => 'Qala';

  @override
  String get recoverAccount => 'Fumana Account';

  @override
  String get endLabel => 'QETA';

  @override
  String get startDateLabel => 'Letsatsi la qalo';

  @override
  String get endDateLabel => 'Letsatsi la ho Qetela';

  @override
  String get notAvailable => 'Ha e fumanehe';

  @override
  String get noData => 'Ha ho data';

  @override
  String get unknownError => 'Phoso e sa tsejoeng';

  @override
  String get retryButton => 'Leka hape';

  @override
  String get kundaliGeneratorTitle => 'Jenereithara ea Kundali';

  @override
  String get natalChartTitle => 'Chate ea Natala';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Degree ea Ascendant';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Tse sa tsejoeng';

  @override
  String get clearHoroscope => 'Horoscope e hlakileng';

  @override
  String get clearNotifications => 'Hlakola Litsebiso';

  @override
  String get clearChatHistory => 'Hlakola Nalane ea Chat';

  @override
  String get logout => 'Tsoa';

  @override
  String get deleteAccount => 'Hlakola Account';

  @override
  String get allFieldsRequired => 'Likarolo tsohle lia hlokahala.';

  @override
  String get accountRecoveredSuccess => 'Ak\'haonte e hlaphohetsoe ka katleho.';

  @override
  String get recoveryFailed =>
      'Ho hlaphoheloa ho hlolehile. Sheba lintlha tsa hau.';

  @override
  String get recoverySecretLabel => 'Lekunutu la Phodiso:';

  @override
  String get aboutUsTitle => 'Mabapi le rona';

  @override
  String get aboutOurCompany => 'Mabapi le Khampani ea Rona';

  @override
  String get aboutCompanyDescription =>
      'Ho Karma, re u thusa ho utulla tsela ea hau ea \'nete ea bophelo ka bohlale bo sa feleng ba bonohe ba linaleli ba Vedic. Kutloisiso e \'ngoe le e\' ngoe e tsoa ho linohe tsa linaleli tse nang le phihlelo, tse entsoeng ka hloko ho latela chate ea hau ea tsoalo e ikhethang. Ho tloha ho linaleli tsa letsatsi le letsatsi ho ea ho tataiso ea motho ka mong, Karma e etsa hore tsebo ea khale e fumanehe ka lipuo tse fetang 100.';

  @override
  String get ourMission => 'Morero oa rona';

  @override
  String get missionDescription =>
      'Morero oa rona o bonolo: ho fana ka tataiso ea \'nete ea bonohe ba linaleli e u fang matla a ho etsa liqeto tse nepahetseng, tse nang le tsebo. Polelo e \'ngoe le e \'ngoe le therisano e bontša lilemo tsa boitseanape, eseng li-algorithms tse ikemetseng.';

  @override
  String get ourVision => 'Pono ea Rona';

  @override
  String get visionDescription =>
      'Re ikitlaelletsa ho ba sethala se tšeptjoang ka ho fetisisa lefatšeng sa bonohe ba linaleli ba Vedic, ho thusa batho hohle ho itlhalosa, khetho ea bona, le leeto la bona la bophelo ka ho hlaka le ka kholiseho.';

  @override
  String get ourValues => 'Melao ea Rōna';

  @override
  String get valuesDescription =>
      'Ho Karma, re ananela bonnete, ho nepahala le ho tšepana. Re ikemiselitse ho fana ka tataiso eseng feela e nepahetseng empa hape e nang le morero, e u thusang ho phela bophelo ka temohisiso le kholiseho.';

  @override
  String get contactUs => 'Iteanye le rona';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webosaete: www.yourcompany.com';

  @override
  String get customerSupport => 'Tšehetso ea Bareki';

  @override
  String get supportHeroTitle => 'Re Mona ho Thusa';

  @override
  String get supportHeroDescription =>
      'Tlatsa foromo e ka tlase \'me sehlopha sa rona sa ts\'ehetso se tla khutlela ho uena kapele kamoo ho ka khonehang.';

  @override
  String get yourName => 'Lebitso la hau';

  @override
  String get yourEmail => 'Imeile ea hau';

  @override
  String get message => 'Molaetsa';

  @override
  String get enterEmail => 'Kenya lengolo-tsoibila la hau';

  @override
  String get enterValidEmail =>
      'Kenya aterese ea lengolo-tsoibila e nepahetseng';

  @override
  String enterField(Object fieldName) {
    return 'Kenya $fieldName';
  }

  @override
  String get send => 'Romela';

  @override
  String get sending => 'E ea romela...';

  @override
  String get emailSentSuccess => '✅ Imeile e rometsoe ka katleho!';

  @override
  String get emailSendFailed => '❌ E hlolehile ho romela lengolo-tsoibila';

  @override
  String get astroDictionaryTitle => 'Bukana ea Astro';

  @override
  String get searchTermsHint => 'Batla mantsoe...';

  @override
  String get noTermsFound => 'Ha ho mantsoe a fumanoeng';

  @override
  String get buyQuestionsTitle => 'Reka Lipotso';

  @override
  String get userNotAuthenticated => 'Mosebedisi ha a netefatswa';

  @override
  String get loadStoreDataFailed => 'E hlolehile ho bula lintlha tsa lebenkele';

  @override
  String get missingAuthToken => 'Letshwao la nnete le sieo';

  @override
  String get merchantDisplayName => 'Sesebelisoa sa Astro Chat';

  @override
  String get paymentSuccessful => '✅ Tefo e atlehile! Potso e rometsoe';

  @override
  String paymentFailed(Object error) {
    return '❌ Tefo e hlotsoe: $error';
  }

  @override
  String get yourBalance => 'Tekanyo ea Hao';

  @override
  String questionsBalance(Object count) {
    return '$count Lipotso';
  }

  @override
  String get availableOffers => 'Litlhahiso Tse Fumanehang';

  @override
  String questionsCount(Object count) {
    return '$count Potso';
  }

  @override
  String get buyButton => 'Reka';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope ea Letsatsi le Letsatsi';

  @override
  String get userIdMissing => 'ID ea mosebelisi ha e eo';

  @override
  String get fetchHoroscopesFailed => 'E hlolehile ho lata linaleli';

  @override
  String get noHoroscopeFound => 'Ha ho na horoscope e fumanoeng.';

  @override
  String get signLabel => 'Letshoao';

  @override
  String get todayLabel => 'Kajeno';

  @override
  String get yesterdayLabel => 'Maobane';

  @override
  String get thisWeekLabel => 'Bekeng ena';

  @override
  String get lastMonthLabel => 'Kgweding e Fetileng';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Ngola potso ea hau...';

  @override
  String get paymentRequired => 'Tefo e Hlokahala';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'U sebelisitse lipotso tsa hau tsa mahala. Lefa $amount ho tsoela pele.';
  }

  @override
  String get payNowButton => 'Lefa Hona Joale';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ho setse lipotso tsa mahala';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Ho setse lipotso tse $count';
  }

  @override
  String get thankYouFeedback => 'Kea leboha ka maikutlo a hau!';

  @override
  String get ratingSubmitted => 'Lintlha li kentsoe!';

  @override
  String get setUserIdFirst => 'Ka kopo, beha ID ea hau ea mosebelisi pele';

  @override
  String get failedToFetchPrevious =>
      'E hlolehile ho fumana lipotso le likarabo tse fetileng';

  @override
  String errorOccurred(Object error) {
    return 'Phoso: $error';
  }

  @override
  String get drawerAstroProfile => 'Boemo ba Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope ea letsatsi le letsatsi';

  @override
  String get drawerBuyQuestions => 'Reka Lipotso';

  @override
  String get drawerAstroDictionary => 'Bukana ea Astro';

  @override
  String get drawerSettings => 'Litlhophiso';

  @override
  String get drawerCustomerSupport => 'Tšehetso ea Bareki';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerProfileSettings => 'Litlhophiso tsa Profaele';

  @override
  String get demoNotificationTitle => '🔔 Tsebiso ea demo';

  @override
  String get demoNotificationBody =>
      'Ena ke tsebiso ea teko ho tsoa ho sesebelisoa sa hau!';

  @override
  String get notificationsTitle => 'Litsebiso';

  @override
  String get noNotifications => 'Ha ho litsebiso';

  @override
  String get allTab => 'Tsohle';

  @override
  String get markAllAsRead => 'Tšoaea kaofela ha li baliloe';

  @override
  String get notificationMarkedRead => 'Tsebiso e tšoailoe e balletsoe';

  @override
  String get failedToLoadNotifications => 'E hlolehile ho kenya litsebiso';

  @override
  String get failedToMarkRead => 'E hlolehile ho tshwaya hore e badilwe';

  @override
  String get failedToMarkAllRead =>
      'E hlolehile ho tshwaya kaofela ha di ballwe';

  @override
  String get socketConnected => 'Socket e hokahane';

  @override
  String get socketDisconnected => 'Sokete e khaotsoe';

  @override
  String get newNotificationReceived => 'Tsebiso e ncha e amohetsoe';

  @override
  String get generalCategory => 'Kakaretso';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Tsamaiso';

  @override
  String get updateCategory => 'Lintlafatso';

  @override
  String get howToAskTitle => 'Mokhoa oa ho Botsa';

  @override
  String get noQuestionsAvailable => 'Ha ho lipotso tse teng';

  @override
  String get failedToLoadQuestions => 'E hlolehile ho hlahisa lipotso';

  @override
  String get pullToRefresh => 'Hula ho hlabolla';

  @override
  String get careerCategory => 'Mosebetsi';

  @override
  String get loveCategory => 'Lerato & Likamano';

  @override
  String get healthCategory => 'Bophelo bo botle';

  @override
  String get financeCategory => 'Lichelete';

  @override
  String get familyCategory => 'Lelapa';

  @override
  String get educationCategory => 'Thuto';

  @override
  String get travelCategory => 'Tsamaea';

  @override
  String get spiritualCategory => 'Ea moea';

  @override
  String get profileLoaded => 'Boemo bo kentsoe ka katleho';

  @override
  String get imageUploaded => 'Setšoantšo se kentsoe ka katleho';

  @override
  String get savedInformationConfirmation => 'Ke Bolokile Litaba Tsena';

  @override
  String get noHistoryAvailable => 'Ha ho na nalane e fumanehang';

  @override
  String get missingUserIdError => 'ID ea mosebelisi ea hlokahala';

  @override
  String get networkError => 'Phoso ea marang-rang. Ka kopo, leka hape.';

  @override
  String get timeoutError => 'Kopo e feletsoe ke nako';

  @override
  String get genericError => 'Ho bile le phoso';

  @override
  String get reactionUpdateError => 'E hlolehile ho ntlafatsa maikutlo';

  @override
  String get noSearchResults => 'Ha ho liphetho tse fumanoeng';

  @override
  String get clearSearch => 'Hlakola patlo';

  @override
  String get resultsFound => 'Liphetho li fumanoe';

  @override
  String get recoverySecretHint =>
      'Copy-paste e kanna ea se sebetse, thaepa ka letsoho';

  @override
  String get recoverAccountDescription =>
      'Latela mehato ena ho khutlisa akhaonto ea hau';

  @override
  String get processingLabel => 'E ntse e sebetsa...';

  @override
  String get clearChatSuccess => 'Puisano e hlakotsoe ka katleho';

  @override
  String get notificationsEnabled => 'Litsebiso li lumelletsoe';

  @override
  String get notificationsDisabled => 'Litsebiso li timiloe';

  @override
  String get securityNotice =>
      'Lintlha tsa hau li patiloe ka mokhoa o sireletsehileng \'me li bolokiloe';

  @override
  String get loading => 'E ea kenya...';

  @override
  String get selectLanguage => 'Kgetha Puo';

  @override
  String get onboardingGetStartedDesc => 'Qala ka ho khetha puo ea hau';

  @override
  String get accountRecoveryTitle => '🔐 Lintlha tsa ho Khutlisa Akhaonto';

  @override
  String get recoveryInstructions =>
      'Ka kopo, boloka lintlha tsena ka mokhoa o sireletsehileng. U tla e hloka ho khutlisa ak\'haonte ea hau.';

  @override
  String get importantNotice => '⚠️ Bohlokoa:';

  @override
  String get astrologerProfileTitle => 'Boemo ba linohe tsa linaleli';

  @override
  String get personalAstrologer => 'Molepi oa Linaleli oa Motho';

  @override
  String get makePersonalAstrologer => 'Etsa Linohe Tsa Linaleli';

  @override
  String get favoriteDescription =>
      'Lipotso tsa hau li tla etelletsoa pele ho senohe sena sa linaleli. Haeba e sa fumanehe, senohe se seng se tšoanelehang se tla u thusa.';

  @override
  String get educationQualifications => 'Thuto & Litšoaneleho';

  @override
  String get aboutSection => 'About';

  @override
  String get shareProfile => 'Arolelana Profile';

  @override
  String get loadingAstrologer => 'E kenya lintlha tsa linohe tsa linaleli...';

  @override
  String get failedToLoadAstrologer =>
      'E hlolehile ho kenya lintlha tsa linohe tsa linaleli';

  @override
  String get authenticationRequired =>
      'Netefatso ea hlokahala. Ke kopa o kene.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ho hloleha ho hlahloba tshireletso: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ke Setsebi sa hao sa Linaleli';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ E tlositsoe $name ho tse ratoang';
  }

  @override
  String get toggleFavoriteError =>
      'E hlolehile ho nchafatsa boemo boo u bo ratang';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Thuto: $education\n📜 Litšoaneleho: $qualification\n⏳ Phihlelo: $experience';
  }

  @override
  String get notProvided => 'Ha e fanoe';

  @override
  String reviews(Object count) {
    return '($count maikutlo)';
  }

  @override
  String get specialties => 'Tse khethehileng';

  @override
  String get experience => 'Phihlelo';

  @override
  String get qualification => 'Tšoaneleho';

  @override
  String get education => 'Thuto';

  @override
  String get recoveryTips =>
      '• Nka skrine ea tlhahisoleseding ena\n• E boloke sebakeng se sireletsehileng\n• Se ke oa arolelana le mang kapa mang\n• Sena se tla bontšoa hang feela';

  @override
  String get themeSettingsTitle => 'Litlhophiso tsa Theme';

  @override
  String get lightThemeLabel => 'Leseli';

  @override
  String get lightThemeDescription => 'Kamehla sebelisa sehlooho se bobebe';

  @override
  String get darkThemeLabel => 'Lefifi';

  @override
  String get darkThemeDescription => 'Kamehla sebelisa sehlooho se lefifi';

  @override
  String get systemThemeLabel => 'Tsamaiso';

  @override
  String get systemThemeDarkDescription =>
      'Latela tlhophiso ea sistimi bakeng sa sehlooho se lefifi';

  @override
  String get systemThemeLightDescription =>
      'Latela tlhophiso ea sistimi bakeng sa sehlooho se bobebe';

  @override
  String get switchToLight => 'Fetohela ho Leseli';

  @override
  String get switchToDark => 'Fetohela ho Lefifi';

  @override
  String get ourTeam => 'Sehlopha sa rona';

  @override
  String get teamDescription =>
      'Sehlopha sa rona sa litsebi tsa linohe tsa linaleli tsa Vedic se tlisa boiphihlelo ba lilemo tsa ho fetolela litšusumetso tsa lipolanete le mekhoa ea bophelo. E tšehelitsoe ke sehlopha se inehetseng sa tšehetso le nts\'etsopele, Karma e fana ka boiphihlelo bo se nang moeli, bo tšepahalang le ba lefats\'e bakeng sa mosebelisi e mong le e mong.';
}
