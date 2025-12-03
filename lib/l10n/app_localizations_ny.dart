// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nyanja Chewa Chichewa (`ny`).
class AppLocalizationsNy extends AppLocalizations {
  AppLocalizationsNy([String locale = 'ny']) : super(locale);

  @override
  String get settingsTitle => 'Zokonda';

  @override
  String get notificationSettings => 'Zokonda Zidziwitso';

  @override
  String get privacySettings => 'Zokonda Zazinsinsi';

  @override
  String get accountSettings => 'Makonda a akaunti';

  @override
  String get languageSettings => 'Zokonda pa Chiyankhulo';

  @override
  String get languageChanged => 'Chinenero chinasintha';

  @override
  String get existingUserButton => 'Ndine wogwiritsa ntchito';

  @override
  String get chooseCountryTitle => 'Sankhani Dziko';

  @override
  String get yesText => 'Inde';

  @override
  String get noText => 'Ayi';

  @override
  String get appBarTitle => 'Zokonda pa Mbiri';

  @override
  String get userIdLabel => 'Dzina Lolowera *';

  @override
  String get nameLabel => 'Dzina';

  @override
  String get birthCountryLabel => 'Dziko Lobadwira';

  @override
  String get birthCityLabel => 'Birth City';

  @override
  String get countrySelectionTitle => 'Sankhani dziko lanu';

  @override
  String get maleLabel => 'Mwamuna';

  @override
  String get femaleLabel => 'Mkazi';

  @override
  String get birthDateLabel => 'Tsiku lobadwa';

  @override
  String get birthDatePlaceholder => 'Sankhani Tsiku Lobadwa';

  @override
  String get birthTimeLabel => 'Nthawi Yobadwa';

  @override
  String get birthTimePlaceholder => 'Sankhani Nthawi Yobadwa';

  @override
  String get saveProfileButton => 'Sungani Mbiri';

  @override
  String get noCitiesFound => 'Palibe mizinda yomwe yapezeka';

  @override
  String cityPlaceholder(Object country) {
    return 'Lowetsani mzinda mu $country';
  }

  @override
  String get countryFirstPlaceholder => 'Sankhani dziko kaye';

  @override
  String get versionHistoryTitle => 'Mbiri Yakale';

  @override
  String get notSetText => 'Osayikidwa';

  @override
  String nameHistory(Object name) {
    return 'Dzina: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Mzinda: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Dziko: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jenda: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tsiku Lobadwa: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Nthawi Yobadwa: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Malo: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Nthawi: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Boma: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Zasinthidwa pa $date';
  }

  @override
  String get userIdRequired => 'ID ID ndiyofunika';

  @override
  String get profileSaved => 'Mbiri yasungidwa bwino';

  @override
  String get saveFailed => 'Zalephera kusunga mbiri';

  @override
  String get errorPrefix => 'Cholakwika:';

  @override
  String get onboardingChooseLanguage => 'Sankhani Chinenero Chanu';

  @override
  String get onboardingChooseLanguageDesc =>
      'Sankhani chilankhulo chomwe mukufuna kuti mupitilize.';

  @override
  String get onboardingWhatIsAstrology => 'Kodi Astrology ndi chiyani?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Nyenyezi ndi kuphunzira zakuthambo ...';

  @override
  String get onboardingWhyUseApp =>
      'Chifukwa chiyani mugwiritse ntchito pulogalamuyi?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Pezani ma horoscope makonda anu, zolosera zatsiku ndi tsiku, ndi chitsogozo kuti mupange zisankho zanzeru.';

  @override
  String get onboardingHowToUse =>
      'Momwe mungagwiritsire ntchito pulogalamuyi?';

  @override
  String get onboardingHowToUseDesc =>
      'Yendani mosavuta, yang\'anani zolosera za tsiku ndi tsiku, ndikuwongolera mbiri yanu kuti mulosere zolondola.';

  @override
  String get onboardingGetStarted => 'Yambanipo';

  @override
  String get onboardingNewUser => 'Wogwiritsa Watsopano';

  @override
  String get onboardingExistingUser => 'Wogwiritsa Alipo';

  @override
  String get onboardingBack => 'Kubwerera';

  @override
  String get onboardingNext => 'Ena';

  @override
  String get userIdNotFound =>
      'ID yanu sinapezeke. Chonde lowani kapena khazikitsani mbiri yanu.';

  @override
  String get clearNotificationsTitle => 'Chotsani Zidziwitso';

  @override
  String get clearNotificationsMessage =>
      'Kodi mukutsimikiza kuti mukufuna kuchotsa zidziwitso zonse?';

  @override
  String get clearNotificationsSuccess => 'Zidziwitso zonse zachotsedwa bwino.';

  @override
  String get clearHoroscopeTitle => 'Chotsani Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Kodi mukutsimikiza kuti mukufuna kuchotsa deta yanu ya horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope yachotsedwa bwino.';

  @override
  String get clearChatTitle => 'Chotsani Mbiri Yamacheza';

  @override
  String get clearChatMessage =>
      'Kodi mukutsimikiza kuti mukufuna kuchotsa mbiri yanu yonse yochezera?';

  @override
  String get clearChatLocal => 'Macheza achotsedwa kwanuko.';

  @override
  String get deleteAccountTitle => 'Chotsani Akaunti';

  @override
  String get deleteAccountMessage =>
      'Kodi mukutsimikiza kuti mukufuna kuchotsa akaunti yanu? Izi zidzachotsanso mbiri yanu yonse yochezera ndi zidziwitso.';

  @override
  String get deleteAccountSuccess => 'Akaunti yanu ndi data yonse zachotsedwa.';

  @override
  String get deleteAccountError => 'Vuto pakuchotsa akaunti';

  @override
  String get logoutTitle => 'Tulukani';

  @override
  String get logoutMessage => 'Mukutsimikiza kuti mukufuna kutuluka?';

  @override
  String get termsPrivacyTitle => 'Migwirizano & Zazinsinsi';

  @override
  String get privacyPolicyTitle => 'mfundo zazinsinsi';

  @override
  String get termsConditionsTitle => 'Terms & Conditions';

  @override
  String get dataControlTitle => 'Data Control';

  @override
  String get cancelButton => 'Letsani';

  @override
  String get confirmButton => 'Tsimikizani';

  @override
  String get clearQuestionsSuccess => 'Mafunso onse achotsedwa bwino.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Ambuye';

  @override
  String get startLabel => 'Yambani';

  @override
  String get recoverAccount => 'Bwezerani Akaunti';

  @override
  String get endLabel => 'TSIRIZA';

  @override
  String get startDateLabel => 'Tsiku loyambira';

  @override
  String get endDateLabel => 'Tsiku Lomaliza';

  @override
  String get notAvailable => 'Sakupezeka';

  @override
  String get noData => 'Palibe deta';

  @override
  String get unknownError => 'Cholakwika chosadziwika';

  @override
  String get retryButton => 'Yesaninso';

  @override
  String get kundaliGeneratorTitle => 'Kundali jenereta';

  @override
  String get natalChartTitle => 'Chithunzi cha Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Digiri ya Ascendant';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Zosadziwika';

  @override
  String get clearHoroscope => 'Chotsani Horoscope';

  @override
  String get clearNotifications => 'Chotsani Zidziwitso';

  @override
  String get clearChatHistory => 'Chotsani Mbiri Yamacheza';

  @override
  String get logout => 'Tulukani';

  @override
  String get deleteAccount => 'Chotsani Akaunti';

  @override
  String get allFieldsRequired => 'Minda yonse ikufunika.';

  @override
  String get accountRecoveredSuccess => 'Akaunti yachira bwino.';

  @override
  String get recoveryFailed => 'Kuchira kwalephera. Onani zambiri zanu.';

  @override
  String get recoverySecretLabel => 'Chinsinsi Chochira:';

  @override
  String get aboutUsTitle => 'Zambiri zaife';

  @override
  String get aboutOurCompany => 'Za Kampani Yathu';

  @override
  String get aboutCompanyDescription =>
      'Tadzipereka kupereka zabwino kwambiri zakuthambo kwa ogwiritsa ntchito.';

  @override
  String get ourMission => 'Ntchito Yathu';

  @override
  String get missionDescription =>
      'Kupereka zidziwitso zolondola komanso zokonda zakuthambo kuti zithandize ogwiritsa ntchito kupanga zisankho zodziwika bwino pamoyo wawo.';

  @override
  String get ourVision => 'Masomphenya Athu';

  @override
  String get visionDescription =>
      'Kuti mukhale nsanja yodalirika kwambiri yokhulupirira nyenyezi, kuphatikiza ukadaulo ndi nzeru zakale.';

  @override
  String get ourValues => 'Makhalidwe Athu';

  @override
  String get valuesDescription =>
      'Kukhulupirika, Kulondola, Mapangidwe Ogwiritsa Ntchito Pakatikati, ndi Kupanga Kwatsopano Kopitilira.';

  @override
  String get contactUs => 'Lumikizanani nafe';

  @override
  String get contactEmail => 'Imelo: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webusayiti: www.yourcompany.com';

  @override
  String get customerSupport => 'Thandizo la Makasitomala';

  @override
  String get supportHeroTitle => 'Tabwera Kuti Tithandize';

  @override
  String get supportHeroDescription =>
      'Lembani fomu ili pansipa ndipo gulu lathu lothandizira libweranso kwa inu posachedwa.';

  @override
  String get yourName => 'Dzina lanu';

  @override
  String get yourEmail => 'Imelo Yanu';

  @override
  String get message => 'Uthenga';

  @override
  String get enterEmail => 'Lowetsani imelo yanu';

  @override
  String get enterValidEmail => 'Lowetsani imelo adilesi yolondola';

  @override
  String enterField(Object fieldName) {
    return 'Lowetsani $fieldName';
  }

  @override
  String get send => 'Tumizani';

  @override
  String get sending => 'Kutumiza...';

  @override
  String get emailSentSuccess => '✅ Imelo yatumizidwa bwino!';

  @override
  String get emailSendFailed => '❌ Zalephera kutumiza imelo';

  @override
  String get astroDictionaryTitle => 'Dikishonale ya Astro';

  @override
  String get searchTermsHint => 'Sakani mawu...';

  @override
  String get noTermsFound => 'Palibe mawu omwe apezeka';

  @override
  String get buyQuestionsTitle => 'Gulani Mafunso';

  @override
  String get userNotAuthenticated => 'Wogwiritsa sanatsimikizidwe';

  @override
  String get loadStoreDataFailed => 'Zalephereka kutsitsa data ya sitolo';

  @override
  String get missingAuthToken => 'Chizindikiro chotsimikizika chikusowa';

  @override
  String get merchantDisplayName => 'Pulogalamu ya Astro Chat';

  @override
  String get paymentSuccessful => '✅ Malipiro apambana! Funso latumizidwa';

  @override
  String paymentFailed(Object error) {
    return '❌ Malipiro alephera: $error';
  }

  @override
  String get yourBalance => 'Kusamala kwanu';

  @override
  String questionsBalance(Object count) {
    return '$count Mafunso';
  }

  @override
  String get availableOffers => 'Zopereka Zomwe Zilipo';

  @override
  String questionsCount(Object count) {
    return '$count Funso';
  }

  @override
  String get buyButton => 'Gulani';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope ya tsiku ndi tsiku';

  @override
  String get userIdMissing => 'ID ya munthu ikusowa';

  @override
  String get fetchHoroscopesFailed =>
      'Zalephera kutenga zowerengera zamatsenga';

  @override
  String get noHoroscopeFound => 'Palibe nyenyezi yomwe yapezeka.';

  @override
  String get signLabel => 'Chizindikiro';

  @override
  String get todayLabel => 'Lero';

  @override
  String get yesterdayLabel => 'Dzulo';

  @override
  String get thisWeekLabel => 'Sabata ino';

  @override
  String get lastMonthLabel => 'Mwezi watha';

  @override
  String get chatTitle => 'Chezani';

  @override
  String get typeYourQuestionHint => 'Lembani funso lanu...';

  @override
  String get paymentRequired => 'Malipiro Amafunika';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Mwagwiritsa ntchito mafunso anu aulere. Lipirani $amount kuti mupitilize.';
  }

  @override
  String get payNowButton => 'Lipirani Tsopano';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count mafunso aulere atsala';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count mafunso olipidwa atsala';
  }

  @override
  String get thankYouFeedback => 'Zikomo chifukwa cha ndemanga zanu!';

  @override
  String get ratingSubmitted => 'Mavoti atumizidwa!';

  @override
  String get setUserIdFirst =>
      'Chonde khazikitsani ID yanu Yogwiritsa ntchito poyamba';

  @override
  String get failedToFetchPrevious =>
      'Zalephera kutenga mafunso ndi mayankho am\'mbuyomu';

  @override
  String errorOccurred(Object error) {
    return 'Vuto: $error';
  }

  @override
  String get drawerAstroProfile => 'Mbiri ya Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope yatsiku ndi tsiku';

  @override
  String get drawerBuyQuestions => 'Gulani Mafunso';

  @override
  String get drawerAstroDictionary => 'Dikishonale ya Astro';

  @override
  String get drawerSettings => 'Zokonda';

  @override
  String get drawerCustomerSupport => 'Thandizo la Makasitomala';

  @override
  String get drawerAbout => 'Za';

  @override
  String get drawerProfileSettings => 'Zokonda pa Mbiri';

  @override
  String get demoNotificationTitle => '🔔 Chidziwitso cha Demo';

  @override
  String get demoNotificationBody =>
      'Ichi ndi chidziwitso choyesera kuchokera ku pulogalamu yanu!';

  @override
  String get notificationsTitle => 'Zidziwitso';

  @override
  String get noNotifications => 'Palibe zidziwitso';

  @override
  String get allTab => 'Zonse';

  @override
  String get markAllAsRead => 'Chongani zonse kuti zawerengedwa';

  @override
  String get notificationMarkedRead =>
      'Chidziwitso chalembedwa kuti chawerengedwa';

  @override
  String get failedToLoadNotifications => 'Zalephera kutsegula zidziwitso';

  @override
  String get failedToMarkRead => 'Zalephera kuyika kuti zawerengedwa';

  @override
  String get failedToMarkAllRead => 'Zalephera kuyika zonse kuti zawerengedwa';

  @override
  String get socketConnected => 'Soketi yolumikizidwa';

  @override
  String get socketDisconnected => 'Soketi yatha';

  @override
  String get newNotificationReceived => 'Chidziwitso chatsopano chalandiridwa';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Chezani';

  @override
  String get systemCategory => 'Dongosolo';

  @override
  String get updateCategory => 'Zosintha';

  @override
  String get howToAskTitle => 'Mmene Mungafunse';

  @override
  String get noQuestionsAvailable => 'Palibe mafunso';

  @override
  String get failedToLoadQuestions => 'Zalephera kutsegula mafunso';

  @override
  String get pullToRefresh => 'Kokani kuti mutsitsimutse';

  @override
  String get careerCategory => 'Ntchito';

  @override
  String get loveCategory => 'Chikondi & Maubale';

  @override
  String get healthCategory => 'Thanzi';

  @override
  String get financeCategory => 'Zachuma';

  @override
  String get familyCategory => 'Banja';

  @override
  String get educationCategory => 'Maphunziro';

  @override
  String get travelCategory => 'Ulendo';

  @override
  String get spiritualCategory => 'Zauzimu';

  @override
  String get profileLoaded => 'Mbiri idakwezedwa bwino';

  @override
  String get imageUploaded => 'Chithunzi chidakwezedwa bwino';

  @override
  String get savedInformationConfirmation => 'Ndasunga Zambiri';

  @override
  String get noHistoryAvailable => 'Palibe mbiri yomwe ilipo';

  @override
  String get missingUserIdError => 'ID ID ndiyofunika';

  @override
  String get networkError => 'Vuto la netiweki. Chonde yesaninso.';

  @override
  String get timeoutError => 'Pempho latha';

  @override
  String get genericError => 'China chake chalakwika';

  @override
  String get reactionUpdateError => 'Zalephera kusintha zomwe zikuchitika';

  @override
  String get noSearchResults => 'Palibe zotsatira zomwe zapezeka';

  @override
  String get clearSearch => 'Chotsani kufufuza';

  @override
  String get resultsFound => 'Zotsatira zapezeka';

  @override
  String get recoverySecretHint =>
      'Copy-paste singagwire ntchito, lembani pamanja';

  @override
  String get recoverAccountDescription =>
      'Tsatirani izi kuti mubwezeretse akaunti yanu';

  @override
  String get processingLabel => 'Kukonza...';

  @override
  String get clearChatSuccess => 'Macheza achotsedwa bwino';

  @override
  String get notificationsEnabled => 'Zidziwitso zayatsidwa';

  @override
  String get notificationsDisabled => 'Zidziwitso zayimitsidwa';

  @override
  String get securityNotice =>
      'Zambiri zanu zimasungidwa mwachinsinsi ndikusungidwa';

  @override
  String get loading => 'Tikutsegula...';

  @override
  String get selectLanguage => 'Sankhani Chiyankhulo';

  @override
  String get onboardingGetStartedDesc => 'Yambani posankha chinenero chanu';

  @override
  String get accountRecoveryTitle => '🔐 Tsatanetsatane Wobwezeretsa Akaunti';

  @override
  String get recoveryInstructions =>
      'Chonde sungani izi motetezedwa. Muyifuna kuti mutengere akaunti yanu.';

  @override
  String get importantNotice => '⚠️ Zofunika:';

  @override
  String get astrologerProfileTitle => 'Mbiri ya Okhulupirira nyenyezi';

  @override
  String get personalAstrologer => 'Wopenda Nyenyezi Pawekha';

  @override
  String get makePersonalAstrologer => 'Pangani Wokhulupirira Nyenyezi';

  @override
  String get favoriteDescription =>
      'Mafunso anu adzakhala patsogolo kwa wokhulupirira nyenyezi uyu. Ngati palibe, wokhulupirira nyenyezi wina woyenerera adzakuthandizani.';

  @override
  String get educationQualifications => 'Maphunziro & Ziyeneretso';

  @override
  String get aboutSection => 'Za';

  @override
  String get shareProfile => 'Gawani Mbiri';

  @override
  String get loadingAstrologer =>
      'Tikutsegula zambiri za okhulupirira nyenyezi...';

  @override
  String get failedToLoadAstrologer =>
      'Zalephera kutsegula zambiri za okhulupirira nyenyezi';

  @override
  String get authenticationRequired =>
      'Kutsimikizika kumafunika. Chonde lowani.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kuwona chitetezo kwalephera: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ndiye Wopenda nyenyezi wanu';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Yachotsedwa $name kuchokera ku zokonda';
  }

  @override
  String get toggleFavoriteError =>
      'Zalephera kusintha mawonekedwe omwe mumakonda';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Maphunziro: $education\n📜 Zoyenereza: $qualification\n⏳ Zochitika: $experience';
  }

  @override
  String get notProvided => 'Osaperekedwa';

  @override
  String reviews(Object count) {
    return '($count ndemanga)';
  }

  @override
  String get specialties => 'Zapadera';

  @override
  String get experience => 'Zochitika';

  @override
  String get qualification => 'Chiyeneretso';

  @override
  String get education => 'Maphunziro';

  @override
  String get recoveryTips =>
      '• Tengani chithunzi cha chidziwitso ichi\n• Sungani pamalo otetezeka\n• Osagawana ndi aliyense\n• Izi zidzawonetsedwa kamodzi kokha';

  @override
  String get themeSettingsTitle => 'Zokonda pamutu';

  @override
  String get lightThemeLabel => 'Kuwala';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Chakuda';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Dongosolo';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
