// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get notificationSettings => 'Postavke obavještenja';

  @override
  String get privacySettings => 'Postavke privatnosti';

  @override
  String get accountSettings => 'Postavke računa';

  @override
  String get languageSettings => 'Postavke jezika';

  @override
  String get languageChanged => 'Jezik je promijenjen';

  @override
  String get existingUserButton => 'Ja sam postojeći korisnik';

  @override
  String get chooseCountryTitle => 'Odaberite državu';

  @override
  String get yesText => 'Da';

  @override
  String get noText => 'Ne';

  @override
  String get appBarTitle => 'Postavke profila';

  @override
  String get userIdLabel => 'ID korisnika *';

  @override
  String get nameLabel => 'Ime';

  @override
  String get birthCountryLabel => 'Zemlja rođenja';

  @override
  String get birthCityLabel => 'Grad rođenja';

  @override
  String get countrySelectionTitle => 'Odaberite svoju zemlju';

  @override
  String get maleLabel => 'Muško';

  @override
  String get femaleLabel => 'Ženski';

  @override
  String get birthDateLabel => 'Datum rođenja';

  @override
  String get birthDatePlaceholder => 'Odaberite datum rođenja';

  @override
  String get birthTimeLabel => 'Vrijeme rođenja';

  @override
  String get birthTimePlaceholder => 'Odaberite vrijeme rođenja';

  @override
  String get saveProfileButton => 'Sačuvaj profil';

  @override
  String get noCitiesFound => 'Nije pronađen nijedan grad';

  @override
  String cityPlaceholder(Object country) {
    return 'Unesite grad u $country';
  }

  @override
  String get countryFirstPlaceholder => 'Prvo odaberite državu';

  @override
  String get versionHistoryTitle => 'Historija verzija';

  @override
  String get notSetText => 'Nije postavljeno';

  @override
  String nameHistory(Object name) {
    return 'Ime: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Grad: $city';
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
    return 'Datum rođenja: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Vrijeme rođenja: $time';
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
    return 'Ljetno vrijeme: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Država: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Ažurirano $date';
  }

  @override
  String get userIdRequired => 'Potreban je korisnički ID';

  @override
  String get profileSaved => 'Profil je uspješno sačuvan';

  @override
  String get saveFailed => 'Nije uspjelo spremanje profila';

  @override
  String get errorPrefix => 'Greška:';

  @override
  String get onboardingChooseLanguage => 'Odaberite svoj jezik';

  @override
  String get onboardingChooseLanguageDesc =>
      'Odaberite željeni jezik za nastavak.';

  @override
  String get onboardingWhatIsAstrology => 'Šta je astrologija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologija je nauka o nebeskim telima...';

  @override
  String get onboardingWhyUseApp => 'Zašto koristiti ovu aplikaciju?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Primajte personalizirane horoskope, dnevne prognoze i smjernice za donošenje informiranih odluka.';

  @override
  String get onboardingHowToUse => 'Kako koristiti ovu aplikaciju?';

  @override
  String get onboardingHowToUseDesc =>
      'Lako se krećite, provjeravajte dnevne horoskope i upravljajte svojim profilom za tačna predviđanja.';

  @override
  String get onboardingGetStarted => 'Započnite';

  @override
  String get onboardingNewUser => 'Novi korisnik';

  @override
  String get onboardingExistingUser => 'Postojeći korisnik';

  @override
  String get onboardingBack => 'Nazad';

  @override
  String get onboardingNext => 'Sljedeće';

  @override
  String get userIdNotFound =>
      'Korisnički ID nije pronađen. Molimo vas da se prijavite ili postavite svoj profil.';

  @override
  String get clearNotificationsTitle => 'Obriši obavještenja';

  @override
  String get clearNotificationsMessage =>
      'Jeste li sigurni da želite obrisati sva obavještenja?';

  @override
  String get clearNotificationsSuccess =>
      'Sva obavještenja su uspješno obrisana.';

  @override
  String get clearHoroscopeTitle => 'Jasni horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Jeste li sigurni da želite obrisati podatke iz svog horoskopa?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop uspješno obrisan.';

  @override
  String get clearChatTitle => 'Obriši historiju razgovora';

  @override
  String get clearChatMessage =>
      'Jeste li sigurni da želite izbrisati svu historiju razgovora?';

  @override
  String get clearChatLocal => 'Chat je lokalno obrisan.';

  @override
  String get deleteAccountTitle => 'Izbriši račun';

  @override
  String get deleteAccountMessage =>
      'Jeste li sigurni da želite izbrisati svoj račun? Ovo će također obrisati svu vašu historiju chata i obavještenja.';

  @override
  String get deleteAccountSuccess => 'Vaš račun i svi podaci su uklonjeni.';

  @override
  String get deleteAccountError => 'Greška prilikom brisanja računa';

  @override
  String get logoutTitle => 'Odjava';

  @override
  String get logoutMessage => 'Jeste li sigurni da se želite odjaviti?';

  @override
  String get termsPrivacyTitle => 'Uslovi i privatnost';

  @override
  String get privacyPolicyTitle => 'Politika privatnosti';

  @override
  String get termsConditionsTitle => 'Uslovi i odredbe';

  @override
  String get dataControlTitle => 'Kontrola podataka';

  @override
  String get cancelButton => 'Otkaži';

  @override
  String get confirmButton => 'Potvrdi';

  @override
  String get clearQuestionsSuccess => 'Sva pitanja su uspješno izbrisana.';

  @override
  String get yoginiLabel => 'Jogini';

  @override
  String get lordLabel => 'Gospodin';

  @override
  String get startLabel => 'Početak';

  @override
  String get recoverAccount => 'Oporavak računa';

  @override
  String get endLabel => 'Kraj';

  @override
  String get startDateLabel => 'Datum početka';

  @override
  String get endDateLabel => 'Datum završetka';

  @override
  String get notAvailable => 'Nije dostupno';

  @override
  String get noData => 'Nema podataka';

  @override
  String get unknownError => 'Nepoznata greška';

  @override
  String get retryButton => 'Pokušaj ponovo';

  @override
  String get kundaliGeneratorTitle => 'Kundali generator';

  @override
  String get natalChartTitle => 'Natalna karta';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Ascendentni stepen';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Jogini Daša';

  @override
  String get unknown => 'Nepoznato';

  @override
  String get clearHoroscope => 'Jasni horoskop';

  @override
  String get clearNotifications => 'Obriši obavještenja';

  @override
  String get clearChatHistory => 'Obriši historiju razgovora';

  @override
  String get logout => 'Odjava';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get allFieldsRequired => 'Sva polja su obavezna.';

  @override
  String get accountRecoveredSuccess => 'Račun uspješno oporavljen.';

  @override
  String get recoveryFailed => 'Oporavak nije uspio. Provjerite svoje podatke.';

  @override
  String get recoverySecretLabel => 'Tajna oporavka:';

  @override
  String get aboutUsTitle => 'O nama';

  @override
  String get aboutOurCompany => 'O našoj kompaniji';

  @override
  String get aboutCompanyDescription =>
      'Posvećeni smo pružanju najboljeg astrološkog iskustva našim korisnicima.';

  @override
  String get ourMission => 'Naša misija';

  @override
  String get missionDescription =>
      'Pružiti tačne i personalizirane astrološke uvide kako bi se korisnicima pomoglo u donošenju informiranih odluka u životu.';

  @override
  String get ourVision => 'Naša vizija';

  @override
  String get visionDescription =>
      'Postati najpouzdanija astrološka platforma, kombinirajući tehnologiju i drevnu mudrost.';

  @override
  String get ourValues => 'Naše vrijednosti';

  @override
  String get valuesDescription =>
      'Integritet, tačnost, dizajn usmjeren na korisnika i kontinuirane inovacije.';

  @override
  String get contactUs => 'Kontaktirajte nas';

  @override
  String get contactEmail => 'E-pošta: support@yourcompany.com';

  @override
  String get contactWebsite => 'Web stranica: www.yourcompany.com';

  @override
  String get customerSupport => 'Podrška korisnicima';

  @override
  String get supportHeroTitle => 'Tu smo da pomognemo';

  @override
  String get supportHeroDescription =>
      'Popunite donji obrazac i naš tim za podršku će vam se javiti u najkraćem mogućem roku.';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get yourEmail => 'Vaša e-pošta';

  @override
  String get message => 'Poruka';

  @override
  String get enterEmail => 'Unesite svoju e-mail adresu';

  @override
  String get enterValidEmail => 'Unesite važeću adresu e-pošte';

  @override
  String enterField(Object fieldName) {
    return 'Unesite $fieldName';
  }

  @override
  String get send => 'Pošalji';

  @override
  String get sending => 'Slanje...';

  @override
  String get emailSentSuccess => '✅ E-mail uspješno poslan!';

  @override
  String get emailSendFailed => '❌ Slanje e-pošte nije uspjelo';

  @override
  String get astroDictionaryTitle => 'Astro rječnik';

  @override
  String get searchTermsHint => 'Pretražite pojmove...';

  @override
  String get noTermsFound => 'Nisu pronađeni pojmovi';

  @override
  String get buyQuestionsTitle => 'Pitanja o kupovini';

  @override
  String get userNotAuthenticated => 'Korisnik nije autentificiran';

  @override
  String get loadStoreDataFailed => 'Učitavanje podataka trgovine nije uspjelo';

  @override
  String get missingAuthToken => 'Nedostaje token za autorizaciju';

  @override
  String get merchantDisplayName => 'Aplikacija za astro chat';

  @override
  String get paymentSuccessful => '✅ Uplata uspješna! Pitanje poslano';

  @override
  String paymentFailed(Object error) {
    return '❌ Plaćanje nije uspjelo: $error';
  }

  @override
  String get yourBalance => 'Vaš saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Pitanja';
  }

  @override
  String get availableOffers => 'Dostupne ponude';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Kupi';

  @override
  String get dailyHoroscopeTitle => '🌟 Dnevni horoskop';

  @override
  String get userIdMissing => 'Nedostaje korisnički ID';

  @override
  String get fetchHoroscopesFailed => 'Nije moguće preuzeti horoskope';

  @override
  String get noHoroscopeFound => 'Nije pronađen horoskop.';

  @override
  String get signLabel => 'Potpis';

  @override
  String get todayLabel => 'Danas';

  @override
  String get yesterdayLabel => 'Jučer';

  @override
  String get thisWeekLabel => 'Ovaj tjedan';

  @override
  String get lastMonthLabel => 'Prošli mjesec';

  @override
  String get chatTitle => 'Čet';

  @override
  String get typeYourQuestionHint => 'Upišite svoje pitanje...';

  @override
  String get paymentRequired => 'Obavezna uplata';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Iskoristili ste svoja besplatna pitanja. Platite $amount da biste nastavili.';
  }

  @override
  String get payNowButton => 'Plati sada';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Preostalo je $count besplatnih pitanja';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Preostalo je $count plaćenih pitanja';
  }

  @override
  String get thankYouFeedback => 'Hvala vam na povratnim informacijama!';

  @override
  String get ratingSubmitted => 'Ocjena poslana!';

  @override
  String get setUserIdFirst => 'Prvo postavite svoj korisnički ID';

  @override
  String get failedToFetchPrevious =>
      'Nije uspjelo dohvatiti prethodna pitanja i odgovore';

  @override
  String errorOccurred(Object error) {
    return 'Greška: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profil';

  @override
  String get drawerDailyHoroscope => 'Dnevni horoskop';

  @override
  String get drawerBuyQuestions => 'Pitanja o kupovini';

  @override
  String get drawerAstroDictionary => 'Astro rječnik';

  @override
  String get drawerSettings => 'Postavke';

  @override
  String get drawerCustomerSupport => 'Podrška korisnicima';

  @override
  String get drawerAbout => 'O nama';

  @override
  String get drawerProfileSettings => 'Postavke profila';

  @override
  String get demoNotificationTitle => '🔔 Obavještenje o demo verziji';

  @override
  String get demoNotificationBody =>
      'Ovo je testna obavijest iz vaše aplikacije!';

  @override
  String get notificationsTitle => 'Obavještenja';

  @override
  String get noNotifications => 'Nema obavještenja';

  @override
  String get allTab => 'Svi';

  @override
  String get markAllAsRead => 'Označi sve kao pročitano';

  @override
  String get notificationMarkedRead => 'Obavještenje označeno kao pročitano';

  @override
  String get failedToLoadNotifications =>
      'Učitavanje obavještenja nije uspjelo';

  @override
  String get failedToMarkRead => 'Označavanje kao pročitano nije uspjelo';

  @override
  String get failedToMarkAllRead =>
      'Označavanje svih kao pročitanih nije uspjelo';

  @override
  String get socketConnected => 'Utičnica povezana';

  @override
  String get socketDisconnected => 'Utičnica isključena';

  @override
  String get newNotificationReceived => 'Primljeno novo obavještenje';

  @override
  String get generalCategory => 'Općenito';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Čet';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get updateCategory => 'Ažuriranja';

  @override
  String get howToAskTitle => 'Kako pitati';

  @override
  String get noQuestionsAvailable => 'Nema dostupnih pitanja';

  @override
  String get failedToLoadQuestions => 'Učitavanje pitanja nije uspjelo';

  @override
  String get pullToRefresh => 'Povucite za osvježavanje';

  @override
  String get careerCategory => 'Karijera';

  @override
  String get loveCategory => 'Ljubav i veze';

  @override
  String get healthCategory => 'Zdravlje';

  @override
  String get financeCategory => 'Finansije';

  @override
  String get familyCategory => 'Porodica';

  @override
  String get educationCategory => 'Obrazovanje';

  @override
  String get travelCategory => 'Putovanja';

  @override
  String get spiritualCategory => 'Duhovno';

  @override
  String get profileLoaded => 'Profil je uspješno učitan';

  @override
  String get imageUploaded => 'Slika je uspješno otpremljena';

  @override
  String get savedInformationConfirmation => 'Sačuvao/la sam ove informacije';

  @override
  String get noHistoryAvailable => 'Nema dostupne historije';

  @override
  String get missingUserIdError => 'Potreban je korisnički ID';

  @override
  String get networkError => 'Greška mreže. Pokušajte ponovo.';

  @override
  String get timeoutError => 'Zahtjev je istekao';

  @override
  String get genericError => 'Nešto je pošlo po zlu';

  @override
  String get reactionUpdateError => 'Ažuriranje reakcije nije uspjelo';

  @override
  String get noSearchResults => 'Nisu pronađeni rezultati pretrage';

  @override
  String get clearSearch => 'Obriši pretragu';

  @override
  String get resultsFound => 'Pronađeni rezultati';

  @override
  String get recoverySecretHint =>
      'Kopiranje i lijepljenje možda neće raditi, kucajte ručno';

  @override
  String get recoverAccountDescription =>
      'Slijedite ove korake da biste oporavili svoj račun';

  @override
  String get processingLabel => 'Obrada...';

  @override
  String get clearChatSuccess => 'Chat je uspješno obrisan';

  @override
  String get notificationsEnabled => 'Obavještenja su omogućena';

  @override
  String get notificationsDisabled => 'Obavještenja su onemogućena';

  @override
  String get securityNotice => 'Vaši podaci su sigurno šifrirani i pohranjeni';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get selectLanguage => 'Odaberite jezik';

  @override
  String get onboardingGetStartedDesc => 'Započnite odabirom jezika';

  @override
  String get accountRecoveryTitle => '🔐 Detalji za oporavak računa';

  @override
  String get recoveryInstructions =>
      'Molimo vas da ove informacije sačuvate na sigurnom mjestu. Trebat će vam za oporavak računa.';

  @override
  String get importantNotice => '⚠️ Važno:';

  @override
  String get astrologerProfileTitle => 'Profil astrologa';

  @override
  String get personalAstrologer => 'Lični astrolog';

  @override
  String get makePersonalAstrologer => 'Postanite lični astrolog';

  @override
  String get favoriteDescription =>
      'Vaša pitanja će biti prioritetno proslijeđena ovom astrologu. Ukoliko nije dostupan, pomoći će vam drugi kvalifikovani astrolog.';

  @override
  String get educationQualifications => 'Obrazovanje i kvalifikacije';

  @override
  String get aboutSection => 'O nama';

  @override
  String get shareProfile => 'Podijeli profil';

  @override
  String get loadingAstrologer => 'Učitavanje detalja o astrologu...';

  @override
  String get failedToLoadAstrologer =>
      'Učitavanje podataka o astrologu nije uspjelo';

  @override
  String get authenticationRequired =>
      'Potrebna je autentifikacija. Molimo vas da se prijavite.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sigurnosna provjera nije uspjela: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name je sada vaš lični astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Uklonjeno $name iz favorita';
  }

  @override
  String get toggleFavoriteError => 'Nije uspjelo ažuriranje statusa favorita';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Obrazovanje: $education\n📜 Kvalifikacija: $qualification\n⏳ Iskustvo: $experience';
  }

  @override
  String get notProvided => 'Nije navedeno';

  @override
  String reviews(Object count) {
    return '($count recenzija)';
  }

  @override
  String get specialties => 'Specijalnosti';

  @override
  String get experience => 'Iskustvo';

  @override
  String get qualification => 'Kvalifikacija';

  @override
  String get education => 'Obrazovanje';

  @override
  String get recoveryTips =>
      '• Napravite snimak ekrana ovih informacija\n• Čuvajte ih na sigurnom mjestu\n• Ne dijelite ni sa kim\n• Ovo će biti prikazano samo jednom';

  @override
  String get themeSettingsTitle => 'Postavke teme';

  @override
  String get lightThemeLabel => 'Svjetlo';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tamno';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Sistem';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
