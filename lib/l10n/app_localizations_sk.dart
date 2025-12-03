// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get notificationSettings => 'Nastavenia upozornení';

  @override
  String get privacySettings => 'Nastavenia ochrany osobných údajov';

  @override
  String get accountSettings => 'Nastavenia účtu';

  @override
  String get languageSettings => 'Nastavenia jazyka';

  @override
  String get languageChanged => 'Jazyk zmenený';

  @override
  String get existingUserButton => 'Som existujúci používateľ';

  @override
  String get chooseCountryTitle => 'Vyberte krajinu';

  @override
  String get yesText => 'Áno';

  @override
  String get noText => 'Nie';

  @override
  String get appBarTitle => 'Nastavenia profilu';

  @override
  String get userIdLabel => 'ID používateľa *';

  @override
  String get nameLabel => 'Meno';

  @override
  String get birthCountryLabel => 'Krajina narodenia';

  @override
  String get birthCityLabel => 'Mesto narodenia';

  @override
  String get countrySelectionTitle => 'Vyberte si svoju krajinu';

  @override
  String get maleLabel => 'Muž';

  @override
  String get femaleLabel => 'Žena';

  @override
  String get birthDateLabel => 'Dátum narodenia';

  @override
  String get birthDatePlaceholder => 'Vyberte dátum narodenia';

  @override
  String get birthTimeLabel => 'Čas narodenia';

  @override
  String get birthTimePlaceholder => 'Vyberte čas narodenia';

  @override
  String get saveProfileButton => 'Uložiť profil';

  @override
  String get noCitiesFound => 'Nenašli sa žiadne mestá';

  @override
  String cityPlaceholder(Object country) {
    return 'Zadajte mesto do $country';
  }

  @override
  String get countryFirstPlaceholder => 'Najprv vyberte krajinu';

  @override
  String get versionHistoryTitle => 'História verzií';

  @override
  String get notSetText => 'Nie je nastavené';

  @override
  String nameHistory(Object name) {
    return 'Názov: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Mesto: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Krajina: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Pohlavie: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Dátum narodenia: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Čas narodenia: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Poloha: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Letný čas: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Štát: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aktualizované dňa $date';
  }

  @override
  String get userIdRequired => 'Vyžaduje sa ID používateľa';

  @override
  String get profileSaved => 'Profil bol úspešne uložený';

  @override
  String get saveFailed => 'Uloženie profilu zlyhalo';

  @override
  String get errorPrefix => 'Chyba:';

  @override
  String get onboardingChooseLanguage => 'Vyberte si jazyk';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pre pokračovanie vyberte preferovaný jazyk.';

  @override
  String get onboardingWhatIsAstrology => 'Čo je astrológia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrológia je veda o nebeských telesách...';

  @override
  String get onboardingWhyUseApp => 'Prečo používať túto aplikáciu?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Získajte personalizované horoskopy, denné predpovede a poradenstvo pre informované rozhodnutia.';

  @override
  String get onboardingHowToUse => 'Ako používať túto aplikáciu?';

  @override
  String get onboardingHowToUseDesc =>
      'Jednoducho sa pohybujte, kontrolujte denné horoskopy a spravujte svoj profil, aby ste získali presné predpovede.';

  @override
  String get onboardingGetStarted => 'Začať';

  @override
  String get onboardingNewUser => 'Nový používateľ';

  @override
  String get onboardingExistingUser => 'Existujúci používateľ';

  @override
  String get onboardingBack => 'Späť';

  @override
  String get onboardingNext => 'Ďalej';

  @override
  String get userIdNotFound =>
      'ID používateľa sa nenašlo. Prihláste sa alebo si nastavte profil.';

  @override
  String get clearNotificationsTitle => 'Vymazať upozornenia';

  @override
  String get clearNotificationsMessage =>
      'Naozaj chcete vymazať všetky upozornenia?';

  @override
  String get clearNotificationsSuccess =>
      'Všetky upozornenia boli úspešne vymazané.';

  @override
  String get clearHoroscopeTitle => 'Vymazať horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Naozaj chcete vymazať údaje svojho horoskopu?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop bol úspešne vymazaný.';

  @override
  String get clearChatTitle => 'Vymazať históriu chatu';

  @override
  String get clearChatMessage => 'Naozaj chcete vymazať celú históriu chatu?';

  @override
  String get clearChatLocal => 'Chat bol lokálne vymazaný.';

  @override
  String get deleteAccountTitle => 'Odstrániť účet';

  @override
  String get deleteAccountMessage =>
      'Naozaj chcete odstrániť svoj účet? Týmto sa vymaže aj všetka história chatu a upozornenia.';

  @override
  String get deleteAccountSuccess => 'Váš účet a všetky údaje boli odstránené.';

  @override
  String get deleteAccountError => 'Chyba pri odstraňovaní účtu';

  @override
  String get logoutTitle => 'Odhlásiť sa';

  @override
  String get logoutMessage => 'Naozaj sa chcete odhlásiť?';

  @override
  String get termsPrivacyTitle => 'Podmienky a ochrana osobných údajov';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobných údajov';

  @override
  String get termsConditionsTitle => 'Zmluvné podmienky';

  @override
  String get dataControlTitle => 'Kontrola údajov';

  @override
  String get cancelButton => 'Zrušiť';

  @override
  String get confirmButton => 'Potvrdiť';

  @override
  String get clearQuestionsSuccess => 'Všetky otázky boli úspešne odstránené.';

  @override
  String get yoginiLabel => 'Jogíni';

  @override
  String get lordLabel => 'Pán';

  @override
  String get startLabel => 'Štart';

  @override
  String get recoverAccount => 'Obnoviť účet';

  @override
  String get endLabel => 'Koniec';

  @override
  String get startDateLabel => 'Dátum začiatku';

  @override
  String get endDateLabel => 'Dátum ukončenia';

  @override
  String get notAvailable => 'Nie je k dispozícii';

  @override
  String get noData => 'Žiadne údaje';

  @override
  String get unknownError => 'Neznáma chyba';

  @override
  String get retryButton => 'Skúsiť znova';

  @override
  String get kundaliGeneratorTitle => 'Generátor Kundali';

  @override
  String get natalChartTitle => 'Natálny horoskop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Stupeň ascendentu';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Jogíni Dáša';

  @override
  String get unknown => 'Neznámy';

  @override
  String get clearHoroscope => 'Vymazať horoskop';

  @override
  String get clearNotifications => 'Vymazať upozornenia';

  @override
  String get clearChatHistory => 'Vymazať históriu chatu';

  @override
  String get logout => 'Odhlásiť sa';

  @override
  String get deleteAccount => 'Odstrániť účet';

  @override
  String get allFieldsRequired => 'Všetky polia sú povinné.';

  @override
  String get accountRecoveredSuccess => 'Účet bol úspešne obnovený.';

  @override
  String get recoveryFailed => 'Obnova zlyhala. Skontrolujte si informácie.';

  @override
  String get recoverySecretLabel => 'Tajomstvo obnovy:';

  @override
  String get aboutUsTitle => 'O nás';

  @override
  String get aboutOurCompany => 'O našej spoločnosti';

  @override
  String get aboutCompanyDescription =>
      'Zaviazali sme sa poskytovať našim používateľom ten najlepší astrologický zážitok.';

  @override
  String get ourMission => 'Naše poslanie';

  @override
  String get missionDescription =>
      'Poskytovať presné a personalizované astrologické poznatky, ktoré pomôžu používateľom robiť informované rozhodnutia v ich živote.';

  @override
  String get ourVision => 'Naša vízia';

  @override
  String get visionDescription =>
      'Stať sa najdôveryhodnejšou astrologickou platformou, ktorá kombinuje technológie a starodávnu múdrosť.';

  @override
  String get ourValues => 'Naše hodnoty';

  @override
  String get valuesDescription =>
      'Integrita, presnosť, dizajn zameraný na používateľa a neustále inovácie.';

  @override
  String get contactUs => 'Kontaktujte nás';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webová stránka: www.yourcompany.com';

  @override
  String get customerSupport => 'Zákaznícka podpora';

  @override
  String get supportHeroTitle => 'Sme tu, aby sme vám pomohli';

  @override
  String get supportHeroDescription =>
      'Vyplňte nižšie uvedený formulár a náš tím podpory sa vám čo najskôr ozve.';

  @override
  String get yourName => 'Vaše meno';

  @override
  String get yourEmail => 'Váš e-mail';

  @override
  String get message => 'Správa';

  @override
  String get enterEmail => 'Zadajte svoj e-mail';

  @override
  String get enterValidEmail => 'Zadajte platnú e-mailovú adresu';

  @override
  String enterField(Object fieldName) {
    return 'Zadajte $fieldName';
  }

  @override
  String get send => 'Odoslať';

  @override
  String get sending => 'Odosielanie...';

  @override
  String get emailSentSuccess => '✅ E-mail bol úspešne odoslaný!';

  @override
  String get emailSendFailed => '❌ Odoslanie e-mailu zlyhalo';

  @override
  String get astroDictionaryTitle => 'Astro slovník';

  @override
  String get searchTermsHint => 'Hľadané výrazy...';

  @override
  String get noTermsFound => 'Nenašli sa žiadne výrazy';

  @override
  String get buyQuestionsTitle => 'Otázky k nákupu';

  @override
  String get userNotAuthenticated => 'Používateľ nie je overený';

  @override
  String get loadStoreDataFailed => 'Nepodarilo sa načítať údaje o obchode';

  @override
  String get missingAuthToken => 'Chýbajúci autorizačný token';

  @override
  String get merchantDisplayName => 'Aplikácia Astro Chat';

  @override
  String get paymentSuccessful => '✅ Platba úspešná! Otázka odoslaná';

  @override
  String paymentFailed(Object error) {
    return '❌ Platba zlyhala: $error';
  }

  @override
  String get yourBalance => 'Váš zostatok';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Dostupné ponuky';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Kúpiť';

  @override
  String get dailyHoroscopeTitle => '🌟 Denný horoskop';

  @override
  String get userIdMissing => 'Chýba ID používateľa';

  @override
  String get fetchHoroscopesFailed => 'Nepodarilo sa načítať horoskopy';

  @override
  String get noHoroscopeFound => 'Nenašiel sa žiadny horoskop.';

  @override
  String get signLabel => 'Prihlásiť sa';

  @override
  String get todayLabel => 'Dnes';

  @override
  String get yesterdayLabel => 'Včera';

  @override
  String get thisWeekLabel => 'Tento týždeň';

  @override
  String get lastMonthLabel => 'Minulý mesiac';

  @override
  String get chatTitle => 'Čet';

  @override
  String get typeYourQuestionHint => 'Napíšte svoju otázku...';

  @override
  String get paymentRequired => 'Vyžaduje sa platba';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Vyčerpali ste svoje bezplatné otázky. Zaplaťte $amount a pokračujte.';
  }

  @override
  String get payNowButton => 'Zaplatiť teraz';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Zostáva $count voľných otázok';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Zostáva $count platených otázok';
  }

  @override
  String get thankYouFeedback => 'Ďakujeme za vašu spätnú väzbu!';

  @override
  String get ratingSubmitted => 'Hodnotenie odoslané!';

  @override
  String get setUserIdFirst => 'Najprv si nastavte svoje používateľské ID';

  @override
  String get failedToFetchPrevious =>
      'Nepodarilo sa načítať predchádzajúce otázky a odpovede';

  @override
  String errorOccurred(Object error) {
    return 'Chyba: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profil';

  @override
  String get drawerDailyHoroscope => 'Denný horoskop';

  @override
  String get drawerBuyQuestions => 'Otázky k nákupu';

  @override
  String get drawerAstroDictionary => 'Astro slovník';

  @override
  String get drawerSettings => 'Nastavenia';

  @override
  String get drawerCustomerSupport => 'Zákaznícka podpora';

  @override
  String get drawerAbout => 'O nás';

  @override
  String get drawerProfileSettings => 'Nastavenia profilu';

  @override
  String get demoNotificationTitle => '🔔 Upozornenie na demo';

  @override
  String get demoNotificationBody =>
      'Toto je testovacie upozornenie z vašej aplikácie!';

  @override
  String get notificationsTitle => 'Upozornenia';

  @override
  String get noNotifications => 'Žiadne upozornenia';

  @override
  String get allTab => 'Všetky';

  @override
  String get markAllAsRead => 'Označiť všetko ako prečítané';

  @override
  String get notificationMarkedRead => 'Oznámenie označené ako prečítané';

  @override
  String get failedToLoadNotifications => 'Načítanie upozornení zlyhalo';

  @override
  String get failedToMarkRead => 'Označenie ako prečítané zlyhalo';

  @override
  String get failedToMarkAllRead =>
      'Nepodarilo sa označiť všetky ako prečítané';

  @override
  String get socketConnected => 'Zásuvka pripojená';

  @override
  String get socketDisconnected => 'Zásuvka odpojená';

  @override
  String get newNotificationReceived => 'Prijaté nové oznámenie';

  @override
  String get generalCategory => 'Všeobecné';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Čet';

  @override
  String get systemCategory => 'Systém';

  @override
  String get updateCategory => 'Aktualizácie';

  @override
  String get howToAskTitle => 'Ako sa opýtať';

  @override
  String get noQuestionsAvailable => 'Žiadne otázky nie sú k dispozícii';

  @override
  String get failedToLoadQuestions => 'Nepodarilo sa načítať otázky';

  @override
  String get pullToRefresh => 'Potiahnutím obnovíte';

  @override
  String get careerCategory => 'Kariéra';

  @override
  String get loveCategory => 'Láska a vzťahy';

  @override
  String get healthCategory => 'Zdravie';

  @override
  String get financeCategory => 'Financie';

  @override
  String get familyCategory => 'Rodina';

  @override
  String get educationCategory => 'Vzdelávanie';

  @override
  String get travelCategory => 'Cestovanie';

  @override
  String get spiritualCategory => 'Duchovný';

  @override
  String get profileLoaded => 'Profil sa úspešne načítal';

  @override
  String get imageUploaded => 'Obrázok bol úspešne nahraný';

  @override
  String get savedInformationConfirmation => 'Tieto informácie som si uložil/a';

  @override
  String get noHistoryAvailable => 'Nie je k dispozícii žiadna história';

  @override
  String get missingUserIdError => 'Vyžaduje sa ID používateľa';

  @override
  String get networkError => 'Chyba siete. Skúste to znova.';

  @override
  String get timeoutError => 'Časový limit žiadosti vypršal';

  @override
  String get genericError => 'Niečo sa pokazilo';

  @override
  String get reactionUpdateError => 'Reakciu sa nepodarilo aktualizovať';

  @override
  String get noSearchResults => 'Nenašli sa žiadne výsledky vyhľadávania';

  @override
  String get clearSearch => 'Vymazať vyhľadávanie';

  @override
  String get resultsFound => 'Nájdené výsledky';

  @override
  String get recoverySecretHint =>
      'Kopírovanie a vkladanie nemusí fungovať, píšte manuálne';

  @override
  String get recoverAccountDescription =>
      'Postupujte podľa týchto krokov na obnovenie svojho účtu';

  @override
  String get processingLabel => 'Spracováva sa...';

  @override
  String get clearChatSuccess => 'Chat bol úspešne vymazaný';

  @override
  String get notificationsEnabled => 'Upozornenia povolené';

  @override
  String get notificationsDisabled => 'Upozornenia sú vypnuté';

  @override
  String get securityNotice => 'Vaše údaje sú bezpečne šifrované a uložené';

  @override
  String get loading => 'Načítava sa...';

  @override
  String get selectLanguage => 'Vyberte jazyk';

  @override
  String get onboardingGetStartedDesc => 'Začnite výberom jazyka';

  @override
  String get accountRecoveryTitle => '🔐 Podrobnosti o obnovení účtu';

  @override
  String get recoveryInstructions =>
      'Prosím, uložte si tieto informácie bezpečne. Budete ich potrebovať na obnovenie vášho účtu.';

  @override
  String get importantNotice => '⚠️ Dôležité:';

  @override
  String get astrologerProfileTitle => 'Profil astrológa';

  @override
  String get personalAstrologer => 'Osobný astrológ';

  @override
  String get makePersonalAstrologer => 'Vytvorte si osobného astrológa';

  @override
  String get favoriteDescription =>
      'Vaše otázky budú prioritne adresované tomuto astrológovi. Ak nie je k dispozícii, pomôže vám iný kvalifikovaný astrológ.';

  @override
  String get educationQualifications => 'Vzdelanie a kvalifikácia';

  @override
  String get aboutSection => 'O nás';

  @override
  String get shareProfile => 'Zdieľať profil';

  @override
  String get loadingAstrologer => 'Načítavajú sa údaje o astrológovi...';

  @override
  String get failedToLoadAstrologer =>
      'Nepodarilo sa načítať údaje o astrológovi';

  @override
  String get authenticationRequired => 'Vyžaduje sa overenie. Prihláste sa.';

  @override
  String securityCheckFailed(Object error) {
    return 'Bezpečnostná kontrola zlyhala: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name je teraz váš osobný astrológ';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Položka $name bola odstránená z obľúbených';
  }

  @override
  String get toggleFavoriteError =>
      'Nepodarilo sa aktualizovať stav obľúbených';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Vzdelanie: $education\n📜 Kvalifikácia: $qualification\n⏳ Prax: $experience';
  }

  @override
  String get notProvided => 'Nie je poskytnuté';

  @override
  String reviews(Object count) {
    return '($count recenzií)';
  }

  @override
  String get specialties => 'Špeciality';

  @override
  String get experience => 'Skúsenosti';

  @override
  String get qualification => 'Kvalifikácia';

  @override
  String get education => 'Vzdelávanie';

  @override
  String get recoveryTips =>
      '• Urobte si snímku obrazovky s týmito informáciami\n• Uschovajte si ich na bezpečnom mieste\n• Nezdieľajte ich s nikým\n• Zobrazia sa iba raz';

  @override
  String get themeSettingsTitle => 'Nastavenia témy';

  @override
  String get lightThemeLabel => 'Svetlo';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tmavé';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'Systém';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
