// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get notificationSettings => 'Bildirim Ayarları';

  @override
  String get privacySettings => 'Gizlilik Ayarları';

  @override
  String get accountSettings => 'Hesap Ayarları';

  @override
  String get languageSettings => 'Dil Ayarları';

  @override
  String get languageChanged => 'Dil değiştirildi';

  @override
  String get existingUserButton => 'Ben mevcut bir kullanıcıyım';

  @override
  String get chooseCountryTitle => 'Ülke Seçin';

  @override
  String get yesText => 'Evet';

  @override
  String get noText => 'HAYIR';

  @override
  String get appBarTitle => 'Profil Ayarları';

  @override
  String get userIdLabel => 'Kullanıcı kimliği *';

  @override
  String get nameLabel => 'İsim';

  @override
  String get birthCountryLabel => 'Doğum Ülkesi';

  @override
  String get birthCityLabel => 'Doğum Şehri';

  @override
  String get countrySelectionTitle => 'Ülkenizi seçin';

  @override
  String get maleLabel => 'Erkek';

  @override
  String get femaleLabel => 'Dişi';

  @override
  String get birthDateLabel => 'Doğum Tarihi';

  @override
  String get birthDatePlaceholder => 'Doğum Tarihini Seçin';

  @override
  String get birthTimeLabel => 'Doğum Saati';

  @override
  String get birthTimePlaceholder => 'Doğum Saatini Seçin';

  @override
  String get saveProfileButton => 'Profili Kaydet';

  @override
  String get noCitiesFound => 'Şehir bulunamadı';

  @override
  String cityPlaceholder(Object country) {
    return '$country şehir girin';
  }

  @override
  String get countryFirstPlaceholder => 'Önce ülkeyi seçin';

  @override
  String get versionHistoryTitle => 'Sürüm Geçmişi';

  @override
  String get notSetText => 'Ayarlanmamış';

  @override
  String nameHistory(Object name) {
    return 'Adı: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Şehir: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Ülke: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Cinsiyet: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Doğum Tarihi: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Doğum Saati: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Konum: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Saat dilimi: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Yaz Saati Uygulaması: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Durum: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date tarihinde güncellendi';
  }

  @override
  String get userIdRequired => 'Kullanıcı kimliği gereklidir';

  @override
  String get profileSaved => 'Profil başarıyla kaydedildi';

  @override
  String get saveFailed => 'Profil kaydedilemedi';

  @override
  String get errorPrefix => 'Hata:';

  @override
  String get onboardingChooseLanguage => 'Dilinizi Seçin';

  @override
  String get onboardingChooseLanguageDesc =>
      'Devam etmek için tercih ettiğiniz dili seçin.';

  @override
  String get onboardingWhatIsAstrology => 'Astroloji Nedir?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astroloji, gök cisimlerinin hareketlerini ve bunların insan yaşamı üzerindeki etkilerini inceleyen, kişiliğe, ilişkilere ve yaşam olaylarına dair içgörüler sunan kadim bir bilimdir.';

  @override
  String get onboardingWhyUseApp => 'Bu Uygulamayı Neden Kullanmalısınız?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Doğum haritanıza özel, insan yapımı doğru burç yorumları ve rehberlik alın. Deneyimli astrologların günlük tahminleri ve kişiselleştirilmiş tavsiyeleriyle bilinçli kararlar alın.';

  @override
  String get onboardingHowToUse => 'Bu Uygulama Nasıl Kullanılır?';

  @override
  String get onboardingHowToUseDesc =>
      'Hemen başlamak için doğum tarihinizi, tam saatinizi, doğum yerinizi ve diğer ilgili bilgileri girmeniz yeterli. Günlük burç yorumlarını inceleyin, uzman astrologlara sorular sorun ve profilinizi yöneterek hassas ve kişiselleştirilmiş tahminler alın; oturum açmanıza gerek yok.';

  @override
  String get onboardingGetStarted => 'Başlayın';

  @override
  String get onboardingNewUser => 'Yeni Kullanıcı';

  @override
  String get onboardingExistingUser => 'Mevcut Kullanıcı';

  @override
  String get onboardingBack => 'Geri';

  @override
  String get onboardingNext => 'Sonraki';

  @override
  String get userIdNotFound =>
      'Kullanıcı kimliği bulunamadı. Lütfen giriş yapın veya profilinizi ayarlayın.';

  @override
  String get clearNotificationsTitle => 'Bildirimleri Temizle';

  @override
  String get clearNotificationsMessage =>
      'Tüm bildirimleri temizlemek istediğinizden emin misiniz?';

  @override
  String get clearNotificationsSuccess =>
      'Tüm bildirimler başarıyla temizlendi.';

  @override
  String get clearHoroscopeTitle => 'Net Burçlar';

  @override
  String get clearHoroscopeMessage =>
      'Burç verilerinizi temizlemek istediğinizden emin misiniz?';

  @override
  String get clearHoroscopeSuccess => 'Burç başarıyla temizlendi.';

  @override
  String get clearChatTitle => 'Sohbet Geçmişini Temizle';

  @override
  String get clearChatMessage =>
      'Sohbet geçmişinizi tamamen silmek istediğinizden emin misiniz?';

  @override
  String get clearChatLocal => 'Sohbet yerel olarak temizlendi.';

  @override
  String get deleteAccountTitle => 'Hesabı Sil';

  @override
  String get deleteAccountMessage =>
      'Hesabınızı silmek istediğinizden emin misiniz? Bu işlem tüm sohbet geçmişinizi ve bildirimlerinizi de temizleyecektir.';

  @override
  String get deleteAccountSuccess =>
      'Hesabınız ve tüm verileriniz silinmiştir.';

  @override
  String get deleteAccountError => 'Hesap silinirken hata oluştu';

  @override
  String get logoutTitle => 'Çıkış yap';

  @override
  String get logoutMessage => 'Çıkış yapmak istediğinize emin misiniz?';

  @override
  String get termsPrivacyTitle => 'Şartlar ve Gizlilik';

  @override
  String get privacyPolicyTitle => 'Gizlilik Politikası';

  @override
  String get termsConditionsTitle => 'Şartlar ve Koşullar';

  @override
  String get dataControlTitle => 'Veri Kontrolü';

  @override
  String get cancelButton => 'İptal etmek';

  @override
  String get confirmButton => 'Onaylamak';

  @override
  String get clearQuestionsSuccess => 'Tüm sorular başarıyla silindi.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tanrım';

  @override
  String get startLabel => 'Başlangıç';

  @override
  String get recoverAccount => 'Hesabı Kurtar';

  @override
  String get endLabel => 'Son';

  @override
  String get startDateLabel => 'Başlangıç Tarihi';

  @override
  String get endDateLabel => 'Bitiş Tarihi';

  @override
  String get notAvailable => 'Müsait değil';

  @override
  String get noData => 'Veri yok';

  @override
  String get unknownError => 'Bilinmeyen hata';

  @override
  String get retryButton => 'Tekrar dene';

  @override
  String get kundaliGeneratorTitle => 'Kundali Jeneratörü';

  @override
  String get natalChartTitle => 'Doğum Haritası';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raşi';

  @override
  String get ascDegreeLabel => 'Yükselen Derece';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Daşa';

  @override
  String get yoginiDashaTitle => 'Yogini Daşa';

  @override
  String get unknown => 'Bilinmeyen';

  @override
  String get clearHoroscope => 'Net Burçlar';

  @override
  String get clearNotifications => 'Bildirimleri Temizle';

  @override
  String get clearChatHistory => 'Sohbet Geçmişini Temizle';

  @override
  String get logout => 'Çıkış yap';

  @override
  String get deleteAccount => 'Hesabı Sil';

  @override
  String get allFieldsRequired => 'Tüm alanların doldurulması zorunludur.';

  @override
  String get accountRecoveredSuccess => 'Hesap başarıyla kurtarıldı.';

  @override
  String get recoveryFailed =>
      'Kurtarma başarısız oldu. Bilgilerinizi kontrol edin.';

  @override
  String get recoverySecretLabel => 'Kurtarma Sırrı:';

  @override
  String get aboutUsTitle => 'Hakkımızda';

  @override
  String get aboutOurCompany => 'Şirketimiz Hakkında';

  @override
  String get aboutCompanyDescription =>
      'Karma\'da, Vedik astrolojinin zamansız bilgeliğiyle gerçek yaşam yolunuzu keşfetmenize yardımcı oluyoruz. Her içgörü, gerçek ve deneyimli astrologlardan geliyor ve benzersiz doğum haritanıza göre özenle hazırlanıyor. Günlük burç yorumlarından kişiselleştirilmiş rehberliğe kadar Karma, kadim bilgileri 100\'den fazla dilde erişilebilir kılıyor.';

  @override
  String get ourMission => 'Misyonumuz';

  @override
  String get missionDescription =>
      'Misyonumuz basit: Güvenilir ve bilinçli kararlar almanızı sağlayacak, özgün ve insan odaklı astrolojik rehberlik sağlamak. Her tahmin ve danışmanlık, otomatik algoritmaların değil, yılların profesyonel uzmanlığının bir yansımasıdır.';

  @override
  String get ourVision => 'Vizyonumuz';

  @override
  String get visionDescription =>
      'Vedik astroloji alanında dünyanın en güvenilir platformu olmayı hedefliyoruz; dünyanın her yerindeki insanların kendilerini, seçimlerini ve yaşam yolculuklarını netlik ve güvenle anlamalarına yardımcı oluyoruz.';

  @override
  String get ourValues => 'Değerlerimiz';

  @override
  String get valuesDescription =>
      'Karma\'da özgünlüğe, hassasiyete ve güvene değer veriyoruz. Sadece doğru değil, aynı zamanda anlamlı rehberlik sunmaya, hayatınızda içgörü ve güvenle ilerlemenize yardımcı olmaya kararlıyız.';

  @override
  String get contactUs => 'Bize Ulaşın';

  @override
  String get contactEmail => 'E-posta: support@şirketiniz.com';

  @override
  String get contactWebsite => 'Web sitesi: www.sirketiniz.com';

  @override
  String get customerSupport => 'Müşteri Desteği';

  @override
  String get supportHeroTitle => 'Yardım Etmek İçin Buradayız';

  @override
  String get supportHeroDescription =>
      'Aşağıdaki formu doldurun, destek ekibimiz en kısa sürede size geri dönüş yapacaktır.';

  @override
  String get yourName => 'Adınız';

  @override
  String get yourEmail => 'E-postanız';

  @override
  String get message => 'Mesaj';

  @override
  String get enterEmail => 'E-postanızı girin';

  @override
  String get enterValidEmail => 'Geçerli bir e-posta adresi girin';

  @override
  String enterField(Object fieldName) {
    return '$fieldName girin';
  }

  @override
  String get send => 'Göndermek';

  @override
  String get sending => 'Gönderiliyor...';

  @override
  String get emailSentSuccess => '✅ E-posta başarıyla gönderildi!';

  @override
  String get emailSendFailed => '❌ E-posta gönderilemedi';

  @override
  String get astroDictionaryTitle => 'Astroloji Sözlüğü';

  @override
  String get searchTermsHint => 'Arama terimleri...';

  @override
  String get noTermsFound => 'Hiçbir terim bulunamadı';

  @override
  String get buyQuestionsTitle => 'Soruları Satın Al';

  @override
  String get userNotAuthenticated => 'Kullanıcı kimliği doğrulanmadı';

  @override
  String get loadStoreDataFailed => 'Mağaza verileri yüklenemedi';

  @override
  String get missingAuthToken => 'Eksik yetkilendirme belirteci';

  @override
  String get merchantDisplayName => 'Astro Sohbet Uygulaması';

  @override
  String get paymentSuccessful => '✅ Ödeme başarılı! Soru gönderildi';

  @override
  String paymentFailed(Object error) {
    return '❌ Ödeme başarısız oldu: $error';
  }

  @override
  String get yourBalance => 'Bakiyeniz';

  @override
  String questionsBalance(Object count) {
    return '$count Sorular';
  }

  @override
  String get availableOffers => 'Mevcut Teklifler';

  @override
  String questionsCount(Object count) {
    return '$count Soru';
  }

  @override
  String get buyButton => 'Satın almak';

  @override
  String get dailyHoroscopeTitle => '🌟 Günlük Burç Yorumları';

  @override
  String get userIdMissing => 'Kullanıcı kimliği eksik';

  @override
  String get fetchHoroscopesFailed => 'Burçlar alınamadı';

  @override
  String get noHoroscopeFound => 'Burç bulunamadı.';

  @override
  String get signLabel => 'İmza';

  @override
  String get todayLabel => 'Bugün';

  @override
  String get yesterdayLabel => 'Dün';

  @override
  String get thisWeekLabel => 'Bu hafta';

  @override
  String get lastMonthLabel => 'Geçen ay';

  @override
  String get chatTitle => 'Sohbet';

  @override
  String get typeYourQuestionHint => 'Sorunuzu yazın...';

  @override
  String get paymentRequired => 'Ödeme Gerekli';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Ücretsiz sorularınızı kullandınız. Devam etmek için $amount ödeyin.';
  }

  @override
  String get payNowButton => 'Şimdi Öde';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count kalan ücretsiz sorular';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ücretli soru kaldı';
  }

  @override
  String get thankYouFeedback => 'Geri bildiriminiz için teşekkür ederiz!';

  @override
  String get ratingSubmitted => 'Oylama gönderildi!';

  @override
  String get setUserIdFirst => 'Lütfen önce Kullanıcı Kimliğinizi ayarlayın';

  @override
  String get failedToFetchPrevious => 'Önceki sorular ve yanıtlar alınamadı';

  @override
  String errorOccurred(Object error) {
    return 'Hata: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro Profili';

  @override
  String get drawerDailyHoroscope => 'Günlük Burç Yorumları';

  @override
  String get drawerBuyQuestions => 'Soruları Satın Al';

  @override
  String get drawerAstroDictionary => 'Astroloji Sözlüğü';

  @override
  String get drawerSettings => 'Ayarlar';

  @override
  String get drawerCustomerSupport => 'Müşteri Desteği';

  @override
  String get drawerAbout => 'Hakkında';

  @override
  String get drawerProfileSettings => 'Profil Ayarları';

  @override
  String get demoNotificationTitle => '🔔 Demo Bildirimi';

  @override
  String get demoNotificationBody =>
      'Bu, uygulamanızdan gelen bir test bildirimidir!';

  @override
  String get notificationsTitle => 'Bildirimler';

  @override
  String get noNotifications => 'Hiçbir bildirim yok';

  @override
  String get allTab => 'Tüm';

  @override
  String get markAllAsRead => 'Tümünü okundu olarak işaretle';

  @override
  String get notificationMarkedRead => 'Bildirim okundu olarak işaretlendi';

  @override
  String get failedToLoadNotifications => 'Bildirimler yüklenemedi';

  @override
  String get failedToMarkRead => 'Okundu olarak işaretlenemedi';

  @override
  String get failedToMarkAllRead =>
      'Tümünü okundu olarak işaretleme başarısız oldu';

  @override
  String get socketConnected => 'Soket bağlı';

  @override
  String get socketDisconnected => 'Soket bağlantısı kesildi';

  @override
  String get newNotificationReceived => 'Yeni bildirim alındı';

  @override
  String get generalCategory => 'Genel';

  @override
  String get horoscopeCategory => 'Burç';

  @override
  String get chatCategory => 'Sohbet';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Güncellemeler';

  @override
  String get howToAskTitle => 'Nasıl Sorulur';

  @override
  String get noQuestionsAvailable => 'Soru bulunamadı';

  @override
  String get failedToLoadQuestions => 'Sorular yüklenemedi';

  @override
  String get pullToRefresh => 'Yenilemek için çekin';

  @override
  String get careerCategory => 'Kariyer';

  @override
  String get loveCategory => 'Aşk ve İlişkiler';

  @override
  String get healthCategory => 'Sağlık';

  @override
  String get financeCategory => 'Finans';

  @override
  String get familyCategory => 'Aile';

  @override
  String get educationCategory => 'Eğitim';

  @override
  String get travelCategory => 'Seyahat';

  @override
  String get spiritualCategory => 'Manevi';

  @override
  String get profileLoaded => 'Profil başarıyla yüklendi';

  @override
  String get imageUploaded => 'Resim başarıyla yüklendi';

  @override
  String get savedInformationConfirmation => 'Bu Bilgileri Kaydettim';

  @override
  String get noHistoryAvailable => 'Geçmiş mevcut değil';

  @override
  String get missingUserIdError => 'Kullanıcı kimliği gereklidir';

  @override
  String get networkError => 'Ağ hatası. Lütfen tekrar deneyin.';

  @override
  String get timeoutError => 'İstek zaman aşımına uğradı';

  @override
  String get genericError => 'Bir şeyler ters gitti';

  @override
  String get reactionUpdateError => 'Tepki güncellenemedi';

  @override
  String get noSearchResults => 'Hiçbir arama sonucu bulunamadı';

  @override
  String get clearSearch => 'Aramayı temizle';

  @override
  String get resultsFound => 'Bulunan sonuçlar';

  @override
  String get recoverySecretHint =>
      'Kopyala-yapıştır işe yaramayabilir, elle yazın';

  @override
  String get recoverAccountDescription =>
      'Hesabınızı kurtarmak için şu adımları izleyin';

  @override
  String get processingLabel => 'İşleme...';

  @override
  String get clearChatSuccess => 'Sohbet başarıyla temizlendi';

  @override
  String get notificationsEnabled => 'Bildirimler etkinleştirildi';

  @override
  String get notificationsDisabled => 'Bildirimler devre dışı bırakıldı';

  @override
  String get securityNotice =>
      'Verileriniz güvenli bir şekilde şifrelenir ve saklanır';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get selectLanguage => 'Dil Seçin';

  @override
  String get onboardingGetStartedDesc => 'Dilinizi seçerek başlayın';

  @override
  String get accountRecoveryTitle => '🔐 Hesap Kurtarma Ayrıntıları';

  @override
  String get recoveryInstructions =>
      'Lütfen bu bilgileri güvenli bir şekilde saklayın. Hesabınızı kurtarmak için bunlara ihtiyacınız olacak.';

  @override
  String get importantNotice => '⚠️ Önemli:';

  @override
  String get astrologerProfileTitle => 'Astrolog Profili';

  @override
  String get personalAstrologer => 'Kişisel Astrolog';

  @override
  String get makePersonalAstrologer => 'Kişisel Astrolog Oluşturun';

  @override
  String get favoriteDescription =>
      'Sorularınız bu astrologa önceliklendirilecektir. Müsait değilseniz, başka bir kalifiye astrolog size yardımcı olacaktır.';

  @override
  String get educationQualifications => 'Eğitim ve Nitelikler';

  @override
  String get aboutSection => 'Hakkında';

  @override
  String get shareProfile => 'Profili Paylaş';

  @override
  String get loadingAstrologer => 'Astrolog detayları yükleniyor...';

  @override
  String get failedToLoadAstrologer => 'Astrolog detayları yüklenemedi';

  @override
  String get authenticationRequired =>
      'Kimlik doğrulaması gerekiyor. Lütfen giriş yapın.';

  @override
  String securityCheckFailed(Object error) {
    return 'Güvenlik kontrolü başarısız oldu: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name artık Kişisel Astroloğunuz';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name favorilerden kaldırıldı';
  }

  @override
  String get toggleFavoriteError => 'Favori durumu güncellenemedi';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Eğitim: $education\n📜 Nitelikler: $qualification\n⏳ Deneyim: $experience';
  }

  @override
  String get notProvided => 'Sağlanmadı';

  @override
  String reviews(Object count) {
    return '($count inceleme)';
  }

  @override
  String get specialties => 'Uzmanlıklar';

  @override
  String get experience => 'Deneyim';

  @override
  String get qualification => 'Vasıf';

  @override
  String get education => 'Eğitim';

  @override
  String get recoveryTips =>
      '• Bu bilgilerin ekran görüntüsünü alın\n• Güvenli bir yerde saklayın\n• Kimseyle paylaşmayın\n• Bu yalnızca bir kez gösterilecektir';

  @override
  String get themeSettingsTitle => 'Tema Ayarları';

  @override
  String get lightThemeLabel => 'Işık';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Karanlık';

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

  @override
  String get ourTeam => 'Ekibimiz';

  @override
  String get teamDescription =>
      'Profesyonel Vedik astrologlardan oluşan ekibimiz, gezegensel etkileri ve yaşam kalıplarını yorumlama konusunda yılların deneyimine sahiptir. Özel bir destek ve geliştirme ekibinin desteğiyle Karma, her kullanıcıya kusursuz, güvenilir ve küresel bir deneyim sunar.';
}
