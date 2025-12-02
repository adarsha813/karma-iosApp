// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get settingsTitle => 'Nustatymai';

  @override
  String get notificationSettings => 'Pranešimų nustatymai';

  @override
  String get privacySettings => 'Privatumo nustatymai';

  @override
  String get accountSettings => 'Paskyros nustatymai';

  @override
  String get languageSettings => 'Kalbos nustatymai';

  @override
  String get languageChanged => 'Kalba pakeista';

  @override
  String get existingUserButton => 'Esu esamas naudotojas';

  @override
  String get chooseCountryTitle => 'Pasirinkite šalį';

  @override
  String get yesText => 'Taip';

  @override
  String get noText => 'Ne';

  @override
  String get appBarTitle => 'Profilio nustatymai';

  @override
  String get userIdLabel => 'Naudotojo ID *';

  @override
  String get nameLabel => 'Vardas';

  @override
  String get birthCountryLabel => 'Gimimo šalis';

  @override
  String get birthCityLabel => 'Gimimo miestas';

  @override
  String get countrySelectionTitle => 'Pasirinkite savo šalį';

  @override
  String get maleLabel => 'Vyras';

  @override
  String get femaleLabel => 'Moteris';

  @override
  String get birthDateLabel => 'Gimimo data';

  @override
  String get birthDatePlaceholder => 'Pasirinkite gimimo datą';

  @override
  String get birthTimeLabel => 'Gimimo laikas';

  @override
  String get birthTimePlaceholder => 'Pasirinkite gimimo laiką';

  @override
  String get saveProfileButton => 'Išsaugoti profilį';

  @override
  String get noCitiesFound => 'Nerasta jokių miestų';

  @override
  String cityPlaceholder(Object country) {
    return 'Įveskite miestą šalyje $country';
  }

  @override
  String get countryFirstPlaceholder => 'Pirmiausia pasirinkite šalį';

  @override
  String get versionHistoryTitle => 'Versijų istorija';

  @override
  String get notSetText => 'Nenustatyta';

  @override
  String nameHistory(Object name) {
    return 'Vardas: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Miestas: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Šalis: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Lytis: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Gimimo data: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Gimimo laikas: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Vieta: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Laiko juosta: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Vasaros laikas: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Valstija: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Atnaujinta $date';
  }

  @override
  String get userIdRequired => 'Reikalingas vartotojo ID';

  @override
  String get profileSaved => 'Profilis sėkmingai išsaugotas';

  @override
  String get saveFailed => 'Nepavyko išsaugoti profilio';

  @override
  String get errorPrefix => 'Klaida:';

  @override
  String get onboardingChooseLanguage => 'Pasirinkite kalbą';

  @override
  String get onboardingChooseLanguageDesc =>
      'Norėdami tęsti, pasirinkite pageidaujamą kalbą.';

  @override
  String get onboardingWhatIsAstrology => 'Kas yra astrologija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologija yra dangaus kūnų tyrimas...';

  @override
  String get onboardingWhyUseApp => 'Kodėl verta naudoti šią programėlę?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Gaukite suasmenintus horoskopus, dienos prognozes ir patarimus, kad galėtumėte priimti pagrįstus sprendimus.';

  @override
  String get onboardingHowToUse => 'Kaip naudotis šia programėle?';

  @override
  String get onboardingHowToUseDesc =>
      'Lengvai naršykite, tikrinkite dienos horoskopus ir tvarkykite savo profilį, kad gautumėte tikslias prognozes.';

  @override
  String get onboardingGetStarted => 'Pradėti';

  @override
  String get onboardingNewUser => 'Naujas vartotojas';

  @override
  String get onboardingExistingUser => 'Esamas vartotojas';

  @override
  String get onboardingBack => 'Atgal';

  @override
  String get onboardingNext => 'Toliau';

  @override
  String get userIdNotFound =>
      'Naudotojo ID nerastas. Prisijunkite arba nustatykite savo profilį.';

  @override
  String get clearNotificationsTitle => 'Išvalyti pranešimus';

  @override
  String get clearNotificationsMessage =>
      'Ar tikrai norite išvalyti visus pranešimus?';

  @override
  String get clearNotificationsSuccess => 'Visi pranešimai sėkmingai išvalyti.';

  @override
  String get clearHoroscopeTitle => 'Aiškus horoskopas';

  @override
  String get clearHoroscopeMessage =>
      'Ar tikrai norite išvalyti savo horoskopo duomenis?';

  @override
  String get clearHoroscopeSuccess => 'Horoskopas sėkmingai išvalytas.';

  @override
  String get clearChatTitle => 'Išvalyti pokalbių istoriją';

  @override
  String get clearChatMessage =>
      'Ar tikrai norite ištrinti visą pokalbių istoriją?';

  @override
  String get clearChatLocal => 'Pokalbis išvalytas vietoje.';

  @override
  String get deleteAccountTitle => 'Ištrinti paskyrą';

  @override
  String get deleteAccountMessage =>
      'Ar tikrai norite ištrinti savo paskyrą? Taip pat bus išvalyta visa pokalbių istorija ir pranešimai.';

  @override
  String get deleteAccountSuccess =>
      'Jūsų paskyra ir visi duomenys buvo pašalinti.';

  @override
  String get deleteAccountError => 'Klaida ištrinant paskyrą';

  @override
  String get logoutTitle => 'Atsijungti';

  @override
  String get logoutMessage => 'Ar tikrai norite atsijungti?';

  @override
  String get termsPrivacyTitle => 'Sąlygos ir privatumas';

  @override
  String get privacyPolicyTitle => 'Privatumo politika';

  @override
  String get termsConditionsTitle => 'Sąlygos ir nuostatos';

  @override
  String get dataControlTitle => 'Duomenų kontrolė';

  @override
  String get cancelButton => 'Atšaukti';

  @override
  String get confirmButton => 'Patvirtinti';

  @override
  String get clearQuestionsSuccess => 'Visi klausimai sėkmingai ištrinti.';

  @override
  String get yoginiLabel => 'Joginis';

  @override
  String get lordLabel => 'Viešpats';

  @override
  String get startLabel => 'Pradėti';

  @override
  String get recoverAccount => 'Atkurti paskyrą';

  @override
  String get endLabel => 'Pabaiga';

  @override
  String get startDateLabel => 'Pradžios data';

  @override
  String get endDateLabel => 'Pabaigos data';

  @override
  String get notAvailable => 'Nėra';

  @override
  String get noData => 'Nėra duomenų';

  @override
  String get unknownError => 'Nežinoma klaida';

  @override
  String get retryButton => 'Bandyti dar kartą';

  @override
  String get kundaliGeneratorTitle => 'Kundali generatorius';

  @override
  String get natalChartTitle => 'Gimimo diagrama';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Ascendentinis laipsnis';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Daša';

  @override
  String get yoginiDashaTitle => 'Jogini Daša';

  @override
  String get unknown => 'Nežinoma';

  @override
  String get clearHoroscope => 'Aiškus horoskopas';

  @override
  String get clearNotifications => 'Išvalyti pranešimus';

  @override
  String get clearChatHistory => 'Išvalyti pokalbių istoriją';

  @override
  String get logout => 'Atsijungti';

  @override
  String get deleteAccount => 'Ištrinti paskyrą';

  @override
  String get allFieldsRequired => 'Visi laukai yra privalomi.';

  @override
  String get accountRecoveredSuccess => 'Paskyra sėkmingai atkurta.';

  @override
  String get recoveryFailed =>
      'Atkūrimas nepavyko. Patikrinkite savo informaciją.';

  @override
  String get recoverySecretLabel => 'Atgavimo paslaptis:';

  @override
  String get aboutUsTitle => 'Apie mus';

  @override
  String get aboutOurCompany => 'Apie mūsų įmonę';

  @override
  String get aboutCompanyDescription =>
      'Esame įsipareigoję savo vartotojams teikti geriausią astrologijos patirtį.';

  @override
  String get ourMission => 'Mūsų misija';

  @override
  String get missionDescription =>
      'Teikti tikslias ir suasmenintas astrologijos įžvalgas, kurios padėtų vartotojams priimti pagrįstus sprendimus savo gyvenime.';

  @override
  String get ourVision => 'Mūsų vizija';

  @override
  String get visionDescription =>
      'Tapti patikimiausia astrologijos platforma, apjungiančia technologijas ir senovės išmintį.';

  @override
  String get ourValues => 'Mūsų vertybės';

  @override
  String get valuesDescription =>
      'Sąžiningumas, tikslumas, į vartotoją orientuotas dizainas ir nuolatinis inovacijų diegimas.';

  @override
  String get contactUs => 'Susisiekite su mumis';

  @override
  String get contactEmail => 'El. paštas: support@yourcompany.com';

  @override
  String get contactWebsite => 'Svetainė: www.jūsųįmonė.com';

  @override
  String get customerSupport => 'Klientų aptarnavimas';

  @override
  String get supportHeroTitle => 'Mes pasiruošę padėti';

  @override
  String get supportHeroDescription =>
      'Užpildykite žemiau esančią formą ir mūsų palaikymo komanda su jumis susisieks kaip įmanoma greičiau.';

  @override
  String get yourName => 'Jūsų vardas';

  @override
  String get yourEmail => 'Jūsų el. pašto adresas';

  @override
  String get message => 'Žinutė';

  @override
  String get enterEmail => 'Įveskite savo el. pašto adresą';

  @override
  String get enterValidEmail => 'Įveskite galiojantį el. pašto adresą';

  @override
  String enterField(Object fieldName) {
    return 'Įveskite $fieldName';
  }

  @override
  String get send => 'Siųsti';

  @override
  String get sending => 'Siunčiama...';

  @override
  String get emailSentSuccess => '✅ El. laiškas sėkmingai išsiųstas!';

  @override
  String get emailSendFailed => '❌ Nepavyko išsiųsti el. laiško';

  @override
  String get astroDictionaryTitle => 'Astro žodynas';

  @override
  String get searchTermsHint => 'Paieškos terminai...';

  @override
  String get noTermsFound => 'Nerasta jokių terminų';

  @override
  String get buyQuestionsTitle => 'Pirkimo klausimai';

  @override
  String get userNotAuthenticated => 'Vartotojas neautentifikuotas';

  @override
  String get loadStoreDataFailed => 'Nepavyko įkelti parduotuvės duomenų';

  @override
  String get missingAuthToken => 'Trūksta autentifikavimo rakto';

  @override
  String get merchantDisplayName => 'Astro pokalbių programėlė';

  @override
  String get paymentSuccessful => '✅ Mokėjimas sėkmingas! Klausimas išsiųstas';

  @override
  String paymentFailed(Object error) {
    return '❌ Mokėjimas nepavyko: $error';
  }

  @override
  String get yourBalance => 'Jūsų likutis';

  @override
  String questionsBalance(Object count) {
    return '$count Klausimai';
  }

  @override
  String get availableOffers => 'Galimi pasiūlymai';

  @override
  String questionsCount(Object count) {
    return '$count Klausimas';
  }

  @override
  String get buyButton => 'Pirkti';

  @override
  String get dailyHoroscopeTitle => '🌟 Dienos horoskopas';

  @override
  String get userIdMissing => 'Trūksta naudotojo ID';

  @override
  String get fetchHoroscopesFailed => 'Nepavyko gauti horoskopų';

  @override
  String get noHoroscopeFound => 'Horoskopo nerasta.';

  @override
  String get signLabel => 'Ženklas';

  @override
  String get todayLabel => 'Šiandien';

  @override
  String get yesterdayLabel => 'Vakar';

  @override
  String get thisWeekLabel => 'Šią savaitę';

  @override
  String get lastMonthLabel => 'Praėjusį mėnesį';

  @override
  String get chatTitle => 'Pokalbis';

  @override
  String get typeYourQuestionHint => 'Įveskite savo klausimą...';

  @override
  String get paymentRequired => 'Mokėjimas būtinas';

  @override
  String get paymentRequiredMessage =>
      'Išnaudojote savo nemokamus klausimus. Norėdami tęsti, sumokėkite 50 ₹.';

  @override
  String get payNowButton => 'Mokėti dabar';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Liko $count nemokamų klausimų';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Liko $count mokamų klausimų';
  }

  @override
  String get thankYouFeedback => 'Dėkojame už atsiliepimą!';

  @override
  String get ratingSubmitted => 'Įvertinimas pateiktas!';

  @override
  String get setUserIdFirst => 'Pirmiausia nustatykite savo vartotojo ID';

  @override
  String get failedToFetchPrevious =>
      'Nepavyko gauti ankstesnių klausimų ir atsakymų';

  @override
  String errorOccurred(Object error) {
    return 'Klaida: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profilis';

  @override
  String get drawerDailyHoroscope => 'Dienos horoskopas';

  @override
  String get drawerBuyQuestions => 'Pirkimo klausimai';

  @override
  String get drawerAstroDictionary => 'Astro žodynas';

  @override
  String get drawerSettings => 'Nustatymai';

  @override
  String get drawerCustomerSupport => 'Klientų aptarnavimas';

  @override
  String get drawerAbout => 'Apie';

  @override
  String get drawerProfileSettings => 'Profilio nustatymai';

  @override
  String get demoNotificationTitle => '🔔 Demonstracinis pranešimas';

  @override
  String get demoNotificationBody =>
      'Tai bandomasis pranešimas iš jūsų programėlės!';

  @override
  String get notificationsTitle => 'Pranešimai';

  @override
  String get noNotifications => 'Nėra pranešimų';

  @override
  String get allTab => 'Visi';

  @override
  String get markAllAsRead => 'Pažymėti visus kaip skaitytus';

  @override
  String get notificationMarkedRead => 'Pranešimas pažymėtas kaip perskaitytas';

  @override
  String get failedToLoadNotifications => 'Nepavyko įkelti pranešimų';

  @override
  String get failedToMarkRead => 'Nepavyko pažymėti kaip perskaityto';

  @override
  String get failedToMarkAllRead => 'Nepavyko pažymėti visų kaip perskaitytų';

  @override
  String get socketConnected => 'Lizdas prijungtas';

  @override
  String get socketDisconnected => 'Lizdas atjungtas';

  @override
  String get newNotificationReceived => 'Gautas naujas pranešimas';

  @override
  String get generalCategory => 'Bendra';

  @override
  String get horoscopeCategory => 'Horoskopas';

  @override
  String get chatCategory => 'Pokalbis';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Atnaujinimai';

  @override
  String get howToAskTitle => 'Kaip paklausti';

  @override
  String get noQuestionsAvailable => 'Nėra klausimų';

  @override
  String get failedToLoadQuestions => 'Nepavyko įkelti klausimų';

  @override
  String get pullToRefresh => 'Patraukite, kad atnaujintumėte';

  @override
  String get careerCategory => 'Karjera';

  @override
  String get loveCategory => 'Meilė ir santykiai';

  @override
  String get healthCategory => 'Sveikata';

  @override
  String get financeCategory => 'Finansai';

  @override
  String get familyCategory => 'Šeima';

  @override
  String get educationCategory => 'Švietimas';

  @override
  String get travelCategory => 'Kelionės';

  @override
  String get spiritualCategory => 'Dvasinis';

  @override
  String get profileLoaded => 'Profilis sėkmingai įkeltas';

  @override
  String get imageUploaded => 'Vaizdas sėkmingai įkeltas';

  @override
  String get savedInformationConfirmation => 'Išsaugojau šią informaciją';

  @override
  String get noHistoryAvailable => 'Nėra istorijos';

  @override
  String get missingUserIdError => 'Reikalingas vartotojo ID';

  @override
  String get networkError => 'Tinklo klaida. Bandykite dar kartą.';

  @override
  String get timeoutError => 'Užklausos skirtasis laikas baigėsi';

  @override
  String get genericError => 'Kažkas nutiko ne taip';

  @override
  String get reactionUpdateError => 'Nepavyko atnaujinti reakcijos';

  @override
  String get noSearchResults => 'Nerasta paieškos rezultatų';

  @override
  String get clearSearch => 'Išvalyti paiešką';

  @override
  String get resultsFound => 'Rasta rezultatų';

  @override
  String get recoverySecretHint =>
      'Kopijavimas ir įklijavimas gali neveikti, rašykite rankiniu būdu';

  @override
  String get recoverAccountDescription =>
      'Atlikite šiuos veiksmus, kad atkurtumėte savo paskyrą';

  @override
  String get processingLabel => 'Apdorojama...';

  @override
  String get clearChatSuccess => 'Pokalbis sėkmingai išvalytas';

  @override
  String get notificationsEnabled => 'Pranešimai įjungti';

  @override
  String get notificationsDisabled => 'Pranešimai išjungti';

  @override
  String get securityNotice =>
      'Jūsų duomenys yra saugiai užšifruoti ir saugomi';

  @override
  String get loading => 'Kraunama...';

  @override
  String get selectLanguage => 'Pasirinkite kalbą';

  @override
  String get onboardingGetStartedDesc => 'Pradėkite pasirinkdami kalbą';

  @override
  String get accountRecoveryTitle => '🔐 Paskyros atkūrimo informacija';

  @override
  String get recoveryInstructions =>
      'Saugiai išsaugokite šią informaciją. Jos reikės norint atkurti paskyrą.';

  @override
  String get importantNotice => '⚠️ Svarbu:';

  @override
  String get astrologerProfileTitle => 'Astrologo profilis';

  @override
  String get personalAstrologer => 'Asmeninis astrologas';

  @override
  String get makePersonalAstrologer => 'Sukurkite asmeninį astrologą';

  @override
  String get favoriteDescription =>
      'Jūsų klausimus prioritetu perduos šis astrologas. Jei jis nepasiekiamas, jums padės kitas kvalifikuotas astrologas.';

  @override
  String get educationQualifications => 'Išsilavinimas ir kvalifikacija';

  @override
  String get aboutSection => 'Apie';

  @override
  String get shareProfile => 'Bendrinti profilį';

  @override
  String get loadingAstrologer => 'Kraunama astrologo informacija...';

  @override
  String get failedToLoadAstrologer => 'Nepavyko įkelti astrologo duomenų';

  @override
  String get authenticationRequired =>
      'Reikalingas autentifikavimas. Prisijunkite.';

  @override
  String securityCheckFailed(Object error) {
    return 'Saugos patikra nepavyko: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name dabar yra jūsų asmeninis astrologas';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Pašalino $name iš mėgstamiausių';
  }

  @override
  String get toggleFavoriteError => 'Nepavyko atnaujinti mėgstamiausio būsenos';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Išsilavinimas: $education\n📜 Kvalifikacija: $qualification\n⏳ Patirtis: $experience';
  }

  @override
  String get notProvided => 'Nepateikta';

  @override
  String reviews(Object count) {
    return '($count atsiliepimų)';
  }

  @override
  String get specialties => 'Specialybės';

  @override
  String get experience => 'Patirtis';

  @override
  String get qualification => 'Kvalifikacija';

  @override
  String get education => 'Švietimas';

  @override
  String get recoveryTips =>
      '• Padarykite šios informacijos ekrano kopiją\n• Laikykite ją saugioje vietoje\n• Nesidalinkite su niekuo\n• Tai bus rodoma tik vieną kartą';

  @override
  String get themeSettingsTitle => 'Temos nustatymai';

  @override
  String get lightThemeLabel => 'Šviesa';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tamsu';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
