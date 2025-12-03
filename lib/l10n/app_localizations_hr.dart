// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get notificationSettings => 'Postavke obavijesti';

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
  String get maleLabel => 'Muški';

  @override
  String get femaleLabel => 'Žena';

  @override
  String get birthDateLabel => 'Datum rođenja';

  @override
  String get birthDatePlaceholder => 'Odaberite datum rođenja';

  @override
  String get birthTimeLabel => 'Vrijeme rođenja';

  @override
  String get birthTimePlaceholder => 'Odaberite vrijeme rođenja';

  @override
  String get saveProfileButton => 'Spremi profil';

  @override
  String get noCitiesFound => 'Nije pronađen nijedan grad';

  @override
  String cityPlaceholder(Object country) {
    return 'Unesite grad u $country';
  }

  @override
  String get countryFirstPlaceholder => 'Prvo odaberite državu';

  @override
  String get versionHistoryTitle => 'Povijest verzija';

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
    return 'Vremenska zona: GMT$offset';
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
  String get profileSaved => 'Profil uspješno spremljen';

  @override
  String get saveFailed => 'Spremanje profila nije uspjelo';

  @override
  String get errorPrefix => 'Pogreška:';

  @override
  String get onboardingChooseLanguage => 'Odaberite svoj jezik';

  @override
  String get onboardingChooseLanguageDesc =>
      'Odaberite željeni jezik za nastavak.';

  @override
  String get onboardingWhatIsAstrology => 'Što je astrologija?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologija je proučavanje nebeskih tijela...';

  @override
  String get onboardingWhyUseApp => 'Zašto koristiti ovu aplikaciju?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Primajte personalizirane horoskope, dnevna predviđanja i smjernice za donošenje informiranih odluka.';

  @override
  String get onboardingHowToUse => 'Kako koristiti ovu aplikaciju?';

  @override
  String get onboardingHowToUseDesc =>
      'Jednostavno se snalazite, provjeravajte dnevne horoskope i upravljajte svojim profilom za točna predviđanja.';

  @override
  String get onboardingGetStarted => 'Započnite';

  @override
  String get onboardingNewUser => 'Novi korisnik';

  @override
  String get onboardingExistingUser => 'Postojeći korisnik';

  @override
  String get onboardingBack => 'Nazad';

  @override
  String get onboardingNext => 'Sljedeći';

  @override
  String get userIdNotFound =>
      'Korisnički ID nije pronađen. Molimo prijavite se ili postavite svoj profil.';

  @override
  String get clearNotificationsTitle => 'Obriši obavijesti';

  @override
  String get clearNotificationsMessage =>
      'Jeste li sigurni da želite izbrisati sve obavijesti?';

  @override
  String get clearNotificationsSuccess =>
      'Sve obavijesti su uspješno izbrisane.';

  @override
  String get clearHoroscopeTitle => 'Jasni horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Jeste li sigurni da želite izbrisati podatke svog horoskopa?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop uspješno obrisan.';

  @override
  String get clearChatTitle => 'Obriši povijest razgovora';

  @override
  String get clearChatMessage =>
      'Jeste li sigurni da želite izbrisati svu povijest razgovora?';

  @override
  String get clearChatLocal => 'Chat je lokalno obrisan.';

  @override
  String get deleteAccountTitle => 'Izbriši račun';

  @override
  String get deleteAccountMessage =>
      'Jeste li sigurni da želite izbrisati svoj račun? Time će se također izbrisati sva vaša povijest chata i obavijesti.';

  @override
  String get deleteAccountSuccess => 'Vaš račun i svi podaci su uklonjeni.';

  @override
  String get deleteAccountError => 'Pogreška pri brisanju računa';

  @override
  String get logoutTitle => 'Odjava';

  @override
  String get logoutMessage => 'Jeste li sigurni da se želite odjaviti?';

  @override
  String get termsPrivacyTitle => 'Uvjeti i privatnost';

  @override
  String get privacyPolicyTitle => 'Pravila o privatnosti';

  @override
  String get termsConditionsTitle => 'Uvjeti i odredbe';

  @override
  String get dataControlTitle => 'Kontrola podataka';

  @override
  String get cancelButton => 'Otkazati';

  @override
  String get confirmButton => 'Potvrdi';

  @override
  String get clearQuestionsSuccess => 'Sva pitanja su uspješno izbrisana.';

  @override
  String get yoginiLabel => 'Jogini';

  @override
  String get lordLabel => 'Gospodar';

  @override
  String get startLabel => 'Start';

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
  String get unknownError => 'Nepoznata pogreška';

  @override
  String get retryButton => 'Pokušaj ponovno';

  @override
  String get kundaliGeneratorTitle => 'Kundali generator';

  @override
  String get natalChartTitle => 'Natalna karta';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Ascendentni stupanj';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Jogini Daša';

  @override
  String get unknown => 'Nepoznato';

  @override
  String get clearHoroscope => 'Jasni horoskop';

  @override
  String get clearNotifications => 'Obriši obavijesti';

  @override
  String get clearChatHistory => 'Obriši povijest razgovora';

  @override
  String get logout => 'Odjava';

  @override
  String get deleteAccount => 'Izbriši račun';

  @override
  String get allFieldsRequired => 'Sva polja su obavezna.';

  @override
  String get accountRecoveredSuccess => 'Račun je uspješno oporavljen.';

  @override
  String get recoveryFailed => 'Oporavak nije uspio. Provjerite svoje podatke.';

  @override
  String get recoverySecretLabel => 'Tajna oporavka:';

  @override
  String get aboutUsTitle => 'O nama';

  @override
  String get aboutOurCompany => 'O našoj tvrtki';

  @override
  String get aboutCompanyDescription =>
      'Posvećeni smo pružanju najboljeg astrološkog iskustva našim korisnicima.';

  @override
  String get ourMission => 'Naša misija';

  @override
  String get missionDescription =>
      'Pružiti točne i personalizirane astrološke uvide kako bi se korisnicima pomoglo u donošenju informiranih odluka u životu.';

  @override
  String get ourVision => 'Naša vizija';

  @override
  String get visionDescription =>
      'Postati najpouzdanija astrološka platforma, kombinirajući tehnologiju i drevnu mudrost.';

  @override
  String get ourValues => 'Naše vrijednosti';

  @override
  String get valuesDescription =>
      'Integritet, točnost, dizajn usmjeren na korisnika i kontinuirana inovacija.';

  @override
  String get contactUs => 'Kontaktirajte nas';

  @override
  String get contactEmail => 'E-pošta: support@yourcompany.com';

  @override
  String get contactWebsite => 'Web stranica: www.yourcompany.com';

  @override
  String get customerSupport => 'Korisnička podrška';

  @override
  String get supportHeroTitle => 'Tu smo da pomognemo';

  @override
  String get supportHeroDescription =>
      'Ispunite donji obrazac i naš tim za podršku će vam se javiti u najkraćem mogućem roku.';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get yourEmail => 'Vaša e-pošta';

  @override
  String get message => 'Poruka';

  @override
  String get enterEmail => 'Unesite svoju e-poštu';

  @override
  String get enterValidEmail => 'Unesite važeću adresu e-pošte';

  @override
  String enterField(Object fieldName) {
    return 'Unesite $fieldName';
  }

  @override
  String get send => 'Poslati';

  @override
  String get sending => 'Slanje...';

  @override
  String get emailSentSuccess => '✅ E-pošta uspješno poslana!';

  @override
  String get emailSendFailed => '❌ Slanje e-pošte nije uspjelo';

  @override
  String get astroDictionaryTitle => 'Astro rječnik';

  @override
  String get searchTermsHint => 'Pojmovi za pretraživanje...';

  @override
  String get noTermsFound => 'Nisu pronađeni pojmovi';

  @override
  String get buyQuestionsTitle => 'Pitanja o kupnji';

  @override
  String get userNotAuthenticated => 'Korisnik nije autentificiran';

  @override
  String get loadStoreDataFailed => 'Nije uspjelo učitavanje podataka trgovine';

  @override
  String get missingAuthToken => 'Nedostaje token za autorizaciju';

  @override
  String get merchantDisplayName => 'Aplikacija za astro chat';

  @override
  String get paymentSuccessful => '✅ Plaćanje uspješno! Pitanje poslano';

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
    return '$count Pitanje';
  }

  @override
  String get buyButton => 'Kupiti';

  @override
  String get dailyHoroscopeTitle => '🌟 Dnevni horoskop';

  @override
  String get userIdMissing => 'Nedostaje korisnički ID';

  @override
  String get fetchHoroscopesFailed => 'Nije uspjelo dohvaćanje horoskopa';

  @override
  String get noHoroscopeFound => 'Nije pronađen horoskop.';

  @override
  String get signLabel => 'Znak';

  @override
  String get todayLabel => 'Danas';

  @override
  String get yesterdayLabel => 'Jučer';

  @override
  String get thisWeekLabel => 'Ovaj tjedan';

  @override
  String get lastMonthLabel => 'Prošli mjesec';

  @override
  String get chatTitle => 'Razgovor';

  @override
  String get typeYourQuestionHint => 'Upišite svoje pitanje...';

  @override
  String get paymentRequired => 'Potrebno plaćanje';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Iskoristili ste svoja besplatna pitanja. Platite $amount za nastavak.';
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
      'Nije uspjelo dohvaćanje prethodnih pitanja i odgovora';

  @override
  String errorOccurred(Object error) {
    return 'Pogreška: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profil';

  @override
  String get drawerDailyHoroscope => 'Dnevni horoskop';

  @override
  String get drawerBuyQuestions => 'Pitanja o kupnji';

  @override
  String get drawerAstroDictionary => 'Astro rječnik';

  @override
  String get drawerSettings => 'Postavke';

  @override
  String get drawerCustomerSupport => 'Korisnička podrška';

  @override
  String get drawerAbout => 'Oko';

  @override
  String get drawerProfileSettings => 'Postavke profila';

  @override
  String get demoNotificationTitle => '🔔 Obavijest o demo verziji';

  @override
  String get demoNotificationBody =>
      'Ovo je testna obavijest iz vaše aplikacije!';

  @override
  String get notificationsTitle => 'Obavijesti';

  @override
  String get noNotifications => 'Nema obavijesti';

  @override
  String get allTab => 'Sve';

  @override
  String get markAllAsRead => 'Označi sve kao pročitano';

  @override
  String get notificationMarkedRead => 'Obavijest označena kao pročitana';

  @override
  String get failedToLoadNotifications => 'Učitavanje obavijesti nije uspjelo';

  @override
  String get failedToMarkRead => 'Označavanje kao pročitano nije uspjelo';

  @override
  String get failedToMarkAllRead =>
      'Označavanje svih kao pročitanih nije uspjelo';

  @override
  String get socketConnected => 'Utičnica spojena';

  @override
  String get socketDisconnected => 'Utičnica isključena';

  @override
  String get newNotificationReceived => 'Primljena nova obavijest';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Razgovor';

  @override
  String get systemCategory => 'Sustav';

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
  String get financeCategory => 'Financije';

  @override
  String get familyCategory => 'Obitelj';

  @override
  String get educationCategory => 'Obrazovanje';

  @override
  String get travelCategory => 'Putovati';

  @override
  String get spiritualCategory => 'Duhovni';

  @override
  String get profileLoaded => 'Profil je uspješno učitan';

  @override
  String get imageUploaded => 'Slika je uspješno prenesena';

  @override
  String get savedInformationConfirmation => 'Spremio/la sam ove informacije';

  @override
  String get noHistoryAvailable => 'Nema dostupne povijesti';

  @override
  String get missingUserIdError => 'Potreban je korisnički ID';

  @override
  String get networkError => 'Mrežna pogreška. Pokušajte ponovno.';

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
      'Kopiranje i lijepljenje možda neće raditi, upišite ručno';

  @override
  String get recoverAccountDescription =>
      'Slijedite ove korake za oporavak računa';

  @override
  String get processingLabel => 'Obrada...';

  @override
  String get clearChatSuccess => 'Chat je uspješno obrisan';

  @override
  String get notificationsEnabled => 'Obavijesti omogućene';

  @override
  String get notificationsDisabled => 'Obavijesti onemogućene';

  @override
  String get securityNotice => 'Vaši podaci su sigurno šifrirani i pohranjeni';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get selectLanguage => 'Odaberite jezik';

  @override
  String get onboardingGetStartedDesc => 'Započnite odabirom jezika';

  @override
  String get accountRecoveryTitle => '🔐 Detalji oporavka računa';

  @override
  String get recoveryInstructions =>
      'Molimo vas da ove podatke sigurno spremite. Trebat će vam za oporavak računa.';

  @override
  String get importantNotice => '⚠️ Važno:';

  @override
  String get astrologerProfileTitle => 'Profil astrologa';

  @override
  String get personalAstrologer => 'Osobni astrolog';

  @override
  String get makePersonalAstrologer => 'Postanite osobni astrolog';

  @override
  String get favoriteDescription =>
      'Vaša će pitanja biti prioritetno dodijeljena ovom astrologu. Ako nije dostupan, pomoći će vam drugi kvalificirani astrolog.';

  @override
  String get educationQualifications => 'Obrazovanje i kvalifikacije';

  @override
  String get aboutSection => 'Oko';

  @override
  String get shareProfile => 'Podijeli profil';

  @override
  String get loadingAstrologer => 'Učitavanje podataka o astrologu...';

  @override
  String get failedToLoadAstrologer =>
      'Nije uspjelo učitavanje podataka o astrologu';

  @override
  String get authenticationRequired =>
      'Potrebna je autentifikacija. Molimo prijavite se.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sigurnosna provjera nije uspjela: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name je sada vaš osobni astrolog';
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
    return '$name\n🎓 Obrazovanje: $education\n📜 Kvalifikacije: $qualification\n⏳ Iskustvo: $experience';
  }

  @override
  String get notProvided => 'Nije navedeno';

  @override
  String reviews(Object count) {
    return '($count recenzija)';
  }

  @override
  String get specialties => 'Specijaliteti';

  @override
  String get experience => 'Iskustvo';

  @override
  String get qualification => 'Kvalifikacija';

  @override
  String get education => 'Obrazovanje';

  @override
  String get recoveryTips =>
      '• Napravite snimku zaslona ovih podataka\n• Pohranite ih na sigurno mjesto\n• Ne dijelite ni s kim\n• Ovo će se prikazati samo jednom';

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
  String get systemThemeLabel => 'Sustav';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
