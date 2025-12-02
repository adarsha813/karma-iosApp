// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get settingsTitle => 'Тохиргоо';

  @override
  String get notificationSettings => 'Мэдэгдлийн тохиргоо';

  @override
  String get privacySettings => 'Нууцлалын тохиргоо';

  @override
  String get accountSettings => 'Бүртгэлийн тохиргоо';

  @override
  String get languageSettings => 'Хэлний тохиргоо';

  @override
  String get languageChanged => 'Хэл өөрчлөгдсөн';

  @override
  String get existingUserButton => 'Би одоо байгаа хэрэглэгч';

  @override
  String get chooseCountryTitle => 'Улсаа сонгоно уу';

  @override
  String get yesText => 'Тиймээ';

  @override
  String get noText => 'Үгүй';

  @override
  String get appBarTitle => 'Профайлын тохиргоо';

  @override
  String get userIdLabel => 'Хэрэглэгчийн ID *';

  @override
  String get nameLabel => 'Нэр';

  @override
  String get birthCountryLabel => 'Төрсөн улс';

  @override
  String get birthCityLabel => 'Төрсөн хот';

  @override
  String get countrySelectionTitle => 'Улсаа сонго';

  @override
  String get maleLabel => 'Эрэгтэй';

  @override
  String get femaleLabel => 'Эмэгтэй';

  @override
  String get birthDateLabel => 'Төрсөн огноо';

  @override
  String get birthDatePlaceholder => 'Төрсөн огноог сонгоно уу';

  @override
  String get birthTimeLabel => 'Төрсөн цаг';

  @override
  String get birthTimePlaceholder => 'Төрсөн цагийг сонгоно уу';

  @override
  String get saveProfileButton => 'Профайлыг хадгалах';

  @override
  String get noCitiesFound => 'Хот олдсонгүй';

  @override
  String cityPlaceholder(Object country) {
    return '$country-д хотыг оруулна уу';
  }

  @override
  String get countryFirstPlaceholder => 'Эхлээд улсаа сонгоно уу';

  @override
  String get versionHistoryTitle => 'Хувилбарын түүх';

  @override
  String get notSetText => 'Тохируулаагүй';

  @override
  String nameHistory(Object name) {
    return 'Нэр: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Хот: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Улс: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Хүйс: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Төрсөн огноо: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Төрсөн цаг: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Байршил: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Цагийн бүс: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Төлөв: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date-д шинэчлэгдсэн';
  }

  @override
  String get userIdRequired => 'Хэрэглэгчийн ID шаардлагатай';

  @override
  String get profileSaved => 'Профайлыг амжилттай хадгаллаа';

  @override
  String get saveFailed => 'Профайлыг хадгалж чадсангүй';

  @override
  String get errorPrefix => 'Алдаа:';

  @override
  String get onboardingChooseLanguage => 'Хэлээ сонго';

  @override
  String get onboardingChooseLanguageDesc =>
      'Үргэлжлүүлэхийн тулд хүссэн хэлээ сонгоно уу.';

  @override
  String get onboardingWhatIsAstrology => 'Astrology гэж юу вэ?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Астрологи бол тэнгэрийн биетүүдийг судалдаг...';

  @override
  String get onboardingWhyUseApp => 'Яагаад энэ програмыг ашиглах вэ?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Мэдээлэлтэй шийдвэр гаргахын тулд хувийн зурхай, өдөр тутмын таамаглал, удирдамжийг аваарай.';

  @override
  String get onboardingHowToUse => 'Энэ програмыг хэрхэн ашиглах вэ?';

  @override
  String get onboardingHowToUseDesc =>
      'Хялбар чиглүүлж, өдөр тутмын зурхайг шалгаж, үнэн зөв таамаглал гаргахын тулд профайлаа удирдаарай.';

  @override
  String get onboardingGetStarted => 'Эхлэх';

  @override
  String get onboardingNewUser => 'Шинэ хэрэглэгч';

  @override
  String get onboardingExistingUser => 'Одоо байгаа хэрэглэгч';

  @override
  String get onboardingBack => 'Буцах';

  @override
  String get onboardingNext => 'Дараа нь';

  @override
  String get userIdNotFound =>
      'Хэрэглэгчийн ID олдсонгүй. Нэвтрэх эсвэл профайлаа тохируулна уу.';

  @override
  String get clearNotificationsTitle => 'Мэдэгдлийг арилгах';

  @override
  String get clearNotificationsMessage =>
      'Та бүх мэдэгдлийг устгахдаа итгэлтэй байна уу?';

  @override
  String get clearNotificationsSuccess => 'Бүх мэдэгдлийг амжилттай арилгалаа.';

  @override
  String get clearHoroscopeTitle => 'Тодорхой зурхай';

  @override
  String get clearHoroscopeMessage =>
      'Та зурхайн мэдээллээ устгахдаа итгэлтэй байна уу?';

  @override
  String get clearHoroscopeSuccess => 'Зурхайг амжилттай арилгалаа.';

  @override
  String get clearChatTitle => 'Чатын түүхийг арилгах';

  @override
  String get clearChatMessage =>
      'Та бүх чатын түүхээ устгахдаа итгэлтэй байна уу?';

  @override
  String get clearChatLocal => 'Орон нутгийн чатыг устгасан.';

  @override
  String get deleteAccountTitle => 'Бүртгэл устгах';

  @override
  String get deleteAccountMessage =>
      'Та бүртгэлээ устгахдаа итгэлтэй байна уу? Энэ нь таны бүх чатын түүх болон мэдэгдлийг арилгах болно.';

  @override
  String get deleteAccountSuccess =>
      'Таны бүртгэл болон бүх өгөгдлийг устгасан.';

  @override
  String get deleteAccountError => 'Бүртгэлийг устгахад алдаа гарлаа';

  @override
  String get logoutTitle => 'Гарах';

  @override
  String get logoutMessage => 'Та гарахдаа итгэлтэй байна уу?';

  @override
  String get termsPrivacyTitle => 'Нөхцөл ба нууцлал';

  @override
  String get privacyPolicyTitle => 'Нууцлалын бодлого';

  @override
  String get termsConditionsTitle => 'Нөхцөл ба нөхцөл';

  @override
  String get dataControlTitle => 'Өгөгдлийн хяналт';

  @override
  String get cancelButton => 'Цуцлах';

  @override
  String get confirmButton => 'Баталгаажуулах';

  @override
  String get clearQuestionsSuccess => 'Бүх асуултыг амжилттай устгасан.';

  @override
  String get yoginiLabel => 'Йогини';

  @override
  String get lordLabel => 'Эзэн';

  @override
  String get startLabel => 'Эхлэх';

  @override
  String get recoverAccount => 'Бүртгэл сэргээх';

  @override
  String get endLabel => 'Төгсгөл';

  @override
  String get startDateLabel => 'Эхлэх огноо';

  @override
  String get endDateLabel => 'Дуусах огноо';

  @override
  String get notAvailable => 'Боломжгүй';

  @override
  String get noData => 'Өгөгдөл алга';

  @override
  String get unknownError => 'Үл мэдэгдэх алдаа';

  @override
  String get retryButton => 'Дахин оролдоно уу';

  @override
  String get kundaliGeneratorTitle => 'Кундали генератор';

  @override
  String get natalChartTitle => 'Натал график';

  @override
  String get lagnaLabel => 'Лагна';

  @override
  String get rashiLabel => 'Раши';

  @override
  String get ascDegreeLabel => 'Өсөх зэрэг';

  @override
  String get vimshottariDashaTitle => 'Вимшоттари Даша';

  @override
  String get yoginiDashaTitle => 'Йогини Даша';

  @override
  String get unknown => 'Тодорхойгүй';

  @override
  String get clearHoroscope => 'Тодорхой зурхай';

  @override
  String get clearNotifications => 'Мэдэгдлийг арилгах';

  @override
  String get clearChatHistory => 'Чатын түүхийг арилгах';

  @override
  String get logout => 'Гарах';

  @override
  String get deleteAccount => 'Бүртгэл устгах';

  @override
  String get allFieldsRequired => 'Бүх талбарыг оруулах шаардлагатай.';

  @override
  String get accountRecoveredSuccess => 'Бүртгэлийг амжилттай сэргээлээ.';

  @override
  String get recoveryFailed =>
      'Сэргээх ажиллагаа амжилтгүй боллоо. Мэдээллээ шалгана уу.';

  @override
  String get recoverySecretLabel => 'Сэргээх нууц:';

  @override
  String get aboutUsTitle => 'Бидний тухай';

  @override
  String get aboutOurCompany => 'Манай компанийн тухай';

  @override
  String get aboutCompanyDescription =>
      'Бид хэрэглэгчиддээ зурхайн шилдэг туршлагыг хүргэхийг зорьж байна.';

  @override
  String get ourMission => 'Бидний эрхэм зорилго';

  @override
  String get missionDescription =>
      'Хэрэглэгчдэд амьдралдаа мэдээлэлтэй шийдвэр гаргахад нь туслахын тулд үнэн зөв, хувь хүний зурхайн ойлголтыг өгөх.';

  @override
  String get ourVision => 'Бидний Алсын хараа';

  @override
  String get visionDescription =>
      'Технологи болон эртний мэргэн ухааныг хослуулсан хамгийн найдвартай зурхайн платформ болох.';

  @override
  String get ourValues => 'Бидний үнэт зүйлс';

  @override
  String get valuesDescription =>
      'Шударга байдал, нарийвчлал, хэрэглэгчдэд чиглэсэн дизайн, тасралтгүй шинэчлэл.';

  @override
  String get contactUs => 'Бидэнтэй холбоо барина уу';

  @override
  String get contactEmail => 'Имэйл: support@yourcompany.com';

  @override
  String get contactWebsite => 'Вэбсайт: www.yourcompany.com';

  @override
  String get customerSupport => 'Хэрэглэгчийн дэмжлэг';

  @override
  String get supportHeroTitle => 'Бид туслахаар ирлээ';

  @override
  String get supportHeroDescription =>
      'Доорх маягтыг бөглөнө үү, манай тусламжийн баг тантай аль болох хурдан холбогдох болно.';

  @override
  String get yourName => 'Таны нэр';

  @override
  String get yourEmail => 'Таны имэйл';

  @override
  String get message => 'Мессеж';

  @override
  String get enterEmail => 'Имэйлээ оруулна уу';

  @override
  String get enterValidEmail => 'Хүчинтэй имэйл хаяг оруулна уу';

  @override
  String enterField(Object fieldName) {
    return '$fieldName-г оруулна уу';
  }

  @override
  String get send => 'Илгээх';

  @override
  String get sending => 'Илгээж байна...';

  @override
  String get emailSentSuccess => '✅ Имэйлийг амжилттай илгээлээ!';

  @override
  String get emailSendFailed => '❌ Имэйл илгээж чадсангүй';

  @override
  String get astroDictionaryTitle => 'Astro толь бичиг';

  @override
  String get searchTermsHint => 'Хайлтын нэр томъёо...';

  @override
  String get noTermsFound => 'Нөхцөл олдсонгүй';

  @override
  String get buyQuestionsTitle => 'Худалдан авах асуултууд';

  @override
  String get userNotAuthenticated => 'Хэрэглэгч баталгаажаагүй байна';

  @override
  String get loadStoreDataFailed => 'Дэлгүүрийн өгөгдлийг ачаалж чадсангүй';

  @override
  String get missingAuthToken => 'Баталгаажуулах токен дутуу байна';

  @override
  String get merchantDisplayName => 'Astro Chat програм';

  @override
  String get paymentSuccessful => '✅ Төлбөр амжилттай боллоо! Асуулт илгээсэн';

  @override
  String paymentFailed(Object error) {
    return '❌ Төлбөр амжилтгүй болсон: $error';
  }

  @override
  String get yourBalance => 'Таны үлдэгдэл';

  @override
  String questionsBalance(Object count) {
    return '$count Асуултууд';
  }

  @override
  String get availableOffers => 'Боломжтой саналууд';

  @override
  String questionsCount(Object count) {
    return '$count Асуулт';
  }

  @override
  String get buyButton => 'Худалдан авах';

  @override
  String get dailyHoroscopeTitle => '🌟 Өдөр тутмын зурхай';

  @override
  String get userIdMissing => 'Хэрэглэгчийн ID дутуу байна';

  @override
  String get fetchHoroscopesFailed => 'Зурхай дуудаж чадсангүй';

  @override
  String get noHoroscopeFound => 'Зурхай олдсонгүй.';

  @override
  String get signLabel => 'Гарын үсэг зурах';

  @override
  String get todayLabel => 'Өнөөдөр';

  @override
  String get yesterdayLabel => 'Өчигдөр';

  @override
  String get thisWeekLabel => 'Энэ долоо хоногт';

  @override
  String get lastMonthLabel => 'Өнгөрсөн сард';

  @override
  String get chatTitle => 'Чатлах';

  @override
  String get typeYourQuestionHint => 'Асуултаа бичнэ үү...';

  @override
  String get paymentRequired => 'Төлбөр хийх шаардлагатай';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Та үнэгүй асуултуудаа ашигласан. Үргэлжлүүлэхийн тулд ₹50 төлнө үү.';
  }

  @override
  String get payNowButton => 'Одоо төл';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count үнэгүй асуултууд үлдсэн';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count төлбөртэй асуултууд үлдсэн';
  }

  @override
  String get thankYouFeedback => 'Санал хүсэлтээ өгсөнд баярлалаа!';

  @override
  String get ratingSubmitted => 'Үнэлгээ өгсөн!';

  @override
  String get setUserIdFirst => 'Эхлээд хэрэглэгчийн ID-аа тохируулна уу';

  @override
  String get failedToFetchPrevious =>
      'Өмнөх асуулт, хариултыг дуудаж чадсангүй';

  @override
  String errorOccurred(Object error) {
    return 'Алдаа: $error';
  }

  @override
  String get drawerAstroProfile => 'Астро профайл';

  @override
  String get drawerDailyHoroscope => 'Өдөр тутмын зурхай';

  @override
  String get drawerBuyQuestions => 'Худалдан авах асуултууд';

  @override
  String get drawerAstroDictionary => 'Astro толь бичиг';

  @override
  String get drawerSettings => 'Тохиргоо';

  @override
  String get drawerCustomerSupport => 'Хэрэглэгчийн дэмжлэг';

  @override
  String get drawerAbout => 'тухай';

  @override
  String get drawerProfileSettings => 'Профайлын тохиргоо';

  @override
  String get demoNotificationTitle => '🔔 Демо мэдэгдэл';

  @override
  String get demoNotificationBody =>
      'Энэ бол таны апп-аас ирсэн туршилтын мэдэгдэл юм!';

  @override
  String get notificationsTitle => 'Мэдэгдэл';

  @override
  String get noNotifications => 'Мэдэгдэл алга';

  @override
  String get allTab => 'Бүгд';

  @override
  String get markAllAsRead => 'Бүгдийг уншсан гэж тэмдэглэ';

  @override
  String get notificationMarkedRead => 'Мэдэгдэл уншсан гэж тэмдэглэгдсэн';

  @override
  String get failedToLoadNotifications => 'Мэдэгдлийг ачаалж чадсангүй';

  @override
  String get failedToMarkRead => 'Уншсан гэж тэмдэглэж чадсангүй';

  @override
  String get failedToMarkAllRead => 'Бүгдийг уншсан гэж тэмдэглэж чадсангүй';

  @override
  String get socketConnected => 'Сокет холбогдсон';

  @override
  String get socketDisconnected => 'Сокет салгагдсан';

  @override
  String get newNotificationReceived => 'Шинэ мэдэгдэл хүлээн авлаа';

  @override
  String get generalCategory => 'Генерал';

  @override
  String get horoscopeCategory => 'Зурхай';

  @override
  String get chatCategory => 'Чатлах';

  @override
  String get systemCategory => 'Систем';

  @override
  String get updateCategory => 'Шинэчлэлтүүд';

  @override
  String get howToAskTitle => 'Хэрхэн асуух вэ';

  @override
  String get noQuestionsAvailable => 'Асуулт байхгүй';

  @override
  String get failedToLoadQuestions => 'Асуултуудыг ачаалж чадсангүй';

  @override
  String get pullToRefresh => 'Дахин сэргээхийн тулд татна уу';

  @override
  String get careerCategory => 'Карьер';

  @override
  String get loveCategory => 'Хайр ба харилцаа';

  @override
  String get healthCategory => 'Эрүүл мэнд';

  @override
  String get financeCategory => 'Санхүү';

  @override
  String get familyCategory => 'Гэр бүл';

  @override
  String get educationCategory => 'Боловсрол';

  @override
  String get travelCategory => 'Аялал';

  @override
  String get spiritualCategory => 'Сүнслэг';

  @override
  String get profileLoaded => 'Профайлыг амжилттай ачааллаа';

  @override
  String get imageUploaded => 'Зургийг амжилттай байршууллаа';

  @override
  String get savedInformationConfirmation => 'Би энэ мэдээллийг хадгалсан';

  @override
  String get noHistoryAvailable => 'Түүх боломжгүй';

  @override
  String get missingUserIdError => 'Хэрэглэгчийн ID шаардлагатай';

  @override
  String get networkError => 'Сүлжээний алдаа. Дахин оролдоно уу.';

  @override
  String get timeoutError => 'Хүсэлтийн хугацаа хэтэрсэн';

  @override
  String get genericError => 'Ямар нэг алдаа гарлаа';

  @override
  String get reactionUpdateError => 'Хариултыг шинэчилж чадсангүй';

  @override
  String get noSearchResults => 'Хайлтын илэрц олдсонгүй';

  @override
  String get clearSearch => 'Хайлтыг арилгах';

  @override
  String get resultsFound => 'Үр дүн олдсон';

  @override
  String get recoverySecretHint =>
      'Хуулж буулгах нь ажиллахгүй байж магадгүй, гараар бичнэ үү';

  @override
  String get recoverAccountDescription =>
      'Бүртгэлээ сэргээхийн тулд эдгээр алхмуудыг дагана уу';

  @override
  String get processingLabel => 'Боловсруулж байна...';

  @override
  String get clearChatSuccess => 'Чатыг амжилттай арилгалаа';

  @override
  String get notificationsEnabled => 'Мэдэгдэл идэвхжсэн';

  @override
  String get notificationsDisabled => 'Мэдэгдлийг идэвхгүй болгосон';

  @override
  String get securityNotice => 'Таны өгөгдлийг аюулгүйгээр шифрлэж, хадгална';

  @override
  String get loading => 'Ачааж байна...';

  @override
  String get selectLanguage => 'Хэл сонгоно уу';

  @override
  String get onboardingGetStartedDesc => 'Хэлээ сонгоод эхэл';

  @override
  String get accountRecoveryTitle => '🔐 Бүртгэл сэргээх дэлгэрэнгүй мэдээлэл';

  @override
  String get recoveryInstructions =>
      'Энэ мэдээллийг найдвартай хадгална уу. Бүртгэлээ сэргээхийн тулд танд хэрэгтэй болно.';

  @override
  String get importantNotice => '⚠️ Чухал:';

  @override
  String get astrologerProfileTitle => 'Зурхайчийн танилцуулга';

  @override
  String get personalAstrologer => 'Хувийн зурхайч';

  @override
  String get makePersonalAstrologer => 'Хувийн зурхайч болго';

  @override
  String get favoriteDescription =>
      'Таны асуултууд энэ зурхайчд нэн тэргүүнд тавигдах болно. Хэрэв боломжгүй бол өөр мэргэшсэн зурхайч танд туслах болно.';

  @override
  String get educationQualifications => 'Боловсрол ба мэргэшил';

  @override
  String get aboutSection => 'тухай';

  @override
  String get shareProfile => 'Профайл хуваалцах';

  @override
  String get loadingAstrologer =>
      'Зурхайчийн дэлгэрэнгүй мэдээллийг ачаалж байна...';

  @override
  String get failedToLoadAstrologer =>
      'Зурхайчийн дэлгэрэнгүй мэдээллийг ачаалж чадсангүй';

  @override
  String get authenticationRequired =>
      'Баталгаажуулалт шаардлагатай. Та нэвтэрнэ үү.';

  @override
  String securityCheckFailed(Object error) {
    return 'Аюулгүй байдлын шалгалт амжилтгүй боллоо: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name одоо таны хувийн зурхайч боллоо';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name-г дуртай зүйлсээс хассан';
  }

  @override
  String get toggleFavoriteError => 'Дуртай статусаа шинэчилж чадсангүй';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Боловсрол: $education\n📜 Мэргэшсэн байдал: $qualification\n⏳ Туршлага: $experience';
  }

  @override
  String get notProvided => 'Өгөгдөөгүй';

  @override
  String reviews(Object count) {
    return '($count шүүмж)';
  }

  @override
  String get specialties => 'Мэргэжил';

  @override
  String get experience => 'Туршлага';

  @override
  String get qualification => 'Мэргэшсэн байдал';

  @override
  String get education => 'Боловсрол';

  @override
  String get recoveryTips =>
      '• Энэ мэдээллийн дэлгэцийн агшинг авна уу\n• Аюулгүй газар хадгална\n• Хэнтэй ч бүү хуваалц\n• Үүнийг зөвхөн нэг удаа харуулах болно';

  @override
  String get themeSettingsTitle => 'Сэдвийн тохиргоо';

  @override
  String get lightThemeLabel => 'Гэрэл';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Харанхуй';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Систем';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
