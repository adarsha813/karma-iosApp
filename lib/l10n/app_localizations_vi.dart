// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get notificationSettings => 'Cài đặt thông báo';

  @override
  String get privacySettings => 'Cài đặt quyền riêng tư';

  @override
  String get accountSettings => 'Cài đặt tài khoản';

  @override
  String get languageSettings => 'Cài đặt ngôn ngữ';

  @override
  String get languageChanged => 'Ngôn ngữ đã thay đổi';

  @override
  String get existingUserButton => 'Tôi là người dùng hiện tại';

  @override
  String get chooseCountryTitle => 'Chọn quốc gia';

  @override
  String get yesText => 'Đúng';

  @override
  String get noText => 'KHÔNG';

  @override
  String get appBarTitle => 'Cài đặt hồ sơ';

  @override
  String get userIdLabel => 'ID người dùng *';

  @override
  String get nameLabel => 'Tên';

  @override
  String get birthCountryLabel => 'Quốc gia sinh';

  @override
  String get birthCityLabel => 'Thành phố sinh';

  @override
  String get countrySelectionTitle => 'Chọn quốc gia của bạn';

  @override
  String get maleLabel => 'Nam giới';

  @override
  String get femaleLabel => 'Nữ giới';

  @override
  String get birthDateLabel => 'Ngày sinh';

  @override
  String get birthDatePlaceholder => 'Chọn ngày sinh';

  @override
  String get birthTimeLabel => 'Thời gian sinh';

  @override
  String get birthTimePlaceholder => 'Chọn thời gian sinh';

  @override
  String get saveProfileButton => 'Lưu hồ sơ';

  @override
  String get noCitiesFound => 'Không tìm thấy thành phố nào';

  @override
  String cityPlaceholder(Object country) {
    return 'Nhập thành phố vào $country';
  }

  @override
  String get countryFirstPlaceholder => 'Chọn quốc gia trước';

  @override
  String get versionHistoryTitle => 'Lịch sử phiên bản';

  @override
  String get notSetText => 'Chưa thiết lập';

  @override
  String nameHistory(Object name) {
    return 'Tên: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Thành phố: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Quốc gia: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Giới tính: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ngày sinh: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Thời gian sinh: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Vị trí: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Múi giờ: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Giờ mùa hè: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Trạng thái: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Cập nhật vào $date';
  }

  @override
  String get userIdRequired => 'ID người dùng là bắt buộc';

  @override
  String get profileSaved => 'Hồ sơ đã được lưu thành công';

  @override
  String get saveFailed => 'Không lưu được hồ sơ';

  @override
  String get errorPrefix => 'Lỗi:';

  @override
  String get onboardingChooseLanguage => 'Chọn ngôn ngữ của bạn';

  @override
  String get onboardingChooseLanguageDesc =>
      'Chọn ngôn ngữ bạn muốn để tiếp tục.';

  @override
  String get onboardingWhatIsAstrology => 'Chiêm tinh học là gì?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Chiêm tinh học là ngành nghiên cứu về các thiên thể...';

  @override
  String get onboardingWhyUseApp => 'Tại sao nên sử dụng ứng dụng này?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Nhận tử vi cá nhân, dự đoán hàng ngày và hướng dẫn để đưa ra quyết định sáng suốt.';

  @override
  String get onboardingHowToUse => 'Làm thế nào để sử dụng ứng dụng này?';

  @override
  String get onboardingHowToUseDesc =>
      'Điều hướng dễ dàng, kiểm tra tử vi hàng ngày và quản lý hồ sơ của bạn để có những dự đoán chính xác.';

  @override
  String get onboardingGetStarted => 'Bắt đầu';

  @override
  String get onboardingNewUser => 'Người dùng mới';

  @override
  String get onboardingExistingUser => 'Người dùng hiện tại';

  @override
  String get onboardingBack => 'Mặt sau';

  @override
  String get onboardingNext => 'Kế tiếp';

  @override
  String get userIdNotFound =>
      'Không tìm thấy ID người dùng. Vui lòng đăng nhập hoặc thiết lập hồ sơ của bạn.';

  @override
  String get clearNotificationsTitle => 'Xóa thông báo';

  @override
  String get clearNotificationsMessage =>
      'Bạn có chắc chắn muốn xóa tất cả thông báo không?';

  @override
  String get clearNotificationsSuccess => 'Đã xóa tất cả thông báo thành công.';

  @override
  String get clearHoroscopeTitle => 'Tử vi rõ ràng';

  @override
  String get clearHoroscopeMessage =>
      'Bạn có chắc chắn muốn xóa dữ liệu tử vi của mình không?';

  @override
  String get clearHoroscopeSuccess => 'Đã xóa tử vi thành công.';

  @override
  String get clearChatTitle => 'Xóa lịch sử trò chuyện';

  @override
  String get clearChatMessage =>
      'Bạn có chắc chắn muốn xóa toàn bộ lịch sử trò chuyện của mình không?';

  @override
  String get clearChatLocal => 'Đã xóa trò chuyện cục bộ.';

  @override
  String get deleteAccountTitle => 'Xóa tài khoản';

  @override
  String get deleteAccountMessage =>
      'Bạn có chắc chắn muốn xóa tài khoản của mình không? Thao tác này cũng sẽ xóa toàn bộ lịch sử trò chuyện và thông báo của bạn.';

  @override
  String get deleteAccountSuccess =>
      'Tài khoản của bạn và toàn bộ dữ liệu đã bị xóa.';

  @override
  String get deleteAccountError => 'Lỗi khi xóa tài khoản';

  @override
  String get logoutTitle => 'Đăng xuất';

  @override
  String get logoutMessage => 'Bạn có chắc chắn muốn đăng xuất không?';

  @override
  String get termsPrivacyTitle => 'Điều khoản & Quyền riêng tư';

  @override
  String get privacyPolicyTitle => 'Chính sách bảo mật';

  @override
  String get termsConditionsTitle => 'Điều khoản & Điều kiện';

  @override
  String get dataControlTitle => 'Kiểm soát dữ liệu';

  @override
  String get cancelButton => 'Hủy bỏ';

  @override
  String get confirmButton => 'Xác nhận';

  @override
  String get clearQuestionsSuccess =>
      'Tất cả các câu hỏi đã được xóa thành công.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Chúa';

  @override
  String get startLabel => 'Bắt đầu';

  @override
  String get recoverAccount => 'Khôi phục tài khoản';

  @override
  String get endLabel => 'Kết thúc';

  @override
  String get startDateLabel => 'Ngày bắt đầu';

  @override
  String get endDateLabel => 'Ngày kết thúc';

  @override
  String get notAvailable => 'Không có sẵn';

  @override
  String get noData => 'Không có dữ liệu';

  @override
  String get unknownError => 'Lỗi không xác định';

  @override
  String get retryButton => 'Thử lại';

  @override
  String get kundaliGeneratorTitle => 'Máy phát điện Kundali';

  @override
  String get natalChartTitle => 'Biểu đồ sinh';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Bậc tăng dần';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Không rõ';

  @override
  String get clearHoroscope => 'Tử vi rõ ràng';

  @override
  String get clearNotifications => 'Xóa thông báo';

  @override
  String get clearChatHistory => 'Xóa lịch sử trò chuyện';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get allFieldsRequired => 'Tất cả các trường đều bắt buộc.';

  @override
  String get accountRecoveredSuccess =>
      'Tài khoản đã được khôi phục thành công.';

  @override
  String get recoveryFailed =>
      'Khôi phục không thành công. Hãy kiểm tra lại thông tin của bạn.';

  @override
  String get recoverySecretLabel => 'Bí quyết phục hồi:';

  @override
  String get aboutUsTitle => 'Giới thiệu về chúng tôi';

  @override
  String get aboutOurCompany => 'Giới thiệu về công ty chúng tôi';

  @override
  String get aboutCompanyDescription =>
      'Chúng tôi cam kết mang lại trải nghiệm chiêm tinh tốt nhất cho người dùng.';

  @override
  String get ourMission => 'Sứ mệnh của chúng tôi';

  @override
  String get missionDescription =>
      'Cung cấp những hiểu biết chiêm tinh chính xác và cá nhân hóa để giúp người dùng đưa ra quyết định sáng suốt trong cuộc sống.';

  @override
  String get ourVision => 'Tầm nhìn của chúng tôi';

  @override
  String get visionDescription =>
      'Trở thành nền tảng chiêm tinh đáng tin cậy nhất, kết hợp công nghệ và trí tuệ cổ xưa.';

  @override
  String get ourValues => 'Giá trị của chúng tôi';

  @override
  String get valuesDescription =>
      'Tính toàn vẹn, chính xác, thiết kế lấy người dùng làm trung tâm và đổi mới liên tục.';

  @override
  String get contactUs => 'Liên hệ với chúng tôi';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Trang web: www.yourcompany.com';

  @override
  String get customerSupport => 'Hỗ trợ khách hàng';

  @override
  String get supportHeroTitle => 'Chúng tôi ở đây để giúp đỡ';

  @override
  String get supportHeroDescription =>
      'Hãy điền vào mẫu dưới đây và nhóm hỗ trợ của chúng tôi sẽ liên hệ lại với bạn trong thời gian sớm nhất.';

  @override
  String get yourName => 'Tên của bạn';

  @override
  String get yourEmail => 'Email của bạn';

  @override
  String get message => 'Tin nhắn';

  @override
  String get enterEmail => 'Nhập email của bạn';

  @override
  String get enterValidEmail => 'Nhập địa chỉ email hợp lệ';

  @override
  String enterField(Object fieldName) {
    return 'Nhập $fieldName';
  }

  @override
  String get send => 'Gửi';

  @override
  String get sending => 'Đang gửi...';

  @override
  String get emailSentSuccess => '✅ Email đã được gửi thành công!';

  @override
  String get emailSendFailed => '❌ Không gửi được email';

  @override
  String get astroDictionaryTitle => 'Từ điển thiên văn';

  @override
  String get searchTermsHint => 'Các thuật ngữ tìm kiếm...';

  @override
  String get noTermsFound => 'Không tìm thấy thuật ngữ nào';

  @override
  String get buyQuestionsTitle => 'Mua câu hỏi';

  @override
  String get userNotAuthenticated => 'Người dùng chưa được xác thực';

  @override
  String get loadStoreDataFailed => 'Không tải được dữ liệu lưu trữ';

  @override
  String get missingAuthToken => 'Thiếu mã thông báo xác thực';

  @override
  String get merchantDisplayName => 'Ứng dụng trò chuyện Astro';

  @override
  String get paymentSuccessful => '✅ Thanh toán thành công! Đã gửi câu hỏi';

  @override
  String paymentFailed(Object error) {
    return '❌ Thanh toán không thành công: $error';
  }

  @override
  String get yourBalance => 'Số dư của bạn';

  @override
  String questionsBalance(Object count) {
    return '$count Câu hỏi';
  }

  @override
  String get availableOffers => 'Ưu đãi có sẵn';

  @override
  String questionsCount(Object count) {
    return '$count Câu hỏi';
  }

  @override
  String get buyButton => 'Mua';

  @override
  String get dailyHoroscopeTitle => '🌟 Tử vi hàng ngày';

  @override
  String get userIdMissing => 'ID người dùng bị thiếu';

  @override
  String get fetchHoroscopesFailed => 'Không thể tải tử vi';

  @override
  String get noHoroscopeFound => 'Không tìm thấy tử vi.';

  @override
  String get signLabel => 'Dấu hiệu';

  @override
  String get todayLabel => 'Hôm nay';

  @override
  String get yesterdayLabel => 'Hôm qua';

  @override
  String get thisWeekLabel => 'Tuần này';

  @override
  String get lastMonthLabel => 'Tháng trước';

  @override
  String get chatTitle => 'Trò chuyện';

  @override
  String get typeYourQuestionHint => 'Nhập câu hỏi của bạn...';

  @override
  String get paymentRequired => 'Yêu cầu thanh toán';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Bạn đã sử dụng hết số câu hỏi miễn phí. Vui lòng trả 50 Rupee để tiếp tục.';
  }

  @override
  String get payNowButton => 'Thanh toán ngay';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count còn lại câu hỏi miễn phí';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count số câu hỏi đã trả phí còn lại';
  }

  @override
  String get thankYouFeedback => 'Cảm ơn phản hồi của bạn!';

  @override
  String get ratingSubmitted => 'Đã gửi đánh giá!';

  @override
  String get setUserIdFirst => 'Vui lòng thiết lập ID người dùng của bạn trước';

  @override
  String get failedToFetchPrevious =>
      'Không thể lấy được các câu hỏi và câu trả lời trước đó';

  @override
  String errorOccurred(Object error) {
    return 'Lỗi: $error';
  }

  @override
  String get drawerAstroProfile => 'Hồ sơ Astro';

  @override
  String get drawerDailyHoroscope => 'Tử vi hàng ngày';

  @override
  String get drawerBuyQuestions => 'Mua câu hỏi';

  @override
  String get drawerAstroDictionary => 'Từ điển thiên văn';

  @override
  String get drawerSettings => 'Cài đặt';

  @override
  String get drawerCustomerSupport => 'Hỗ trợ khách hàng';

  @override
  String get drawerAbout => 'Về';

  @override
  String get drawerProfileSettings => 'Cài đặt hồ sơ';

  @override
  String get demoNotificationTitle => '🔔 Thông báo bản demo';

  @override
  String get demoNotificationBody =>
      'Đây là thông báo thử nghiệm từ ứng dụng của bạn!';

  @override
  String get notificationsTitle => 'Thông báo';

  @override
  String get noNotifications => 'Không có thông báo';

  @override
  String get allTab => 'Tất cả';

  @override
  String get markAllAsRead => 'Đánh dấu tất cả là đã đọc';

  @override
  String get notificationMarkedRead => 'Thông báo được đánh dấu là đã đọc';

  @override
  String get failedToLoadNotifications => 'Không tải được thông báo';

  @override
  String get failedToMarkRead => 'Không thể đánh dấu là đã đọc';

  @override
  String get failedToMarkAllRead => 'Không thể đánh dấu tất cả là đã đọc';

  @override
  String get socketConnected => 'Ổ cắm đã kết nối';

  @override
  String get socketDisconnected => 'Ổ cắm bị ngắt kết nối';

  @override
  String get newNotificationReceived => 'Đã nhận được thông báo mới';

  @override
  String get generalCategory => 'Tổng quan';

  @override
  String get horoscopeCategory => 'Tử vi';

  @override
  String get chatCategory => 'Trò chuyện';

  @override
  String get systemCategory => 'Hệ thống';

  @override
  String get updateCategory => 'Cập nhật';

  @override
  String get howToAskTitle => 'Cách hỏi';

  @override
  String get noQuestionsAvailable => 'Không có câu hỏi nào có sẵn';

  @override
  String get failedToLoadQuestions => 'Không tải được câu hỏi';

  @override
  String get pullToRefresh => 'Kéo để làm mới';

  @override
  String get careerCategory => 'Sự nghiệp';

  @override
  String get loveCategory => 'Tình yêu và các mối quan hệ';

  @override
  String get healthCategory => 'Sức khỏe';

  @override
  String get financeCategory => 'Tài chính';

  @override
  String get familyCategory => 'Gia đình';

  @override
  String get educationCategory => 'Giáo dục';

  @override
  String get travelCategory => 'Du lịch';

  @override
  String get spiritualCategory => 'Tâm linh';

  @override
  String get profileLoaded => 'Hồ sơ đã được tải thành công';

  @override
  String get imageUploaded => 'Hình ảnh đã được tải lên thành công';

  @override
  String get savedInformationConfirmation => 'Tôi đã lưu thông tin này';

  @override
  String get noHistoryAvailable => 'Không có lịch sử có sẵn';

  @override
  String get missingUserIdError => 'ID người dùng là bắt buộc';

  @override
  String get networkError => 'Lỗi mạng. Vui lòng thử lại.';

  @override
  String get timeoutError => 'Yêu cầu đã hết thời gian';

  @override
  String get genericError => 'Có gì đó không ổn';

  @override
  String get reactionUpdateError => 'Không cập nhật được phản ứng';

  @override
  String get noSearchResults => 'Không tìm thấy kết quả tìm kiếm';

  @override
  String get clearSearch => 'Xóa tìm kiếm';

  @override
  String get resultsFound => 'Kết quả tìm thấy';

  @override
  String get recoverySecretHint =>
      'Sao chép-dán có thể không hoạt động, hãy nhập thủ công';

  @override
  String get recoverAccountDescription =>
      'Thực hiện theo các bước sau để khôi phục tài khoản của bạn';

  @override
  String get processingLabel => 'Xử lý...';

  @override
  String get clearChatSuccess => 'Trò chuyện đã được xóa thành công';

  @override
  String get notificationsEnabled => 'Đã bật thông báo';

  @override
  String get notificationsDisabled => 'Thông báo đã bị vô hiệu hóa';

  @override
  String get securityNotice => 'Dữ liệu của bạn được mã hóa và lưu trữ an toàn';

  @override
  String get loading => 'Đang tải...';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ';

  @override
  String get onboardingGetStartedDesc =>
      'Bắt đầu bằng cách chọn ngôn ngữ của bạn';

  @override
  String get accountRecoveryTitle => '🔐 Chi tiết khôi phục tài khoản';

  @override
  String get recoveryInstructions =>
      'Vui lòng lưu thông tin này một cách an toàn. Bạn sẽ cần thông tin này để khôi phục tài khoản.';

  @override
  String get importantNotice => '⚠️ Quan trọng:';

  @override
  String get astrologerProfileTitle => 'Hồ sơ nhà chiêm tinh';

  @override
  String get personalAstrologer => 'Nhà chiêm tinh cá nhân';

  @override
  String get makePersonalAstrologer => 'Tạo nhà chiêm tinh cá nhân';

  @override
  String get favoriteDescription =>
      'Câu hỏi của bạn sẽ được ưu tiên chuyển đến nhà chiêm tinh này. Nếu không thể liên lạc, một nhà chiêm tinh khác có trình độ sẽ hỗ trợ bạn.';

  @override
  String get educationQualifications => 'Giáo dục & Bằng cấp';

  @override
  String get aboutSection => 'Về';

  @override
  String get shareProfile => 'Chia sẻ hồ sơ';

  @override
  String get loadingAstrologer =>
      'Đang tải thông tin chi tiết về nhà chiêm tinh...';

  @override
  String get failedToLoadAstrologer =>
      'Không tải được thông tin chi tiết về nhà chiêm tinh';

  @override
  String get authenticationRequired => 'Cần xác thực. Vui lòng đăng nhập.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kiểm tra bảo mật không thành công: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name hiện là Nhà chiêm tinh cá nhân của bạn';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Đã xóa $name khỏi mục yêu thích';
  }

  @override
  String get toggleFavoriteError => 'Không cập nhật được trạng thái yêu thích';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Học vấn: $education\n📜 Bằng cấp: $qualification\n⏳ Kinh nghiệm: $experience';
  }

  @override
  String get notProvided => 'Không được cung cấp';

  @override
  String reviews(Object count) {
    return '($count đánh giá)';
  }

  @override
  String get specialties => 'Chuyên ngành';

  @override
  String get experience => 'Kinh nghiệm';

  @override
  String get qualification => 'Trình độ chuyên môn';

  @override
  String get education => 'Giáo dục';

  @override
  String get recoveryTips =>
      '• Chụp ảnh màn hình thông tin này\n• Lưu trữ ở nơi an toàn\n• Không chia sẻ với bất kỳ ai\n• Thông tin này chỉ được hiển thị một lần';

  @override
  String get themeSettingsTitle => 'Cài đặt chủ đề';

  @override
  String get lightThemeLabel => 'Ánh sáng';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tối tăm';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Hệ thống';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
