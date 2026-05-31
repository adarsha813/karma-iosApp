// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get settingsTitle => '設定';

  @override
  String get notificationSettings => '通知設定';

  @override
  String get privacySettings => 'プライバシー設定';

  @override
  String get accountSettings => 'アカウント設定';

  @override
  String get languageSettings => '言語設定';

  @override
  String get languageChanged => '言語が変更されました';

  @override
  String get existingUserButton => '私は既存のユーザーです';

  @override
  String get chooseCountryTitle => '国を選択';

  @override
  String get yesText => 'はい';

  @override
  String get noText => 'いいえ';

  @override
  String get appBarTitle => 'プロフィール設定';

  @override
  String get userIdLabel => 'ユーザーID *';

  @override
  String get nameLabel => '名前';

  @override
  String get birthCountryLabel => '出生地';

  @override
  String get birthCityLabel => '出生地';

  @override
  String get countrySelectionTitle => '国を選択してください';

  @override
  String get maleLabel => '男';

  @override
  String get femaleLabel => '女性';

  @override
  String get birthDateLabel => '生年月日';

  @override
  String get birthDatePlaceholder => '生年月日を選択';

  @override
  String get birthTimeLabel => '出生時間';

  @override
  String get birthTimePlaceholder => '出生時間を選択';

  @override
  String get saveProfileButton => 'プロフィールを保存';

  @override
  String get noCitiesFound => '都市が見つかりません';

  @override
  String cityPlaceholder(Object country) {
    return '$country に都市名を入力してください';
  }

  @override
  String get countryFirstPlaceholder => '最初に国を選択してください';

  @override
  String get versionHistoryTitle => 'バージョン履歴';

  @override
  String get notSetText => '未設定';

  @override
  String nameHistory(Object name) {
    return '名前: $name';
  }

  @override
  String cityHistory(Object city) {
    return '都市: $city';
  }

  @override
  String countryHistory(Object country) {
    return '国: $country';
  }

  @override
  String genderHistory(Object gender) {
    return '性別: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return '生年月日: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return '出生時間: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return '場所: $latitude、$longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'タイムゾーン: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return '夏時間: $value';
  }

  @override
  String stateHistory(Object state) {
    return '州: $state';
  }

  @override
  String versionFromText(Object date) {
    return '$date に更新されました';
  }

  @override
  String get userIdRequired => 'ユーザーIDが必要です';

  @override
  String get profileSaved => 'プロフィールが正常に保存されました';

  @override
  String get saveFailed => 'プロフィールを保存できませんでした';

  @override
  String get errorPrefix => 'エラー：';

  @override
  String get onboardingChooseLanguage => '言語を選択してください';

  @override
  String get onboardingChooseLanguageDesc => '続行するには、希望する言語を選択してください。';

  @override
  String get onboardingWhatIsAstrology => '占星術とは何ですか?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      '占星術は天体の動きとそれが人間の生活に与える影響を研究する古代の研究であり、性格、人間関係、人生の出来事についての洞察を提供します。';

  @override
  String get onboardingWhyUseApp => 'このアプリを使用する理由';

  @override
  String get onboardingWhyUseAppDesc =>
      'あなたの出生図に合わせて、人間が作成した正確なホロスコープとガイダンスをお届けします。経験豊富な占星術師による毎日の予測と個別のアドバイスで、情報に基づいた意思決定を。';

  @override
  String get onboardingHowToUse => 'このアプリの使い方は？';

  @override
  String get onboardingHowToUseDesc =>
      '生年月日、正確な時刻、出生地、その他必要な情報を入力するだけで、すぐに占いを始められます。毎日の星占いをチェックしたり、専門の占星術師に質問したり、プロフィールを管理して、正確でパーソナライズされた予測を入手したりできます。ログインは不要です。';

  @override
  String get onboardingGetStarted => '始める';

  @override
  String get onboardingNewUser => '新規ユーザー';

  @override
  String get onboardingExistingUser => '既存ユーザー';

  @override
  String get onboardingBack => '戻る';

  @override
  String get onboardingNext => '次';

  @override
  String get userIdNotFound => 'ユーザーIDが見つかりません。ログインするか、プロフィールを設定してください。';

  @override
  String get clearNotificationsTitle => '通知をクリアする';

  @override
  String get clearNotificationsMessage => 'すべての通知をクリアしてもよろしいですか?';

  @override
  String get clearNotificationsSuccess => 'すべての通知が正常にクリアされました。';

  @override
  String get clearHoroscopeTitle => 'クリアホロスコープ';

  @override
  String get clearHoroscopeMessage => '星占いデータを消去してもよろしいですか?';

  @override
  String get clearHoroscopeSuccess => 'ホロスコープが正常にクリアされました。';

  @override
  String get clearChatTitle => 'チャット履歴を消去';

  @override
  String get clearChatMessage => 'すべてのチャット履歴を削除してもよろしいですか?';

  @override
  String get clearChatLocal => 'チャットはローカルでクリアされました。';

  @override
  String get deleteAccountTitle => 'アカウントを削除';

  @override
  String get deleteAccountMessage =>
      'アカウントを削除してもよろしいですか？削除すると、チャット履歴と通知もすべて消去されます。';

  @override
  String get deleteAccountSuccess => 'アカウントとすべてのデータが削除されました。';

  @override
  String get deleteAccountError => 'アカウントの削除中にエラーが発生しました';

  @override
  String get logoutTitle => 'ログアウト';

  @override
  String get logoutMessage => 'ログアウトしてもよろしいですか?';

  @override
  String get termsPrivacyTitle => '利用規約とプライバシー';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get termsConditionsTitle => '利用規約';

  @override
  String get dataControlTitle => 'データ管理';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get confirmButton => '確認する';

  @override
  String get clearQuestionsSuccess => 'すべての質問が正常に削除されました。';

  @override
  String get yoginiLabel => 'ヨギーニ';

  @override
  String get lordLabel => '主';

  @override
  String get startLabel => '始める';

  @override
  String get recoverAccount => 'アカウントを回復する';

  @override
  String get endLabel => '終わり';

  @override
  String get startDateLabel => '開始日';

  @override
  String get endDateLabel => '終了日';

  @override
  String get notAvailable => '利用不可';

  @override
  String get noData => 'データなし';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get retryButton => 'リトライ';

  @override
  String get kundaliGeneratorTitle => 'クンダリジェネレータ';

  @override
  String get natalChartTitle => '出生図';

  @override
  String get lagnaLabel => 'ラグナ';

  @override
  String get rashiLabel => 'ラシ';

  @override
  String get ascDegreeLabel => 'アセンダント度数';

  @override
  String get vimshottariDashaTitle => 'ヴィムショタリ・ダシャ';

  @override
  String get yoginiDashaTitle => 'ヨギーニ・ダシャ';

  @override
  String get unknown => '未知';

  @override
  String get clearHoroscope => 'クリアホロスコープ';

  @override
  String get clearNotifications => '通知をクリアする';

  @override
  String get clearChatHistory => 'チャット履歴を消去';

  @override
  String get logout => 'ログアウト';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get allFieldsRequired => 'すべてのフィールドが必須です。';

  @override
  String get accountRecoveredSuccess => 'アカウントが正常に回復されました。';

  @override
  String get recoveryFailed => '回復に失敗しました。情報を確認してください。';

  @override
  String get recoverySecretLabel => '回復の秘密:';

  @override
  String get aboutUsTitle => '私たちについて';

  @override
  String get aboutOurCompany => '当社について';

  @override
  String get aboutCompanyDescription =>
      'Karmaでは、時代を超えたヴェーダ占星術の叡智を通して、あなたの真の人生の道を見つけるお手伝いをいたします。すべての洞察は、経験豊富な現役占星術師が、あなただけの出生図に基づいて丁寧に作成します。毎日のホロスコープから個別のガイダンスまで、Karmaは古代の知識を100以上の言語で提供しています。';

  @override
  String get ourMission => '私たちの使命';

  @override
  String get missionDescription =>
      '私たちの使命はシンプルです。それは、確かな情報に基づいた、自信に満ちた決断を下せるよう、真摯で人間味あふれる占星術のアドバイスを提供することです。すべての予測とコンサルティングは、自動化されたアルゴリズムではなく、長年の専門知識に基づいて作成されています。';

  @override
  String get ourVision => '私たちのビジョン';

  @override
  String get visionDescription =>
      '私たちは、ヴェーダ占星術における世界で最も信頼されるプラットフォームとなることを目指し、世界中の人々が自分自身、自分の選択、そして人生の旅を明確かつ自信を持って理解できるよう支援します。';

  @override
  String get ourValues => '私たちの価値観';

  @override
  String get valuesDescription =>
      'カルマでは、信頼性、正確性、そして信頼を大切にしています。正確であるだけでなく、意義深いアドバイスを提供することで、洞察力と自信をもって人生を歩んでいくお手伝いをいたします。';

  @override
  String get contactUs => 'お問い合わせ';

  @override
  String get contactEmail => 'メールアドレス: care@karmalifepath.com';

  @override
  String get contactWebsite => 'ウェブサイト: www.karmalifepath.com';

  @override
  String get customerSupport => 'カスタマーサポート';

  @override
  String get supportHeroTitle => '私たちはお手伝いします';

  @override
  String get supportHeroDescription =>
      '以下のフォームにご記入いただければ、弊社のサポートチームができるだけ早くご返答いたします。';

  @override
  String get yourName => 'あなたの名前';

  @override
  String get yourEmail => 'あなたのメールアドレス';

  @override
  String get message => 'メッセージ';

  @override
  String get enterEmail => 'メールアドレスを入力してください';

  @override
  String get enterValidEmail => '有効なメールアドレスを入力してください';

  @override
  String enterField(Object fieldName) {
    return '$fieldName と入力します';
  }

  @override
  String get send => '送信';

  @override
  String get sending => '送信中...';

  @override
  String get emailSentSuccess => '✅ メールは正常に送信されました!';

  @override
  String get emailSendFailed => '❌ メールの送信に失敗しました';

  @override
  String get astroDictionaryTitle => 'アストロ辞書';

  @override
  String get searchTermsHint => '検索用語...';

  @override
  String get noTermsFound => '用語が見つかりません';

  @override
  String get buyQuestionsTitle => '購入に関する質問';

  @override
  String get userNotAuthenticated => 'ユーザーが認証されていません';

  @override
  String get loadStoreDataFailed => 'ストアデータの読み込みに失敗しました';

  @override
  String get missingAuthToken => '認証トークンがありません';

  @override
  String get merchantDisplayName => 'アストロチャットアプリ';

  @override
  String get paymentSuccessful => '✅ お支払いが完了しました！質問を送信しました';

  @override
  String paymentFailed(Object error) {
    return '❌ 支払いに失敗しました: $error';
  }

  @override
  String get yourBalance => '残高';

  @override
  String questionsBalance(Object count) {
    return '$count 質問';
  }

  @override
  String get availableOffers => '利用可能なオファー';

  @override
  String questionsCount(Object count) {
    return '$count 質問';
  }

  @override
  String get buyButton => '買う';

  @override
  String get dailyHoroscopeTitle => ' 毎日の星占い';

  @override
  String get userIdMissing => 'ユーザーIDがありません';

  @override
  String get fetchHoroscopesFailed => '星占いを取得できませんでした';

  @override
  String get noHoroscopeFound => '星占いが見つかりません。';

  @override
  String get signLabel => 'サイン';

  @override
  String get todayLabel => '今日';

  @override
  String get yesterdayLabel => '昨日';

  @override
  String get thisWeekLabel => '今週';

  @override
  String get lastMonthLabel => '先月';

  @override
  String get chatTitle => 'チャット';

  @override
  String get typeYourQuestionHint => '質問を入力してください...';

  @override
  String get paymentRequired => 'お支払いが必要です';

  @override
  String paymentRequiredMessage(Object amount) {
    return '無料の質問はご利用いただけました。続行するには$amount をお支払いください。';
  }

  @override
  String get payNowButton => '今すぐ支払う';

  @override
  String freeQuestionsRemaining(Object count) {
    return '無料の質問が $count 問残っています';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '残りの有料質問は $count 件です';
  }

  @override
  String get thankYouFeedback => 'フィードバックありがとうございます！';

  @override
  String get ratingSubmitted => '評価を送信しました!';

  @override
  String get setUserIdFirst => 'まずユーザーIDを設定してください';

  @override
  String get failedToFetchPrevious => '以前の質問と回答を取得できませんでした';

  @override
  String errorOccurred(Object error) {
    return 'エラー: $error';
  }

  @override
  String get drawerAstroProfile => 'アストロプロフィール';

  @override
  String get drawerDailyHoroscope => '毎日の星占い';

  @override
  String get drawerBuyQuestions => '購入に関する質問';

  @override
  String get drawerAstroDictionary => 'アストロ辞書';

  @override
  String get drawerSettings => '設定';

  @override
  String get drawerCustomerSupport => 'カスタマーサポート';

  @override
  String get drawerAbout => 'について';

  @override
  String get drawerProfileSettings => 'プロフィール設定';

  @override
  String get demoNotificationTitle => '🔔デモ通知';

  @override
  String get demoNotificationBody => 'これはアプリからのテスト通知です。';

  @override
  String get notificationsTitle => '通知';

  @override
  String get noNotifications => '通知なし';

  @override
  String get allTab => '全て';

  @override
  String get markAllAsRead => 'すべてを既読にする';

  @override
  String get notificationMarkedRead => '通知を既読としてマークしました';

  @override
  String get failedToLoadNotifications => '通知を読み込めませんでした';

  @override
  String get failedToMarkRead => '既読にできませんでした';

  @override
  String get failedToMarkAllRead => 'すべてを既読にできませんでした';

  @override
  String get socketConnected => 'ソケット接続';

  @override
  String get socketDisconnected => 'ソケットが切断されました';

  @override
  String get newNotificationReceived => '新しい通知を受信しました';

  @override
  String get generalCategory => '一般的な';

  @override
  String get horoscopeCategory => '星占い';

  @override
  String get chatCategory => 'チャット';

  @override
  String get systemCategory => 'システム';

  @override
  String get updateCategory => 'アップデート';

  @override
  String get howToAskTitle => '質問の仕方';

  @override
  String get noQuestionsAvailable => '質問はありません';

  @override
  String get failedToLoadQuestions => '質問を読み込めませんでした';

  @override
  String get pullToRefresh => '引いて更新';

  @override
  String get careerCategory => 'キャリア';

  @override
  String get loveCategory => '愛と人間関係';

  @override
  String get healthCategory => '健康';

  @override
  String get financeCategory => 'ファイナンス';

  @override
  String get familyCategory => '家族';

  @override
  String get educationCategory => '教育';

  @override
  String get travelCategory => '旅行';

  @override
  String get spiritualCategory => 'スピリチュアル';

  @override
  String get profileLoaded => 'プロフィールが正常に読み込まれました';

  @override
  String get imageUploaded => '画像のアップロードに成功しました';

  @override
  String get savedInformationConfirmation => 'この情報を保存しました';

  @override
  String get noHistoryAvailable => '履歴はありません';

  @override
  String get missingUserIdError => 'ユーザーIDが必要です';

  @override
  String get networkError => 'ネットワークエラーです。もう一度お試しください。';

  @override
  String get timeoutError => 'リクエストがタイムアウトしました';

  @override
  String get genericError => '問題が発生しました';

  @override
  String get reactionUpdateError => '反応を更新できませんでした';

  @override
  String get noSearchResults => '検索結果が見つかりません';

  @override
  String get clearSearch => '検索をクリア';

  @override
  String get resultsFound => '見つかった結果';

  @override
  String get recoverySecretHint => 'コピー＆ペーストが機能しない可能性があります。手動で入力してください。';

  @override
  String get recoverAccountDescription => 'アカウントを回復するには、次の手順に従ってください';

  @override
  String get processingLabel => '処理...';

  @override
  String get clearChatSuccess => 'チャットは正常にクリアされました';

  @override
  String get notificationsEnabled => '通知が有効';

  @override
  String get notificationsDisabled => '通知が無効になっています';

  @override
  String get securityNotice => 'データは安全に暗号化され保存されます';

  @override
  String get loading => '読み込み中...';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get onboardingGetStartedDesc => '言語を選択して始めましょう';

  @override
  String get accountRecoveryTitle => '🔐 アカウント回復の詳細';

  @override
  String get recoveryInstructions => 'この情報は安全に保管してください。アカウントを復旧する際に必要となります。';

  @override
  String get importantNotice => '⚠️ 重要:';

  @override
  String get astrologerProfileTitle => '占星術師プロフィール';

  @override
  String get personalAstrologer => '個人占星術師';

  @override
  String get makePersonalAstrologer => 'パーソナル占星術師を作る';

  @override
  String get favoriteDescription =>
      'ご質問は、この占星術師が優先的に対応いたします。担当できない場合は、別の資格を持った占星術師が対応いたします。';

  @override
  String get educationQualifications => '学歴と資格';

  @override
  String get aboutSection => 'について';

  @override
  String get shareProfile => 'プロフィールを共有';

  @override
  String get loadingAstrologer => '占星術師の詳細を読み込んでいます...';

  @override
  String get failedToLoadAstrologer => '占星術師の詳細を読み込めませんでした';

  @override
  String get authenticationRequired => '認証が必要です。ログインしてください。';

  @override
  String securityCheckFailed(Object error) {
    return 'セキュリティ チェックに失敗しました: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name があなたのパーソナル占星術師になりました';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name をお気に入りから削除しました';
  }

  @override
  String get toggleFavoriteError => 'お気に入りステータスの更新に失敗しました';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 学歴: $education\n📜 資格: $qualification\n⏳ 経験: $experience';
  }

  @override
  String get notProvided => '提供されていません';

  @override
  String reviews(Object count) {
    return '（$count 件のレビュー）';
  }

  @override
  String get specialties => '専門分野';

  @override
  String get experience => '経験';

  @override
  String get qualification => '資格';

  @override
  String get education => '教育';

  @override
  String get recoveryTips =>
      '• この情報のスクリーンショットを撮る\n• 安全な場所に保管する\n• 誰とも共有しない\n• この情報は一度だけ表示される';

  @override
  String get themeSettingsTitle => 'テーマ設定';

  @override
  String get lightThemeLabel => 'ライト';

  @override
  String get lightThemeDescription => '常にライトテーマを使用する';

  @override
  String get darkThemeLabel => '暗い';

  @override
  String get darkThemeDescription => '常にダークテーマを使用する';

  @override
  String get systemThemeLabel => 'システム';

  @override
  String get systemThemeDarkDescription => 'ダークテーマのシステム設定に従う';

  @override
  String get systemThemeLightDescription => 'ライトテーマのシステム設定に従う';

  @override
  String get switchToLight => '光に切り替える';

  @override
  String get switchToDark => 'ダークに切り替える';

  @override
  String get ourTeam => '私たちのチーム';

  @override
  String get teamDescription =>
      'プロのヴェーダ占星術師チームが、惑星の影響と人生のパターンを解釈する長年の経験を活かします。専任のサポート・開発チームに支えられたKarmaは、すべてのユーザーにシームレスで信頼性の高いグローバルな体験を提供します。';
}
