// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yiddish (`yi`).
class AppLocalizationsYi extends AppLocalizations {
  AppLocalizationsYi([String locale = 'yi']) : super(locale);

  @override
  String get settingsTitle => 'סעטטינגס';

  @override
  String get notificationSettings => 'מעלדונג סעטטינגס';

  @override
  String get privacySettings => 'פּריוואַטקייט סעטטינגס';

  @override
  String get accountSettings => 'קאנטע סעטינגס';

  @override
  String get languageSettings => 'שפּראַך סעטטינגס';

  @override
  String get languageChanged => 'שפּראַך געביטן';

  @override
  String get existingUserButton => 'איך בין אַן עקזיסטירנדיקער באַניצער';

  @override
  String get chooseCountryTitle => 'אויסקלייבן לאַנד';

  @override
  String get yesText => 'יא';

  @override
  String get noText => 'ניין';

  @override
  String get appBarTitle => 'פּראָפיל סעטטינגס';

  @override
  String get userIdLabel => 'באַניצער אידענטיטעט *';

  @override
  String get nameLabel => 'נאָמען';

  @override
  String get birthCountryLabel => 'געבורטסלאַנד';

  @override
  String get birthCityLabel => 'געבורטשטאט';

  @override
  String get countrySelectionTitle => 'קלייַבט אויס דיין לאַנד';

  @override
  String get maleLabel => 'זכר';

  @override
  String get femaleLabel => 'ווייַבלעך';

  @override
  String get birthDateLabel => 'געבורטסדאַטום';

  @override
  String get birthDatePlaceholder => 'אויסקלייבן געבורטסדאטום';

  @override
  String get birthTimeLabel => 'געבורט צייט';

  @override
  String get birthTimePlaceholder => 'אויסקלייבן געבורטס צייט';

  @override
  String get saveProfileButton => 'ראַטעווען פּראָפיל';

  @override
  String get noCitiesFound => 'קיין שטעט נישט געפונען';

  @override
  String cityPlaceholder(Object country) {
    return 'אַרייַן שטאָט אין $country';
  }

  @override
  String get countryFirstPlaceholder => 'אויסקלייבן לאַנד ערשט';

  @override
  String get versionHistoryTitle => 'ווערסיע געשיכטע';

  @override
  String get notSetText => 'נישט באַשטעטיקט';

  @override
  String nameHistory(Object name) {
    return 'נאמען: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'שטאָט: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'לאַנד: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'געשלעכט: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'געבורטסדאַטום: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'געבורט צייט: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'לאקאציע: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'צייט זאנע: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'שטאַט: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'דערהייַנטיקט אויף $date';
  }

  @override
  String get userIdRequired => 'באַניצער אידענטיטעט איז פארלאנגט';

  @override
  String get profileSaved => 'פּראָפֿיל געראָטן';

  @override
  String get saveFailed => 'נישט געקענט ראַטעווען פּראָפֿיל';

  @override
  String get errorPrefix => 'טעות:';

  @override
  String get onboardingChooseLanguage => 'קלייבט אייער שפּראַך';

  @override
  String get onboardingChooseLanguageDesc =>
      'אויסקלייבן אייער בילכער שפּראַך צו פאָרזעצן.';

  @override
  String get onboardingWhatIsAstrology => 'וואָס איז אַסטראָלאָגיע?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'אַסטראָלאָגיע איז די שטודיע פון הימלישע קערפּערס...';

  @override
  String get onboardingWhyUseApp => 'פארוואס ניצן די דאזיגע אפליקאציע?';

  @override
  String get onboardingWhyUseAppDesc =>
      'באַקומען פערזענליכע האָראָסקאָפּן, טעגלעכע פאָרויסזאָגן און גיידאַנס צו מאַכן אינפאָרמירטע דיסיזשאַנז.';

  @override
  String get onboardingHowToUse => 'ווי אזוי צו ניצן די דאזיגע אפליקאציע?';

  @override
  String get onboardingHowToUseDesc =>
      'נאַוויגירן לייכט, קאָנטראָלירן טעגלעכע האָראָסקאָפּן, און פירן דיין פּראָפיל פֿאַר פּינקטלעכע פאָרויסזאָגן.';

  @override
  String get onboardingGetStarted => 'אָנהייבן';

  @override
  String get onboardingNewUser => 'נייַער באַניצער';

  @override
  String get onboardingExistingUser => 'עקזיסטירנדיקער באַניצער';

  @override
  String get onboardingBack => 'צוריק';

  @override
  String get onboardingNext => 'ווייטער';

  @override
  String get userIdNotFound =>
      'באַניצער אידענטיטעט נישט געפֿונען. ביטע לאָגין אָדער שטעלן דיין פּראָפֿיל.';

  @override
  String get clearNotificationsTitle => 'קלאָרע נאָוטאַפאַקיישאַנז';

  @override
  String get clearNotificationsMessage =>
      'ביסטו זיכער אז דו ווילסט אויסמעקן אלע נאטיפיקאציעס?';

  @override
  String get clearNotificationsSuccess =>
      'אַלע נאָטיפיקאַציעס זענען געראָטן אויסגעמעקט.';

  @override
  String get clearHoroscopeTitle => 'קלאָרער האָראָסקאָפּ';

  @override
  String get clearHoroscopeMessage =>
      'ביסטו זיכער אז דו ווילסט אויסמעקן דיינע האָראָסקאָפּ דאַטן?';

  @override
  String get clearHoroscopeSuccess => 'האָראָסקאָפּ איז געראָטן אויסגעמעקט.';

  @override
  String get clearChatTitle => 'ויסמעקן שמועס געשיכטע';

  @override
  String get clearChatMessage =>
      'ביסטו זיכער אז דו ווילסט אויסמעקן דיין גאנצע שמועס געשיכטע?';

  @override
  String get clearChatLocal => 'טשאַט איז לאָקאַל אויסגעמעקט געוואָרן.';

  @override
  String get deleteAccountTitle => 'אויסמעקן אקאונט';

  @override
  String get deleteAccountMessage =>
      'ביסטו זיכער אז דו ווילסט אויסמעקן דיין אקאונט? דאס וועט אויך אויסמעקן דיין גאנצע שמועס געשיכטע און נאטיפיקאציעס.';

  @override
  String get deleteAccountSuccess =>
      'אייער אקאונט און אלע דאטן זענען אַוועקגענומען געוואָרן.';

  @override
  String get deleteAccountError => 'טעות אויסמעקן אקאונט';

  @override
  String get logoutTitle => 'אויסלאָגירן';

  @override
  String get logoutMessage => 'ביסטו זיכער אז דו ווילסט זיך אויסלאָגירן?';

  @override
  String get termsPrivacyTitle => 'תּנאים און פּריוואַטקייט';

  @override
  String get privacyPolicyTitle => 'פּריוואַטקייט פּאָליטיק';

  @override
  String get termsConditionsTitle => 'תּנאים און באַדינגונגען';

  @override
  String get dataControlTitle => 'דאַטן קאָנטראָל';

  @override
  String get cancelButton => 'אָפּרופן';

  @override
  String get confirmButton => 'באַשטעטיקן';

  @override
  String get clearQuestionsSuccess => 'אַלע פֿראַגעס זענען געראָטן אויסגעמעקט.';

  @override
  String get yoginiLabel => 'יאָגיני';

  @override
  String get lordLabel => 'האר';

  @override
  String get startLabel => 'אָנהייבן';

  @override
  String get recoverAccount => 'צוריקקריגן אקאונט';

  @override
  String get endLabel => 'ענדע';

  @override
  String get startDateLabel => 'אָנהייב דאַטע';

  @override
  String get endDateLabel => 'ענדע דאַטע';

  @override
  String get notAvailable => 'נישט פֿאַראַן';

  @override
  String get noData => 'קיין דאַטן נישט';

  @override
  String get unknownError => 'אומבאַקאַנטער טעות';

  @override
  String get retryButton => 'פרובירן נאכאמאל';

  @override
  String get kundaliGeneratorTitle => 'קונדאַלי גענעראַטאָר';

  @override
  String get natalChartTitle => 'געבורט טשאַרט';

  @override
  String get lagnaLabel => 'לאַגנאַ';

  @override
  String get rashiLabel => 'רש\"י';

  @override
  String get ascDegreeLabel => 'אַסצענדאַנט גראַד';

  @override
  String get vimshottariDashaTitle => 'ווימשאָטאַרי דאַשאַ';

  @override
  String get yoginiDashaTitle => 'יאָגיני דאַשאַ';

  @override
  String get unknown => 'אומבאַקאַנט';

  @override
  String get clearHoroscope => 'קלאָרער האָראָסקאָפּ';

  @override
  String get clearNotifications => 'קלאָרע נאָוטאַפאַקיישאַנז';

  @override
  String get clearChatHistory => 'ויסמעקן שמועס געשיכטע';

  @override
  String get logout => 'אויסלאָגירן';

  @override
  String get deleteAccount => 'אויסמעקן אקאונט';

  @override
  String get allFieldsRequired => 'אַלע פעלדער זענען פארלאנגט.';

  @override
  String get accountRecoveredSuccess =>
      'קאנטע איז ערפאלגרייך צוריקגעכאפט געווארן.';

  @override
  String get recoveryFailed =>
      'די רעקאָווערי איז דורכגעפאַלן. קאָנטראָלירט אייער אינפֿאָרמאַציע.';

  @override
  String get recoverySecretLabel => 'סוד פון רעקאָווערי:';

  @override
  String get aboutUsTitle => 'וועגן אונדז';

  @override
  String get aboutOurCompany => 'וועגן אונדזער פירמע';

  @override
  String get aboutCompanyDescription =>
      'מיר זענען מחויב צו צושטעלן די בעסטע אַסטראָלאָגיע דערפאַרונג צו אונדזערע באַניצער.';

  @override
  String get ourMission => 'אונדזער מיסיע';

  @override
  String get missionDescription =>
      'צו צושטעלן גענויע און פערזענליכע אַסטראָלאָגיע איינזיכטן צו העלפֿן ניצערס מאַכן אינפאָרמירטע דיסיזשאַנז אין זייער לעבן.';

  @override
  String get ourVision => 'אונדזער זעאונג';

  @override
  String get visionDescription =>
      'צו ווערן די מערסט פארטרויענסווערדיגע אַסטראָלאָגיע פּלאַטפאָרמע, וואָס קאָמבינירט טעכנאָלאָגיע און אלטע חכמה.';

  @override
  String get ourValues => 'אונדזערע ווערטן';

  @override
  String get valuesDescription =>
      'אָרנטלעכקייט, אַקיעראַסי, באַניצער-צענטרירט פּלאַן, און קעסיידערדיקע כידעש.';

  @override
  String get contactUs => 'קאָנטאַקט אונדז';

  @override
  String get contactEmail => 'אימעיל: support@yourcompany.com';

  @override
  String get contactWebsite => 'וועבזייטל: www.yourcompany.com';

  @override
  String get customerSupport => 'קונה שטיצע';

  @override
  String get supportHeroTitle => 'מיר זענען דאָ צו העלפֿן';

  @override
  String get supportHeroDescription =>
      'פֿילט אויס דעם פֿאָרמולאַר אונטן און אונדזער שטיצע־מאַנשאַפֿט וועט זיך צוריקמעלדן צו אײַך אַזוי שנעל ווי מעגלעך.';

  @override
  String get yourName => 'דיין נאָמען';

  @override
  String get yourEmail => 'דיין אימעיל';

  @override
  String get message => 'מעסעדזש';

  @override
  String get enterEmail => 'אַרייַן דיין בליצפּאָסט';

  @override
  String get enterValidEmail => 'אַרייַן אַ גילטיקע בליצפּאָסט אַדרעס';

  @override
  String enterField(Object fieldName) {
    return 'אַרייַן $fieldName';
  }

  @override
  String get send => 'שיקן';

  @override
  String get sending => 'שיקן...';

  @override
  String get emailSentSuccess => '✅ אימעיל געשיקט מיט הצלחה!';

  @override
  String get emailSendFailed => '❌ נישט געקענט שיקן אימעיל';

  @override
  String get astroDictionaryTitle => 'אַסטראָ ווערטערבוך';

  @override
  String get searchTermsHint => 'זוכ-טערמינען...';

  @override
  String get noTermsFound => 'קיין טערמינען נישט געפונען';

  @override
  String get buyQuestionsTitle => 'קויפן פראגעס';

  @override
  String get userNotAuthenticated => 'באַניצער נישט אויטענטיפיצירט';

  @override
  String get loadStoreDataFailed => 'נישט געלונגען צו לאָדן קראָם דאַטן';

  @override
  String get missingAuthToken => 'פעלנדיקער אויטאָריזאַציע טאָקען';

  @override
  String get merchantDisplayName => 'אַסטראָ טשאַט אַפּ';

  @override
  String get paymentSuccessful => '✅ צאָלונג געראָטן! פֿראַגע געשיקט';

  @override
  String paymentFailed(Object error) {
    return '❌ צאָלונג איז דורכגעפֿאַלן: $error';
  }

  @override
  String get yourBalance => 'דיין באַלאַנס';

  @override
  String questionsBalance(Object count) {
    return '$count פראגעס';
  }

  @override
  String get availableOffers => 'פאַראַן אָפפערס';

  @override
  String questionsCount(Object count) {
    return '$count פראגע';
  }

  @override
  String get buyButton => 'קויפן';

  @override
  String get dailyHoroscopeTitle => '🌟 טעגלעכער האָראָסקאָפּ';

  @override
  String get userIdMissing => 'באַניצער אידענטיטעט פעלט';

  @override
  String get fetchHoroscopesFailed => 'נישט געקענט ברענגען האָראָסקאָפּן';

  @override
  String get noHoroscopeFound => 'קיין האָראָסקאָפּ נישט געפֿונען.';

  @override
  String get signLabel => 'צייכן';

  @override
  String get todayLabel => 'היינט';

  @override
  String get yesterdayLabel => 'נעכטן';

  @override
  String get thisWeekLabel => 'די וואָך';

  @override
  String get lastMonthLabel => 'לעצטן חודש';

  @override
  String get chatTitle => 'טשאַט';

  @override
  String get typeYourQuestionHint => 'שרייב דיין קשיא...';

  @override
  String get paymentRequired => 'צאָלונג פארלאנגט';

  @override
  String get paymentRequiredMessage =>
      'דו האסט שוין אויסגענוצט דיינע פרייע פראגעס. צאל ₹50 צו פאָרזעצן.';

  @override
  String get payNowButton => 'צאָלן איצט';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count פרייע פראגעס פארבליבן';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count באַצאָלטע פֿראַגעס פֿאַרבליבן';
  }

  @override
  String get thankYouFeedback => 'א דאנק פאר אייערע רעאקציעס!';

  @override
  String get ratingSubmitted => 'שאַצונג אַריינגעגעבן!';

  @override
  String get setUserIdFirst => 'ביטע שטעלן ערשט איין אייער באַניצער ID';

  @override
  String get failedToFetchPrevious =>
      'נישט געקענט צוריקברענגען פריערדיגע פראגעס און ענטפֿערס';

  @override
  String errorOccurred(Object error) {
    return 'טעות: $error';
  }

  @override
  String get drawerAstroProfile => 'אַסטראָ פּראָפיל';

  @override
  String get drawerDailyHoroscope => 'טעגלעכער האָראָסקאָפּ';

  @override
  String get drawerBuyQuestions => 'קויפן פראגעס';

  @override
  String get drawerAstroDictionary => 'אַסטראָ ווערטערבוך';

  @override
  String get drawerSettings => 'סעטטינגס';

  @override
  String get drawerCustomerSupport => 'קונה שטיצע';

  @override
  String get drawerAbout => 'וועגן';

  @override
  String get drawerProfileSettings => 'פּראָפיל סעטטינגס';

  @override
  String get demoNotificationTitle => '🔔 דעמאָ נאָטיפיקאַציע';

  @override
  String get demoNotificationBody =>
      'דאָס איז אַ טעסט נאָטיפיקאַציע פֿון דיין אַפּ!';

  @override
  String get notificationsTitle => 'נאָטיפיקאַציעס';

  @override
  String get noNotifications => 'קיין נאָוטאַפאַקיישאַנז';

  @override
  String get allTab => 'אַלע';

  @override
  String get markAllAsRead => 'מאַרקירן אַלץ ווי געלייענט';

  @override
  String get notificationMarkedRead => 'מעלדונג געמאַרקט ווי געלײענט';

  @override
  String get failedToLoadNotifications =>
      'נישט געלונגען צו לאָדן נאָוטאַפאַקיישאַנז';

  @override
  String get failedToMarkRead => 'נישט געקענט מאַרקירן ווי געלייענט';

  @override
  String get failedToMarkAllRead => 'נישט געקענט מאַרקירן אַלץ ווי געלייענט';

  @override
  String get socketConnected => 'סאָקעט פארבונדן';

  @override
  String get socketDisconnected => 'סאָקעט דיסקאַנעקטעד';

  @override
  String get newNotificationReceived => 'נייע מעלדונג באַקומען';

  @override
  String get generalCategory => 'אַלגעמיין';

  @override
  String get horoscopeCategory => 'האָראָסקאָפּ';

  @override
  String get chatCategory => 'טשאַט';

  @override
  String get systemCategory => 'סיסטעם';

  @override
  String get updateCategory => 'דערהייַנטיקונגען';

  @override
  String get howToAskTitle => 'ווי אזוי צו פרעגן';

  @override
  String get noQuestionsAvailable => 'קיין פראגעס נישט פאראן';

  @override
  String get failedToLoadQuestions => 'נישט געלונגען צו לאָדן פֿראַגעס';

  @override
  String get pullToRefresh => 'ציען צו דערפרישן';

  @override
  String get careerCategory => 'קאַריערע';

  @override
  String get loveCategory => 'ליבע און באַציִונגען';

  @override
  String get healthCategory => 'געזונט';

  @override
  String get financeCategory => 'פינאַנץ';

  @override
  String get familyCategory => 'משפּחה';

  @override
  String get educationCategory => 'בילדונג';

  @override
  String get travelCategory => 'רייזע';

  @override
  String get spiritualCategory => 'גייסטיק';

  @override
  String get profileLoaded => 'פּראָפיל געלאָדן געראָטן';

  @override
  String get imageUploaded => 'בילד איז געלונגען צו ארויפלייגן';

  @override
  String get savedInformationConfirmation =>
      'איך האָב די אינפֿאָרמאַציע געראַטעוועט';

  @override
  String get noHistoryAvailable => 'קיין געשיכטע נישט פֿאַראַן';

  @override
  String get missingUserIdError => 'באַניצער אידענטיטעט איז פארלאנגט';

  @override
  String get networkError => 'נעץ טעות. ביטע פרובירט נאכאמאל.';

  @override
  String get timeoutError => 'פארלאנג האט אויסגעלאפן די צייט';

  @override
  String get genericError => 'עפּעס איז שלעכט געגאַנגען';

  @override
  String get reactionUpdateError => 'נישט געקענט דערהייַנטיקן די רעאַקציע';

  @override
  String get noSearchResults => 'קיין זוכ רעזולטאַטן געפֿונען';

  @override
  String get clearSearch => 'אויסמעקן זוכן';

  @override
  String get resultsFound => 'רעזולטאַטן געפֿונען';

  @override
  String get recoverySecretHint =>
      'קאפירן-פייסטן וועט אפשר נישט ארבעטן, שרייבט אריין מיט די האנט';

  @override
  String get recoverAccountDescription =>
      'פֿאָלגט די סטעפּס צו צוריקקריגן אייער חשבון';

  @override
  String get processingLabel => 'פאַראַרבעטן...';

  @override
  String get clearChatSuccess => 'טשאַט געראָטן אויסגעמעקט';

  @override
  String get notificationsEnabled => 'נאטיפיקאציעס אקטיווירט';

  @override
  String get notificationsDisabled => 'נאטיפיקאציעס אויסגעלאשן';

  @override
  String get securityNotice => 'אייערע דאַטן זענען זיכער ענקריפּטעד און געהיט';

  @override
  String get loading => 'לאָודינג...';

  @override
  String get selectLanguage => 'אויסקלייבן שפּראַך';

  @override
  String get onboardingGetStartedDesc => 'הייבט אן דורך אויסקלויבן אייער שפראך';

  @override
  String get accountRecoveryTitle => '🔐 קאנטע רעקאָווערי דעטאלן';

  @override
  String get recoveryInstructions =>
      'ביטע ראַטעוועט די אינפֿאָרמאַציע זיכער. איר וועט עס דאַרפֿן צו צוריקקריגן אייער חשבון.';

  @override
  String get importantNotice => '⚠️ וויכטיג:';

  @override
  String get astrologerProfileTitle => 'אַסטראָלאָג פּראָפיל';

  @override
  String get personalAstrologer => 'פערזענלעכער אַסטראָלאָג';

  @override
  String get makePersonalAstrologer => 'מאַכט אַ פּערזענלעכער אַסטראָלאָג';

  @override
  String get favoriteDescription =>
      'אייערע פראגעס וועלן געגעבן ווערן פריאריטעט צו דעם אסטראלאג. אויב נישט פאראן, וועט אן אנדער קוואליפיצירטער אסטראלאג אייך העלפן.';

  @override
  String get educationQualifications => 'בילדונג און קוואַליפיקאַציעס';

  @override
  String get aboutSection => 'וועגן';

  @override
  String get shareProfile => 'טיילן פּראָפיל';

  @override
  String get loadingAstrologer => 'לאָודינג אַסטראָלאָג דעטאַילס...';

  @override
  String get failedToLoadAstrologer =>
      'נישט געלונגען צו לאָדן אַסטראָלאָג דעטאַלן';

  @override
  String get authenticationRequired =>
      'אויטענטיפֿיקאַציע פארלאנגט. ביטע לאָגין.';

  @override
  String securityCheckFailed(Object error) {
    return 'זיכערהייט קאָנטראָל איז דורכגעפֿאַלן: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name איז איצט אייער פערזענלעכער אסטראלאגער';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ אַוועקגענומען $name פֿון פֿאַוואָריטן';
  }

  @override
  String get toggleFavoriteError => 'נישט געקענט דערהייַנטיקן באַליבט סטאַטוס';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 בילדונג: $education\n📜 קוואַליפיקאַציע: $qualification\n⏳ דערפאַרונג: $experience';
  }

  @override
  String get notProvided => 'נישט צוגעשטעלט';

  @override
  String reviews(Object count) {
    return '($count באריכטן)';
  }

  @override
  String get specialties => 'ספּעציאַליטעטן';

  @override
  String get experience => 'דערפאַרונג';

  @override
  String get qualification => 'קוואַליפיקאַציע';

  @override
  String get education => 'בילדונג';

  @override
  String get recoveryTips =>
      '• נעמט א סקרינשאט פון די אינפארמאציע\n• לייגט עס אויף אין א זיכערן ארט\n• טיילט עס נישט מיט קיינעם\n• דאס וועט נאר ווערן געוויזן איין מאל';
}
