// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([String locale = 'yo']) : super(locale);

  @override
  String get settingsTitle => 'Eto';

  @override
  String get notificationSettings => 'Eto iwifunni';

  @override
  String get privacySettings => 'Awọn Eto Aṣiri';

  @override
  String get accountSettings => 'Eto iroyin';

  @override
  String get languageSettings => 'Eto Ede';

  @override
  String get languageChanged => 'Ede yi pada';

  @override
  String get existingUserButton => 'Mo jẹ olumulo ti o wa tẹlẹ';

  @override
  String get chooseCountryTitle => 'Yan Orilẹ-ede';

  @override
  String get yesText => 'Bẹẹni';

  @override
  String get noText => 'Rara';

  @override
  String get appBarTitle => 'Eto profaili';

  @override
  String get userIdLabel => 'Idanimọ olumulo *';

  @override
  String get nameLabel => 'Oruko';

  @override
  String get birthCountryLabel => 'Orilẹ-ede ibi';

  @override
  String get birthCityLabel => 'Ilu ibi';

  @override
  String get countrySelectionTitle => 'Yan orilẹ-ede rẹ';

  @override
  String get maleLabel => 'Okunrin';

  @override
  String get femaleLabel => 'Obirin';

  @override
  String get birthDateLabel => 'Ojo ibi';

  @override
  String get birthDatePlaceholder => 'Yan Ọjọ ibi';

  @override
  String get birthTimeLabel => 'Akoko ibi';

  @override
  String get birthTimePlaceholder => 'Yan Akoko ibi';

  @override
  String get saveProfileButton => 'Fi Profaili pamọ';

  @override
  String get noCitiesFound => 'Ko si ilu ti a ri';

  @override
  String cityPlaceholder(Object country) {
    return 'Tẹ ilu sii ni $country';
  }

  @override
  String get countryFirstPlaceholder => 'Yan orilẹ-ede ni akọkọ';

  @override
  String get versionHistoryTitle => 'Itan Ẹya';

  @override
  String get notSetText => 'Ko ṣeto';

  @override
  String nameHistory(Object name) {
    return 'Orukọ: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Ilu: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Orilẹ-ede: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Iwa-iwa: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ọjọ ibi: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Àkókò Ìbí: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Ibi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Aago: GMT$offset';
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
    return 'Ti ṣe imudojuiwọn lori $date';
  }

  @override
  String get userIdRequired => 'A nilo ID olumulo';

  @override
  String get profileSaved => 'Profaili ti fipamọ ni aṣeyọri';

  @override
  String get saveFailed => 'Kuna lati fi profaili pamọ';

  @override
  String get errorPrefix => 'Asise:';

  @override
  String get onboardingChooseLanguage => 'Yan Èdè Rẹ';

  @override
  String get onboardingChooseLanguageDesc => 'Yan ede ti o fẹ lati tẹsiwaju.';

  @override
  String get onboardingWhatIsAstrology => 'Kí ni Afirawọ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Afirawọ jẹ iwadi ti awọn ara ọrun...';

  @override
  String get onboardingWhyUseApp => 'Kilode ti o lo app yii?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Gba awọn horoscopes ti ara ẹni, awọn asọtẹlẹ ojoojumọ, ati itọsọna lati ṣe awọn ipinnu alaye.';

  @override
  String get onboardingHowToUse => 'Bawo ni lati lo app yii?';

  @override
  String get onboardingHowToUseDesc =>
      'Lilọ kiri ni irọrun, ṣayẹwo awọn horoscopes ojoojumọ, ati ṣakoso profaili rẹ fun awọn asọtẹlẹ deede.';

  @override
  String get onboardingGetStarted => 'Bẹrẹ';

  @override
  String get onboardingNewUser => 'Olumulo Tuntun';

  @override
  String get onboardingExistingUser => 'Olumulo to wa';

  @override
  String get onboardingBack => 'Pada';

  @override
  String get onboardingNext => 'Itele';

  @override
  String get userIdNotFound =>
      'A ko ri ID olumulo. Jọwọ buwolu wọle tabi ṣeto profaili rẹ.';

  @override
  String get clearNotificationsTitle => 'Ko awọn iwifunni kuro';

  @override
  String get clearNotificationsMessage =>
      'Ṣe o da ọ loju pe o fẹ lati ko gbogbo awọn iwifunni kuro?';

  @override
  String get clearNotificationsSuccess =>
      'Gbogbo awọn iwifunni ti paarẹ ni aṣeyọri.';

  @override
  String get clearHoroscopeTitle => 'Ko Horoscope kuro';

  @override
  String get clearHoroscopeMessage =>
      'Ṣe o da ọ loju pe o fẹ lati ko data horoscope rẹ kuro?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope ti yọ kuro ni aṣeyọri.';

  @override
  String get clearChatTitle => 'Ko Itan iwiregbe kuro';

  @override
  String get clearChatMessage =>
      'Ṣe o da ọ loju pe o fẹ pa gbogbo itan iwiregbe rẹ rẹ bi?';

  @override
  String get clearChatLocal => 'Iwiregbe nso tibile.';

  @override
  String get deleteAccountTitle => 'Pa Account';

  @override
  String get deleteAccountMessage =>
      'Ṣe o da ọ loju pe o fẹ pa akọọlẹ rẹ rẹ bi? Eyi yoo tun ko gbogbo itan iwiregbe rẹ ati awọn iwifunni rẹ kuro.';

  @override
  String get deleteAccountSuccess => 'Iwe akọọlẹ rẹ ati gbogbo data ti yọkuro.';

  @override
  String get deleteAccountError => 'Aṣiṣe piparẹ akọọlẹ';

  @override
  String get logoutTitle => 'Jade jade';

  @override
  String get logoutMessage => 'Ṣe o da ọ loju pe o fẹ jade bi?';

  @override
  String get termsPrivacyTitle => 'Awọn ofin & Asiri';

  @override
  String get privacyPolicyTitle => 'Asiri Afihan';

  @override
  String get termsConditionsTitle => 'Awọn ofin & Awọn ipo';

  @override
  String get dataControlTitle => 'Iṣakoso data';

  @override
  String get cancelButton => 'Fagilee';

  @override
  String get confirmButton => 'Jẹrisi';

  @override
  String get clearQuestionsSuccess => 'Gbogbo awọn ibeere ti paarẹ ni aṣeyọri.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Oluwa';

  @override
  String get startLabel => 'Bẹrẹ';

  @override
  String get recoverAccount => 'Bọsipọ Account';

  @override
  String get endLabel => 'Ipari';

  @override
  String get startDateLabel => 'Ọjọ Ibẹrẹ';

  @override
  String get endDateLabel => 'Ọjọ Ipari';

  @override
  String get notAvailable => 'Ko si';

  @override
  String get noData => 'Ko si data';

  @override
  String get unknownError => 'Aṣiṣe aimọ';

  @override
  String get retryButton => 'Tun gbiyanju';

  @override
  String get kundaliGeneratorTitle => 'Kundali monomono';

  @override
  String get natalChartTitle => 'Natal Chart';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Igoke ìyí';

  @override
  String get vimshottariDashaTitle => 'Vimhottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Aimọ';

  @override
  String get clearHoroscope => 'Ko Horoscope kuro';

  @override
  String get clearNotifications => 'Ko awọn iwifunni kuro';

  @override
  String get clearChatHistory => 'Ko Itan iwiregbe kuro';

  @override
  String get logout => 'Jade jade';

  @override
  String get deleteAccount => 'Pa Account';

  @override
  String get allFieldsRequired => 'Gbogbo awọn aaye ni a beere.';

  @override
  String get accountRecoveredSuccess => 'A gba iroyin pada ni aṣeyọri.';

  @override
  String get recoveryFailed => 'Imularada kuna. Ṣayẹwo alaye rẹ.';

  @override
  String get recoverySecretLabel => 'Aṣiri Imularada:';

  @override
  String get aboutUsTitle => 'Nipa re';

  @override
  String get aboutOurCompany => 'Nipa Ile-iṣẹ Wa';

  @override
  String get aboutCompanyDescription =>
      'Ni Karma, a ṣe iranlọwọ fun ọ lati ṣii ọna igbesi aye otitọ rẹ nipasẹ ọgbọn ailakoko ti Afirawọ Vediki. Gbogbo oye wa lati ojulowo, awọn awòràwọ ti o ni iriri, ti a ṣe ni iṣọra ti o da lori apẹrẹ ibimọ alailẹgbẹ rẹ. Lati awọn horoscopes lojoojumọ si itọsọna ti ara ẹni, Karma jẹ ki imọ atijọ wa ni iraye si ni awọn ede ti o ju 100 lọ.';

  @override
  String get ourMission => 'Iṣẹ apinfunni wa';

  @override
  String get missionDescription =>
      'Iṣẹ apinfunni wa rọrun: lati pese ojulowo, itọsọna astrological ti eniyan darí ti o fun ọ ni agbara lati ṣe igboya, awọn ipinnu alaye. Gbogbo asọtẹlẹ ati ijumọsọrọ ṣe afihan awọn ọdun ti oye alamọdaju, kii ṣe awọn algoridimu adaṣe.';

  @override
  String get ourVision => 'Iran wa';

  @override
  String get visionDescription =>
      'A ngbiyanju lati jẹ pẹpẹ ti o ni igbẹkẹle julọ ni agbaye fun irawọ Vediki, ṣe iranlọwọ fun awọn eniyan nibi gbogbo loye ara wọn, awọn yiyan wọn, ati irin-ajo igbesi aye wọn pẹlu mimọ ati igboya.';

  @override
  String get ourValues => 'Awọn iye wa';

  @override
  String get valuesDescription =>
      'Ni Karma, a ni idiyele ti ododo, konge, ati igbẹkẹle. A ti pinnu lati funni ni itọsọna ti kii ṣe deede nikan ṣugbọn tun ni itumọ, ṣe iranlọwọ fun ọ lati lilö kiri ni igbesi aye pẹlu oye ati igboya.';

  @override
  String get contactUs => 'Pe wa';

  @override
  String get contactEmail => 'Imeeli: support@yourcompany.com';

  @override
  String get contactWebsite => 'Aaye ayelujara: www.yourcompany.com';

  @override
  String get customerSupport => 'Onibara Support';

  @override
  String get supportHeroTitle => 'A wa Nibi lati ṣe iranlọwọ';

  @override
  String get supportHeroDescription =>
      'Fọwọsi fọọmu ni isalẹ ati ẹgbẹ atilẹyin wa yoo pada si ọdọ rẹ ni kete bi o ti ṣee.';

  @override
  String get yourName => 'Orukọ rẹ';

  @override
  String get yourEmail => 'Imeeli rẹ';

  @override
  String get message => 'Ifiranṣẹ';

  @override
  String get enterEmail => 'Tẹ imeeli rẹ sii';

  @override
  String get enterValidEmail => 'Tẹ adirẹsi imeeli to wulo';

  @override
  String enterField(Object fieldName) {
    return 'Tẹ $fieldName sii';
  }

  @override
  String get send => 'Firanṣẹ';

  @override
  String get sending => 'Fifiranṣẹ...';

  @override
  String get emailSentSuccess => '✅ Imeeli firanṣẹ ni aṣeyọri!';

  @override
  String get emailSendFailed => '❌ Kuna lati fi imeeli ranṣẹ';

  @override
  String get astroDictionaryTitle => 'Astro Dictionary';

  @override
  String get searchTermsHint => 'Awọn ọrọ wiwa...';

  @override
  String get noTermsFound => 'Ko si awọn ofin ti a rii';

  @override
  String get buyQuestionsTitle => 'Ra Awọn ibeere';

  @override
  String get userNotAuthenticated => 'Olumulo ko ni ijẹrisi';

  @override
  String get loadStoreDataFailed => 'Kuna lati kojọpọ data itaja';

  @override
  String get missingAuthToken => 'Atokun auth ti o padanu';

  @override
  String get merchantDisplayName => 'Astro Wiregbe App';

  @override
  String get paymentSuccessful => '✅ Isanwo ṣaṣeyọri! Ìbéèrè rán';

  @override
  String paymentFailed(Object error) {
    return '❌ Isanwo kuna: $error';
  }

  @override
  String get yourBalance => 'Iwọntunwọnsi rẹ';

  @override
  String questionsBalance(Object count) {
    return '$count Awọn ibeere';
  }

  @override
  String get availableOffers => 'Awọn ipese to wa';

  @override
  String questionsCount(Object count) {
    return '$count Ibeere';
  }

  @override
  String get buyButton => 'Ra';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope Ojoojumọ';

  @override
  String get userIdMissing => 'ID olumulo ti sonu';

  @override
  String get fetchHoroscopesFailed => 'O kuna lati mu awọn horoscopes wa';

  @override
  String get noHoroscopeFound => 'Ko si horoscope ti a rii.';

  @override
  String get signLabel => 'Wole';

  @override
  String get todayLabel => 'Loni';

  @override
  String get yesterdayLabel => 'Lana';

  @override
  String get thisWeekLabel => 'Ose yi';

  @override
  String get lastMonthLabel => 'Osu to koja';

  @override
  String get chatTitle => 'Wiregbe';

  @override
  String get typeYourQuestionHint => 'Tẹ ibeere rẹ sii...';

  @override
  String get paymentRequired => 'Ti beere owo sisan';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'O ti lo awọn ibeere ọfẹ rẹ. Sanwo $amount lati tẹsiwaju.';
  }

  @override
  String get payNowButton => 'Sanwo Bayi';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count awọn ibeere ọfẹ ti o ku';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count awọn ibeere isanwo to ku';
  }

  @override
  String get thankYouFeedback => 'O ṣeun fun esi rẹ!';

  @override
  String get ratingSubmitted => 'Rating silẹ!';

  @override
  String get setUserIdFirst => 'Jọwọ ṣeto ID olumulo rẹ akọkọ';

  @override
  String get failedToFetchPrevious =>
      'Kuna lati mu awọn ibeere ati awọn idahun ti tẹlẹ wa';

  @override
  String errorOccurred(Object error) {
    return 'Aṣiṣe: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profaili';

  @override
  String get drawerDailyHoroscope => 'Horoscope ojoojumọ';

  @override
  String get drawerBuyQuestions => 'Ra Awọn ibeere';

  @override
  String get drawerAstroDictionary => 'Astro Dictionary';

  @override
  String get drawerSettings => 'Eto';

  @override
  String get drawerCustomerSupport => 'Onibara Support';

  @override
  String get drawerAbout => 'Nipa';

  @override
  String get drawerProfileSettings => 'Eto profaili';

  @override
  String get demoNotificationTitle => '🔔 Ifitonileti Ririnkiri';

  @override
  String get demoNotificationBody =>
      'Eyi jẹ ifitonileti idanwo lati inu ohun elo rẹ!';

  @override
  String get notificationsTitle => 'Awọn iwifunni';

  @override
  String get noNotifications => 'Ko si awọn iwifunni';

  @override
  String get allTab => 'Gbogbo';

  @override
  String get markAllAsRead => 'Samisi gbogbo bi o ti ka';

  @override
  String get notificationMarkedRead => 'Ifitonileti samisi bi kika';

  @override
  String get failedToLoadNotifications => 'Kuna lati kojọpọ awọn iwifunni';

  @override
  String get failedToMarkRead => 'Kuna lati samisi bi kika';

  @override
  String get failedToMarkAllRead => 'Kuna lati samisi gbogbo rẹ bi kika';

  @override
  String get socketConnected => 'Socket ti sopọ';

  @override
  String get socketDisconnected => 'Socket ge asopọ';

  @override
  String get newNotificationReceived => 'Titun iwifunni gba';

  @override
  String get generalCategory => 'Gbogboogbo';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Wiregbe';

  @override
  String get systemCategory => 'Eto';

  @override
  String get updateCategory => 'Awọn imudojuiwọn';

  @override
  String get howToAskTitle => 'Bawo ni Lati Beere';

  @override
  String get noQuestionsAvailable => 'Ko si ibeere to wa';

  @override
  String get failedToLoadQuestions => 'Kuna lati kojọpọ awọn ibeere';

  @override
  String get pullToRefresh => 'Fa lati sọ di mimọ';

  @override
  String get careerCategory => 'Iṣẹ';

  @override
  String get loveCategory => 'Ife & Awọn ibatan';

  @override
  String get healthCategory => 'Ilera';

  @override
  String get financeCategory => 'Isuna';

  @override
  String get familyCategory => 'Idile';

  @override
  String get educationCategory => 'Ẹkọ';

  @override
  String get travelCategory => 'Irin-ajo';

  @override
  String get spiritualCategory => 'Ẹ̀mí';

  @override
  String get profileLoaded => 'Ti kojọpọ profaili ni aṣeyọri';

  @override
  String get imageUploaded => 'Aworan ti kojọpọ ni aṣeyọri';

  @override
  String get savedInformationConfirmation => 'Mo ti fipamọ Alaye yii';

  @override
  String get noHistoryAvailable => 'Ko si itan ti o wa';

  @override
  String get missingUserIdError => 'A nilo ID olumulo';

  @override
  String get networkError => 'Aṣiṣe nẹtiwọki. Jọwọ gbiyanju lẹẹkansi.';

  @override
  String get timeoutError => 'Ibere ti pari';

  @override
  String get genericError => 'Nkankan ti ko tọ';

  @override
  String get reactionUpdateError => 'Kuna lati mu esi pada';

  @override
  String get noSearchResults => 'Ko si awọn abajade wiwa';

  @override
  String get clearSearch => 'Ko wiwa kuro';

  @override
  String get resultsFound => 'Awọn abajade ri';

  @override
  String get recoverySecretHint => 'Daakọ-lẹẹmọ le ma ṣiṣẹ, tẹ pẹlu ọwọ';

  @override
  String get recoverAccountDescription =>
      'Tẹle awọn igbesẹ wọnyi lati gba akọọlẹ rẹ pada';

  @override
  String get processingLabel => 'Nṣiṣẹ...';

  @override
  String get clearChatSuccess => 'Iwiregbe nso ni aṣeyọri';

  @override
  String get notificationsEnabled => 'Awọn iwifunni ṣiṣẹ';

  @override
  String get notificationsDisabled => 'Awọn iwifunni alaabo';

  @override
  String get securityNotice => 'Awọn data rẹ ti wa ni ipamọ ni aabo ati fipamọ';

  @override
  String get loading => 'Nkojọpọ...';

  @override
  String get selectLanguage => 'Yan Ede';

  @override
  String get onboardingGetStartedDesc => 'Bẹrẹ nipa yiyan ede rẹ';

  @override
  String get accountRecoveryTitle => '🔐 Awọn alaye Imularada Account';

  @override
  String get recoveryInstructions =>
      'Jọwọ ṣafipamọ alaye yii ni aabo. Iwọ yoo nilo rẹ lati gba akọọlẹ rẹ pada.';

  @override
  String get importantNotice => '⚠️ Pataki:';

  @override
  String get astrologerProfileTitle => 'Astrologer Profaili';

  @override
  String get personalAstrologer => 'Ti ara ẹni Afirawọ';

  @override
  String get makePersonalAstrologer => 'Ṣe Personal Afirawọ';

  @override
  String get favoriteDescription =>
      'Awọn ibeere rẹ yoo jẹ pataki si awòràwọ yii. Ti ko ba si, awòràwọ oṣiṣẹ miiran yoo ran ọ lọwọ.';

  @override
  String get educationQualifications => 'Ẹkọ & Awọn afijẹẹri';

  @override
  String get aboutSection => 'Nipa';

  @override
  String get shareProfile => 'Pin Profaili';

  @override
  String get loadingAstrologer => 'Nkojọpọ awọn alaye awòràwọ...';

  @override
  String get failedToLoadAstrologer => 'Kuna lati kojọpọ awọn alaye awòràwọ';

  @override
  String get authenticationRequired => 'Ijeri beere. Jọwọ wọle.';

  @override
  String securityCheckFailed(Object error) {
    return 'Ayẹwo aabo kuna: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name jẹ Aworawo Ti ara ẹni rẹ ni bayi';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Yọ $name kuro ninu awọn ayanfẹ';
  }

  @override
  String get toggleFavoriteError => 'Kuna lati ṣe imudojuiwọn ipo ayanfẹ';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Ẹkọ: $education\n📜 Ijẹẹri: $qualification\n⏳ Iriri: $experience';
  }

  @override
  String get notProvided => 'Ko pese';

  @override
  String reviews(Object count) {
    return '($count agbeyewo)';
  }

  @override
  String get specialties => 'Pataki';

  @override
  String get experience => 'Iriri';

  @override
  String get qualification => 'Ijẹẹri';

  @override
  String get education => 'Ẹkọ';

  @override
  String get recoveryTips =>
      '• Ya aworan sikirinifoto ti alaye yii\nFipamọ si ibi aabo\n• Maṣe pin pẹlu ẹnikẹni\n• Eyi yoo han ni ẹẹkan';

  @override
  String get themeSettingsTitle => 'Awọn Eto Akori';

  @override
  String get lightThemeLabel => 'Imọlẹ';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Dudu';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Eto';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Egbe wa';

  @override
  String get teamDescription =>
      'Ẹgbẹ wa ti awọn awòràwọ Vedic ọjọgbọn mu awọn ọdun ti iriri ti n tumọ awọn ipa aye ati awọn ilana igbesi aye wa. Ti ṣe afẹyinti nipasẹ atilẹyin igbẹhin ati ẹgbẹ idagbasoke, Karma n funni ni ailopin, igbẹkẹle, ati iriri agbaye fun gbogbo olumulo.';
}
