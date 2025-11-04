// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Haitian Haitian Creole (`ht`).
class AppLocalizationsHt extends AppLocalizations {
  AppLocalizationsHt([String locale = 'ht']) : super(locale);

  @override
  String get settingsTitle => 'Anviwònman';

  @override
  String get notificationSettings => 'Paramèt Notifikasyon yo';

  @override
  String get privacySettings => 'Paramèt Konfidansyalite';

  @override
  String get accountSettings => 'Anviwònman Kont';

  @override
  String get languageSettings => 'Paramèt Lang';

  @override
  String get languageChanged => 'Lang chanje';

  @override
  String get existingUserButton => 'Mwen se yon itilizatè ki deja egziste';

  @override
  String get chooseCountryTitle => 'Chwazi peyi';

  @override
  String get yesText => 'Wi';

  @override
  String get noText => 'Non';

  @override
  String get appBarTitle => 'Anviwònman Pwofil';

  @override
  String get userIdLabel => 'ID itilizatè *';

  @override
  String get nameLabel => 'Non';

  @override
  String get birthCountryLabel => 'Peyi nesans';

  @override
  String get birthCityLabel => 'Vil nesans';

  @override
  String get countrySelectionTitle => 'Chwazi peyi ou';

  @override
  String get maleLabel => 'Gason';

  @override
  String get femaleLabel => 'Fi';

  @override
  String get birthDateLabel => 'Dat Nesans';

  @override
  String get birthDatePlaceholder => 'Chwazi Dat Nesans';

  @override
  String get birthTimeLabel => 'Lè nesans';

  @override
  String get birthTimePlaceholder => 'Chwazi Lè Nesans';

  @override
  String get saveProfileButton => 'Sove Pwofil la';

  @override
  String get noCitiesFound => 'Pa jwenn okenn vil';

  @override
  String cityPlaceholder(Object country) {
    return 'Antre vil la nan $country';
  }

  @override
  String get countryFirstPlaceholder => 'Chwazi peyi a an premye';

  @override
  String get versionHistoryTitle => 'Istwa Vèsyon';

  @override
  String get notSetText => 'Pa mete';

  @override
  String nameHistory(Object name) {
    return 'Non: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Vil: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Peyi: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sèks: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dat Nesans: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Lè nesans: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Kote: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Eta: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Mizajou sou $date';
  }

  @override
  String get userIdRequired => 'ID itilizatè a obligatwa';

  @override
  String get profileSaved => 'Pwofil la sove avèk siksè';

  @override
  String get saveFailed => 'Echèk pou sove pwofil la';

  @override
  String get errorPrefix => 'Erè:';

  @override
  String get onboardingChooseLanguage => 'Chwazi Lang Ou';

  @override
  String get onboardingChooseLanguageDesc =>
      'Chwazi lang ou prefere a pou kontinye.';

  @override
  String get onboardingWhatIsAstrology => 'Kisa Astwoloji ye?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astwoloji se syans ki etidye kò selès yo...';

  @override
  String get onboardingWhyUseApp => 'Poukisa pou itilize aplikasyon sa a?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Jwenn oroskop pèsonalize, prediksyon chak jou, ak konsèy pou pran desizyon enfòme.';

  @override
  String get onboardingHowToUse => 'Kijan pou itilize aplikasyon sa a?';

  @override
  String get onboardingHowToUseDesc =>
      'Navige fasilman, tcheke oroskop chak jou, epi jere pwofil ou pou prediksyon egzat.';

  @override
  String get onboardingGetStarted => 'Kòmanse';

  @override
  String get onboardingNewUser => 'Nouvo Itilizatè';

  @override
  String get onboardingExistingUser => 'Itilizatè ki deja egziste';

  @override
  String get onboardingBack => 'Retounen';

  @override
  String get onboardingNext => 'Apre';

  @override
  String get userIdNotFound =>
      'Pa jwenn ID itilizatè a. Tanpri konekte oswa konfigire pwofil ou.';

  @override
  String get clearNotificationsTitle => 'Efase Notifikasyon yo';

  @override
  String get clearNotificationsMessage =>
      'Èske ou sèten ou vle efase tout notifikasyon yo?';

  @override
  String get clearNotificationsSuccess =>
      'Tout notifikasyon yo efase avèk siksè.';

  @override
  String get clearHoroscopeTitle => 'Oroskop Klè';

  @override
  String get clearHoroscopeMessage =>
      'Èske ou sèten ou vle efase done oroskop ou yo?';

  @override
  String get clearHoroscopeSuccess => 'Oroskop la efase avèk siksè.';

  @override
  String get clearChatTitle => 'Efase Istwa Chat la';

  @override
  String get clearChatMessage =>
      'Èske ou sèten ou vle efase tout istwa chat ou a?';

  @override
  String get clearChatLocal => 'Chat la efase lokalman.';

  @override
  String get deleteAccountTitle => 'Efase Kont';

  @override
  String get deleteAccountMessage =>
      'Èske ou sèten ou vle efase kont ou a? Sa ap efase tout istwa chat ou yo ak notifikasyon ou yo tou.';

  @override
  String get deleteAccountSuccess => 'Yo retire kont ou ak tout done ou yo.';

  @override
  String get deleteAccountError => 'Erè pandan efase kont lan';

  @override
  String get logoutTitle => 'Dekonekte';

  @override
  String get logoutMessage => 'Èske ou sèten ou vle dekonekte?';

  @override
  String get termsPrivacyTitle => 'Tèm ak Konfidansyalite';

  @override
  String get privacyPolicyTitle => 'Règleman sou enfòmasyon prive';

  @override
  String get termsConditionsTitle => 'Tèm ak Kondisyon';

  @override
  String get dataControlTitle => 'Kontwòl Done';

  @override
  String get cancelButton => 'Anile';

  @override
  String get confirmButton => 'Konfime';

  @override
  String get clearQuestionsSuccess => 'Tout kesyon yo efase avèk siksè.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Senyè';

  @override
  String get startLabel => 'Kòmanse';

  @override
  String get recoverAccount => 'Rekipere Kont';

  @override
  String get endLabel => 'Fen';

  @override
  String get startDateLabel => 'Dat kòmansman';

  @override
  String get endDateLabel => 'Dat Finisman';

  @override
  String get notAvailable => 'Pa disponib';

  @override
  String get noData => 'Pa gen done';

  @override
  String get unknownError => 'Erè enkoni';

  @override
  String get retryButton => 'Eseye ankò';

  @override
  String get kundaliGeneratorTitle => 'Jeneratè Kundali';

  @override
  String get natalChartTitle => 'Tablo Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rachi';

  @override
  String get ascDegreeLabel => 'Degre Asandan';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Enkoni';

  @override
  String get clearHoroscope => 'Oroskop Klè';

  @override
  String get clearNotifications => 'Efase Notifikasyon yo';

  @override
  String get clearChatHistory => 'Efase Istwa Chat la';

  @override
  String get logout => 'Dekonekte';

  @override
  String get deleteAccount => 'Efase Kont';

  @override
  String get allFieldsRequired => 'Tout chan yo obligatwa.';

  @override
  String get accountRecoveredSuccess => 'Kont lan refè avèk siksè.';

  @override
  String get recoveryFailed =>
      'Rekiperasyon an echwe. Tcheke enfòmasyon ou yo.';

  @override
  String get recoverySecretLabel => 'Sekrè Rekiperasyon an:';

  @override
  String get aboutUsTitle => 'Konsènan nou';

  @override
  String get aboutOurCompany => 'Konsènan Konpayi nou an';

  @override
  String get aboutCompanyDescription =>
      'Nou angaje nou pou nou bay itilizatè nou yo pi bon eksperyans astwoloji a.';

  @override
  String get ourMission => 'Misyon nou';

  @override
  String get missionDescription =>
      'Pou bay enfòmasyon astwolojik pèsonalize ak egzat pou ede itilizatè yo pran desizyon enfòme nan lavi yo.';

  @override
  String get ourVision => 'Vizyon nou';

  @override
  String get visionDescription =>
      'Pou vin platfòm astwoloji ki pi fyab la, ki konbine teknoloji ak sajès ansyen.';

  @override
  String get ourValues => 'Valè nou yo';

  @override
  String get valuesDescription =>
      'Entegrite, Presizyon, Konsepsyon Santre sou Itilizatè, ak Inovasyon Kontinyèl.';

  @override
  String get contactUs => 'Kontakte nou';

  @override
  String get contactEmail => 'Imèl: support@yourcompany.com';

  @override
  String get contactWebsite => 'Sit wèb: www.yourcompany.com';

  @override
  String get customerSupport => 'Sipò Kliyan';

  @override
  String get supportHeroTitle => 'Nou la pou ede';

  @override
  String get supportHeroDescription =>
      'Ranpli fòm ki anba a epi ekip sipò nou an ap kontakte ou pi vit posib.';

  @override
  String get yourName => 'Non ou';

  @override
  String get yourEmail => 'Imèl ou';

  @override
  String get message => 'Mesaj';

  @override
  String get enterEmail => 'Antre imèl ou';

  @override
  String get enterValidEmail => 'Antre yon adrès imel ki valab';

  @override
  String enterField(Object fieldName) {
    return 'Antre $fieldName';
  }

  @override
  String get send => 'Voye';

  @override
  String get sending => 'Ap voye...';

  @override
  String get emailSentSuccess => '✅ Imèl la voye avèk siksè!';

  @override
  String get emailSendFailed => '❌ Echèk pou voye imèl la';

  @override
  String get astroDictionaryTitle => 'Diksyonè Astro';

  @override
  String get searchTermsHint => 'Tèm rechèch...';

  @override
  String get noTermsFound => 'Pa jwenn okenn tèm';

  @override
  String get buyQuestionsTitle => 'Kesyon Achte';

  @override
  String get userNotAuthenticated => 'Itilizatè a pa otantifye';

  @override
  String get loadStoreDataFailed => 'Echèk pou chaje done magazen an';

  @override
  String get missingAuthToken => 'Jeton otorizasyon ki manke';

  @override
  String get merchantDisplayName => 'Aplikasyon Chat Astro';

  @override
  String get paymentSuccessful => '✅ Peman an reyisi! Kesyon an voye';

  @override
  String paymentFailed(Object error) {
    return '❌ Peman an echwe: $error';
  }

  @override
  String get yourBalance => 'Balans ou';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Ofri ki disponib yo';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Achte';

  @override
  String get dailyHoroscopeTitle => '🌟 Oroskop chak jou';

  @override
  String get userIdMissing => 'ID itilizatè a manke';

  @override
  String get fetchHoroscopesFailed => 'Echèk pou jwenn oroskop yo';

  @override
  String get noHoroscopeFound => 'Pa jwenn okenn oroskop.';

  @override
  String get signLabel => 'Siyen';

  @override
  String get todayLabel => 'Jodi a';

  @override
  String get yesterdayLabel => 'Yè';

  @override
  String get thisWeekLabel => 'Semèn sa a';

  @override
  String get lastMonthLabel => 'Mwa pase a';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Tape kesyon ou an...';

  @override
  String get paymentRequired => 'Peman obligatwa';

  @override
  String get paymentRequiredMessage =>
      'Ou fin itilize kesyon gratis ou yo. Peye ₹50 pou kontinye.';

  @override
  String get payNowButton => 'Peye Kounye a';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count kesyon gratis ki rete';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Kesyon peye ki rete yo $count';
  }

  @override
  String get thankYouFeedback => 'Mèsi pou fidbak ou a!';

  @override
  String get ratingSubmitted => 'Evalyasyon soumèt!';

  @override
  String get setUserIdFirst => 'Tanpri mete ID itilizatè ou an premye';

  @override
  String get failedToFetchPrevious =>
      'Echèk pou jwenn kesyon ak repons anvan yo';

  @override
  String errorOccurred(Object error) {
    return 'Erè: $error';
  }

  @override
  String get drawerAstroProfile => 'Pwofil Astro';

  @override
  String get drawerDailyHoroscope => 'Oroskop chak jou';

  @override
  String get drawerBuyQuestions => 'Kesyon Achte';

  @override
  String get drawerAstroDictionary => 'Diksyonè Astro';

  @override
  String get drawerSettings => 'Anviwònman';

  @override
  String get drawerCustomerSupport => 'Sipò Kliyan';

  @override
  String get drawerAbout => 'A pwopo';

  @override
  String get drawerProfileSettings => 'Anviwònman Pwofil';

  @override
  String get demoNotificationTitle => '🔔 Notifikasyon Demo';

  @override
  String get demoNotificationBody =>
      'Sa a se yon notifikasyon tès ki soti nan aplikasyon ou an!';

  @override
  String get notificationsTitle => 'Notifikasyon';

  @override
  String get noNotifications => 'Pa gen notifikasyon';

  @override
  String get allTab => 'Tout';

  @override
  String get markAllAsRead => 'Make tout kòm li';

  @override
  String get notificationMarkedRead => 'Notifikasyon make kòm li';

  @override
  String get failedToLoadNotifications => 'Echèk pou chaje notifikasyon yo';

  @override
  String get failedToMarkRead => 'Echèk pou make kòm li';

  @override
  String get failedToMarkAllRead => 'Echèk pou make tout kòm li';

  @override
  String get socketConnected => 'Priz konekte';

  @override
  String get socketDisconnected => 'Priz dekonekte';

  @override
  String get newNotificationReceived => 'Nouvo notifikasyon resevwa';

  @override
  String get generalCategory => 'Jeneral';

  @override
  String get horoscopeCategory => 'Oroskop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistèm';

  @override
  String get updateCategory => 'Mizajou';

  @override
  String get howToAskTitle => 'Kijan Pou Mande';

  @override
  String get noQuestionsAvailable => 'Pa gen kesyon disponib';

  @override
  String get failedToLoadQuestions => 'Echèk pou chaje kesyon yo';

  @override
  String get pullToRefresh => 'Rale pou rafrechi';

  @override
  String get careerCategory => 'Karyè';

  @override
  String get loveCategory => 'Lanmou ak Relasyon';

  @override
  String get healthCategory => 'Sante';

  @override
  String get financeCategory => 'Finans';

  @override
  String get familyCategory => 'Fanmi';

  @override
  String get educationCategory => 'Edikasyon';

  @override
  String get travelCategory => 'Vwayaj';

  @override
  String get spiritualCategory => 'Espirityèl';

  @override
  String get profileLoaded => 'Pwofil la chaje avèk siksè';

  @override
  String get imageUploaded => 'Imaj la telechaje avèk siksè';

  @override
  String get savedInformationConfirmation => 'Mwen sove enfòmasyon sa a';

  @override
  String get noHistoryAvailable => 'Pa gen istwa disponib';

  @override
  String get missingUserIdError => 'ID itilizatè a obligatwa';

  @override
  String get networkError => 'Erè rezo. Tanpri eseye ankò.';

  @override
  String get timeoutError => 'Demann lan te ekspire';

  @override
  String get genericError => 'Yon bagay te ale mal';

  @override
  String get reactionUpdateError => 'Echèk pou mete ajou reyaksyon an';

  @override
  String get noSearchResults => 'Pa jwenn okenn rezilta rechèch';

  @override
  String get clearSearch => 'Rechèch klè';

  @override
  String get resultsFound => 'Rezilta yo te jwenn';

  @override
  String get recoverySecretHint => 'Kopi-kole a ka pa mache, tape alamen.';

  @override
  String get recoverAccountDescription =>
      'Swiv etap sa yo pou rekipere kont ou';

  @override
  String get processingLabel => 'Ap trete...';

  @override
  String get clearChatSuccess => 'Chat la fini avèk siksè';

  @override
  String get notificationsEnabled => 'Notifikasyon yo aktive';

  @override
  String get notificationsDisabled => 'Notifikasyon yo enfim';

  @override
  String get securityNotice => 'Done ou yo byen chiffres epi estoke';

  @override
  String get loading => 'Ap chaje...';

  @override
  String get selectLanguage => 'Chwazi Lang';

  @override
  String get onboardingGetStartedDesc => 'Kòmanse pa chwazi lang ou';

  @override
  String get accountRecoveryTitle => '🔐 Detay sou Rekiperasyon Kont';

  @override
  String get recoveryInstructions =>
      'Tanpri sove enfòmasyon sa yo yon fason ki an sekirite. W ap bezwen yo pou rekipere kont ou an.';

  @override
  String get importantNotice => '⚠️ Enpòtan:';

  @override
  String get astrologerProfileTitle => 'Pwofil Astwològ';

  @override
  String get personalAstrologer => 'Astwològ pèsonèl';

  @override
  String get makePersonalAstrologer => 'Vin yon astwològ pèsonèl';

  @override
  String get favoriteDescription =>
      'Kesyon ou yo pral priyorize bay astwològ sa a. Si li pa disponib, yon lòt astwològ kalifye ap ede ou.';

  @override
  String get educationQualifications => 'Edikasyon ak Kalifikasyon';

  @override
  String get aboutSection => 'A pwopo';

  @override
  String get shareProfile => 'Pataje Pwofil';

  @override
  String get loadingAstrologer => 'Ap chaje detay astwològ la...';

  @override
  String get failedToLoadAstrologer => 'Echèk pou chaje detay astwològ la';

  @override
  String get authenticationRequired =>
      'Otantifikasyon obligatwa. Tanpri konekte.';

  @override
  String securityCheckFailed(Object error) {
    return 'Verifikasyon sekirite a echwe: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name se kounye a Astwològ Pèsonèl ou.';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Retire $name nan favoris yo';
  }

  @override
  String get toggleFavoriteError => 'Echèk pou mete ajou estati favori an';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Edikasyon: $education\n📜 Kalifikasyon: $qualification\n⏳ Eksperyans: $experience';
  }

  @override
  String get notProvided => 'Pa bay';

  @override
  String reviews(Object count) {
    return '($count revizyon)';
  }

  @override
  String get specialties => 'Espesyalite';

  @override
  String get experience => 'Eksperyans';

  @override
  String get qualification => 'Kalifikasyon';

  @override
  String get education => 'Edikasyon';

  @override
  String get recoveryTips =>
      '• Pran yon kopi ekran enfòmasyon sa a\n• Sere l nan yon kote ki an sekirite\n• Pa pataje l ak pèsonn\n• Sa ap parèt yon sèl fwa';
}
