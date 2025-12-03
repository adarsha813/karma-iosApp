// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AppLocalizationsLo extends AppLocalizations {
  AppLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get settingsTitle => 'ການຕັ້ງຄ່າ';

  @override
  String get notificationSettings => 'ການຕັ້ງຄ່າການແຈ້ງເຕືອນ';

  @override
  String get privacySettings => 'ການຕັ້ງຄ່າຄວາມເປັນສ່ວນຕົວ';

  @override
  String get accountSettings => 'ການຕັ້ງຄ່າບັນຊີ';

  @override
  String get languageSettings => 'ການຕັ້ງຄ່າພາສາ';

  @override
  String get languageChanged => 'ປ່ຽນພາສາ';

  @override
  String get existingUserButton => 'ຂ້ອຍເປັນຜູ້ໃຊ້ທີ່ມີຢູ່ແລ້ວ';

  @override
  String get chooseCountryTitle => 'ເລືອກປະເທດ';

  @override
  String get yesText => 'ແມ່ນແລ້ວ';

  @override
  String get noText => 'ບໍ່';

  @override
  String get appBarTitle => 'ການຕັ້ງຄ່າໂປຣໄຟລ໌';

  @override
  String get userIdLabel => 'ID ຜູ້​ໃຊ້ *';

  @override
  String get nameLabel => 'ຊື່';

  @override
  String get birthCountryLabel => 'ປະເທດເກີດ';

  @override
  String get birthCityLabel => 'ເມືອງເກີດ';

  @override
  String get countrySelectionTitle => 'ເລືອກປະເທດຂອງເຈົ້າ';

  @override
  String get maleLabel => 'ເພດຊາຍ';

  @override
  String get femaleLabel => 'ເພດຍິງ';

  @override
  String get birthDateLabel => 'ວັນເດືອນປີເກີດ';

  @override
  String get birthDatePlaceholder => 'ເລືອກວັນເດືອນປີເກີດ';

  @override
  String get birthTimeLabel => 'ເວລາເກີດ';

  @override
  String get birthTimePlaceholder => 'ເລືອກເວລາເກີດ';

  @override
  String get saveProfileButton => 'ບັນທຶກໂປຣໄຟລ໌';

  @override
  String get noCitiesFound => 'ບໍ່ພົບເມືອງ';

  @override
  String cityPlaceholder(Object country) {
    return 'ໃສ່ເມືອງໃນ $country';
  }

  @override
  String get countryFirstPlaceholder => 'ເລືອກປະເທດກ່ອນ';

  @override
  String get versionHistoryTitle => 'ປະຫວັດສະບັບ';

  @override
  String get notSetText => 'ບໍ່ໄດ້ຕັ້ງ';

  @override
  String nameHistory(Object name) {
    return 'ຊື່: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'ເມືອງ: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ປະເທດ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'ເພດ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'ວັນເດືອນປີເກີດ: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'ເວລາເກີດ: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ສະຖານທີ່: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'ເຂດເວລາ: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'ລັດ: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'ອັບເດດເມື່ອ $date';
  }

  @override
  String get userIdRequired => 'ຕ້ອງການ ID ຜູ້ໃຊ້';

  @override
  String get profileSaved => 'ບັນທຶກໂປຣໄຟລ໌ສຳເລັດແລ້ວ';

  @override
  String get saveFailed => 'ບັນທຶກໂປຣໄຟລ໌ບໍ່ສຳເລັດ';

  @override
  String get errorPrefix => 'ຄວາມຜິດພາດ:';

  @override
  String get onboardingChooseLanguage => 'ເລືອກພາສາຂອງທ່ານ';

  @override
  String get onboardingChooseLanguageDesc =>
      'ເລືອກພາສາທີ່ທ່ານຕ້ອງການເພື່ອສືບຕໍ່.';

  @override
  String get onboardingWhatIsAstrology => 'ໂຫລາສາດແມ່ນຫຍັງ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'ໂຫລາສາດແມ່ນການສຶກສາກ່ຽວກັບຮ່າງກາຍຊັ້ນສູງ ...';

  @override
  String get onboardingWhyUseApp => 'ເປັນຫຍັງຕ້ອງໃຊ້ແອັບນີ້?';

  @override
  String get onboardingWhyUseAppDesc =>
      'ໄດ້ຮັບ horoscopes ສ່ວນບຸກຄົນ, ການຄາດຄະເນປະຈໍາວັນ, ແລະການຊີ້ນໍາເພື່ອເຮັດການຕັດສິນໃຈຢ່າງມີຂໍ້ມູນ.';

  @override
  String get onboardingHowToUse => 'ໃຊ້ແອັບນີ້ແນວໃດ?';

  @override
  String get onboardingHowToUseDesc =>
      'ທ່ອງ​ໄປ​ຫາ​ໄດ້​ຢ່າງ​ງ່າຍ​ດາຍ​, ກວດ​ສອບ horoscopes ປະ​ຈໍາ​ວັນ​, ແລະ​ການ​ຄຸ້ມ​ຄອງ​ຂໍ້​ມູນ​ຂອງ​ທ່ານ​ສໍາ​ລັບ​ການ​ຄາດ​ຄະ​ເນ​ທີ່​ຖືກ​ຕ້ອງ​.';

  @override
  String get onboardingGetStarted => 'ເລີ່ມຕົ້ນ';

  @override
  String get onboardingNewUser => 'ຜູ້ໃຊ້ໃໝ່';

  @override
  String get onboardingExistingUser => 'ຜູ້ໃຊ້ທີ່ມີຢູ່ແລ້ວ';

  @override
  String get onboardingBack => 'ກັບຄືນໄປບ່ອນ';

  @override
  String get onboardingNext => 'ຕໍ່ໄປ';

  @override
  String get userIdNotFound =>
      'ບໍ່ພົບ ID ຜູ້ໃຊ້. ກະລຸນາເຂົ້າສູ່ລະບົບ ຫຼືຕັ້ງໂປຣໄຟລ໌ຂອງທ່ານ.';

  @override
  String get clearNotificationsTitle => 'ລຶບລ້າງການແຈ້ງເຕືອນ';

  @override
  String get clearNotificationsMessage =>
      'ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການລຶບລ້າງການແຈ້ງເຕືອນທັງໝົດ?';

  @override
  String get clearNotificationsSuccess =>
      'ການແຈ້ງເຕືອນທັງໝົດຖືກລຶບລ້າງສຳເລັດແລ້ວ.';

  @override
  String get clearHoroscopeTitle => 'ລ້າງ Horoscope';

  @override
  String get clearHoroscopeMessage =>
      'ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການລຶບຂໍ້ມູນ horoscope ຂອງທ່ານ?';

  @override
  String get clearHoroscopeSuccess => 'Horoscope ລ້າງສົບຜົນສໍາເລັດ.';

  @override
  String get clearChatTitle => 'ລຶບປະຫວັດການສົນທະນາ';

  @override
  String get clearChatMessage =>
      'ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການລຶບປະຫວັດການສົນທະນາທັງໝົດຂອງທ່ານ?';

  @override
  String get clearChatLocal => 'ການສົນທະນາຖືກລຶບລ້າງຢູ່ໃນທ້ອງຖິ່ນ.';

  @override
  String get deleteAccountTitle => 'ລຶບບັນຊີ';

  @override
  String get deleteAccountMessage =>
      'ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການລຶບບັນຊີຂອງທ່ານ? ນີ້ຈະເປັນການລຶບລ້າງປະຫວັດການສົນທະນາ ແລະການແຈ້ງເຕືອນທັງໝົດຂອງທ່ານນຳ.';

  @override
  String get deleteAccountSuccess =>
      'ບັນ​ຊີ​ຂອງ​ທ່ານ​ແລະ​ຂໍ້​ມູນ​ທັງ​ຫມົດ​ໄດ້​ຖືກ​ໂຍກ​ຍ້າຍ​ອອກ​.';

  @override
  String get deleteAccountError => 'ເກີດຄວາມຜິດພາດໃນການລຶບບັນຊີ';

  @override
  String get logoutTitle => 'ອອກຈາກລະບົບ';

  @override
  String get logoutMessage => 'ທ່ານແນ່ໃຈບໍ່ວ່າຕ້ອງການອອກຈາກລະບົບ?';

  @override
  String get termsPrivacyTitle => 'ເງື່ອນໄຂ & ຄວາມເປັນສ່ວນຕົວ';

  @override
  String get privacyPolicyTitle => 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ';

  @override
  String get termsConditionsTitle => 'ຂໍ້ກຳນົດ ແລະເງື່ອນໄຂ';

  @override
  String get dataControlTitle => 'ການຄວບຄຸມຂໍ້ມູນ';

  @override
  String get cancelButton => 'ຍົກເລີກ';

  @override
  String get confirmButton => 'ຢືນຢັນ';

  @override
  String get clearQuestionsSuccess => 'ລຶບຄຳຖາມທັງໝົດອອກສຳເລັດແລ້ວ.';

  @override
  String get yoginiLabel => 'ໂຍກິນີ';

  @override
  String get lordLabel => 'ພຣະຜູ້ເປັນເຈົ້າ';

  @override
  String get startLabel => 'ເລີ່ມ';

  @override
  String get recoverAccount => 'ກູ້ຄືນບັນຊີ';

  @override
  String get endLabel => 'ຈົບ';

  @override
  String get startDateLabel => 'ວັນທີເລີ່ມຕົ້ນ';

  @override
  String get endDateLabel => 'ວັນທີສິ້ນສຸດ';

  @override
  String get notAvailable => 'ບໍ່ມີໃຫ້';

  @override
  String get noData => 'ບໍ່ມີຂໍ້ມູນ';

  @override
  String get unknownError => 'ຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get retryButton => 'ລອງໃໝ່';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'ຕາຕະລາງ Natal';

  @override
  String get lagnaLabel => 'ລາກນາ';

  @override
  String get rashiLabel => 'ລາຊິ';

  @override
  String get ascDegreeLabel => 'Ascendant degree';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'ບໍ່ຮູ້ຈັກ';

  @override
  String get clearHoroscope => 'ລ້າງ Horoscope';

  @override
  String get clearNotifications => 'ລຶບລ້າງການແຈ້ງເຕືອນ';

  @override
  String get clearChatHistory => 'ລຶບປະຫວັດການສົນທະນາ';

  @override
  String get logout => 'ອອກຈາກລະບົບ';

  @override
  String get deleteAccount => 'ລຶບບັນຊີ';

  @override
  String get allFieldsRequired => 'ຊ່ອງຂໍ້ມູນທັງໝົດແມ່ນຕ້ອງການ.';

  @override
  String get accountRecoveredSuccess => 'ກູ້ຄືນບັນຊີສຳເລັດແລ້ວ.';

  @override
  String get recoveryFailed => 'ການຟື້ນຕົວລົ້ມເຫລວ. ກວດເບິ່ງຂໍ້ມູນຂອງທ່ານ.';

  @override
  String get recoverySecretLabel => 'ຄວາມລັບການຟື້ນຕົວ:';

  @override
  String get aboutUsTitle => 'ກ່ຽວກັບພວກເຮົາ';

  @override
  String get aboutOurCompany => 'ກ່ຽວກັບບໍລິສັດຂອງພວກເຮົາ';

  @override
  String get aboutCompanyDescription =>
      'ພວກເຮົາມຸ່ງໝັ້ນທີ່ຈະສະໜອງປະສົບການທາງໂຫລາສາດທີ່ດີທີ່ສຸດໃຫ້ກັບຜູ້ໃຊ້ຂອງພວກເຮົາ.';

  @override
  String get ourMission => 'ພາລະກິດຂອງພວກເຮົາ';

  @override
  String get missionDescription =>
      'ເພື່ອສະຫນອງຄວາມເຂົ້າໃຈທາງໂຫລາສາດທີ່ຖືກຕ້ອງແລະເປັນສ່ວນບຸກຄົນເພື່ອຊ່ວຍໃຫ້ຜູ້ໃຊ້ເຮັດການຕັດສິນໃຈຢ່າງມີຂໍ້ມູນໃນຊີວິດຂອງເຂົາເຈົ້າ.';

  @override
  String get ourVision => 'ວິໄສທັດຂອງພວກເຮົາ';

  @override
  String get visionDescription =>
      'ກາຍເປັນເວທີໂຫລາສາດທີ່ເຊື່ອຖືໄດ້ຫຼາຍທີ່ສຸດ, ປະສົມປະສານເຕັກໂນໂລຢີແລະປັນຍາບູຮານ.';

  @override
  String get ourValues => 'ຄຸນຄ່າຂອງພວກເຮົາ';

  @override
  String get valuesDescription =>
      'ຄວາມຊື່ສັດ, ຄວາມຖືກຕ້ອງ, ການອອກແບບຂອງຜູ້ໃຊ້ເປັນໃຈກາງ, ແລະການປະດິດສ້າງຢ່າງຕໍ່ເນື່ອງ.';

  @override
  String get contactUs => 'ຕິດຕໍ່ພວກເຮົາ';

  @override
  String get contactEmail => 'ອີເມວ: support@yourcompany.com';

  @override
  String get contactWebsite => 'ເວັບໄຊທ໌: www.yourcompany.com';

  @override
  String get customerSupport => 'ການຊ່ວຍເຫຼືອລູກຄ້າ';

  @override
  String get supportHeroTitle => 'ພວກເຮົາຢູ່ທີ່ນີ້ເພື່ອຊ່ວຍເຫຼືອ';

  @override
  String get supportHeroDescription =>
      'ຕື່ມຂໍ້ມູນໃສ່ແບບຟອມຂ້າງລຸ່ມນີ້ ແລະທີມງານຊ່ວຍເຫຼືອຂອງພວກເຮົາຈະຕິດຕໍ່ຫາທ່ານໄວເທົ່າທີ່ຈະໄວໄດ້.';

  @override
  String get yourName => 'ຊື່ຂອງເຈົ້າ';

  @override
  String get yourEmail => 'ອີເມວຂອງເຈົ້າ';

  @override
  String get message => 'ຂໍ້ຄວາມ';

  @override
  String get enterEmail => 'ໃສ່ອີເມວຂອງເຈົ້າ';

  @override
  String get enterValidEmail => 'ໃສ່ທີ່ຢູ່ອີເມວທີ່ຖືກຕ້ອງ';

  @override
  String enterField(Object fieldName) {
    return 'ໃສ່ $fieldName';
  }

  @override
  String get send => 'ສົ່ງ';

  @override
  String get sending => 'ກຳລັງສົ່ງ...';

  @override
  String get emailSentSuccess => '✅ ສົ່ງອີເມວສຳເລັດແລ້ວ!';

  @override
  String get emailSendFailed => '❌ ສົ່ງອີເມວບໍ່ສຳເລັດ';

  @override
  String get astroDictionaryTitle => 'ວັດຈະນານຸກົມ Astro';

  @override
  String get searchTermsHint => 'ຄຳສັບຊອກຫາ...';

  @override
  String get noTermsFound => 'ບໍ່ພົບເງື່ອນໄຂ';

  @override
  String get buyQuestionsTitle => 'ຊື້ຄໍາຖາມ';

  @override
  String get userNotAuthenticated => 'ຜູ້​ໃຊ້​ບໍ່​ໄດ້​ຮັບ​ຮອງ​';

  @override
  String get loadStoreDataFailed => 'ລົ້ມເຫລວໃນການໂຫຼດຂໍ້ມູນເກັບຮັກສາ';

  @override
  String get missingAuthToken => 'ບໍ່ມີໂທເຄັນການພິສູດຢືນຢັນ';

  @override
  String get merchantDisplayName => 'ແອັບສົນທະນາ Astro';

  @override
  String get paymentSuccessful => '✅ ຊໍາລະສຳເລັດ! ສົ່ງຄຳຖາມແລ້ວ';

  @override
  String paymentFailed(Object error) {
    return '❌ ການຈ່າຍເງິນບໍ່ສຳເລັດ: $error';
  }

  @override
  String get yourBalance => 'ຍອດເງິນຂອງທ່ານ';

  @override
  String questionsBalance(Object count) {
    return '$count ຄຳຖາມ';
  }

  @override
  String get availableOffers => 'ຂໍ້ສະເໜີທີ່ມີຢູ່';

  @override
  String questionsCount(Object count) {
    return '$count ຄຳຖາມ';
  }

  @override
  String get buyButton => 'ຊື້';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope ປະຈໍາວັນ';

  @override
  String get userIdMissing => 'ID ຜູ້ໃຊ້ຫາຍໄປ';

  @override
  String get fetchHoroscopesFailed => 'ລົ້ມເຫລວໃນການດຶງເອົາ horoscopes';

  @override
  String get noHoroscopeFound => 'ບໍ່ພົບ horoscope.';

  @override
  String get signLabel => 'ເຊັນ';

  @override
  String get todayLabel => 'ມື້ນີ້';

  @override
  String get yesterdayLabel => 'ມື້ວານນີ້';

  @override
  String get thisWeekLabel => 'ອາທິດນີ້';

  @override
  String get lastMonthLabel => 'ເດືອນທີ່ຜ່ານມາ';

  @override
  String get chatTitle => 'ສົນທະນາ';

  @override
  String get typeYourQuestionHint => 'ພິມຄຳຖາມຂອງເຈົ້າ...';

  @override
  String get paymentRequired => 'ຕ້ອງການການຈ່າຍເງິນ';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'ທ່ານໄດ້ໃຊ້ຄໍາຖາມຟຣີຂອງທ່ານ. ຈ່າຍ $amount ເພື່ອສືບຕໍ່.';
  }

  @override
  String get payNowButton => 'ຈ່າຍດຽວນີ້';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ຄຳຖາມຟຣີທີ່ຍັງເຫຼືອ';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ຄຳຖາມທີ່ຈ່າຍຍັງເຫຼືອ';
  }

  @override
  String get thankYouFeedback =>
      'ຂໍ​ຂອບ​ໃຈ​ທ່ານ​ສໍາ​ລັບ​ຄໍາ​ຄຶດ​ຄໍາ​ເຫັນ​ຂອງ​ທ່ານ​!';

  @override
  String get ratingSubmitted => 'ສົ່ງຄະແນນແລ້ວ!';

  @override
  String get setUserIdFirst => 'ກະລຸນາຕັ້ງ User ID ຂອງທ່ານກ່ອນ';

  @override
  String get failedToFetchPrevious => 'ດຶງເອົາຄຳຖາມ ແລະຄຳຕອບທີ່ຜ່ານມາບໍ່ສຳເລັດ';

  @override
  String errorOccurred(Object error) {
    return 'ຜິດພາດ: $error';
  }

  @override
  String get drawerAstroProfile => 'ຂໍ້ມູນຮູບດາວ';

  @override
  String get drawerDailyHoroscope => 'Horoscope ປະຈໍາວັນ';

  @override
  String get drawerBuyQuestions => 'ຊື້ຄໍາຖາມ';

  @override
  String get drawerAstroDictionary => 'ວັດຈະນານຸກົມ Astro';

  @override
  String get drawerSettings => 'ການຕັ້ງຄ່າ';

  @override
  String get drawerCustomerSupport => 'ການຊ່ວຍເຫຼືອລູກຄ້າ';

  @override
  String get drawerAbout => 'ກ່ຽວກັບ';

  @override
  String get drawerProfileSettings => 'ການຕັ້ງຄ່າໂປຣໄຟລ໌';

  @override
  String get demoNotificationTitle => '🔔 ແຈ້ງການສາທິດ';

  @override
  String get demoNotificationBody =>
      'ນີ້​ແມ່ນ​ການ​ແຈ້ງ​ການ​ທົດ​ສອບ​ຈາກ app ຂອງ​ທ່ານ​!';

  @override
  String get notificationsTitle => 'ການແຈ້ງເຕືອນ';

  @override
  String get noNotifications => 'ບໍ່ມີການແຈ້ງເຕືອນ';

  @override
  String get allTab => 'ທັງໝົດ';

  @override
  String get markAllAsRead => 'ໝາຍທັງໝົດວ່າອ່ານແລ້ວ';

  @override
  String get notificationMarkedRead => 'ໝາຍການແຈ້ງເຕືອນວ່າອ່ານແລ້ວ';

  @override
  String get failedToLoadNotifications => 'ໂຫຼດການແຈ້ງເຕືອນບໍ່ສຳເລັດ';

  @override
  String get failedToMarkRead => 'ໝາຍວ່າອ່ານແລ້ວບໍ່ສຳເລັດ';

  @override
  String get failedToMarkAllRead => 'ໝາຍທັງໝົດວ່າອ່ານແລ້ວບໍ່ສຳເລັດ';

  @override
  String get socketConnected => 'ເຊື່ອມຕໍ່ເຕົ້າຮັບ';

  @override
  String get socketDisconnected => 'ເຕົ້າຮັບຕັດການເຊື່ອມຕໍ່';

  @override
  String get newNotificationReceived => 'ໄດ້ຮັບການແຈ້ງເຕືອນໃໝ່';

  @override
  String get generalCategory => 'ທົ່ວໄປ';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'ສົນທະນາ';

  @override
  String get systemCategory => 'ລະບົບ';

  @override
  String get updateCategory => 'ອັບເດດ';

  @override
  String get howToAskTitle => 'ວິທີການຖາມ';

  @override
  String get noQuestionsAvailable => 'ບໍ່ມີຄຳຖາມ';

  @override
  String get failedToLoadQuestions => 'ໂຫຼດຄຳຖາມບໍ່ສຳເລັດ';

  @override
  String get pullToRefresh => 'ດຶງເພື່ອໂຫຼດຫນ້າຈໍຄືນ';

  @override
  String get careerCategory => 'ອາຊີບ';

  @override
  String get loveCategory => 'ຄວາມຮັກ & ຄວາມສຳພັນ';

  @override
  String get healthCategory => 'ສຸຂະພາບ';

  @override
  String get financeCategory => 'ການເງິນ';

  @override
  String get familyCategory => 'ຄອບຄົວ';

  @override
  String get educationCategory => 'ການສຶກສາ';

  @override
  String get travelCategory => 'ການເດີນທາງ';

  @override
  String get spiritualCategory => 'ທາງວິນຍານ';

  @override
  String get profileLoaded => 'ໂຫຼດໂປຣໄຟລ໌ສຳເລັດແລ້ວ';

  @override
  String get imageUploaded => 'ອັບໂຫຼດຮູບສຳເລັດແລ້ວ';

  @override
  String get savedInformationConfirmation => 'ຂ້ອຍໄດ້ບັນທຶກຂໍ້ມູນນີ້ໄວ້';

  @override
  String get noHistoryAvailable => 'ບໍ່ມີປະຫວັດ';

  @override
  String get missingUserIdError => 'ຕ້ອງການ ID ຜູ້ໃຊ້';

  @override
  String get networkError => 'ເຄືອຂ່າຍຜິດພາດ. ກະລຸນາລອງອີກຄັ້ງ.';

  @override
  String get timeoutError => 'ຄຳຮ້ອງຂໍໝົດເວລາ';

  @override
  String get genericError => 'ມີບາງຢ່າງຜິດພາດ';

  @override
  String get reactionUpdateError => 'ລົ້ມເຫລວໃນການປັບປຸງການໂຕ້ຕອບ';

  @override
  String get noSearchResults => 'ບໍ່ພົບຜົນການຊອກຫາ';

  @override
  String get clearSearch => 'ລຶບການຊອກຫາ';

  @override
  String get resultsFound => 'ພົບຜົນໄດ້ຮັບ';

  @override
  String get recoverySecretHint => 'Copy-paste ອາດຈະບໍ່ເຮັດວຽກ, ພິມດ້ວຍຕົນເອງ';

  @override
  String get recoverAccountDescription =>
      'ປະຕິບັດຕາມຂັ້ນຕອນເຫຼົ່ານີ້ເພື່ອກູ້ຄືນບັນຊີຂອງທ່ານ';

  @override
  String get processingLabel => 'ກຳລັງປະມວນຜົນ...';

  @override
  String get clearChatSuccess => 'ລຶບການສົນທະນາສຳເລັດແລ້ວ';

  @override
  String get notificationsEnabled => 'ເປີດໃຊ້ການແຈ້ງເຕືອນແລ້ວ';

  @override
  String get notificationsDisabled => 'ການແຈ້ງເຕືອນຖືກປິດໄວ້';

  @override
  String get securityNotice =>
      'ຂໍ້ມູນຂອງທ່ານຖືກເຂົ້າລະຫັດ ແລະເກັບຮັກສາໄວ້ຢ່າງປອດໄພ';

  @override
  String get loading => 'ກຳລັງໂຫລດ...';

  @override
  String get selectLanguage => 'ເລືອກພາສາ';

  @override
  String get onboardingGetStartedDesc => 'ເລີ່ມຕົ້ນໂດຍການເລືອກພາສາຂອງທ່ານ';

  @override
  String get accountRecoveryTitle => '🔐 ລາຍລະອຽດການກູ້ບັນຊີ';

  @override
  String get recoveryInstructions =>
      'ກະລຸນາບັນທຶກຂໍ້ມູນນີ້ຢ່າງປອດໄພ. ທ່ານຈະຕ້ອງການມັນເພື່ອກູ້ຄືນບັນຊີຂອງທ່ານ.';

  @override
  String get importantNotice => '⚠️ທີ່ສຳຄັນ:';

  @override
  String get astrologerProfileTitle => 'ໂປຣໄຟລ໌ນັກໂຫລາສາດ';

  @override
  String get personalAstrologer => 'ໂຫລາສາດສ່ວນຕົວ';

  @override
  String get makePersonalAstrologer => 'ເຮັດ​ໃຫ້​ທາງ​ໂຫລາ​ສາດ​ສ່ວນ​ບຸກ​ຄົນ​';

  @override
  String get favoriteDescription =>
      'ຄໍາຖາມຂອງເຈົ້າຈະຖືກຈັດລໍາດັບຄວາມສໍາຄັນກັບນັກໂຫລາສາດນີ້. ຖ້າບໍ່ມີ, ນັກໂຫລາສາດທີ່ມີຄຸນວຸດທິອື່ນຈະຊ່ວຍເຈົ້າ.';

  @override
  String get educationQualifications => 'ການສຶກສາ & ຄຸນສົມບັດ';

  @override
  String get aboutSection => 'ກ່ຽວກັບ';

  @override
  String get shareProfile => 'ແບ່ງປັນໂປຣໄຟລ໌';

  @override
  String get loadingAstrologer => 'ກຳລັງໂຫລດລາຍລະອຽດນັກໂຫລາສາດ...';

  @override
  String get failedToLoadAstrologer => 'ລົ້ມເຫລວໃນການໂຫລດລາຍລະອຽດຂອງນັກໂຫລາສາດ';

  @override
  String get authenticationRequired => 'ຕ້ອງມີການຢັ້ງຢືນ. ກະລຸນາເຂົ້າສູ່ລະບົບ.';

  @override
  String securityCheckFailed(Object error) {
    return 'ການກວດສອບຄວາມປອດໄພລົ້ມເຫລວ: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ດຽວນີ້ເປັນນັກໂຫລາສາດສ່ວນຕົວຂອງເຈົ້າ';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ເອົາ $name ອອກຈາກລາຍການທີ່ມັກ';
  }

  @override
  String get toggleFavoriteError => 'ລົ້ມເຫລວໃນການອັບເດດສະຖານະທີ່ມັກ';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 ການສຶກສາ: $education\n📜 ເງື່ອນໄຂ: $qualification\n⏳ ປະສົບການ: $experience';
  }

  @override
  String get notProvided => 'ບໍ່ໄດ້ສະໜອງໃຫ້';

  @override
  String reviews(Object count) {
    return '($count ການທົບທວນຄືນ)';
  }

  @override
  String get specialties => 'ພິເສດ';

  @override
  String get experience => 'ປະສົບການ';

  @override
  String get qualification => 'ຄຸນສົມບັດ';

  @override
  String get education => 'ການສຶກສາ';

  @override
  String get recoveryTips =>
      '•ຖ່າຍຮູບໜ້າຈໍຂອງຂໍ້ມູນນີ້\n• ເກັບຮັກສາໄວ້ໃນບ່ອນທີ່ປອດໄພ\n• ຢ່າແບ່ງປັນກັບໃຜ\n• ອັນນີ້ຈະຖືກສະແດງພຽງຄັ້ງດຽວເທົ່ານັ້ນ';

  @override
  String get themeSettingsTitle => 'ການຕັ້ງຄ່າຫົວຂໍ້';

  @override
  String get lightThemeLabel => 'ແສງສະຫວ່າງ';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'ມືດ';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ລະບົບ';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
