// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get settingsTitle => 'Gosodiadau';

  @override
  String get notificationSettings => 'Gosodiadau Hysbysiadau';

  @override
  String get privacySettings => 'Gosodiadau Preifatrwydd';

  @override
  String get accountSettings => 'Gosodiadau Cyfrif';

  @override
  String get languageSettings => 'Gosodiadau Iaith';

  @override
  String get languageChanged => 'Iaith wedi\'i newid';

  @override
  String get existingUserButton => 'Rwy\'n ddefnyddiwr presennol';

  @override
  String get chooseCountryTitle => 'Dewiswch Wlad';

  @override
  String get yesText => 'Ie';

  @override
  String get noText => 'Na';

  @override
  String get appBarTitle => 'Gosodiadau Proffil';

  @override
  String get userIdLabel => 'ID Defnyddiwr *';

  @override
  String get nameLabel => 'Enw';

  @override
  String get birthCountryLabel => 'Gwlad Geni';

  @override
  String get birthCityLabel => 'Dinas Geni';

  @override
  String get countrySelectionTitle => 'Dewiswch eich gwlad';

  @override
  String get maleLabel => 'Gwrywaidd';

  @override
  String get femaleLabel => 'Benyw';

  @override
  String get birthDateLabel => 'Dyddiad Geni';

  @override
  String get birthDatePlaceholder => 'Dewiswch Ddyddiad Geni';

  @override
  String get birthTimeLabel => 'Amser Geni';

  @override
  String get birthTimePlaceholder => 'Dewiswch Amser Geni';

  @override
  String get saveProfileButton => 'Cadw Proffil';

  @override
  String get noCitiesFound => 'Ni chanfuwyd unrhyw ddinasoedd';

  @override
  String cityPlaceholder(Object country) {
    return 'Rhowch ddinas yn $country';
  }

  @override
  String get countryFirstPlaceholder => 'Dewiswch wlad yn gyntaf';

  @override
  String get versionHistoryTitle => 'Hanes Fersiynau';

  @override
  String get notSetText => 'Heb ei osod';

  @override
  String nameHistory(Object name) {
    return 'Enw: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Dinas: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Gwlad: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Rhyw: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dyddiad Geni: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Amser Geni: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lleoliad: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Parth amser: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Cyflwr: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Wedi\'i ddiweddaru ar $date';
  }

  @override
  String get userIdRequired => 'Mae angen ID Defnyddiwr';

  @override
  String get profileSaved => 'Proffil wedi\'i gadw\'n llwyddiannus';

  @override
  String get saveFailed => 'Methwyd cadw proffil';

  @override
  String get errorPrefix => 'Gwall:';

  @override
  String get onboardingChooseLanguage => 'Dewiswch Eich Iaith';

  @override
  String get onboardingChooseLanguageDesc =>
      'Dewiswch eich iaith ddewisol i barhau.';

  @override
  String get onboardingWhatIsAstrology => 'Beth yw Astroleg?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astroleg yw astudiaeth cyrff nefol...';

  @override
  String get onboardingWhyUseApp => 'Pam defnyddio\'r ap hwn?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Cael horosgopau personol, rhagfynegiadau dyddiol, ac arweiniad i wneud penderfyniadau gwybodus.';

  @override
  String get onboardingHowToUse => 'Sut i ddefnyddio\'r ap hwn?';

  @override
  String get onboardingHowToUseDesc =>
      'Llywiwch yn hawdd, gwiriwch horosgopau dyddiol, a rheolwch eich proffil i gael rhagfynegiadau cywir.';

  @override
  String get onboardingGetStarted => 'Dechrau Arni';

  @override
  String get onboardingNewUser => 'Defnyddiwr Newydd';

  @override
  String get onboardingExistingUser => 'Defnyddiwr Presennol';

  @override
  String get onboardingBack => 'Yn ôl';

  @override
  String get onboardingNext => 'Nesaf';

  @override
  String get userIdNotFound =>
      'Ni chanfuwyd ID defnyddiwr. Mewngofnodwch neu gosodwch eich proffil.';

  @override
  String get clearNotificationsTitle => 'Hysbysiadau Clirio';

  @override
  String get clearNotificationsMessage =>
      'Ydych chi\'n siŵr eich bod chi eisiau clirio\'r holl hysbysiadau?';

  @override
  String get clearNotificationsSuccess =>
      'Cliriwyd yr holl hysbysiadau yn llwyddiannus.';

  @override
  String get clearHoroscopeTitle => 'Horoscope Clir';

  @override
  String get clearHoroscopeMessage =>
      'Ydych chi\'n siŵr eich bod chi eisiau clirio data eich horosgop?';

  @override
  String get clearHoroscopeSuccess =>
      'Horoscope wedi\'i glirio\'n llwyddiannus.';

  @override
  String get clearChatTitle => 'Clirio Hanes Sgwrs';

  @override
  String get clearChatMessage =>
      'Ydych chi\'n siŵr eich bod chi eisiau dileu eich holl hanes sgwrsio?';

  @override
  String get clearChatLocal => 'Cafodd y sgwrs ei chlirio\'n lleol.';

  @override
  String get deleteAccountTitle => 'Dileu Cyfrif';

  @override
  String get deleteAccountMessage =>
      'Ydych chi\'n siŵr eich bod chi eisiau dileu eich cyfrif? Bydd hyn hefyd yn clirio eich holl hanes sgwrsio a hysbysiadau.';

  @override
  String get deleteAccountSuccess =>
      'Mae eich cyfrif a\'ch holl ddata wedi\'u dileu.';

  @override
  String get deleteAccountError => 'Gwall wrth ddileu cyfrif';

  @override
  String get logoutTitle => 'Allgofnodi';

  @override
  String get logoutMessage =>
      'Ydych chi\'n siŵr eich bod chi eisiau allgofnodi?';

  @override
  String get termsPrivacyTitle => 'Telerau a Phreifatrwydd';

  @override
  String get privacyPolicyTitle => 'Polisi Preifatrwydd';

  @override
  String get termsConditionsTitle => 'Telerau ac Amodau';

  @override
  String get dataControlTitle => 'Rheoli Data';

  @override
  String get cancelButton => 'Canslo';

  @override
  String get confirmButton => 'Cadarnhau';

  @override
  String get clearQuestionsSuccess =>
      'Pob cwestiwn wedi\'i ddileu\'n llwyddiannus.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Arglwydd';

  @override
  String get startLabel => 'Dechrau';

  @override
  String get recoverAccount => 'Adfer Cyfrif';

  @override
  String get endLabel => 'Diwedd';

  @override
  String get startDateLabel => 'Dyddiad Dechrau';

  @override
  String get endDateLabel => 'Dyddiad Gorffen';

  @override
  String get notAvailable => 'Ddim ar gael';

  @override
  String get noData => 'Dim data';

  @override
  String get unknownError => 'Gwall anhysbys';

  @override
  String get retryButton => 'Ail-geisio';

  @override
  String get kundaliGeneratorTitle => 'Generadur Kundali';

  @override
  String get natalChartTitle => 'Siart Geni';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Gradd Esgynnol';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Anhysbys';

  @override
  String get clearHoroscope => 'Horoscope Clir';

  @override
  String get clearNotifications => 'Hysbysiadau Clirio';

  @override
  String get clearChatHistory => 'Clirio Hanes Sgwrs';

  @override
  String get logout => 'Allgofnodi';

  @override
  String get deleteAccount => 'Dileu Cyfrif';

  @override
  String get allFieldsRequired => 'Mae angen pob maes.';

  @override
  String get accountRecoveredSuccess => 'Adferwyd y cyfrif yn llwyddiannus.';

  @override
  String get recoveryFailed => 'Methodd yr adferiad. Gwiriwch eich gwybodaeth.';

  @override
  String get recoverySecretLabel => 'Cyfrinach Adferiad:';

  @override
  String get aboutUsTitle => 'Amdanom Ni';

  @override
  String get aboutOurCompany => 'Ynglŷn â\'n Cwmni';

  @override
  String get aboutCompanyDescription =>
      'Rydym wedi ymrwymo i ddarparu\'r profiad astroleg gorau i\'n defnyddwyr.';

  @override
  String get ourMission => 'Ein Cenhadaeth';

  @override
  String get missionDescription =>
      'I ddarparu mewnwelediadau cywir a phersonol ar astroleg i helpu defnyddwyr i wneud penderfyniadau gwybodus yn eu bywydau.';

  @override
  String get ourVision => 'Ein Gweledigaeth';

  @override
  String get visionDescription =>
      'I ddod y platfform astroleg mwyaf dibynadwy, gan gyfuno technoleg a doethineb hynafol.';

  @override
  String get ourValues => 'Ein Gwerthoedd';

  @override
  String get valuesDescription =>
      'Uniondeb, Cywirdeb, Dylunio sy\'n Canolbwyntio ar y Defnyddiwr, ac Arloesi Parhaus.';

  @override
  String get contactUs => 'Cysylltwch â Ni';

  @override
  String get contactEmail => 'E-bost: support@yourcompany.com';

  @override
  String get contactWebsite => 'Gwefan: www.eichcwmni.com';

  @override
  String get customerSupport => 'Cymorth Cwsmeriaid';

  @override
  String get supportHeroTitle => 'Rydym Yma i Helpu';

  @override
  String get supportHeroDescription =>
      'Llenwch y ffurflen isod a bydd ein tîm cymorth yn cysylltu â chi cyn gynted â phosibl.';

  @override
  String get yourName => 'Eich Enw';

  @override
  String get yourEmail => 'Eich E-bost';

  @override
  String get message => 'Neges';

  @override
  String get enterEmail => 'Rhowch eich e-bost';

  @override
  String get enterValidEmail => 'Rhowch gyfeiriad e-bost dilys';

  @override
  String enterField(Object fieldName) {
    return 'Rhowch $fieldName';
  }

  @override
  String get send => 'Anfon';

  @override
  String get sending => 'Yn anfon...';

  @override
  String get emailSentSuccess => '✅ Anfonwyd yr e-bost yn llwyddiannus!';

  @override
  String get emailSendFailed => '❌ Methwyd anfon e-bost';

  @override
  String get astroDictionaryTitle => 'Geiriadur Astro';

  @override
  String get searchTermsHint => 'Termau chwilio...';

  @override
  String get noTermsFound => 'Ni chanfuwyd unrhyw dermau';

  @override
  String get buyQuestionsTitle => 'Cwestiynau Prynu';

  @override
  String get userNotAuthenticated => 'Defnyddiwr heb ei ddilysu';

  @override
  String get loadStoreDataFailed => 'Methwyd llwytho data\'r siop';

  @override
  String get missingAuthToken => 'Tocyn awdurdodi ar goll';

  @override
  String get merchantDisplayName => 'Ap Sgwrs Astro';

  @override
  String get paymentSuccessful =>
      '✅ Taliad llwyddiannus! Cwestiwn wedi\'i anfon';

  @override
  String paymentFailed(Object error) {
    return '❌ Methodd y taliad: $error';
  }

  @override
  String get yourBalance => 'Eich Balans';

  @override
  String questionsBalance(Object count) {
    return 'Cwestiynau $count';
  }

  @override
  String get availableOffers => 'Cynigion sydd ar Gael';

  @override
  String questionsCount(Object count) {
    return 'Cwestiwn $count';
  }

  @override
  String get buyButton => 'Prynu';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope Dyddiol';

  @override
  String get userIdMissing => 'Mae ID defnyddiwr ar goll';

  @override
  String get fetchHoroscopesFailed => 'Methwyd nôl horosgopau';

  @override
  String get noHoroscopeFound => 'Ni chanfuwyd horosgop.';

  @override
  String get signLabel => 'Arwydd';

  @override
  String get todayLabel => 'Heddiw';

  @override
  String get yesterdayLabel => 'Ddoe';

  @override
  String get thisWeekLabel => 'Yr Wythnos Hon';

  @override
  String get lastMonthLabel => 'Mis Diwethaf';

  @override
  String get chatTitle => 'Sgwrs';

  @override
  String get typeYourQuestionHint => 'Teipiwch eich cwestiwn...';

  @override
  String get paymentRequired => 'Taliad Angenrheidiol';

  @override
  String get paymentRequiredMessage =>
      'Rydych chi wedi defnyddio eich cwestiynau am ddim. Talwch ₹50 i barhau.';

  @override
  String get payNowButton => 'Talu Nawr';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count cwestiynau rhydd ar ôl';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count cwestiynau taledig sy\'n weddill';
  }

  @override
  String get thankYouFeedback => 'Diolch am eich adborth!';

  @override
  String get ratingSubmitted => 'Sgôr wedi\'i gyflwyno!';

  @override
  String get setUserIdFirst => 'Gosodwch eich ID Defnyddiwr yn gyntaf';

  @override
  String get failedToFetchPrevious =>
      'Methwyd â nôl cwestiynau ac atebion blaenorol';

  @override
  String errorOccurred(Object error) {
    return 'Gwall: $error';
  }

  @override
  String get drawerAstroProfile => 'Proffil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope Dyddiol';

  @override
  String get drawerBuyQuestions => 'Cwestiynau Prynu';

  @override
  String get drawerAstroDictionary => 'Geiriadur Astro';

  @override
  String get drawerSettings => 'Gosodiadau';

  @override
  String get drawerCustomerSupport => 'Cymorth Cwsmeriaid';

  @override
  String get drawerAbout => 'Ynglŷn â';

  @override
  String get drawerProfileSettings => 'Gosodiadau Proffil';

  @override
  String get demoNotificationTitle => '🔔 Hysbysiad Demo';

  @override
  String get demoNotificationBody => 'Dyma hysbysiad prawf o\'ch ap!';

  @override
  String get notificationsTitle => 'Hysbysiadau';

  @override
  String get noNotifications => 'Dim hysbysiadau';

  @override
  String get allTab => 'Pawb';

  @override
  String get markAllAsRead => 'Marcio popeth fel wedi\'i ddarllen';

  @override
  String get notificationMarkedRead =>
      'Hysbysiad wedi\'i farcio fel wedi\'i ddarllen';

  @override
  String get failedToLoadNotifications => 'Methwyd llwytho hysbysiadau';

  @override
  String get failedToMarkRead => 'Methwyd marcio fel wedi\'i ddarllen';

  @override
  String get failedToMarkAllRead =>
      'Methwyd marcio popeth fel wedi\'i ddarllen';

  @override
  String get socketConnected => 'Soced wedi\'i gysylltu';

  @override
  String get socketDisconnected => 'Soced wedi\'i ddatgysylltu';

  @override
  String get newNotificationReceived => 'Hysbysiad newydd wedi\'i dderbyn';

  @override
  String get generalCategory => 'Cyffredinol';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Sgwrs';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Diweddariadau';

  @override
  String get howToAskTitle => 'Sut i Ofyn';

  @override
  String get noQuestionsAvailable => 'Dim cwestiynau ar gael';

  @override
  String get failedToLoadQuestions => 'Methwyd llwytho cwestiynau';

  @override
  String get pullToRefresh => 'Tynnwch i adnewyddu';

  @override
  String get careerCategory => 'Gyrfa';

  @override
  String get loveCategory => 'Cariad a Pherthnasau';

  @override
  String get healthCategory => 'Iechyd';

  @override
  String get financeCategory => 'Cyllid';

  @override
  String get familyCategory => 'Teulu';

  @override
  String get educationCategory => 'Addysg';

  @override
  String get travelCategory => 'Teithio';

  @override
  String get spiritualCategory => 'Ysbrydol';

  @override
  String get profileLoaded => 'Llwythwyd y proffil yn llwyddiannus';

  @override
  String get imageUploaded => 'Llwythwyd y ddelwedd i fyny\'n llwyddiannus';

  @override
  String get savedInformationConfirmation =>
      'Rydw i wedi Cadw\'r wybodaeth hon';

  @override
  String get noHistoryAvailable => 'Dim hanes ar gael';

  @override
  String get missingUserIdError => 'Mae angen ID Defnyddiwr';

  @override
  String get networkError => 'Gwall rhwydwaith. Rhowch gynnig arall arni.';

  @override
  String get timeoutError => 'Cais wedi dod i ben am amser';

  @override
  String get genericError => 'Aeth rhywbeth o\'i le';

  @override
  String get reactionUpdateError => 'Methwyd diweddaru\'r ymateb';

  @override
  String get noSearchResults => 'Ni chanfuwyd unrhyw ganlyniadau chwilio';

  @override
  String get clearSearch => 'Clirio chwiliad';

  @override
  String get resultsFound => 'Canlyniadau a gafwyd';

  @override
  String get recoverySecretHint =>
      'Efallai na fydd copïo-gludo yn gweithio, teipiwch â llaw';

  @override
  String get recoverAccountDescription =>
      'Dilynwch y camau hyn i adfer eich cyfrif';

  @override
  String get processingLabel => 'Prosesu...';

  @override
  String get clearChatSuccess => 'Clirio\'r sgwrs yn llwyddiannus';

  @override
  String get notificationsEnabled => 'Hysbysiadau wedi\'u galluogi';

  @override
  String get notificationsDisabled => 'Hysbysiadau wedi\'u hanalluogi';

  @override
  String get securityNotice =>
      'Mae eich data wedi\'i amgryptio a\'i storio\'n ddiogel';

  @override
  String get loading => 'Yn llwytho...';

  @override
  String get selectLanguage => 'Dewis Iaith';

  @override
  String get onboardingGetStartedDesc => 'Dechreuwch drwy ddewis eich iaith';

  @override
  String get accountRecoveryTitle => '🔐 Manylion Adfer Cyfrif';

  @override
  String get recoveryInstructions =>
      'Cadwch y wybodaeth hon yn ddiogel. Bydd ei hangen arnoch i adfer eich cyfrif.';

  @override
  String get importantNotice => '⚠️ Pwysig:';

  @override
  String get astrologerProfileTitle => 'Proffil yr Astrolegydd';

  @override
  String get personalAstrologer => 'Astrolegydd Personol';

  @override
  String get makePersonalAstrologer => 'Gwneud yn Astrolegydd Personol';

  @override
  String get favoriteDescription =>
      'Bydd eich cwestiynau\'n cael blaenoriaeth i\'r astrolegydd hwn. Os nad yw ar gael, bydd astrolegydd cymwys arall yn eich cynorthwyo.';

  @override
  String get educationQualifications => 'Addysg a Chymwysterau';

  @override
  String get aboutSection => 'Ynglŷn â';

  @override
  String get shareProfile => 'Rhannu Proffil';

  @override
  String get loadingAstrologer => 'Yn llwytho manylion yr astrolegydd...';

  @override
  String get failedToLoadAstrologer =>
      'Methwyd llwytho manylion yr astrolegydd';

  @override
  String get authenticationRequired => 'Mae angen dilysu. Mewngofnodwch.';

  @override
  String securityCheckFailed(Object error) {
    return 'Methodd y gwiriad diogelwch: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name yw eich Astrolegydd Personol nawr';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Tynnwyd $name o\'r ffefrynnau';
  }

  @override
  String get toggleFavoriteError => 'Methwyd diweddaru statws ffefryn';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Addysg: $education\n📜 Cymhwyster: $qualification\n⏳ Profiad: $experience';
  }

  @override
  String get notProvided => 'Heb ei ddarparu';

  @override
  String reviews(Object count) {
    return '($count adolygiadau)';
  }

  @override
  String get specialties => 'Arbenigeddau';

  @override
  String get experience => 'Profiad';

  @override
  String get qualification => 'Cymhwyster';

  @override
  String get education => 'Addysg';

  @override
  String get recoveryTips =>
      '• Tynnwch sgrinlun o\'r wybodaeth hon\n• Storiwch hi mewn lle diogel\n• Peidiwch â rhannu ag unrhyw un\n• Dim ond unwaith y bydd hyn yn cael ei ddangos';
}
