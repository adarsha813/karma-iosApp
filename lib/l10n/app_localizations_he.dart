// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get notificationSettings => 'הגדרות התראות';

  @override
  String get privacySettings => 'הגדרות פרטיות';

  @override
  String get accountSettings => 'הגדרות חשבון';

  @override
  String get languageSettings => 'הגדרות שפה';

  @override
  String get languageChanged => 'השפה השתנתה';

  @override
  String get existingUserButton => 'אני משתמש קיים';

  @override
  String get chooseCountryTitle => 'בחר מדינה';

  @override
  String get yesText => 'כֵּן';

  @override
  String get noText => 'לֹא';

  @override
  String get appBarTitle => 'הגדרות פרופיל';

  @override
  String get userIdLabel => 'מזהה משתמש *';

  @override
  String get nameLabel => 'שֵׁם';

  @override
  String get birthCountryLabel => 'ארץ לידה';

  @override
  String get birthCityLabel => 'עיר לידה';

  @override
  String get countrySelectionTitle => 'בחר את המדינה שלך';

  @override
  String get maleLabel => 'זָכָר';

  @override
  String get femaleLabel => 'נְקֵבָה';

  @override
  String get birthDateLabel => 'תאריך לידה';

  @override
  String get birthDatePlaceholder => 'בחר תאריך לידה';

  @override
  String get birthTimeLabel => 'זמן לידה';

  @override
  String get birthTimePlaceholder => 'בחר שעת לידה';

  @override
  String get saveProfileButton => 'שמור פרופיל';

  @override
  String get noCitiesFound => 'לא נמצאו ערים';

  @override
  String cityPlaceholder(Object country) {
    return 'הזן עיר ב-$country';
  }

  @override
  String get countryFirstPlaceholder => 'בחר תחילה מדינה';

  @override
  String get versionHistoryTitle => 'היסטוריית גרסאות';

  @override
  String get notSetText => 'לא מוגדר';

  @override
  String nameHistory(Object name) {
    return 'שם: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'עיר: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'מדינה: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'מין: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'תאריך לידה: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'שעת לידה: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'מיקום: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'שעון קיץ: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'מצב: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'עודכן בתאריך $date';
  }

  @override
  String get userIdRequired => 'נדרש מזהה משתמש';

  @override
  String get profileSaved => 'הפרופיל נשמר בהצלחה';

  @override
  String get saveFailed => 'שמירת הפרופיל נכשלה';

  @override
  String get errorPrefix => 'שְׁגִיאָה:';

  @override
  String get onboardingChooseLanguage => 'בחר את השפה שלך';

  @override
  String get onboardingChooseLanguageDesc =>
      'בחר את השפה המועדפת עליך כדי להמשיך.';

  @override
  String get onboardingWhatIsAstrology => 'מהי אסטרולוגיה?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'אסטרולוגיה היא חקר גופים שמימיים...';

  @override
  String get onboardingWhyUseApp => 'למה להשתמש באפליקציה הזו?';

  @override
  String get onboardingWhyUseAppDesc =>
      'קבלו הורוסקופים מותאמים אישית, תחזיות יומיות והכוונה לקבלת החלטות מושכלות.';

  @override
  String get onboardingHowToUse => 'איך להשתמש באפליקציה הזו?';

  @override
  String get onboardingHowToUseDesc =>
      'נווטו בקלות, בדקו הורוסקופים יומיים ונהלו את הפרופיל שלכם לקבלת תחזיות מדויקות.';

  @override
  String get onboardingGetStarted => 'התחל';

  @override
  String get onboardingNewUser => 'משתמש חדש';

  @override
  String get onboardingExistingUser => 'משתמש קיים';

  @override
  String get onboardingBack => 'בְּחֲזָרָה';

  @override
  String get onboardingNext => 'הַבָּא';

  @override
  String get userIdNotFound =>
      'מזהה המשתמש לא נמצא. אנא התחבר או הגדר את הפרופיל שלך.';

  @override
  String get clearNotificationsTitle => 'נקה התראות';

  @override
  String get clearNotificationsMessage =>
      'האם אתה בטוח שברצונך למחוק את כל ההתראות?';

  @override
  String get clearNotificationsSuccess => 'כל ההתראות נמחקו בהצלחה.';

  @override
  String get clearHoroscopeTitle => 'הורוסקופ ברור';

  @override
  String get clearHoroscopeMessage =>
      'האם אתה בטוח שברצונך למחוק את נתוני ההורוסקופ שלך?';

  @override
  String get clearHoroscopeSuccess => 'ההורוסקופ נוקה בהצלחה.';

  @override
  String get clearChatTitle => 'נקה היסטוריית צ\'אט';

  @override
  String get clearChatMessage =>
      'האם אתה בטוח שאתה רוצה למחוק את כל היסטוריית הצ\'אט שלך?';

  @override
  String get clearChatLocal => 'הצ\'אט נוקה באופן מקומי.';

  @override
  String get deleteAccountTitle => 'מחיקת חשבון';

  @override
  String get deleteAccountMessage =>
      'האם אתה בטוח שאתה רוצה למחוק את החשבון שלך? פעולה זו תמחק גם את כל היסטוריית הצ\'אט וההתראות שלך.';

  @override
  String get deleteAccountSuccess => 'החשבון שלך וכל הנתונים הוסרו.';

  @override
  String get deleteAccountError => 'שגיאה במחיקת חשבון';

  @override
  String get logoutTitle => 'התנתק';

  @override
  String get logoutMessage => 'האם אתה בטוח שאתה רוצה להתנתק?';

  @override
  String get termsPrivacyTitle => 'תנאים ופרטיות';

  @override
  String get privacyPolicyTitle => 'מדיניות פרטיות';

  @override
  String get termsConditionsTitle => 'תנאים והגבלות';

  @override
  String get dataControlTitle => 'בקרת נתונים';

  @override
  String get cancelButton => 'לְבַטֵל';

  @override
  String get confirmButton => 'לְאַשֵׁר';

  @override
  String get clearQuestionsSuccess => 'כל השאלות נמחקו בהצלחה.';

  @override
  String get yoginiLabel => 'יוגיני';

  @override
  String get lordLabel => 'אָדוֹן';

  @override
  String get startLabel => 'הַתחָלָה';

  @override
  String get recoverAccount => 'שחזור חשבון';

  @override
  String get endLabel => 'סוֹף';

  @override
  String get startDateLabel => 'תאריך התחלה';

  @override
  String get endDateLabel => 'תאריך סיום';

  @override
  String get notAvailable => 'לא זמין';

  @override
  String get noData => 'אין נתונים';

  @override
  String get unknownError => 'שגיאה לא ידועה';

  @override
  String get retryButton => 'נסה שוב';

  @override
  String get kundaliGeneratorTitle => 'מחולל קונדאלי';

  @override
  String get natalChartTitle => 'מפת לידה';

  @override
  String get lagnaLabel => 'לגנה';

  @override
  String get rashiLabel => 'רש\"י';

  @override
  String get ascDegreeLabel => 'דרגת עלייה';

  @override
  String get vimshottariDashaTitle => 'וימשוטארי דאשה';

  @override
  String get yoginiDashaTitle => 'יוגיני דאשה';

  @override
  String get unknown => 'לֹא יְדוּעַ';

  @override
  String get clearHoroscope => 'הורוסקופ ברור';

  @override
  String get clearNotifications => 'נקה התראות';

  @override
  String get clearChatHistory => 'נקה היסטוריית צ\'אט';

  @override
  String get logout => 'התנתק';

  @override
  String get deleteAccount => 'מחיקת חשבון';

  @override
  String get allFieldsRequired => 'כל השדות נדרשים.';

  @override
  String get accountRecoveredSuccess => 'החשבון שוחזר בהצלחה.';

  @override
  String get recoveryFailed => 'השחזור נכשל. בדוק את המידע שלך.';

  @override
  String get recoverySecretLabel => 'סוד ההחלמה:';

  @override
  String get aboutUsTitle => 'אודותינו';

  @override
  String get aboutOurCompany => 'אודות החברה שלנו';

  @override
  String get aboutCompanyDescription =>
      'אנו מחויבים לספק את חוויית האסטרולוגיה הטובה ביותר למשתמשים שלנו.';

  @override
  String get ourMission => 'המשימה שלנו';

  @override
  String get missionDescription =>
      'לספק תובנות אסטרולוגיות מדויקות ואישיות שיעזרו למשתמשים לקבל החלטות מושכלות בחייהם.';

  @override
  String get ourVision => 'החזון שלנו';

  @override
  String get visionDescription =>
      'להפוך לפלטפורמת האסטרולוגיה המהימנה ביותר, המשלבת טכנולוגיה וחוכמה עתיקה.';

  @override
  String get ourValues => 'הערכים שלנו';

  @override
  String get valuesDescription =>
      'יושרה, דיוק, עיצוב ממוקד משתמש וחדשנות מתמשכת.';

  @override
  String get contactUs => 'צרו קשר';

  @override
  String get contactEmail => 'דוא\"ל: support@yourcompany.com';

  @override
  String get contactWebsite => 'אתר אינטרנט: www.yourcompany.com';

  @override
  String get customerSupport => 'תמיכת לקוחות';

  @override
  String get supportHeroTitle => 'אנחנו כאן כדי לעזור';

  @override
  String get supportHeroDescription =>
      'מלאו את הטופס למטה וצוות התמיכה שלנו יחזור אליכם בהקדם האפשרי.';

  @override
  String get yourName => 'השם שלך';

  @override
  String get yourEmail => 'האימייל שלך';

  @override
  String get message => 'הוֹדָעָה';

  @override
  String get enterEmail => 'הזן את כתובת הדוא\"ל שלך';

  @override
  String get enterValidEmail => 'הזן כתובת דוא\"ל חוקית';

  @override
  String enterField(Object fieldName) {
    return 'הזן $fieldName';
  }

  @override
  String get send => 'לִשְׁלוֹחַ';

  @override
  String get sending => 'שְׁלִיחָה...';

  @override
  String get emailSentSuccess => '✅ המייל נשלח בהצלחה!';

  @override
  String get emailSendFailed => '❌ שליחת הדוא\"ל נכשלה';

  @override
  String get astroDictionaryTitle => 'מילון אסטרו';

  @override
  String get searchTermsHint => 'מונחי חיפוש...';

  @override
  String get noTermsFound => 'לא נמצאו מונחים';

  @override
  String get buyQuestionsTitle => 'שאלות קנייה';

  @override
  String get userNotAuthenticated => 'המשתמש לא אומת';

  @override
  String get loadStoreDataFailed => 'טעינת נתוני החנות נכשלה';

  @override
  String get missingAuthToken => 'אסימון אימות חסר';

  @override
  String get merchantDisplayName => 'אפליקציית אסטרו צ\'אט';

  @override
  String get paymentSuccessful => '✅ התשלום הצליח! השאלה נשלחה';

  @override
  String paymentFailed(Object error) {
    return '❌ התשלום נכשל: $error';
  }

  @override
  String get yourBalance => 'היתרה שלך';

  @override
  String questionsBalance(Object count) {
    return 'שאלות $count';
  }

  @override
  String get availableOffers => 'הצעות זמינות';

  @override
  String questionsCount(Object count) {
    return 'שאלה $count';
  }

  @override
  String get buyButton => 'לִקְנוֹת';

  @override
  String get dailyHoroscopeTitle => '🌟 הורוסקופ יומי';

  @override
  String get userIdMissing => 'חסר מזהה משתמש';

  @override
  String get fetchHoroscopesFailed => 'נכשלה שליפת ההורוסקופים';

  @override
  String get noHoroscopeFound => 'לא נמצא הורוסקופ.';

  @override
  String get signLabel => 'סִימָן';

  @override
  String get todayLabel => 'הַיוֹם';

  @override
  String get yesterdayLabel => 'אֶתמוֹל';

  @override
  String get thisWeekLabel => 'השבוע';

  @override
  String get lastMonthLabel => 'החודש שעבר';

  @override
  String get chatTitle => 'לְשׂוֹחֵחַ';

  @override
  String get typeYourQuestionHint => 'הקלד את השאלה שלך...';

  @override
  String get paymentRequired => 'נדרש תשלום';

  @override
  String get paymentRequiredMessage =>
      'ניצלת את השאלות החינמיות שלך. שלם ₹50 כדי להמשיך.';

  @override
  String get payNowButton => 'שלם עכשיו';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'נותרו $count שאלות פנויות';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'נותרו $count שאלות בתשלום';
  }

  @override
  String get thankYouFeedback => 'תודה על המשוב שלך!';

  @override
  String get ratingSubmitted => 'דירוג נשלח!';

  @override
  String get setUserIdFirst => 'אנא הגדר תחילה את מזהה המשתמש שלך';

  @override
  String get failedToFetchPrevious => 'נכשלה אחזור השאלות והתשובות הקודמות';

  @override
  String errorOccurred(Object error) {
    return 'שגיאה: $error';
  }

  @override
  String get drawerAstroProfile => 'פרופיל אסטרו';

  @override
  String get drawerDailyHoroscope => 'הורוסקופ יומי';

  @override
  String get drawerBuyQuestions => 'שאלות קנייה';

  @override
  String get drawerAstroDictionary => 'מילון אסטרו';

  @override
  String get drawerSettings => 'הגדרות';

  @override
  String get drawerCustomerSupport => 'תמיכת לקוחות';

  @override
  String get drawerAbout => 'אוֹדוֹת';

  @override
  String get drawerProfileSettings => 'הגדרות פרופיל';

  @override
  String get demoNotificationTitle => '🔔 הודעת הדגמה';

  @override
  String get demoNotificationBody => 'זוהי הודעת ניסיון מהאפליקציה שלך!';

  @override
  String get notificationsTitle => 'התראות';

  @override
  String get noNotifications => 'אין התראות';

  @override
  String get allTab => 'כֹּל';

  @override
  String get markAllAsRead => 'סמן הכל כנקרא';

  @override
  String get notificationMarkedRead => 'התראה סומנה כנקראה';

  @override
  String get failedToLoadNotifications => 'טעינת ההתראות נכשלה';

  @override
  String get failedToMarkRead => 'נכשל הסימון כנקרא';

  @override
  String get failedToMarkAllRead => 'נכשל בסימון הכל כנקרא';

  @override
  String get socketConnected => 'שקע מחובר';

  @override
  String get socketDisconnected => 'שקע מנותק';

  @override
  String get newNotificationReceived => 'התקבלה הודעה חדשה';

  @override
  String get generalCategory => 'כְּלָלִי';

  @override
  String get horoscopeCategory => 'הוֹרוֹסקוֹפּ';

  @override
  String get chatCategory => 'לְשׂוֹחֵחַ';

  @override
  String get systemCategory => 'מַעֲרֶכֶת';

  @override
  String get updateCategory => 'עדכונים';

  @override
  String get howToAskTitle => 'איך לשאול';

  @override
  String get noQuestionsAvailable => 'אין שאלות זמינות';

  @override
  String get failedToLoadQuestions => 'טעינת השאלות נכשלה';

  @override
  String get pullToRefresh => 'משוך כדי לרענן';

  @override
  String get careerCategory => 'קריירה';

  @override
  String get loveCategory => 'אהבה ומערכות יחסים';

  @override
  String get healthCategory => 'בְּרִיאוּת';

  @override
  String get financeCategory => 'לְמַמֵן';

  @override
  String get familyCategory => 'מִשׁפָּחָה';

  @override
  String get educationCategory => 'הַשׂכָּלָה';

  @override
  String get travelCategory => 'לִנְסוֹעַ';

  @override
  String get spiritualCategory => 'רוּחָנִי';

  @override
  String get profileLoaded => 'הפרופיל נטען בהצלחה';

  @override
  String get imageUploaded => 'התמונה הועלתה בהצלחה';

  @override
  String get savedInformationConfirmation => 'שמרתי את המידע הזה';

  @override
  String get noHistoryAvailable => 'אין היסטוריה זמינה';

  @override
  String get missingUserIdError => 'נדרש מזהה משתמש';

  @override
  String get networkError => 'שגיאת רשת. אנא נסה שוב.';

  @override
  String get timeoutError => 'תם הזמן שהוקצב לבקשה';

  @override
  String get genericError => 'משהו השתבש';

  @override
  String get reactionUpdateError => 'עדכון התגובה נכשל';

  @override
  String get noSearchResults => 'לא נמצאו תוצאות חיפוש';

  @override
  String get clearSearch => 'נקה חיפוש';

  @override
  String get resultsFound => 'תוצאות שנמצאו';

  @override
  String get recoverySecretHint => 'העתקה והדבקה אולי לא יעבדו, הקלד ידנית';

  @override
  String get recoverAccountDescription =>
      'בצע את השלבים הבאים כדי לשחזר את חשבונך';

  @override
  String get processingLabel => 'עיבוד...';

  @override
  String get clearChatSuccess => 'הצ\'אט נוקה בהצלחה';

  @override
  String get notificationsEnabled => 'התראות מופעלות';

  @override
  String get notificationsDisabled => 'התראות מושבתות';

  @override
  String get securityNotice => 'הנתונים שלך מוצפנים ומאוחסנים בצורה מאובטחת';

  @override
  String get loading => 'טְעִינָה...';

  @override
  String get selectLanguage => 'בחר שפה';

  @override
  String get onboardingGetStartedDesc => 'התחל על ידי בחירת השפה שלך';

  @override
  String get accountRecoveryTitle => '🔐 פרטי שחזור חשבון';

  @override
  String get recoveryInstructions =>
      'אנא שמור מידע זה בצורה מאובטחת. תזדקק לו כדי לשחזר את חשבונך.';

  @override
  String get importantNotice => '⚠️ חשוב:';

  @override
  String get astrologerProfileTitle => 'פרופיל אסטרולוג';

  @override
  String get personalAstrologer => 'אסטרולוג אישי';

  @override
  String get makePersonalAstrologer => 'להפוך לאסטרולוג אישי';

  @override
  String get favoriteDescription =>
      'שאלותיך יקבלו עדיפות לאסטרולוג זה. אם לא זמין, אסטרולוג מוסמך אחר יסייע לך.';

  @override
  String get educationQualifications => 'השכלה וכישורים';

  @override
  String get aboutSection => 'אוֹדוֹת';

  @override
  String get shareProfile => 'שתף פרופיל';

  @override
  String get loadingAstrologer => 'טוען פרטי אסטרולוג...';

  @override
  String get failedToLoadAstrologer => 'טעינת פרטי האסטרולוג נכשלה';

  @override
  String get authenticationRequired => 'נדרש אימות. אנא התחבר.';

  @override
  String securityCheckFailed(Object error) {
    return 'בדיקת אבטחה נכשלה: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name הוא עכשיו האסטרולוג האישי שלך';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name הוסר מהמועדפים';
  }

  @override
  String get toggleFavoriteError => 'נכשל עדכון סטטוס המועדף';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 השכלה: $education\n📜 הסמכה: $qualification\n⏳ ניסיון: $experience';
  }

  @override
  String get notProvided => 'לא סופק';

  @override
  String reviews(Object count) {
    return '($count ביקורות)';
  }

  @override
  String get specialties => 'התמחויות';

  @override
  String get experience => 'הִתנַסוּת';

  @override
  String get qualification => 'הַכשָׁרָה';

  @override
  String get education => 'הַשׂכָּלָה';

  @override
  String get recoveryTips =>
      '• צלם צילום מסך של מידע זה\n• אחסן אותו במקום מאובטח\n• אל תשתף עם אף אחד\n• זה יוצג פעם אחת בלבד';
}
