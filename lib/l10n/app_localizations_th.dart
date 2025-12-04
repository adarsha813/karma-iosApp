// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get notificationSettings => 'การตั้งค่าการแจ้งเตือน';

  @override
  String get privacySettings => 'การตั้งค่าความเป็นส่วนตัว';

  @override
  String get accountSettings => 'การตั้งค่าบัญชี';

  @override
  String get languageSettings => 'การตั้งค่าภาษา';

  @override
  String get languageChanged => 'ภาษาเปลี่ยนไป';

  @override
  String get existingUserButton => 'ฉันเป็นผู้ใช้ที่มีอยู่แล้ว';

  @override
  String get chooseCountryTitle => 'เลือกประเทศ';

  @override
  String get yesText => 'ใช่';

  @override
  String get noText => 'เลขที่';

  @override
  String get appBarTitle => 'การตั้งค่าโปรไฟล์';

  @override
  String get userIdLabel => 'รหัสผู้ใช้ *';

  @override
  String get nameLabel => 'ชื่อ';

  @override
  String get birthCountryLabel => 'ประเทศที่เกิด';

  @override
  String get birthCityLabel => 'เมืองเกิด';

  @override
  String get countrySelectionTitle => 'เลือกประเทศของคุณ';

  @override
  String get maleLabel => 'ชาย';

  @override
  String get femaleLabel => 'หญิง';

  @override
  String get birthDateLabel => 'วันเกิด';

  @override
  String get birthDatePlaceholder => 'เลือกวันเกิด';

  @override
  String get birthTimeLabel => 'เวลาเกิด';

  @override
  String get birthTimePlaceholder => 'เลือกเวลาเกิด';

  @override
  String get saveProfileButton => 'บันทึกโปรไฟล์';

  @override
  String get noCitiesFound => 'ไม่พบเมือง';

  @override
  String cityPlaceholder(Object country) {
    return 'ป้อนเมืองใน $country';
  }

  @override
  String get countryFirstPlaceholder => 'เลือกประเทศก่อน';

  @override
  String get versionHistoryTitle => 'ประวัติเวอร์ชัน';

  @override
  String get notSetText => 'ไม่ได้ตั้งค่า';

  @override
  String nameHistory(Object name) {
    return 'ชื่อ: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'เมือง: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'ประเทศ: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'เพศ: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'วันเกิด: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'เวลาเกิด: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'ตำแหน่ง: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'เขตเวลา: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'เวลาออมแสง: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'รัฐ: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'อัปเดตเมื่อ $date';
  }

  @override
  String get userIdRequired => 'จำเป็นต้องมีรหัสผู้ใช้';

  @override
  String get profileSaved => 'บันทึกโปรไฟล์สำเร็จแล้ว';

  @override
  String get saveFailed => 'ไม่สามารถบันทึกโปรไฟล์ได้';

  @override
  String get errorPrefix => 'ข้อผิดพลาด:';

  @override
  String get onboardingChooseLanguage => 'เลือกภาษาของคุณ';

  @override
  String get onboardingChooseLanguageDesc =>
      'เลือกภาษาที่คุณต้องการเพื่อดำเนินการต่อ';

  @override
  String get onboardingWhatIsAstrology => 'โหราศาสตร์คืออะไร?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'โหราศาสตร์ คือ การศึกษาเกี่ยวกับวัตถุท้องฟ้า...';

  @override
  String get onboardingWhyUseApp => 'เหตุใดจึงต้องใช้แอพนี้?';

  @override
  String get onboardingWhyUseAppDesc =>
      'รับคำทำนายดวงชะตาส่วนบุคคล คำทำนายรายวัน และคำแนะนำเพื่อให้ตัดสินใจได้อย่างถูกต้อง';

  @override
  String get onboardingHowToUse => 'วิธีใช้แอพนี้?';

  @override
  String get onboardingHowToUseDesc =>
      'นำทางได้อย่างง่ายดาย ตรวจสอบดวงชะตารายวัน และจัดการโปรไฟล์ของคุณเพื่อการทำนายที่แม่นยำ';

  @override
  String get onboardingGetStarted => 'เริ่มต้นใช้งาน';

  @override
  String get onboardingNewUser => 'ผู้ใช้ใหม่';

  @override
  String get onboardingExistingUser => 'ผู้ใช้ที่มีอยู่';

  @override
  String get onboardingBack => 'กลับ';

  @override
  String get onboardingNext => 'ต่อไป';

  @override
  String get userIdNotFound =>
      'ไม่พบรหัสผู้ใช้ กรุณาเข้าสู่ระบบหรือตั้งค่าโปรไฟล์ของคุณ';

  @override
  String get clearNotificationsTitle => 'การแจ้งเตือนที่ชัดเจน';

  @override
  String get clearNotificationsMessage =>
      'คุณแน่ใจว่าต้องการล้างการแจ้งเตือนทั้งหมดหรือไม่?';

  @override
  String get clearNotificationsSuccess =>
      'การแจ้งเตือนทั้งหมดได้รับการเคลียร์สำเร็จแล้ว';

  @override
  String get clearHoroscopeTitle => 'ดวงชะตาแจ่มใส';

  @override
  String get clearHoroscopeMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการล้างข้อมูลดวงชะตาของคุณ?';

  @override
  String get clearHoroscopeSuccess => 'ดวงชะตาเคลียร์เรียบร้อยแล้ว';

  @override
  String get clearChatTitle => 'ล้างประวัติการแชท';

  @override
  String get clearChatMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบประวัติการแชททั้งหมดของคุณ?';

  @override
  String get clearChatLocal => 'แชทได้รับการเคลียร์ภายในเครื่องแล้ว';

  @override
  String get deleteAccountTitle => 'ลบบัญชี';

  @override
  String get deleteAccountMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีของคุณ? การดำเนินการนี้จะล้างประวัติการแชทและการแจ้งเตือนทั้งหมดของคุณด้วย';

  @override
  String get deleteAccountSuccess => 'บัญชีและข้อมูลทั้งหมดของคุณถูกลบออกแล้ว';

  @override
  String get deleteAccountError => 'เกิดข้อผิดพลาดในการลบบัญชี';

  @override
  String get logoutTitle => 'ออกจากระบบ';

  @override
  String get logoutMessage => 'คุณแน่ใจว่าต้องการออกจากระบบใช่ไหม?';

  @override
  String get termsPrivacyTitle => 'ข้อกำหนดและความเป็นส่วนตัว';

  @override
  String get privacyPolicyTitle => 'นโยบายความเป็นส่วนตัว';

  @override
  String get termsConditionsTitle => 'ข้อกำหนดและเงื่อนไข';

  @override
  String get dataControlTitle => 'การควบคุมข้อมูล';

  @override
  String get cancelButton => 'ยกเลิก';

  @override
  String get confirmButton => 'ยืนยัน';

  @override
  String get clearQuestionsSuccess => 'ลบคำถามทั้งหมดสำเร็จแล้ว';

  @override
  String get yoginiLabel => 'โยคินี';

  @override
  String get lordLabel => 'พระเจ้า';

  @override
  String get startLabel => 'เริ่ม';

  @override
  String get recoverAccount => 'กู้คืนบัญชี';

  @override
  String get endLabel => 'จบ';

  @override
  String get startDateLabel => 'วันที่เริ่มต้น';

  @override
  String get endDateLabel => 'วันที่สิ้นสุด';

  @override
  String get notAvailable => 'ไม่สามารถใช้งานได้';

  @override
  String get noData => 'ไม่มีข้อมูล';

  @override
  String get unknownError => 'ข้อผิดพลาดที่ไม่รู้จัก';

  @override
  String get retryButton => 'ลองใหม่อีกครั้ง';

  @override
  String get kundaliGeneratorTitle => 'เครื่องกำเนิด Kundali';

  @override
  String get natalChartTitle => 'แผนภูมิการเกิด';

  @override
  String get lagnaLabel => 'ลัคนา';

  @override
  String get rashiLabel => 'ราชี';

  @override
  String get ascDegreeLabel => 'ระดับขั้นขึ้น';

  @override
  String get vimshottariDashaTitle => 'วิมช็อตตารี ดาชา';

  @override
  String get yoginiDashaTitle => 'โยคินี ทศา';

  @override
  String get unknown => 'ไม่ทราบ';

  @override
  String get clearHoroscope => 'ดวงชะตาแจ่มใส';

  @override
  String get clearNotifications => 'การแจ้งเตือนที่ชัดเจน';

  @override
  String get clearChatHistory => 'ล้างประวัติการแชท';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get deleteAccount => 'ลบบัญชี';

  @override
  String get allFieldsRequired => 'ต้องกรอกข้อมูลทุกช่อง';

  @override
  String get accountRecoveredSuccess => 'กู้คืนบัญชีสำเร็จแล้ว';

  @override
  String get recoveryFailed => 'การกู้คืนล้มเหลว โปรดตรวจสอบข้อมูลของคุณ';

  @override
  String get recoverySecretLabel => 'ความลับในการกู้คืน:';

  @override
  String get aboutUsTitle => 'เกี่ยวกับเรา';

  @override
  String get aboutOurCompany => 'เกี่ยวกับบริษัทของเรา';

  @override
  String get aboutCompanyDescription =>
      'ที่ Karma เราช่วยคุณค้นพบเส้นทางชีวิตที่แท้จริงของคุณผ่านภูมิปัญญาเหนือกาลเวลาของโหราศาสตร์พระเวท ทุกข้อมูลเชิงลึกมาจากนักโหราศาสตร์ผู้มีประสบการณ์จริง คัดสรรอย่างพิถีพิถันตามดวงชะตาเฉพาะบุคคลของคุณ ตั้งแต่ดวงชะตาประจำวันไปจนถึงคำแนะนำเฉพาะบุคคล Karma ทำให้ความรู้โบราณเข้าถึงได้ในกว่า 100 ภาษา';

  @override
  String get ourMission => 'ภารกิจของเรา';

  @override
  String get missionDescription =>
      'ภารกิจของเราเรียบง่าย: คือการให้คำแนะนำทางโหราศาสตร์ที่แท้จริงและนำโดยมนุษย์ ซึ่งจะช่วยให้คุณตัดสินใจได้อย่างมั่นใจและรอบรู้ คำทำนายและการให้คำปรึกษาทุกครั้งสะท้อนถึงความเชี่ยวชาญระดับมืออาชีพที่สั่งสมมายาวนานหลายปี ไม่ใช่อัลกอริทึมอัตโนมัติ';

  @override
  String get ourVision => 'วิสัยทัศน์ของเรา';

  @override
  String get visionDescription =>
      'เราพยายามที่จะเป็นแพลตฟอร์มที่น่าเชื่อถือที่สุดในโลกสำหรับโหราศาสตร์เวท โดยช่วยให้ผู้คนทุกที่เข้าใจตนเอง การเลือกของตน และเส้นทางชีวิตของตนด้วยความชัดเจนและมั่นใจ';

  @override
  String get ourValues => 'คุณค่าของเรา';

  @override
  String get valuesDescription =>
      'ที่ Karma เราให้ความสำคัญกับความถูกต้อง แม่นยำ และความไว้วางใจ เรามุ่งมั่นที่จะมอบคำแนะนำที่ไม่เพียงแต่แม่นยำ แต่ยังมีความหมาย ช่วยให้คุณก้าวผ่านชีวิตด้วยความเข้าใจและความมั่นใจ';

  @override
  String get contactUs => 'ติดต่อเรา';

  @override
  String get contactEmail => 'อีเมล: support@yourcompany.com';

  @override
  String get contactWebsite => 'เว็บไซต์: www.yourcompany.com';

  @override
  String get customerSupport => 'ฝ่ายสนับสนุนลูกค้า';

  @override
  String get supportHeroTitle => 'เราอยู่ที่นี่เพื่อช่วยเหลือคุณ';

  @override
  String get supportHeroDescription =>
      'กรอกแบบฟอร์มด้านล่างนี้และทีมสนับสนุนของเราจะติดต่อกลับคุณโดยเร็วที่สุด';

  @override
  String get yourName => 'ชื่อของคุณ';

  @override
  String get yourEmail => 'อีเมล์ของคุณ';

  @override
  String get message => 'ข้อความ';

  @override
  String get enterEmail => 'กรอกอีเมล์ของคุณ';

  @override
  String get enterValidEmail => 'ป้อนที่อยู่อีเมลที่ถูกต้อง';

  @override
  String enterField(Object fieldName) {
    return 'ป้อน $fieldName';
  }

  @override
  String get send => 'ส่ง';

  @override
  String get sending => 'กำลังส่ง...';

  @override
  String get emailSentSuccess => '✅ ส่งอีเมลเรียบร้อยแล้ว!';

  @override
  String get emailSendFailed => '❌ ไม่สามารถส่งอีเมล์ได้';

  @override
  String get astroDictionaryTitle => 'พจนานุกรมโหราศาสตร์';

  @override
  String get searchTermsHint => 'เงื่อนไขการค้นหา...';

  @override
  String get noTermsFound => 'ไม่พบเงื่อนไข';

  @override
  String get buyQuestionsTitle => 'คำถามเกี่ยวกับการซื้อ';

  @override
  String get userNotAuthenticated => 'ผู้ใช้ไม่ได้รับการรับรอง';

  @override
  String get loadStoreDataFailed => 'ไม่สามารถโหลดข้อมูลร้านค้าได้';

  @override
  String get missingAuthToken => 'โทเค็นการตรวจสอบสิทธิ์หายไป';

  @override
  String get merchantDisplayName => 'แอป Astro Chat';

  @override
  String get paymentSuccessful => '✅ ชำระเงินสำเร็จ! ส่งคำถามแล้ว';

  @override
  String paymentFailed(Object error) {
    return '❌ การชำระเงินล้มเหลว: $error';
  }

  @override
  String get yourBalance => 'ยอดคงเหลือของคุณ';

  @override
  String questionsBalance(Object count) {
    return '$count คำถาม';
  }

  @override
  String get availableOffers => 'ข้อเสนอที่มีจำหน่าย';

  @override
  String questionsCount(Object count) {
    return '$count คำถาม';
  }

  @override
  String get buyButton => 'ซื้อ';

  @override
  String get dailyHoroscopeTitle => '🌟 ดูดวงรายวัน';

  @override
  String get userIdMissing => 'รหัสผู้ใช้หายไป';

  @override
  String get fetchHoroscopesFailed => 'ไม่สามารถดึงข้อมูลดวงชะตาได้';

  @override
  String get noHoroscopeFound => 'ไม่พบดวงชะตา';

  @override
  String get signLabel => 'เข้าสู่ระบบ';

  @override
  String get todayLabel => 'วันนี้';

  @override
  String get yesterdayLabel => 'เมื่อวาน';

  @override
  String get thisWeekLabel => 'สัปดาห์นี้';

  @override
  String get lastMonthLabel => 'เดือนที่แล้ว';

  @override
  String get chatTitle => 'แชท';

  @override
  String get typeYourQuestionHint => 'พิมพ์คำถามของคุณ...';

  @override
  String get paymentRequired => 'ต้องชำระเงิน';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'คุณใช้คำถามฟรีของคุณแล้ว ชำระเงิน $amount เพื่อดำเนินการต่อ';
  }

  @override
  String get payNowButton => 'ชำระเงินตอนนี้';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count คำถามฟรีที่เหลืออยู่';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count คำถามที่ชำระเงินแล้วที่เหลืออยู่';
  }

  @override
  String get thankYouFeedback => 'ขอขอบคุณสำหรับคำติชมของคุณ!';

  @override
  String get ratingSubmitted => 'ส่งคะแนนแล้ว!';

  @override
  String get setUserIdFirst => 'กรุณาตั้งค่า User ID ของคุณก่อน';

  @override
  String get failedToFetchPrevious => 'ไม่สามารถดึงคำถามและคำตอบก่อนหน้าได้';

  @override
  String errorOccurred(Object error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get drawerAstroProfile => 'โปรไฟล์แอสโตร';

  @override
  String get drawerDailyHoroscope => 'ดวงรายวัน';

  @override
  String get drawerBuyQuestions => 'คำถามเกี่ยวกับการซื้อ';

  @override
  String get drawerAstroDictionary => 'พจนานุกรมโหราศาสตร์';

  @override
  String get drawerSettings => 'การตั้งค่า';

  @override
  String get drawerCustomerSupport => 'ฝ่ายสนับสนุนลูกค้า';

  @override
  String get drawerAbout => 'เกี่ยวกับ';

  @override
  String get drawerProfileSettings => 'การตั้งค่าโปรไฟล์';

  @override
  String get demoNotificationTitle => '🔔 การแจ้งเตือนการสาธิต';

  @override
  String get demoNotificationBody => 'นี่คือการแจ้งเตือนทดสอบจากแอปของคุณ!';

  @override
  String get notificationsTitle => 'การแจ้งเตือน';

  @override
  String get noNotifications => 'ไม่มีการแจ้งเตือน';

  @override
  String get allTab => 'ทั้งหมด';

  @override
  String get markAllAsRead => 'ทำเครื่องหมายทั้งหมดว่าอ่านแล้ว';

  @override
  String get notificationMarkedRead =>
      'การแจ้งเตือนถูกทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get failedToLoadNotifications => 'ไม่สามารถโหลดการแจ้งเตือนได้';

  @override
  String get failedToMarkRead => 'ไม่สามารถทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get failedToMarkAllRead =>
      'ไม่สามารถทำเครื่องหมายว่าอ่านแล้วทั้งหมดได้';

  @override
  String get socketConnected => 'เชื่อมต่อซ็อกเก็ตแล้ว';

  @override
  String get socketDisconnected => 'ซ็อกเก็ตถูกตัดการเชื่อมต่อ';

  @override
  String get newNotificationReceived => 'ได้รับการแจ้งเตือนใหม่';

  @override
  String get generalCategory => 'ทั่วไป';

  @override
  String get horoscopeCategory => 'ดวงชะตา';

  @override
  String get chatCategory => 'แชท';

  @override
  String get systemCategory => 'ระบบ';

  @override
  String get updateCategory => 'อัพเดท';

  @override
  String get howToAskTitle => 'วิธีการถาม';

  @override
  String get noQuestionsAvailable => 'ไม่มีคำถามใดๆ';

  @override
  String get failedToLoadQuestions => 'ไม่สามารถโหลดคำถามได้';

  @override
  String get pullToRefresh => 'ดึงเพื่อรีเฟรช';

  @override
  String get careerCategory => 'อาชีพ';

  @override
  String get loveCategory => 'ความรักและความสัมพันธ์';

  @override
  String get healthCategory => 'สุขภาพ';

  @override
  String get financeCategory => 'การเงิน';

  @override
  String get familyCategory => 'ตระกูล';

  @override
  String get educationCategory => 'การศึกษา';

  @override
  String get travelCategory => 'การท่องเที่ยว';

  @override
  String get spiritualCategory => 'จิตวิญญาณ';

  @override
  String get profileLoaded => 'โหลดโปรไฟล์สำเร็จแล้ว';

  @override
  String get imageUploaded => 'อัพโหลดรูปภาพสำเร็จแล้ว';

  @override
  String get savedInformationConfirmation => 'ฉันได้บันทึกข้อมูลนี้ไว้';

  @override
  String get noHistoryAvailable => 'ไม่มีประวัติ';

  @override
  String get missingUserIdError => 'จำเป็นต้องมีรหัสผู้ใช้';

  @override
  String get networkError => 'ข้อผิดพลาดของเครือข่าย โปรดลองอีกครั้ง';

  @override
  String get timeoutError => 'คำขอหมดเวลาแล้ว';

  @override
  String get genericError => 'มีบางอย่างผิดพลาดเกิดขึ้น';

  @override
  String get reactionUpdateError => 'ไม่สามารถอัปเดตปฏิกิริยาได้';

  @override
  String get noSearchResults => 'ไม่พบผลการค้นหา';

  @override
  String get clearSearch => 'ค้นหาที่ชัดเจน';

  @override
  String get resultsFound => 'ผลลัพธ์ที่พบ';

  @override
  String get recoverySecretHint =>
      'การคัดลอกและวางอาจใช้ไม่ได้ โปรดพิมพ์ด้วยตนเอง';

  @override
  String get recoverAccountDescription =>
      'ปฏิบัติตามขั้นตอนเหล่านี้เพื่อกู้คืนบัญชีของคุณ';

  @override
  String get processingLabel => 'กำลังประมวลผล...';

  @override
  String get clearChatSuccess => 'ล้างแชทสำเร็จแล้ว';

  @override
  String get notificationsEnabled => 'เปิดใช้งานการแจ้งเตือนแล้ว';

  @override
  String get notificationsDisabled => 'การแจ้งเตือนถูกปิดใช้งาน';

  @override
  String get securityNotice =>
      'ข้อมูลของคุณได้รับการเข้ารหัสและจัดเก็บอย่างปลอดภัย';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get selectLanguage => 'เลือกภาษา';

  @override
  String get onboardingGetStartedDesc => 'เริ่มต้นด้วยการเลือกภาษาของคุณ';

  @override
  String get accountRecoveryTitle => '🔐 รายละเอียดการกู้คืนบัญชี';

  @override
  String get recoveryInstructions =>
      'โปรดบันทึกข้อมูลนี้ไว้อย่างปลอดภัย คุณจะต้องใช้ข้อมูลนี้เพื่อกู้คืนบัญชีของคุณ';

  @override
  String get importantNotice => '⚠️ สำคัญ:';

  @override
  String get astrologerProfileTitle => 'โปรไฟล์นักโหราศาสตร์';

  @override
  String get personalAstrologer => 'โหรส่วนตัว';

  @override
  String get makePersonalAstrologer => 'สร้างนักโหราศาสตร์ส่วนตัว';

  @override
  String get favoriteDescription =>
      'คำถามของคุณจะถูกส่งต่อไปยังนักโหราศาสตร์ท่านนี้ก่อน หากไม่ว่าง นักโหราศาสตร์ท่านอื่นที่มีคุณสมบัติเหมาะสมจะช่วยเหลือคุณ';

  @override
  String get educationQualifications => 'การศึกษาและคุณสมบัติ';

  @override
  String get aboutSection => 'เกี่ยวกับ';

  @override
  String get shareProfile => 'แชร์โปรไฟล์';

  @override
  String get loadingAstrologer => 'กำลังโหลดรายละเอียดนักโหราศาสตร์...';

  @override
  String get failedToLoadAstrologer =>
      'ไม่สามารถโหลดรายละเอียดนักโหราศาสตร์ได้';

  @override
  String get authenticationRequired =>
      'จำเป็นต้องมีการตรวจสอบสิทธิ์ กรุณาเข้าสู่ระบบ';

  @override
  String securityCheckFailed(Object error) {
    return 'การตรวจสอบความปลอดภัยล้มเหลว: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name เป็นนักโหราศาสตร์ส่วนตัวของคุณแล้ว';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ ลบ $name ออกจากรายการโปรด';
  }

  @override
  String get toggleFavoriteError => 'ไม่สามารถอัปเดตสถานะรายการโปรดได้';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 การศึกษา: $education\n📜 คุณสมบัติ: $qualification\n⏳ ประสบการณ์: $experience';
  }

  @override
  String get notProvided => 'ไม่ได้จัดเตรียมไว้';

  @override
  String reviews(Object count) {
    return '($count รีวิว)';
  }

  @override
  String get specialties => 'ความเชี่ยวชาญ';

  @override
  String get experience => 'ประสบการณ์';

  @override
  String get qualification => 'คุณสมบัติ';

  @override
  String get education => 'การศึกษา';

  @override
  String get recoveryTips =>
      '• จับภาพหน้าจอข้อมูลนี้\n• เก็บไว้ในที่ปลอดภัย\n• ห้ามแชร์ข้อมูลกับผู้อื่น\n• ข้อมูลนี้จะแสดงเพียงครั้งเดียว';

  @override
  String get themeSettingsTitle => 'การตั้งค่าธีม';

  @override
  String get lightThemeLabel => 'แสงสว่าง';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'มืด';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'ระบบ';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'ทีมงานของเรา';

  @override
  String get teamDescription =>
      'ทีมนักโหราศาสตร์พระเวทมืออาชีพของเรามีประสบการณ์ยาวนานหลายปีในการตีความอิทธิพลของดาวเคราะห์และรูปแบบชีวิต ด้วยการสนับสนุนและทีมพัฒนาที่ทุ่มเท Karma จึงมอบประสบการณ์ที่ราบรื่น เชื่อถือได้ และครอบคลุมทั่วโลกให้กับผู้ใช้ทุกคน';
}
