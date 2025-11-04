// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get settingsTitle => 'સેટિંગ્સ';

  @override
  String get notificationSettings => 'સૂચના સેટિંગ્સ';

  @override
  String get privacySettings => 'ગોપનીયતા સેટિંગ્સ';

  @override
  String get accountSettings => 'એકાઉન્ટ સેટિંગ્સ';

  @override
  String get languageSettings => 'ભાષા સેટિંગ્સ';

  @override
  String get languageChanged => 'ભાષા બદલાઈ ગઈ';

  @override
  String get existingUserButton => 'હું હાલનો વપરાશકર્તા છું.';

  @override
  String get chooseCountryTitle => 'દેશ પસંદ કરો';

  @override
  String get yesText => 'હા';

  @override
  String get noText => 'ના';

  @override
  String get appBarTitle => 'પ્રોફાઇલ સેટિંગ્સ';

  @override
  String get userIdLabel => 'વપરાશકર્તા ID *';

  @override
  String get nameLabel => 'નામ';

  @override
  String get birthCountryLabel => 'જન્મ દેશ';

  @override
  String get birthCityLabel => 'જન્મ શહેર';

  @override
  String get countrySelectionTitle => 'તમારો દેશ પસંદ કરો';

  @override
  String get maleLabel => 'પુરુષ';

  @override
  String get femaleLabel => 'સ્ત્રી';

  @override
  String get birthDateLabel => 'જન્મ તારીખ';

  @override
  String get birthDatePlaceholder => 'જન્મ તારીખ પસંદ કરો';

  @override
  String get birthTimeLabel => 'જન્મ સમય';

  @override
  String get birthTimePlaceholder => 'જન્મ સમય પસંદ કરો';

  @override
  String get saveProfileButton => 'પ્રોફાઇલ સાચવો';

  @override
  String get noCitiesFound => 'કોઈ શહેર મળ્યું નથી';

  @override
  String cityPlaceholder(Object country) {
    return '$country માં શહેર દાખલ કરો';
  }

  @override
  String get countryFirstPlaceholder => 'પહેલા દેશ પસંદ કરો';

  @override
  String get versionHistoryTitle => 'સંસ્કરણ ઇતિહાસ';

  @override
  String get notSetText => 'સેટ નથી';

  @override
  String nameHistory(Object name) {
    return 'નામ: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'શહેર: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'દેશ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'લિંગ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'જન્મ તારીખ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'જન્મ સમય: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'સ્થાન: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'સમય ઝોન: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'ડીએસટી: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'સ્થિતિ: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date ના રોજ અપડેટ કરેલ';
  }

  @override
  String get userIdRequired => 'વપરાશકર્તા ID જરૂરી છે';

  @override
  String get profileSaved => 'પ્રોફાઇલ સફળતાપૂર્વક સાચવવામાં આવી';

  @override
  String get saveFailed => 'પ્રોફાઇલ સાચવવામાં નિષ્ફળ થયાં';

  @override
  String get errorPrefix => 'ભૂલ:';

  @override
  String get onboardingChooseLanguage => 'તમારી ભાષા પસંદ કરો';

  @override
  String get onboardingChooseLanguageDesc =>
      'ચાલુ રાખવા માટે તમારી પસંદગીની ભાષા પસંદ કરો.';

  @override
  String get onboardingWhatIsAstrology => 'જ્યોતિષ શું છે?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'જ્યોતિષ શાસ્ત્ર એ અવકાશી પદાર્થોનો અભ્યાસ છે...';

  @override
  String get onboardingWhyUseApp => 'આ એપનો ઉપયોગ શા માટે કરવો?';

  @override
  String get onboardingWhyUseAppDesc =>
      'વ્યક્તિગત જન્માક્ષર, દૈનિક આગાહીઓ અને જાણકાર નિર્ણયો લેવા માટે માર્ગદર્શન મેળવો.';

  @override
  String get onboardingHowToUse => 'આ એપનો ઉપયોગ કેવી રીતે કરવો?';

  @override
  String get onboardingHowToUseDesc =>
      'સચોટ આગાહીઓ માટે સરળતાથી નેવિગેટ કરો, દૈનિક જન્માક્ષર તપાસો અને તમારી પ્રોફાઇલ મેનેજ કરો.';

  @override
  String get onboardingGetStarted => 'શરૂ કરો';

  @override
  String get onboardingNewUser => 'નવો વપરાશકર્તા';

  @override
  String get onboardingExistingUser => 'હાલના વપરાશકર્તા';

  @override
  String get onboardingBack => 'પાછળ';

  @override
  String get onboardingNext => 'આગળ';

  @override
  String get userIdNotFound =>
      'વપરાશકર્તા ID મળ્યો નથી. કૃપા કરીને લોગિન કરો અથવા તમારી પ્રોફાઇલ સેટ કરો.';

  @override
  String get clearNotificationsTitle => 'સૂચનાઓ સાફ કરો';

  @override
  String get clearNotificationsMessage =>
      'શું તમે ખરેખર બધી સૂચનાઓ સાફ કરવા માંગો છો?';

  @override
  String get clearNotificationsSuccess => 'બધી સૂચનાઓ સફળતાપૂર્વક સાફ થઈ.';

  @override
  String get clearHoroscopeTitle => 'સ્પષ્ટ જન્માક્ષર';

  @override
  String get clearHoroscopeMessage =>
      'શું તમે ખરેખર તમારા જન્માક્ષરનો ડેટા સાફ કરવા માંગો છો?';

  @override
  String get clearHoroscopeSuccess => 'જન્માક્ષર સફળતાપૂર્વક સાફ થયું.';

  @override
  String get clearChatTitle => 'ચેટ ઇતિહાસ સાફ કરો';

  @override
  String get clearChatMessage =>
      'શું તમે ખરેખર તમારો બધો ચેટ ઇતિહાસ કાઢી નાખવા માંગો છો?';

  @override
  String get clearChatLocal => 'સ્થાનિક રીતે ચેટ સાફ કરી.';

  @override
  String get deleteAccountTitle => 'એકાઉન્ટ કાઢી નાખો';

  @override
  String get deleteAccountMessage =>
      'શું તમે ખરેખર તમારું એકાઉન્ટ કાઢી નાખવા માંગો છો? આ તમારા બધા ચેટ ઇતિહાસ અને સૂચનાઓ પણ સાફ કરશે.';

  @override
  String get deleteAccountSuccess =>
      'તમારું એકાઉન્ટ અને બધો ડેટા દૂર કરવામાં આવ્યો છે.';

  @override
  String get deleteAccountError => 'એકાઉન્ટ કાઢી નાખવામાં ભૂલ';

  @override
  String get logoutTitle => 'લોગઆઉટ';

  @override
  String get logoutMessage => 'શું તમે ખરેખર લોગઆઉટ કરવા માંગો છો?';

  @override
  String get termsPrivacyTitle => 'શરતો અને ગોપનીયતા';

  @override
  String get privacyPolicyTitle => 'ગોપનીયતા નીતિ';

  @override
  String get termsConditionsTitle => 'શરતો અને નિયમો';

  @override
  String get dataControlTitle => 'ડેટા નિયંત્રણ';

  @override
  String get cancelButton => 'રદ કરો';

  @override
  String get confirmButton => 'પુષ્ટિ કરો';

  @override
  String get clearQuestionsSuccess =>
      'બધા પ્રશ્નો સફળતાપૂર્વક કાઢી નાખવામાં આવ્યા.';

  @override
  String get yoginiLabel => 'યોગિની';

  @override
  String get lordLabel => 'ભગવાન';

  @override
  String get startLabel => 'શરૂઆત';

  @override
  String get recoverAccount => 'એકાઉન્ટ પુનઃપ્રાપ્ત કરો';

  @override
  String get endLabel => 'અંત';

  @override
  String get startDateLabel => 'શરૂઆત તારીખ';

  @override
  String get endDateLabel => 'સમાપ્તિ તારીખ';

  @override
  String get notAvailable => 'ઉપલબ્ધ નથી';

  @override
  String get noData => 'કોઈ ડેટા નથી';

  @override
  String get unknownError => 'અજાણી ભૂલ';

  @override
  String get retryButton => 'ફરી પ્રયાસ કરો';

  @override
  String get kundaliGeneratorTitle => 'કુંડળી જનરેટર';

  @override
  String get natalChartTitle => 'જન્મકુંડળી';

  @override
  String get lagnaLabel => 'લગ્ન';

  @override
  String get rashiLabel => 'રાશિ';

  @override
  String get ascDegreeLabel => 'ચઢાણ ડિગ્રી';

  @override
  String get vimshottariDashaTitle => 'વિમશોત્તરી દશા';

  @override
  String get yoginiDashaTitle => 'યોગિની દશા';

  @override
  String get unknown => 'અજ્ઞાત';

  @override
  String get clearHoroscope => 'સ્પષ્ટ જન્માક્ષર';

  @override
  String get clearNotifications => 'સૂચનાઓ સાફ કરો';

  @override
  String get clearChatHistory => 'ચેટ ઇતિહાસ સાફ કરો';

  @override
  String get logout => 'લોગઆઉટ';

  @override
  String get deleteAccount => 'એકાઉન્ટ કાઢી નાખો';

  @override
  String get allFieldsRequired => 'બધા ક્ષેત્રો જરૂરી છે.';

  @override
  String get accountRecoveredSuccess => 'એકાઉન્ટ સફળતાપૂર્વક પુનઃપ્રાપ્ત થયું.';

  @override
  String get recoveryFailed => 'પુનઃપ્રાપ્તિ નિષ્ફળ ગઈ. તમારી માહિતી તપાસો.';

  @override
  String get recoverySecretLabel => 'પુનઃપ્રાપ્તિ રહસ્ય:';

  @override
  String get aboutUsTitle => 'અમારા વિશે';

  @override
  String get aboutOurCompany => 'અમારી કંપની વિશે';

  @override
  String get aboutCompanyDescription =>
      'અમે અમારા વપરાશકર્તાઓને શ્રેષ્ઠ જ્યોતિષ અનુભવ પહોંચાડવા માટે પ્રતિબદ્ધ છીએ.';

  @override
  String get ourMission => 'અમારું ધ્યેય';

  @override
  String get missionDescription =>
      'વપરાશકર્તાઓને તેમના જીવનમાં જાણકાર નિર્ણયો લેવામાં મદદ કરવા માટે સચોટ અને વ્યક્તિગત જ્યોતિષ સમજ પૂરી પાડવા માટે.';

  @override
  String get ourVision => 'અમારું વિઝન';

  @override
  String get visionDescription =>
      'ટેકનોલોજી અને પ્રાચીન શાણપણનું સંયોજન કરીને, સૌથી વિશ્વસનીય જ્યોતિષ પ્લેટફોર્મ બનવા માટે.';

  @override
  String get ourValues => 'અમારા મૂલ્યો';

  @override
  String get valuesDescription =>
      'પ્રામાણિકતા, ચોકસાઈ, વપરાશકર્તા-કેન્દ્રિત ડિઝાઇન અને સતત નવીનતા.';

  @override
  String get contactUs => 'અમારો સંપર્ક કરો';

  @override
  String get contactEmail => 'ઇમેઇલ: support@yourcompany.com';

  @override
  String get contactWebsite => 'વેબસાઇટ: www.yourcompany.com';

  @override
  String get customerSupport => 'ગ્રાહક સેવા';

  @override
  String get supportHeroTitle => 'અમે મદદ કરવા માટે અહીં છીએ';

  @override
  String get supportHeroDescription =>
      'નીચે આપેલ ફોર્મ ભરો અને અમારી સપોર્ટ ટીમ શક્ય તેટલી વહેલી તકે તમારો સંપર્ક કરશે.';

  @override
  String get yourName => 'તમારું નામ';

  @override
  String get yourEmail => 'તમારું ઇમેઇલ';

  @override
  String get message => 'સંદેશ';

  @override
  String get enterEmail => 'તમારું ઇમેઇલ દાખલ કરો';

  @override
  String get enterValidEmail => 'માન્ય ઇમેઇલ સરનામું દાખલ કરો';

  @override
  String enterField(Object fieldName) {
    return '$fieldName દાખલ કરો';
  }

  @override
  String get send => 'મોકલો';

  @override
  String get sending => 'મોકલી રહ્યું છે...';

  @override
  String get emailSentSuccess => '✅ ઇમેઇલ સફળતાપૂર્વક મોકલવામાં આવ્યો!';

  @override
  String get emailSendFailed => '❌ ઇમેઇલ મોકલવામાં નિષ્ફળ';

  @override
  String get astroDictionaryTitle => 'એસ્ટ્રો ડિક્શનરી';

  @override
  String get searchTermsHint => 'શોધ શબ્દો...';

  @override
  String get noTermsFound => 'કોઈ શબ્દો મળ્યા નથી.';

  @override
  String get buyQuestionsTitle => 'પ્રશ્નો ખરીદો';

  @override
  String get userNotAuthenticated => 'વપરાશકર્તા પ્રમાણિત નથી';

  @override
  String get loadStoreDataFailed => 'સ્ટોર ડેટા લોડ કરવામાં નિષ્ફળ';

  @override
  String get missingAuthToken => 'પ્રમાણીકરણ ટોકન ખૂટે છે';

  @override
  String get merchantDisplayName => 'એસ્ટ્રો ચેટ એપ';

  @override
  String get paymentSuccessful => '✅ ચુકવણી સફળ! પ્રશ્ન મોકલ્યો';

  @override
  String paymentFailed(Object error) {
    return '❌ ચુકવણી નિષ્ફળ: $error';
  }

  @override
  String get yourBalance => 'તમારું બેલેન્સ';

  @override
  String questionsBalance(Object count) {
    return '$count પ્રશ્નો';
  }

  @override
  String get availableOffers => 'ઉપલબ્ધ ઑફર્સ';

  @override
  String questionsCount(Object count) {
    return '$count પ્રશ્ન';
  }

  @override
  String get buyButton => 'ખરીદો';

  @override
  String get dailyHoroscopeTitle => '🌟 દૈનિક જન્માક્ષર';

  @override
  String get userIdMissing => 'વપરાશકર્તા ID ખૂટે છે';

  @override
  String get fetchHoroscopesFailed => 'જન્માક્ષર મેળવવામાં નિષ્ફળ ગયા';

  @override
  String get noHoroscopeFound => 'કોઈ કુંડળી મળી નથી.';

  @override
  String get signLabel => 'સાઇન';

  @override
  String get todayLabel => 'આજે';

  @override
  String get yesterdayLabel => 'ગઈકાલે';

  @override
  String get thisWeekLabel => 'આ અઠવાડિયે';

  @override
  String get lastMonthLabel => 'છેલ્લો મહિનો';

  @override
  String get chatTitle => 'ચેટ';

  @override
  String get typeYourQuestionHint => 'તમારો પ્રશ્ન લખો...';

  @override
  String get paymentRequired => 'ચુકવણી જરૂરી છે';

  @override
  String get paymentRequiredMessage =>
      'તમે તમારા મફત પ્રશ્નોનો ઉપયોગ કર્યો છે. ચાલુ રાખવા માટે ₹50 ચૂકવો.';

  @override
  String get payNowButton => 'હમણાં ચૂકવો';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count બાકી રહેલા મફત પ્રશ્નો';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count બાકી રહેલા પેઇડ પ્રશ્નો';
  }

  @override
  String get thankYouFeedback => 'તમારા પ્રતિભાવ બદલ આભાર!';

  @override
  String get ratingSubmitted => 'રેટિંગ સબમિટ કર્યું!';

  @override
  String get setUserIdFirst => 'કૃપા કરીને પહેલા તમારો યુઝર આઈડી સેટ કરો.';

  @override
  String get failedToFetchPrevious =>
      'પાછલા પ્રશ્નો અને જવાબો મેળવવામાં નિષ્ફળ ગયા';

  @override
  String errorOccurred(Object error) {
    return 'ભૂલ: $error';
  }

  @override
  String get drawerAstroProfile => 'એસ્ટ્રો પ્રોફાઇલ';

  @override
  String get drawerDailyHoroscope => 'દૈનિક રાશિફળ';

  @override
  String get drawerBuyQuestions => 'પ્રશ્નો ખરીદો';

  @override
  String get drawerAstroDictionary => 'એસ્ટ્રો ડિક્શનરી';

  @override
  String get drawerSettings => 'સેટિંગ્સ';

  @override
  String get drawerCustomerSupport => 'ગ્રાહક સેવા';

  @override
  String get drawerAbout => 'વિશે';

  @override
  String get drawerProfileSettings => 'પ્રોફાઇલ સેટિંગ્સ';

  @override
  String get demoNotificationTitle => '🔔 ડેમો સૂચના';

  @override
  String get demoNotificationBody =>
      'આ તમારી એપ્લિકેશન તરફથી એક પરીક્ષણ સૂચના છે!';

  @override
  String get notificationsTitle => 'સૂચનાઓ';

  @override
  String get noNotifications => 'કોઈ સૂચનાઓ નથી';

  @override
  String get allTab => 'બધા';

  @override
  String get markAllAsRead => 'બધાને વાંચેલા તરીકે ચિહ્નિત કરો';

  @override
  String get notificationMarkedRead => 'સૂચના વાંચેલી તરીકે ચિહ્નિત કરી';

  @override
  String get failedToLoadNotifications => 'સૂચનાઓ લોડ કરવામાં નિષ્ફળ થયાં';

  @override
  String get failedToMarkRead => 'વાંચેલા તરીકે ચિહ્નિત કરવામાં નિષ્ફળ થયાં';

  @override
  String get failedToMarkAllRead =>
      'બધાને વાંચેલા તરીકે ચિહ્નિત કરવામાં નિષ્ફળ થયાં';

  @override
  String get socketConnected => 'સોકેટ કનેક્ટેડ છે';

  @override
  String get socketDisconnected => 'સોકેટ ડિસ્કનેક્ટ થયું';

  @override
  String get newNotificationReceived => 'નવી સૂચના પ્રાપ્ત થઈ';

  @override
  String get generalCategory => 'જનરલ';

  @override
  String get horoscopeCategory => 'જન્માક્ષર';

  @override
  String get chatCategory => 'ચેટ';

  @override
  String get systemCategory => 'સિસ્ટમ';

  @override
  String get updateCategory => 'અપડેટ્સ';

  @override
  String get howToAskTitle => 'કેવી રીતે પૂછવું';

  @override
  String get noQuestionsAvailable => 'કોઈ પ્રશ્નો ઉપલબ્ધ નથી';

  @override
  String get failedToLoadQuestions => 'પ્રશ્નો લોડ કરવામાં નિષ્ફળ થયાં';

  @override
  String get pullToRefresh => 'તાજું કરવા માટે ખેંચો';

  @override
  String get careerCategory => 'કારકિર્દી';

  @override
  String get loveCategory => 'પ્રેમ અને સંબંધો';

  @override
  String get healthCategory => 'આરોગ્ય';

  @override
  String get financeCategory => 'નાણાકીય';

  @override
  String get familyCategory => 'કુટુંબ';

  @override
  String get educationCategory => 'શિક્ષણ';

  @override
  String get travelCategory => 'પ્રવાસ';

  @override
  String get spiritualCategory => 'આધ્યાત્મિક';

  @override
  String get profileLoaded => 'પ્રોફાઇલ સફળતાપૂર્વક લોડ થઈ';

  @override
  String get imageUploaded => 'છબી સફળતાપૂર્વક અપલોડ થઈ';

  @override
  String get savedInformationConfirmation => 'મેં આ માહિતી સાચવી રાખી છે.';

  @override
  String get noHistoryAvailable => 'કોઈ ઇતિહાસ ઉપલબ્ધ નથી';

  @override
  String get missingUserIdError => 'વપરાશકર્તા ID જરૂરી છે';

  @override
  String get networkError => 'નેટવર્ક ભૂલ. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String get timeoutError => 'વિનંતીનો સમય સમાપ્ત થયો';

  @override
  String get genericError => 'કંઈક ખોટું થયું.';

  @override
  String get reactionUpdateError => 'પ્રતિક્રિયા અપડેટ કરવામાં નિષ્ફળ થયાં';

  @override
  String get noSearchResults => 'કોઈ શોધ પરિણામો મળ્યાં નથી.';

  @override
  String get clearSearch => 'શોધ સાફ કરો';

  @override
  String get resultsFound => 'પરિણામો મળ્યાં';

  @override
  String get recoverySecretHint => 'કોપી-પેસ્ટ કામ ન કરે, મેન્યુઅલી ટાઇપ કરો.';

  @override
  String get recoverAccountDescription =>
      'તમારા એકાઉન્ટને પુનઃપ્રાપ્ત કરવા માટે આ પગલાં અનુસરો';

  @override
  String get processingLabel => 'પ્રક્રિયા કરી રહ્યું છે...';

  @override
  String get clearChatSuccess => 'ચેટ સફળતાપૂર્વક સાફ કરવામાં આવી';

  @override
  String get notificationsEnabled => 'સૂચનાઓ સક્ષમ કરી';

  @override
  String get notificationsDisabled => 'સૂચનાઓ અક્ષમ કરી';

  @override
  String get securityNotice =>
      'તમારો ડેટા સુરક્ષિત રીતે એન્ક્રિપ્ટેડ અને સંગ્રહિત છે';

  @override
  String get loading => 'લોડ કરી રહ્યું છે...';

  @override
  String get selectLanguage => 'ભાષા પસંદ કરો';

  @override
  String get onboardingGetStartedDesc => 'તમારી ભાષા પસંદ કરીને શરૂઆત કરો';

  @override
  String get accountRecoveryTitle => '🔐 એકાઉન્ટ પુનઃપ્રાપ્તિ વિગતો';

  @override
  String get recoveryInstructions =>
      'કૃપા કરીને આ માહિતી સુરક્ષિત રીતે સાચવો. તમારું એકાઉન્ટ પુનઃપ્રાપ્ત કરવા માટે તમને તેની જરૂર પડશે.';

  @override
  String get importantNotice => '⚠️ મહત્વપૂર્ણ:';

  @override
  String get astrologerProfileTitle => 'જ્યોતિષ પ્રોફાઇલ';

  @override
  String get personalAstrologer => 'વ્યક્તિગત જ્યોતિષી';

  @override
  String get makePersonalAstrologer => 'વ્યક્તિગત જ્યોતિષ બનાવો';

  @override
  String get favoriteDescription =>
      'તમારા પ્રશ્નો આ જ્યોતિષીને પ્રાથમિકતા આપવામાં આવશે. જો ઉપલબ્ધ ન હોય, તો અન્ય લાયક જ્યોતિષી તમને મદદ કરશે.';

  @override
  String get educationQualifications => 'શિક્ષણ અને લાયકાત';

  @override
  String get aboutSection => 'વિશે';

  @override
  String get shareProfile => 'પ્રોફાઇલ શેર કરો';

  @override
  String get loadingAstrologer => 'જ્યોતિષની વિગતો લોડ કરી રહ્યું છે...';

  @override
  String get failedToLoadAstrologer =>
      'જ્યોતિષની વિગતો લોડ કરવામાં નિષ્ફળ રહ્યા';

  @override
  String get authenticationRequired =>
      'પ્રમાણીકરણ જરૂરી છે. કૃપા કરીને લોગ ઇન કરો.';

  @override
  String securityCheckFailed(Object error) {
    return 'સુરક્ષા તપાસ નિષ્ફળ ગઈ: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name હવે તમારા વ્યક્તિગત જ્યોતિષી છે';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ મનપસંદમાંથી $name દૂર કર્યું';
  }

  @override
  String get toggleFavoriteError => 'મનપસંદ સ્થિતિ અપડેટ કરવામાં નિષ્ફળ થયાં';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 શિક્ષણ: $education\n📜 લાયકાત: $qualification\n⏳ અનુભવ: $experience';
  }

  @override
  String get notProvided => 'પૂરું પાડવામાં આવેલ નથી';

  @override
  String reviews(Object count) {
    return '($count સમીક્ષાઓ)';
  }

  @override
  String get specialties => 'વિશેષતાઓ';

  @override
  String get experience => 'અનુભવ';

  @override
  String get qualification => 'લાયકાત';

  @override
  String get education => 'શિક્ષણ';

  @override
  String get recoveryTips =>
      '• આ માહિતીનો સ્ક્રીનશોટ લો\n• તેને સુરક્ષિત જગ્યાએ સ્ટોર કરો\n• કોઈની સાથે શેર કરશો નહીં\n• આ ફક્ત એક જ વાર બતાવવામાં આવશે';
}
