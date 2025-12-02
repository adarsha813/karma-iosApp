// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get settingsTitle => 'ସେଟିଂସ୍';

  @override
  String get notificationSettings => 'ବିଜ୍ଞପ୍ତି ସେଟିଂସ୍';

  @override
  String get privacySettings => 'ଗୋପନୀୟତା ସେଟିଂସ୍';

  @override
  String get accountSettings => 'ଆକାଉଣ୍ଟ ସେଟିଙ୍ଗ';

  @override
  String get languageSettings => 'ଭାଷା ସେଟିଂସମୂହ';

  @override
  String get languageChanged => 'ଭାଷା ବଦଳାଯାଇଛି';

  @override
  String get existingUserButton => 'ମୁଁ ଜଣେ ବିଦ୍ୟମାନ ଉପଯୋଗକର୍ତ୍ତା';

  @override
  String get chooseCountryTitle => 'ଦେଶ ବାଛନ୍ତୁ';

  @override
  String get yesText => 'ହଁ';

  @override
  String get noText => 'ନା';

  @override
  String get appBarTitle => 'ପ୍ରୋଫାଇଲ୍‌ ସେଟିଂସ୍‌';

  @override
  String get userIdLabel => 'ଉପଯୋଗକର୍ତ୍ତା ଆଇଡି *';

  @override
  String get nameLabel => 'ନାମ';

  @override
  String get birthCountryLabel => 'ଜନ୍ମ ଦେଶ';

  @override
  String get birthCityLabel => 'ଜନ୍ମ ସହର';

  @override
  String get countrySelectionTitle => 'ଆପଣଙ୍କ ଦେଶ ବାଛନ୍ତୁ';

  @override
  String get maleLabel => 'ପୁରୁଷ';

  @override
  String get femaleLabel => 'ମହିଳା';

  @override
  String get birthDateLabel => 'ଜନ୍ମ ତାରିଖ';

  @override
  String get birthDatePlaceholder => 'ଜନ୍ମ ତାରିଖ ଚୟନ କରନ୍ତୁ';

  @override
  String get birthTimeLabel => 'ଜନ୍ମ ସମୟ';

  @override
  String get birthTimePlaceholder => 'ଜନ୍ମ ସମୟ ଚୟନ କରନ୍ତୁ';

  @override
  String get saveProfileButton => 'ପ୍ରୋଫାଇଲ୍ ସେଭ୍ କରନ୍ତୁ';

  @override
  String get noCitiesFound => 'କୌଣସି ସହର ମିଳିଲା ନାହିଁ';

  @override
  String cityPlaceholder(Object country) {
    return '$country ରେ ସହର ଲେଖନ୍ତୁ';
  }

  @override
  String get countryFirstPlaceholder => 'ପ୍ରଥମେ ଦେଶ ଚୟନ କରନ୍ତୁ';

  @override
  String get versionHistoryTitle => 'ସଂସ୍କରଣ ଇତିହାସ';

  @override
  String get notSetText => 'ସେଟ୍‌ ନୁହେଁ';

  @override
  String nameHistory(Object name) {
    return 'ନାମ: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ସହର: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ଦେଶ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ଲିଙ୍ଗ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ଜନ୍ମ ତାରିଖ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ଜନ୍ମ ସମୟ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ଲୋକେସନ୍: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ସମୟ କ୍ଷେତ୍ର: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ଅବସ୍ଥା: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date ରେ ଅପଡେଟ୍ କରାଯାଇଛି';
  }

  @override
  String get userIdRequired => 'ଉପଯୋଗକର୍ତ୍ତା ID ଆବଶ୍ୟକ।';

  @override
  String get profileSaved => 'ପ୍ରୋଫାଇଲ୍ ସଫଳତାର ସହ ସେଭ୍ ହୋଇଛି';

  @override
  String get saveFailed => 'ପ୍ରୋଫାଇଲ୍ ସେଭ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get errorPrefix => 'ତ୍ରୁଟି:';

  @override
  String get onboardingChooseLanguage => 'ଆପଣଙ୍କ ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get onboardingChooseLanguageDesc =>
      'ଜାରି ରଖିବାକୁ ଆପଣଙ୍କ ପସନ୍ଦର ଭାଷା ଚୟନ କରନ୍ତୁ।';

  @override
  String get onboardingWhatIsAstrology => 'ଜ୍ୟୋତିଷ ଶାସ୍ତ୍ର କ\'ଣ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ଜ୍ୟୋତିଷ ହେଉଛି ଆକାଶୀୟ ପିଣ୍ଡଗୁଡ଼ିକର ଅଧ୍ୟୟନ...';

  @override
  String get onboardingWhyUseApp => 'ଏହି ଆପ୍ କାହିଁକି ବ୍ୟବହାର କରିବେ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ସୂଚନାଭିତ୍ତିକ ନିଷ୍ପତ୍ତି ନେବା ପାଇଁ ବ୍ୟକ୍ତିଗତ ରାଶିଫଳ, ଦୈନିକ ଭବିଷ୍ୟବାଣୀ ଏବଂ ମାର୍ଗଦର୍ଶନ ପାଆନ୍ତୁ।';

  @override
  String get onboardingHowToUse => 'ଏହି ଆପ୍ କିପରି ବ୍ୟବହାର କରିବେ?';

  @override
  String get onboardingHowToUseDesc =>
      'ସହଜରେ ନେଭିଗେଟ୍ କରନ୍ତୁ, ଦୈନିକ ରାଶିଫଳ ଯାଞ୍ଚ କରନ୍ତୁ, ଏବଂ ସଠିକ୍ ଭବିଷ୍ୟବାଣୀ ପାଇଁ ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍ ପରିଚାଳନା କରନ୍ତୁ।';

  @override
  String get onboardingGetStarted => 'ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get onboardingNewUser => 'ନୂଆ ଉପଯୋଗକର୍ତ୍ତା';

  @override
  String get onboardingExistingUser => 'ବିଦ୍ୟମାନ ଉପଯୋଗକର୍ତ୍ତା';

  @override
  String get onboardingBack => 'ପଛକୁ';

  @override
  String get onboardingNext => 'ପରବର୍ତ୍ତୀ';

  @override
  String get userIdNotFound =>
      'ୟୁଜର୍‌ ଆଇଡି ମିଳିଲା ନାହିଁ। ଦୟାକରି ଲଗ୍‌ଇନ୍‌ କରନ୍ତୁ କିମ୍ବା ଆପଣଙ୍କର ପ୍ରୋଫାଇଲ୍‌ ସେଟ୍‌ କରନ୍ତୁ।';

  @override
  String get clearNotificationsTitle => 'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ଖାଲି କରନ୍ତୁ';

  @override
  String get clearNotificationsMessage =>
      'ଆପଣ ସମସ୍ତ ବିଜ୍ଞପ୍ତି ଖାଲି କରିବାକୁ ଚାହୁଁଥିବା ନିଶ୍ଚିତ କି?';

  @override
  String get clearNotificationsSuccess =>
      'ସମସ୍ତ ବିଜ୍ଞପ୍ତି ସଫଳତାର ସହ ଖାଲି କରାଯାଇଛି।';

  @override
  String get clearHoroscopeTitle => 'ସ୍ପଷ୍ଟ ରାଶିଫଳ';

  @override
  String get clearHoroscopeMessage =>
      'ଆପଣ କ’ଣ ନିଶ୍ଚିତ ଯେ ଆପଣ ଆପଣଙ୍କର ରାଶିଫଳ ତଥ୍ୟ ସଫା କରିବାକୁ ଚାହୁଁଛନ୍ତି?';

  @override
  String get clearHoroscopeSuccess => 'ରାଶିଫଳ ସଫଳତାର ସହିତ ସଫା ହେଲା।';

  @override
  String get clearChatTitle => 'ଚାଟ୍ ଇତିହାସ ଖାଲି କରନ୍ତୁ';

  @override
  String get clearChatMessage =>
      'ଆପଣ ଆପଣଙ୍କର ସମସ୍ତ ଚାଟ୍ ଇତିହାସ ଡିଲିଟ୍ କରିବାକୁ ଚାହୁଁଥିବା ନିଶ୍ଚିତ କି?';

  @override
  String get clearChatLocal => 'ସ୍ଥାନୀୟ ଭାବରେ ଚାଟ୍ ଖାଲି କରାଯାଇଛି।';

  @override
  String get deleteAccountTitle => 'ଆକାଉଣ୍ଟ ଡିଲିଟ୍ କରନ୍ତୁ';

  @override
  String get deleteAccountMessage =>
      'ଆପଣ କ’ଣ ନିଶ୍ଚିତ ଯେ ଆପଣ ଆପଣଙ୍କର ଆକାଉଣ୍ଟ ଡିଲିଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି? ଏହା ଆପଣଙ୍କର ସମସ୍ତ ଚାଟ୍ ଇତିହାସ ଏବଂ ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ମଧ୍ୟ ଖାଲି କରିଦେବ।';

  @override
  String get deleteAccountSuccess =>
      'ଆପଣଙ୍କ ଆକାଉଣ୍ଟ ଏବଂ ସମସ୍ତ ଡାଟା କାଢ଼ି ଦିଆଯାଇଛି।';

  @override
  String get deleteAccountError => 'ଆକାଉଣ୍ଟ ଡିଲିଟ୍ କରିବା ସମୟରେ ତ୍ରୁଟି';

  @override
  String get logoutTitle => 'ଲଗଆଉଟ୍';

  @override
  String get logoutMessage => 'ଆପଣ ଲଗଆଉଟ୍ କରିବାକୁ ଚାହୁଁଥିବା ନିଶ୍ଚିତ କି?';

  @override
  String get termsPrivacyTitle => 'ନିୟମ ଓ ଗୋପନୀୟତା';

  @override
  String get privacyPolicyTitle => 'ଗୋପନୀୟତା ନୀତି';

  @override
  String get termsConditionsTitle => 'ନିୟମ ଏବଂ ସର୍ତ୍ତାବଳୀ';

  @override
  String get dataControlTitle => 'ତଥ୍ୟ ନିୟନ୍ତ୍ରଣ';

  @override
  String get cancelButton => 'ବାତିଲ କରନ୍ତୁ';

  @override
  String get confirmButton => 'ସୁନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get clearQuestionsSuccess => 'ସମସ୍ତ ପ୍ରଶ୍ନ ସଫଳତାର ସହ ଡିଲିଟ୍ ହୋଇଯାଇଛି।';

  @override
  String get yoginiLabel => 'ଯୋଗିନୀ';

  @override
  String get lordLabel => 'ପ୍ରଭୁ';

  @override
  String get startLabel => 'ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get recoverAccount => 'ଆକାଉଣ୍ଟ ପୁନରୁଦ୍ଧାର କରନ୍ତୁ';

  @override
  String get endLabel => 'ଶେଷ';

  @override
  String get startDateLabel => 'ଆରମ୍ଭ ତାରିଖ';

  @override
  String get endDateLabel => 'ଶେଷ ତାରିଖ';

  @override
  String get notAvailable => 'ଉପଲବ୍ଧ ନାହିଁ';

  @override
  String get noData => 'କୌଣସି ଡାଟା ନାହିଁ';

  @override
  String get unknownError => 'ଅଜଣା ତ୍ରୁଟି';

  @override
  String get retryButton => 'ପୁନଃଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get kundaliGeneratorTitle => 'କୁଣ୍ଡଳି ଜେନେରେଟର';

  @override
  String get natalChartTitle => 'ଜନ୍ମ ଚାର୍ଟ';

  @override
  String get lagnaLabel => 'ଲଗ୍ନା';

  @override
  String get rashiLabel => 'ରାଶି';

  @override
  String get ascDegreeLabel => 'ଆରୋହୀ ଡିଗ୍ରୀ';

  @override
  String get vimshottariDashaTitle => 'ଭିମଶୋତ୍ତରୀ ଦଶା';

  @override
  String get yoginiDashaTitle => 'ଯୋଗିନୀ ଦଶା';

  @override
  String get unknown => 'ଅଜଣା';

  @override
  String get clearHoroscope => 'ସ୍ପଷ୍ଟ ରାଶିଫଳ';

  @override
  String get clearNotifications => 'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ଖାଲି କରନ୍ତୁ';

  @override
  String get clearChatHistory => 'ଚାଟ୍ ଇତିହାସ ଖାଲି କରନ୍ତୁ';

  @override
  String get logout => 'ଲଗଆଉଟ୍';

  @override
  String get deleteAccount => 'ଆକାଉଣ୍ଟ ଡିଲିଟ୍ କରନ୍ତୁ';

  @override
  String get allFieldsRequired => 'ସମସ୍ତ କ୍ଷେତ୍ର ଆବଶ୍ୟକ।';

  @override
  String get accountRecoveredSuccess =>
      'ଆକାଉଣ୍ଟ ସଫଳତାର ସହ ପୁନରୁଦ୍ଧାର କରାଯାଇଛି।';

  @override
  String get recoveryFailed =>
      'ପୁନରୁଦ୍ଧାର ବିଫଳ ହେଲା। ଆପଣଙ୍କ ସୂଚନା ଯାଞ୍ଚ କରନ୍ତୁ।';

  @override
  String get recoverySecretLabel => 'ପୁନରୁଦ୍ଧାର ଗୁପ୍ତ ରହସ୍ୟ:';

  @override
  String get aboutUsTitle => 'ଆମ ବିଷୟରେ';

  @override
  String get aboutOurCompany => 'ଆମ କମ୍ପାନୀ ବିଷୟରେ';

  @override
  String get aboutCompanyDescription =>
      'ଆମେ ଆମର ଉପଭୋକ୍ତାମାନଙ୍କୁ ସର୍ବୋତ୍ତମ ଜ୍ୟୋତିଷ ଅଭିଜ୍ଞତା ପ୍ରଦାନ କରିବାକୁ ପ୍ରତିବଦ୍ଧ।';

  @override
  String get ourMission => 'ଆମର ଲକ୍ଷ୍ୟ';

  @override
  String get missionDescription =>
      'ବ୍ୟବହାରକାରୀମାନଙ୍କୁ ସେମାନଙ୍କ ଜୀବନରେ ସୁଚିନ୍ତିତ ନିଷ୍ପତ୍ତି ନେବାରେ ସାହାଯ୍ୟ କରିବା ପାଇଁ ସଠିକ୍ ଏବଂ ବ୍ୟକ୍ତିଗତ ଜ୍ୟୋତିଷ ଅନ୍ତର୍ଦୃଷ୍ଟି ପ୍ରଦାନ କରିବା।';

  @override
  String get ourVision => 'ଆମର ଦୃଷ୍ଟିକୋଣ';

  @override
  String get visionDescription =>
      'ପ୍ରଯୁକ୍ତିବିଦ୍ୟା ଏବଂ ପ୍ରାଚୀନ ଜ୍ଞାନକୁ ମିଶ୍ରଣ କରି ସବୁଠାରୁ ବିଶ୍ୱସ୍ତ ଜ୍ୟୋତିଷ ପ୍ଲାଟଫର୍ମ ହେବା।';

  @override
  String get ourValues => 'ଆମର ମୂଲ୍ୟବୋଧ';

  @override
  String get valuesDescription =>
      'ସଚ୍ଚୋଟତା, ସଠିକତା, ବ୍ୟବହାରକାରୀ-କେନ୍ଦ୍ରିକ ଡିଜାଇନ୍, ଏବଂ ନିରନ୍ତର ନବସୃଜନ।';

  @override
  String get contactUs => 'ଆମ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ';

  @override
  String get contactEmail => 'ଇମେଲ୍: support@yourcompany.com';

  @override
  String get contactWebsite => 'ୱେବସାଇଟ୍: www.yourcompany.com';

  @override
  String get customerSupport => 'ଗ୍ରାହକ ସମର୍ଥନ';

  @override
  String get supportHeroTitle => 'ଆମେ ସାହାଯ୍ୟ କରିବାକୁ ଅଛୁ';

  @override
  String get supportHeroDescription =>
      'ତଳେ ଥିବା ଫର୍ମଟି ପୂରଣ କରନ୍ତୁ ଏବଂ ଆମର ସହାୟତା ଦଳ ଯଥାଶୀଘ୍ର ଆପଣଙ୍କ ସହିତ ଯୋଗାଯୋଗ କରିବେ।';

  @override
  String get yourName => 'ତୁମର ନାମ';

  @override
  String get yourEmail => 'ତୁମର ଇମେଲ୍';

  @override
  String get message => 'ମେସେଜ୍';

  @override
  String get enterEmail => 'ନିଜର ଇମେଲ୍‌ ଲେଖନ୍ତୁ';

  @override
  String get enterValidEmail => 'ଏକ ବୈଧ ଇମେଲ୍ ଠିକଣା ଲେଖନ୍ତୁ';

  @override
  String enterField(Object fieldName) {
    return '$fieldName ପ୍ରବେଶ କରନ୍ତୁ';
  }

  @override
  String get send => 'ପଠାନ୍ତୁ';

  @override
  String get sending => 'ପଠାଯାଉଛି...';

  @override
  String get emailSentSuccess => '✅ ଇମେଲ୍ ସଫଳତାର ସହ ପଠାଗଲା!';

  @override
  String get emailSendFailed => '❌ ଇମେଲ୍ ପଠାଇବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get astroDictionaryTitle => 'ଆଷ୍ଟ୍ରୋ ଅଭିଧାନ';

  @override
  String get searchTermsHint => 'ଶବ୍ଦଗୁଡିକ ଖୋଜନ୍ତୁ...';

  @override
  String get noTermsFound => 'କୌଣସି ଶବ୍ଦ ମିଳିଲା ନାହିଁ।';

  @override
  String get buyQuestionsTitle => 'ପ୍ରଶ୍ନ କିଣନ୍ତୁ';

  @override
  String get userNotAuthenticated => 'ଉପଯୋଗକର୍ତ୍ତାଙ୍କୁ ପ୍ରମାଣିତ କରାଯାଇନାହିଁ';

  @override
  String get loadStoreDataFailed => 'ଷ୍ଟୋର୍ ଡାଟା ଲୋଡ୍ କରିବାରେ ବିଫଳ ହେଲା';

  @override
  String get missingAuthToken => 'ପ୍ରାମାଣିକରଣ ଟୋକନ୍ ଉପଲବ୍ଧ ନାହିଁ';

  @override
  String get merchantDisplayName => 'ଆଷ୍ଟ୍ରୋ ଚାଟ୍ ଆପ୍';

  @override
  String get paymentSuccessful => '✅ ପେମେଣ୍ଟ ସଫଳ ହୋଇଛି! ପ୍ରଶ୍ନ ପଠାଗଲା';

  @override
  String paymentFailed(Object error) {
    return '❌ ପେମେଣ୍ଟ ବିଫଳ ହୋଇଛି: $error';
  }

  @override
  String get yourBalance => 'ଆପଣଙ୍କର ବ୍ୟାଲେନ୍ସ';

  @override
  String questionsBalance(Object count) {
    return '$count ପ୍ରଶ୍ନଗୁଡ଼ିକ';
  }

  @override
  String get availableOffers => 'ଉପଲବ୍ଧ ଅଫରଗୁଡ଼ିକ';

  @override
  String questionsCount(Object count) {
    return '$count ପ୍ରଶ୍ନ';
  }

  @override
  String get buyButton => 'କିଣନ୍ତୁ';

  @override
  String get dailyHoroscopeTitle => '🌟 ଦୈନିକ ରାଶିଫଳ';

  @override
  String get userIdMissing => 'ଉପଯୋଗକର୍ତ୍ତା ID ଉପଲବ୍ଧ ନାହିଁ।';

  @override
  String get fetchHoroscopesFailed => 'ରାଶିଫଳ ପାଇବାରେ ବିଫଳ ହେଲା';

  @override
  String get noHoroscopeFound => 'କୌଣସି ରାଶିଫଳ ମିଳିଲା ନାହିଁ।';

  @override
  String get signLabel => 'ସାଇନ୍';

  @override
  String get todayLabel => 'ଆଜି';

  @override
  String get yesterdayLabel => 'ଗତକାଲି';

  @override
  String get thisWeekLabel => 'ଏହି ସପ୍ତାହ';

  @override
  String get lastMonthLabel => 'ଗତ ମାସ';

  @override
  String get chatTitle => 'ଚାଟ୍ କରନ୍ତୁ';

  @override
  String get typeYourQuestionHint => 'ଆପଣଙ୍କ ପ୍ରଶ୍ନ ଟାଇପ୍ କରନ୍ତୁ...';

  @override
  String get paymentRequired => 'ପେମେଣ୍ଟ ଆବଶ୍ୟକ';

  @override
  String get paymentRequiredMessage =>
      'ଆପଣ ଆପଣଙ୍କର ମାଗଣା ପ୍ରଶ୍ନ ବ୍ୟବହାର କରିଛନ୍ତି। ଜାରି ରଖିବାକୁ ₹50 ଦିଅନ୍ତୁ।';

  @override
  String get payNowButton => 'ବର୍ତ୍ତମାନ ଦେୟ ଦିଅନ୍ତୁ';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ମାଗଣା ପ୍ରଶ୍ନ ବାକି ଅଛି';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ଦେୟଯୁକ୍ତ ପ୍ରଶ୍ନ ବାକି ଅଛି';
  }

  @override
  String get thankYouFeedback => 'ଆପଣଙ୍କ ମତାମତ ପାଇଁ ଧନ୍ୟବାଦ!';

  @override
  String get ratingSubmitted => 'ମୂଲ୍ୟାଙ୍କନ ଦାଖଲ ହୋଇଛି!';

  @override
  String get setUserIdFirst =>
      'ଦୟାକରି ପ୍ରଥମେ ଆପଣଙ୍କର ଉପଯୋଗକର୍ତ୍ତା ID ସେଟ୍ କରନ୍ତୁ।';

  @override
  String get failedToFetchPrevious =>
      'ପୂର୍ବ ପ୍ରଶ୍ନ ଏବଂ ଉତ୍ତରଗୁଡ଼ିକୁ ପ୍ରାପ୍ତ କରିବାରେ ବିଫଳ ହେଲା';

  @override
  String errorOccurred(Object error) {
    return 'ତ୍ରୁଟି: $error';
  }

  @override
  String get drawerAstroProfile => 'ଆଷ୍ଟ୍ରୋ ପ୍ରୋଫାଇଲ୍';

  @override
  String get drawerDailyHoroscope => 'ଦୈନିକ ରାଶିଫଳ';

  @override
  String get drawerBuyQuestions => 'ପ୍ରଶ୍ନ କିଣନ୍ତୁ';

  @override
  String get drawerAstroDictionary => 'ଆଷ୍ଟ୍ରୋ ଅଭିଧାନ';

  @override
  String get drawerSettings => 'ସେଟିଂସ୍';

  @override
  String get drawerCustomerSupport => 'ଗ୍ରାହକ ସମର୍ଥନ';

  @override
  String get drawerAbout => 'ବିଷୟରେ';

  @override
  String get drawerProfileSettings => 'ପ୍ରୋଫାଇଲ୍‌ ସେଟିଂସ୍‌';

  @override
  String get demoNotificationTitle => '🔔 ଡେମୋ ବିଜ୍ଞପ୍ତି';

  @override
  String get demoNotificationBody => 'ଏହା ଆପଣଙ୍କ ଆପର ଏକ ପରୀକ୍ଷାମୂଳକ ବିଜ୍ଞପ୍ତି!';

  @override
  String get notificationsTitle => 'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକ';

  @override
  String get noNotifications => 'କୌଣସି ବିଜ୍ଞପ୍ତି ନାହିଁ';

  @override
  String get allTab => 'ସମସ୍ତ';

  @override
  String get markAllAsRead => 'ସବୁକୁ ପଢ଼ାଯାଇଛି ଭାବରେ ଚିହ୍ନଟ କରନ୍ତୁ';

  @override
  String get notificationMarkedRead =>
      'ବିଜ୍ଞପ୍ତିକୁ ପଢ଼ାଯାଇଛି ଭାବରେ ଚିହ୍ନିତ କରାଯାଇଛି';

  @override
  String get failedToLoadNotifications => 'ବିଜ୍ଞପ୍ତି ଲୋଡ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get failedToMarkRead => 'ପଢ଼ାଯାଇଛି ଭାବରେ ଚିହ୍ନିତ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get failedToMarkAllRead =>
      'ସବୁକିଛି ପଢ଼ାଯାଇଛି ଭାବରେ ଚିହ୍ନଟ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get socketConnected => 'ସକେଟ୍‌ ସଂଯୁକ୍ତ ହୋଇଛି';

  @override
  String get socketDisconnected => 'ସକେଟ୍‌ ବିଚ୍ଛିନ୍ନ ହୋଇଛି';

  @override
  String get newNotificationReceived => 'ନୂତନ ବିଜ୍ଞପ୍ତି ପ୍ରାପ୍ତ ହୋଇଛି';

  @override
  String get generalCategory => 'ସାଧାରଣ';

  @override
  String get horoscopeCategory => 'ରାଶିଫଳ';

  @override
  String get chatCategory => 'ଚାଟ୍ କରନ୍ତୁ';

  @override
  String get systemCategory => 'ସିଷ୍ଟମ୍‌';

  @override
  String get updateCategory => 'ଅପଡେଟ୍';

  @override
  String get howToAskTitle => 'କିପରି ପଚାରିବେ';

  @override
  String get noQuestionsAvailable => 'କୌଣସି ପ୍ରଶ୍ନ ଉପଲବ୍ଧ ନାହିଁ';

  @override
  String get failedToLoadQuestions => 'ପ୍ରଶ୍ନଗୁଡ଼ିକ ଲୋଡ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get pullToRefresh => 'ରିଫ୍ରେସ୍ କରିବାକୁ ଟାଣନ୍ତୁ';

  @override
  String get careerCategory => 'କ୍ୟାରିଅର୍';

  @override
  String get loveCategory => 'ପ୍ରେମ ଏବଂ ସମ୍ପର୍କ';

  @override
  String get healthCategory => 'ସ୍ୱାସ୍ଥ୍ୟ';

  @override
  String get financeCategory => 'ଆର୍ଥିକ';

  @override
  String get familyCategory => 'ପରିବାର';

  @override
  String get educationCategory => 'ଶିକ୍ଷା';

  @override
  String get travelCategory => 'ଭ୍ରମଣ';

  @override
  String get spiritualCategory => 'ଆଧ୍ୟାତ୍ମିକ';

  @override
  String get profileLoaded => 'ପ୍ରୋଫାଇଲ୍ ସଫଳତାର ସହ ଲୋଡ୍ ହୋଇଛି।';

  @override
  String get imageUploaded => 'ଛବି ସଫଳତାର ସହ ଅପଲୋଡ୍ କରାଯାଇଛି';

  @override
  String get savedInformationConfirmation => 'ମୁଁ ଏହି ସୂଚନା ସେଭ୍ କରିଛି';

  @override
  String get noHistoryAvailable => 'କୌଣସି ଇତିହାସ ଉପଲବ୍ଧ ନାହିଁ';

  @override
  String get missingUserIdError => 'ଉପଯୋଗକର୍ତ୍ତା ID ଆବଶ୍ୟକ।';

  @override
  String get networkError => 'ନେଟ୍‌ୱର୍କରେ ତ୍ରୁଟି। ଦୟାକରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get timeoutError => 'ଅନୁରୋଧର ସମୟ ସମାପ୍ତ ହୋଇଛି';

  @override
  String get genericError => 'କିଛି ତ୍ରୁଟି ହୋଇଗଲା';

  @override
  String get reactionUpdateError => 'ପ୍ରତିକ୍ରିୟା ଅପଡେଟ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get noSearchResults => 'କୌଣସି ସନ୍ଧାନ ଫଳାଫଳ ମିଳିଲା ନାହିଁ';

  @override
  String get clearSearch => 'ସନ୍ଧାନ ଖାଲି କରନ୍ତୁ';

  @override
  String get resultsFound => 'ଫଳାଫଳ ମିଳିଲା';

  @override
  String get recoverySecretHint =>
      'କପି-ପେଷ୍ଟ କାମ ନ କରିପାରେ, ମାନୁଆଲି ଟାଇପ୍ କରନ୍ତୁ';

  @override
  String get recoverAccountDescription =>
      'ଆପଣଙ୍କ ଆକାଉଣ୍ଟକୁ ପୁନରୁଦ୍ଧାର କରିବା ପାଇଁ ଏହି ଷ୍ଟେପ୍‌ଗୁଡ଼ିକୁ ଅନୁସରଣ କରନ୍ତୁ';

  @override
  String get processingLabel => 'ପ୍ରକ୍ରିୟାକରଣ ହେଉଛି...';

  @override
  String get clearChatSuccess => 'ଚାଟ୍‍କୁ ସଫଳତାର ସହ ଖାଲି କରାଯାଇଛି';

  @override
  String get notificationsEnabled => 'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ସକ୍ଷମ କରାଯାଇଛି';

  @override
  String get notificationsDisabled => 'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ଅକ୍ଷମ କରାଯାଇଛି';

  @override
  String get securityNotice =>
      'ଆପଣଙ୍କର ଡାଟା ସୁରକ୍ଷିତ ଭାବରେ ଏନକ୍ରିପ୍ଟ ଏବଂ ଷ୍ଟୋର୍ କରାଯାଇଛି।';

  @override
  String get loading => 'ଲୋଡ୍ ହେଉଛି...';

  @override
  String get selectLanguage => 'ଭାଷା ଚୟନ କରନ୍ତୁ';

  @override
  String get onboardingGetStartedDesc => 'ଆପଣଙ୍କ ଭାଷା ବାଛି ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get accountRecoveryTitle => '🔐 ଆକାଉଣ୍ଟ ପୁନରୁଦ୍ଧାର ବିବରଣୀ';

  @override
  String get recoveryInstructions =>
      'ଦୟାକରି ଏହି ସୂଚନାକୁ ସୁରକ୍ଷିତ ଭାବରେ ସଂରକ୍ଷଣ କରନ୍ତୁ। ଆପଣଙ୍କୁ ଆପଣଙ୍କର ଆକାଉଣ୍ଟ ପୁନରୁଦ୍ଧାର କରିବା ପାଇଁ ଏହାର ଆବଶ୍ୟକତା ପଡିବ।';

  @override
  String get importantNotice => '⚠️ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ:';

  @override
  String get astrologerProfileTitle => 'ଜ୍ୟୋତିଷଙ୍କ ପ୍ରୋଫାଇଲ୍';

  @override
  String get personalAstrologer => 'ବ୍ୟକ୍ତିଗତ ଜ୍ୟୋତିଷ';

  @override
  String get makePersonalAstrologer => 'ବ୍ୟକ୍ତିଗତ ଜ୍ୟୋତିଷ କରନ୍ତୁ';

  @override
  String get favoriteDescription =>
      'ଆପଣଙ୍କ ପ୍ରଶ୍ନଗୁଡ଼ିକୁ ଏହି ଜ୍ୟୋତିଷଙ୍କ ପାଖରେ ପ୍ରାଥମିକତା ଦିଆଯିବ। ଯଦି ଉପଲବ୍ଧ ନଥାଆନ୍ତି, ତେବେ ଅନ୍ୟ ଜଣେ ଯୋଗ୍ୟ ଜ୍ୟୋତିଷ ଆପଣଙ୍କୁ ସହାୟତା କରିବେ।';

  @override
  String get educationQualifications => 'ଶିକ୍ଷା ଓ ଯୋଗ୍ୟତା';

  @override
  String get aboutSection => 'ବିଷୟରେ';

  @override
  String get shareProfile => 'ପ୍ରୋଫାଇଲ୍ ସେୟାର୍ କରନ୍ତୁ';

  @override
  String get loadingAstrologer => 'ଜ୍ୟୋତିଷଙ୍କ ବିବରଣୀ ଲୋଡ୍ ହେଉଛି...';

  @override
  String get failedToLoadAstrologer =>
      'ଜ୍ୟୋତିଷଙ୍କ ବିବରଣୀ ଲୋଡ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String get authenticationRequired =>
      'ପ୍ରମାଣୀକରଣ ଆବଶ୍ୟକ। ଦୟାକରି ଲଗ୍ ଇନ୍ କରନ୍ତୁ।';

  @override
  String securityCheckFailed(Object error) {
    return 'ସୁରକ୍ଷା ଯାଞ୍ଚ ବିଫଳ ହୋଇଛି: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ଏବେ ଆପଣଙ୍କର ବ୍ୟକ୍ତିଗତ ଜ୍ୟୋତିଷ ଅଟନ୍ତି';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ପସନ୍ଦରୁ $name କାଢ଼ି ଦିଆଯାଇଛି';
  }

  @override
  String get toggleFavoriteError => 'ପ୍ରିୟ ସ୍ଥିତି ଅପଡେଟ୍ କରିବାରେ ବିଫଳ ହୋଇଛି';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ଶିକ୍ଷା: $education\n📜 ଯୋଗ୍ୟତା: $qualification\n⏳ ଅଭିଜ୍ଞତା: $experience';
  }

  @override
  String get notProvided => 'ପ୍ରଦାନ କରାଯାଇ ନାହିଁ';

  @override
  String reviews(Object count) {
    return '($count ସମୀକ୍ଷା)';
  }

  @override
  String get specialties => 'ବିଶେଷତ୍ୱ';

  @override
  String get experience => 'ଅଭିଜ୍ଞତା';

  @override
  String get qualification => 'ଯୋଗ୍ୟତା';

  @override
  String get education => 'ଶିକ୍ଷା';

  @override
  String get recoveryTips =>
      '• ଏହି ସୂଚନାର ଏକ ସ୍କ୍ରିନସଟ୍ ନିଅନ୍ତୁ\n• ଏହାକୁ ଏକ ସୁରକ୍ଷିତ ସ୍ଥାନରେ ରଖନ୍ତୁ\n• କାହା ସହିତ ସେୟାର କରନ୍ତୁ ନାହିଁ\n• ଏହା କେବଳ ଥରେ ଦେଖାଯିବ';

  @override
  String get themeSettingsTitle => 'ଥିମ୍ ସେଟିଂସମୂହ';

  @override
  String get lightThemeLabel => 'ଫିକା';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'ଗାଢ଼';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ସିଷ୍ଟମ୍‌';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
