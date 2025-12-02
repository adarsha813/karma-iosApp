// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get notificationSettings => 'Nastavení oznámení';

  @override
  String get privacySettings => 'Nastavení soukromí';

  @override
  String get accountSettings => 'Nastavení účtu';

  @override
  String get languageSettings => 'Nastavení jazyka';

  @override
  String get languageChanged => 'Jazyk změněn';

  @override
  String get existingUserButton => 'Jsem stávající uživatel';

  @override
  String get chooseCountryTitle => 'Vyberte zemi';

  @override
  String get yesText => 'Ano';

  @override
  String get noText => 'Žádný';

  @override
  String get appBarTitle => 'Nastavení profilu';

  @override
  String get userIdLabel => 'ID uživatele *';

  @override
  String get nameLabel => 'Jméno';

  @override
  String get birthCountryLabel => 'Země narození';

  @override
  String get birthCityLabel => 'Rodné město';

  @override
  String get countrySelectionTitle => 'Vyberte si svou zemi';

  @override
  String get maleLabel => 'Samec';

  @override
  String get femaleLabel => 'Žena';

  @override
  String get birthDateLabel => 'Datum narození';

  @override
  String get birthDatePlaceholder => 'Vyberte datum narození';

  @override
  String get birthTimeLabel => 'Čas narození';

  @override
  String get birthTimePlaceholder => 'Vyberte čas narození';

  @override
  String get saveProfileButton => 'Uložit profil';

  @override
  String get noCitiesFound => 'Nenalezena žádná města';

  @override
  String cityPlaceholder(Object country) {
    return 'Zadejte město do $country';
  }

  @override
  String get countryFirstPlaceholder => 'Nejprve vyberte zemi';

  @override
  String get versionHistoryTitle => 'Historie verzí';

  @override
  String get notSetText => 'Není nastaveno';

  @override
  String nameHistory(Object name) {
    return 'Jméno: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Město: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Země: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Pohlaví: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Datum narození: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Čas narození: $time';
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
    return 'Letní čas: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Stát: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aktualizováno dne $date';
  }

  @override
  String get userIdRequired => 'Je vyžadováno ID uživatele';

  @override
  String get profileSaved => 'Profil byl úspěšně uložen';

  @override
  String get saveFailed => 'Profil se nepodařilo uložit';

  @override
  String get errorPrefix => 'Chyba:';

  @override
  String get onboardingChooseLanguage => 'Vyberte si jazyk';

  @override
  String get onboardingChooseLanguageDesc =>
      'Pro pokračování vyberte preferovaný jazyk.';

  @override
  String get onboardingWhatIsAstrology => 'Co je astrologie?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologie je studium nebeských těles...';

  @override
  String get onboardingWhyUseApp => 'Proč používat tuto aplikaci?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Získejte personalizované horoskopy, denní předpovědi a rady pro informovaná rozhodnutí.';

  @override
  String get onboardingHowToUse => 'Jak tuto aplikaci používat?';

  @override
  String get onboardingHowToUseDesc =>
      'Snadno se orientujte, kontrolujte denní horoskopy a spravujte svůj profil pro přesné předpovědi.';

  @override
  String get onboardingGetStarted => 'Začít';

  @override
  String get onboardingNewUser => 'Nový uživatel';

  @override
  String get onboardingExistingUser => 'Stávající uživatel';

  @override
  String get onboardingBack => 'Zadní';

  @override
  String get onboardingNext => 'Další';

  @override
  String get userIdNotFound =>
      'ID uživatele nenalezeno. Přihlaste se prosím nebo si nastavte profil.';

  @override
  String get clearNotificationsTitle => 'Vymazat oznámení';

  @override
  String get clearNotificationsMessage =>
      'Opravdu chcete vymazat všechna oznámení?';

  @override
  String get clearNotificationsSuccess =>
      'Všechna oznámení byla úspěšně smazána.';

  @override
  String get clearHoroscopeTitle => 'Vymazat horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Jste si jisti, že chcete vymazat data svého horoskopu?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop byl úspěšně vymazán.';

  @override
  String get clearChatTitle => 'Vymazat historii chatu';

  @override
  String get clearChatMessage =>
      'Opravdu chcete smazat veškerou historii chatu?';

  @override
  String get clearChatLocal => 'Chat byl lokálně vymazán.';

  @override
  String get deleteAccountTitle => 'Smazat účet';

  @override
  String get deleteAccountMessage =>
      'Opravdu chcete smazat svůj účet? Tímto se také vymaže veškerá historie chatu a oznámení.';

  @override
  String get deleteAccountSuccess => 'Váš účet a všechna data byly odstraněny.';

  @override
  String get deleteAccountError => 'Chyba při mazání účtu';

  @override
  String get logoutTitle => 'Odhlásit se';

  @override
  String get logoutMessage => 'Jste si jisti, že se chcete odhlásit?';

  @override
  String get termsPrivacyTitle => 'Podmínky a ochrana osobních údajů';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobních údajů';

  @override
  String get termsConditionsTitle => 'Obchodní podmínky';

  @override
  String get dataControlTitle => 'Kontrola dat';

  @override
  String get cancelButton => 'Zrušit';

  @override
  String get confirmButton => 'Potvrdit';

  @override
  String get clearQuestionsSuccess => 'Všechny otázky byly úspěšně smazány.';

  @override
  String get yoginiLabel => 'Jógíni';

  @override
  String get lordLabel => 'Pán';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Obnovit účet';

  @override
  String get endLabel => 'Konec';

  @override
  String get startDateLabel => 'Datum zahájení';

  @override
  String get endDateLabel => 'Datum ukončení';

  @override
  String get notAvailable => 'Není k dispozici';

  @override
  String get noData => 'Žádná data';

  @override
  String get unknownError => 'Neznámá chyba';

  @override
  String get retryButton => 'Zkusit znovu';

  @override
  String get kundaliGeneratorTitle => 'Generátor Kundali';

  @override
  String get natalChartTitle => 'Horoskop';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raši';

  @override
  String get ascDegreeLabel => 'Stupeň ascendentu';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Jógini Dáša';

  @override
  String get unknown => 'Neznámý';

  @override
  String get clearHoroscope => 'Vymazat horoskop';

  @override
  String get clearNotifications => 'Vymazat oznámení';

  @override
  String get clearChatHistory => 'Vymazat historii chatu';

  @override
  String get logout => 'Odhlásit se';

  @override
  String get deleteAccount => 'Smazat účet';

  @override
  String get allFieldsRequired => 'Všechna pole jsou povinná.';

  @override
  String get accountRecoveredSuccess => 'Účet byl úspěšně obnoven.';

  @override
  String get recoveryFailed =>
      'Obnovení se nezdařilo. Zkontrolujte své informace.';

  @override
  String get recoverySecretLabel => 'Tajemství obnovy:';

  @override
  String get aboutUsTitle => 'O nás';

  @override
  String get aboutOurCompany => 'O naší společnosti';

  @override
  String get aboutCompanyDescription =>
      'Zavázali jsme se poskytovat našim uživatelům ten nejlepší astrologický zážitek.';

  @override
  String get ourMission => 'Naše poslání';

  @override
  String get missionDescription =>
      'Poskytovat přesné a personalizované astrologické poznatky, které uživatelům pomohou činit informovaná rozhodnutí v jejich životě.';

  @override
  String get ourVision => 'Naše vize';

  @override
  String get visionDescription =>
      'Stát se nejdůvěryhodnější astrologickou platformou, která kombinuje technologie a starověkou moudrost.';

  @override
  String get ourValues => 'Naše hodnoty';

  @override
  String get valuesDescription =>
      'Integrita, přesnost, design zaměřený na uživatele a neustálé inovace.';

  @override
  String get contactUs => 'Kontaktujte nás';

  @override
  String get contactEmail => 'E-mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Webové stránky: www.vasefirma.com';

  @override
  String get customerSupport => 'Zákaznická podpora';

  @override
  String get supportHeroTitle => 'Jsme tu, abychom vám pomohli';

  @override
  String get supportHeroDescription =>
      'Vyplňte níže uvedený formulář a náš tým podpory se vám co nejdříve ozve.';

  @override
  String get yourName => 'Vaše jméno';

  @override
  String get yourEmail => 'Váš e-mail';

  @override
  String get message => 'Zpráva';

  @override
  String get enterEmail => 'Zadejte svůj e-mail';

  @override
  String get enterValidEmail => 'Zadejte platnou e-mailovou adresu';

  @override
  String enterField(Object fieldName) {
    return 'Zadejte $fieldName';
  }

  @override
  String get send => 'Poslat';

  @override
  String get sending => 'Odesílání...';

  @override
  String get emailSentSuccess => '✅ E-mail byl úspěšně odeslán!';

  @override
  String get emailSendFailed => '❌ Odeslání e-mailu se nezdařilo';

  @override
  String get astroDictionaryTitle => 'Astro slovník';

  @override
  String get searchTermsHint => 'Hledané výrazy...';

  @override
  String get noTermsFound => 'Nenalezeny žádné výrazy';

  @override
  String get buyQuestionsTitle => 'Otázky k nákupu';

  @override
  String get userNotAuthenticated => 'Uživatel nebyl ověřen';

  @override
  String get loadStoreDataFailed => 'Nepodařilo se načíst data úložiště';

  @override
  String get missingAuthToken => 'Chybí autorizační token';

  @override
  String get merchantDisplayName => 'Aplikace Astro Chat';

  @override
  String get paymentSuccessful => '✅ Platba úspěšná! Dotaz odeslán';

  @override
  String paymentFailed(Object error) {
    return '❌ Platba selhala: $error';
  }

  @override
  String get yourBalance => 'Váš zůstatek';

  @override
  String questionsBalance(Object count) {
    return '$count Questions';
  }

  @override
  String get availableOffers => 'Dostupné nabídky';

  @override
  String questionsCount(Object count) {
    return '$count Question';
  }

  @override
  String get buyButton => 'Nakoupit';

  @override
  String get dailyHoroscopeTitle => '🌟 Denní horoskop';

  @override
  String get userIdMissing => 'Chybí ID uživatele';

  @override
  String get fetchHoroscopesFailed => 'Nepodařilo se načíst horoskopy';

  @override
  String get noHoroscopeFound => 'Nebyl nalezen žádný horoskop.';

  @override
  String get signLabel => 'Znamení';

  @override
  String get todayLabel => 'Dnes';

  @override
  String get yesterdayLabel => 'Včera';

  @override
  String get thisWeekLabel => 'Tento týden';

  @override
  String get lastMonthLabel => 'Minulý měsíc';

  @override
  String get chatTitle => 'Povídání';

  @override
  String get typeYourQuestionHint => 'Napište svou otázku...';

  @override
  String get paymentRequired => 'Platba je vyžadována';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Vyčerpali jste své bezplatné otázky. Zaplaťte 50 ₹ a pokračujte.';
  }

  @override
  String get payNowButton => 'Zaplatit nyní';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Zbývá $count otázek zdarma';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Zbývá $count placených otázek';
  }

  @override
  String get thankYouFeedback => 'Děkujeme za vaši zpětnou vazbu!';

  @override
  String get ratingSubmitted => 'Hodnocení odesláno!';

  @override
  String get setUserIdFirst => 'Nejprve si prosím nastavte své uživatelské ID';

  @override
  String get failedToFetchPrevious =>
      'Nepodařilo se načíst předchozí otázky a odpovědi';

  @override
  String errorOccurred(Object error) {
    return 'Chyba: $error';
  }

  @override
  String get drawerAstroProfile => 'Astro profil';

  @override
  String get drawerDailyHoroscope => 'Denní horoskop';

  @override
  String get drawerBuyQuestions => 'Otázky k nákupu';

  @override
  String get drawerAstroDictionary => 'Astro slovník';

  @override
  String get drawerSettings => 'Nastavení';

  @override
  String get drawerCustomerSupport => 'Zákaznická podpora';

  @override
  String get drawerAbout => 'O';

  @override
  String get drawerProfileSettings => 'Nastavení profilu';

  @override
  String get demoNotificationTitle => '🔔 Oznámení o demoverzi';

  @override
  String get demoNotificationBody =>
      'Toto je testovací oznámení z vaší aplikace!';

  @override
  String get notificationsTitle => 'Oznámení';

  @override
  String get noNotifications => 'Žádná oznámení';

  @override
  String get allTab => 'Vše';

  @override
  String get markAllAsRead => 'Označit vše jako přečtené';

  @override
  String get notificationMarkedRead => 'Oznámení označeno jako přečtené';

  @override
  String get failedToLoadNotifications => 'Načtení oznámení se nezdařilo';

  @override
  String get failedToMarkRead => 'Označení jako přečtené se nezdařilo';

  @override
  String get failedToMarkAllRead => 'Nepodařilo se označit vše jako přečtené';

  @override
  String get socketConnected => 'Zásuvka připojena';

  @override
  String get socketDisconnected => 'Zásuvka odpojena';

  @override
  String get newNotificationReceived => 'Nové oznámení přijato';

  @override
  String get generalCategory => 'Generál';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Povídání';

  @override
  String get systemCategory => 'Systém';

  @override
  String get updateCategory => 'Aktualizace';

  @override
  String get howToAskTitle => 'Jak se zeptat';

  @override
  String get noQuestionsAvailable => 'Žádné dostupné otázky';

  @override
  String get failedToLoadQuestions => 'Načtení otázek se nezdařilo';

  @override
  String get pullToRefresh => 'Tažením obnovíte';

  @override
  String get careerCategory => 'Kariéra';

  @override
  String get loveCategory => 'Láska a vztahy';

  @override
  String get healthCategory => 'Zdraví';

  @override
  String get financeCategory => 'Finance';

  @override
  String get familyCategory => 'Rodina';

  @override
  String get educationCategory => 'Školství';

  @override
  String get travelCategory => 'Cestovat';

  @override
  String get spiritualCategory => 'Duchovní';

  @override
  String get profileLoaded => 'Profil byl úspěšně načten';

  @override
  String get imageUploaded => 'Obrázek byl úspěšně nahrán';

  @override
  String get savedInformationConfirmation => 'Tyto informace jsem si uložil/a';

  @override
  String get noHistoryAvailable => 'Žádná historie k dispozici';

  @override
  String get missingUserIdError => 'Je vyžadováno ID uživatele';

  @override
  String get networkError => 'Chyba sítě. Zkuste to prosím znovu.';

  @override
  String get timeoutError => 'Časový limit požadavku vypršel';

  @override
  String get genericError => 'Něco se pokazilo';

  @override
  String get reactionUpdateError => 'Reakci se nepodařilo aktualizovat';

  @override
  String get noSearchResults => 'Nebyly nalezeny žádné výsledky vyhledávání';

  @override
  String get clearSearch => 'Vymazat vyhledávání';

  @override
  String get resultsFound => 'Nalezené výsledky';

  @override
  String get recoverySecretHint =>
      'Kopírování a vkládání nemusí fungovat, pište ručně';

  @override
  String get recoverAccountDescription =>
      'Postupujte podle těchto kroků k obnovení účtu';

  @override
  String get processingLabel => 'Zpracování...';

  @override
  String get clearChatSuccess => 'Chat byl úspěšně vymazán';

  @override
  String get notificationsEnabled => 'Oznámení povolena';

  @override
  String get notificationsDisabled => 'Oznámení zakázána';

  @override
  String get securityNotice => 'Vaše data jsou bezpečně šifrována a uložena';

  @override
  String get loading => 'Načítání...';

  @override
  String get selectLanguage => 'Vyberte jazyk';

  @override
  String get onboardingGetStartedDesc => 'Začněte výběrem jazyka';

  @override
  String get accountRecoveryTitle => '🔐 Podrobnosti o obnovení účtu';

  @override
  String get recoveryInstructions =>
      'Prosím, uložte si tyto informace bezpečně. Budete je potřebovat k obnovení účtu.';

  @override
  String get importantNotice => '⚠️ Důležité:';

  @override
  String get astrologerProfileTitle => 'Profil astrologa';

  @override
  String get personalAstrologer => 'Osobní astrolog';

  @override
  String get makePersonalAstrologer => 'Staňte se osobním astrologem';

  @override
  String get favoriteDescription =>
      'Vaše otázky budou tomuto astrologovi přednostně předány. Pokud nebude k dispozici, pomůže vám jiný kvalifikovaný astrolog.';

  @override
  String get educationQualifications => 'Vzdělání a kvalifikace';

  @override
  String get aboutSection => 'O';

  @override
  String get shareProfile => 'Sdílet profil';

  @override
  String get loadingAstrologer => 'Načítání údajů o astrologovi...';

  @override
  String get failedToLoadAstrologer =>
      'Nepodařilo se načíst údaje o astrologovi';

  @override
  String get authenticationRequired => 'Vyžaduje se ověření. Přihlaste se.';

  @override
  String securityCheckFailed(Object error) {
    return 'Bezpečnostní kontrola selhala: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name je nyní váš osobní astrolog';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Odebráno $name z oblíbených';
  }

  @override
  String get toggleFavoriteError =>
      'Nepodařilo se aktualizovat stav oblíbených';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Vzdělání: $education\n📜 Kvalifikace: $qualification\n⏳ Praxe: $experience';
  }

  @override
  String get notProvided => 'Není uvedeno';

  @override
  String reviews(Object count) {
    return '($count recenzí)';
  }

  @override
  String get specialties => 'Speciality';

  @override
  String get experience => 'Zažít';

  @override
  String get qualification => 'Kvalifikace';

  @override
  String get education => 'Školství';

  @override
  String get recoveryTips =>
      '• Pořiďte snímek obrazovky s těmito informacemi\n• Uložte je na bezpečném místě\n• Nesdílejte je s nikým\n• Zobrazí se pouze jednou';

  @override
  String get themeSettingsTitle => 'Nastavení motivu';

  @override
  String get lightThemeLabel => 'Světlo';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Tmavý';

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
