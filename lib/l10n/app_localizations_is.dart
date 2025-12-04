// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get settingsTitle => 'Stillingar';

  @override
  String get notificationSettings => 'Tilkynningarstillingar';

  @override
  String get privacySettings => 'Persónuverndarstillingar';

  @override
  String get accountSettings => 'Reikningsstillingar';

  @override
  String get languageSettings => 'Tungumálastillingar';

  @override
  String get languageChanged => 'Tungumál breytt';

  @override
  String get existingUserButton => 'Ég er núverandi notandi';

  @override
  String get chooseCountryTitle => 'Veldu land';

  @override
  String get yesText => 'Já';

  @override
  String get noText => 'Nei';

  @override
  String get appBarTitle => 'Prófílstillingar';

  @override
  String get userIdLabel => 'Notandakenni *';

  @override
  String get nameLabel => 'Nafn';

  @override
  String get birthCountryLabel => 'Fæðingarland';

  @override
  String get birthCityLabel => 'Fæðingarborg';

  @override
  String get countrySelectionTitle => 'Veldu landið þitt';

  @override
  String get maleLabel => 'Karlkyns';

  @override
  String get femaleLabel => 'Kvenkyns';

  @override
  String get birthDateLabel => 'Fæðingardagur';

  @override
  String get birthDatePlaceholder => 'Veldu fæðingardag';

  @override
  String get birthTimeLabel => 'Fæðingartími';

  @override
  String get birthTimePlaceholder => 'Veldu fæðingartíma';

  @override
  String get saveProfileButton => 'Vista prófíl';

  @override
  String get noCitiesFound => 'Engar borgir fundust';

  @override
  String cityPlaceholder(Object country) {
    return 'Sláðu inn borg í $country';
  }

  @override
  String get countryFirstPlaceholder => 'Veldu land fyrst';

  @override
  String get versionHistoryTitle => 'Útgáfusaga';

  @override
  String get notSetText => 'Ekki stillt';

  @override
  String nameHistory(Object name) {
    return 'Nafn: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Borg: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Land: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Kyn: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Fæðingardagur: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Fæðingartími: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Staðsetning: $latitude, $longitude';
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
    return 'Staða: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Uppfært þann $date';
  }

  @override
  String get userIdRequired => 'Notandakenni er krafist';

  @override
  String get profileSaved => 'Prófíllinn vistaður';

  @override
  String get saveFailed => 'Mistókst að vista prófílinn';

  @override
  String get errorPrefix => 'Villa:';

  @override
  String get onboardingChooseLanguage => 'Veldu tungumál';

  @override
  String get onboardingChooseLanguageDesc =>
      'Veldu tungumálið sem þú vilt nota til að halda áfram.';

  @override
  String get onboardingWhatIsAstrology => 'Hvað er stjörnuspeki?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Stjörnuspeki er rannsókn á himintunglum...';

  @override
  String get onboardingWhyUseApp => 'Af hverju að nota þetta forrit?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Fáðu sérsniðnar stjörnuspár, daglegar spár og leiðsögn til að taka upplýstar ákvarðanir.';

  @override
  String get onboardingHowToUse => 'Hvernig á að nota þetta forrit?';

  @override
  String get onboardingHowToUseDesc =>
      'Auðvelt er að vafra um, skoða daglegar stjörnuspár og stjórna prófílnum þínum til að fá nákvæmar spár.';

  @override
  String get onboardingGetStarted => 'Byrjaðu';

  @override
  String get onboardingNewUser => 'Nýr notandi';

  @override
  String get onboardingExistingUser => 'Núverandi notandi';

  @override
  String get onboardingBack => 'Til baka';

  @override
  String get onboardingNext => 'Næst';

  @override
  String get userIdNotFound =>
      'Notandakenni fannst ekki. Vinsamlegast skráðu þig inn eða settu upp prófílinn þinn.';

  @override
  String get clearNotificationsTitle => 'Hreinsa tilkynningar';

  @override
  String get clearNotificationsMessage =>
      'Ertu viss um að þú viljir hreinsa allar tilkynningar?';

  @override
  String get clearNotificationsSuccess => 'Allar tilkynningar voru eyddar.';

  @override
  String get clearHoroscopeTitle => 'Hreinsa stjörnuspá';

  @override
  String get clearHoroscopeMessage =>
      'Ertu viss um að þú viljir hreinsa stjörnuspágögnin þín?';

  @override
  String get clearHoroscopeSuccess => 'Stjörnuspá hreinsuð.';

  @override
  String get clearChatTitle => 'Hreinsa spjallferil';

  @override
  String get clearChatMessage =>
      'Ertu viss um að þú viljir eyða öllum spjallferlinum þínum?';

  @override
  String get clearChatLocal => 'Spjall hreinsað á staðnum.';

  @override
  String get deleteAccountTitle => 'Eyða reikningi';

  @override
  String get deleteAccountMessage =>
      'Ertu viss um að þú viljir eyða aðganginum þínum? Þetta mun einnig hreinsa allan spjallferil þinn og tilkynningar.';

  @override
  String get deleteAccountSuccess =>
      'Reikningnum þínum og öllum gögnum hefur verið eytt.';

  @override
  String get deleteAccountError => 'Villa við að eyða reikningi';

  @override
  String get logoutTitle => 'Útskráning';

  @override
  String get logoutMessage => 'Ertu viss um að þú viljir skrá þig út?';

  @override
  String get termsPrivacyTitle => 'Skilmálar og persónuvernd';

  @override
  String get privacyPolicyTitle => 'Persónuverndarstefna';

  @override
  String get termsConditionsTitle => 'Skilmálar';

  @override
  String get dataControlTitle => 'Gagnastjórnun';

  @override
  String get cancelButton => 'Hætta við';

  @override
  String get confirmButton => 'Staðfesta';

  @override
  String get clearQuestionsSuccess => 'Öllum spurningum var eytt.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Drottinn';

  @override
  String get startLabel => 'Byrja';

  @override
  String get recoverAccount => 'Endurheimta reikning';

  @override
  String get endLabel => 'Enda';

  @override
  String get startDateLabel => 'Upphafsdagur';

  @override
  String get endDateLabel => 'Lokadagur';

  @override
  String get notAvailable => 'Ekki í boði';

  @override
  String get noData => 'Engin gögn';

  @override
  String get unknownError => 'Óþekkt villa';

  @override
  String get retryButton => 'Reyna aftur';

  @override
  String get kundaliGeneratorTitle => 'Kundali rafall';

  @override
  String get natalChartTitle => 'Fæðingarkort';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rasí';

  @override
  String get ascDegreeLabel => 'Uppstigsgráðu';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Óþekkt';

  @override
  String get clearHoroscope => 'Hreinsa stjörnuspá';

  @override
  String get clearNotifications => 'Hreinsa tilkynningar';

  @override
  String get clearChatHistory => 'Hreinsa spjallferil';

  @override
  String get logout => 'Útskráning';

  @override
  String get deleteAccount => 'Eyða reikningi';

  @override
  String get allFieldsRequired => 'Öll reitir eru skyldufylltir.';

  @override
  String get accountRecoveredSuccess => 'Reikningnum var endurheimt.';

  @override
  String get recoveryFailed =>
      'Endurheimt mistókst. Athugaðu upplýsingarnar þínar.';

  @override
  String get recoverySecretLabel => 'Leyndarmál bata:';

  @override
  String get aboutUsTitle => 'Um okkur';

  @override
  String get aboutOurCompany => 'Um fyrirtækið okkar';

  @override
  String get aboutCompanyDescription =>
      'Hjá Karma hjálpum við þér að uppgötva þína sönnu lífsleið með tímalausri visku vedískrar stjörnuspeki. Sérhver innsýn kemur frá raunverulegum, reyndum stjörnuspekingum, vandlega útfærðum út frá þínu einstaka fæðingarkorti. Frá daglegum stjörnuspám til persónulegrar leiðsagnar gerir Karma forna þekkingu aðgengilega á yfir 100 tungumálum.';

  @override
  String get ourMission => 'Markmið okkar';

  @override
  String get missionDescription =>
      'Markmið okkar er einfalt: að veita áreiðanlega, mannlega leiðsögn í stjörnuspeki sem gerir þér kleift að taka öruggar og upplýstar ákvarðanir. Sérhver spá og ráðgjöf endurspeglar áralanga fagþekkingu, ekki sjálfvirkar reiknirit.';

  @override
  String get ourVision => 'Sýn okkar';

  @override
  String get visionDescription =>
      'Við leggjum okkur fram um að vera traustasta vettvangur heims fyrir vedíska stjörnuspeki og hjálpa fólki alls staðar að skilja sjálft sig, val sín og lífsferð sína með skýrleika og sjálfstrausti.';

  @override
  String get ourValues => 'Gildi okkar';

  @override
  String get valuesDescription =>
      'Hjá Karma leggjum við áherslu á áreiðanleika, nákvæmni og traust. Við leggjum okkur fram um að bjóða upp á leiðsögn sem er ekki aðeins nákvæm heldur einnig innihaldsrík og hjálpar þér að sigla í gegnum lífið með innsæi og sjálfstrausti.';

  @override
  String get contactUs => 'Hafðu samband við okkur';

  @override
  String get contactEmail => 'Netfang: support@yourcompany.com';

  @override
  String get contactWebsite => 'Vefsíða: www.þittfyrirtæki.com';

  @override
  String get customerSupport => 'Þjónustuver';

  @override
  String get supportHeroTitle => 'Við erum hér til að hjálpa';

  @override
  String get supportHeroDescription =>
      'Fylltu út formið hér að neðan og þjónustudeild okkar mun hafa samband við þig eins fljótt og auðið er.';

  @override
  String get yourName => 'Nafn þitt';

  @override
  String get yourEmail => 'Netfangið þitt';

  @override
  String get message => 'Skilaboð';

  @override
  String get enterEmail => 'Sláðu inn netfangið þitt';

  @override
  String get enterValidEmail => 'Sláðu inn gilt netfang';

  @override
  String enterField(Object fieldName) {
    return 'Sláðu inn $fieldName';
  }

  @override
  String get send => 'Senda';

  @override
  String get sending => 'Sendi...';

  @override
  String get emailSentSuccess => '✅ Tölvupóstur sendur!';

  @override
  String get emailSendFailed => '❌ Mistókst að senda tölvupóst';

  @override
  String get astroDictionaryTitle => 'Astro orðabók';

  @override
  String get searchTermsHint => 'Leitarorð...';

  @override
  String get noTermsFound => 'Engin hugtök fundust';

  @override
  String get buyQuestionsTitle => 'Kaupa spurningar';

  @override
  String get userNotAuthenticated => 'Notandi ekki auðkenndur';

  @override
  String get loadStoreDataFailed => 'Mistókst að hlaða gögnum verslunarinnar';

  @override
  String get missingAuthToken => 'Vantar heimildarlykil';

  @override
  String get merchantDisplayName => 'Astro spjallforrit';

  @override
  String get paymentSuccessful => '✅ Greiðsla tókst! Spurning send';

  @override
  String paymentFailed(Object error) {
    return '❌ Greiðsla mistókst: $error';
  }

  @override
  String get yourBalance => 'Staða þín';

  @override
  String questionsBalance(Object count) {
    return '$count Spurningar';
  }

  @override
  String get availableOffers => 'Tilboð í boði';

  @override
  String questionsCount(Object count) {
    return '$count Spurning';
  }

  @override
  String get buyButton => 'Kaupa';

  @override
  String get dailyHoroscopeTitle => '🌟 Daglegt stjörnuspákort';

  @override
  String get userIdMissing => 'Notandakenni vantar';

  @override
  String get fetchHoroscopesFailed => 'Mistókst að sækja stjörnuspár';

  @override
  String get noHoroscopeFound => 'Engin stjörnuspá fannst.';

  @override
  String get signLabel => 'Skilti';

  @override
  String get todayLabel => 'Í dag';

  @override
  String get yesterdayLabel => 'Í gær';

  @override
  String get thisWeekLabel => 'Þessi vika';

  @override
  String get lastMonthLabel => 'Síðasti mánuður';

  @override
  String get chatTitle => 'Spjall';

  @override
  String get typeYourQuestionHint => 'Skrifaðu spurninguna þína...';

  @override
  String get paymentRequired => 'Greiðsla krafist';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Þú hefur notað ókeypis spurningarnar þínar. Borgaðu $amount til að halda áfram.';
  }

  @override
  String get payNowButton => 'Borga núna';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count lausar spurningar eftir';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count greiddar spurningar eftir';
  }

  @override
  String get thankYouFeedback => 'Þakka þér fyrir ábendinguna!';

  @override
  String get ratingSubmitted => 'Einkunn send inn!';

  @override
  String get setUserIdFirst => 'Vinsamlegast stilltu fyrst notandanafnið þitt';

  @override
  String get failedToFetchPrevious =>
      'Mistókst að sækja fyrri spurningar og svör';

  @override
  String errorOccurred(Object error) {
    return 'Villa: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro prófíll';

  @override
  String get drawerDailyHoroscope => 'Daglegt stjörnuspákort';

  @override
  String get drawerBuyQuestions => 'Kaupa spurningar';

  @override
  String get drawerAstroDictionary => 'Astro orðabók';

  @override
  String get drawerSettings => 'Stillingar';

  @override
  String get drawerCustomerSupport => 'Þjónustuver';

  @override
  String get drawerAbout => 'Um';

  @override
  String get drawerProfileSettings => 'Prófílstillingar';

  @override
  String get demoNotificationTitle => '🔔 Tilkynning um kynningu';

  @override
  String get demoNotificationBody =>
      'Þetta er prufutilkynning frá appinu þínu!';

  @override
  String get notificationsTitle => 'Tilkynningar';

  @override
  String get noNotifications => 'Engar tilkynningar';

  @override
  String get allTab => 'Allt';

  @override
  String get markAllAsRead => 'Merkja allt sem lesið';

  @override
  String get notificationMarkedRead => 'Tilkynning merkt sem lesin';

  @override
  String get failedToLoadNotifications => 'Mistókst að hlaða tilkynningum';

  @override
  String get failedToMarkRead => 'Mistókst að merkja sem lesið';

  @override
  String get failedToMarkAllRead => 'Mistókst að merkja allt sem lesið';

  @override
  String get socketConnected => 'Tengdur tengill';

  @override
  String get socketDisconnected => 'Tengillinn er aftengdur';

  @override
  String get newNotificationReceived => 'Ný tilkynning móttekin';

  @override
  String get generalCategory => 'Almennt';

  @override
  String get horoscopeCategory => 'Stjörnuspá';

  @override
  String get chatCategory => 'Spjall';

  @override
  String get systemCategory => 'Kerfi';

  @override
  String get updateCategory => 'Uppfærslur';

  @override
  String get howToAskTitle => 'Hvernig á að spyrja';

  @override
  String get noQuestionsAvailable => 'Engar spurningar tiltækar';

  @override
  String get failedToLoadQuestions => 'Mistókst að hlaða spurningum';

  @override
  String get pullToRefresh => 'Dragðu til að endurnýja';

  @override
  String get careerCategory => 'Ferill';

  @override
  String get loveCategory => 'Ást og sambönd';

  @override
  String get healthCategory => 'Heilsa';

  @override
  String get financeCategory => 'Fjármál';

  @override
  String get familyCategory => 'Fjölskylda';

  @override
  String get educationCategory => 'Menntun';

  @override
  String get travelCategory => 'Ferðalög';

  @override
  String get spiritualCategory => 'Andleg';

  @override
  String get profileLoaded => 'Prófíllinn hlaðinn';

  @override
  String get imageUploaded => 'Myndin var hlaðin upp';

  @override
  String get savedInformationConfirmation => 'Ég hef vistað þessar upplýsingar';

  @override
  String get noHistoryAvailable => 'Engin saga tiltæk';

  @override
  String get missingUserIdError => 'Notandakenni er krafist';

  @override
  String get networkError => 'Netvilla. Vinsamlegast reyndu aftur.';

  @override
  String get timeoutError => 'Beiðni rann út á tíma';

  @override
  String get genericError => 'Eitthvað fór úrskeiðis';

  @override
  String get reactionUpdateError => 'Mistókst að uppfæra viðbrögð';

  @override
  String get noSearchResults => 'Engar leitarniðurstöður fundust';

  @override
  String get clearSearch => 'Hreinsa leit';

  @override
  String get resultsFound => 'Niðurstöður fundust';

  @override
  String get recoverySecretHint =>
      'Afritun og líming virka kannski ekki, sláðu inn handvirkt';

  @override
  String get recoverAccountDescription =>
      'Fylgdu þessum skrefum til að endurheimta reikninginn þinn';

  @override
  String get processingLabel => 'Vinnsla...';

  @override
  String get clearChatSuccess => 'Spjall hreinsað';

  @override
  String get notificationsEnabled => 'Tilkynningar virkjaðar';

  @override
  String get notificationsDisabled => 'Tilkynningar óvirkar';

  @override
  String get securityNotice =>
      'Gögnin þín eru dulkóðuð og geymd á öruggan hátt';

  @override
  String get loading => 'Hleður...';

  @override
  String get selectLanguage => 'Veldu tungumál';

  @override
  String get onboardingGetStartedDesc => 'Byrjaðu með því að velja tungumál';

  @override
  String get accountRecoveryTitle => '🔐 Upplýsingar um endurheimt reiknings';

  @override
  String get recoveryInstructions =>
      'Vinsamlegast geymið þessar upplýsingar á öruggan hátt. Þú þarft þær til að endurheimta reikninginn þinn.';

  @override
  String get importantNotice => '⚠️ Mikilvægt:';

  @override
  String get astrologerProfileTitle => 'Stjörnuspekingur';

  @override
  String get personalAstrologer => 'Einkastjörnuspekingur';

  @override
  String get makePersonalAstrologer => 'Gerðu persónulegan stjörnuspeking';

  @override
  String get favoriteDescription =>
      'Spurningum þínum verður forgangsraðað til þessa stjörnuspekings. Ef hann er ekki tiltækur mun annar hæfur stjörnuspekingur aðstoða þig.';

  @override
  String get educationQualifications => 'Menntun og hæfni';

  @override
  String get aboutSection => 'Um';

  @override
  String get shareProfile => 'Deila prófíl';

  @override
  String get loadingAstrologer => 'Hleður upplýsingar um stjörnuspeking...';

  @override
  String get failedToLoadAstrologer =>
      'Mistókst að hlaða upplýsingum um stjörnuspeking';

  @override
  String get authenticationRequired =>
      'Auðkenning krafist. Vinsamlegast skráðu þig inn.';

  @override
  String securityCheckFailed(Object error) {
    return 'Öryggisathugun mistókst: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name er nú þinn persónulegi stjörnuspekingur';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Fjarlægði $name úr uppáhaldslistum';
  }

  @override
  String get toggleFavoriteError => 'Mistókst að uppfæra uppáhaldsstöðu';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Menntun: $education\n📜 Hæfni: $qualification\n⏳ Reynsla: $experience';
  }

  @override
  String get notProvided => 'Ekki gefið upp';

  @override
  String reviews(Object count) {
    return '($count umsagnir)';
  }

  @override
  String get specialties => 'Sérgreinar';

  @override
  String get experience => 'Reynsla';

  @override
  String get qualification => 'Hæfniskröfur';

  @override
  String get education => 'Menntun';

  @override
  String get recoveryTips =>
      '• Taktu skjámynd af þessum upplýsingum\n• Geymdu þær á öruggum stað\n• Ekki deila með neinum\n• Þetta verður aðeins sýnt einu sinni';

  @override
  String get themeSettingsTitle => 'Þemastillingar';

  @override
  String get lightThemeLabel => 'Ljós';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Dökkt';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Kerfi';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';

  @override
  String get ourTeam => 'Teymið okkar';

  @override
  String get teamDescription =>
      'Teymi okkar faglegra vedískra stjörnuspekinga býr yfir ára reynslu af því að túlka áhrif reikistjarna og lífsmynstur. Með stuðningi sérstaks stuðnings- og þróunarteymi býður Karma upp á óaðfinnanlega, áreiðanlega og alþjóðlega upplifun fyrir alla notendur.';
}
