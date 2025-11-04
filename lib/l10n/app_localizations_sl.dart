// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get settingsTitle => 'Nastavitve';

  @override
  String get notificationSettings => 'Nastavitve obvestil';

  @override
  String get privacySettings => 'Nastavitve zasebnosti';

  @override
  String get accountSettings => 'Nastavitve računa';

  @override
  String get languageSettings => 'Jezikovne nastavitve';

  @override
  String get languageChanged => 'Jezik spremenjen';

  @override
  String get existingUserButton => 'Sem obstoječi uporabnik';

  @override
  String get chooseCountryTitle => 'Izberite državo';

  @override
  String get yesText => 'Da';

  @override
  String get noText => 'Ne';

  @override
  String get appBarTitle => 'Nastavitve profila';

  @override
  String get userIdLabel => 'ID uporabnika *';

  @override
  String get nameLabel => 'Ime';

  @override
  String get birthCountryLabel => 'Država rojstva';

  @override
  String get birthCityLabel => 'Rojstno mesto';

  @override
  String get countrySelectionTitle => 'Izberite svojo državo';

  @override
  String get maleLabel => 'Moški';

  @override
  String get femaleLabel => 'Ženska';

  @override
  String get birthDateLabel => 'Datum rojstva';

  @override
  String get birthDatePlaceholder => 'Izberite datum rojstva';

  @override
  String get birthTimeLabel => 'Čas rojstva';

  @override
  String get birthTimePlaceholder => 'Izberite čas rojstva';

  @override
  String get saveProfileButton => 'Shrani profil';

  @override
  String get noCitiesFound => 'Ni najdenih mest';

  @override
  String cityPlaceholder(Object country) {
    return 'Vnesite mesto v $country';
  }

  @override
  String get countryFirstPlaceholder => 'Najprej izberite državo';

  @override
  String get versionHistoryTitle => 'Zgodovina različic';

  @override
  String get notSetText => 'Ni nastavljeno';

  @override
  String nameHistory(Object name) {
    return 'Ime: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Mesto: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Država: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Spol: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Datum rojstva: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Čas rojstva: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokacija: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Poletni čas: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Zvezna država: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Posodobljeno dne $date';
  }

  @override
  String get userIdRequired => 'Zahtevan je uporabniški ID';

  @override
  String get profileSaved => 'Profil je bil uspešno shranjen';

  @override
  String get saveFailed => 'Shranjevanje profila ni uspelo';

  @override
  String get errorPrefix => 'Napaka:';

  @override
  String get onboardingChooseLanguage => 'Izberite svoj jezik';

  @override
  String get onboardingChooseLanguageDesc =>
      'Za nadaljevanje izberite želeni jezik.';

  @override
  String get onboardingWhatIsAstrology => 'Kaj je astrologija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologija je veda o nebesnih telesih ...';

  @override
  String get onboardingWhyUseApp => 'Zakaj uporabljati to aplikacijo?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Pridobite personalizirane horoskope, dnevne napovedi in smernice za sprejemanje premišljenih odločitev.';

  @override
  String get onboardingHowToUse => 'Kako uporabljati to aplikacijo?';

  @override
  String get onboardingHowToUseDesc =>
      'Preprosto krmarite, preverjajte dnevne horoskope in upravljajte svoj profil za natančne napovedi.';

  @override
  String get onboardingGetStarted => 'Začnite';

  @override
  String get onboardingNewUser => 'Nov uporabnik';

  @override
  String get onboardingExistingUser => 'Obstoječi uporabnik';

  @override
  String get onboardingBack => 'Nazaj';

  @override
  String get onboardingNext => 'Naprej';

  @override
  String get userIdNotFound =>
      'Uporabniškega ID-ja ni bilo mogoče najti. Prosimo, prijavite se ali nastavite svoj profil.';

  @override
  String get clearNotificationsTitle => 'Počisti obvestila';

  @override
  String get clearNotificationsMessage =>
      'Ali ste prepričani, da želite počistiti vsa obvestila?';

  @override
  String get clearNotificationsSuccess =>
      'Vsa obvestila so bila uspešno izbrisana.';

  @override
  String get clearHoroscopeTitle => 'Počisti horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Ali ste prepričani, da želite izbrisati podatke svojega horoskopa?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop je bil uspešno izbrisan.';

  @override
  String get clearChatTitle => 'Počisti zgodovino klepeta';

  @override
  String get clearChatMessage =>
      'Ali ste prepričani, da želite izbrisati vso zgodovino klepeta?';

  @override
  String get clearChatLocal => 'Klepet je bil lokalno izbrisan.';

  @override
  String get deleteAccountTitle => 'Izbriši račun';

  @override
  String get deleteAccountMessage =>
      'Ali ste prepričani, da želite izbrisati svoj račun? S tem boste izbrisali tudi vso zgodovino klepetov in obvestila.';

  @override
  String get deleteAccountSuccess =>
      'Vaš račun in vsi podatki so bili odstranjeni.';

  @override
  String get deleteAccountError => 'Napaka pri brisanju računa';

  @override
  String get logoutTitle => 'Odjava';

  @override
  String get logoutMessage => 'Ste prepričani, da se želite odjaviti?';

  @override
  String get termsPrivacyTitle => 'Pogoji in zasebnost';

  @override
  String get privacyPolicyTitle => 'Pravilnik o zasebnosti';

  @override
  String get termsConditionsTitle => 'Pogoji poslovanja';

  @override
  String get dataControlTitle => 'Nadzor podatkov';

  @override
  String get cancelButton => 'Prekliči';

  @override
  String get confirmButton => 'Potrdi';

  @override
  String get clearQuestionsSuccess =>
      'Vsa vprašanja so bila uspešno izbrisana.';

  @override
  String get yoginiLabel => 'Jogini';

  @override
  String get lordLabel => 'Gospod';

  @override
  String get startLabel => 'Začni';

  @override
  String get recoverAccount => 'Obnovi račun';

  @override
  String get endLabel => 'Konec';

  @override
  String get startDateLabel => 'Začetni datum';

  @override
  String get endDateLabel => 'Končni datum';

  @override
  String get notAvailable => 'Ni na voljo';

  @override
  String get noData => 'Ni podatkov';

  @override
  String get unknownError => 'Neznana napaka';

  @override
  String get retryButton => 'Poskusi znova';

  @override
  String get kundaliGeneratorTitle => 'Kundali generator';

  @override
  String get natalChartTitle => 'Natalna karta';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Stopnja ascendenta';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Jogini Daša';

  @override
  String get unknown => 'Neznano';

  @override
  String get clearHoroscope => 'Počisti horoskop';

  @override
  String get clearNotifications => 'Počisti obvestila';

  @override
  String get clearChatHistory => 'Počisti zgodovino klepeta';

  @override
  String get logout => 'Odjava';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get allFieldsRequired => 'Vsa polja so obvezna.';

  @override
  String get accountRecoveredSuccess => 'Račun je bil uspešno obnovljen.';

  @override
  String get recoveryFailed => 'Obnovitev ni uspela. Preverite svoje podatke.';

  @override
  String get recoverySecretLabel => 'Skrivnost okrevanja:';

  @override
  String get aboutUsTitle => 'O nas';

  @override
  String get aboutOurCompany => 'O našem podjetju';

  @override
  String get aboutCompanyDescription =>
      'Zavezani smo k temu, da našim uporabnikom zagotovimo najboljšo astrološko izkušnjo.';

  @override
  String get ourMission => 'Naše poslanstvo';

  @override
  String get missionDescription =>
      'Zagotavljati natančne in prilagojene astrološke vpoglede, ki bodo uporabnikom pomagali pri sprejemanju premišljenih odločitev v njihovem življenju.';

  @override
  String get ourVision => 'Naša vizija';

  @override
  String get visionDescription =>
      'Postati najbolj zaupanja vredna astrološka platforma, ki združuje tehnologijo in starodavno modrost.';

  @override
  String get ourValues => 'Naše vrednote';

  @override
  String get valuesDescription =>
      'Integriteta, natančnost, uporabniku prijazna zasnova in nenehne inovacije.';

  @override
  String get contactUs => 'Kontaktirajte nas';

  @override
  String get contactEmail => 'E-pošta: support@yourcompany.com';

  @override
  String get contactWebsite => 'Spletna stran: www.yourcompany.com';

  @override
  String get customerSupport => 'Podpora strankam';

  @override
  String get supportHeroTitle => 'Tukaj smo, da vam pomagamo';

  @override
  String get supportHeroDescription =>
      'Izpolnite spodnji obrazec in naša ekipa za podporo vam bo odgovorila v najkrajšem možnem času.';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get yourEmail => 'Vaš e-poštni naslov';

  @override
  String get message => 'Sporočilo';

  @override
  String get enterEmail => 'Vnesite svoj e-poštni naslov';

  @override
  String get enterValidEmail => 'Vnesite veljaven e-poštni naslov';

  @override
  String enterField(Object fieldName) {
    return 'Vnesite $fieldName';
  }

  @override
  String get send => 'Pošlji';

  @override
  String get sending => 'Pošiljanje ...';

  @override
  String get emailSentSuccess => '✅ E-pošta je bila uspešno poslana!';

  @override
  String get emailSendFailed => '❌ Pošiljanje e-pošte ni uspelo';

  @override
  String get astroDictionaryTitle => 'Astro slovar';

  @override
  String get searchTermsHint => 'Iskalni izrazi ...';

  @override
  String get noTermsFound => 'Ni najdenih izrazov';

  @override
  String get buyQuestionsTitle => 'Vprašanja o nakupu';

  @override
  String get userNotAuthenticated => 'Uporabnik ni bil overjen';

  @override
  String get loadStoreDataFailed => 'Nalaganje podatkov trgovine ni uspelo';

  @override
  String get missingAuthToken => 'Manjka žeton za avtorizacijo';

  @override
  String get merchantDisplayName => 'Aplikacija za astro klepet';

  @override
  String get paymentSuccessful => '✅ Plačilo uspešno! Vprašanje poslano';

  @override
  String paymentFailed(Object error) {
    return '❌ Plačilo ni uspelo: $error';
  }

  @override
  String get yourBalance => 'Vaše stanje';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Razpoložljive ponudbe';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Kupi';

  @override
  String get dailyHoroscopeTitle => '🌟 Dnevni horoskop';

  @override
  String get userIdMissing => 'Manjka uporabniški ID';

  @override
  String get fetchHoroscopesFailed => 'Horoskopov ni bilo mogoče pridobiti';

  @override
  String get noHoroscopeFound => 'Horoskopa ni bilo mogoče najti.';

  @override
  String get signLabel => 'Podpis';

  @override
  String get todayLabel => 'Danes';

  @override
  String get yesterdayLabel => 'Včeraj';

  @override
  String get thisWeekLabel => 'Ta teden';

  @override
  String get lastMonthLabel => 'Prejšnji mesec';

  @override
  String get chatTitle => 'Klepet';

  @override
  String get typeYourQuestionHint => 'Vpišite svoje vprašanje ...';

  @override
  String get paymentRequired => 'Zahtevano plačilo';

  @override
  String get paymentRequiredMessage =>
      'Brezplačna vprašanja ste že uporabili. Za nadaljevanje plačajte 50 ₹.';

  @override
  String get payNowButton => 'Plačaj zdaj';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Preostalo je $count brezplačnih vprašanj';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Preostalih $count plačanih vprašanj';
  }

  @override
  String get thankYouFeedback => 'Hvala za vaše povratne informacije!';

  @override
  String get ratingSubmitted => 'Ocena poslana!';

  @override
  String get setUserIdFirst => 'Najprej nastavite svoj uporabniški ID';

  @override
  String get failedToFetchPrevious =>
      'Prejšnjih vprašanj in odgovorov ni bilo mogoče pridobiti';

  @override
  String errorOccurred(Object error) {
    return 'Napaka: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profil';

  @override
  String get drawerDailyHoroscope => 'Dnevni horoskop';

  @override
  String get drawerBuyQuestions => 'Vprašanja o nakupu';

  @override
  String get drawerAstroDictionary => 'Astro slovar';

  @override
  String get drawerSettings => 'Nastavitve';

  @override
  String get drawerCustomerSupport => 'Podpora strankam';

  @override
  String get drawerAbout => 'O nas';

  @override
  String get drawerProfileSettings => 'Nastavitve profila';

  @override
  String get demoNotificationTitle => '🔔 Obvestilo o predstavitvi';

  @override
  String get demoNotificationBody =>
      'To je testno obvestilo iz vaše aplikacije!';

  @override
  String get notificationsTitle => 'Obvestila';

  @override
  String get noNotifications => 'Brez obvestil';

  @override
  String get allTab => 'Vse';

  @override
  String get markAllAsRead => 'Označi vse kot prebrano';

  @override
  String get notificationMarkedRead => 'Obvestilo označeno kot prebrano';

  @override
  String get failedToLoadNotifications => 'Nalaganje obvestil ni uspelo';

  @override
  String get failedToMarkRead => 'Označevanje kot prebrano ni uspelo';

  @override
  String get failedToMarkAllRead => 'Označevanje vseh kot prebranih ni uspelo';

  @override
  String get socketConnected => 'Vtičnica priključena';

  @override
  String get socketDisconnected => 'Vtičnica odklopljena';

  @override
  String get newNotificationReceived => 'Prejeto novo obvestilo';

  @override
  String get generalCategory => 'Splošno';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Klepet';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Posodobitve';

  @override
  String get howToAskTitle => 'Kako vprašati';

  @override
  String get noQuestionsAvailable => 'Ni razpoložljivih vprašanj';

  @override
  String get failedToLoadQuestions => 'Vprašanj ni bilo mogoče naložiti';

  @override
  String get pullToRefresh => 'Povlecite za osvežitev';

  @override
  String get careerCategory => 'Kariera';

  @override
  String get loveCategory => 'Ljubezen in odnosi';

  @override
  String get healthCategory => 'Zdravje';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Družina';

  @override
  String get educationCategory => 'Izobraževanje';

  @override
  String get travelCategory => 'Potovanja';

  @override
  String get spiritualCategory => 'Duhovno';

  @override
  String get profileLoaded => 'Profil je bil uspešno naložen';

  @override
  String get imageUploaded => 'Slika je bila uspešno naložena';

  @override
  String get savedInformationConfirmation => 'Te informacije sem shranil/a';

  @override
  String get noHistoryAvailable => 'Zgodovina ni na voljo';

  @override
  String get missingUserIdError => 'Zahtevan je uporabniški ID';

  @override
  String get networkError => 'Napaka omrežja. Poskusite znova.';

  @override
  String get timeoutError => 'Zahteva je potekla';

  @override
  String get genericError => 'Nekaj je šlo narobe';

  @override
  String get reactionUpdateError => 'Posodobitev odziva ni uspela';

  @override
  String get noSearchResults => 'Ni najdenih rezultatov iskanja';

  @override
  String get clearSearch => 'Počisti iskanje';

  @override
  String get resultsFound => 'Najdeni rezultati';

  @override
  String get recoverySecretHint =>
      'Kopiranje in lepljenje morda ne bo delovalo, vnesite ročno';

  @override
  String get recoverAccountDescription =>
      'Za obnovitev računa sledite tem korakom';

  @override
  String get processingLabel => 'Obdelava ...';

  @override
  String get clearChatSuccess => 'Klepet je bil uspešno počiščen';

  @override
  String get notificationsEnabled => 'Obvestila omogočena';

  @override
  String get notificationsDisabled => 'Obvestila so onemogočena';

  @override
  String get securityNotice => 'Vaši podatki so varno šifrirani in shranjeni';

  @override
  String get loading => 'Nalaganje ...';

  @override
  String get selectLanguage => 'Izberite jezik';

  @override
  String get onboardingGetStartedDesc => 'Začnite z izbiro jezika';

  @override
  String get accountRecoveryTitle => '🔐 Podrobnosti o obnovitvi računa';

  @override
  String get recoveryInstructions =>
      'Prosimo, shranite te podatke varno. Potrebovali jih boste za obnovitev računa.';

  @override
  String get importantNotice => '⚠️ Pomembno:';

  @override
  String get astrologerProfileTitle => 'Profil astrologa';

  @override
  String get personalAstrologer => 'Osebni astrolog';

  @override
  String get makePersonalAstrologer => 'Postanite osebni astrolog';

  @override
  String get favoriteDescription =>
      'Vaša vprašanja bodo prednostno obravnavana pri tem astrologu. Če astrolog ni na voljo, vam bo pomagal drug usposobljen astrolog.';

  @override
  String get educationQualifications => 'Izobrazba in kvalifikacije';

  @override
  String get aboutSection => 'O nas';

  @override
  String get shareProfile => 'Deli profil';

  @override
  String get loadingAstrologer => 'Nalaganje podatkov o astrologu ...';

  @override
  String get failedToLoadAstrologer =>
      'Nalaganje podatkov o astrologu ni uspelo';

  @override
  String get authenticationRequired =>
      'Zahtevana je avtentikacija. Prosimo, prijavite se.';

  @override
  String securityCheckFailed(Object error) {
    return 'Varnostno preverjanje ni uspelo: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name je zdaj vaš osebni astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Odstranjeno $name iz priljubljenih';
  }

  @override
  String get toggleFavoriteError =>
      'Stanja priljubljenih ni bilo mogoče posodobiti';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Izobrazba: $education\n📜 Kvalifikacije: $qualification\n⏳ Izkušnje: $experience';
  }

  @override
  String get notProvided => 'Ni navedeno';

  @override
  String reviews(Object count) {
    return '($count mnenj)';
  }

  @override
  String get specialties => 'Specialitete';

  @override
  String get experience => 'Izkušnje';

  @override
  String get qualification => 'Kvalifikacija';

  @override
  String get education => 'Izobraževanje';

  @override
  String get recoveryTips =>
      '• Naredite posnetek zaslona teh podatkov\n• Shranite ga na varno mesto\n• Ne delite z nikomer\n• To bo prikazano samo enkrat';
}
