// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hawaiian (`haw`).
class AppLocalizationsHaw extends AppLocalizations {
  AppLocalizationsHaw([String locale = 'haw']) : super(locale);

  @override
  String get settingsTitle => 'Nā hoʻonohonoho';

  @override
  String get notificationSettings => 'Nā hoʻonohonoho hoʻolaha';

  @override
  String get privacySettings => 'Nā hoʻonohonoho pilikino';

  @override
  String get accountSettings => 'Hoʻonohonoho moʻokāki';

  @override
  String get languageSettings => 'Hoʻonohonoho ʻōlelo';

  @override
  String get languageChanged => 'Ua loli ka ʻōlelo';

  @override
  String get existingUserButton => 'He mea hoʻohana au';

  @override
  String get chooseCountryTitle => 'E koho i ka ʻāina';

  @override
  String get yesText => 'ʻAe';

  @override
  String get noText => 'ʻAʻole';

  @override
  String get appBarTitle => 'Nā hoʻonohonoho hoʻonohonoho';

  @override
  String get userIdLabel => 'ID mea hoʻohana *';

  @override
  String get nameLabel => 'inoa';

  @override
  String get birthCountryLabel => 'ʻāina hānau';

  @override
  String get birthCityLabel => 'Kulanakauhale Hanau';

  @override
  String get countrySelectionTitle => 'E koho i kou ʻāina';

  @override
  String get maleLabel => 'Kane';

  @override
  String get femaleLabel => 'Wahine';

  @override
  String get birthDateLabel => 'La Hanau';

  @override
  String get birthDatePlaceholder => 'E koho i ka lā hānau';

  @override
  String get birthTimeLabel => 'Manawa Hanau';

  @override
  String get birthTimePlaceholder => 'E koho i ka manawa hānau';

  @override
  String get saveProfileButton => 'E mālama i ka moʻolelo';

  @override
  String get noCitiesFound => 'ʻAʻohe kūlanakauhale i loaʻa';

  @override
  String cityPlaceholder(Object country) {
    return 'E komo i ke kūlanakauhale ma $country';
  }

  @override
  String get countryFirstPlaceholder => 'E koho mua i ka ʻāina';

  @override
  String get versionHistoryTitle => 'Moʻolelo moʻolelo';

  @override
  String get notSetText => 'ʻAʻole i hoʻonohonoho ʻia';

  @override
  String nameHistory(Object name) {
    return 'Inoa: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Kulanakauhale: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ʻĀina: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Ke kāne kāne: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'La Hanau: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Manawa Hanau: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Wahi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Wahi manawa: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Mokuʻāina: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Hōʻano hou ʻia ma $date';
  }

  @override
  String get userIdRequired => 'Pono ka mea hoʻohana ID';

  @override
  String get profileSaved => 'Ua mālama pono ʻia ka moʻolelo';

  @override
  String get saveFailed => 'ʻAʻole hiki ke mālama i ka moʻolelo';

  @override
  String get errorPrefix => 'Kuʻia:';

  @override
  String get onboardingChooseLanguage => 'E koho i kāu ʻōlelo';

  @override
  String get onboardingChooseLanguageDesc =>
      'E koho i kāu ʻōlelo makemake e hoʻomau.';

  @override
  String get onboardingWhatIsAstrology => 'He aha ka Astrology?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ʻO ka Astrology ke aʻo ʻana i nā kino lani ...';

  @override
  String get onboardingWhyUseApp =>
      'No ke aha e hoʻohana ai i kēia polokalamu?';

  @override
  String get onboardingWhyUseAppDesc =>
      'E kiʻi i nā horoscopes pilikino, nā wānana i kēlā me kēia lā, a me ke alakaʻi e hoʻoholo i nā hoʻoholo.';

  @override
  String get onboardingHowToUse => 'Pehea e hoʻohana ai i kēia polokalamu?';

  @override
  String get onboardingHowToUseDesc =>
      'E hoʻokele maʻalahi, e nānā i nā horoscopes i kēlā me kēia lā, a mālama i kāu ʻaoʻao no nā wānana pololei.';

  @override
  String get onboardingGetStarted => 'E hoʻomaka';

  @override
  String get onboardingNewUser => 'Mea hoʻohana hou';

  @override
  String get onboardingExistingUser => 'Mea hoʻohana e kū nei';

  @override
  String get onboardingBack => 'Ke kua';

  @override
  String get onboardingNext => 'Aʻe';

  @override
  String get userIdNotFound =>
      'ʻAʻole i loaʻa ka ID mea hoʻohana. E ʻoluʻolu e ʻeʻe a hoʻonohonoho i kāu ʻaoʻao.';

  @override
  String get clearNotificationsTitle => 'Hōʻike maopopo';

  @override
  String get clearNotificationsMessage =>
      'Makemake ʻoe e holoi i nā leka hoʻomaopopo a pau?';

  @override
  String get clearNotificationsSuccess =>
      'Holoi ʻia nā leka hoʻomaopopo a pau.';

  @override
  String get clearHoroscopeTitle => 'Hoʻomaʻamaʻa Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Makemake ʻoe e holoi i kāu ʻikepili horoscope?';

  @override
  String get clearHoroscopeSuccess => 'Holopono ʻia ka Horoscope.';

  @override
  String get clearChatTitle => 'Holoi i ka mōʻaukala kamaʻilio';

  @override
  String get clearChatMessage =>
      'Makemake ʻoe e holoi i kāu mōʻaukala kamaʻilio āpau?';

  @override
  String get clearChatLocal => 'Holoi ʻia ke kamaʻilio ma ka ʻāina.';

  @override
  String get deleteAccountTitle => 'Holoi moʻokāki';

  @override
  String get deleteAccountMessage =>
      'Makemake ʻoe e holoi i kāu moʻokāki? E holoi pū kēia i kāu mōʻaukala kamaʻilio a me nā leka hoʻomaopopo.';

  @override
  String get deleteAccountSuccess =>
      'Ua wehe ʻia kāu moʻokāki a me nā ʻikepili āpau.';

  @override
  String get deleteAccountError => 'Ua hewa ke holoi ʻana i ka moʻokāki';

  @override
  String get logoutTitle => 'Haʻalele';

  @override
  String get logoutMessage => 'Makemake ʻoe e haʻalele?';

  @override
  String get termsPrivacyTitle => 'Nā ʻōlelo a me ka pilikino';

  @override
  String get privacyPolicyTitle => 'Kulekele pilikino';

  @override
  String get termsConditionsTitle => 'Nā Kūlana a me nā Kūlana';

  @override
  String get dataControlTitle => 'Manaʻoʻikepili';

  @override
  String get cancelButton => 'Hoʻopau';

  @override
  String get confirmButton => 'E hōʻoia';

  @override
  String get clearQuestionsSuccess => 'Holoi pono nā nīnau a pau.';

  @override
  String get yoginiLabel => 'ʻo Yogini';

  @override
  String get lordLabel => 'Haku';

  @override
  String get startLabel => 'Hoʻomaka';

  @override
  String get recoverAccount => 'Hoihoi mooolelo';

  @override
  String get endLabel => 'Hoʻopau';

  @override
  String get startDateLabel => 'lā hoʻomaka';

  @override
  String get endDateLabel => 'Lā Hoʻopau';

  @override
  String get notAvailable => 'ʻAʻole loaʻa';

  @override
  String get noData => 'ʻAʻohe ʻikepili';

  @override
  String get unknownError => 'Kupa ʻike ʻole ʻia';

  @override
  String get retryButton => 'E hoao hou';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Palapala Kiʻi Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Kiekie Kiekie';

  @override
  String get vimshottariDashaTitle => 'ʻO Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'ʻO Yogini Dasha';

  @override
  String get unknown => 'ʻAʻole ʻike ʻia';

  @override
  String get clearHoroscope => 'Hōʻikeʻikeʻike';

  @override
  String get clearNotifications => 'Hōʻike maopopo';

  @override
  String get clearChatHistory => 'Holoi i ka mōʻaukala kamaʻilio';

  @override
  String get logout => 'Haʻalele';

  @override
  String get deleteAccount => 'Holoi moʻokāki';

  @override
  String get allFieldsRequired => 'Pono nā kahua āpau.';

  @override
  String get accountRecoveredSuccess => 'Loaʻa ka moʻokāki.';

  @override
  String get recoveryFailed => 'ʻAʻole hiki ke hoʻihoʻi. E nānā i kāu ʻike.';

  @override
  String get recoverySecretLabel => 'Mea huna hoʻihoʻi:';

  @override
  String get aboutUsTitle => 'E pili ana iā mākou';

  @override
  String get aboutOurCompany => 'E pili ana i kā mākou Hui';

  @override
  String get aboutCompanyDescription =>
      'Kūpaʻa mākou i ka hāʻawi ʻana i ka ʻike astrology maikaʻi loa i kā mākou mea hoʻohana.';

  @override
  String get ourMission => 'Ko makou Misiona';

  @override
  String get missionDescription =>
      'E hāʻawi i nā ʻike astrology pololei a pilikino e kōkua i nā mea hoʻohana e hoʻoholo i ka ʻike i ko lākou ola.';

  @override
  String get ourVision => 'ʻO kā mākou ʻike';

  @override
  String get visionDescription =>
      'E lilo i mea hilinaʻi nui astrology platform, e hui pū ana i ka ʻenehana a me ka naʻauao kahiko.';

  @override
  String get ourValues => 'Ko makou Waiwai';

  @override
  String get valuesDescription =>
      'Pono, Pono, Hoʻolālā Mea Hoʻohana, a me ka Hoʻomau mau.';

  @override
  String get contactUs => 'Kāhea iā mā˚ou';

  @override
  String get contactEmail => 'Leka uila: support@yourcompany.com';

  @override
  String get contactWebsite => 'Paena pūnaewele: www.yourcompany.com';

  @override
  String get customerSupport => 'Kākoʻo mea kūʻai aku';

  @override
  String get supportHeroTitle => 'Aia mākou e kōkua';

  @override
  String get supportHeroDescription =>
      'E hoʻopiha i ka palapala ma lalo a e hoʻi koke mai kā mākou hui kākoʻo iā ʻoe i ka hikiwawe.';

  @override
  String get yourName => 'Kou inoa';

  @override
  String get yourEmail => 'ʻO kāu leka uila';

  @override
  String get message => 'ʻŌlelo';

  @override
  String get enterEmail => 'E hoʻokomo i kāu leka uila';

  @override
  String get enterValidEmail => 'E hoʻokomo i kahi leka uila kūpono';

  @override
  String enterField(Object fieldName) {
    return 'E komo i $fieldName';
  }

  @override
  String get send => 'Hoʻouna';

  @override
  String get sending => 'E hoʻouna ana...';

  @override
  String get emailSentSuccess => '✅ Ua hoʻouna maikaʻi ʻia ka leka uila!';

  @override
  String get emailSendFailed => '❌ ʻAʻole i hoʻouna ʻia ka leka uila';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Huli huaʻōlelo...';

  @override
  String get noTermsFound => 'ʻAʻohe huaʻōlelo i loaʻa';

  @override
  String get buyQuestionsTitle => 'Kūʻai i nā nīnau';

  @override
  String get userNotAuthenticated => 'ʻAʻole i hōʻoia ʻia ka mea hoʻohana';

  @override
  String get loadStoreDataFailed =>
      'ʻAʻole hiki ke hoʻouka i ka ʻikepili hale kūʻai';

  @override
  String get missingAuthToken => 'Nalo ka hōʻailona hōʻoia';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Ua holomua ka uku! Hoʻouna ʻia ka nīnau';

  @override
  String paymentFailed(Object error) {
    return '❌ Ua hāʻule ka uku: $error';
  }

  @override
  String get yourBalance => 'Kou Kaulike';

  @override
  String questionsBalance(Object count) {
    return '$count Nīnau';
  }

  @override
  String get availableOffers => 'Loaʻa nā Hāʻawi';

  @override
  String questionsCount(Object count) {
    return '$count Nīnau';
  }

  @override
  String get buyButton => 'Kūʻai';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope i kēlā me kēia lā';

  @override
  String get userIdMissing => 'Nalo ka ID mea hoʻohana';

  @override
  String get fetchHoroscopesFailed => 'ʻAʻole hiki ke kiʻi i nā horoscope';

  @override
  String get noHoroscopeFound => 'ʻAʻohe horoscope i loaʻa.';

  @override
  String get signLabel => 'hōʻailona';

  @override
  String get todayLabel => 'I kēia lā';

  @override
  String get yesterdayLabel => 'I nehinei';

  @override
  String get thisWeekLabel => 'I keia pule';

  @override
  String get lastMonthLabel => 'I ka mahina i hala';

  @override
  String get chatTitle => 'Kūkākūkā';

  @override
  String get typeYourQuestionHint => 'Kākau i kāu nīnau...';

  @override
  String get paymentRequired => 'Pono ka uku';

  @override
  String get paymentRequiredMessage =>
      'Ua hoʻohana ʻoe i kāu mau nīnau manuahi. E uku iā ₹50 e hoʻomau.';

  @override
  String get payNowButton => 'Uku Ano';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count mau nīnau manuahi i koe';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count nā nīnau uku i koe';
  }

  @override
  String get thankYouFeedback => 'Mahalo iā ʻoe no kāu manaʻo manaʻo!';

  @override
  String get ratingSubmitted => 'Hāʻawi ʻia ka helu!';

  @override
  String get setUserIdFirst =>
      'E ʻoluʻolu e hoʻonohonoho mua i kāu ID mea hoʻohana';

  @override
  String get failedToFetchPrevious =>
      'ʻAʻole i kiʻi i nā nīnau a me nā pane mua';

  @override
  String errorOccurred(Object error) {
    return 'Hapa: $error';
  }

  @override
  String get drawerAstroProfile => 'Hōʻike Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope i kēlā me kēia lā';

  @override
  String get drawerBuyQuestions => 'Kūʻai i nā nīnau';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Nā hoʻonohonoho';

  @override
  String get drawerCustomerSupport => 'Kākoʻo mea kūʻai aku';

  @override
  String get drawerAbout => 'E pili ana';

  @override
  String get drawerProfileSettings => 'Nā hoʻonohonoho hoʻonohonoho';

  @override
  String get demoNotificationTitle => '🔔 Hoolaha Demo';

  @override
  String get demoNotificationBody => 'He leka ho\'āʻo kēia mai kāu polokalamu!';

  @override
  String get notificationsTitle => 'Hoolaha';

  @override
  String get noNotifications => 'ʻAʻohe hoʻolaha';

  @override
  String get allTab => 'ʻO nā mea a pau';

  @override
  String get markAllAsRead => 'E kaha i na mea a pau i heluheluia';

  @override
  String get notificationMarkedRead => 'Heluhelu ʻia ka leka hoʻomaopopo';

  @override
  String get failedToLoadNotifications =>
      'ʻAʻole hiki ke hoʻouka i nā leka hoʻomaopopo';

  @override
  String get failedToMarkRead =>
      'ʻAʻole i hōʻailona ʻia e like me ka heluhelu ʻana';

  @override
  String get failedToMarkAllRead =>
      'ʻAʻole hiki ke kaha i nā mea a pau i heluhelu ʻia';

  @override
  String get socketConnected => 'Hoʻopili ʻia ke kumu';

  @override
  String get socketDisconnected => 'Ua hemo ke kumu';

  @override
  String get newNotificationReceived => 'Loaʻa ka hoʻolaha hou';

  @override
  String get generalCategory => 'Generala';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Kūkākūkā';

  @override
  String get systemCategory => 'Pūnaehana';

  @override
  String get updateCategory => 'Nā mea hou';

  @override
  String get howToAskTitle => 'Pehea e Ninau ai';

  @override
  String get noQuestionsAvailable => 'ʻAʻohe nīnau i loaʻa';

  @override
  String get failedToLoadQuestions => 'ʻAʻole hiki ke hoʻouka i nā nīnau';

  @override
  String get pullToRefresh => 'Huki e hōʻoluʻolu';

  @override
  String get careerCategory => 'ʻoihana';

  @override
  String get loveCategory => 'Aloha & Pilina';

  @override
  String get healthCategory => 'Ola kino';

  @override
  String get financeCategory => 'Waiwai';

  @override
  String get familyCategory => 'ʻOhana';

  @override
  String get educationCategory => 'Hoʻonaʻauao';

  @override
  String get travelCategory => 'Kaahele';

  @override
  String get spiritualCategory => 'ʻuhane';

  @override
  String get profileLoaded => 'Hoʻouka pono ʻia ka moʻolelo';

  @override
  String get imageUploaded => 'Hoʻouka maikaʻi ʻia ke kiʻi';

  @override
  String get savedInformationConfirmation => 'Ua mālama au i kēia ʻike';

  @override
  String get noHistoryAvailable => 'ʻAʻohe mōʻaukala i loaʻa';

  @override
  String get missingUserIdError => 'Pono ka mea hoʻohana ID';

  @override
  String get networkError => 'Kuwaho pūnaewele. E ʻoluʻolu e hoʻāʻo hou.';

  @override
  String get timeoutError => 'Ua pau ka manawa noi';

  @override
  String get genericError => 'Ua hewa kekahi mea';

  @override
  String get reactionUpdateError => 'ʻAʻole hiki ke hōʻano hou i ka pane';

  @override
  String get noSearchResults => 'ʻAʻohe hualoaʻa i loaʻa';

  @override
  String get clearSearch => 'Holoi i ka huli';

  @override
  String get resultsFound => 'Loaʻa nā hopena';

  @override
  String get recoverySecretHint =>
      'ʻAʻole hiki ke hana kope-paʻi, paʻi lima me ka lima';

  @override
  String get recoverAccountDescription =>
      'E hahai i kēia mau ʻanuʻu e hoʻihoʻi i kāu moʻokāki';

  @override
  String get processingLabel => 'Ke hana nei...';

  @override
  String get clearChatSuccess => 'Holoi ʻia ke kamaʻilio ʻana';

  @override
  String get notificationsEnabled => 'Ua hiki ke hoolaha';

  @override
  String get notificationsDisabled => 'Ua pio nā leka hoʻomaopopo';

  @override
  String get securityNotice => 'Hoʻopili paʻa ʻia kāu ʻikepili a mālama ʻia';

  @override
  String get loading => 'Ke hoʻouka nei...';

  @override
  String get selectLanguage => 'E koho i ka ʻōlelo';

  @override
  String get onboardingGetStartedDesc =>
      'E hoʻomaka ma ke koho ʻana i kāu ʻōlelo';

  @override
  String get accountRecoveryTitle => '🔐 Nā kikoʻī hoʻihoʻi moʻokāki';

  @override
  String get recoveryInstructions =>
      'E mālama pono i kēia ʻike. Pono ʻoe e hoʻihoʻi i kāu moʻokāki.';

  @override
  String get importantNotice => '⚠️ Mea nui:';

  @override
  String get astrologerProfileTitle => 'Palapala Hoku';

  @override
  String get personalAstrologer => 'Ka Hoku Pilikino';

  @override
  String get makePersonalAstrologer => 'Hana Pilikino Astrologer';

  @override
  String get favoriteDescription =>
      'E kau mua ʻia kāu mau nīnau i kēia kilo. Inā ʻaʻole i loaʻa, e kōkua ʻia ʻoe e kahi kilo kilo ʻē aʻe.';

  @override
  String get educationQualifications => 'Hoʻonaʻauao & Kuʻina';

  @override
  String get aboutSection => 'E pili ana';

  @override
  String get shareProfile => 'Kaʻana moʻolelo';

  @override
  String get loadingAstrologer => 'Ke hoʻouka nei i nā kikoʻī astrologer...';

  @override
  String get failedToLoadAstrologer =>
      'ʻAʻole hiki ke hoʻouka i nā kikoʻī astrologer';

  @override
  String get authenticationRequired => 'Pono ka hōʻoia. E ʻoluʻolu e komo.';

  @override
  String securityCheckFailed(Object error) {
    return 'ʻAʻole hiki ke nānā palekana: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 ʻO $name kāu kanaka Astrologer';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Wehe ʻia $name mai nā punahele';
  }

  @override
  String get toggleFavoriteError =>
      'ʻAʻole hiki ke hōʻano hou i ke kūlana punahele';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Hoʻonaʻauao: $education\n📜 Koho: $qualification\n⏳ ʻIke: $experience';
  }

  @override
  String get notProvided => 'ʻAʻole hāʻawi ʻia';

  @override
  String reviews(Object count) {
    return '($count hōʻike manaʻo)';
  }

  @override
  String get specialties => 'Nā mea kūikawā';

  @override
  String get experience => 'ʻike';

  @override
  String get qualification => 'Kupono';

  @override
  String get education => 'Hoʻonaʻauao';

  @override
  String get recoveryTips =>
      '• E paʻi kiʻi paʻi kiʻi o kēia ʻike\n• E mālama ma kahi paʻa\n• Mai kaʻana like me kekahi\n• Hoʻokahi wale nō e hōʻike ʻia kēia';
}
