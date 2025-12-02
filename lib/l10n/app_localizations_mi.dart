// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maori (`mi`).
class AppLocalizationsMi extends AppLocalizations {
  AppLocalizationsMi([String locale = 'mi']) : super(locale);

  @override
  String get settingsTitle => 'Tautuhinga';

  @override
  String get notificationSettings => 'Tautuhinga Whakamōhiotanga';

  @override
  String get privacySettings => 'Tautuhinga Matatapu';

  @override
  String get accountSettings => 'Tautuhinga Pūkete';

  @override
  String get languageSettings => 'Tautuhinga Reo';

  @override
  String get languageChanged => 'I huri te reo';

  @override
  String get existingUserButton => 'He kaiwhakamahi au';

  @override
  String get chooseCountryTitle => 'Kōwhiri Whenua';

  @override
  String get yesText => 'Ae';

  @override
  String get noText => 'Kao';

  @override
  String get appBarTitle => 'Tautuhinga Kōtaha';

  @override
  String get userIdLabel => 'ID Kaiwhakamahi *';

  @override
  String get nameLabel => 'Ingoa';

  @override
  String get birthCountryLabel => 'Whenua Whanau';

  @override
  String get birthCityLabel => 'Taone Whanau';

  @override
  String get countrySelectionTitle => 'Whiriwhiria to whenua';

  @override
  String get maleLabel => 'Tane';

  @override
  String get femaleLabel => 'Wahine';

  @override
  String get birthDateLabel => 'Te Ra Whanau';

  @override
  String get birthDatePlaceholder => 'Tīpakohia te Rā Whanau';

  @override
  String get birthTimeLabel => 'Wā Whanautanga';

  @override
  String get birthTimePlaceholder => 'Tīpakohia te wa whanau';

  @override
  String get saveProfileButton => 'Tiaki Kōtaha';

  @override
  String get noCitiesFound => 'Kaore he taone i kitea';

  @override
  String cityPlaceholder(Object country) {
    return 'Whakauruhia te taone ki $country';
  }

  @override
  String get countryFirstPlaceholder => 'Tīpako whenua tuatahi';

  @override
  String get versionHistoryTitle => 'Tuhinga o mua';

  @override
  String get notSetText => 'Kaore i whakaritea';

  @override
  String nameHistory(Object name) {
    return 'Ingoa: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Taone: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Whenua: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Ira: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Te Ra Whanau: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Wā Whanau: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Tauwāhi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Rohe Wā: GMT$offset';
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
    return 'I whakahōuhia i te $date';
  }

  @override
  String get userIdRequired => 'Ko te ID Kaiwhakamahi e hiahiatia ana';

  @override
  String get profileSaved => 'Kua tiakina paitia te kōtaha';

  @override
  String get saveFailed => 'I rahua te tiaki kōtaha';

  @override
  String get errorPrefix => 'Hapa:';

  @override
  String get onboardingChooseLanguage => 'Kōwhiria To Reo';

  @override
  String get onboardingChooseLanguageDesc =>
      'Tīpakohia tō reo pai ki te haere tonu.';

  @override
  String get onboardingWhatIsAstrology => 'He aha te Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ko te Astrology te rangahau mo nga tinana o te rangi...';

  @override
  String get onboardingWhyUseApp => 'He aha te whakamahi i tenei taupānga?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Tikina nga horoscope whaiaro, nga matapae o ia ra, me te arahi ki te whakatau whakatau.';

  @override
  String get onboardingHowToUse => 'Me pehea te whakamahi i tenei taupānga?';

  @override
  String get onboardingHowToUseDesc =>
      'Whakatere ngawari, tirohia nga horoscope o ia ra, me te whakahaere i to korero mo nga matapae tika.';

  @override
  String get onboardingGetStarted => 'Tīmatahia';

  @override
  String get onboardingNewUser => 'Kaiwhakamahi Hou';

  @override
  String get onboardingExistingUser => 'Kaiwhakamahi o naianei';

  @override
  String get onboardingBack => 'Whakamuri';

  @override
  String get onboardingNext => 'Whai muri';

  @override
  String get userIdNotFound =>
      'Kāore i kitea te ID Kaiwhakamahi. Tena koa takiuru, tautuhia ranei to kōtaha.';

  @override
  String get clearNotificationsTitle => 'Maama Whakamōhiotanga';

  @override
  String get clearNotificationsMessage =>
      'Kei te tino hiahia koe ki te whakakore i nga whakamohiotanga katoa?';

  @override
  String get clearNotificationsSuccess => 'I ūkuia nga whakamohiotanga katoa.';

  @override
  String get clearHoroscopeTitle => 'Marama Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Kei te tino hiahia koe ki te whakakore i o raraunga horoscope?';

  @override
  String get clearHoroscopeSuccess => 'I pai te whakakore i te Horoscope.';

  @override
  String get clearChatTitle => 'Ūkui Kōrerorero History';

  @override
  String get clearChatMessage =>
      'Kei te tino hiahia koe ki te muku i o hitori korero katoa?';

  @override
  String get clearChatLocal => 'I whakawāteahia te kōrerorero i te rohe.';

  @override
  String get deleteAccountTitle => 'Muku Pūkete';

  @override
  String get deleteAccountMessage =>
      'Kei te tino hiahia koe ki te muku i to putea? Ma tenei ka ūkui katoa o korero korero me o whakamohiotanga.';

  @override
  String get deleteAccountSuccess =>
      'Kua tangohia to putea me nga raraunga katoa.';

  @override
  String get deleteAccountError => 'Hapa te muku pūkete';

  @override
  String get logoutTitle => 'Takiputa';

  @override
  String get logoutMessage => 'Kei te tino hiahia koe ki te takiputa?';

  @override
  String get termsPrivacyTitle => 'Nga Ture me te Matatapu';

  @override
  String get privacyPolicyTitle => 'Kaupapahere Tūmataiti';

  @override
  String get termsConditionsTitle => 'Nga Ture me nga Tikanga';

  @override
  String get dataControlTitle => 'Mana Raraunga';

  @override
  String get cancelButton => 'Whakakore';

  @override
  String get confirmButton => 'Whakaū';

  @override
  String get clearQuestionsSuccess => 'I tutuki pai nga patai katoa.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Ariki';

  @override
  String get startLabel => 'Tīmata';

  @override
  String get recoverAccount => 'Whakaora Pūkete';

  @override
  String get endLabel => 'Whakamutunga';

  @override
  String get startDateLabel => 'Rā Tīmata';

  @override
  String get endDateLabel => 'Te Ra Whakamutunga';

  @override
  String get notAvailable => 'Kāore i te wātea';

  @override
  String get noData => 'Karekau he raraunga';

  @override
  String get unknownError => 'Hapa kore mohio';

  @override
  String get retryButton => 'Ngana ano';

  @override
  String get kundaliGeneratorTitle => 'Kaihanga Kundali';

  @override
  String get natalChartTitle => 'Tutohi Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rahi';

  @override
  String get ascDegreeLabel => 'Tohu Paetahi';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Kaore i te mohiotia';

  @override
  String get clearHoroscope => 'Marama Horoscope';

  @override
  String get clearNotifications => 'Maama Whakamōhiotanga';

  @override
  String get clearChatHistory => 'Ūkui Kōrerorero History';

  @override
  String get logout => 'Takiputa';

  @override
  String get deleteAccount => 'Muku Pūkete';

  @override
  String get allFieldsRequired => 'Ko nga mara katoa e hiahiatia ana.';

  @override
  String get accountRecoveredSuccess => 'I ora pai te kaute.';

  @override
  String get recoveryFailed => 'I rahua te whakaora. Tirohia o korero.';

  @override
  String get recoverySecretLabel => 'Mea ngaro Whakaora:';

  @override
  String get aboutUsTitle => 'Mo Tatou';

  @override
  String get aboutOurCompany => 'Mo To Tatou Kamupene';

  @override
  String get aboutCompanyDescription =>
      'Ka whakapau kaha matou ki te tuku i nga wheako wheturangi pai ki o maatau kaiwhakamahi.';

  @override
  String get ourMission => 'To Tatou Mihana';

  @override
  String get missionDescription =>
      'Hei whakarato i nga mohiotanga whetu tika me te whakawhaiaro hei awhina i nga kaiwhakamahi ki te whakatau whakatau i roto i o raatau oranga.';

  @override
  String get ourVision => 'To Tatou Matakite';

  @override
  String get visionDescription =>
      'Kia noho hei turanga wheturangi tino pono, te whakakotahi i te hangarau me te whakaaro nui o mua.';

  @override
  String get ourValues => 'O Tatou Uara';

  @override
  String get valuesDescription =>
      'Te Tika, te Tika, te Hoahoa-a-Kaiwhakamahi, me te Whakahoutanga Tonu.';

  @override
  String get contactUs => 'Whakapā mai';

  @override
  String get contactEmail => 'Īmēra: support@yourcompany.com';

  @override
  String get contactWebsite => 'paetukutuku: www.yourcompany.com';

  @override
  String get customerSupport => 'Tautoko Kiritaki';

  @override
  String get supportHeroTitle => 'Kei konei matou ki te awhina';

  @override
  String get supportHeroDescription =>
      'Whakakiia te puka i raro nei ka hoki wawe mai to matou roopu tautoko ki a koe.';

  @override
  String get yourName => 'To Ingoa';

  @override
  String get yourEmail => 'To Īmēra';

  @override
  String get message => 'Karere';

  @override
  String get enterEmail => 'Whakauruhia to imeera';

  @override
  String get enterValidEmail => 'Whakauruhia he wahitau imeera whaimana';

  @override
  String enterField(Object fieldName) {
    return 'Whakauruhia $fieldName';
  }

  @override
  String get send => 'Tukua';

  @override
  String get sending => 'Tuku ana...';

  @override
  String get emailSentSuccess => '✅ I pai te tuku imeera!';

  @override
  String get emailSendFailed => '❌ I rahua te tuku imeera';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Nga kupu rapu...';

  @override
  String get noTermsFound => 'Karekau he kupu i kitea';

  @override
  String get buyQuestionsTitle => 'Hokona nga patai';

  @override
  String get userNotAuthenticated => 'Kaiwhakamahi kaore i motuhēhēhia';

  @override
  String get loadStoreDataFailed => 'I rahua te uta i nga raraunga rokiroki';

  @override
  String get missingAuthToken => 'Kei te ngaro te tohu mana';

  @override
  String get merchantDisplayName => 'Astro Kōrerorero App';

  @override
  String get paymentSuccessful => '✅ I angitu te utu! Ka tukuna te patai';

  @override
  String paymentFailed(Object error) {
    return '❌ I rahua te utu: $error';
  }

  @override
  String get yourBalance => 'To Taurite';

  @override
  String questionsBalance(Object count) {
    return '$count Uiui';
  }

  @override
  String get availableOffers => 'Nga Tukunga Wātea';

  @override
  String questionsCount(Object count) {
    return '$count Pātai';
  }

  @override
  String get buyButton => 'Hoko';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope o ia ra';

  @override
  String get userIdMissing => 'Kei te ngaro te ID Kaiwhakamahi';

  @override
  String get fetchHoroscopesFailed => 'I rahua te tiki horoscope';

  @override
  String get noHoroscopeFound => 'Kaore i kitea he horoscope.';

  @override
  String get signLabel => 'Waitohu';

  @override
  String get todayLabel => 'I tenei ra';

  @override
  String get yesterdayLabel => 'Inanahi';

  @override
  String get thisWeekLabel => 'I tenei wiki';

  @override
  String get lastMonthLabel => 'I tera Marama';

  @override
  String get chatTitle => 'Kōrerorero';

  @override
  String get typeYourQuestionHint => 'Patohia to patai...';

  @override
  String get paymentRequired => 'Utu e hiahiatia ana';

  @override
  String get paymentRequiredMessage =>
      'Kua whakamahia e koe o patai koreutu. Utu ₹50 ki te haere tonu.';

  @override
  String get payNowButton => 'Utu Inaianei';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count nga paatai koreutu e toe ana';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count e toe ana nga patai utu';
  }

  @override
  String get thankYouFeedback => 'Mauruuru koe mo to urupare!';

  @override
  String get ratingSubmitted => 'Whakatauranga i tukuna!';

  @override
  String get setUserIdFirst => 'Whakatakotoria to ID Kaiwhakamahi i te tuatahi';

  @override
  String get failedToFetchPrevious =>
      'I rahua te tiki i nga patai me nga whakautu o mua';

  @override
  String errorOccurred(Object error) {
    return 'Hapa: $error';
  }

  @override
  String get drawerAstroProfile => 'Kōtaha Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope ia ra';

  @override
  String get drawerBuyQuestions => 'Hokona nga patai';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Tautuhinga';

  @override
  String get drawerCustomerSupport => 'Tautoko Kiritaki';

  @override
  String get drawerAbout => 'Mō';

  @override
  String get drawerProfileSettings => 'Tautuhinga Kōtaha';

  @override
  String get demoNotificationTitle => '🔔 Whakaaturanga Whakaaturanga';

  @override
  String get demoNotificationBody =>
      'He panui whakamatautau tenei mai i to taupānga!';

  @override
  String get notificationsTitle => 'Whakamōhiotanga';

  @override
  String get noNotifications => 'Kaore he panui';

  @override
  String get allTab => 'Katoa';

  @override
  String get markAllAsRead => 'Tohu katoa kua panuitia';

  @override
  String get notificationMarkedRead => 'Kua tohua te panui kua panuitia';

  @override
  String get failedToLoadNotifications => 'I rahua te uta whakamohiotanga';

  @override
  String get failedToMarkRead => 'I rahua te tohu kua panuitia';

  @override
  String get failedToMarkAllRead => 'I rahua te tohu katoa kua panuitia';

  @override
  String get socketConnected => 'Tuhono hono';

  @override
  String get socketDisconnected => 'Kua momotu te turanga';

  @override
  String get newNotificationReceived => 'Kua tae mai he panui hou';

  @override
  String get generalCategory => 'Whānui';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Kōrerorero';

  @override
  String get systemCategory => 'Pūnaha';

  @override
  String get updateCategory => 'Nga whakahou';

  @override
  String get howToAskTitle => 'Me pehea te patai';

  @override
  String get noQuestionsAvailable => 'Karekau he patai e waatea ana';

  @override
  String get failedToLoadQuestions => 'I rahua te uta i nga patai';

  @override
  String get pullToRefresh => 'Toia ki te tāmata';

  @override
  String get careerCategory => 'Mahi';

  @override
  String get loveCategory => 'Aroha & Whanaungatanga';

  @override
  String get healthCategory => 'Hauora';

  @override
  String get financeCategory => 'Pūtea';

  @override
  String get familyCategory => 'Whanau';

  @override
  String get educationCategory => 'Mātauranga';

  @override
  String get travelCategory => 'Haerenga';

  @override
  String get spiritualCategory => 'Wairua';

  @override
  String get profileLoaded => 'I momoho te utaina o te kōtaha';

  @override
  String get imageUploaded => 'I pai te tukunga ake o te ahua';

  @override
  String get savedInformationConfirmation => 'Kua Tiaki e ahau tenei korero';

  @override
  String get noHistoryAvailable => 'Karekau he hitori e waatea ana';

  @override
  String get missingUserIdError => 'Ko te ID Kaiwhakamahi e hiahiatia ana';

  @override
  String get networkError => 'Hapa whatunga. Me ngana ano.';

  @override
  String get timeoutError => 'Kua pau te tono';

  @override
  String get genericError => 'Kua he tetahi';

  @override
  String get reactionUpdateError => 'I rahua te whakahōu tauhohenga';

  @override
  String get noSearchResults => 'Karekau he kitenga rapunga';

  @override
  String get clearSearch => 'Maama te rapu';

  @override
  String get resultsFound => 'Kua kitea nga hua';

  @override
  String get recoverySecretHint =>
      'Kare pea te kape-whakapiri e mahi, pato a ringa';

  @override
  String get recoverAccountDescription =>
      'A pee i enei mahi ki te whakaora i to putea';

  @override
  String get processingLabel => 'Tukatuka...';

  @override
  String get clearChatSuccess => 'I pai te whakakore i nga korero';

  @override
  String get notificationsEnabled => 'Kua whakahohea nga whakamohiotanga';

  @override
  String get notificationsDisabled => 'Kua monoa nga whakamohiotanga';

  @override
  String get securityNotice => 'Kua whakamunatia, kua rongoatia o raraunga';

  @override
  String get loading => 'Uta ana...';

  @override
  String get selectLanguage => 'Tīpakohia te Reo';

  @override
  String get onboardingGetStartedDesc => 'Me timata ma te whiriwhiri i to reo';

  @override
  String get accountRecoveryTitle => '🔐 Nga Taipitopito Whakaora Kaute';

  @override
  String get recoveryInstructions =>
      'Tena koa tiakina enei korero kia mau. Ka hiahia koe ki te whakaora i to putea.';

  @override
  String get importantNotice => '⚠️ He mea nui:';

  @override
  String get astrologerProfileTitle => 'Tohunga Kairangi';

  @override
  String get personalAstrologer => 'Kairangi Whaiaro';

  @override
  String get makePersonalAstrologer => 'Hanga Whaiaro Astrologer';

  @override
  String get favoriteDescription =>
      'Ko o patai ka aro nui ki tenei tohunga whetu. Mena kaore i te waatea, ma tetahi atu tohunga wheturangi e awhina i a koe.';

  @override
  String get educationQualifications => 'Mātauranga & Tohu';

  @override
  String get aboutSection => 'Mō';

  @override
  String get shareProfile => 'Tiri Kōtaha';

  @override
  String get loadingAstrologer =>
      'E uta ana i nga korero a te tohunga whetu...';

  @override
  String get failedToLoadAstrologer =>
      'I rahua te uta i nga korero a te kaitirotiro whetu';

  @override
  String get authenticationRequired =>
      'Motuhēhēnga e hiahiatia ana. Tena koa takiuru.';

  @override
  String securityCheckFailed(Object error) {
    return 'I rahua te taki haumarutanga: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 Ko $name to Kairangi Whaiaro inaianei';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ I tangohia $name mai i nga makau';
  }

  @override
  String get toggleFavoriteError => 'I rahua te whakahōu i te tūnga tino pai';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Mātauranga: $education\n📜 Tohu: $qualification\n⏳ He wheako: $experience';
  }

  @override
  String get notProvided => 'Kaore i whakaratohia';

  @override
  String reviews(Object count) {
    return '($count arotake)';
  }

  @override
  String get specialties => 'Nga tohungatanga';

  @override
  String get experience => 'Te wheako';

  @override
  String get qualification => 'Tohu';

  @override
  String get education => 'Mātauranga';

  @override
  String get recoveryTips =>
      '• Tangohia he whakaahua o enei korero\n• Whakaorangia ki te waahi haumaru\n• Kaua e tohatoha ki tetahi\n• Kotahi anake te whakaaturanga';

  @override
  String get themeSettingsTitle => 'Tautuhinga Kaupapa';

  @override
  String get lightThemeLabel => 'Maama';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'pouri';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Pūnaha';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
