// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get notificationSettings => 'Pengaturan Notifikasi';

  @override
  String get privacySettings => 'Pengaturan Privasi';

  @override
  String get accountSettings => 'Pengaturan Akun';

  @override
  String get languageSettings => 'Pengaturan Bahasa';

  @override
  String get languageChanged => 'Bahasa berubah';

  @override
  String get existingUserButton => 'Saya adalah pengguna yang sudah ada';

  @override
  String get chooseCountryTitle => 'Pilih Negara';

  @override
  String get yesText => 'Ya';

  @override
  String get noText => 'TIDAK';

  @override
  String get appBarTitle => 'Pengaturan Profil';

  @override
  String get userIdLabel => 'ID Pengguna *';

  @override
  String get nameLabel => 'Nama';

  @override
  String get birthCountryLabel => 'Negara Kelahiran';

  @override
  String get birthCityLabel => 'Kota Kelahiran';

  @override
  String get countrySelectionTitle => 'Pilih negara Anda';

  @override
  String get maleLabel => 'Pria';

  @override
  String get femaleLabel => 'Perempuan';

  @override
  String get birthDateLabel => 'Tanggal Lahir';

  @override
  String get birthDatePlaceholder => 'Pilih Tanggal Lahir';

  @override
  String get birthTimeLabel => 'Waktu Kelahiran';

  @override
  String get birthTimePlaceholder => 'Pilih Waktu Lahir';

  @override
  String get saveProfileButton => 'Simpan Profil';

  @override
  String get noCitiesFound => 'Tidak ada kota yang ditemukan';

  @override
  String cityPlaceholder(Object country) {
    return 'Masukkan kota di $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pilih negara terlebih dahulu';

  @override
  String get versionHistoryTitle => 'Riwayat Versi';

  @override
  String get notSetText => 'Belum diatur';

  @override
  String nameHistory(Object name) {
    return 'Nama: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Kota: $city';
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
    return 'Waktu Standar Waktu Standar (DST): $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Negara bagian: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Diperbarui pada $date';
  }

  @override
  String get userIdRequired => 'ID Pengguna diperlukan';

  @override
  String get profileSaved => 'Profil berhasil disimpan';

  @override
  String get saveFailed => 'Gagal menyimpan profil';

  @override
  String get errorPrefix => 'Kesalahan:';

  @override
  String get onboardingChooseLanguage => 'Pilih Bahasa Anda';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pilih bahasa yang Anda inginkan untuk melanjutkan.';

  @override
  String get onboardingWhatIsAstrology => 'Apa itu Astrologi?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologi adalah studi kuno tentang pergerakan langit dan pengaruhnya terhadap kehidupan manusia, menawarkan wawasan tentang kepribadian, hubungan, dan peristiwa kehidupan.';

  @override
  String get onboardingWhyUseApp => 'Mengapa Menggunakan Aplikasi Ini?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Dapatkan horoskop akurat buatan manusia dan panduan yang disesuaikan dengan bagan kelahiran Anda. Buat keputusan yang tepat dengan prediksi harian dan saran personal dari para astrolog berpengalaman.';

  @override
  String get onboardingHowToUse => 'Bagaimana Cara Menggunakan Aplikasi Ini?';

  @override
  String get onboardingHowToUseDesc =>
      'Cukup masukkan tanggal lahir, waktu, tempat lahir, dan detail relevan lainnya untuk langsung memulai. Jelajahi horoskop harian, ajukan pertanyaan kepada astrolog ahli, dan kelola profil Anda untuk prediksi akurat dan personal—tanpa perlu login.';

  @override
  String get onboardingGetStarted => 'Memulai';

  @override
  String get onboardingNewUser => 'Pengguna Baru';

  @override
  String get onboardingExistingUser => 'Pengguna yang Ada';

  @override
  String get onboardingBack => 'Kembali';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get userIdNotFound =>
      'ID Pengguna tidak ditemukan. Silakan masuk atau atur profil Anda.';

  @override
  String get clearNotificationsTitle => 'Hapus Notifikasi';

  @override
  String get clearNotificationsMessage =>
      'Apakah Anda yakin ingin menghapus semua notifikasi?';

  @override
  String get clearNotificationsSuccess => 'Semua notifikasi berhasil dihapus.';

  @override
  String get clearHoroscopeTitle => 'Horoskop Jelas';

  @override
  String get clearHoroscopeMessage =>
      'Apakah Anda yakin ingin menghapus data horoskop Anda?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop berhasil dihapus.';

  @override
  String get clearChatTitle => 'Hapus Riwayat Obrolan';

  @override
  String get clearChatMessage =>
      'Apakah Anda yakin ingin menghapus semua riwayat obrolan Anda?';

  @override
  String get clearChatLocal => 'Obrolan dihapus secara lokal.';

  @override
  String get deleteAccountTitle => 'Hapus Akun';

  @override
  String get deleteAccountMessage =>
      'Yakin ingin menghapus akun Anda? Ini juga akan menghapus semua riwayat obrolan dan notifikasi Anda.';

  @override
  String get deleteAccountSuccess => 'Akun dan semua data Anda telah dihapus.';

  @override
  String get deleteAccountError => 'Terjadi kesalahan saat menghapus akun';

  @override
  String get logoutTitle => 'Keluar';

  @override
  String get logoutMessage => 'Apakah Anda yakin ingin keluar?';

  @override
  String get termsPrivacyTitle => 'Syarat & Privasi';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get termsConditionsTitle => 'Syarat & Ketentuan';

  @override
  String get dataControlTitle => 'Kontrol Data';

  @override
  String get cancelButton => 'Membatalkan';

  @override
  String get confirmButton => 'Mengonfirmasi';

  @override
  String get clearQuestionsSuccess => 'Semua pertanyaan berhasil dihapus.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Yang mulia';

  @override
  String get startLabel => 'Awal';

  @override
  String get recoverAccount => 'Pulihkan Akun';

  @override
  String get endLabel => 'Akhir';

  @override
  String get startDateLabel => 'Tanggal Mulai';

  @override
  String get endDateLabel => 'Tanggal Berakhir';

  @override
  String get notAvailable => 'Tidak tersedia';

  @override
  String get noData => 'Tidak ada data';

  @override
  String get unknownError => 'Kesalahan tidak diketahui';

  @override
  String get retryButton => 'Mencoba kembali';

  @override
  String get kundaliGeneratorTitle => 'Pembangkit Kundali';

  @override
  String get natalChartTitle => 'Bagan Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Derajat Ascendant';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Tidak dikenal';

  @override
  String get clearHoroscope => 'Horoskop Jelas';

  @override
  String get clearNotifications => 'Hapus Notifikasi';

  @override
  String get clearChatHistory => 'Hapus Riwayat Obrolan';

  @override
  String get logout => 'Keluar';

  @override
  String get deleteAccount => 'Hapus Akun';

  @override
  String get allFieldsRequired => 'Semua kolom wajib diisi.';

  @override
  String get accountRecoveredSuccess => 'Akun berhasil dipulihkan.';

  @override
  String get recoveryFailed => 'Pemulihan gagal. Periksa informasi Anda.';

  @override
  String get recoverySecretLabel => 'Rahasia Pemulihan:';

  @override
  String get aboutUsTitle => 'Tentang Kami';

  @override
  String get aboutOurCompany => 'Tentang Perusahaan Kami';

  @override
  String get aboutCompanyDescription =>
      'Di Karma, kami membantu Anda mengungkap jalan hidup sejati Anda melalui kebijaksanaan astrologi Weda yang abadi. Setiap wawasan berasal dari para astrolog sejati dan berpengalaman, yang disusun dengan cermat berdasarkan bagan kelahiran unik Anda. Dari horoskop harian hingga panduan personal, Karma menyediakan pengetahuan kuno yang dapat diakses dalam lebih dari 100 bahasa.';

  @override
  String get ourMission => 'Misi Kami';

  @override
  String get missionDescription =>
      'Misi kami sederhana: menyediakan panduan astrologi autentik yang dipandu oleh manusia, yang memberdayakan Anda untuk membuat keputusan yang tepat dan terinformasi. Setiap prediksi dan konsultasi mencerminkan keahlian profesional selama bertahun-tahun, bukan algoritma otomatis.';

  @override
  String get ourVision => 'Visi Kami';

  @override
  String get visionDescription =>
      'Kami berupaya menjadi platform paling tepercaya di dunia untuk astrologi Weda, membantu orang di mana pun memahami diri mereka sendiri, pilihan mereka, dan perjalanan hidup mereka dengan jelas dan percaya diri.';

  @override
  String get ourValues => 'Nilai-nilai Kami';

  @override
  String get valuesDescription =>
      'Di Karma, kami menghargai keaslian, ketepatan, dan kepercayaan. Kami berkomitmen untuk menawarkan panduan yang tidak hanya akurat tetapi juga bermakna, membantu Anda menjalani hidup dengan wawasan dan keyakinan.';

  @override
  String get contactUs => 'Hubungi kami';

  @override
  String get contactEmail => 'Surel: support@perusahaananda.com';

  @override
  String get contactWebsite => 'Situs web: www.perusahaananda.com';

  @override
  String get customerSupport => 'Dukungan Pelanggan';

  @override
  String get supportHeroTitle => 'Kami di sini untuk membantu';

  @override
  String get supportHeroDescription =>
      'Isi formulir di bawah ini dan tim dukungan kami akan segera menghubungi Anda.';

  @override
  String get yourName => 'Nama Anda';

  @override
  String get yourEmail => 'Email Anda';

  @override
  String get message => 'Pesan';

  @override
  String get enterEmail => 'Masukkan email Anda';

  @override
  String get enterValidEmail => 'Masukkan alamat email yang valid';

  @override
  String enterField(Object fieldName) {
    return 'Masukkan $fieldName';
  }

  @override
  String get send => 'Mengirim';

  @override
  String get sending => 'Mengirim...';

  @override
  String get emailSentSuccess => '✅ Email berhasil terkirim!';

  @override
  String get emailSendFailed => '❌ Gagal mengirim email';

  @override
  String get astroDictionaryTitle => 'Kamus Astro';

  @override
  String get searchTermsHint => 'Istilah pencarian...';

  @override
  String get noTermsFound => 'Tidak ada istilah yang ditemukan';

  @override
  String get buyQuestionsTitle => 'Pertanyaan Pembelian';

  @override
  String get userNotAuthenticated => 'Pengguna tidak diautentikasi';

  @override
  String get loadStoreDataFailed => 'Gagal memuat data toko';

  @override
  String get missingAuthToken => 'Token autentikasi hilang';

  @override
  String get merchantDisplayName => 'Aplikasi Obrolan Astro';

  @override
  String get paymentSuccessful => '✅ Pembayaran berhasil! Pertanyaan terkirim';

  @override
  String paymentFailed(Object error) {
    return '❌ Pembayaran gagal: $error';
  }

  @override
  String get yourBalance => 'Saldo Anda';

  @override
  String questionsBalance(Object count) {
    return '$count Pertanyaan';
  }

  @override
  String get availableOffers => 'Penawaran yang Tersedia';

  @override
  String questionsCount(Object count) {
    return '$count Pertanyaan';
  }

  @override
  String get buyButton => 'Membeli';

  @override
  String get dailyHoroscopeTitle => ' Horoskop Harian';

  @override
  String get userIdMissing => 'ID Pengguna tidak ada';

  @override
  String get fetchHoroscopesFailed => 'Gagal mengambil horoskop';

  @override
  String get noHoroscopeFound => 'Tidak ada horoskop yang ditemukan.';

  @override
  String get signLabel => 'Tanda';

  @override
  String get todayLabel => 'Hari ini';

  @override
  String get yesterdayLabel => 'Kemarin';

  @override
  String get thisWeekLabel => 'Minggu Ini';

  @override
  String get lastMonthLabel => 'Bulan Lalu';

  @override
  String get chatTitle => 'Mengobrol';

  @override
  String get typeYourQuestionHint => 'Ketik pertanyaan Anda...';

  @override
  String get paymentRequired => 'Pembayaran Diperlukan';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Anda telah menggunakan pertanyaan gratis Anda. Bayar $amount untuk melanjutkan.';
  }

  @override
  String get payNowButton => 'Bayar Sekarang';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count pertanyaan gratis tersisa';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pertanyaan berbayar masih tersisa';
  }

  @override
  String get thankYouFeedback => 'Terima kasih atas masukan Anda!';

  @override
  String get ratingSubmitted => 'Peringkat dikirimkan!';

  @override
  String get setUserIdFirst => 'Harap atur ID Pengguna Anda terlebih dahulu';

  @override
  String get failedToFetchPrevious =>
      'Gagal mengambil pertanyaan dan jawaban sebelumnya';

  @override
  String errorOccurred(Object error) {
    return 'Kesalahan: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astro';

  @override
  String get drawerDailyHoroscope => 'Ramalan Bintang Harian';

  @override
  String get drawerBuyQuestions => 'Pertanyaan Pembelian';

  @override
  String get drawerAstroDictionary => 'Kamus Astro';

  @override
  String get drawerSettings => 'Pengaturan';

  @override
  String get drawerCustomerSupport => 'Dukungan Pelanggan';

  @override
  String get drawerAbout => 'Tentang';

  @override
  String get drawerProfileSettings => 'Pengaturan Profil';

  @override
  String get demoNotificationTitle => '🔔 Pemberitahuan Demo';

  @override
  String get demoNotificationBody =>
      'Ini adalah pemberitahuan pengujian dari aplikasi Anda!';

  @override
  String get notificationsTitle => 'Pemberitahuan';

  @override
  String get noNotifications => 'Tidak ada notifikasi';

  @override
  String get allTab => 'Semua';

  @override
  String get markAllAsRead => 'Tandai semua sebagai telah dibaca';

  @override
  String get notificationMarkedRead =>
      'Notifikasi ditandai sebagai telah dibaca';

  @override
  String get failedToLoadNotifications => 'Gagal memuat notifikasi';

  @override
  String get failedToMarkRead => 'Gagal menandai sebagai telah dibaca';

  @override
  String get failedToMarkAllRead => 'Gagal menandai semua sebagai telah dibaca';

  @override
  String get socketConnected => 'Soket terhubung';

  @override
  String get socketDisconnected => 'Soket terputus';

  @override
  String get newNotificationReceived => 'Pemberitahuan baru diterima';

  @override
  String get generalCategory => 'Umum';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Mengobrol';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Pembaruan';

  @override
  String get howToAskTitle => 'Cara Bertanya';

  @override
  String get noQuestionsAvailable => 'Tidak ada pertanyaan yang tersedia';

  @override
  String get failedToLoadQuestions => 'Gagal memuat pertanyaan';

  @override
  String get pullToRefresh => 'Tarik untuk menyegarkan';

  @override
  String get careerCategory => 'Karier';

  @override
  String get loveCategory => 'Cinta & Hubungan';

  @override
  String get healthCategory => 'Kesehatan';

  @override
  String get financeCategory => 'Keuangan';

  @override
  String get familyCategory => 'Keluarga';

  @override
  String get educationCategory => 'Pendidikan';

  @override
  String get travelCategory => 'Bepergian';

  @override
  String get spiritualCategory => 'Rohani';

  @override
  String get profileLoaded => 'Profil berhasil dimuat';

  @override
  String get imageUploaded => 'Gambar berhasil diunggah';

  @override
  String get savedInformationConfirmation =>
      'Saya Telah Menyimpan Informasi Ini';

  @override
  String get noHistoryAvailable => 'Tidak ada riwayat tersedia';

  @override
  String get missingUserIdError => 'ID Pengguna diperlukan';

  @override
  String get networkError => 'Jaringan sedang error. Silakan coba lagi.';

  @override
  String get timeoutError => 'Permintaan waktu habis';

  @override
  String get genericError => 'Ada yang salah';

  @override
  String get reactionUpdateError => 'Gagal memperbarui reaksi';

  @override
  String get noSearchResults => 'Tidak ada hasil pencarian yang ditemukan';

  @override
  String get clearSearch => 'Hapus pencarian';

  @override
  String get resultsFound => 'Hasil ditemukan';

  @override
  String get recoverySecretHint =>
      'Salin-tempel mungkin tidak berfungsi, ketik secara manual';

  @override
  String get recoverAccountDescription =>
      'Ikuti langkah-langkah ini untuk memulihkan akun Anda';

  @override
  String get processingLabel => 'Pengolahan...';

  @override
  String get clearChatSuccess => 'Obrolan berhasil dihapus';

  @override
  String get notificationsEnabled => 'Notifikasi diaktifkan';

  @override
  String get notificationsDisabled => 'Notifikasi dinonaktifkan';

  @override
  String get securityNotice => 'Data Anda dienkripsi dan disimpan dengan aman';

  @override
  String get loading => 'Memuat...';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get onboardingGetStartedDesc => 'Mulailah dengan memilih bahasa Anda';

  @override
  String get accountRecoveryTitle => '🔐 Detail Pemulihan Akun';

  @override
  String get recoveryInstructions =>
      'Harap simpan informasi ini dengan aman. Anda akan membutuhkannya untuk memulihkan akun Anda.';

  @override
  String get importantNotice => '⚠️ Penting:';

  @override
  String get astrologerProfileTitle => 'Profil Astrolog';

  @override
  String get personalAstrologer => 'Astrolog Pribadi';

  @override
  String get makePersonalAstrologer => 'Jadikan Astrolog Pribadi';

  @override
  String get favoriteDescription =>
      'Pertanyaan Anda akan diprioritaskan kepada astrolog ini. Jika tidak tersedia, astrolog lain yang berkualifikasi akan membantu Anda.';

  @override
  String get educationQualifications => 'Pendidikan & Kualifikasi';

  @override
  String get aboutSection => 'Tentang';

  @override
  String get shareProfile => 'Bagikan Profil';

  @override
  String get loadingAstrologer => 'Memuat detail astrolog...';

  @override
  String get failedToLoadAstrologer => 'Gagal memuat detail astrolog';

  @override
  String get authenticationRequired => 'Diperlukan autentikasi. Silakan masuk.';

  @override
  String securityCheckFailed(Object error) {
    return 'Pemeriksaan keamanan gagal: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name sekarang menjadi Astrolog Pribadi Anda';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Menghapus $name dari favorit';
  }

  @override
  String get toggleFavoriteError => 'Gagal memperbarui status favorit';

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
  String get notProvided => 'Tidak disediakan';

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
      '• Ambil tangkapan layar informasi ini\n• Simpan di tempat yang aman\n• Jangan bagikan dengan siapa pun\n• Ini hanya akan ditampilkan sekali';

  @override
  String get themeSettingsTitle => 'Pengaturan Tema';

  @override
  String get lightThemeLabel => 'Lampu';

  @override
  String get lightThemeDescription => 'Selalu gunakan tema terang.';

  @override
  String get darkThemeLabel => 'Gelap';

  @override
  String get darkThemeDescription => 'Selalu gunakan tema gelap.';

  @override
  String get systemThemeLabel => 'Sistem';

  @override
  String get systemThemeDarkDescription =>
      'Ikuti pengaturan sistem untuk tema gelap.';

  @override
  String get systemThemeLightDescription =>
      'Ikuti pengaturan sistem untuk tema terang.';

  @override
  String get switchToLight => 'Beralih ke Cahaya';

  @override
  String get switchToDark => 'Beralih ke Gelap';

  @override
  String get ourTeam => 'Tim Kami';

  @override
  String get teamDescription =>
      'Tim astrolog Veda profesional kami memiliki pengalaman bertahun-tahun dalam menafsirkan pengaruh planet dan pola kehidupan. Didukung oleh tim dukungan dan pengembangan yang berdedikasi, Karma memberikan pengalaman yang lancar, andal, dan global bagi setiap pengguna.';
}
