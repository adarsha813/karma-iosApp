// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get settingsTitle => '设置';

  @override
  String get notificationSettings => '通知设置';

  @override
  String get privacySettings => '隐私设置';

  @override
  String get accountSettings => '账户设置';

  @override
  String get languageSettings => '语言设置';

  @override
  String get languageChanged => '语言已改变';

  @override
  String get existingUserButton => '我是现有用户';

  @override
  String get chooseCountryTitle => '选择国家/地区';

  @override
  String get yesText => '是的';

  @override
  String get noText => '不';

  @override
  String get appBarTitle => '个人资料设置';

  @override
  String get userIdLabel => '用户身份 *';

  @override
  String get nameLabel => '姓名';

  @override
  String get birthCountryLabel => '出生国';

  @override
  String get birthCityLabel => '出生地';

  @override
  String get countrySelectionTitle => '选择您的国家/地区';

  @override
  String get maleLabel => '男性';

  @override
  String get femaleLabel => '女性';

  @override
  String get birthDateLabel => '出生日期';

  @override
  String get birthDatePlaceholder => '选择出生日期';

  @override
  String get birthTimeLabel => '出生时间';

  @override
  String get birthTimePlaceholder => '选择出生时间';

  @override
  String get saveProfileButton => '保存个人资料';

  @override
  String get noCitiesFound => '未找到城市';

  @override
  String cityPlaceholder(Object country) {
    return '输入城市 $country';
  }

  @override
  String get countryFirstPlaceholder => '首先选择国家/地区';

  @override
  String get versionHistoryTitle => '版本历史记录';

  @override
  String get notSetText => '未设置';

  @override
  String nameHistory(Object name) {
    return '姓名：$name';
  }

  @override
  String cityHistory(Object city) {
    return '城市：$city';
  }

  @override
  String countryHistory(Object country) {
    return '国家/地区：$country';
  }

  @override
  String genderHistory(Object gender) {
    return '性别：$gender';
  }

  @override
  String birthDateHistory(Object date) {
    return '出生日期：$date';
  }

  @override
  String birthTimeHistory(Object time) {
    return '出生时间：$time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return '位置：$latitude，$longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return '时区：GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST：$value';
  }

  @override
  String stateHistory(Object state) {
    return '州：$state';
  }

  @override
  String versionFromText(Object date) {
    return '更新于 $date';
  }

  @override
  String get userIdRequired => '需要用户 ID';

  @override
  String get profileSaved => '个人资料已成功保存';

  @override
  String get saveFailed => '保存个人资料失败';

  @override
  String get errorPrefix => '错误：';

  @override
  String get onboardingChooseLanguage => '选择您的语言';

  @override
  String get onboardingChooseLanguageDesc => '请选择您偏好的语言继续。';

  @override
  String get onboardingWhatIsAstrology => '什么是占星术？';

  @override
  String get onboardingWhatIsAstrologyDesc => '占星术是研究天体的学科……';

  @override
  String get onboardingWhyUseApp => '为什么要使用这款应用？';

  @override
  String get onboardingWhyUseAppDesc => '获取个性化星座运势、每日预测和指导，帮助您做出明智的决定。';

  @override
  String get onboardingHowToUse => '如何使用这款应用？';

  @override
  String get onboardingHowToUseDesc => '轻松浏览，查看每日星座运势，管理个人资料以获得准确预测。';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get onboardingNewUser => '新用户';

  @override
  String get onboardingExistingUser => '现有用户';

  @override
  String get onboardingBack => '后退';

  @override
  String get onboardingNext => '下一个';

  @override
  String get userIdNotFound => '未找到用户ID。请登录或设置您的个人资料。';

  @override
  String get clearNotificationsTitle => '清除通知';

  @override
  String get clearNotificationsMessage => '您确定要清除所有通知吗？';

  @override
  String get clearNotificationsSuccess => '所有通知已成功清除。';

  @override
  String get clearHoroscopeTitle => '清晰星座运势';

  @override
  String get clearHoroscopeMessage => '您确定要清除您的星座运势数据吗？';

  @override
  String get clearHoroscopeSuccess => '星座运势已顺利清除。';

  @override
  String get clearChatTitle => '清除聊天记录';

  @override
  String get clearChatMessage => '您确定要删除所有聊天记录吗？';

  @override
  String get clearChatLocal => '聊天记录已在本地清除。';

  @override
  String get deleteAccountTitle => '删除帐户';

  @override
  String get deleteAccountMessage => '您确定要删除您的帐户吗？此操作也会清除您的所有聊天记录和通知。';

  @override
  String get deleteAccountSuccess => '您的账户及所有数据已被删除。';

  @override
  String get deleteAccountError => '删除帐户时出错';

  @override
  String get logoutTitle => '注销';

  @override
  String get logoutMessage => '您确定要退出登录吗？';

  @override
  String get termsPrivacyTitle => '条款与隐私';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get termsConditionsTitle => '条款及细则';

  @override
  String get dataControlTitle => '数据控制';

  @override
  String get cancelButton => '取消';

  @override
  String get confirmButton => '确认';

  @override
  String get clearQuestionsSuccess => '所有问题已成功删除。';

  @override
  String get yoginiLabel => '瑜伽女';

  @override
  String get lordLabel => '主';

  @override
  String get startLabel => '开始';

  @override
  String get recoverAccount => '恢复账户';

  @override
  String get endLabel => '结尾';

  @override
  String get startDateLabel => '开始日期';

  @override
  String get endDateLabel => '结束日期';

  @override
  String get notAvailable => '无法使用';

  @override
  String get noData => '无数据';

  @override
  String get unknownError => '未知错误';

  @override
  String get retryButton => '重试';

  @override
  String get kundaliGeneratorTitle => '昆达利发电机';

  @override
  String get natalChartTitle => '出生星盘';

  @override
  String get lagnaLabel => '拉格纳';

  @override
  String get rashiLabel => '拉希';

  @override
  String get ascDegreeLabel => '上升点度数';

  @override
  String get vimshottariDashaTitle => '维姆肖塔里·达莎';

  @override
  String get yoginiDashaTitle => '瑜伽女达莎';

  @override
  String get unknown => '未知';

  @override
  String get clearHoroscope => '清晰星座运势';

  @override
  String get clearNotifications => '清除通知';

  @override
  String get clearChatHistory => '清除聊天记录';

  @override
  String get logout => '注销';

  @override
  String get deleteAccount => '删除帐户';

  @override
  String get allFieldsRequired => '所有字段均为必填项。';

  @override
  String get accountRecoveredSuccess => '账户已成功恢复。';

  @override
  String get recoveryFailed => '恢复失败。请检查您的信息。';

  @override
  String get recoverySecretLabel => '恢复秘诀：';

  @override
  String get aboutUsTitle => '关于我们';

  @override
  String get aboutOurCompany => '关于我们公司';

  @override
  String get aboutCompanyDescription => '我们致力于为用户提供最佳的占星体验。';

  @override
  String get ourMission => '我们的使命';

  @override
  String get missionDescription => '提供准确、个性化的占星见解，帮助用户在生活中做出明智的决定。';

  @override
  String get ourVision => '我们的愿景';

  @override
  String get visionDescription => '成为最值得信赖的占星平台，将科技与古代智慧相结合。';

  @override
  String get ourValues => '我们的价值观';

  @override
  String get valuesDescription => '诚信、准确、以用户为中心的设计、持续创新。';

  @override
  String get contactUs => '联系我们';

  @override
  String get contactEmail => '电子邮件：support@yourcompany.com';

  @override
  String get contactWebsite => '网站：www.yourcompany.com';

  @override
  String get customerSupport => '客户支持';

  @override
  String get supportHeroTitle => '我们随时为您提供帮助';

  @override
  String get supportHeroDescription => '请填写以下表格，我们的支持团队将尽快与您联系。';

  @override
  String get yourName => '你的名字';

  @override
  String get yourEmail => '您的电子邮件';

  @override
  String get message => '信息';

  @override
  String get enterEmail => '请输入您的邮箱';

  @override
  String get enterValidEmail => '请输入有效的电子邮件地址';

  @override
  String enterField(Object fieldName) {
    return '输入$fieldName';
  }

  @override
  String get send => '发送';

  @override
  String get sending => '正在发送...';

  @override
  String get emailSentSuccess => '✅ 邮件已成功发送！';

  @override
  String get emailSendFailed => '❌ 邮件发送失败';

  @override
  String get astroDictionaryTitle => '星象词典';

  @override
  String get searchTermsHint => '搜索词……';

  @override
  String get noTermsFound => '未找到相关术语';

  @override
  String get buyQuestionsTitle => '购买问题';

  @override
  String get userNotAuthenticated => '用户未通过身份验证。';

  @override
  String get loadStoreDataFailed => '加载商店数据失败';

  @override
  String get missingAuthToken => '缺少身份验证令牌';

  @override
  String get merchantDisplayName => 'Astro聊天应用程序';

  @override
  String get paymentSuccessful => '✅ 付款成功！问题已发送';

  @override
  String paymentFailed(Object error) {
    return '❌ 付款失败：$error';
  }

  @override
  String get yourBalance => '您的余额';

  @override
  String questionsBalance(Object count) {
    return '$count 问题';
  }

  @override
  String get availableOffers => '现有优惠';

  @override
  String questionsCount(Object count) {
    return '$count 问题';
  }

  @override
  String get buyButton => '买';

  @override
  String get dailyHoroscopeTitle => '🌟每日星座运势';

  @override
  String get userIdMissing => '用户 ID 缺失';

  @override
  String get fetchHoroscopesFailed => '获取星座运势失败';

  @override
  String get noHoroscopeFound => '未找到星座运势。';

  @override
  String get signLabel => '符号';

  @override
  String get todayLabel => '今天';

  @override
  String get yesterdayLabel => '昨天';

  @override
  String get thisWeekLabel => '本星期';

  @override
  String get lastMonthLabel => '上个月';

  @override
  String get chatTitle => '聊天';

  @override
  String get typeYourQuestionHint => '请输入您的问题……';

  @override
  String get paymentRequired => '需支付款项';

  @override
  String get paymentRequiredMessage => '您已用完免费提问次数。支付 50 卢比即可继续。';

  @override
  String get payNowButton => '立即支付';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count 剩余免费问题数';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count 剩余付费问题数';
  }

  @override
  String get thankYouFeedback => '感谢您的反馈！';

  @override
  String get ratingSubmitted => '评分已提交！';

  @override
  String get setUserIdFirst => '请先设置您的用户ID。';

  @override
  String get failedToFetchPrevious => '获取之前的问题和答案失败';

  @override
  String errorOccurred(Object error) {
    return '错误：$error';
  }

  @override
  String get drawerAstroProfile => '星象概况';

  @override
  String get drawerDailyHoroscope => '每日星座运势';

  @override
  String get drawerBuyQuestions => '购买问题';

  @override
  String get drawerAstroDictionary => '星象词典';

  @override
  String get drawerSettings => '设置';

  @override
  String get drawerCustomerSupport => '客户支持';

  @override
  String get drawerAbout => '关于';

  @override
  String get drawerProfileSettings => '个人资料设置';

  @override
  String get demoNotificationTitle => '🔔 演示通知';

  @override
  String get demoNotificationBody => '这是来自您应用的测试通知！';

  @override
  String get notificationsTitle => '通知';

  @override
  String get noNotifications => '无通知';

  @override
  String get allTab => '全部';

  @override
  String get markAllAsRead => '全部标记为已读';

  @override
  String get notificationMarkedRead => '通知已读';

  @override
  String get failedToLoadNotifications => '通知加载失败';

  @override
  String get failedToMarkRead => '标记为已读失败';

  @override
  String get failedToMarkAllRead => '未能将所有内容标记为已读';

  @override
  String get socketConnected => '插座已连接';

  @override
  String get socketDisconnected => '插座已断开连接';

  @override
  String get newNotificationReceived => '收到新通知';

  @override
  String get generalCategory => '一般的';

  @override
  String get horoscopeCategory => '星座运势';

  @override
  String get chatCategory => '聊天';

  @override
  String get systemCategory => '系统';

  @override
  String get updateCategory => '更新';

  @override
  String get howToAskTitle => '如何提问';

  @override
  String get noQuestionsAvailable => '暂无问题';

  @override
  String get failedToLoadQuestions => '问题加载失败';

  @override
  String get pullToRefresh => '下拉刷新';

  @override
  String get careerCategory => '职业';

  @override
  String get loveCategory => '爱情与人际关系';

  @override
  String get healthCategory => '健康';

  @override
  String get financeCategory => '金融';

  @override
  String get familyCategory => '家庭';

  @override
  String get educationCategory => '教育';

  @override
  String get travelCategory => '旅行';

  @override
  String get spiritualCategory => '精神';

  @override
  String get profileLoaded => '配置文件已成功加载';

  @override
  String get imageUploaded => '图片上传成功';

  @override
  String get savedInformationConfirmation => '我已保存此信息';

  @override
  String get noHistoryAvailable => '暂无历史记录';

  @override
  String get missingUserIdError => '需要用户 ID';

  @override
  String get networkError => '网络错误，请重试。';

  @override
  String get timeoutError => '请求超时';

  @override
  String get genericError => '出问题了';

  @override
  String get reactionUpdateError => '未能更新反应';

  @override
  String get noSearchResults => '未找到搜索结果';

  @override
  String get clearSearch => '清除搜索';

  @override
  String get resultsFound => '结果发现';

  @override
  String get recoverySecretHint => '复制粘贴可能无法正常工作，请手动输入。';

  @override
  String get recoverAccountDescription => '请按照以下步骤恢复您的帐户';

  @override
  String get processingLabel => '加工...';

  @override
  String get clearChatSuccess => '聊天记录已成功清除';

  @override
  String get notificationsEnabled => '已启用通知';

  @override
  String get notificationsDisabled => '通知已禁用';

  @override
  String get securityNotice => '您的数据经过安全加密并存储。';

  @override
  String get loading => '加载中...';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get onboardingGetStartedDesc => '首先选择您的语言。';

  @override
  String get accountRecoveryTitle => '🔐 账户恢复详情';

  @override
  String get recoveryInstructions => '请妥善保存此信息。您需要它来恢复您的帐户。';

  @override
  String get importantNotice => '⚠️ 重要提示：';

  @override
  String get astrologerProfileTitle => '占星师简介';

  @override
  String get personalAstrologer => '私人占星师';

  @override
  String get makePersonalAstrologer => '聘请私人占星师';

  @override
  String get favoriteDescription =>
      '您的提问将优先由这位占星师解答。如果他/她不在，我们会安排另一位合格的占星师为您提供帮助。';

  @override
  String get educationQualifications => '教育背景及资格';

  @override
  String get aboutSection => '关于';

  @override
  String get shareProfile => '分享个人资料';

  @override
  String get loadingAstrologer => '正在加载占星师详情……';

  @override
  String get failedToLoadAstrologer => '加载占星师详情失败';

  @override
  String get authenticationRequired => '需要身份验证。请登录。';

  @override
  String securityCheckFailed(Object error) {
    return '安全检查失败：$error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name 现在是您的私人占星师';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ 从收藏夹中移除 $name';
  }

  @override
  String get toggleFavoriteError => '更新收藏状态失败';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n\n🎓 教育背景：$education\n\n📜 资格证书：$qualification\n\n⏳ 工作经验：$experience';
  }

  @override
  String get notProvided => '未提供';

  @override
  String reviews(Object count) {
    return '（$count 条评论）';
  }

  @override
  String get specialties => '专业领域';

  @override
  String get experience => '经验';

  @override
  String get qualification => '资格';

  @override
  String get education => '教育';

  @override
  String get recoveryTips =>
      '• 请截屏保存此信息\n\n• 请将其保存在安全的地方\n\n• 请勿与任何人分享\n\n• 此信息仅显示一次';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get settingsTitle => '設定';

  @override
  String get notificationSettings => '通知設定';

  @override
  String get privacySettings => '隱私設定';

  @override
  String get accountSettings => '帳戶設定';

  @override
  String get languageSettings => '語言設定';

  @override
  String get languageChanged => '語言已改變';

  @override
  String get existingUserButton => '我是現有用戶';

  @override
  String get chooseCountryTitle => '選擇國家/地區';

  @override
  String get yesText => '是的';

  @override
  String get noText => '不';

  @override
  String get appBarTitle => '個人資料設定';

  @override
  String get userIdLabel => '使用者身分 *';

  @override
  String get nameLabel => '姓名';

  @override
  String get birthCountryLabel => '出生國';

  @override
  String get birthCityLabel => '出生地';

  @override
  String get countrySelectionTitle => '選擇您的國家/地區';

  @override
  String get maleLabel => '男性';

  @override
  String get femaleLabel => '女性';

  @override
  String get birthDateLabel => '出生日期';

  @override
  String get birthDatePlaceholder => '選擇出生日期';

  @override
  String get birthTimeLabel => '出生時間';

  @override
  String get birthTimePlaceholder => '選擇出生時間';

  @override
  String get saveProfileButton => '儲存個人資料';

  @override
  String get noCitiesFound => '未找到城市';

  @override
  String cityPlaceholder(Object country) {
    return '輸入城市 $country';
  }

  @override
  String get countryFirstPlaceholder => '首先選擇國家/地區';

  @override
  String get versionHistoryTitle => '版本歷史記錄';

  @override
  String get notSetText => '未設定';

  @override
  String nameHistory(Object name) {
    return '名稱：$name';
  }

  @override
  String cityHistory(Object city) {
    return '城市：$city';
  }

  @override
  String countryHistory(Object country) {
    return '國家：$country';
  }

  @override
  String genderHistory(Object gender) {
    return '性別：$gender';
  }

  @override
  String birthDateHistory(Object date) {
    return '出生日期：$date';
  }

  @override
  String birthTimeHistory(Object time) {
    return '出生時間：$time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return '位置：$latitude，$longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return '時區：GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST：$value';
  }

  @override
  String stateHistory(Object state) {
    return '州：$state';
  }

  @override
  String versionFromText(Object date) {
    return '更新於 $date';
  }

  @override
  String get userIdRequired => '需要使用者 ID';

  @override
  String get profileSaved => '個人資料已成功儲存';

  @override
  String get saveFailed => '儲存個人資料失敗';

  @override
  String get errorPrefix => '錯誤：';

  @override
  String get onboardingChooseLanguage => '選擇您的語言';

  @override
  String get onboardingChooseLanguageDesc => '請選擇您偏好的語言繼續。';

  @override
  String get onboardingWhatIsAstrology => '什麼是占星術？';

  @override
  String get onboardingWhatIsAstrologyDesc => '占星術是研究天體的學科…';

  @override
  String get onboardingWhyUseApp => '為什麼要使用這款應用程式？';

  @override
  String get onboardingWhyUseAppDesc => '獲得個人化星座運勢、每日預測和指導，幫助您做出明智的決定。';

  @override
  String get onboardingHowToUse => '如何使用這款應用程式？';

  @override
  String get onboardingHowToUseDesc => '輕鬆瀏覽，查看每日星座運勢，管理個人資料以獲得準確預測。';

  @override
  String get onboardingGetStarted => '開始使用';

  @override
  String get onboardingNewUser => '新用戶';

  @override
  String get onboardingExistingUser => '現有用戶';

  @override
  String get onboardingBack => '後退';

  @override
  String get onboardingNext => '下一個';

  @override
  String get userIdNotFound => '未找到用戶ID。請登入或設定您的個人資料。';

  @override
  String get clearNotificationsTitle => '清除通知';

  @override
  String get clearNotificationsMessage => '您確定要清除所有通知嗎？';

  @override
  String get clearNotificationsSuccess => '所有通知已成功清除。';

  @override
  String get clearHoroscopeTitle => '清晰星座運勢';

  @override
  String get clearHoroscopeMessage => '您確定要清除您的星座運勢資料嗎？';

  @override
  String get clearHoroscopeSuccess => '星座運勢已順利清除。';

  @override
  String get clearChatTitle => '清除聊天記錄';

  @override
  String get clearChatMessage => '您確定要刪除所有聊天記錄嗎？';

  @override
  String get clearChatLocal => '聊天記錄已在本機清除。';

  @override
  String get deleteAccountTitle => '刪除帳戶';

  @override
  String get deleteAccountMessage => '您確定要刪除您的帳戶嗎？此操作也會清除您的所有聊天記錄和通知。';

  @override
  String get deleteAccountSuccess => '您的帳戶及所有資料已刪除。';

  @override
  String get deleteAccountError => '刪除帳戶時發生錯誤';

  @override
  String get logoutTitle => '註銷';

  @override
  String get logoutMessage => '您確定要登出登入嗎？';

  @override
  String get termsPrivacyTitle => '條款與隱私';

  @override
  String get privacyPolicyTitle => '隱私權政策';

  @override
  String get termsConditionsTitle => '條款及細則';

  @override
  String get dataControlTitle => '數據控制';

  @override
  String get cancelButton => '取消';

  @override
  String get confirmButton => '確認';

  @override
  String get clearQuestionsSuccess => '所有問題已成功刪除。';

  @override
  String get yoginiLabel => '瑜珈女';

  @override
  String get lordLabel => '主';

  @override
  String get startLabel => '開始';

  @override
  String get recoverAccount => '恢復帳戶';

  @override
  String get endLabel => '結尾';

  @override
  String get startDateLabel => '開始日期';

  @override
  String get endDateLabel => '結束日期';

  @override
  String get notAvailable => '無法使用';

  @override
  String get noData => '無數據';

  @override
  String get unknownError => '未知錯誤';

  @override
  String get retryButton => '重試';

  @override
  String get kundaliGeneratorTitle => '昆達利發電機';

  @override
  String get natalChartTitle => '出生星盤';

  @override
  String get lagnaLabel => '拉格納';

  @override
  String get rashiLabel => '拉希';

  @override
  String get ascDegreeLabel => '上升點數';

  @override
  String get vimshottariDashaTitle => '維姆肖塔里·達莎';

  @override
  String get yoginiDashaTitle => '瑜珈女達莎';

  @override
  String get unknown => '未知';

  @override
  String get clearHoroscope => '清晰星座運勢';

  @override
  String get clearNotifications => '清除通知';

  @override
  String get clearChatHistory => '清除聊天記錄';

  @override
  String get logout => '註銷';

  @override
  String get deleteAccount => '刪除帳戶';

  @override
  String get allFieldsRequired => '所有欄位均為必填項。';

  @override
  String get accountRecoveredSuccess => '帳戶已成功恢復。';

  @override
  String get recoveryFailed => '恢復失敗。請檢查您的資訊。';

  @override
  String get recoverySecretLabel => '恢復秘訣：';

  @override
  String get aboutUsTitle => '關於我們';

  @override
  String get aboutOurCompany => '關於我們公司';

  @override
  String get aboutCompanyDescription => '我們致力於為使用者提供最佳的占星體驗。';

  @override
  String get ourMission => '我們的使命';

  @override
  String get missionDescription => '提供準確、個人化的占星見解，幫助使用者在生活中做出明智的決定。';

  @override
  String get ourVision => '我們的願景';

  @override
  String get visionDescription => '成為最值得信賴的占星平台，將科技與古代智慧結合。';

  @override
  String get ourValues => '我們的價值觀';

  @override
  String get valuesDescription => '誠信、準確、以使用者為中心的設計、持續創新。';

  @override
  String get contactUs => '聯絡我們';

  @override
  String get contactEmail => '電子郵件：support@yourcompany.com';

  @override
  String get contactWebsite => '網址：www.yourcompany.com';

  @override
  String get customerSupport => '客戶支援';

  @override
  String get supportHeroTitle => '我們隨時為您提供協助';

  @override
  String get supportHeroDescription => '請填寫以下表格，我們的支援團隊將盡快與您聯繫。';

  @override
  String get yourName => '你的名字';

  @override
  String get yourEmail => '您的電子郵件';

  @override
  String get message => '訊息';

  @override
  String get enterEmail => '請輸入您的信箱';

  @override
  String get enterValidEmail => '請輸入有效的電子郵件地址';

  @override
  String enterField(Object fieldName) {
    return '輸入$fieldName';
  }

  @override
  String get send => '傳送';

  @override
  String get sending => '正在發送...';

  @override
  String get emailSentSuccess => '✅ 郵件已成功發送！';

  @override
  String get emailSendFailed => '❌ 郵件發送失敗';

  @override
  String get astroDictionaryTitle => '星象詞典';

  @override
  String get searchTermsHint => '搜尋詞…';

  @override
  String get noTermsFound => '未找到相關術語';

  @override
  String get buyQuestionsTitle => '購買問題';

  @override
  String get userNotAuthenticated => '用戶未通過身份驗證。';

  @override
  String get loadStoreDataFailed => '載入商店資料失敗';

  @override
  String get missingAuthToken => '缺少身份驗證令牌';

  @override
  String get merchantDisplayName => 'Astro聊天應用程式';

  @override
  String get paymentSuccessful => '✅ 付款成功！問題已發送';

  @override
  String paymentFailed(Object error) {
    return '❌ 付款失敗：$error';
  }

  @override
  String get yourBalance => '您的餘額';

  @override
  String questionsBalance(Object count) {
    return '$count 問題';
  }

  @override
  String get availableOffers => '現有優惠';

  @override
  String questionsCount(Object count) {
    return '$count 問題';
  }

  @override
  String get buyButton => '買';

  @override
  String get dailyHoroscopeTitle => '🌟每日星座運勢';

  @override
  String get userIdMissing => '使用者 ID 缺失';

  @override
  String get fetchHoroscopesFailed => '取得星座運勢失敗';

  @override
  String get noHoroscopeFound => '未找到星座運勢。';

  @override
  String get signLabel => '符號';

  @override
  String get todayLabel => '今天';

  @override
  String get yesterdayLabel => '昨天';

  @override
  String get thisWeekLabel => '本星期';

  @override
  String get lastMonthLabel => '上個月';

  @override
  String get chatTitle => '聊天';

  @override
  String get typeYourQuestionHint => '請輸入您的問題…';

  @override
  String get paymentRequired => '需支付款項';

  @override
  String get paymentRequiredMessage => '您已用完免費提問次數。支付 50 盧比即可繼續。';

  @override
  String get payNowButton => '立即支付';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count 剩餘免費問題數';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count 剩餘付費問題數';
  }

  @override
  String get thankYouFeedback => '感謝您的回饋！';

  @override
  String get ratingSubmitted => '評分已投稿！';

  @override
  String get setUserIdFirst => '請先設定您的用戶ID。';

  @override
  String get failedToFetchPrevious => '取得先前的問題和答案失敗';

  @override
  String errorOccurred(Object error) {
    return '錯誤：$error';
  }

  @override
  String get drawerAstroProfile => '星象概況';

  @override
  String get drawerDailyHoroscope => '每日星座運勢';

  @override
  String get drawerBuyQuestions => '購買問題';

  @override
  String get drawerAstroDictionary => '星象詞典';

  @override
  String get drawerSettings => '設定';

  @override
  String get drawerCustomerSupport => '客戶支援';

  @override
  String get drawerAbout => '關於';

  @override
  String get drawerProfileSettings => '個人資料設定';

  @override
  String get demoNotificationTitle => '🔔 示範通知';

  @override
  String get demoNotificationBody => '這是來自您應用程式的測試通知！';

  @override
  String get notificationsTitle => '通知';

  @override
  String get noNotifications => '無通知';

  @override
  String get allTab => '全部';

  @override
  String get markAllAsRead => '全部標記為已讀';

  @override
  String get notificationMarkedRead => '通知已讀';

  @override
  String get failedToLoadNotifications => '通知載入失敗';

  @override
  String get failedToMarkRead => '標記為已讀失敗';

  @override
  String get failedToMarkAllRead => '未能將所有內容標記為已讀';

  @override
  String get socketConnected => '插座已連接';

  @override
  String get socketDisconnected => '插座已斷開連接';

  @override
  String get newNotificationReceived => '收到新通知';

  @override
  String get generalCategory => '一般的';

  @override
  String get horoscopeCategory => '星座運勢';

  @override
  String get chatCategory => '聊天';

  @override
  String get systemCategory => '系統';

  @override
  String get updateCategory => '更新';

  @override
  String get howToAskTitle => '如何提問';

  @override
  String get noQuestionsAvailable => '暫無問題';

  @override
  String get failedToLoadQuestions => '問題加載失敗';

  @override
  String get pullToRefresh => '下拉重新整理';

  @override
  String get careerCategory => '職業';

  @override
  String get loveCategory => '愛情與人際關係';

  @override
  String get healthCategory => '健康';

  @override
  String get financeCategory => '金融';

  @override
  String get familyCategory => '家庭';

  @override
  String get educationCategory => '教育';

  @override
  String get travelCategory => '旅行';

  @override
  String get spiritualCategory => '精神';

  @override
  String get profileLoaded => '設定檔已成功加載';

  @override
  String get imageUploaded => '圖片上傳成功';

  @override
  String get savedInformationConfirmation => '我已儲存此訊息';

  @override
  String get noHistoryAvailable => '暫無歷史紀錄';

  @override
  String get missingUserIdError => '需要使用者 ID';

  @override
  String get networkError => '網路錯誤，請重試。';

  @override
  String get timeoutError => '請求超時';

  @override
  String get genericError => '出問題了';

  @override
  String get reactionUpdateError => '未能更新反應';

  @override
  String get noSearchResults => '未找到搜尋結果';

  @override
  String get clearSearch => '清除搜尋';

  @override
  String get resultsFound => '結果發現';

  @override
  String get recoverySecretHint => '複製貼上可能無法正常運作，請手動輸入。';

  @override
  String get recoverAccountDescription => '請依照以下步驟恢復您的帳戶';

  @override
  String get processingLabel => '加工...';

  @override
  String get clearChatSuccess => '聊天記錄已成功清除';

  @override
  String get notificationsEnabled => '已啟用通知';

  @override
  String get notificationsDisabled => '通知已禁用';

  @override
  String get securityNotice => '您的資料經過安全加密並儲存。';

  @override
  String get loading => '載入中...';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get onboardingGetStartedDesc => '首先選擇您的語言。';

  @override
  String get accountRecoveryTitle => '🔐 帳戶恢復詳情';

  @override
  String get recoveryInstructions => '請妥善保存此資訊。您需要它來恢復您的帳戶。';

  @override
  String get importantNotice => '⚠️ 重要提示：';

  @override
  String get astrologerProfileTitle => '占星師簡介';

  @override
  String get personalAstrologer => '私人占星師';

  @override
  String get makePersonalAstrologer => '聘請私人占星師';

  @override
  String get favoriteDescription =>
      '您的提問將優先由這位占星師解答。如果他/她不在，我們會安排另一位合格的占星師為您提供幫助。';

  @override
  String get educationQualifications => '教育背景及資格';

  @override
  String get aboutSection => '關於';

  @override
  String get shareProfile => '分享個人資料';

  @override
  String get loadingAstrologer => '正在加載占星師詳情…';

  @override
  String get failedToLoadAstrologer => '加載占星師詳情失敗';

  @override
  String get authenticationRequired => '需要身份驗證。請登入。';

  @override
  String securityCheckFailed(Object error) {
    return '安全檢查失敗：$error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name 現在是您的私人占星師';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ 從收藏夾移除 $name';
  }

  @override
  String get toggleFavoriteError => '更新收藏狀態失敗';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n\n🎓 教育背景：$education\n\n📜 資格證書：$qualification\n\n⏳ 工作經驗：$experience';
  }

  @override
  String get notProvided => '未提供';

  @override
  String reviews(Object count) {
    return '（$count 一則評論）';
  }

  @override
  String get specialties => '專業領域';

  @override
  String get experience => '經驗';

  @override
  String get qualification => '資格';

  @override
  String get education => '教育';

  @override
  String get recoveryTips =>
      '• 請截圖儲存此訊息\n\n• 請將其保存在安全的地方\n\n• 請勿與任何人分享\n\n• 此資訊僅顯示一次';
}
