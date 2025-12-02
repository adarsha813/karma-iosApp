// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Javanese (`jv`).
class AppLocalizationsJv extends AppLocalizations {
  AppLocalizationsJv([String locale = 'jv']) : super(locale);

  @override
  String get settingsTitle => 'Setelan';

  @override
  String get notificationSettings => 'Setelan Notifikasi';

  @override
  String get privacySettings => 'Setelan Privasi';

  @override
  String get accountSettings => 'Setelan akun';

  @override
  String get languageSettings => 'Setelan Basa';

  @override
  String get languageChanged => 'Basa diganti';

  @override
  String get existingUserButton => 'Aku pangguna sing wis ana';

  @override
  String get chooseCountryTitle => 'Pilih Negara';

  @override
  String get yesText => 'ya wis';

  @override
  String get noText => 'Ora';

  @override
  String get appBarTitle => 'Setelan Profil';

  @override
  String get userIdLabel => 'ID pangguna *';

  @override
  String get nameLabel => 'jeneng';

  @override
  String get birthCountryLabel => 'Negara Lahir';

  @override
  String get birthCityLabel => 'Kutha Lair';

  @override
  String get countrySelectionTitle => 'Pilih negara sampeyan';

  @override
  String get maleLabel => 'lanang';

  @override
  String get femaleLabel => 'wadon';

  @override
  String get birthDateLabel => 'Tanggal Lair';

  @override
  String get birthDatePlaceholder => 'Pilih Tanggal Lahir';

  @override
  String get birthTimeLabel => 'Wektu Lair';

  @override
  String get birthTimePlaceholder => 'Pilih Wektu Lair';

  @override
  String get saveProfileButton => 'Simpen Profil';

  @override
  String get noCitiesFound => 'Ora ana kutha sing ditemokake';

  @override
  String cityPlaceholder(Object country) {
    return 'Ketik kutha ing $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pilih negara pisanan';

  @override
  String get versionHistoryTitle => 'Riwayat versi';

  @override
  String get notSetText => 'Ora disetel';

  @override
  String nameHistory(Object name) {
    return 'Jeneng: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Kutha: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Negara: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jenis Kelamin: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tanggal Lahir: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Wektu Lahir: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokasi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zona wektu: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Status: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Dianyari ing $date';
  }

  @override
  String get userIdRequired => 'ID pangguna dibutuhake';

  @override
  String get profileSaved => 'Profil kasil disimpen';

  @override
  String get saveFailed => 'Gagal nyimpen profil';

  @override
  String get errorPrefix => 'kesalahan:';

  @override
  String get onboardingChooseLanguage => 'Pilih Basa Sampeyan';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pilih basa sing disenengi kanggo nerusake.';

  @override
  String get onboardingWhatIsAstrology => 'Apa Astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi minangka studi babagan benda langit ...';

  @override
  String get onboardingWhyUseApp => 'Apa nggunakake app iki?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Entuk horoskop pribadi, ramalan saben dina, lan tuntunan kanggo nggawe keputusan sing tepat.';

  @override
  String get onboardingHowToUse => 'Kepiye cara nggunakake aplikasi iki?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigasi kanthi gampang, priksa horoskop saben dina, lan atur profil kanggo ramalan sing akurat.';

  @override
  String get onboardingGetStarted => 'Miwiti';

  @override
  String get onboardingNewUser => 'Panganggo anyar';

  @override
  String get onboardingExistingUser => 'Pangguna sing ana';

  @override
  String get onboardingBack => 'Mbalik';

  @override
  String get onboardingNext => 'Sabanjure';

  @override
  String get userIdNotFound =>
      'ID pangguna ora ditemokake. Mangga mlebu utawa nyetel profil sampeyan.';

  @override
  String get clearNotificationsTitle => 'Clear Notifikasi';

  @override
  String get clearNotificationsMessage =>
      'Apa sampeyan yakin pengin mbusak kabeh kabar?';

  @override
  String get clearNotificationsSuccess => 'Kabeh kabar kasil dibusak.';

  @override
  String get clearHoroscopeTitle => 'Horoskop sing cetha';

  @override
  String get clearHoroscopeMessage =>
      'Apa sampeyan yakin pengin mbusak data horoskop?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop kasil dibusak.';

  @override
  String get clearChatTitle => 'Mbusak Sajarah Chat';

  @override
  String get clearChatMessage =>
      'Apa sampeyan yakin pengin mbusak kabeh riwayat obrolan sampeyan?';

  @override
  String get clearChatLocal => 'Obrolan dibusak sacara lokal.';

  @override
  String get deleteAccountTitle => 'Mbusak Akun';

  @override
  String get deleteAccountMessage =>
      'Apa sampeyan yakin arep mbusak akun sampeyan? Iki uga bakal mbusak kabeh riwayat chatting lan kabar.';

  @override
  String get deleteAccountSuccess =>
      'Akun sampeyan lan kabeh data wis dibusak.';

  @override
  String get deleteAccountError => 'Kesalahan mbusak akun';

  @override
  String get logoutTitle => 'logout';

  @override
  String get logoutMessage => 'Apa sampeyan yakin arep logout?';

  @override
  String get termsPrivacyTitle => 'Sarat & Privasi';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get termsConditionsTitle => 'Syarat & Ketentuan';

  @override
  String get dataControlTitle => 'Kontrol Data';

  @override
  String get cancelButton => 'Batal';

  @override
  String get confirmButton => 'Konfirmasi';

  @override
  String get clearQuestionsSuccess => 'Kabeh pitakonan kasil dibusak.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Gusti';

  @override
  String get startLabel => 'Miwiti';

  @override
  String get recoverAccount => 'Waras Akun';

  @override
  String get endLabel => 'Pungkasan';

  @override
  String get startDateLabel => 'Tanggal wiwitan';

  @override
  String get endDateLabel => 'Tanggal pungkasan';

  @override
  String get notAvailable => 'Ora kasedhiya';

  @override
  String get noData => 'Ora ana data';

  @override
  String get unknownError => 'Kesalahan sing ora dingerteni';

  @override
  String get retryButton => 'Coba maneh';

  @override
  String get kundaliGeneratorTitle => 'Generator Kundali';

  @override
  String get natalChartTitle => 'Bagan Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Gelar munggah pangkat';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasa';

  @override
  String get unknown => 'Ora dingerteni';

  @override
  String get clearHoroscope => 'Horoskop sing cetha';

  @override
  String get clearNotifications => 'Clear Notifikasi';

  @override
  String get clearChatHistory => 'Mbusak Sajarah Chat';

  @override
  String get logout => 'logout';

  @override
  String get deleteAccount => 'Mbusak Akun';

  @override
  String get allFieldsRequired => 'Kabeh kolom dibutuhake.';

  @override
  String get accountRecoveredSuccess => 'Akun kasil pulih.';

  @override
  String get recoveryFailed => 'Recovery gagal. Priksa informasi sampeyan.';

  @override
  String get recoverySecretLabel => 'Rahasia Recovery:';

  @override
  String get aboutUsTitle => 'Babagan Kita';

  @override
  String get aboutOurCompany => 'Babagan Perusahaan Kita';

  @override
  String get aboutCompanyDescription =>
      'Kita setya menehi pengalaman astrologi sing paling apik kanggo pangguna.';

  @override
  String get ourMission => 'Misi Kita';

  @override
  String get missionDescription =>
      'Kanggo nyedhiyakake wawasan astrologi sing akurat lan khusus kanggo mbantu pangguna nggawe keputusan sing tepat ing urip.';

  @override
  String get ourVision => 'Visi Kita';

  @override
  String get visionDescription =>
      'Kanggo dadi platform astrologi sing paling dipercaya, nggabungake teknologi lan kawicaksanan kuna.';

  @override
  String get ourValues => 'Nilai Kita';

  @override
  String get valuesDescription =>
      'Integritas, Akurasi, Desain Sentris Panganggo, lan Inovasi Terus-terusan.';

  @override
  String get contactUs => 'Hubungi Kita';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Situs web: www.perusahaananda.com';

  @override
  String get customerSupport => 'Dhukungan Pelanggan';

  @override
  String get supportHeroTitle => 'Kita kene kanggo mbantu';

  @override
  String get supportHeroDescription =>
      'Isi formulir ing ngisor iki lan tim dhukungan bakal bali menyang sampeyan sanalika bisa.';

  @override
  String get yourName => 'Jenengmu';

  @override
  String get yourEmail => 'Email Panjenengan';

  @override
  String get message => 'Pesen';

  @override
  String get enterEmail => 'Ketik email sampeyan';

  @override
  String get enterValidEmail => 'Ketik alamat email sing bener';

  @override
  String enterField(Object fieldName) {
    return 'Ketik $fieldName';
  }

  @override
  String get send => 'Ngirim';

  @override
  String get sending => 'Ngirim...';

  @override
  String get emailSentSuccess => '✅ Email kasil dikirim!';

  @override
  String get emailSendFailed => '❌ Gagal ngirim email';

  @override
  String get astroDictionaryTitle => 'Kamus Astro';

  @override
  String get searchTermsHint => 'Golek istilah...';

  @override
  String get noTermsFound => 'Ora ana istilah sing ditemokake';

  @override
  String get buyQuestionsTitle => 'Tuku Pitakonan';

  @override
  String get userNotAuthenticated => 'Pangguna ora dikonfirmasi';

  @override
  String get loadStoreDataFailed => 'Gagal mbukak data nyimpen';

  @override
  String get missingAuthToken => 'Token otentik ilang';

  @override
  String get merchantDisplayName => 'Aplikasi Astro Chat';

  @override
  String get paymentSuccessful => '✅ Pembayaran sukses! Pitakonan dikirim';

  @override
  String paymentFailed(Object error) {
    return '❌ Pembayaran gagal: $error';
  }

  @override
  String get yourBalance => 'Balance Panjenengan';

  @override
  String questionsBalance(Object count) {
    return '$count Pitakonan';
  }

  @override
  String get availableOffers => 'Nawakake kasedhiya';

  @override
  String questionsCount(Object count) {
    return '$count Pitakonan';
  }

  @override
  String get buyButton => 'tuku';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoskop saben dina';

  @override
  String get userIdMissing => 'ID pangguna ilang';

  @override
  String get fetchHoroscopesFailed => 'Gagal njupuk horoskop';

  @override
  String get noHoroscopeFound => 'Ora ana horoskop sing ditemokake.';

  @override
  String get signLabel => 'mlebu';

  @override
  String get todayLabel => 'Dina iki';

  @override
  String get yesterdayLabel => 'wingi';

  @override
  String get thisWeekLabel => 'Minggu iki';

  @override
  String get lastMonthLabel => 'Wulan kepungkur';

  @override
  String get chatTitle => 'Ngobrol';

  @override
  String get typeYourQuestionHint => 'Ketik pitakonan sampeyan...';

  @override
  String get paymentRequired => 'Pembayaran dibutuhake';

  @override
  String get paymentRequiredMessage =>
      'Sampeyan wis nggunakake pitakonan gratis. Mbayar ₹50 kanggo nerusake.';

  @override
  String get payNowButton => 'Bayar Saiki';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count isih ana pitakonan gratis';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count isih ana pitakonan mbayar';
  }

  @override
  String get thankYouFeedback => 'Matur nuwun kanggo saran!';

  @override
  String get ratingSubmitted => 'Rating diajukake!';

  @override
  String get setUserIdFirst => 'Setel ID pangguna dhisik';

  @override
  String get failedToFetchPrevious =>
      'Gagal njupuk pitakonan lan jawaban sadurunge';

  @override
  String errorOccurred(Object error) {
    return 'Kasalahan: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astro Kab';

  @override
  String get drawerDailyHoroscope => 'Horoskop saben dina';

  @override
  String get drawerBuyQuestions => 'Tuku Pitakonan';

  @override
  String get drawerAstroDictionary => 'Kamus Astro';

  @override
  String get drawerSettings => 'Setelan';

  @override
  String get drawerCustomerSupport => 'Dhukungan Pelanggan';

  @override
  String get drawerAbout => 'Babagan';

  @override
  String get drawerProfileSettings => 'Setelan Profil';

  @override
  String get demoNotificationTitle => '🔔 Notifikasi Demo';

  @override
  String get demoNotificationBody =>
      'Iki minangka kabar tes saka app sampeyan!';

  @override
  String get notificationsTitle => 'Kabar';

  @override
  String get noNotifications => 'Ora ana kabar';

  @override
  String get allTab => 'Kabeh';

  @override
  String get markAllAsRead => 'Tandhani kabeh minangka diwaca';

  @override
  String get notificationMarkedRead => 'Notifikasi ditandhani minangka diwaca';

  @override
  String get failedToLoadNotifications => 'Gagal mbukak kabar';

  @override
  String get failedToMarkRead => 'Gagal menehi tandha minangka diwaca';

  @override
  String get failedToMarkAllRead => 'Gagal menehi tandha kabeh wis diwaca';

  @override
  String get socketConnected => 'Soket disambungake';

  @override
  String get socketDisconnected => 'Soket pedhot';

  @override
  String get newNotificationReceived => 'Kabar anyar ditampa';

  @override
  String get generalCategory => 'Umum';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Ngobrol';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Nganyari';

  @override
  String get howToAskTitle => 'Carane Takon';

  @override
  String get noQuestionsAvailable => 'Ora ana pitakonan sing kasedhiya';

  @override
  String get failedToLoadQuestions => 'Gagal mbukak pitakonan';

  @override
  String get pullToRefresh => 'Tarik kanggo refresh';

  @override
  String get careerCategory => 'Karir';

  @override
  String get loveCategory => 'Katresnan & Hubungan';

  @override
  String get healthCategory => 'kesehatan';

  @override
  String get financeCategory => 'Keuangan';

  @override
  String get familyCategory => 'kulawarga';

  @override
  String get educationCategory => 'Pendidikan';

  @override
  String get travelCategory => 'Lelungan';

  @override
  String get spiritualCategory => 'spiritual';

  @override
  String get profileLoaded => 'Profil kasil dimuat';

  @override
  String get imageUploaded => 'Gambar kasil diunggah';

  @override
  String get savedInformationConfirmation => 'Aku wis nyimpen informasi iki';

  @override
  String get noHistoryAvailable => 'Ora ana riwayat sing kasedhiya';

  @override
  String get missingUserIdError => 'ID pangguna dibutuhake';

  @override
  String get networkError => 'Kesalahan jaringan. Coba maneh.';

  @override
  String get timeoutError => 'Panjaluk wis entek';

  @override
  String get genericError => 'Ana sing salah';

  @override
  String get reactionUpdateError => 'Gagal nganyari reaksi';

  @override
  String get noSearchResults => 'Ora ana asil panelusuran sing ditemokake';

  @override
  String get clearSearch => 'Mbusak panelusuran';

  @override
  String get resultsFound => 'Asil ditemokake';

  @override
  String get recoverySecretHint =>
      'Salin-tempel bisa uga ora bisa, ketik kanthi manual';

  @override
  String get recoverAccountDescription =>
      'Tindakake langkah iki kanggo mbalekake akun';

  @override
  String get processingLabel => 'Ngolah...';

  @override
  String get clearChatSuccess => 'Obrolan kasil dibusak';

  @override
  String get notificationsEnabled => 'Kabar diaktifake';

  @override
  String get notificationsDisabled => 'Kabar dipatèni';

  @override
  String get securityNotice =>
      'Data sampeyan dienkripsi lan disimpen kanthi aman';

  @override
  String get loading => 'Loading...';

  @override
  String get selectLanguage => 'Pilih Basa';

  @override
  String get onboardingGetStartedDesc => 'Miwiti kanthi milih basa sampeyan';

  @override
  String get accountRecoveryTitle => '🔐 Rincian Recovery Akun';

  @override
  String get recoveryInstructions =>
      'Mangga simpen informasi iki kanthi aman. Sampeyan perlu kanggo mbalekake akun.';

  @override
  String get importantNotice => '⚠️ Penting:';

  @override
  String get astrologerProfileTitle => 'Profil Astrologer';

  @override
  String get personalAstrologer => 'Astrologer pribadi';

  @override
  String get makePersonalAstrologer => 'Nggawe Astrologer Pribadi';

  @override
  String get favoriteDescription =>
      'Pitakonan sampeyan bakal dadi prioritas kanggo ahli nujum iki. Yen ora kasedhiya, ahli nujum liyane sing mumpuni bakal nulungi sampeyan.';

  @override
  String get educationQualifications => 'Pendidikan & Kualifikasi';

  @override
  String get aboutSection => 'Babagan';

  @override
  String get shareProfile => 'Nuduhake Profil';

  @override
  String get loadingAstrologer => 'Memuat rincian ahli nujum...';

  @override
  String get failedToLoadAstrologer => 'Gagal ngemot rincian ahli nujum';

  @override
  String get authenticationRequired =>
      'Authentication dibutuhake. Mangga mlebu.';

  @override
  String securityCheckFailed(Object error) {
    return 'Priksa keamanan gagal: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name saiki dadi Astrologi Pribadi sampeyan';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Mbusak $name saka favorit';
  }

  @override
  String get toggleFavoriteError => 'Gagal nganyari status favorit';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Pendidikan: $education\n📜 Kualifikasi: $qualification\n⏳ Pengalaman: $experience';
  }

  @override
  String get notProvided => 'Ora kasedhiya';

  @override
  String reviews(Object count) {
    return '($count ulasan)';
  }

  @override
  String get specialties => 'Spesialisasi';

  @override
  String get experience => 'Pengalaman';

  @override
  String get qualification => 'Kualifikasi';

  @override
  String get education => 'Pendidikan';

  @override
  String get recoveryTips =>
      '• Njupuk gambar saka informasi iki\n• Simpen ing panggonan kang aman\n• Aja nuduhake karo sapa wae\n• Iki mung bakal ditampilake sapisan';

  @override
  String get themeSettingsTitle => 'Setelan Tema';

  @override
  String get lightThemeLabel => 'cahya';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'peteng';

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
