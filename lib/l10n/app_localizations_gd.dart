// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Scottish Gaelic Gaelic (`gd`).
class AppLocalizationsGd extends AppLocalizations {
  AppLocalizationsGd([String locale = 'gd']) : super(locale);

  @override
  String get settingsTitle => 'Roghainnean';

  @override
  String get notificationSettings => 'Roghainnean Fiosrachaidh';

  @override
  String get privacySettings => 'Roghainnean Prìobhaideachd';

  @override
  String get accountSettings => 'Roghainnean a\' Chunntais';

  @override
  String get languageSettings => 'Roghainnean Cànain';

  @override
  String get languageChanged => 'Cànan air atharrachadh';

  @override
  String get existingUserButton =>
      'Tha mi nam neach-cleachdaidh a th’ ann mar-thà';

  @override
  String get chooseCountryTitle => 'Tagh Dùthaich';

  @override
  String get yesText => 'Tha';

  @override
  String get noText => 'Chan eil';

  @override
  String get appBarTitle => 'Roghainnean Pròifil';

  @override
  String get userIdLabel => 'ID Cleachdaiche *';

  @override
  String get nameLabel => 'Ainm';

  @override
  String get birthCountryLabel => 'Dùthaich Breith';

  @override
  String get birthCityLabel => 'Baile-breith';

  @override
  String get countrySelectionTitle => 'Tagh do dhùthaich';

  @override
  String get maleLabel => 'Fireann';

  @override
  String get femaleLabel => 'Boireann';

  @override
  String get birthDateLabel => 'Ceann-latha breith';

  @override
  String get birthDatePlaceholder => 'Tagh Ceann-latha Breith';

  @override
  String get birthTimeLabel => 'Àm Breith';

  @override
  String get birthTimePlaceholder => 'Tagh Àm Breith';

  @override
  String get saveProfileButton => 'Sàbhail Pròifil';

  @override
  String get noCitiesFound => 'Cha deach bailtean a lorg';

  @override
  String cityPlaceholder(Object country) {
    return 'Cuir a-steach baile-mòr ann an $country';
  }

  @override
  String get countryFirstPlaceholder => 'Tagh dùthaich an toiseach';

  @override
  String get versionHistoryTitle => 'Eachdraidh nan Tionndaidhean';

  @override
  String get notSetText => 'Gun a shuidheachadh';

  @override
  String nameHistory(Object name) {
    return 'Ainm: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Baile-mòr: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Dùthaich: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gnè: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Ceann-latha breith: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Àm Breith: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Àite: $latitude, $longitude';
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
    return 'Stàit: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Air ùrachadh air $date';
  }

  @override
  String get userIdRequired => 'Tha feum air ID cleachdaiche';

  @override
  String get profileSaved => 'Pròifil air a shàbhaladh gu soirbheachail';

  @override
  String get saveFailed => 'Dh’fhàillig sàbhaladh a’ phròifil';

  @override
  String get errorPrefix => 'Mearachd:';

  @override
  String get onboardingChooseLanguage => 'Tagh do chànan';

  @override
  String get onboardingChooseLanguageDesc =>
      'Tagh do chànan as fheàrr leat gus leantainn air adhart.';

  @override
  String get onboardingWhatIsAstrology => 'Dè a th\' ann an reul-eòlas?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      '\'S e reul-eòlas an seann sgrùdadh air gluasadan nèamhaidh agus an tionchar air beatha dhaoine, a\' tabhann lèirsinn air pearsantachd, dàimhean agus tachartasan beatha.';

  @override
  String get onboardingWhyUseApp => 'Carson a chleachdas tu an aplacaid seo?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Faigh ro-innsean ceart, air an gineadh le daoine, agus stiùireadh a tha freagarrach do chairt breith. Dèan co-dhùnaidhean fiosraichte le ro-innsean làitheil agus comhairle phearsanta bho speuradairean eòlach.';

  @override
  String get onboardingHowToUse => 'Ciamar a chleachdas tu an aplacaid seo?';

  @override
  String get onboardingHowToUseDesc =>
      'Cuir a-steach do cheann-latha breith, an dearbh àm, àite breith, agus fiosrachadh buntainneach sam bith eile gus tòiseachadh sa bhad. Rannsaich ro-innsean làitheil, faighnich ceistean do speuradairean eòlach, agus stiùirich do phròifil airson ro-innsean mionaideach, pearsanta - chan eil feum air logadh a-steach.';

  @override
  String get onboardingGetStarted => 'Tòisich';

  @override
  String get onboardingNewUser => 'Cleachdaiche Ùr';

  @override
  String get onboardingExistingUser => 'Cleachdaiche a th’ ann mar-thà';

  @override
  String get onboardingBack => 'Air ais';

  @override
  String get onboardingNext => 'An ath rud';

  @override
  String get userIdNotFound =>
      'Cha deach ID cleachdaiche a lorg. Log a-steach no suidhich do phròifil.';

  @override
  String get clearNotificationsTitle => 'Glan fiosan';

  @override
  String get clearNotificationsMessage =>
      'A bheil thu cinnteach gu bheil thu airson na fiosan uile a dhubhadh às?';

  @override
  String get clearNotificationsSuccess =>
      'Chaidh a h-uile fios a ghlanadh gu soirbheachail.';

  @override
  String get clearHoroscopeTitle => 'Horoscope Soilleir';

  @override
  String get clearHoroscopeMessage =>
      'A bheil thu cinnteach gu bheil thu airson dàta an horoscope agad a ghlanadh?';

  @override
  String get clearHoroscopeSuccess =>
      'Horoscope air a ghlanadh gu soirbheachail.';

  @override
  String get clearChatTitle => 'Glan Eachdraidh a\' Chabaid';

  @override
  String get clearChatMessage =>
      'A bheil thu cinnteach gu bheil thu airson eachdraidh do chòmhraidh gu lèir a dhubhadh às?';

  @override
  String get clearChatLocal => 'Chaidh an còmhradh a ghlanadh gu h-ionadail.';

  @override
  String get deleteAccountTitle => 'Sguab às Cunntas';

  @override
  String get deleteAccountMessage =>
      'A bheil thu cinnteach gu bheil thu airson do chunntas a dhubhadh às? Glanaidh seo eachdraidh do chòmhraidh agus do fhiosan uile cuideachd.';

  @override
  String get deleteAccountSuccess =>
      'Chaidh do chunntas agus a h-uile dàta a thoirt air falbh.';

  @override
  String get deleteAccountError => 'Mearachd le bhith a’ sguabadh às cunntas';

  @override
  String get logoutTitle => 'Log a-mach';

  @override
  String get logoutMessage =>
      'A bheil thu cinnteach gu bheil thu airson logadh a-mach?';

  @override
  String get termsPrivacyTitle => 'Teirmichean & Prìobhaideachd';

  @override
  String get privacyPolicyTitle => 'Poileasaidh Prìobhaideachd';

  @override
  String get termsConditionsTitle => 'Teirmichean & Cùmhnantan';

  @override
  String get dataControlTitle => 'Smachd Dàta';

  @override
  String get cancelButton => 'Sguir dheth';

  @override
  String get confirmButton => 'Dearbhaich';

  @override
  String get clearQuestionsSuccess =>
      'Chaidh a h-uile ceist a dhubhadh às gu soirbheachail.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Tighearna';

  @override
  String get startLabel => 'Tòisich';

  @override
  String get recoverAccount => 'Faigh air ais Cunntas';

  @override
  String get endLabel => 'Crìoch';

  @override
  String get startDateLabel => 'Ceann-latha Tòiseachaidh';

  @override
  String get endDateLabel => 'Ceann-latha crìochnachaidh';

  @override
  String get notAvailable => 'Chan eil e ri fhaighinn';

  @override
  String get noData => 'Gun dàta';

  @override
  String get unknownError => 'Mearachd neo-aithnichte';

  @override
  String get retryButton => 'Feuch a-rithist';

  @override
  String get kundaliGeneratorTitle => 'Gineadair Kundali';

  @override
  String get natalChartTitle => 'Cairt Breith';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Ceum Àrdachaidh';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Neo-aithnichte';

  @override
  String get clearHoroscope => 'Horoscope Soilleir';

  @override
  String get clearNotifications => 'Glan fiosan';

  @override
  String get clearChatHistory => 'Glan Eachdraidh a\' Chabaid';

  @override
  String get logout => 'Log a-mach';

  @override
  String get deleteAccount => 'Sguab às Cunntas';

  @override
  String get allFieldsRequired => 'Tha a h-uile raon riatanach.';

  @override
  String get accountRecoveredSuccess =>
      'Chaidh an cunntas fhaighinn air ais gu soirbheachail.';

  @override
  String get recoveryFailed =>
      'Dh’fhàillig an ath-bheothachadh. Thoir sùil air an fhiosrachadh agad.';

  @override
  String get recoverySecretLabel => 'Dìomhaireachd Ath-bheothachaidh:';

  @override
  String get aboutUsTitle => 'Mu ar deidhinn';

  @override
  String get aboutOurCompany => 'Mu ar Companaidh';

  @override
  String get aboutCompanyDescription =>
      'Aig Karma, bidh sinn gad chuideachadh le bhith a’ lorg do shlighe-beatha fhìor tro ghliocas neo-bhàsmhor speuradaireachd Vedic. Tha a h-uile lèirsinn a’ tighinn bho fhìor speuradairean eòlach, air an dealbhadh gu faiceallach stèidhichte air do chairt breith sònraichte. Bho horoscopan làitheil gu stiùireadh pearsanaichte, tha Karma a’ toirt cothrom air eòlas àrsaidh ann an còrr is 100 cànan.';

  @override
  String get ourMission => 'Ar Misean';

  @override
  String get missionDescription =>
      'Tha ar misean sìmplidh: stiùireadh reul-eòlais dearbhte, air a stiùireadh le daoine, a thoirt seachad a bheir cumhachd dhut co-dhùnaidhean misneachail, fiosraichte a dhèanamh. Tha gach ro-innse agus co-chomhairle a’ nochdadh bliadhnaichean de eòlas proifeasanta, chan e algairidhean fèin-ghluasadach.';

  @override
  String get ourVision => 'Ar Lèirsinn';

  @override
  String get visionDescription =>
      'Tha sinn a’ strì ri bhith mar an àrd-ùrlar as earbsaiche san t-saoghal airson reul-eòlas Vedic, a’ cuideachadh dhaoine anns a h-uile àite gus iad fhèin, na roghainnean aca, agus an turas beatha a thuigsinn le soilleireachd agus misneachd.';

  @override
  String get ourValues => 'Ar Luachan';

  @override
  String get valuesDescription =>
      'Aig Karma, tha sinn a’ cur luach air fìrinneachd, mionaideachd, agus earbsa. Tha sinn dealasach a thaobh stiùireadh a thabhann a tha chan ann a-mhàin ceart ach cuideachd brìoghmhor, gad chuideachadh le bhith a’ stiùireadh beatha le lèirsinn agus misneachd.';

  @override
  String get contactUs => 'Cuir fios thugainn';

  @override
  String get contactEmail => 'Post-d: support@yourcompany.com';

  @override
  String get contactWebsite => 'Làrach-lìn: www.yourcompany.com';

  @override
  String get customerSupport => 'Taic Luchd-ceannach';

  @override
  String get supportHeroTitle => 'Tha sinn an seo gus cuideachadh';

  @override
  String get supportHeroDescription =>
      'Lìon am foirm gu h-ìosal agus cuiridh an sgioba taic againn fios thugad cho luath ‘s a ghabhas.';

  @override
  String get yourName => 'D\'Ainm';

  @override
  String get yourEmail => 'Do phost-d';

  @override
  String get message => 'Teachdaireachd';

  @override
  String get enterEmail => 'Cuir a-steach do phost-d';

  @override
  String get enterValidEmail => 'Cuir a-steach seòladh puist-d dligheach';

  @override
  String enterField(Object fieldName) {
    return 'Cuir a-steach $fieldName';
  }

  @override
  String get send => 'Cuir';

  @override
  String get sending => 'A’ cur…';

  @override
  String get emailSentSuccess => '✅ Post-d air a chur gu soirbheachail!';

  @override
  String get emailSendFailed => '❌ Dh’fhàillig post-d a chur';

  @override
  String get astroDictionaryTitle => 'Faclair Astro';

  @override
  String get searchTermsHint => 'Teirmean rannsachaidh...';

  @override
  String get noTermsFound => 'Cha deach teirmean a lorg';

  @override
  String get buyQuestionsTitle => 'Ceistean Ceannaich';

  @override
  String get userNotAuthenticated => 'Cleachdaiche gun dearbhadh';

  @override
  String get loadStoreDataFailed => 'Dh’fhàillig luchdachadh dàta na stòrais';

  @override
  String get missingAuthToken => 'Comharra dearbhaidh a dhìth';

  @override
  String get merchantDisplayName => 'Aplacaid cabadaich Astro';

  @override
  String get paymentSuccessful => '✅ Pàigheadh soirbheachail! Ceist air a cur';

  @override
  String paymentFailed(Object error) {
    return '❌ Dh’fhàillig am pàigheadh: $error';
  }

  @override
  String get yourBalance => 'Do Chothromachadh';

  @override
  String questionsBalance(Object count) {
    return 'Ceistean $count';
  }

  @override
  String get availableOffers => 'Tairgsean a tha rim faighinn';

  @override
  String questionsCount(Object count) {
    return 'Ceist $count';
  }

  @override
  String get buyButton => 'Ceannaich';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoscope Làitheil';

  @override
  String get userIdMissing => 'Tha ID cleachdaiche a dhìth';

  @override
  String get fetchHoroscopesFailed => 'Dh’fhàillig faighinn nan horoscopan';

  @override
  String get noHoroscopeFound => 'Cha deach horoscope a lorg.';

  @override
  String get signLabel => 'Soidhne';

  @override
  String get todayLabel => 'An-diugh';

  @override
  String get yesterdayLabel => 'An-dè';

  @override
  String get thisWeekLabel => 'An t-Seachdain seo';

  @override
  String get lastMonthLabel => 'A’ mhìos a chaidh seachad';

  @override
  String get chatTitle => 'Còmhradh';

  @override
  String get typeYourQuestionHint => 'Sgrìobh do cheist...';

  @override
  String get paymentRequired => 'Pàigheadh a dhìth';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Tha thu air na ceistean an-asgaidh agad a chleachdadh. Pàigh $amount gus leantainn air adhart.';
  }

  @override
  String get payNowButton => 'Pàigh a-nis';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count ceistean saora air fhàgail';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count ceistean pàighte air fhàgail';
  }

  @override
  String get thankYouFeedback => 'Tapadh leibh airson ur fios-air-ais!';

  @override
  String get ratingSubmitted => 'Rangachadh air a chur a-steach!';

  @override
  String get setUserIdFirst => 'Suidhich an ID Cleachdaiche agad an toiseach';

  @override
  String get failedToFetchPrevious =>
      'Dh’fhàillig e ri ceistean is freagairtean roimhe fhaighinn';

  @override
  String errorOccurred(Object error) {
    return 'Mearachd: $error';
  }

  @override
  String get drawerAstroProfile => 'Pròifil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoscope Làitheil';

  @override
  String get drawerBuyQuestions => 'Ceistean Ceannaich';

  @override
  String get drawerAstroDictionary => 'Faclair Astro';

  @override
  String get drawerSettings => 'Roghainnean';

  @override
  String get drawerCustomerSupport => 'Taic Luchd-ceannach';

  @override
  String get drawerAbout => 'Mu dheidhinn';

  @override
  String get drawerProfileSettings => 'Roghainnean Pròifil';

  @override
  String get demoNotificationTitle => '🔔 Fiosrachadh Taisbeanaidh';

  @override
  String get demoNotificationBody => 'Seo fios deuchainn bhon aplacaid agad!';

  @override
  String get notificationsTitle => 'Fiosan';

  @override
  String get noNotifications => 'Gun fiosan';

  @override
  String get allTab => 'Uile';

  @override
  String get markAllAsRead => 'Comharraich a h-uile rud mar air a leughadh';

  @override
  String get notificationMarkedRead =>
      'Fiosrachadh air a chomharrachadh mar air a leughadh';

  @override
  String get failedToLoadNotifications => 'Dh’fhàillig luchdachadh fiosan';

  @override
  String get failedToMarkRead => 'Dh’fhàillig comharrachadh mar air a leughadh';

  @override
  String get failedToMarkAllRead =>
      'Dh’fhàillig comharrachadh a h-uile càil mar air a leughadh';

  @override
  String get socketConnected => 'Socaid ceangailte';

  @override
  String get socketDisconnected => 'Socaid air a dhì-cheangal';

  @override
  String get newNotificationReceived => 'Fios ùr air fhaighinn';

  @override
  String get generalCategory => 'Coitcheann';

  @override
  String get horoscopeCategory => 'Horoscope';

  @override
  String get chatCategory => 'Còmhradh';

  @override
  String get systemCategory => 'Siostam';

  @override
  String get updateCategory => 'Ùrachaidhean';

  @override
  String get howToAskTitle => 'Mar a dh\'iarras tu';

  @override
  String get noQuestionsAvailable => 'Chan eil ceistean ri fhaighinn';

  @override
  String get failedToLoadQuestions => 'Dh’fhàillig luchdachadh cheistean';

  @override
  String get pullToRefresh => 'Tarraing gus ùrachadh';

  @override
  String get careerCategory => 'Dreuchd';

  @override
  String get loveCategory => 'Gràdh is Dàimhean';

  @override
  String get healthCategory => 'Slàinte';

  @override
  String get financeCategory => 'Ionmhas';

  @override
  String get familyCategory => 'Teaghlach';

  @override
  String get educationCategory => 'Foghlam';

  @override
  String get travelCategory => 'Siubhal';

  @override
  String get spiritualCategory => 'Spioradail';

  @override
  String get profileLoaded =>
      'Chaidh am pròifil a luchdachadh gu soirbheachail';

  @override
  String get imageUploaded =>
      'Chaidh an dealbh a luchdadh suas gu soirbheachail';

  @override
  String get savedInformationConfirmation =>
      'Tha mi air an fhiosrachadh seo a shàbhaladh';

  @override
  String get noHistoryAvailable => 'Chan eil eachdraidh ri fhaighinn';

  @override
  String get missingUserIdError => 'Tha feum air ID cleachdaiche';

  @override
  String get networkError => 'Mearachd lìonra. Feuch ris a-rithist.';

  @override
  String get timeoutError => 'Dh’fhalbh an ùine air an iarrtas';

  @override
  String get genericError => 'Chaidh rudeigin ceàrr';

  @override
  String get reactionUpdateError =>
      'Dh’fhàillig ùrachadh a dhèanamh air an ath-bhualadh';

  @override
  String get noSearchResults => 'Cha deach toraidhean rannsachaidh a lorg';

  @override
  String get clearSearch => 'Glan an rannsachadh';

  @override
  String get resultsFound => 'Toraidhean a chaidh a lorg';

  @override
  String get recoverySecretHint =>
      'Is dòcha nach obraich lethbhreac-pasgadh, sgrìobh le làimh';

  @override
  String get recoverAccountDescription =>
      'Lean na ceumannan seo gus do chunntas fhaighinn air ais';

  @override
  String get processingLabel => 'Giullachd...';

  @override
  String get clearChatSuccess =>
      'Chaidh an còmhradh a ghlanadh gu soirbheachail';

  @override
  String get notificationsEnabled => 'Fiosan air an comasachadh';

  @override
  String get notificationsDisabled => 'Fiosan air an cur à comas';

  @override
  String get securityNotice =>
      'Tha an dàta agad air a chrioptachadh agus air a stòradh gu tèarainte';

  @override
  String get loading => 'A’ luchdadh...';

  @override
  String get selectLanguage => 'Tagh Cànan';

  @override
  String get onboardingGetStartedDesc =>
      'Tòisich le bhith a’ taghadh do chànan';

  @override
  String get accountRecoveryTitle =>
      '🔐 Mion-fhiosrachadh mu Ath-bheothachadh Cunntais';

  @override
  String get recoveryInstructions =>
      'Feuch an sàbhail thu am fiosrachadh seo gu tèarainte. Bidh feum agad air gus do chunntas fhaighinn air ais.';

  @override
  String get importantNotice => '⚠️ Cudromach:';

  @override
  String get astrologerProfileTitle => 'Pròifil Reul-eòlaiche';

  @override
  String get personalAstrologer => 'Reul-eòlaiche Pearsanta';

  @override
  String get makePersonalAstrologer => 'Dèan Reul-eòlaiche Pearsanta';

  @override
  String get favoriteDescription =>
      'Thèid prìomhachas a thoirt do na ceistean agad don reul-eòlaiche seo. Mura h-eil e ri fhaighinn, cuidichidh reul-eòlaiche teisteanasach eile thu.';

  @override
  String get educationQualifications => 'Foghlam & Teisteanasan';

  @override
  String get aboutSection => 'Mu dheidhinn';

  @override
  String get shareProfile => 'Roinn Pròifil';

  @override
  String get loadingAstrologer =>
      'A’ luchdachadh fiosrachadh mu reul-eòlaiche...';

  @override
  String get failedToLoadAstrologer =>
      'Dh’fhàillig luchdachadh mion-fhiosrachadh an reul-eòlaiche';

  @override
  String get authenticationRequired =>
      'Feumar dearbhadh. Log a-steach, ma \'s e do thoil e.';

  @override
  String securityCheckFailed(Object error) {
    return 'Dh’fhàillig sgrùdadh tèarainteachd: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name a-nis \'s e do Reul-eòlaiche Pearsanta a th\' ann';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Chaidh $name a thoirt air falbh bho na rudan as fheàrr leat';
  }

  @override
  String get toggleFavoriteError => 'Dh’fhàillig ùrachadh inbhe as fheàrr leat';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Foghlam: $education\n📜 Teisteanas: $qualification\n⏳ Eòlas: $experience';
  }

  @override
  String get notProvided => 'Gun a thoirt seachad';

  @override
  String reviews(Object count) {
    return '($count lèirmheasan)';
  }

  @override
  String get specialties => 'Speisealachdan';

  @override
  String get experience => 'Eòlas';

  @override
  String get qualification => 'Teisteanas';

  @override
  String get education => 'Foghlam';

  @override
  String get recoveryTips =>
      '• Gabh dealbh-sgrìn den fhiosrachadh seo\n• Stòraich e ann an àite tèarainte\n• Na roinn le duine sam bith\n• Cha tèid seo a shealltainn ach aon uair';

  @override
  String get themeSettingsTitle => 'Roghainnean Cuspair';

  @override
  String get lightThemeLabel => 'Solas';

  @override
  String get lightThemeDescription => 'Cleachd cuspair aotrom an-còmhnaidh';

  @override
  String get darkThemeLabel => 'Dorcha';

  @override
  String get darkThemeDescription => 'Cleachd cuspair dorcha an-còmhnaidh';

  @override
  String get systemThemeLabel => 'Siostam';

  @override
  String get systemThemeDarkDescription =>
      'Lean roghainnean an t-siostaim airson cuspair dorcha';

  @override
  String get systemThemeLightDescription =>
      'Lean roghainnean an t-siostaim airson cuspair aotrom';

  @override
  String get switchToLight => 'Gluais gu Solas';

  @override
  String get switchToDark => 'Gluais gu Dorchadas';

  @override
  String get ourTeam => 'An Sgioba againn';

  @override
  String get teamDescription =>
      'Tha bliadhnaichean de eòlas aig an sgioba againn de speuradairean Vedic proifeasanta ann a bhith a’ mìneachadh buaidhean planaid agus pàtrain beatha. Le taic bho sgioba taic is leasachaidh sònraichte, bidh Karma a’ lìbhrigeadh eòlas gun fhiosta, earbsach agus cruinneil do gach neach-cleachdaidh.';
}
