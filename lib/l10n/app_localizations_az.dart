// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get settingsTitle => 'Parametrlər';

  @override
  String get notificationSettings => 'Bildiriş Parametrləri';

  @override
  String get privacySettings => 'Məxfilik Parametrləri';

  @override
  String get accountSettings => 'Hesab Parametrləri';

  @override
  String get languageSettings => 'Dil Parametrləri';

  @override
  String get languageChanged => 'Dil dəyişdi';

  @override
  String get existingUserButton => 'Mən mövcud istifadəçiyəm';

  @override
  String get chooseCountryTitle => 'Ölkə seçin';

  @override
  String get yesText => 'Bəli';

  @override
  String get noText => 'yox';

  @override
  String get appBarTitle => 'Profil Parametrləri';

  @override
  String get userIdLabel => 'İstifadəçi ID *';

  @override
  String get nameLabel => 'ad';

  @override
  String get birthCountryLabel => 'Doğulduğu ölkə';

  @override
  String get birthCityLabel => 'Doğulduğu şəhər';

  @override
  String get countrySelectionTitle => 'Ölkənizi seçin';

  @override
  String get maleLabel => 'Kişi';

  @override
  String get femaleLabel => 'Qadın';

  @override
  String get birthDateLabel => 'Doğum tarixi';

  @override
  String get birthDatePlaceholder => 'Doğum tarixini seçin';

  @override
  String get birthTimeLabel => 'Doğum vaxtı';

  @override
  String get birthTimePlaceholder => 'Doğum vaxtını seçin';

  @override
  String get saveProfileButton => 'Profili yadda saxla';

  @override
  String get noCitiesFound => 'Heç bir şəhər tapılmadı';

  @override
  String cityPlaceholder(Object country) {
    return '$country-də şəhəri daxil edin';
  }

  @override
  String get countryFirstPlaceholder => 'Əvvəlcə ölkəni seçin';

  @override
  String get versionHistoryTitle => 'Versiya Tarixçəsi';

  @override
  String get notSetText => 'Qurulmayıb';

  @override
  String nameHistory(Object name) {
    return 'Ad: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Şəhər: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ölkə: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Cins: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Doğum Tarixi: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Doğum vaxtı: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Məkan: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Saat qurşağı: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Ştat: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date tarixində güncəllənib';
  }

  @override
  String get userIdRequired => 'İstifadəçi ID tələb olunur';

  @override
  String get profileSaved => 'Profil uğurla yadda saxlanıldı';

  @override
  String get saveFailed => 'Profili saxlamaq alınmadı';

  @override
  String get errorPrefix => 'Xəta:';

  @override
  String get onboardingChooseLanguage => 'Dilinizi seçin';

  @override
  String get onboardingChooseLanguageDesc =>
      'Davam etmək üçün istədiyiniz dili seçin.';

  @override
  String get onboardingWhatIsAstrology => 'Astrologiya nədir?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologiya göy cisimlərini öyrənir...';

  @override
  String get onboardingWhyUseApp => 'Niyə bu proqramdan istifadə edin?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Məlumatlı qərarlar qəbul etmək üçün fərdi ulduz falı, gündəlik proqnozlar və təlimatlar əldə edin.';

  @override
  String get onboardingHowToUse => 'Bu proqramdan necə istifadə etməli?';

  @override
  String get onboardingHowToUseDesc =>
      'Asanlıqla naviqasiya edin, gündəlik bürcləri yoxlayın və dəqiq proqnozlar üçün profilinizi idarə edin.';

  @override
  String get onboardingGetStarted => 'Başlayın';

  @override
  String get onboardingNewUser => 'Yeni İstifadəçi';

  @override
  String get onboardingExistingUser => 'Mövcud İstifadəçi';

  @override
  String get onboardingBack => 'Geri';

  @override
  String get onboardingNext => 'Sonrakı';

  @override
  String get userIdNotFound =>
      'İstifadəçi ID-si tapılmadı. Zəhmət olmasa daxil olun və ya profilinizi təyin edin.';

  @override
  String get clearNotificationsTitle => 'Bildirişləri silin';

  @override
  String get clearNotificationsMessage =>
      'Bütün bildirişləri silmək istədiyinizə əminsiniz?';

  @override
  String get clearNotificationsSuccess => 'Bütün bildirişlər uğurla silindi.';

  @override
  String get clearHoroscopeTitle => 'Təmiz Bürclər';

  @override
  String get clearHoroscopeMessage =>
      'Bürc məlumatlarınızı təmizləmək istədiyinizə əminsiniz?';

  @override
  String get clearHoroscopeSuccess => 'Bürclər müvəffəqiyyətlə təmizləndi.';

  @override
  String get clearChatTitle => 'Söhbət Tarixçəsini Sil';

  @override
  String get clearChatMessage =>
      'Bütün söhbət tarixçənizi silmək istədiyinizə əminsiniz?';

  @override
  String get clearChatLocal => 'Söhbət yerli olaraq silindi.';

  @override
  String get deleteAccountTitle => 'Hesabı Sil';

  @override
  String get deleteAccountMessage =>
      'Hesabınızı silmək istədiyinizə əminsiniz? Bu, həmçinin bütün söhbət tarixçənizi və bildirişlərinizi siləcək.';

  @override
  String get deleteAccountSuccess =>
      'Hesabınız və bütün məlumatlarınız silindi.';

  @override
  String get deleteAccountError => 'Hesabı silərkən xəta baş verdi';

  @override
  String get logoutTitle => 'Çıxın';

  @override
  String get logoutMessage => 'Çıxmaq istədiyinizə əminsiniz?';

  @override
  String get termsPrivacyTitle => 'Şərtlər və Məxfilik';

  @override
  String get privacyPolicyTitle => 'Məxfilik Siyasəti';

  @override
  String get termsConditionsTitle => 'Qaydalar və Şərtlər';

  @override
  String get dataControlTitle => 'Məlumata Nəzarət';

  @override
  String get cancelButton => 'Ləğv et';

  @override
  String get confirmButton => 'Təsdiq edin';

  @override
  String get clearQuestionsSuccess => 'Bütün suallar uğurla silindi.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Rəbbim';

  @override
  String get startLabel => 'Başlayın';

  @override
  String get recoverAccount => 'Hesabı bərpa edin';

  @override
  String get endLabel => 'Son';

  @override
  String get startDateLabel => 'Başlama tarixi';

  @override
  String get endDateLabel => 'Bitmə tarixi';

  @override
  String get notAvailable => 'Əlçatan deyil';

  @override
  String get noData => 'Məlumat yoxdur';

  @override
  String get unknownError => 'Naməlum xəta';

  @override
  String get retryButton => 'Yenidən cəhd edin';

  @override
  String get kundaliGeneratorTitle => 'Kundali Generator';

  @override
  String get natalChartTitle => 'Doğum qrafiki';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rəşi';

  @override
  String get ascDegreeLabel => 'Yüksəlmə dərəcəsi';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Naməlum';

  @override
  String get clearHoroscope => 'Təmiz Bürclər';

  @override
  String get clearNotifications => 'Bildirişləri silin';

  @override
  String get clearChatHistory => 'Söhbət Tarixçəsini Sil';

  @override
  String get logout => 'Çıxın';

  @override
  String get deleteAccount => 'Hesabı Sil';

  @override
  String get allFieldsRequired => 'Bütün sahələr tələb olunur.';

  @override
  String get accountRecoveredSuccess => 'Hesab uğurla bərpa edildi.';

  @override
  String get recoveryFailed => 'Bərpa uğursuz oldu. Məlumatlarınızı yoxlayın.';

  @override
  String get recoverySecretLabel => 'Bərpa sirri:';

  @override
  String get aboutUsTitle => 'Haqqımızda';

  @override
  String get aboutOurCompany => 'Şirkətimiz Haqqında';

  @override
  String get aboutCompanyDescription =>
      'Biz istifadəçilərimizə ən yaxşı astrologiya təcrübəsini çatdırmağa qərarlıyıq.';

  @override
  String get ourMission => 'Missiyamız';

  @override
  String get missionDescription =>
      'İstifadəçilərə həyatlarında əsaslandırılmış qərarlar qəbul etmələrinə kömək etmək üçün dəqiq və fərdiləşdirilmiş astrologiya anlayışlarını təmin etmək.';

  @override
  String get ourVision => 'Vizyonumuz';

  @override
  String get visionDescription =>
      'Texnologiya və qədim hikməti birləşdirən ən etibarlı astrologiya platforması olmaq.';

  @override
  String get ourValues => 'Dəyərlərimiz';

  @override
  String get valuesDescription =>
      'Dürüstlük, Dəqiqlik, İstifadəçi Mərkəzli Dizayn və Davamlı İnnovasiya.';

  @override
  String get contactUs => 'Bizimlə əlaqə saxlayın';

  @override
  String get contactEmail => 'E-poçt: support@yourcompany.com';

  @override
  String get contactWebsite => 'Veb sayt: www.yourcompany.com';

  @override
  String get customerSupport => 'Müştəri dəstəyi';

  @override
  String get supportHeroTitle => 'Biz kömək etmək üçün buradayıq';

  @override
  String get supportHeroDescription =>
      'Aşağıdakı formanı doldurun və dəstək komandamız ən qısa zamanda sizinlə əlaqə saxlasın.';

  @override
  String get yourName => 'Adınız';

  @override
  String get yourEmail => 'E-poçtunuz';

  @override
  String get message => 'Mesaj';

  @override
  String get enterEmail => 'E-poçtunuzu daxil edin';

  @override
  String get enterValidEmail => 'Etibarlı e-poçt ünvanı daxil edin';

  @override
  String enterField(Object fieldName) {
    return '$fieldName daxil edin';
  }

  @override
  String get send => 'Göndər';

  @override
  String get sending => 'Göndərilir...';

  @override
  String get emailSentSuccess => '✅ E-poçt uğurla göndərildi!';

  @override
  String get emailSendFailed => '❌ E-poçt göndərmək alınmadı';

  @override
  String get astroDictionaryTitle => 'Astro lüğəti';

  @override
  String get searchTermsHint => 'Axtarış şərtləri...';

  @override
  String get noTermsFound => 'Heç bir şərt tapılmadı';

  @override
  String get buyQuestionsTitle => 'Suallar Alın';

  @override
  String get userNotAuthenticated => 'İstifadəçinin kimliyi təsdiqlənməyib';

  @override
  String get loadStoreDataFailed => 'Mağaza datasını yükləmək alınmadı';

  @override
  String get missingAuthToken => 'Doğrulama nişanı çatışmır';

  @override
  String get merchantDisplayName => 'Astro Chat Proqramı';

  @override
  String get paymentSuccessful => '✅ Ödəniş uğurlu oldu! Sual göndərildi';

  @override
  String paymentFailed(Object error) {
    return '❌ Ödəniş alınmadı: $error';
  }

  @override
  String get yourBalance => 'Balansınız';

  @override
  String questionsBalance(Object count) {
    return '$count Suallar';
  }

  @override
  String get availableOffers => 'Mövcud Təkliflər';

  @override
  String questionsCount(Object count) {
    return '$count Sual';
  }

  @override
  String get buyButton => 'al';

  @override
  String get dailyHoroscopeTitle => '🌟 Gündəlik Bürclər';

  @override
  String get userIdMissing => 'İstifadəçi ID-si yoxdur';

  @override
  String get fetchHoroscopesFailed => 'Bürcləri əldə etmək alınmadı';

  @override
  String get noHoroscopeFound => 'Bürclər tapılmadı.';

  @override
  String get signLabel => 'İmza';

  @override
  String get todayLabel => 'Bu gün';

  @override
  String get yesterdayLabel => 'Dünən';

  @override
  String get thisWeekLabel => 'Bu Həftə';

  @override
  String get lastMonthLabel => 'Keçən ay';

  @override
  String get chatTitle => 'Söhbət';

  @override
  String get typeYourQuestionHint => 'Sualınızı yazın...';

  @override
  String get paymentRequired => 'Ödəniş Tələb olunur';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Pulsuz suallarınızdan istifadə etmisiniz. Davam etmək üçün $amount ödəyin.';
  }

  @override
  String get payNowButton => 'İndi ödəyin';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count pulsuz suallar qalıb';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pullu suallar qalıb';
  }

  @override
  String get thankYouFeedback => 'Rəyiniz üçün təşəkkür edirik!';

  @override
  String get ratingSubmitted => 'Reytinq təqdim edildi!';

  @override
  String get setUserIdFirst =>
      'Zəhmət olmasa, əvvəlcə İstifadəçi ID-nizi təyin edin';

  @override
  String get failedToFetchPrevious =>
      'Əvvəlki sualları və cavabları əldə etmək alınmadı';

  @override
  String errorOccurred(Object error) {
    return 'Xəta: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profili';

  @override
  String get drawerDailyHoroscope => 'Gündəlik Bürclər';

  @override
  String get drawerBuyQuestions => 'Suallar Alın';

  @override
  String get drawerAstroDictionary => 'Astro lüğəti';

  @override
  String get drawerSettings => 'Parametrlər';

  @override
  String get drawerCustomerSupport => 'Müştəri dəstəyi';

  @override
  String get drawerAbout => 'Haqqında';

  @override
  String get drawerProfileSettings => 'Profil Parametrləri';

  @override
  String get demoNotificationTitle => '🔔 Demo bildirişi';

  @override
  String get demoNotificationBody =>
      'Bu, tətbiqinizdən bir sınaq bildirişidir!';

  @override
  String get notificationsTitle => 'Bildirişlər';

  @override
  String get noNotifications => 'Bildiriş yoxdur';

  @override
  String get allTab => 'Hamısı';

  @override
  String get markAllAsRead => 'Hamısını oxunmuş kimi qeyd edin';

  @override
  String get notificationMarkedRead => 'Bildiriş oxunmuş kimi qeyd edildi';

  @override
  String get failedToLoadNotifications => 'Bildirişləri yükləmək alınmadı';

  @override
  String get failedToMarkRead => 'Oxunmuş kimi qeyd etmək alınmadı';

  @override
  String get failedToMarkAllRead => 'Hamısını oxunmuş kimi qeyd etmək alınmadı';

  @override
  String get socketConnected => 'Soket qoşulub';

  @override
  String get socketDisconnected => 'Soket ayrıldı';

  @override
  String get newNotificationReceived => 'Yeni bildiriş alındı';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Bürclər';

  @override
  String get chatCategory => 'Söhbət';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Yeniləmələr';

  @override
  String get howToAskTitle => 'Necə Soruşmaq olar';

  @override
  String get noQuestionsAvailable => 'Sual yoxdur';

  @override
  String get failedToLoadQuestions => 'Sualları yükləmək alınmadı';

  @override
  String get pullToRefresh => 'Yeniləmək üçün çəkin';

  @override
  String get careerCategory => 'Karyera';

  @override
  String get loveCategory => 'Sevgi və Münasibətlər';

  @override
  String get healthCategory => 'Sağlamlıq';

  @override
  String get financeCategory => 'Maliyyə';

  @override
  String get familyCategory => 'Ailə';

  @override
  String get educationCategory => 'Təhsil';

  @override
  String get travelCategory => 'Səyahət';

  @override
  String get spiritualCategory => 'Mənəvi';

  @override
  String get profileLoaded => 'Profil uğurla yükləndi';

  @override
  String get imageUploaded => 'Şəkil uğurla yükləndi';

  @override
  String get savedInformationConfirmation => 'Bu Məlumatı Saxlamışam';

  @override
  String get noHistoryAvailable => 'Tarixçə mövcud deyil';

  @override
  String get missingUserIdError => 'İstifadəçi ID tələb olunur';

  @override
  String get networkError => 'Şəbəkə xətası. Yenidən cəhd edin.';

  @override
  String get timeoutError => 'Sorğunun vaxtı bitdi';

  @override
  String get genericError => 'Nəsə xəta baş verdi';

  @override
  String get reactionUpdateError => 'Reaksiyanı yeniləmək alınmadı';

  @override
  String get noSearchResults => 'Axtarış nəticəsi tapılmadı';

  @override
  String get clearSearch => 'Axtarışı təmizləyin';

  @override
  String get resultsFound => 'Nəticələr tapıldı';

  @override
  String get recoverySecretHint => 'Kopyala-yapışdırmaya bilər, əl ilə yazın';

  @override
  String get recoverAccountDescription =>
      'Hesabınızı bərpa etmək üçün bu addımları yerinə yetirin';

  @override
  String get processingLabel => 'Emal edilir...';

  @override
  String get clearChatSuccess => 'Söhbət uğurla silindi';

  @override
  String get notificationsEnabled => 'Bildirişlər aktivləşdirildi';

  @override
  String get notificationsDisabled => 'Bildirişlər deaktiv edilib';

  @override
  String get securityNotice =>
      'Məlumatlarınız təhlükəsiz şəkildə şifrələnir və saxlanılır';

  @override
  String get loading => 'Yüklənir...';

  @override
  String get selectLanguage => 'Dil seçin';

  @override
  String get onboardingGetStartedDesc => 'Dilinizi seçməklə başlayın';

  @override
  String get accountRecoveryTitle => '🔐 Hesabın bərpası təfərrüatları';

  @override
  String get recoveryInstructions =>
      'Zəhmət olmasa bu məlumatı təhlükəsiz şəkildə saxlayın. Hesabınızı bərpa etmək üçün ona ehtiyacınız olacaq.';

  @override
  String get importantNotice => '⚠️ Vacib:';

  @override
  String get astrologerProfileTitle => 'Astroloq Profili';

  @override
  String get personalAstrologer => 'Şəxsi Astroloq';

  @override
  String get makePersonalAstrologer => 'Şəxsi Astroloq olun';

  @override
  String get favoriteDescription =>
      'Suallarınız bu astroloqa üstünlük veriləcək. Əgər mümkün deyilsə, başqa ixtisaslı astroloq sizə kömək edəcək.';

  @override
  String get educationQualifications => 'Təhsil və Kvalifikasiyalar';

  @override
  String get aboutSection => 'Haqqında';

  @override
  String get shareProfile => 'Profili Paylaşın';

  @override
  String get loadingAstrologer => 'Astroloq təfərrüatları yüklənir...';

  @override
  String get failedToLoadAstrologer =>
      'Astroloq təfərrüatlarını yükləmək alınmadı';

  @override
  String get authenticationRequired =>
      'Doğrulama tələb olunur. Zəhmət olmasa daxil olun.';

  @override
  String securityCheckFailed(Object error) {
    return 'Təhlükəsizlik yoxlanışı alınmadı: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name indi Sizin Şəxsi Astroloqunuzdur';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name sevimlilərdən silindi';
  }

  @override
  String get toggleFavoriteError => 'Sevimli statusu yeniləmək alınmadı';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Təhsil: $education\n📜 Kvalifikasiya: $qualification\n⏳ Təcrübə: $experience';
  }

  @override
  String get notProvided => 'təmin edilməyib';

  @override
  String reviews(Object count) {
    return '($count rəylər)';
  }

  @override
  String get specialties => 'İxtisaslar';

  @override
  String get experience => 'Təcrübə';

  @override
  String get qualification => 'İxtisas';

  @override
  String get education => 'Təhsil';

  @override
  String get recoveryTips =>
      '• Bu məlumatın ekran görüntüsünü çəkin\n• Onu təhlükəsiz yerdə saxlayın\n• Heç kimlə paylaşmayın\n• Bu, yalnız bir dəfə göstəriləcək';

  @override
  String get themeSettingsTitle => 'Mövzu Parametrləri';

  @override
  String get lightThemeLabel => 'İşıq';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Qaranlıq';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
