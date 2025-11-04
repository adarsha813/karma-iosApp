// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Igbo (`ig`).
class AppLocalizationsIg extends AppLocalizations {
  AppLocalizationsIg([String locale = 'ig']) : super(locale);

  @override
  String get settingsTitle => 'Ntọala';

  @override
  String get notificationSettings => 'Ntọala ngosi';

  @override
  String get privacySettings => 'Ntọala nzuzo';

  @override
  String get accountSettings => 'Ntọala akaụntụ';

  @override
  String get languageSettings => 'Ntọala asụsụ';

  @override
  String get languageChanged => 'Asụsụ gbanwere';

  @override
  String get existingUserButton => 'Abụ m onye ọrụ dị adị';

  @override
  String get chooseCountryTitle => 'Họrọ Obodo';

  @override
  String get yesText => 'Ee';

  @override
  String get noText => 'Mba';

  @override
  String get appBarTitle => 'Ntọala profaịlụ';

  @override
  String get userIdLabel => 'Njirimara Onye Ọrụ *';

  @override
  String get nameLabel => 'Aha';

  @override
  String get birthCountryLabel => 'Obodo amuru';

  @override
  String get birthCityLabel => 'Obodo ọmụmụ';

  @override
  String get countrySelectionTitle => 'Họrọ obodo gị';

  @override
  String get maleLabel => 'Nwoke';

  @override
  String get femaleLabel => 'Nwanyị';

  @override
  String get birthDateLabel => 'Ụbọchị ọmụmụ';

  @override
  String get birthDatePlaceholder => 'Họrọ Ụbọchị ọmụmụ';

  @override
  String get birthTimeLabel => 'Oge ọmụmụ';

  @override
  String get birthTimePlaceholder => 'Họrọ Oge ọmụmụ';

  @override
  String get saveProfileButton => 'Chekwa profaịlụ';

  @override
  String get noCitiesFound => 'Enweghị obodo ahụrụ';

  @override
  String cityPlaceholder(Object country) {
    return 'Tinye obodo na $country';
  }

  @override
  String get countryFirstPlaceholder => 'Buru ụzọ họrọ obodo';

  @override
  String get versionHistoryTitle => 'Akụkọ ụdị';

  @override
  String get notSetText => 'Edobeghị';

  @override
  String nameHistory(Object name) {
    return 'Aha: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Obodo: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Obodo: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'okike: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ụbọchị ọmụmụ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Oge ọmụmụ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Ebe: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Mpaghara oge: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Steeti: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Emelitere na $date';
  }

  @override
  String get userIdRequired => 'Achọrọ ID onye ọrụ';

  @override
  String get profileSaved => 'A na-echekwa profaịlụ nke ọma';

  @override
  String get saveFailed => 'Ịchekwa profaịlụ adịghị';

  @override
  String get errorPrefix => 'Njehie:';

  @override
  String get onboardingChooseLanguage => 'Họrọ Asụsụ Gị';

  @override
  String get onboardingChooseLanguageDesc =>
      'Họrọ asụsụ ọkacha mmasị gị ka ịga n\'ihu.';

  @override
  String get onboardingWhatIsAstrology => 'Gịnị bụ ịgụ kpakpando?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Ịgụ kpakpando bụ ọmụmụ ihe nke eluigwe...';

  @override
  String get onboardingWhyUseApp => 'Gịnị kpatara iji ngwa a?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Nweta horoscopes ahaziri onwe ya, amụma kwa ụbọchị, na ntụzịaka iji mee mkpebi ziri ezi.';

  @override
  String get onboardingHowToUse => 'Kedu otu esi eji ngwa a?';

  @override
  String get onboardingHowToUseDesc =>
      'Gaa n\'ụzọ dị mfe, lelee horoscopes kwa ụbọchị ma jikwaa profaịlụ gị maka amụma ziri ezi.';

  @override
  String get onboardingGetStarted => 'Malite';

  @override
  String get onboardingNewUser => 'Onye ọrụ ọhụrụ';

  @override
  String get onboardingExistingUser => 'Onye ọrụ dị adị';

  @override
  String get onboardingBack => 'Azu';

  @override
  String get onboardingNext => 'Osote';

  @override
  String get userIdNotFound =>
      'Ahụghị ID onye ọrụ. Biko banye ma ọ bụ tọọ profaịlụ gị.';

  @override
  String get clearNotificationsTitle => 'Kpochapụ ọkwa';

  @override
  String get clearNotificationsMessage =>
      'Ị ji n\'aka na ịchọrọ ikpochapụ ọkwa niile?';

  @override
  String get clearNotificationsSuccess => 'A kpochapụrụ ọkwa niile nke ọma.';

  @override
  String get clearHoroscopeTitle => 'Kpochapụ horoscope';

  @override
  String get clearHoroscopeMessage =>
      'Ị ji n\'aka na ịchọrọ ikpochapụ data horoscope gị?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope kpochapụrụ nke ọma.';

  @override
  String get clearChatTitle => 'Hichapụ Akụkọ Nkata';

  @override
  String get clearChatMessage =>
      'Ị ji n\'aka na ịchọrọ ihichapụ akụkọ nkata gị niile?';

  @override
  String get clearChatLocal => 'A kpochapụrụ nkata na mpaghara.';

  @override
  String get deleteAccountTitle => 'Hichapụ Akaụntụ';

  @override
  String get deleteAccountMessage =>
      'Ị ji n\'aka na ịchọrọ ihichapụ akaụntụ gị? Nke a ga-ehichapụkwa akụkọ nkata gị na ọkwa gị niile.';

  @override
  String get deleteAccountSuccess => 'Ewepula akaụntụ gị na data niile.';

  @override
  String get deleteAccountError => 'Njehie ihichapụ akaụntụ';

  @override
  String get logoutTitle => 'Wepụ';

  @override
  String get logoutMessage => 'Ị ji n\'aka na ịchọrọ ịpụpụ?';

  @override
  String get termsPrivacyTitle => 'Usoro & Nzuzo';

  @override
  String get privacyPolicyTitle => 'amụma nzuzo';

  @override
  String get termsConditionsTitle => 'Usoro & Ọnọdụ';

  @override
  String get dataControlTitle => 'Njikwa data';

  @override
  String get cancelButton => 'Kagbuo';

  @override
  String get confirmButton => 'Kwenye';

  @override
  String get clearQuestionsSuccess => 'Ajụjụ niile ehichapụrụ nke ọma.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Onyenweanyị';

  @override
  String get startLabel => 'Malite';

  @override
  String get recoverAccount => 'Weghachite Akaụntụ';

  @override
  String get endLabel => 'Ọgwụgwụ';

  @override
  String get startDateLabel => 'Ụbọchị mmalite';

  @override
  String get endDateLabel => 'Ụbọchị ngwụcha';

  @override
  String get notAvailable => 'Adịghị';

  @override
  String get noData => 'Enweghị data';

  @override
  String get unknownError => 'Njehie amaghị';

  @override
  String get retryButton => 'Gbalịa ọzọ';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Chart nke Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Degree Ascendant';

  @override
  String get vimshottariDashaTitle => 'Vimhottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Amaghi ama';

  @override
  String get clearHoroscope => 'Kpochapụ horoscope';

  @override
  String get clearNotifications => 'Kpochapụ ọkwa';

  @override
  String get clearChatHistory => 'Hichapụ Akụkọ Nkata';

  @override
  String get logout => 'Wepụ';

  @override
  String get deleteAccount => 'Hichapụ Akaụntụ';

  @override
  String get allFieldsRequired => 'A chọrọ mpaghara niile.';

  @override
  String get accountRecoveredSuccess => 'enwetara akaụntụ nke ọma.';

  @override
  String get recoveryFailed => 'Iweghachi adịghị. Lelee ozi gị.';

  @override
  String get recoverySecretLabel => 'Nzuzo mgbake:';

  @override
  String get aboutUsTitle => 'Gbasara anyị';

  @override
  String get aboutOurCompany => 'Banyere Ụlọ Ọrụ Anyị';

  @override
  String get aboutCompanyDescription =>
      'Anyị na-agba mbọ ịnye ndị ọrụ anyị ahụmịhe ịgụ kpakpando kacha mma.';

  @override
  String get ourMission => 'Ebumnuche anyị';

  @override
  String get missionDescription =>
      'Iji nye nghọta gbasara ịgụ kpakpando ziri ezi yana ahaziri onwe ya iji nyere ndị ọrụ aka ime mkpebi ziri ezi na ndụ ha.';

  @override
  String get ourVision => 'Ọhụụ anyị';

  @override
  String get visionDescription =>
      'Iji bụrụ ikpo okwu ịgụ kpakpando tụkwasịrị obi, na-ejikọta teknụzụ na amamihe oge ochie.';

  @override
  String get ourValues => 'Ụkpụrụ Anyị';

  @override
  String get valuesDescription =>
      'Iguzosi ike n\'ezi ihe, izi ezi, Nhazi-Centric nke onye ọrụ, yana ihe ọhụrụ na-aga n\'ihu.';

  @override
  String get contactUs => 'Kpọtụrụ anyị';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Weebụsaịtị: www.yourcompany.com';

  @override
  String get customerSupport => 'Nkwado ndị ahịa';

  @override
  String get supportHeroTitle => 'Anyị nọ ebe a iji nyere aka';

  @override
  String get supportHeroDescription =>
      'Dejupụta fọm dị n\'okpuru na ndị otu nkwado anyị ga-alaghachikwute gị ozugbo enwere ike.';

  @override
  String get yourName => 'Aha gị';

  @override
  String get yourEmail => 'Email gị';

  @override
  String get message => 'Ozi';

  @override
  String get enterEmail => 'Tinye email gị';

  @override
  String get enterValidEmail => 'Tinye adreesị ozi-e bara uru';

  @override
  String enterField(Object fieldName) {
    return 'Tinye $fieldName';
  }

  @override
  String get send => 'Ziga';

  @override
  String get sending => 'Na-eziga...';

  @override
  String get emailSentSuccess => '✅ ezitere email nke ọma!';

  @override
  String get emailSendFailed => '❌ izipu ozi-e agaghị';

  @override
  String get astroDictionaryTitle => 'Akwụkwọ ọkọwa okwu Astro';

  @override
  String get searchTermsHint => 'Chọọ okwu...';

  @override
  String get noTermsFound => 'Enweghị usoro ahụrụ';

  @override
  String get buyQuestionsTitle => 'Zụrụ ajụjụ';

  @override
  String get userNotAuthenticated => 'Ekwenyeghị onye ọrụ';

  @override
  String get loadStoreDataFailed => 'Ịbunye data ụlọ ahịa agaghị';

  @override
  String get missingAuthToken => 'Ihe ngosi nyocha efu';

  @override
  String get merchantDisplayName => 'Ngwa Astro Chat';

  @override
  String get paymentSuccessful => '✅ Ịkwụ ụgwọ gara nke ọma! E zigara ajụjụ';

  @override
  String paymentFailed(Object error) {
    return '❌ Ịkwụ ụgwọ dara: $error';
  }

  @override
  String get yourBalance => 'Balance gị';

  @override
  String questionsBalance(Object count) {
    return '$count Ajụjụ';
  }

  @override
  String get availableOffers => 'Onyinye dị';

  @override
  String questionsCount(Object count) {
    return '$count Ajụjụ';
  }

  @override
  String get buyButton => 'Zụrụ';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope kwa ụbọchị';

  @override
  String get userIdMissing => 'NJ onye ọrụ na-efu';

  @override
  String get fetchHoroscopesFailed => 'Ị nweta horoscopes agaghị ekwe omume';

  @override
  String get noHoroscopeFound => 'Ahụghị horoscope ọ bụla.';

  @override
  String get signLabel => 'Banye aka';

  @override
  String get todayLabel => 'Taa';

  @override
  String get yesterdayLabel => 'Ụnyahụ';

  @override
  String get thisWeekLabel => 'Izu a';

  @override
  String get lastMonthLabel => 'Ọnwa gara aga';

  @override
  String get chatTitle => 'Kpaa nkata';

  @override
  String get typeYourQuestionHint => 'Pịnye ajụjụ gị...';

  @override
  String get paymentRequired => 'Achọrọ ịkwụ ụgwọ';

  @override
  String get paymentRequiredMessage =>
      'I jirila ajụjụ gị n\'efu. Kwụọ ₹50 ka ịga n\'ihu.';

  @override
  String get payNowButton => 'kwụọ ụgwọ ugbu a';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ajụjụ efu fọdụrụ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ajụjụ akwụ ụgwọ fọdụrụ';
  }

  @override
  String get thankYouFeedback => 'Daalụ maka nzaghachi gị!';

  @override
  String get ratingSubmitted => 'Enyere ọkwa!';

  @override
  String get setUserIdFirst => 'Biko buru ụzọ tọọ ID onye ọrụ gị';

  @override
  String get failedToFetchPrevious =>
      'Ị nweta ajụjụ na azịza ndị gara aga agaghị aga';

  @override
  String errorOccurred(Object error) {
    return 'Njehie: $error';
  }

  @override
  String get drawerAstroProfile => 'Profaịlụ Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope kwa ụbọchị';

  @override
  String get drawerBuyQuestions => 'Zụrụ ajụjụ';

  @override
  String get drawerAstroDictionary => 'Akwụkwọ ọkọwa okwu Astro';

  @override
  String get drawerSettings => 'Ntọala';

  @override
  String get drawerCustomerSupport => 'Nkwado ndị ahịa';

  @override
  String get drawerAbout => 'Ihe gbasara';

  @override
  String get drawerProfileSettings => 'Ntọala profaịlụ';

  @override
  String get demoNotificationTitle => '🔔 ngosi ngosi';

  @override
  String get demoNotificationBody => 'Nke a bụ ọkwa nlele sitere na ngwa gị!';

  @override
  String get notificationsTitle => 'Amamọkwa';

  @override
  String get noNotifications => 'Enweghị ọkwa';

  @override
  String get allTab => 'Ha niile';

  @override
  String get markAllAsRead => 'Kanye ihe niile ka ọ na-agụ';

  @override
  String get notificationMarkedRead => 'Akara ọkwa ka ọ na-agụ';

  @override
  String get failedToLoadNotifications => 'Ịkwado ọkwa adịghị';

  @override
  String get failedToMarkRead => 'Ekpughị akara dị ka agụ';

  @override
  String get failedToMarkAllRead => 'Ekpughị ihe niile ka agụọ';

  @override
  String get socketConnected => 'Ejikọrọ oghere';

  @override
  String get socketDisconnected => 'Akwụsịla oghere';

  @override
  String get newNotificationReceived => 'enwetara ọkwa ọhụrụ';

  @override
  String get generalCategory => 'Izugbe';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Kpaa nkata';

  @override
  String get systemCategory => 'Sistemu';

  @override
  String get updateCategory => 'Mmelite';

  @override
  String get howToAskTitle => 'Otu esi ajụ';

  @override
  String get noQuestionsAvailable => 'Enweghị ajụjụ dị';

  @override
  String get failedToLoadQuestions => 'Ịbunye ajụjụ agaghị';

  @override
  String get pullToRefresh => 'Dọrọ ka ọ dị ọhụrụ';

  @override
  String get careerCategory => 'Ọrụ';

  @override
  String get loveCategory => 'Ịhụnanya & Mmekọrịta';

  @override
  String get healthCategory => 'Ahụike';

  @override
  String get financeCategory => 'Ego';

  @override
  String get familyCategory => 'Ezinụlọ';

  @override
  String get educationCategory => 'Agụmakwụkwọ';

  @override
  String get travelCategory => 'Njem';

  @override
  String get spiritualCategory => 'Ime mmụọ';

  @override
  String get profileLoaded => 'Akwadoro profaịlụ nke ọma';

  @override
  String get imageUploaded => 'Ebugoro onyonyo nke ọma';

  @override
  String get savedInformationConfirmation => 'Echekwala m ozi a';

  @override
  String get noHistoryAvailable => 'Enweghị akụkọ ihe mere eme dị';

  @override
  String get missingUserIdError => 'Achọrọ ID onye ọrụ';

  @override
  String get networkError => 'Njehie netwọkụ. Biko nwaa ọzọ.';

  @override
  String get timeoutError => 'Arịrịọ agwụla';

  @override
  String get genericError => 'Ọ nwere ihe adịghị mma';

  @override
  String get reactionUpdateError => 'Emelite mmeghachi omume agaghị ekwe omume';

  @override
  String get noSearchResults => 'Ọnweghị nsonaazụ ọchụchọ ahụrụ';

  @override
  String get clearSearch => 'Kpochapụ ọchụchọ';

  @override
  String get resultsFound => 'Achọpụtara nsonaazụ ya';

  @override
  String get recoverySecretHint =>
      'Copy-paste nwere ike ọ gaghị arụ ọrụ, jiri aka pịnye';

  @override
  String get recoverAccountDescription =>
      'Soro usoro ndị a iji nwetaghachi akaụntụ gị';

  @override
  String get processingLabel => 'Na-ahazi...';

  @override
  String get clearChatSuccess => 'A kpochapụrụ nkata nke ọma';

  @override
  String get notificationsEnabled => 'Agbanyere ọkwa';

  @override
  String get notificationsDisabled => 'Agbanyụrụ amamọkwa';

  @override
  String get securityNotice => 'Ezochiri ma chekwaa data gị nke ọma';

  @override
  String get loading => 'Na-ebu...';

  @override
  String get selectLanguage => 'Họrọ Asụsụ';

  @override
  String get onboardingGetStartedDesc => 'Bido site na ịhọrọ asụsụ gị';

  @override
  String get accountRecoveryTitle => '🔐 Nkọwa mgbake akaụntụ';

  @override
  String get recoveryInstructions =>
      'Biko chekwaa ozi a nke ọma. Ị ga-achọ ya iji nwetaghachi akaụntụ gị.';

  @override
  String get importantNotice => '⚠️ dị mkpa:';

  @override
  String get astrologerProfileTitle => 'Profaịlụ onye na-agụ kpakpando';

  @override
  String get personalAstrologer => 'Onye na-agụ kpakpando nkeonwe';

  @override
  String get makePersonalAstrologer => 'Mee onwe onye na-agụ kpakpando';

  @override
  String get favoriteDescription =>
      'A ga-ebute ajụjụ gị ụzọ maka onye na-agụ kpakpando a. Ọ bụrụ na ọ dịghị, onye ọzọ na-agụ kpakpando ga-enyere gị aka.';

  @override
  String get educationQualifications => 'Agụmakwụkwọ & ntozu';

  @override
  String get aboutSection => 'Ihe gbasara';

  @override
  String get shareProfile => 'Kekọrịta profaịlụ';

  @override
  String get loadingAstrologer => 'Na-ebu nkọwa ndị na-agụ kpakpando...';

  @override
  String get failedToLoadAstrologer =>
      'Ịbunye nkọwa ndị na-agụ kpakpando agaghị';

  @override
  String get authenticationRequired => 'Achọrọ nyocha. Biko banye.';

  @override
  String securityCheckFailed(Object error) {
    return 'Nlele nchekwa dara: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name bụ onye na-agụ kpakpando nkeonwe gị ugbu a';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Wepụrụ $name na ọkacha mmasị';
  }

  @override
  String get toggleFavoriteError => 'Emeliteghị ọkwa ọkacha mmasị';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Education: $education\n📜 Ntozu: $qualification\n⏳ Ahụmahụ: $experience';
  }

  @override
  String get notProvided => 'Enyereghị ya';

  @override
  String reviews(Object count) {
    return '(nlebanya $count nyocha)';
  }

  @override
  String get specialties => 'Ọpụrụiche';

  @override
  String get experience => 'Ahụmahụ';

  @override
  String get qualification => 'Ikike';

  @override
  String get education => 'Agụmakwụkwọ';

  @override
  String get recoveryTips =>
      '• Were nseta ihuenyo nke ozi a\n• Chekwaa ya n\'ebe echekwara\n• Ekekọrịtala onye ọ bụla\n• A ga-egosi nke a naanị otu ugboro';
}
