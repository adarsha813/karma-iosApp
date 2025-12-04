// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get settingsTitle => 'tetapan';

  @override
  String get notificationSettings => 'Tetapan Pemberitahuan';

  @override
  String get privacySettings => 'Tetapan Privasi';

  @override
  String get accountSettings => 'Tetapan Akaun';

  @override
  String get languageSettings => 'Tetapan Bahasa';

  @override
  String get languageChanged => 'Bahasa berubah';

  @override
  String get existingUserButton => 'Saya pengguna sedia ada';

  @override
  String get chooseCountryTitle => 'Pilih Negara';

  @override
  String get yesText => 'ya';

  @override
  String get noText => 'Tidak';

  @override
  String get appBarTitle => 'Tetapan Profil';

  @override
  String get userIdLabel => 'ID Pengguna *';

  @override
  String get nameLabel => 'Nama';

  @override
  String get birthCountryLabel => 'Negara Kelahiran';

  @override
  String get birthCityLabel => 'Kota Kelahiran';

  @override
  String get countrySelectionTitle => 'Pilih negara anda';

  @override
  String get maleLabel => 'jantan';

  @override
  String get femaleLabel => 'perempuan';

  @override
  String get birthDateLabel => 'Tarikh Lahir';

  @override
  String get birthDatePlaceholder => 'Pilih Tarikh Lahir';

  @override
  String get birthTimeLabel => 'Masa Kelahiran';

  @override
  String get birthTimePlaceholder => 'Pilih Masa Lahir';

  @override
  String get saveProfileButton => 'Simpan Profil';

  @override
  String get noCitiesFound => 'Tiada bandar ditemui';

  @override
  String cityPlaceholder(Object country) {
    return 'Masukkan bandar dalam $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pilih negara dahulu';

  @override
  String get versionHistoryTitle => 'Sejarah Versi';

  @override
  String get notSetText => 'Tidak ditetapkan';

  @override
  String nameHistory(Object name) {
    return 'Nama: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Bandar: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Negara: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Jantina: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Tarikh Lahir: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Masa Lahir: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokasi: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zon waktu: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Keadaan: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Dikemas kini pada $date';
  }

  @override
  String get userIdRequired => 'ID pengguna diperlukan';

  @override
  String get profileSaved => 'Profil berjaya disimpan';

  @override
  String get saveFailed => 'Gagal menyimpan profil';

  @override
  String get errorPrefix => 'Ralat:';

  @override
  String get onboardingChooseLanguage => 'Pilih Bahasa Anda';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pilih bahasa pilihan anda untuk meneruskan.';

  @override
  String get onboardingWhatIsAstrology => 'Apa itu Astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi ialah kajian purba tentang pergerakan cakerawala dan pengaruhnya terhadap kehidupan manusia, menawarkan pandangan tentang keperibadian, perhubungan dan peristiwa kehidupan.';

  @override
  String get onboardingWhyUseApp => 'Mengapa Menggunakan Apl Ini?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Terima horoskop yang tepat dan dijana manusia dan panduan yang disesuaikan dengan carta kelahiran anda. Buat keputusan termaklum dengan ramalan harian dan nasihat peribadi daripada ahli nujum berpengalaman.';

  @override
  String get onboardingHowToUse => 'Bagaimana untuk Menggunakan Apl Ini?';

  @override
  String get onboardingHowToUseDesc =>
      'Hanya masukkan tarikh lahir anda, masa tepat, tempat lahir dan sebarang butiran lain yang berkaitan untuk bermula serta-merta. Terokai horoskop harian, tanya soalan kepada ahli nujum pakar dan urus profil anda untuk ramalan yang tepat dan diperibadikan—tiada log masuk diperlukan.';

  @override
  String get onboardingGetStarted => 'Mulakan';

  @override
  String get onboardingNewUser => 'Pengguna Baru';

  @override
  String get onboardingExistingUser => 'Pengguna Sedia Ada';

  @override
  String get onboardingBack => 'belakang';

  @override
  String get onboardingNext => 'Seterusnya';

  @override
  String get userIdNotFound =>
      'ID pengguna tidak ditemui. Sila log masuk atau tetapkan profil anda.';

  @override
  String get clearNotificationsTitle => 'Kosongkan Pemberitahuan';

  @override
  String get clearNotificationsMessage =>
      'Adakah anda pasti mahu mengosongkan semua pemberitahuan?';

  @override
  String get clearNotificationsSuccess =>
      'Semua pemberitahuan berjaya dipadamkan.';

  @override
  String get clearHoroscopeTitle => 'Horoskop yang jelas';

  @override
  String get clearHoroscopeMessage =>
      'Adakah anda pasti mahu mengosongkan data horoskop anda?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop berjaya dipadamkan.';

  @override
  String get clearChatTitle => 'Kosongkan Sejarah Sembang';

  @override
  String get clearChatMessage =>
      'Adakah anda pasti mahu memadamkan semua sejarah sembang anda?';

  @override
  String get clearChatLocal => 'Sembang dikosongkan secara setempat.';

  @override
  String get deleteAccountTitle => 'Padam Akaun';

  @override
  String get deleteAccountMessage =>
      'Adakah anda pasti mahu memadamkan akaun anda? Ini juga akan mengosongkan semua sejarah sembang dan pemberitahuan anda.';

  @override
  String get deleteAccountSuccess =>
      'Akaun anda dan semua data telah dialih keluar.';

  @override
  String get deleteAccountError => 'Ralat memadam akaun';

  @override
  String get logoutTitle => 'Log keluar';

  @override
  String get logoutMessage => 'Adakah anda pasti mahu log keluar?';

  @override
  String get termsPrivacyTitle => 'Terma & Privasi';

  @override
  String get privacyPolicyTitle => 'Dasar Privasi';

  @override
  String get termsConditionsTitle => 'Terma & Syarat';

  @override
  String get dataControlTitle => 'Kawalan Data';

  @override
  String get cancelButton => 'Batal';

  @override
  String get confirmButton => 'sahkan';

  @override
  String get clearQuestionsSuccess => 'Semua soalan berjaya dipadamkan.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tuhan';

  @override
  String get startLabel => 'Mulakan';

  @override
  String get recoverAccount => 'Pulihkan Akaun';

  @override
  String get endLabel => 'tamat';

  @override
  String get startDateLabel => 'Tarikh Mula';

  @override
  String get endDateLabel => 'Tarikh Tamat';

  @override
  String get notAvailable => 'Tidak tersedia';

  @override
  String get noData => 'Tiada data';

  @override
  String get unknownError => 'Ralat tidak diketahui';

  @override
  String get retryButton => 'Cuba semula';

  @override
  String get kundaliGeneratorTitle => 'Penjana Kundali';

  @override
  String get natalChartTitle => 'Carta Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Darjah Kebesaran';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Tidak diketahui';

  @override
  String get clearHoroscope => 'Horoskop yang jelas';

  @override
  String get clearNotifications => 'Kosongkan Pemberitahuan';

  @override
  String get clearChatHistory => 'Kosongkan Sejarah Sembang';

  @override
  String get logout => 'Log keluar';

  @override
  String get deleteAccount => 'Padam Akaun';

  @override
  String get allFieldsRequired => 'Semua medan diperlukan.';

  @override
  String get accountRecoveredSuccess => 'Akaun berjaya dipulihkan.';

  @override
  String get recoveryFailed => 'Pemulihan gagal. Semak maklumat anda.';

  @override
  String get recoverySecretLabel => 'Rahsia Pemulihan:';

  @override
  String get aboutUsTitle => 'Tentang Kami';

  @override
  String get aboutOurCompany => 'Mengenai Syarikat Kami';

  @override
  String get aboutCompanyDescription =>
      'Di Karma, kami membantu anda mendedahkan laluan kehidupan sebenar anda melalui kebijaksanaan astrologi Veda yang abadi. Setiap cerapan datang daripada ahli nujum sebenar yang berpengalaman, direka dengan teliti berdasarkan carta kelahiran unik anda. Daripada horoskop harian kepada bimbingan yang diperibadikan, Karma menjadikan pengetahuan purba boleh diakses dalam lebih 100 bahasa.';

  @override
  String get ourMission => 'Misi Kami';

  @override
  String get missionDescription =>
      'Misi kami adalah mudah: untuk menyediakan panduan astrologi yang tulen dan diterajui manusia yang memperkasakan anda untuk membuat keputusan yang yakin dan termaklum. Setiap ramalan dan perundingan mencerminkan kepakaran profesional selama bertahun-tahun, bukan algoritma automatik.';

  @override
  String get ourVision => 'Visi Kami';

  @override
  String get visionDescription =>
      'Kami berusaha untuk menjadi platform paling dipercayai di dunia untuk astrologi Veda, membantu orang di mana-mana memahami diri mereka, pilihan mereka dan perjalanan hidup mereka dengan jelas dan yakin.';

  @override
  String get ourValues => 'Nilai Kami';

  @override
  String get valuesDescription =>
      'Di Karma, kami menghargai keaslian, ketepatan dan kepercayaan. Kami komited untuk menawarkan bimbingan yang bukan sahaja tepat tetapi juga bermakna, membantu anda mengharungi kehidupan dengan wawasan dan keyakinan.';

  @override
  String get contactUs => 'Hubungi Kami';

  @override
  String get contactEmail => 'E-mel: support@yourcompany.com';

  @override
  String get contactWebsite => 'laman web: www.yourcompany.com';

  @override
  String get customerSupport => 'Sokongan Pelanggan';

  @override
  String get supportHeroTitle => 'Kami Sedia untuk Membantu';

  @override
  String get supportHeroDescription =>
      'Isi borang di bawah dan pasukan sokongan kami akan menghubungi anda secepat mungkin.';

  @override
  String get yourName => 'Nama awak';

  @override
  String get yourEmail => 'E-mel anda';

  @override
  String get message => 'Mesej';

  @override
  String get enterEmail => 'Masukkan e-mel anda';

  @override
  String get enterValidEmail => 'Masukkan alamat e-mel yang sah';

  @override
  String enterField(Object fieldName) {
    return 'Masukkan $fieldName';
  }

  @override
  String get send => 'Hantar';

  @override
  String get sending => 'Menghantar...';

  @override
  String get emailSentSuccess => '✅ E-mel berjaya dihantar!';

  @override
  String get emailSendFailed => '❌ Gagal menghantar e-mel';

  @override
  String get astroDictionaryTitle => 'Kamus Astro';

  @override
  String get searchTermsHint => 'Istilah carian...';

  @override
  String get noTermsFound => 'Tiada istilah ditemui';

  @override
  String get buyQuestionsTitle => 'Beli Soalan';

  @override
  String get userNotAuthenticated => 'Pengguna tidak disahkan';

  @override
  String get loadStoreDataFailed => 'Gagal memuatkan data kedai';

  @override
  String get missingAuthToken => 'Token pengesahan tiada';

  @override
  String get merchantDisplayName => 'Aplikasi Sembang Astro';

  @override
  String get paymentSuccessful => '✅ Pembayaran berjaya! Soalan dihantar';

  @override
  String paymentFailed(Object error) {
    return '❌ Pembayaran gagal: $error';
  }

  @override
  String get yourBalance => 'Baki Anda';

  @override
  String questionsBalance(Object count) {
    return '$count Soalan';
  }

  @override
  String get availableOffers => 'Tawaran Tersedia';

  @override
  String questionsCount(Object count) {
    return '$count Soalan';
  }

  @override
  String get buyButton => 'Beli';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoskop Harian';

  @override
  String get userIdMissing => 'ID pengguna tiada';

  @override
  String get fetchHoroscopesFailed => 'Gagal mengambil horoskop';

  @override
  String get noHoroscopeFound => 'Tiada horoskop ditemui.';

  @override
  String get signLabel => 'Tanda';

  @override
  String get todayLabel => 'Hari ini';

  @override
  String get yesterdayLabel => 'Semalam';

  @override
  String get thisWeekLabel => 'Minggu ini';

  @override
  String get lastMonthLabel => 'Bulan lepas';

  @override
  String get chatTitle => 'Sembang';

  @override
  String get typeYourQuestionHint => 'Taip soalan anda...';

  @override
  String get paymentRequired => 'Pembayaran Diperlukan';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Anda telah menggunakan soalan percuma anda. Bayar $amount untuk meneruskan.';
  }

  @override
  String get payNowButton => 'Bayar Sekarang';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count baki soalan percuma';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count baki soalan berbayar';
  }

  @override
  String get thankYouFeedback => 'Terima kasih atas maklum balas anda!';

  @override
  String get ratingSubmitted => 'Penilaian diserahkan!';

  @override
  String get setUserIdFirst => 'Sila tetapkan ID Pengguna anda dahulu';

  @override
  String get failedToFetchPrevious =>
      'Gagal mengambil soalan dan jawapan sebelumnya';

  @override
  String errorOccurred(Object error) {
    return 'Ralat: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoskop Harian';

  @override
  String get drawerBuyQuestions => 'Beli Soalan';

  @override
  String get drawerAstroDictionary => 'Kamus Astro';

  @override
  String get drawerSettings => 'tetapan';

  @override
  String get drawerCustomerSupport => 'Sokongan Pelanggan';

  @override
  String get drawerAbout => 'Tentang';

  @override
  String get drawerProfileSettings => 'Tetapan Profil';

  @override
  String get demoNotificationTitle => '🔔 Pemberitahuan Demo';

  @override
  String get demoNotificationBody =>
      'Ini ialah pemberitahuan ujian daripada apl anda!';

  @override
  String get notificationsTitle => 'Pemberitahuan';

  @override
  String get noNotifications => 'Tiada pemberitahuan';

  @override
  String get allTab => 'Semua';

  @override
  String get markAllAsRead => 'Tandai semua sebagai dibaca';

  @override
  String get notificationMarkedRead => 'Pemberitahuan ditanda sebagai dibaca';

  @override
  String get failedToLoadNotifications => 'Gagal memuatkan pemberitahuan';

  @override
  String get failedToMarkRead => 'Gagal menandai sebagai dibaca';

  @override
  String get failedToMarkAllRead => 'Gagal menandai semua sebagai dibaca';

  @override
  String get socketConnected => 'Soket disambungkan';

  @override
  String get socketDisconnected => 'Soket terputus';

  @override
  String get newNotificationReceived => 'Pemberitahuan baharu diterima';

  @override
  String get generalCategory => 'Umum';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Sembang';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Kemas kini';

  @override
  String get howToAskTitle => 'Bagaimana Untuk Bertanya';

  @override
  String get noQuestionsAvailable => 'Tiada soalan tersedia';

  @override
  String get failedToLoadQuestions => 'Gagal memuatkan soalan';

  @override
  String get pullToRefresh => 'Tarik untuk menyegarkan';

  @override
  String get careerCategory => 'Kerjaya';

  @override
  String get loveCategory => 'Cinta & Hubungan';

  @override
  String get healthCategory => 'Kesihatan';

  @override
  String get financeCategory => 'Kewangan';

  @override
  String get familyCategory => 'Keluarga';

  @override
  String get educationCategory => 'Pendidikan';

  @override
  String get travelCategory => 'Perjalanan';

  @override
  String get spiritualCategory => 'rohaniah';

  @override
  String get profileLoaded => 'Profil berjaya dimuatkan';

  @override
  String get imageUploaded => 'Imej berjaya dimuat naik';

  @override
  String get savedInformationConfirmation =>
      'Saya telah Menyimpan Maklumat Ini';

  @override
  String get noHistoryAvailable => 'Tiada sejarah tersedia';

  @override
  String get missingUserIdError => 'ID pengguna diperlukan';

  @override
  String get networkError => 'Ralat rangkaian. Sila cuba lagi.';

  @override
  String get timeoutError => 'Permintaan tamat masa';

  @override
  String get genericError => 'Sesuatu telah berlaku';

  @override
  String get reactionUpdateError => 'Gagal mengemas kini reaksi';

  @override
  String get noSearchResults => 'Tiada hasil carian ditemui';

  @override
  String get clearSearch => 'Kosongkan carian';

  @override
  String get resultsFound => 'Keputusan ditemui';

  @override
  String get recoverySecretHint =>
      'Salin-tampal mungkin tidak berfungsi, taip secara manual';

  @override
  String get recoverAccountDescription =>
      'Ikuti langkah ini untuk memulihkan akaun anda';

  @override
  String get processingLabel => 'Memproses...';

  @override
  String get clearChatSuccess => 'Sembang berjaya dipadamkan';

  @override
  String get notificationsEnabled => 'Pemberitahuan didayakan';

  @override
  String get notificationsDisabled => 'Pemberitahuan dilumpuhkan';

  @override
  String get securityNotice =>
      'Data anda disulitkan dan disimpan dengan selamat';

  @override
  String get loading => 'Memuatkan...';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get onboardingGetStartedDesc => 'Mulakan dengan memilih bahasa anda';

  @override
  String get accountRecoveryTitle => '🔐 Butiran Pemulihan Akaun';

  @override
  String get recoveryInstructions =>
      'Sila simpan maklumat ini dengan selamat. Anda memerlukannya untuk memulihkan akaun anda.';

  @override
  String get importantNotice => '⚠️ Penting:';

  @override
  String get astrologerProfileTitle => 'Profil Ahli nujum';

  @override
  String get personalAstrologer => 'Ahli nujum peribadi';

  @override
  String get makePersonalAstrologer => 'Jadikan Ahli Nujum Peribadi';

  @override
  String get favoriteDescription =>
      'Soalan anda akan diutamakan kepada ahli nujum ini. Jika tidak tersedia, ahli astrologi lain yang berkelayakan akan membantu anda.';

  @override
  String get educationQualifications => 'Pendidikan & Kelayakan';

  @override
  String get aboutSection => 'Tentang';

  @override
  String get shareProfile => 'Kongsi Profil';

  @override
  String get loadingAstrologer => 'Memuatkan butiran ahli nujum...';

  @override
  String get failedToLoadAstrologer => 'Gagal memuatkan butiran ahli nujum';

  @override
  String get authenticationRequired => 'Pengesahan diperlukan. Sila log masuk.';

  @override
  String securityCheckFailed(Object error) {
    return 'Pemeriksaan keselamatan gagal: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name kini ialah Ahli Nujum Peribadi anda';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Mengalih keluar $name daripada kegemaran';
  }

  @override
  String get toggleFavoriteError => 'Gagal mengemas kini status kegemaran';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Pendidikan: $education\n📜 Kelayakan: $qualification\n⏳ Pengalaman: $experience';
  }

  @override
  String get notProvided => 'Tidak disediakan';

  @override
  String reviews(Object count) {
    return '($count ulasan)';
  }

  @override
  String get specialties => 'Kepakaran';

  @override
  String get experience => 'Pengalaman';

  @override
  String get qualification => 'Kelayakan';

  @override
  String get education => 'Pendidikan';

  @override
  String get recoveryTips =>
      '• Ambil tangkapan skrin maklumat ini\n• Simpan di tempat yang selamat\n• Jangan berkongsi dengan sesiapa\n• Ini hanya akan ditunjukkan sekali';

  @override
  String get themeSettingsTitle => 'Tetapan Tema';

  @override
  String get lightThemeLabel => 'Cahaya';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Gelap';

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
  String get ourTeam => 'Pasukan Kami';

  @override
  String get teamDescription =>
      'Pasukan ahli nujum Veda profesional kami membawa pengalaman bertahun-tahun mentafsir pengaruh planet dan corak kehidupan. Disokong oleh pasukan sokongan dan pembangunan yang berdedikasi, Karma memberikan pengalaman yang lancar, boleh dipercayai dan global untuk setiap pengguna.';
}
