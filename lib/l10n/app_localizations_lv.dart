// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get settingsTitle => 'Iestatījumi';

  @override
  String get notificationSettings => 'Paziņojumu iestatījumi';

  @override
  String get privacySettings => 'Privātuma iestatījumi';

  @override
  String get accountSettings => 'Konta iestatījumi';

  @override
  String get languageSettings => 'Valodas iestatījumi';

  @override
  String get languageChanged => 'Valoda mainīta';

  @override
  String get existingUserButton => 'Esmu esošs lietotājs';

  @override
  String get chooseCountryTitle => 'Izvēlieties valsti';

  @override
  String get yesText => 'Jā';

  @override
  String get noText => 'Nē';

  @override
  String get appBarTitle => 'Profila iestatījumi';

  @override
  String get userIdLabel => 'Lietotāja ID *';

  @override
  String get nameLabel => 'Vārds';

  @override
  String get birthCountryLabel => 'Dzimšanas valsts';

  @override
  String get birthCityLabel => 'Dzimšanas pilsēta';

  @override
  String get countrySelectionTitle => 'Izvēlieties savu valsti';

  @override
  String get maleLabel => 'Vīrietis';

  @override
  String get femaleLabel => 'Sieviete';

  @override
  String get birthDateLabel => 'Dzimšanas datums';

  @override
  String get birthDatePlaceholder => 'Izvēlieties dzimšanas datumu';

  @override
  String get birthTimeLabel => 'Dzimšanas laiks';

  @override
  String get birthTimePlaceholder => 'Izvēlieties dzimšanas laiku';

  @override
  String get saveProfileButton => 'Saglabāt profilu';

  @override
  String get noCitiesFound => 'Nav atrastas pilsētas';

  @override
  String cityPlaceholder(Object country) {
    return 'Ievadiet pilsētu šajā valstī: $country';
  }

  @override
  String get countryFirstPlaceholder => 'Vispirms atlasiet valsti';

  @override
  String get versionHistoryTitle => 'Versiju vēsture';

  @override
  String get notSetText => 'Nav iestatīts';

  @override
  String nameHistory(Object name) {
    return 'Vārds: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Pilsēta: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Valsts: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Dzimums: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dzimšanas datums: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Dzimšanas laiks: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Atrašanās vieta: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Laika josla: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Vasaras/ziemas laiks: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Štats: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Atjaunināts $date';
  }

  @override
  String get userIdRequired => 'Lietotāja ID ir obligāts';

  @override
  String get profileSaved => 'Profils veiksmīgi saglabāts';

  @override
  String get saveFailed => 'Neizdevās saglabāt profilu';

  @override
  String get errorPrefix => 'Kļūda:';

  @override
  String get onboardingChooseLanguage => 'Izvēlieties savu valodu';

  @override
  String get onboardingChooseLanguageDesc =>
      'Lai turpinātu, izvēlieties vēlamo valodu.';

  @override
  String get onboardingWhatIsAstrology => 'Kas ir astroloģija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astroloģija ir debess ķermeņu izpēte...';

  @override
  String get onboardingWhyUseApp => 'Kāpēc izmantot šo lietotni?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Saņemiet personalizētus horoskopus, ikdienas prognozes un norādījumus, lai pieņemtu pārdomātus lēmumus.';

  @override
  String get onboardingHowToUse => 'Kā lietot šo lietotni?';

  @override
  String get onboardingHowToUseDesc =>
      'Ērti pārvietojieties, pārbaudiet ikdienas horoskopus un pārvaldiet savu profilu, lai iegūtu precīzas prognozes.';

  @override
  String get onboardingGetStarted => 'Sākt darbu';

  @override
  String get onboardingNewUser => 'Jauns lietotājs';

  @override
  String get onboardingExistingUser => 'Esošais lietotājs';

  @override
  String get onboardingBack => 'Atpakaļ';

  @override
  String get onboardingNext => 'Nākamais';

  @override
  String get userIdNotFound =>
      'Lietotāja ID nav atrasts. Lūdzu, piesakieties vai iestatiet savu profilu.';

  @override
  String get clearNotificationsTitle => 'Notīrīt paziņojumus';

  @override
  String get clearNotificationsMessage =>
      'Vai tiešām vēlaties notīrīt visus paziņojumus?';

  @override
  String get clearNotificationsSuccess =>
      'Visi paziņojumi ir veiksmīgi notīrīti.';

  @override
  String get clearHoroscopeTitle => 'Skaidrs horoskops';

  @override
  String get clearHoroscopeMessage =>
      'Vai tiešām vēlaties notīrīt savus horoskopa datus?';

  @override
  String get clearHoroscopeSuccess => 'Horoskops veiksmīgi notīrīts.';

  @override
  String get clearChatTitle => 'Notīrīt tērzēšanas vēsturi';

  @override
  String get clearChatMessage =>
      'Vai tiešām vēlaties dzēst visu savu tērzēšanas vēsturi?';

  @override
  String get clearChatLocal => 'Tērzēšana lokāli notīrīta.';

  @override
  String get deleteAccountTitle => 'Dzēst kontu';

  @override
  String get deleteAccountMessage =>
      'Vai tiešām vēlaties dzēst savu kontu? Tādējādi tiks notīrīta arī visa jūsu tērzēšanas vēsture un paziņojumi.';

  @override
  String get deleteAccountSuccess => 'Jūsu konts un visi dati ir noņemti.';

  @override
  String get deleteAccountError => 'Kļūda, dzēšot kontu';

  @override
  String get logoutTitle => 'Izrakstīties';

  @override
  String get logoutMessage => 'Vai tiešām vēlaties atteikties?';

  @override
  String get termsPrivacyTitle => 'Noteikumi un konfidencialitāte';

  @override
  String get privacyPolicyTitle => 'Privātuma politika';

  @override
  String get termsConditionsTitle => 'Noteikumi un nosacījumi';

  @override
  String get dataControlTitle => 'Datu kontrole';

  @override
  String get cancelButton => 'Atcelt';

  @override
  String get confirmButton => 'Apstiprināt';

  @override
  String get clearQuestionsSuccess => 'Visi jautājumi veiksmīgi izdzēsti.';

  @override
  String get yoginiLabel => 'Jogīni';

  @override
  String get lordLabel => 'Kungs';

  @override
  String get startLabel => 'Sākt';

  @override
  String get recoverAccount => 'Atgūt kontu';

  @override
  String get endLabel => 'Beigas';

  @override
  String get startDateLabel => 'Sākuma datums';

  @override
  String get endDateLabel => 'Beigu datums';

  @override
  String get notAvailable => 'Nav pieejams';

  @override
  String get noData => 'Nav datu';

  @override
  String get unknownError => 'Nezināma kļūda';

  @override
  String get retryButton => 'Mēģināt vēlreiz';

  @override
  String get kundaliGeneratorTitle => 'Kundali ģenerators';

  @override
  String get natalChartTitle => 'Dzimšanas diagramma';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Ascendenta grāds';

  @override
  String get vimshottariDashaTitle => 'Vimshotari Daša';

  @override
  String get yoginiDashaTitle => 'Jogīni Daša';

  @override
  String get unknown => 'Nezināms';

  @override
  String get clearHoroscope => 'Skaidrs horoskops';

  @override
  String get clearNotifications => 'Notīrīt paziņojumus';

  @override
  String get clearChatHistory => 'Notīrīt tērzēšanas vēsturi';

  @override
  String get logout => 'Izrakstīties';

  @override
  String get deleteAccount => 'Dzēst kontu';

  @override
  String get allFieldsRequired => 'Visi lauki ir obligāti jāaizpilda.';

  @override
  String get accountRecoveredSuccess => 'Konts veiksmīgi atgūts.';

  @override
  String get recoveryFailed =>
      'Atkopšana neizdevās. Pārbaudiet savu informāciju.';

  @override
  String get recoverySecretLabel => 'Atgūšanas noslēpums:';

  @override
  String get aboutUsTitle => 'Par mums';

  @override
  String get aboutOurCompany => 'Par mūsu uzņēmumu';

  @override
  String get aboutCompanyDescription =>
      'Mēs esam apņēmušies sniegt vislabāko astroloģijas pieredzi mūsu lietotājiem.';

  @override
  String get ourMission => 'Mūsu misija';

  @override
  String get missionDescription =>
      'Sniegt precīzu un personalizētu astroloģijas ieskatu, lai palīdzētu lietotājiem pieņemt pārdomātus lēmumus savā dzīvē.';

  @override
  String get ourVision => 'Mūsu vīzija';

  @override
  String get visionDescription =>
      'Kļūt par visuzticamāko astroloģijas platformu, apvienojot tehnoloģijas un seno gudrību.';

  @override
  String get ourValues => 'Mūsu vērtības';

  @override
  String get valuesDescription =>
      'Godprātība, precizitāte, uz lietotāju orientēts dizains un nepārtrauktas inovācijas.';

  @override
  String get contactUs => 'Sazinieties ar mums';

  @override
  String get contactEmail => 'E-pasts: support@yourcompany.com';

  @override
  String get contactWebsite => 'Tīmekļa vietne: www.yourcompany.com';

  @override
  String get customerSupport => 'Klientu atbalsts';

  @override
  String get supportHeroTitle => 'Mēs esam šeit, lai palīdzētu';

  @override
  String get supportHeroDescription =>
      'Aizpildiet zemāk esošo veidlapu, un mūsu atbalsta komanda sazināsies ar jums, cik drīz vien iespējams.';

  @override
  String get yourName => 'Tavs vārds';

  @override
  String get yourEmail => 'Jūsu e-pasts';

  @override
  String get message => 'Ziņojums';

  @override
  String get enterEmail => 'Ievadiet savu e-pasta adresi';

  @override
  String get enterValidEmail => 'Ievadiet derīgu e-pasta adresi';

  @override
  String enterField(Object fieldName) {
    return 'Ievadiet $fieldName';
  }

  @override
  String get send => 'Sūtīt';

  @override
  String get sending => 'Sūtīšana...';

  @override
  String get emailSentSuccess => '✅ E-pasts veiksmīgi nosūtīts!';

  @override
  String get emailSendFailed => '❌ Neizdevās nosūtīt e-pastu';

  @override
  String get astroDictionaryTitle => 'Astro vārdnīca';

  @override
  String get searchTermsHint => 'Meklēšanas termini...';

  @override
  String get noTermsFound => 'Nav atrasti termini';

  @override
  String get buyQuestionsTitle => 'Pirkšanas jautājumi';

  @override
  String get userNotAuthenticated => 'Lietotājs nav autentificēts';

  @override
  String get loadStoreDataFailed => 'Neizdevās ielādēt veikala datus';

  @override
  String get missingAuthToken => 'Trūkst autorizācijas marķiera';

  @override
  String get merchantDisplayName => 'Astro tērzēšanas lietotne';

  @override
  String get paymentSuccessful => '✅ Maksājums veiksmīgs! Jautājums nosūtīts';

  @override
  String paymentFailed(Object error) {
    return '❌ Maksājums neizdevās: $error';
  }

  @override
  String get yourBalance => 'Jūsu atlikums';

  @override
  String questionsBalance(Object count) {
    return '$count Jautājumi';
  }

  @override
  String get availableOffers => 'Pieejamie piedāvājumi';

  @override
  String questionsCount(Object count) {
    return '$count Jautājums';
  }

  @override
  String get buyButton => 'Pirkt';

  @override
  String get dailyHoroscopeTitle => '🌟 Dienas horoskops';

  @override
  String get userIdMissing => 'Trūkst lietotāja ID';

  @override
  String get fetchHoroscopesFailed => 'Neizdevās izgūt horoskopus.';

  @override
  String get noHoroscopeFound => 'Nav atrasts horoskops.';

  @override
  String get signLabel => 'Zīme';

  @override
  String get todayLabel => 'Šodien';

  @override
  String get yesterdayLabel => 'Vakar';

  @override
  String get thisWeekLabel => 'Šonedēļ';

  @override
  String get lastMonthLabel => 'Pagājušajā mēnesī';

  @override
  String get chatTitle => 'Tērzēšana';

  @override
  String get typeYourQuestionHint => 'Ierakstiet savu jautājumu...';

  @override
  String get paymentRequired => 'Nepieciešams maksājums';

  @override
  String get paymentRequiredMessage =>
      'Jūs esat izmantojis savus bezmaksas jautājumus. Lai turpinātu, samaksājiet ₹50.';

  @override
  String get payNowButton => 'Maksāt tūlīt';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Atlikušie $count bezmaksas jautājumi';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Atlikušie maksas jautājumi: $count';
  }

  @override
  String get thankYouFeedback => 'Paldies par jūsu atsauksmi!';

  @override
  String get ratingSubmitted => 'Vērtējums iesniegts!';

  @override
  String get setUserIdFirst => 'Lūdzu, vispirms iestatiet savu lietotāja ID.';

  @override
  String get failedToFetchPrevious =>
      'Neizdevās izgūt iepriekšējos jautājumus un atbildes.';

  @override
  String errorOccurred(Object error) {
    return 'Kļūda: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profils';

  @override
  String get drawerDailyHoroscope => 'Dienas horoskops';

  @override
  String get drawerBuyQuestions => 'Pirkšanas jautājumi';

  @override
  String get drawerAstroDictionary => 'Astro vārdnīca';

  @override
  String get drawerSettings => 'Iestatījumi';

  @override
  String get drawerCustomerSupport => 'Klientu atbalsts';

  @override
  String get drawerAbout => 'Par mums';

  @override
  String get drawerProfileSettings => 'Profila iestatījumi';

  @override
  String get demoNotificationTitle => '🔔 Demonstrācijas paziņojums';

  @override
  String get demoNotificationBody =>
      'Šis ir testa paziņojums no jūsu lietotnes!';

  @override
  String get notificationsTitle => 'Paziņojumi';

  @override
  String get noNotifications => 'Nav paziņojumu';

  @override
  String get allTab => 'Visi';

  @override
  String get markAllAsRead => 'Atzīmēt visu kā izlasītu';

  @override
  String get notificationMarkedRead => 'Paziņojums atzīmēts kā izlasīts';

  @override
  String get failedToLoadNotifications => 'Neizdevās ielādēt paziņojumus';

  @override
  String get failedToMarkRead => 'Neizdevās atzīmēt kā izlasītu';

  @override
  String get failedToMarkAllRead => 'Neizdevās atzīmēt visu kā izlasītu';

  @override
  String get socketConnected => 'Kontaktligzda pievienota';

  @override
  String get socketDisconnected => 'Kontaktligzda atvienota';

  @override
  String get newNotificationReceived => 'Saņemts jauns paziņojums';

  @override
  String get generalCategory => 'Vispārīgi';

  @override
  String get horoscopeCategory => 'Horoskops';

  @override
  String get chatCategory => 'Tērzēšana';

  @override
  String get systemCategory => 'Sistēma';

  @override
  String get updateCategory => 'Atjauninājumi';

  @override
  String get howToAskTitle => 'Kā jautāt';

  @override
  String get noQuestionsAvailable => 'Nav pieejamu jautājumu';

  @override
  String get failedToLoadQuestions => 'Neizdevās ielādēt jautājumus';

  @override
  String get pullToRefresh => 'Pavelciet, lai atsvaidzinātu';

  @override
  String get careerCategory => 'Karjera';

  @override
  String get loveCategory => 'Mīlestība un attiecības';

  @override
  String get healthCategory => 'Veselība';

  @override
  String get financeCategory => 'Finanses';

  @override
  String get familyCategory => 'Ģimene';

  @override
  String get educationCategory => 'Izglītība';

  @override
  String get travelCategory => 'Ceļošana';

  @override
  String get spiritualCategory => 'Garīgs';

  @override
  String get profileLoaded => 'Profils veiksmīgi ielādēts';

  @override
  String get imageUploaded => 'Attēls veiksmīgi augšupielādēts';

  @override
  String get savedInformationConfirmation => 'Esmu saglabājis šo informāciju';

  @override
  String get noHistoryAvailable => 'Vēsture nav pieejama';

  @override
  String get missingUserIdError => 'Lietotāja ID ir obligāts';

  @override
  String get networkError => 'Tīkla kļūda. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get timeoutError => 'Pieprasījuma taimauts ir beidzies';

  @override
  String get genericError => 'Kaut kas nogāja greizi';

  @override
  String get reactionUpdateError => 'Neizdevās atjaunināt reakciju';

  @override
  String get noSearchResults => 'Nav atrasti meklēšanas rezultāti';

  @override
  String get clearSearch => 'Notīrīt meklēšanu';

  @override
  String get resultsFound => 'Atrasti rezultāti';

  @override
  String get recoverySecretHint =>
      'Kopēšana un ielīmēšana var nedarboties, rakstiet manuāli';

  @override
  String get recoverAccountDescription =>
      'Lai atgūtu savu kontu, veiciet šīs darbības';

  @override
  String get processingLabel => 'Notiek apstrāde...';

  @override
  String get clearChatSuccess => 'Tērzēšana veiksmīgi notīrīta';

  @override
  String get notificationsEnabled => 'Paziņojumi ir iespējoti';

  @override
  String get notificationsDisabled => 'Paziņojumi ir atspējoti';

  @override
  String get securityNotice => 'Jūsu dati tiek droši šifrēti un glabāti';

  @override
  String get loading => 'Notiek ielāde...';

  @override
  String get selectLanguage => 'Izvēlieties valodu';

  @override
  String get onboardingGetStartedDesc => 'Sāciet, izvēloties valodu';

  @override
  String get accountRecoveryTitle => '🔐 Konta atkopšanas informācija';

  @override
  String get recoveryInstructions =>
      'Lūdzu, droši saglabājiet šo informāciju. Tā būs nepieciešama, lai atgūtu savu kontu.';

  @override
  String get importantNotice => '⚠️ Svarīgi:';

  @override
  String get astrologerProfileTitle => 'Astrologa profils';

  @override
  String get personalAstrologer => 'Personīgais astrologs';

  @override
  String get makePersonalAstrologer => 'Izveidojiet personīgo astrologu';

  @override
  String get favoriteDescription =>
      'Jūsu jautājumi tiks nodoti šim astrologam prioritārā secībā. Ja tas nav pieejams, jums palīdzēs cits kvalificēts astrologs.';

  @override
  String get educationQualifications => 'Izglītība un kvalifikācija';

  @override
  String get aboutSection => 'Par mums';

  @override
  String get shareProfile => 'Kopīgot profilu';

  @override
  String get loadingAstrologer => 'Notiek astrologa informācijas ielāde...';

  @override
  String get failedToLoadAstrologer =>
      'Neizdevās ielādēt astrologa informāciju.';

  @override
  String get authenticationRequired =>
      'Nepieciešama autentifikācija. Lūdzu, piesakieties.';

  @override
  String securityCheckFailed(Object error) {
    return 'Drošības pārbaude neizdevās: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name tagad ir jūsu personīgais astrologs';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Noņemts $name no izlases';
  }

  @override
  String get toggleFavoriteError => 'Neizdevās atjaunināt iecienītāko statusu';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Izglītība: $education\n📜 Kvalifikācija: $qualification\n⏳ Pieredze: $experience';
  }

  @override
  String get notProvided => 'Nav sniegts';

  @override
  String reviews(Object count) {
    return '($count atsauksmes)';
  }

  @override
  String get specialties => 'Specialitātes';

  @override
  String get experience => 'Pieredze';

  @override
  String get qualification => 'Kvalifikācija';

  @override
  String get education => 'Izglītība';

  @override
  String get recoveryTips =>
      '• Uzņemiet šīs informācijas ekrānuzņēmumu\n• Glabājiet to drošā vietā\n• Neizpaudiet nevienam\n• Tas tiks parādīts tikai vienu reizi';

  @override
  String get themeSettingsTitle => 'Tēmas iestatījumi';

  @override
  String get lightThemeLabel => 'Gaisma';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tumšs';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistēma';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
