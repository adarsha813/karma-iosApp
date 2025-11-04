// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get settingsTitle => 'Mipangilio';

  @override
  String get notificationSettings => 'Mipangilio ya Arifa';

  @override
  String get privacySettings => 'Mipangilio ya Faragha';

  @override
  String get accountSettings => 'Mipangilio ya Akaunti';

  @override
  String get languageSettings => 'Mipangilio ya Lugha';

  @override
  String get languageChanged => 'Lugha imebadilika';

  @override
  String get existingUserButton => 'Mimi ni mtumiaji aliyepo';

  @override
  String get chooseCountryTitle => 'Chagua Nchi';

  @override
  String get yesText => 'Ndiyo';

  @override
  String get noText => 'Hapana';

  @override
  String get appBarTitle => 'Mipangilio ya Wasifu';

  @override
  String get userIdLabel => 'Kitambulisho cha Mtumiaji *';

  @override
  String get nameLabel => 'Jina';

  @override
  String get birthCountryLabel => 'Nchi ya Kuzaliwa';

  @override
  String get birthCityLabel => 'Mji wa kuzaliwa';

  @override
  String get countrySelectionTitle => 'Chagua nchi yako';

  @override
  String get maleLabel => 'Mwanaume';

  @override
  String get femaleLabel => 'Mwanamke';

  @override
  String get birthDateLabel => 'Tarehe ya Kuzaliwa';

  @override
  String get birthDatePlaceholder => 'Chagua Tarehe ya Kuzaliwa';

  @override
  String get birthTimeLabel => 'Wakati wa Kuzaliwa';

  @override
  String get birthTimePlaceholder => 'Chagua Wakati wa Kuzaliwa';

  @override
  String get saveProfileButton => 'Hifadhi Wasifu';

  @override
  String get noCitiesFound => 'Hakuna miji iliyopatikana';

  @override
  String cityPlaceholder(Object country) {
    return 'Ingiza jiji katika $country';
  }

  @override
  String get countryFirstPlaceholder => 'Chagua nchi kwanza';

  @override
  String get versionHistoryTitle => 'Historia ya Toleo';

  @override
  String get notSetText => 'Haijawekwa';

  @override
  String nameHistory(Object name) {
    return 'Jina: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Mji: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Nchi: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jinsia: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tarehe ya Kuzaliwa: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Wakati wa Kuzaliwa: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Mahali: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Saa za eneo: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Jimbo: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ilisasishwa mnamo $date';
  }

  @override
  String get userIdRequired => 'Kitambulisho cha Mtumiaji kinahitajika';

  @override
  String get profileSaved => 'Wasifu umehifadhiwa';

  @override
  String get saveFailed => 'Imeshindwa kuhifadhi wasifu';

  @override
  String get errorPrefix => 'Hitilafu:';

  @override
  String get onboardingChooseLanguage => 'Chagua Lugha Yako';

  @override
  String get onboardingChooseLanguageDesc =>
      'Chagua lugha unayopendelea ili kuendelea.';

  @override
  String get onboardingWhatIsAstrology => 'Unajimu ni nini?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Unajimu ni utafiti wa mambo ya anga...';

  @override
  String get onboardingWhyUseApp => 'Kwa nini utumie programu hii?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Pata nyota zilizobinafsishwa, ubashiri wa kila siku na mwongozo ili kufanya maamuzi sahihi.';

  @override
  String get onboardingHowToUse => 'Jinsi ya kutumia programu hii?';

  @override
  String get onboardingHowToUseDesc =>
      'Sogeza kwa urahisi, angalia nyota za kila siku, na udhibiti wasifu wako kwa utabiri sahihi.';

  @override
  String get onboardingGetStarted => 'Anza';

  @override
  String get onboardingNewUser => 'Mtumiaji Mpya';

  @override
  String get onboardingExistingUser => 'Mtumiaji Aliyepo';

  @override
  String get onboardingBack => 'Nyuma';

  @override
  String get onboardingNext => 'Inayofuata';

  @override
  String get userIdNotFound =>
      'Kitambulisho cha Mtumiaji hakijapatikana. Tafadhali ingia au weka wasifu wako.';

  @override
  String get clearNotificationsTitle => 'Futa Arifa';

  @override
  String get clearNotificationsMessage =>
      'Je, una uhakika unataka kufuta arifa zote?';

  @override
  String get clearNotificationsSuccess => 'Arifa zote zimefutwa.';

  @override
  String get clearHoroscopeTitle => 'Nyota ya wazi';

  @override
  String get clearHoroscopeMessage =>
      'Je, una uhakika unataka kufuta data yako ya nyota?';

  @override
  String get clearHoroscopeSuccess => 'Nyota imefutwa.';

  @override
  String get clearChatTitle => 'Futa Historia ya Gumzo';

  @override
  String get clearChatMessage =>
      'Je, una uhakika unataka kufuta historia yako yote ya gumzo?';

  @override
  String get clearChatLocal => 'Gumzo limefutwa ndani ya nchi.';

  @override
  String get deleteAccountTitle => 'Futa Akaunti';

  @override
  String get deleteAccountMessage =>
      'Je, una uhakika unataka kufuta akaunti yako? Hii pia itafuta historia yako yote ya gumzo na arifa.';

  @override
  String get deleteAccountSuccess => 'Akaunti yako na data zote zimeondolewa.';

  @override
  String get deleteAccountError => 'Hitilafu katika kufuta akaunti';

  @override
  String get logoutTitle => 'Ondoka';

  @override
  String get logoutMessage => 'Je, una uhakika unataka kuondoka?';

  @override
  String get termsPrivacyTitle => 'Masharti na Faragha';

  @override
  String get privacyPolicyTitle => 'Sera ya Faragha';

  @override
  String get termsConditionsTitle => 'Sheria na Masharti';

  @override
  String get dataControlTitle => 'Udhibiti wa Data';

  @override
  String get cancelButton => 'Ghairi';

  @override
  String get confirmButton => 'Thibitisha';

  @override
  String get clearQuestionsSuccess => 'Maswali yote yamefutwa.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Bwana';

  @override
  String get startLabel => 'Anza';

  @override
  String get recoverAccount => 'Rejesha Akaunti';

  @override
  String get endLabel => 'Mwisho';

  @override
  String get startDateLabel => 'Tarehe ya Kuanza';

  @override
  String get endDateLabel => 'Tarehe ya Mwisho';

  @override
  String get notAvailable => 'Haipatikani';

  @override
  String get noData => 'Hakuna data';

  @override
  String get unknownError => 'Hitilafu isiyojulikana';

  @override
  String get retryButton => 'Jaribu tena';

  @override
  String get kundaliGeneratorTitle => 'Jenereta ya Kundali';

  @override
  String get natalChartTitle => 'Chati ya Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Shahada ya Kupanda';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Haijulikani';

  @override
  String get clearHoroscope => 'Nyota ya wazi';

  @override
  String get clearNotifications => 'Futa Arifa';

  @override
  String get clearChatHistory => 'Futa Historia ya Gumzo';

  @override
  String get logout => 'Ondoka';

  @override
  String get deleteAccount => 'Futa Akaunti';

  @override
  String get allFieldsRequired => 'Sehemu zote zinahitajika.';

  @override
  String get accountRecoveredSuccess => 'Akaunti imerejeshwa.';

  @override
  String get recoveryFailed => 'Urejeshaji haukufaulu. Angalia maelezo yako.';

  @override
  String get recoverySecretLabel => 'Siri ya kurejesha:';

  @override
  String get aboutUsTitle => 'Kuhusu Sisi';

  @override
  String get aboutOurCompany => 'Kuhusu Kampuni Yetu';

  @override
  String get aboutCompanyDescription =>
      'Tumejitolea kuwasilisha hali bora zaidi ya unajimu kwa watumiaji wetu.';

  @override
  String get ourMission => 'Dhamira Yetu';

  @override
  String get missionDescription =>
      'Ili kutoa maarifa sahihi na ya kibinafsi ya unajimu ili kuwasaidia watumiaji kufanya maamuzi sahihi katika maisha yao.';

  @override
  String get ourVision => 'Maono Yetu';

  @override
  String get visionDescription =>
      'Ili kuwa jukwaa la unajimu linaloaminika zaidi, linalochanganya teknolojia na hekima ya zamani.';

  @override
  String get ourValues => 'Maadili Yetu';

  @override
  String get valuesDescription =>
      'Uadilifu, Usahihi, Muundo wa Msingi wa Mtumiaji, na Ubunifu Unaoendelea.';

  @override
  String get contactUs => 'Wasiliana Nasi';

  @override
  String get contactEmail => 'Barua pepe: support@yourcompany.com';

  @override
  String get contactWebsite => 'Tovuti: www.yourcompany.com';

  @override
  String get customerSupport => 'Usaidizi wa Wateja';

  @override
  String get supportHeroTitle => 'Tuko Hapa Kusaidia';

  @override
  String get supportHeroDescription =>
      'Jaza fomu iliyo hapa chini na timu yetu ya usaidizi itarejea kwako haraka iwezekanavyo.';

  @override
  String get yourName => 'Jina Lako';

  @override
  String get yourEmail => 'Barua pepe yako';

  @override
  String get message => 'Ujumbe';

  @override
  String get enterEmail => 'Weka barua pepe yako';

  @override
  String get enterValidEmail => 'Weka barua pepe halali';

  @override
  String enterField(Object fieldName) {
    return 'Weka $fieldName';
  }

  @override
  String get send => 'Tuma';

  @override
  String get sending => 'Inatuma...';

  @override
  String get emailSentSuccess => '✅ Barua pepe imetumwa kwa mafanikio!';

  @override
  String get emailSendFailed => '❌ Imeshindwa kutuma barua pepe';

  @override
  String get astroDictionaryTitle => 'Kamusi ya Astro';

  @override
  String get searchTermsHint => 'Hoja za utafutaji...';

  @override
  String get noTermsFound => 'Hakuna masharti yaliyopatikana';

  @override
  String get buyQuestionsTitle => 'Nunua Maswali';

  @override
  String get userNotAuthenticated => 'Mtumiaji hajathibitishwa';

  @override
  String get loadStoreDataFailed => 'Imeshindwa kupakia data ya hifadhi';

  @override
  String get missingAuthToken => 'Tokeni ya uthibitishaji haipo';

  @override
  String get merchantDisplayName => 'Programu ya Gumzo ya Astro';

  @override
  String get paymentSuccessful => '✅ Malipo yamefanikiwa! Swali limetumwa';

  @override
  String paymentFailed(Object error) {
    return '❌ Malipo yameshindwa: $error';
  }

  @override
  String get yourBalance => 'Mizani Yako';

  @override
  String questionsBalance(Object count) {
    return '$count Maswali';
  }

  @override
  String get availableOffers => 'Matoleo Yanayopatikana';

  @override
  String questionsCount(Object count) {
    return 'Swali la $count';
  }

  @override
  String get buyButton => 'Nunua';

  @override
  String get dailyHoroscopeTitle => '🌟 Nyota ya Kila Siku';

  @override
  String get userIdMissing => 'Kitambulisho cha Mtumiaji hakipo';

  @override
  String get fetchHoroscopesFailed => 'Imeshindwa kuleta nyota';

  @override
  String get noHoroscopeFound => 'Hakuna nyota iliyopatikana.';

  @override
  String get signLabel => 'Ishara';

  @override
  String get todayLabel => 'Leo';

  @override
  String get yesterdayLabel => 'Jana';

  @override
  String get thisWeekLabel => 'Wiki Hii';

  @override
  String get lastMonthLabel => 'Mwezi uliopita';

  @override
  String get chatTitle => 'Soga';

  @override
  String get typeYourQuestionHint => 'Andika swali lako...';

  @override
  String get paymentRequired => 'Malipo yanahitajika';

  @override
  String get paymentRequiredMessage =>
      'Umetumia maswali yako yasiyolipishwa. Lipa ₹50 ili kuendelea.';

  @override
  String get payNowButton => 'Lipa Sasa';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count maswali yasiyolipishwa yamesalia';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count maswali yanayolipwa yamesalia';
  }

  @override
  String get thankYouFeedback => 'Asante kwa maoni yako!';

  @override
  String get ratingSubmitted => 'Ukadiriaji umewasilishwa!';

  @override
  String get setUserIdFirst =>
      'Tafadhali weka Kitambulisho chako cha Mtumiaji kwanza';

  @override
  String get failedToFetchPrevious =>
      'Imeshindwa kuleta maswali na majibu yaliyotangulia';

  @override
  String errorOccurred(Object error) {
    return 'Hitilafu: $error';
  }

  @override
  String get drawerAstroProfile => 'Wasifu wa Astro';

  @override
  String get drawerDailyHoroscope => 'Nyota ya Kila siku';

  @override
  String get drawerBuyQuestions => 'Nunua Maswali';

  @override
  String get drawerAstroDictionary => 'Kamusi ya Astro';

  @override
  String get drawerSettings => 'Mipangilio';

  @override
  String get drawerCustomerSupport => 'Usaidizi wa Wateja';

  @override
  String get drawerAbout => 'Kuhusu';

  @override
  String get drawerProfileSettings => 'Mipangilio ya Wasifu';

  @override
  String get demoNotificationTitle => '🔔 Arifa ya Onyesho';

  @override
  String get demoNotificationBody =>
      'Hii ni arifa ya majaribio kutoka kwa programu yako!';

  @override
  String get notificationsTitle => 'Arifa';

  @override
  String get noNotifications => 'Hakuna arifa';

  @override
  String get allTab => 'Wote';

  @override
  String get markAllAsRead => 'Weka alama zote kama zimesomwa';

  @override
  String get notificationMarkedRead => 'Arifa imetiwa alama kuwa imesomwa';

  @override
  String get failedToLoadNotifications => 'Imeshindwa kupakia arifa';

  @override
  String get failedToMarkRead => 'Imeshindwa kutia alama kuwa imesomwa';

  @override
  String get failedToMarkAllRead =>
      'Imeshindwa kutia alama zote kuwa zimesomwa';

  @override
  String get socketConnected => 'Soketi imeunganishwa';

  @override
  String get socketDisconnected => 'Soketi imetenganishwa';

  @override
  String get newNotificationReceived => 'Arifa mpya imepokelewa';

  @override
  String get generalCategory => 'Mkuu';

  @override
  String get horoscopeCategory => 'Nyota';

  @override
  String get chatCategory => 'Soga';

  @override
  String get systemCategory => 'Mfumo';

  @override
  String get updateCategory => 'Sasisho';

  @override
  String get howToAskTitle => 'Jinsi ya Kuuliza';

  @override
  String get noQuestionsAvailable => 'Hakuna maswali yanayopatikana';

  @override
  String get failedToLoadQuestions => 'Imeshindwa kupakia maswali';

  @override
  String get pullToRefresh => 'Vuta ili kuonyesha upya';

  @override
  String get careerCategory => 'Kazi';

  @override
  String get loveCategory => 'Mapenzi na Mahusiano';

  @override
  String get healthCategory => 'Afya';

  @override
  String get financeCategory => 'Fedha';

  @override
  String get familyCategory => 'Familia';

  @override
  String get educationCategory => 'Elimu';

  @override
  String get travelCategory => 'Safari';

  @override
  String get spiritualCategory => 'Kiroho';

  @override
  String get profileLoaded => 'Wasifu umepakiwa';

  @override
  String get imageUploaded => 'Picha imepakiwa';

  @override
  String get savedInformationConfirmation => 'Nimehifadhi Habari Hii';

  @override
  String get noHistoryAvailable => 'Hakuna historia inayopatikana';

  @override
  String get missingUserIdError => 'Kitambulisho cha Mtumiaji kinahitajika';

  @override
  String get networkError => 'Hitilafu ya mtandao. Tafadhali jaribu tena.';

  @override
  String get timeoutError => 'Muda wa ombi umekwisha';

  @override
  String get genericError => 'Hitilafu fulani imetokea';

  @override
  String get reactionUpdateError => 'Imeshindwa kusasisha maoni';

  @override
  String get noSearchResults => 'Hakuna matokeo ya utafutaji yaliyopatikana';

  @override
  String get clearSearch => 'Futa utafutaji';

  @override
  String get resultsFound => 'Matokeo yamepatikana';

  @override
  String get recoverySecretHint =>
      'Nakili-kubandika inaweza kufanya kazi, chapa mwenyewe';

  @override
  String get recoverAccountDescription =>
      'Fuata hatua hizi ili kurejesha akaunti yako';

  @override
  String get processingLabel => 'Inachakata...';

  @override
  String get clearChatSuccess => 'Soga imefutwa';

  @override
  String get notificationsEnabled => 'Arifa zimewashwa';

  @override
  String get notificationsDisabled => 'Arifa zimezimwa';

  @override
  String get securityNotice =>
      'Data yako imesimbwa kwa njia fiche na kuhifadhiwa kwa usalama';

  @override
  String get loading => 'Inapakia...';

  @override
  String get selectLanguage => 'Chagua Lugha';

  @override
  String get onboardingGetStartedDesc => 'Anza kwa kuchagua lugha yako';

  @override
  String get accountRecoveryTitle => '🔐 Maelezo ya Urejeshaji wa Akaunti';

  @override
  String get recoveryInstructions =>
      'Tafadhali hifadhi maelezo haya kwa usalama. Utaihitaji ili kurejesha akaunti yako.';

  @override
  String get importantNotice => '⚠️ Muhimu:';

  @override
  String get astrologerProfileTitle => 'Wasifu wa Mnajimu';

  @override
  String get personalAstrologer => 'Mnajimu Binafsi';

  @override
  String get makePersonalAstrologer => 'Fanya Mnajimu wa Kibinafsi';

  @override
  String get favoriteDescription =>
      'Maswali yako yatapewa kipaumbele kwa mnajimu huyu. Ikiwa haipatikani, mnajimu mwingine aliyehitimu atakusaidia.';

  @override
  String get educationQualifications => 'Elimu na Sifa';

  @override
  String get aboutSection => 'Kuhusu';

  @override
  String get shareProfile => 'Shiriki Wasifu';

  @override
  String get loadingAstrologer => 'Inapakia maelezo ya mnajimu...';

  @override
  String get failedToLoadAstrologer => 'Imeshindwa kupakia maelezo ya mnajimu';

  @override
  String get authenticationRequired =>
      'Uthibitishaji unahitajika. Tafadhali ingia.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ukaguzi wa usalama haukufaulu: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name sasa ndiye Mnajimu wako wa Kibinafsi';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Imeondolewa $name kutoka kwa vipendwa';
  }

  @override
  String get toggleFavoriteError => 'Imeshindwa kusasisha hali pendwa';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Elimu: $education\n📜 Sifa: $qualification\n⏳ Uzoefu: $experience';
  }

  @override
  String get notProvided => 'Haijatolewa';

  @override
  String reviews(Object count) {
    return '($count ukaguzi)';
  }

  @override
  String get specialties => 'Utaalam';

  @override
  String get experience => 'Uzoefu';

  @override
  String get qualification => 'Sifa';

  @override
  String get education => 'Elimu';

  @override
  String get recoveryTips =>
      '• Piga picha ya skrini ya maelezo haya\n• Ihifadhi mahali salama\n• Usishiriki na mtu yeyote\n• Hii itaonyeshwa mara moja tu';
}
