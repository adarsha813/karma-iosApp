// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sundanese (`su`).
class AppLocalizationsSu extends AppLocalizations {
  AppLocalizationsSu([String locale = 'su']) : super(locale);

  @override
  String get settingsTitle => 'Setélan';

  @override
  String get notificationSettings => 'Setélan Bewara';

  @override
  String get privacySettings => 'Setélan Privasi';

  @override
  String get accountSettings => 'Sétingan akun';

  @override
  String get languageSettings => 'Setélan Basa';

  @override
  String get languageChanged => 'Basa robah';

  @override
  String get existingUserButton => 'Abdi pangguna anu tos aya';

  @override
  String get chooseCountryTitle => 'Pilih Nagara';

  @override
  String get yesText => 'Sumuhun';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Setélan Propil';

  @override
  String get userIdLabel => 'ID Pangguna *';

  @override
  String get nameLabel => 'Ngaran';

  @override
  String get birthCountryLabel => 'Nagara kalahiran';

  @override
  String get birthCityLabel => 'Kota kalahiran';

  @override
  String get countrySelectionTitle => 'Pilih nagara anjeun';

  @override
  String get maleLabel => 'Jalu';

  @override
  String get femaleLabel => 'Awéwé';

  @override
  String get birthDateLabel => 'Tanggal lahir';

  @override
  String get birthDatePlaceholder => 'Pilih Tanggal Lahir';

  @override
  String get birthTimeLabel => 'Waktos kalahiran';

  @override
  String get birthTimePlaceholder => 'Pilih Kalahiran';

  @override
  String get saveProfileButton => 'Simpen Propil';

  @override
  String get noCitiesFound => 'Taya kota kapanggih';

  @override
  String cityPlaceholder(Object country) {
    return 'Lebetkeun kota dina $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pilih nagara heula';

  @override
  String get versionHistoryTitle => 'Sajarah Vérsi';

  @override
  String get notSetText => 'Teu diatur';

  @override
  String nameHistory(Object name) {
    return 'Ngaran: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Kota: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Nagara: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gender: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tanggal Lahir: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Waktu Lahir: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokasi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zona waktu: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Kaayaan: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Diropéa dina $date';
  }

  @override
  String get userIdRequired => 'ID pamaké diperlukeun';

  @override
  String get profileSaved => 'Propil suksés disimpen';

  @override
  String get saveFailed => 'Gagal nyimpen profil';

  @override
  String get errorPrefix => 'Kasalahan:';

  @override
  String get onboardingChooseLanguage => 'Pilih Basa Anjeun';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pilih basa anu anjeun pikaresep pikeun neraskeun.';

  @override
  String get onboardingWhatIsAstrology => 'Naon Astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi nyaéta ulikan ngeunaan benda langit ...';

  @override
  String get onboardingWhyUseApp => 'Naha make aplikasi ieu?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Kéngingkeun horoskop pribadi, prediksi sapopoé, sareng pituduh pikeun nyandak kaputusan anu terang.';

  @override
  String get onboardingHowToUse => 'Kumaha ngagunakeun aplikasi ieu?';

  @override
  String get onboardingHowToUseDesc =>
      'Gampang navigasi, pariksa horoskop sapopoé, sareng atur profil anjeun pikeun prediksi anu akurat.';

  @override
  String get onboardingGetStarted => 'Mimitian';

  @override
  String get onboardingNewUser => 'Pamaké anyar';

  @override
  String get onboardingExistingUser => 'Pamaké anu aya';

  @override
  String get onboardingBack => 'Balik deui';

  @override
  String get onboardingNext => 'Teras';

  @override
  String get userIdNotFound =>
      'ID pamaké teu kapanggih. Mangga lebet atanapi nyetél profil anjeun.';

  @override
  String get clearNotificationsTitle => 'Hapus Bewara';

  @override
  String get clearNotificationsMessage =>
      'Naha anjeun yakin hoyong mupus sadaya bewara?';

  @override
  String get clearNotificationsSuccess => 'Sadaya bewara junun diberesihan.';

  @override
  String get clearHoroscopeTitle => 'Horoskop jelas';

  @override
  String get clearHoroscopeMessage =>
      'Naha anjeun yakin hoyong mupus data horoskop anjeun?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop diberesihan suksés.';

  @override
  String get clearChatTitle => 'Hapus Sajarah Chat';

  @override
  String get clearChatMessage =>
      'Naha anjeun yakin hoyong mupus sadaya riwayat obrolan anjeun?';

  @override
  String get clearChatLocal => 'Obrolan diberesihan sacara lokal.';

  @override
  String get deleteAccountTitle => 'Hapus Akun';

  @override
  String get deleteAccountMessage =>
      'Naha anjeun yakin hoyong mupus akun anjeun? Ieu ogé bakal mupus sadaya sajarah obrolan sareng bewara anjeun.';

  @override
  String get deleteAccountSuccess =>
      'Akun anjeun sareng sadaya data parantos dihapus.';

  @override
  String get deleteAccountError => 'Kasalahan mupus akun';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutMessage => 'Anjeun yakin rék kaluar?';

  @override
  String get termsPrivacyTitle => 'Sarat & Privasi';

  @override
  String get privacyPolicyTitle => 'kabijakan privasi';

  @override
  String get termsConditionsTitle => 'Sarat & Kaayaan';

  @override
  String get dataControlTitle => 'Kontrol Data';

  @override
  String get cancelButton => 'Ngabolaykeun';

  @override
  String get confirmButton => 'Konpirmasi';

  @override
  String get clearQuestionsSuccess => 'Sadaya patarosan suksés dihapus.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Gusti';

  @override
  String get startLabel => 'Mimitian';

  @override
  String get recoverAccount => 'Pulihkeun Akun';

  @override
  String get endLabel => 'Tungtung';

  @override
  String get startDateLabel => 'Tanggal mimiti';

  @override
  String get endDateLabel => 'Tanggal tungtung';

  @override
  String get notAvailable => 'Henteu sayogi';

  @override
  String get noData => 'Taya data';

  @override
  String get unknownError => 'Kasalahan teu dipikanyaho';

  @override
  String get retryButton => 'Coba deui';

  @override
  String get kundaliGeneratorTitle => 'Kundali generator';

  @override
  String get natalChartTitle => 'Bagan Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Gelar Ascendant';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Teu kanyahoan';

  @override
  String get clearHoroscope => 'Horoskop jelas';

  @override
  String get clearNotifications => 'Hapus Bewara';

  @override
  String get clearChatHistory => 'Hapus Sajarah Chat';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Hapus Akun';

  @override
  String get allFieldsRequired => 'Kabéh widang diperlukeun.';

  @override
  String get accountRecoveredSuccess => 'Rekening suksés pulih.';

  @override
  String get recoveryFailed => 'Pamulihan gagal. Pariksa inpormasi anjeun.';

  @override
  String get recoverySecretLabel => 'Rahasia Pamulihan:';

  @override
  String get aboutUsTitle => 'Tentang Kami';

  @override
  String get aboutOurCompany => 'Ngeunaan Perusahaan Kami';

  @override
  String get aboutCompanyDescription =>
      'Kami komitmen pikeun nganteurkeun pangalaman astrologi anu pangsaéna pikeun pangguna urang.';

  @override
  String get ourMission => 'Misi kami';

  @override
  String get missionDescription =>
      'Pikeun masihan wawasan astrologi anu akurat sareng pribadi pikeun ngabantosan pangguna nyandak kaputusan anu terang dina kahirupanna.';

  @override
  String get ourVision => 'Visi Urang';

  @override
  String get visionDescription =>
      'Pikeun janten platform astrologi anu paling dipercaya, ngagabungkeun téknologi sareng hikmah kuno.';

  @override
  String get ourValues => 'Nilai Urang';

  @override
  String get valuesDescription =>
      'Integritas, Akurasi, Desain-Centric Pamaké, sareng Inovasi Kontinyu.';

  @override
  String get contactUs => 'Taros Kami';

  @override
  String get contactEmail => 'Surélék: support@yourcompany.com';

  @override
  String get contactWebsite => 'Situs Web: www.yourcompany.com';

  @override
  String get customerSupport => 'Rojongan Palanggan';

  @override
  String get supportHeroTitle => 'Kami di dieu pikeun mantuan';

  @override
  String get supportHeroDescription =>
      'Eusian formulir di handap sarta tim rojongan kami bakal balik deui ka anjeun pas mungkin.';

  @override
  String get yourName => 'Nami anjeun';

  @override
  String get yourEmail => 'Surélék anjeun';

  @override
  String get message => 'talatah';

  @override
  String get enterEmail => 'Lebetkeun surélék anjeun';

  @override
  String get enterValidEmail => 'Asupkeun alamat surélék nu sah';

  @override
  String enterField(Object fieldName) {
    return 'Lebetkeun $fieldName';
  }

  @override
  String get send => 'Ngirimkeun';

  @override
  String get sending => 'Ngirim...';

  @override
  String get emailSentSuccess => '✅ Surélék suksés dikirim!';

  @override
  String get emailSendFailed => '❌ Gagal ngirim email';

  @override
  String get astroDictionaryTitle => 'Kamus Astro';

  @override
  String get searchTermsHint => 'Istilah pilarian...';

  @override
  String get noTermsFound => 'Taya istilah kapanggih';

  @override
  String get buyQuestionsTitle => 'Mésér Patarosan';

  @override
  String get userNotAuthenticated => 'Pamaké teu dioténtikasi';

  @override
  String get loadStoreDataFailed => 'Gagal ngamuat data toko';

  @override
  String get missingAuthToken => 'Token otentik leungit';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Pamayaran suksés! Patarosan dikirim';

  @override
  String paymentFailed(Object error) {
    return '❌ Pamayaran gagal: $error';
  }

  @override
  String get yourBalance => 'Kasaimbangan Anjeun';

  @override
  String questionsBalance(Object count) {
    return '$count Patarosan';
  }

  @override
  String get availableOffers => 'Panawaran sadia';

  @override
  String questionsCount(Object count) {
    return '$count Patarosan';
  }

  @override
  String get buyButton => 'Meuli';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoskop poean';

  @override
  String get userIdMissing => 'ID pamaké leungit';

  @override
  String get fetchHoroscopesFailed => 'Gagal nyandak horoskop';

  @override
  String get noHoroscopeFound => 'Horoskop teu kapanggih.';

  @override
  String get signLabel => 'asup';

  @override
  String get todayLabel => 'Kiwari';

  @override
  String get yesterdayLabel => 'Kamari';

  @override
  String get thisWeekLabel => 'Minggu ayeuna';

  @override
  String get lastMonthLabel => 'Bulan kamari';

  @override
  String get chatTitle => 'Obrolan';

  @override
  String get typeYourQuestionHint => 'Ketik patarosan anjeun...';

  @override
  String get paymentRequired => 'Mayar Diperlukeun';

  @override
  String get paymentRequiredMessage =>
      'Anjeun parantos nganggo patarosan gratis anjeun. Mayar ₹50 pikeun neraskeun.';

  @override
  String get payNowButton => 'Bayar Ayeuna';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count patarosan bébas sésana';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count patarosan mayar sésana';
  }

  @override
  String get thankYouFeedback => 'Hatur nuhun pikeun eupan balik anjeun!';

  @override
  String get ratingSubmitted => 'Peunteun dikintunkeun!';

  @override
  String get setUserIdFirst => 'Mangga setel User ID anjeun heula';

  @override
  String get failedToFetchPrevious =>
      'Gagal nyandak patarosan sareng jawaban sateuacana';

  @override
  String errorOccurred(Object error) {
    return 'Kasalahan: $error';
  }

  @override
  String get drawerAstroProfile => 'Propil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoskop poean';

  @override
  String get drawerBuyQuestions => 'Mésér Patarosan';

  @override
  String get drawerAstroDictionary => 'Kamus Astro';

  @override
  String get drawerSettings => 'Setélan';

  @override
  String get drawerCustomerSupport => 'Rojongan Palanggan';

  @override
  String get drawerAbout => 'Ngeunaan';

  @override
  String get drawerProfileSettings => 'Setélan Propil';

  @override
  String get demoNotificationTitle => '🔔 Bewara Demo';

  @override
  String get demoNotificationBody =>
      'Ieu mangrupikeun béwara tés tina aplikasi anjeun!';

  @override
  String get notificationsTitle => 'Bewara';

  @override
  String get noNotifications => 'Taya béja';

  @override
  String get allTab => 'Sadayana';

  @override
  String get markAllAsRead => 'Cirian kabéh geus dibaca';

  @override
  String get notificationMarkedRead => 'Bewara ditandaan salaku dibaca';

  @override
  String get failedToLoadNotifications => 'Gagal ngamuat béwara';

  @override
  String get failedToMarkRead => 'Gagal ditandaan salaku dibaca';

  @override
  String get failedToMarkAllRead => 'Gagal nyirian sadayana janten dibaca';

  @override
  String get socketConnected => 'Socket disambungkeun';

  @override
  String get socketDisconnected => 'Stop kontak dipegatkeun';

  @override
  String get newNotificationReceived => 'Bewara anyar nampi';

  @override
  String get generalCategory => 'Umum';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Obrolan';

  @override
  String get systemCategory => 'Sistim';

  @override
  String get updateCategory => 'Pembaruan';

  @override
  String get howToAskTitle => 'Kumaha Naroskeun';

  @override
  String get noQuestionsAvailable => 'Taya patarosan sadia';

  @override
  String get failedToLoadQuestions => 'Gagal ngamuat patarosan';

  @override
  String get pullToRefresh => 'Tarik pikeun nyegerkeun';

  @override
  String get careerCategory => 'Karir';

  @override
  String get loveCategory => 'Cinta & Hubungan';

  @override
  String get healthCategory => 'Kaséhatan';

  @override
  String get financeCategory => 'Keuangan';

  @override
  String get familyCategory => 'Kulawarga';

  @override
  String get educationCategory => 'Atikan';

  @override
  String get travelCategory => 'Lalampahan';

  @override
  String get spiritualCategory => 'Rohani';

  @override
  String get profileLoaded => 'Propil junun dimuat';

  @override
  String get imageUploaded => 'Gambar suksés diunggah';

  @override
  String get savedInformationConfirmation => 'Kuring Nyimpen Inpormasi Ieu';

  @override
  String get noHistoryAvailable => 'Taya sajarah sadia';

  @override
  String get missingUserIdError => 'ID pamaké diperlukeun';

  @override
  String get networkError => 'Kasalahan jaringan. Mangga cobian deui.';

  @override
  String get timeoutError => 'Paménta waktos kaluar';

  @override
  String get genericError => 'Aya nu lepat';

  @override
  String get reactionUpdateError => 'Gagal ngapdet réaksi';

  @override
  String get noSearchResults => 'Teu kapanggih hasil teangan';

  @override
  String get clearSearch => 'Hapus pilarian';

  @override
  String get resultsFound => 'Hasil kapanggih';

  @override
  String get recoverySecretHint =>
      'Salin-témpél moal jalan, ngetik sacara manual';

  @override
  String get recoverAccountDescription =>
      'Turutan lengkah ieu pikeun cageur akun anjeun';

  @override
  String get processingLabel => 'Ngolah...';

  @override
  String get clearChatSuccess => 'Obrolan suksés dipupus';

  @override
  String get notificationsEnabled => 'Bewara diaktipkeun';

  @override
  String get notificationsDisabled => 'Bewara ditumpurkeun';

  @override
  String get securityNotice =>
      'Data anjeun énkripsi sareng disimpen sacara aman';

  @override
  String get loading => 'Ngamuat...';

  @override
  String get selectLanguage => 'Pilih Basa';

  @override
  String get onboardingGetStartedDesc => 'Mimitian ku milih basa anjeun';

  @override
  String get accountRecoveryTitle => '🔐 Rincian Pamulihan Akun';

  @override
  String get recoveryInstructions =>
      'Mangga simpen inpo ieu aman. Anjeun peryogi éta pikeun ngabalikeun akun anjeun.';

  @override
  String get importantNotice => '⚠️ Penting:';

  @override
  String get astrologerProfileTitle => 'Astrologer Propil';

  @override
  String get personalAstrologer => 'Astrologer pribadi';

  @override
  String get makePersonalAstrologer => 'Jieun Astrologer Pribadi';

  @override
  String get favoriteDescription =>
      'Patarosan anjeun bakal diprioritaskeun ka ahli nujum ieu. Upami henteu sayogi, ahli nujum mumpuni sanés bakal ngabantosan anjeun.';

  @override
  String get educationQualifications => 'Atikan & Kualifikasi';

  @override
  String get aboutSection => 'Ngeunaan';

  @override
  String get shareProfile => 'Bagikeun Propil';

  @override
  String get loadingAstrologer => 'Ngamuat rinci astrologer...';

  @override
  String get failedToLoadAstrologer => 'Gagal ngamuat rinci astrologer';

  @override
  String get authenticationRequired => 'Auténtikasi diperlukeun. Mangga lebet.';

  @override
  String securityCheckFailed(Object error) {
    return 'Pamariksaan kaamanan gagal: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ayeuna mangrupikeun Astrologer Pribadi anjeun';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Ngahapus $name tina paporit';
  }

  @override
  String get toggleFavoriteError => 'Gagal ngapdet status paporit';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Atikan: $education\n📜 Kualifikasi: $qualification\n⏳ Pangalaman: $experience';
  }

  @override
  String get notProvided => 'Teu disadiakeun';

  @override
  String reviews(Object count) {
    return '($count ulasan)';
  }

  @override
  String get specialties => 'Spésialisasi';

  @override
  String get experience => 'Pangalaman';

  @override
  String get qualification => 'Kualifikasi';

  @override
  String get education => 'Atikan';

  @override
  String get recoveryTips =>
      '• Candak Potret layar inpormasi ieu\n• Simpen dina tempat anu aman\n• Ulah babagi jeung saha\n• Ieu ngan bakal ditémbongkeun sakali';
}
