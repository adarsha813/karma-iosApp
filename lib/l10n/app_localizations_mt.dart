// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maltese (`mt`).
class AppLocalizationsMt extends AppLocalizations {
  AppLocalizationsMt([String locale = 'mt']) : super(locale);

  @override
  String get settingsTitle => 'Issettjar';

  @override
  String get notificationSettings => 'Issettjar tan-Notifika';

  @override
  String get privacySettings => 'Issettjar tal-Privatezza';

  @override
  String get accountSettings => 'Issettjar tal-Kont';

  @override
  String get languageSettings => 'Issettjar tal-Lingwa';

  @override
  String get languageChanged => 'Il-lingwa nbidlet';

  @override
  String get existingUserButton => 'Jiena utent eżistenti';

  @override
  String get chooseCountryTitle => 'Agħżel Pajjiż';

  @override
  String get yesText => 'Iva';

  @override
  String get noText => 'Le';

  @override
  String get appBarTitle => 'Issettjar tal-Profil';

  @override
  String get userIdLabel => 'ID tal-Utent *';

  @override
  String get nameLabel => 'Isem';

  @override
  String get birthCountryLabel => 'Pajjiż tat-Twelid';

  @override
  String get birthCityLabel => 'Belt tat-Twelid';

  @override
  String get countrySelectionTitle => 'Agħżel pajjiżek';

  @override
  String get maleLabel => 'Raġel';

  @override
  String get femaleLabel => 'Mara';

  @override
  String get birthDateLabel => 'Data tat-Twelid';

  @override
  String get birthDatePlaceholder => 'Agħżel id-Data tat-Twelid';

  @override
  String get birthTimeLabel => 'Ħin tat-Twelid';

  @override
  String get birthTimePlaceholder => 'Agħżel il-Ħin tat-Twelid';

  @override
  String get saveProfileButton => 'Salva l-Profil';

  @override
  String get noCitiesFound => 'Ma nstabet l-ebda belt';

  @override
  String cityPlaceholder(Object country) {
    return 'Daħħal il-belt f\'$country';
  }

  @override
  String get countryFirstPlaceholder => 'Agħżel il-pajjiż l-ewwel';

  @override
  String get versionHistoryTitle => 'Storja tal-Verżjonijiet';

  @override
  String get notSetText => 'Mhux issettjat';

  @override
  String nameHistory(Object name) {
    return 'Isem: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Belt: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Pajjiż: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Sess: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data tat-Twelid: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ħin tat-Twelid: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokazzjoni: $latitude, $longitude';
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
    return 'Stat: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aġġornat fi $date';
  }

  @override
  String get userIdRequired => 'L-ID tal-utent huwa meħtieġ';

  @override
  String get profileSaved => 'Il-profil ġie salvat b\'suċċess';

  @override
  String get saveFailed => 'Ma rnexxiex insalva l-profil';

  @override
  String get errorPrefix => 'Żball:';

  @override
  String get onboardingChooseLanguage => 'Agħżel il-Lingwa Tiegħek';

  @override
  String get onboardingChooseLanguageDesc =>
      'Agħżel il-lingwa preferuta tiegħek biex tkompli.';

  @override
  String get onboardingWhatIsAstrology => 'X\'inhi l-Astroloġija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'L-astroloġija hija l-istudju tal-korpi ċelesti...';

  @override
  String get onboardingWhyUseApp => 'Għaliex tuża din l-app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ikseb oroskopji personalizzati, tbassir ta\' kuljum, u gwida biex tieħu deċiżjonijiet infurmati.';

  @override
  String get onboardingHowToUse => 'Kif tuża din l-app?';

  @override
  String get onboardingHowToUseDesc =>
      'Innaviga faċilment, iċċekkja l-oroskopji ta\' kuljum, u immaniġġja l-profil tiegħek għal tbassir preċiż.';

  @override
  String get onboardingGetStarted => 'Ibda';

  @override
  String get onboardingNewUser => 'Utent Ġdid';

  @override
  String get onboardingExistingUser => 'Utent Eżistenti';

  @override
  String get onboardingBack => 'Lura';

  @override
  String get onboardingNext => 'Li jmiss';

  @override
  String get userIdNotFound =>
      'L-ID tal-utent ma nstabx. Jekk jogħġbok idħol jew issettja l-profil tiegħek.';

  @override
  String get clearNotificationsTitle => 'Notifiki Ċari';

  @override
  String get clearNotificationsMessage =>
      'Żgur li trid tħassar in-notifiki kollha?';

  @override
  String get clearNotificationsSuccess =>
      'In-notifiki kollha tħassru b\'suċċess.';

  @override
  String get clearHoroscopeTitle => 'Oroskopju Ċar';

  @override
  String get clearHoroscopeMessage =>
      'Żgur li trid tħassar id-dejta tal-oroskopju tiegħek?';

  @override
  String get clearHoroscopeSuccess => 'L-oroskopju tneħħa b\'suċċess.';

  @override
  String get clearChatTitle => 'Ħassar l-Istorja taċ-Chat';

  @override
  String get clearChatMessage =>
      'Żgur li trid tħassar l-istorja kollha taċ-chat tiegħek?';

  @override
  String get clearChatLocal => 'Iċ-chat tnaddaf lokalment.';

  @override
  String get deleteAccountTitle => 'Ħassar il-Kont';

  @override
  String get deleteAccountMessage =>
      'Żgur li trid tħassar il-kont tiegħek? Dan se jħassar ukoll l-istorja taċ-chat u n-notifiki kollha tiegħek.';

  @override
  String get deleteAccountSuccess =>
      'Il-kont tiegħek u d-dejta kollha tneħħew.';

  @override
  String get deleteAccountError => 'Żball fit-tħassir tal-kont';

  @override
  String get logoutTitle => 'Oħroġ';

  @override
  String get logoutMessage => 'Żgur li trid tagħmel il-logout?';

  @override
  String get termsPrivacyTitle => 'Termini u Privatezza';

  @override
  String get privacyPolicyTitle => 'Politika tal-Privatezza';

  @override
  String get termsConditionsTitle => 'Termini u Kundizzjonijiet';

  @override
  String get dataControlTitle => 'Kontroll tad-Data';

  @override
  String get cancelButton => 'Ikkanċella';

  @override
  String get confirmButton => 'Ikkonferma';

  @override
  String get clearQuestionsSuccess =>
      'Il-mistoqsijiet kollha tħassru b\'suċċess.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Mulej';

  @override
  String get startLabel => 'Ibda';

  @override
  String get recoverAccount => 'Irkupra l-Kont';

  @override
  String get endLabel => 'Tmiem';

  @override
  String get startDateLabel => 'Data tal-Bidu';

  @override
  String get endDateLabel => 'Data tat-Tmiem';

  @override
  String get notAvailable => 'Mhux disponibbli';

  @override
  String get noData => 'L-ebda dejta';

  @override
  String get unknownError => 'Żball mhux magħruf';

  @override
  String get retryButton => 'Erġa\' pprova';

  @override
  String get kundaliGeneratorTitle => 'Ġeneratur tal-Kundali';

  @override
  String get natalChartTitle => 'Ċart Natali';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Grad Axxendent';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Mhux magħruf';

  @override
  String get clearHoroscope => 'Oroskopju Ċar';

  @override
  String get clearNotifications => 'Notifiki Ċari';

  @override
  String get clearChatHistory => 'Ħassar l-Istorja taċ-Chat';

  @override
  String get logout => 'Oħroġ';

  @override
  String get deleteAccount => 'Ħassar il-Kont';

  @override
  String get allFieldsRequired => 'L-oqsma kollha huma meħtieġa.';

  @override
  String get accountRecoveredSuccess => 'Il-kont ġie rkuprat b\'suċċess.';

  @override
  String get recoveryFailed =>
      'L-irkupru falla. Iċċekkja l-informazzjoni tiegħek.';

  @override
  String get recoverySecretLabel => 'Sigriet ta\' Rkupru:';

  @override
  String get aboutUsTitle => 'Dwarna';

  @override
  String get aboutOurCompany => 'Dwar il-Kumpanija Tagħna';

  @override
  String get aboutCompanyDescription =>
      'Aħna impenjati li nwasslu l-aqwa esperjenza tal-astroloġija lill-utenti tagħna.';

  @override
  String get ourMission => 'Il-Missjoni Tagħna';

  @override
  String get missionDescription =>
      'Biex nipprovdu għarfien astroloġiċi preċiż u personalizzat biex ngħinu lill-utenti jieħdu deċiżjonijiet infurmati f\'ħajjithom.';

  @override
  String get ourVision => 'Il-Viżjoni Tagħna';

  @override
  String get visionDescription =>
      'Li ssir l-aktar pjattaforma tal-astroloġija fdata, li tgħaqqad it-teknoloġija u l-għerf antik.';

  @override
  String get ourValues => 'Il-Valuri Tagħna';

  @override
  String get valuesDescription =>
      'Integrità, Preċiżjoni, Disinn Iċċentrat fuq l-Utent, u Innovazzjoni Kontinwa.';

  @override
  String get contactUs => 'Ikkuntattjana';

  @override
  String get contactEmail => 'Email: support@yourcompany.com';

  @override
  String get contactWebsite => 'Sit elettroniku: www.il-kumpanija tiegħek.com';

  @override
  String get customerSupport => 'Appoġġ għall-Klijent';

  @override
  String get supportHeroTitle => 'Aħna Hawn biex Ngħinu';

  @override
  String get supportHeroDescription =>
      'Imla l-formola t\'hawn taħt u t-tim ta\' appoġġ tagħna se jikkuntattjak mill-aktar fis possibbli.';

  @override
  String get yourName => 'Ismek';

  @override
  String get yourEmail => 'L-Email Tiegħek';

  @override
  String get message => 'Messaġġ';

  @override
  String get enterEmail => 'Daħħal l-email tiegħek';

  @override
  String get enterValidEmail => 'Daħħal indirizz elettroniku validu';

  @override
  String enterField(Object fieldName) {
    return 'Daħħal $fieldName';
  }

  @override
  String get send => 'Ibgħat';

  @override
  String get sending => 'Qed nibgħat...';

  @override
  String get emailSentSuccess => '✅ L-email intbagħtet b\'suċċess!';

  @override
  String get emailSendFailed => '❌ Ma rnexxiliex tibgħat email';

  @override
  String get astroDictionaryTitle => 'Dizzjunarju Astroloġiku';

  @override
  String get searchTermsHint => 'Termini tat-tiftix...';

  @override
  String get noTermsFound => 'Ma nstabu l-ebda termini';

  @override
  String get buyQuestionsTitle => 'Mistoqsijiet dwar ix-Xiri';

  @override
  String get userNotAuthenticated => 'Utent mhux awtentikat';

  @override
  String get loadStoreDataFailed => 'Ma rnexxiex ittella\' d-dejta tal-maħżen';

  @override
  String get missingAuthToken => 'Token tal-awtentikazzjoni nieqes';

  @override
  String get merchantDisplayName => 'App taċ-Chat Astro';

  @override
  String get paymentSuccessful => '✅ Ħlas b\'suċċess! Mistoqsija mibgħuta';

  @override
  String paymentFailed(Object error) {
    return '❌ Il-ħlas falla: $error';
  }

  @override
  String get yourBalance => 'Il-Bilanċ Tiegħek';

  @override
  String questionsBalance(Object count) {
    return '$count Mistoqsijiet';
  }

  @override
  String get availableOffers => 'Offerti Disponibbli';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Ixtri';

  @override
  String get dailyHoroscopeTitle => '🌟 Oroskopju ta\' Kuljum';

  @override
  String get userIdMissing => 'L-ID tal-utent hija nieqsa';

  @override
  String get fetchHoroscopesFailed => 'Ma rnexxiliex inġib l-oroskopji';

  @override
  String get noHoroscopeFound => 'Ma nstab l-ebda oroskopju.';

  @override
  String get signLabel => 'Sinjal';

  @override
  String get todayLabel => 'Illum';

  @override
  String get yesterdayLabel => 'Ilbieraħ';

  @override
  String get thisWeekLabel => 'Din il-Ġimgħa';

  @override
  String get lastMonthLabel => 'Xahar li għadda';

  @override
  String get chatTitle => 'Ċett';

  @override
  String get typeYourQuestionHint => 'Ittajpja l-mistoqsija tiegħek...';

  @override
  String get paymentRequired => 'Ħlas Meħtieġ';

  @override
  String get paymentRequiredMessage =>
      'Użajt il-mistoqsijiet bla ħlas tiegħek. Ħallas ₹50 biex tkompli.';

  @override
  String get payNowButton => 'Ħallas Issa';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count mistoqsijiet bla ħlas li fadal';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count mistoqsijiet imħallsa li fadal';
  }

  @override
  String get thankYouFeedback => 'Grazzi għar-rispons tiegħek!';

  @override
  String get ratingSubmitted => 'Klassifikazzjoni sottomessa!';

  @override
  String get setUserIdFirst =>
      'Jekk jogħġbok issettja l-ID tal-Utent tiegħek l-ewwel';

  @override
  String get failedToFetchPrevious =>
      'Ma rnexxiliex inġib mistoqsijiet u tweġibiet preċedenti';

  @override
  String errorOccurred(Object error) {
    return 'Żball: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astroloġiku';

  @override
  String get drawerDailyHoroscope => 'Oroskopju ta\' Kuljum';

  @override
  String get drawerBuyQuestions => 'Mistoqsijiet dwar ix-Xiri';

  @override
  String get drawerAstroDictionary => 'Dizzjunarju Astroloġiku';

  @override
  String get drawerSettings => 'Issettjar';

  @override
  String get drawerCustomerSupport => 'Appoġġ għall-Klijent';

  @override
  String get drawerAbout => 'Dwar';

  @override
  String get drawerProfileSettings => 'Issettjar tal-Profil';

  @override
  String get demoNotificationTitle => '🔔 Notifika tad-Demo';

  @override
  String get demoNotificationBody =>
      'Din hija notifika ta\' prova mill-app tiegħek!';

  @override
  String get notificationsTitle => 'Notifiki';

  @override
  String get noNotifications => 'L-ebda notifika';

  @override
  String get allTab => 'Kollha';

  @override
  String get markAllAsRead => 'Immarka kollox bħala moqri';

  @override
  String get notificationMarkedRead => 'Notifika mmarkata bħala moqrija';

  @override
  String get failedToLoadNotifications =>
      'Ma rnexxilniex in-notifiki jitgħabbew';

  @override
  String get failedToMarkRead => 'Ma rnexxiex timmarka bħala moqri';

  @override
  String get failedToMarkAllRead => 'Ma rnexxiex timmarka kollox bħala moqri';

  @override
  String get socketConnected => 'Sokit konness';

  @override
  String get socketDisconnected => 'Sokit skonnettjat';

  @override
  String get newNotificationReceived => 'Notifika ġdida riċevuta';

  @override
  String get generalCategory => 'Ġenerali';

  @override
  String get horoscopeCategory => 'Oroskopju';

  @override
  String get chatCategory => 'Ċett';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Aġġornamenti';

  @override
  String get howToAskTitle => 'Kif Tistaqsi';

  @override
  String get noQuestionsAvailable => 'L-ebda mistoqsija disponibbli';

  @override
  String get failedToLoadQuestions => 'Ma rnexxilniex intella\' l-mistoqsijiet';

  @override
  String get pullToRefresh => 'Iġbed biex tirrifreska';

  @override
  String get careerCategory => 'Karriera';

  @override
  String get loveCategory => 'Imħabba u Relazzjonijiet';

  @override
  String get healthCategory => 'Saħħa';

  @override
  String get financeCategory => 'Finanzi';

  @override
  String get familyCategory => 'Familja';

  @override
  String get educationCategory => 'Edukazzjoni';

  @override
  String get travelCategory => 'Ivvjaġġar';

  @override
  String get spiritualCategory => 'Spiritwali';

  @override
  String get profileLoaded => 'Il-profil tgħabba b\'suċċess';

  @override
  String get imageUploaded => 'L-immaġni ġiet imtella’ b’suċċess';

  @override
  String get savedInformationConfirmation => 'Salvajt Din l-Informazzjoni';

  @override
  String get noHistoryAvailable => 'L-ebda storja disponibbli';

  @override
  String get missingUserIdError => 'L-ID tal-utent huwa meħtieġ';

  @override
  String get networkError => 'Żball fin-netwerk. Jekk jogħġbok erġa\' pprova.';

  @override
  String get timeoutError => 'It-talba skadiet';

  @override
  String get genericError => 'Xi ħaġa marret ħażin';

  @override
  String get reactionUpdateError => 'Ma rnexxiliex taġġorna r-reazzjoni';

  @override
  String get noSearchResults => 'Ma nstabu l-ebda riżultati tat-tfittxija';

  @override
  String get clearSearch => 'Tiftix ċar';

  @override
  String get resultsFound => 'Riżultati misjuba';

  @override
  String get recoverySecretHint =>
      'Il-kopja u l-pejst jistgħu ma jaħdmux, ittajpja manwalment';

  @override
  String get recoverAccountDescription =>
      'Segwi dawn il-passi biex tirkupra l-kont tiegħek';

  @override
  String get processingLabel => 'Ipproċessar...';

  @override
  String get clearChatSuccess => 'Iċ-chat tnaddaf b\'suċċess';

  @override
  String get notificationsEnabled => 'Notifiki attivati';

  @override
  String get notificationsDisabled => 'Notifiki diżattivati';

  @override
  String get securityNotice =>
      'Id-dejta tiegħek hija kriptata u maħżuna b\'mod sigur';

  @override
  String get loading => 'Qed jitgħabba...';

  @override
  String get selectLanguage => 'Agħżel Lingwa';

  @override
  String get onboardingGetStartedDesc => 'Ibda billi tagħżel il-lingwa tiegħek';

  @override
  String get accountRecoveryTitle => '🔐 Dettalji dwar l-Irkupru tal-Kont';

  @override
  String get recoveryInstructions =>
      'Jekk jogħġbok salva din l-informazzjoni b\'mod sigur. Ikollok bżonnha biex tirkupra l-kont tiegħek.';

  @override
  String get importantNotice => '⚠️ Importanti:';

  @override
  String get astrologerProfileTitle => 'Profil tal-Astrologu';

  @override
  String get personalAstrologer => 'Astrologu Personali';

  @override
  String get makePersonalAstrologer => 'Agħmel Astrologu Personali';

  @override
  String get favoriteDescription =>
      'Il-mistoqsijiet tiegħek se jiġu prijoritizzati lil dan l-astrologu. Jekk ma jkunx disponibbli, astrologu kwalifikat ieħor se jgħinek.';

  @override
  String get educationQualifications => 'Edukazzjoni u Kwalifiki';

  @override
  String get aboutSection => 'Dwar';

  @override
  String get shareProfile => 'Aqsam il-Profil';

  @override
  String get loadingAstrologer => 'Qed jitgħabbew id-dettalji tal-astrologu...';

  @override
  String get failedToLoadAstrologer =>
      'Ma rnexxilniex nitgħabbew id-dettalji tal-astrologu';

  @override
  String get authenticationRequired =>
      'Awtentikazzjoni meħtieġa. Jekk jogħġbok idħol.';

  @override
  String securityCheckFailed(Object error) {
    return 'Il-verifika tas-sigurtà falliet: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name issa huwa l-Astrologu Personali tiegħek';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Neħħejt $name mill-favoriti';
  }

  @override
  String get toggleFavoriteError =>
      'Ma rnexxiex naġġorna l-istatus tal-favorit';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Edukazzjoni: $education\n📜 Kwalifika: $qualification\n⏳ Esperjenza: $experience';
  }

  @override
  String get notProvided => 'Mhux ipprovdut';

  @override
  String reviews(Object count) {
    return '($count reviżjonijiet)';
  }

  @override
  String get specialties => 'Speċjalitajiet';

  @override
  String get experience => 'Esperjenza';

  @override
  String get qualification => 'Kwalifika';

  @override
  String get education => 'Edukazzjoni';

  @override
  String get recoveryTips =>
      '• Ħu screenshot ta’ din l-informazzjoni\n• Aħżenha f’post sigur\n• Taqsamha ma’ ħadd\n• Din tintwera darba biss';
}
