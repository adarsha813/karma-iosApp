// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get settingsTitle => '설정';

  @override
  String get notificationSettings => '알림 설정';

  @override
  String get privacySettings => '개인정보 보호 설정';

  @override
  String get accountSettings => '계정 설정';

  @override
  String get languageSettings => '언어 설정';

  @override
  String get languageChanged => '언어가 변경되었습니다';

  @override
  String get existingUserButton => '저는 기존 사용자입니다';

  @override
  String get chooseCountryTitle => '국가 선택';

  @override
  String get yesText => '예';

  @override
  String get noText => '아니요';

  @override
  String get appBarTitle => '프로필 설정';

  @override
  String get userIdLabel => '사용자 ID *';

  @override
  String get nameLabel => '이름';

  @override
  String get birthCountryLabel => '출생 국가';

  @override
  String get birthCityLabel => '출생 도시';

  @override
  String get countrySelectionTitle => '국가를 선택하세요';

  @override
  String get maleLabel => '남성';

  @override
  String get femaleLabel => '여성';

  @override
  String get birthDateLabel => '생년월일';

  @override
  String get birthDatePlaceholder => '생년월일을 선택하세요';

  @override
  String get birthTimeLabel => '출생 시간';

  @override
  String get birthTimePlaceholder => '출생 시간 선택';

  @override
  String get saveProfileButton => '프로필 저장';

  @override
  String get noCitiesFound => '도시를 찾을 수 없습니다';

  @override
  String cityPlaceholder(Object country) {
    return '$country에 도시를 입력하세요';
  }

  @override
  String get countryFirstPlaceholder => '먼저 국가를 선택하세요';

  @override
  String get versionHistoryTitle => '버전 기록';

  @override
  String get notSetText => '설정되지 않음';

  @override
  String nameHistory(Object name) {
    return '이름: $name';
  }

  @override
  String cityHistory(Object city) {
    return '도시: $city';
  }

  @override
  String countryHistory(Object country) {
    return '국가: $country';
  }

  @override
  String genderHistory(Object gender) {
    return '성별: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return '생년월일: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return '출생 시간: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return '위치: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return '시간대: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return '일광절약시간(DST): $value';
  }

  @override
  String stateHistory(Object state) {
    return '상태: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date에 업데이트됨';
  }

  @override
  String get userIdRequired => '사용자 ID가 필요합니다';

  @override
  String get profileSaved => '프로필이 성공적으로 저장되었습니다.';

  @override
  String get saveFailed => '프로필 저장에 실패했습니다';

  @override
  String get errorPrefix => '오류:';

  @override
  String get onboardingChooseLanguage => '언어를 선택하세요';

  @override
  String get onboardingChooseLanguageDesc => '계속하려면 원하는 언어를 선택하세요.';

  @override
  String get onboardingWhatIsAstrology => '점성술이란 무엇인가?';

  @override
  String get onboardingWhatIsAstrologyDesc => '점성술은 천체를 연구하는 학문입니다.';

  @override
  String get onboardingWhyUseApp => '왜 이 앱을 사용해야 하나요?';

  @override
  String get onboardingWhyUseAppDesc =>
      '개인화된 운세, 일일 예측 및 안내를 받아 정보에 입각한 결정을 내리세요.';

  @override
  String get onboardingHowToUse => '이 앱을 어떻게 사용하나요?';

  @override
  String get onboardingHowToUseDesc =>
      '쉽게 탐색하고, 일일 운세를 확인하고, 정확한 예측을 위해 프로필을 관리하세요.';

  @override
  String get onboardingGetStarted => '시작하기';

  @override
  String get onboardingNewUser => '신규 사용자';

  @override
  String get onboardingExistingUser => '기존 사용자';

  @override
  String get onboardingBack => '뒤쪽에';

  @override
  String get onboardingNext => '다음';

  @override
  String get userIdNotFound => '사용자 ID를 찾을 수 없습니다. 로그인하거나 프로필을 설정하세요.';

  @override
  String get clearNotificationsTitle => '알림 지우기';

  @override
  String get clearNotificationsMessage => '모든 알림을 지우시겠습니까?';

  @override
  String get clearNotificationsSuccess => '모든 알림이 성공적으로 삭제되었습니다.';

  @override
  String get clearHoroscopeTitle => '클리어 운세';

  @override
  String get clearHoroscopeMessage => '운세 데이터를 지우시겠습니까?';

  @override
  String get clearHoroscopeSuccess => '운세가 성공적으로 완료되었습니다.';

  @override
  String get clearChatTitle => '채팅 기록 지우기';

  @override
  String get clearChatMessage => '모든 채팅 기록을 삭제하시겠습니까?';

  @override
  String get clearChatLocal => '채팅이 로컬에서 삭제되었습니다.';

  @override
  String get deleteAccountTitle => '계정 삭제';

  @override
  String get deleteAccountMessage => '계정을 삭제하시겠습니까? 삭제하면 모든 채팅 기록과 알림이 삭제됩니다.';

  @override
  String get deleteAccountSuccess => '귀하의 계정과 모든 데이터가 삭제되었습니다.';

  @override
  String get deleteAccountError => '계정 삭제 오류';

  @override
  String get logoutTitle => '로그아웃';

  @override
  String get logoutMessage => '로그아웃하시겠습니까?';

  @override
  String get termsPrivacyTitle => '이용약관 및 개인정보처리방침';

  @override
  String get privacyPolicyTitle => '개인정보 보호정책';

  @override
  String get termsConditionsTitle => '이용 약관';

  @override
  String get dataControlTitle => '데이터 제어';

  @override
  String get cancelButton => '취소';

  @override
  String get confirmButton => '확인하다';

  @override
  String get clearQuestionsSuccess => '모든 질문이 성공적으로 삭제되었습니다.';

  @override
  String get yoginiLabel => '요기니';

  @override
  String get lordLabel => '주님';

  @override
  String get startLabel => '시작';

  @override
  String get recoverAccount => '계정 복구';

  @override
  String get endLabel => '끝';

  @override
  String get startDateLabel => '시작 날짜';

  @override
  String get endDateLabel => '종료일';

  @override
  String get notAvailable => '사용할 수 없음';

  @override
  String get noData => '데이터 없음';

  @override
  String get unknownError => '알 수 없는 오류';

  @override
  String get retryButton => '다시 해 보다';

  @override
  String get kundaliGeneratorTitle => '쿤달리 생성기';

  @override
  String get natalChartTitle => '출생 차트';

  @override
  String get lagnaLabel => '라그나';

  @override
  String get rashiLabel => '라시';

  @override
  String get ascDegreeLabel => '상승도';

  @override
  String get vimshottariDashaTitle => '빔쇼타리 다샤';

  @override
  String get yoginiDashaTitle => '요기니 다샤';

  @override
  String get unknown => '알려지지 않은';

  @override
  String get clearHoroscope => '클리어 운세';

  @override
  String get clearNotifications => '알림 지우기';

  @override
  String get clearChatHistory => '채팅 기록 지우기';

  @override
  String get logout => '로그아웃';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get allFieldsRequired => '모든 항목은 필수입니다.';

  @override
  String get accountRecoveredSuccess => '계정이 성공적으로 복구되었습니다.';

  @override
  String get recoveryFailed => '복구에 실패했습니다. 정보를 확인하세요.';

  @override
  String get recoverySecretLabel => '회복의 비결:';

  @override
  String get aboutUsTitle => '회사 소개';

  @override
  String get aboutOurCompany => '회사 소개';

  @override
  String get aboutCompanyDescription =>
      '카르마는 베다 점성술의 시대를 초월한 지혜를 통해 당신의 진정한 삶의 길을 찾도록 도와드립니다. 모든 통찰력은 당신의 고유한 출생 차트를 기반으로 세심하게 구성된, 경험 많은 실제 점성가들로부터 나옵니다. 일일 운세부터 개인 맞춤 안내까지, 카르마는 100개 이상의 언어로 고대 지식을 접할 수 있도록 지원합니다.';

  @override
  String get ourMission => '우리의 사명';

  @override
  String get missionDescription =>
      '저희의 사명은 간단합니다. 바로, 여러분이 자신 있고 정보에 기반한 결정을 내릴 수 있도록, 진정성 있고 인간 중심적인 점성술 가이드를 제공하는 것입니다. 모든 예측과 상담은 자동화된 알고리즘이 아닌, 오랜 세월 축적된 전문 지식을 바탕으로 합니다.';

  @override
  String get ourVision => '우리의 비전';

  @override
  String get visionDescription =>
      '우리는 전 세계 사람들이 자신과 자신의 선택, 그리고 삶의 여정을 명확하고 자신감 있게 이해하도록 돕고자 베다 점성술 분야에서 세계에서 가장 신뢰받는 플랫폼이 되기 위해 노력합니다.';

  @override
  String get ourValues => '우리의 가치';

  @override
  String get valuesDescription =>
      '카르마는 진정성, 정확성, 그리고 신뢰를 중시합니다. 정확할 뿐만 아니라 의미 있는 조언을 제공하여 통찰력과 자신감을 가지고 삶을 헤쳐나갈 수 있도록 도와드립니다.';

  @override
  String get contactUs => '문의하기';

  @override
  String get contactEmail => '이메일: support@yourcompany.com';

  @override
  String get contactWebsite => '웹사이트: www.yourcompany.com';

  @override
  String get customerSupport => '고객 지원';

  @override
  String get supportHeroTitle => '우리는 당신을 돕기 위해 여기에 있습니다';

  @override
  String get supportHeroDescription =>
      '아래 양식을 작성하시면 저희 지원팀에서 최대한 빨리 답변해 드리겠습니다.';

  @override
  String get yourName => '당신의 이름';

  @override
  String get yourEmail => '귀하의 이메일';

  @override
  String get message => '메시지';

  @override
  String get enterEmail => '이메일을 입력하세요';

  @override
  String get enterValidEmail => '유효한 이메일 주소를 입력하세요';

  @override
  String enterField(Object fieldName) {
    return '$fieldName을 입력하세요';
  }

  @override
  String get send => '보내다';

  @override
  String get sending => '배상...';

  @override
  String get emailSentSuccess => '✅ 이메일이 성공적으로 전송되었습니다!';

  @override
  String get emailSendFailed => '❌ 이메일 전송에 실패했습니다';

  @override
  String get astroDictionaryTitle => '천체 사전';

  @override
  String get searchTermsHint => '검색어...';

  @override
  String get noTermsFound => '용어를 찾을 수 없습니다';

  @override
  String get buyQuestionsTitle => '구매 질문';

  @override
  String get userNotAuthenticated => '사용자가 인증되지 않았습니다';

  @override
  String get loadStoreDataFailed => '매장 데이터를 로드하는 데 실패했습니다.';

  @override
  String get missingAuthToken => '인증 토큰이 없습니다';

  @override
  String get merchantDisplayName => '아스트로 채팅 앱';

  @override
  String get paymentSuccessful => '✅ 결제 성공! 질문이 전송되었습니다.';

  @override
  String paymentFailed(Object error) {
    return '❌ 결제 실패: $error';
  }

  @override
  String get yourBalance => '잔액';

  @override
  String questionsBalance(Object count) {
    return '$count 질문';
  }

  @override
  String get availableOffers => '사용 가능한 제안';

  @override
  String questionsCount(Object count) {
    return '$count 질문';
  }

  @override
  String get buyButton => '구입하다';

  @override
  String get dailyHoroscopeTitle => '🌟 일일 운세';

  @override
  String get userIdMissing => '사용자 ID가 없습니다';

  @override
  String get fetchHoroscopesFailed => '운세를 가져오지 못했습니다';

  @override
  String get noHoroscopeFound => '운세를 찾을 수 없습니다.';

  @override
  String get signLabel => '징후';

  @override
  String get todayLabel => '오늘';

  @override
  String get yesterdayLabel => '어제';

  @override
  String get thisWeekLabel => '이번 주';

  @override
  String get lastMonthLabel => '전달';

  @override
  String get chatTitle => '채팅';

  @override
  String get typeYourQuestionHint => '질문을 입력하세요...';

  @override
  String get paymentRequired => '결제 필요';

  @override
  String paymentRequiredMessage(Object amount) {
    return '무료 질문을 모두 사용했습니다. 계속하려면 $amount을(를) 결제하세요.';
  }

  @override
  String get payNowButton => '지금 결제하세요';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count개의 무료 질문이 남았습니다.';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count개의 유료 질문이 남았습니다.';
  }

  @override
  String get thankYouFeedback => '귀하의 피드백에 감사드립니다!';

  @override
  String get ratingSubmitted => '평가가 제출되었습니다!';

  @override
  String get setUserIdFirst => '먼저 사용자 ID를 설정해 주세요.';

  @override
  String get failedToFetchPrevious => '이전 질문과 답변을 가져오지 못했습니다.';

  @override
  String errorOccurred(Object error) {
    return '오류: $error';
  }

  @override
  String get drawerAstroProfile => '천체 프로필';

  @override
  String get drawerDailyHoroscope => '일일 운세';

  @override
  String get drawerBuyQuestions => '구매 질문';

  @override
  String get drawerAstroDictionary => '천체 사전';

  @override
  String get drawerSettings => '설정';

  @override
  String get drawerCustomerSupport => '고객 지원';

  @override
  String get drawerAbout => '에 대한';

  @override
  String get drawerProfileSettings => '프로필 설정';

  @override
  String get demoNotificationTitle => '🔔 데모 알림';

  @override
  String get demoNotificationBody => '이는 앱의 테스트 알림입니다!';

  @override
  String get notificationsTitle => '알림';

  @override
  String get noNotifications => '알림 없음';

  @override
  String get allTab => '모두';

  @override
  String get markAllAsRead => '모두 읽음으로 표시';

  @override
  String get notificationMarkedRead => '알림이 읽음으로 표시됨';

  @override
  String get failedToLoadNotifications => '알림을 로드하는 데 실패했습니다.';

  @override
  String get failedToMarkRead => '읽음으로 표시하지 못했습니다.';

  @override
  String get failedToMarkAllRead => '모두 읽음으로 표시하지 못했습니다.';

  @override
  String get socketConnected => '소켓 연결됨';

  @override
  String get socketDisconnected => '소켓이 분리되었습니다';

  @override
  String get newNotificationReceived => '새로운 알림이 수신되었습니다';

  @override
  String get generalCategory => '일반적인';

  @override
  String get horoscopeCategory => '점성';

  @override
  String get chatCategory => '채팅';

  @override
  String get systemCategory => '체계';

  @override
  String get updateCategory => '업데이트';

  @override
  String get howToAskTitle => '질문하는 방법';

  @override
  String get noQuestionsAvailable => '질문이 없습니다';

  @override
  String get failedToLoadQuestions => '질문을 불러오지 못했습니다';

  @override
  String get pullToRefresh => '당겨서 새로고침';

  @override
  String get careerCategory => '직업';

  @override
  String get loveCategory => '사랑과 관계';

  @override
  String get healthCategory => '건강';

  @override
  String get financeCategory => '재원';

  @override
  String get familyCategory => '가족';

  @override
  String get educationCategory => '교육';

  @override
  String get travelCategory => '여행하다';

  @override
  String get spiritualCategory => '영적인';

  @override
  String get profileLoaded => '프로필이 성공적으로 로드되었습니다.';

  @override
  String get imageUploaded => '이미지가 성공적으로 업로드되었습니다';

  @override
  String get savedInformationConfirmation => '이 정보를 저장했습니다';

  @override
  String get noHistoryAvailable => '사용 가능한 기록이 없습니다';

  @override
  String get missingUserIdError => '사용자 ID가 필요합니다';

  @override
  String get networkError => '네트워크 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get timeoutError => '요청 시간이 초과되었습니다';

  @override
  String get genericError => '뭔가 잘못되었습니다';

  @override
  String get reactionUpdateError => '반응 업데이트에 실패했습니다';

  @override
  String get noSearchResults => '검색 결과가 없습니다';

  @override
  String get clearSearch => '검색 지우기';

  @override
  String get resultsFound => '검색된 결과';

  @override
  String get recoverySecretHint => '복사-붙여넣기가 작동하지 않을 수 있으므로 직접 입력하세요.';

  @override
  String get recoverAccountDescription => '계정을 복구하려면 다음 단계를 따르세요.';

  @override
  String get processingLabel => '처리 중...';

  @override
  String get clearChatSuccess => '채팅이 성공적으로 삭제되었습니다';

  @override
  String get notificationsEnabled => '알림이 활성화되었습니다';

  @override
  String get notificationsDisabled => '알림 비활성화됨';

  @override
  String get securityNotice => '귀하의 데이터는 안전하게 암호화되어 저장됩니다.';

  @override
  String get loading => '로딩중...';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get onboardingGetStartedDesc => '언어를 선택하여 시작하세요';

  @override
  String get accountRecoveryTitle => '🔐 계정 복구 세부 정보';

  @override
  String get recoveryInstructions => '이 정보를 안전하게 보관해 주세요. 계정을 복구하는 데 필요합니다.';

  @override
  String get importantNotice => '⚠️ 중요:';

  @override
  String get astrologerProfileTitle => '점성가 프로필';

  @override
  String get personalAstrologer => '개인 점성가';

  @override
  String get makePersonalAstrologer => '개인 점성가 만들기';

  @override
  String get favoriteDescription =>
      '귀하의 질문은 이 점성가에게 우선적으로 전달됩니다. 만약 연락이 닿지 않을 경우, 자격을 갖춘 다른 점성가가 도와드릴 것입니다.';

  @override
  String get educationQualifications => '교육 및 자격';

  @override
  String get aboutSection => '에 대한';

  @override
  String get shareProfile => '프로필 공유';

  @override
  String get loadingAstrologer => '점성가 세부정보를 불러오는 중...';

  @override
  String get failedToLoadAstrologer => '점성가 세부 정보를 로드하는 데 실패했습니다.';

  @override
  String get authenticationRequired => '인증이 필요합니다. 로그인해 주세요.';

  @override
  String securityCheckFailed(Object error) {
    return '보안 검사에 실패했습니다: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name이 이제 당신의 개인 점성가입니다';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ 즐겨찾기에서 $name을(를) 제거했습니다.';
  }

  @override
  String get toggleFavoriteError => '즐겨찾기 상태를 업데이트하지 못했습니다.';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 학력: $education\n📜 자격: $qualification\n⏳ 경력: $experience';
  }

  @override
  String get notProvided => '제공되지 않음';

  @override
  String reviews(Object count) {
    return '($count개 리뷰)';
  }

  @override
  String get specialties => '특산품';

  @override
  String get experience => '경험';

  @override
  String get qualification => '자격';

  @override
  String get education => '교육';

  @override
  String get recoveryTips =>
      '• 이 정보의 스크린샷을 찍으세요.\n• 안전한 곳에 보관하세요.\n• 누구와도 공유하지 마세요.\n• 이 정보는 한 번만 표시됩니다.';

  @override
  String get themeSettingsTitle => '테마 설정';

  @override
  String get lightThemeLabel => '빛';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => '어두운';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => '체계';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => '우리 팀';

  @override
  String get teamDescription =>
      '저희 전문 베다 점성가 팀은 행성의 영향과 삶의 패턴을 해석하는 데 수년간의 경험을 보유하고 있습니다. 헌신적인 지원 및 개발팀의 지원을 바탕으로 Karma는 모든 사용자에게 원활하고 안정적이며 글로벌한 경험을 제공합니다.';
}
