// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get notificationSettings => 'Ustawienia powiadomień';

  @override
  String get privacySettings => 'Ustawienia prywatności';

  @override
  String get accountSettings => 'Ustawienia konta';

  @override
  String get languageSettings => 'Ustawienia językowe';

  @override
  String get languageChanged => 'Zmieniono język';

  @override
  String get existingUserButton => 'Jestem istniejącym użytkownikiem';

  @override
  String get chooseCountryTitle => 'Wybierz kraj';

  @override
  String get yesText => 'Tak';

  @override
  String get noText => 'NIE';

  @override
  String get appBarTitle => 'Ustawienia profilu';

  @override
  String get userIdLabel => 'Identyfikator użytkownika *';

  @override
  String get nameLabel => 'Nazwa';

  @override
  String get birthCountryLabel => 'Kraj urodzenia';

  @override
  String get birthCityLabel => 'Miasto urodzenia';

  @override
  String get countrySelectionTitle => 'Wybierz swój kraj';

  @override
  String get maleLabel => 'Mężczyzna';

  @override
  String get femaleLabel => 'Kobieta';

  @override
  String get birthDateLabel => 'Data urodzenia';

  @override
  String get birthDatePlaceholder => 'Wybierz datę urodzenia';

  @override
  String get birthTimeLabel => 'Czas urodzenia';

  @override
  String get birthTimePlaceholder => 'Wybierz godzinę urodzenia';

  @override
  String get saveProfileButton => 'Zapisz profil';

  @override
  String get noCitiesFound => 'Nie znaleziono miast';

  @override
  String cityPlaceholder(Object country) {
    return 'Wprowadź miasto w $country';
  }

  @override
  String get countryFirstPlaceholder => 'Najpierw wybierz kraj';

  @override
  String get versionHistoryTitle => 'Historia wersji';

  @override
  String get notSetText => 'Nie ustawiono';

  @override
  String nameHistory(Object name) {
    return 'Nazwa: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Miasto: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Kraj: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Płeć: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data urodzenia: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Godzina urodzenia: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Lokalizacja: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Strefa czasowa: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Czas letni: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Stan: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Zaktualizowano dnia $date';
  }

  @override
  String get userIdRequired => 'Wymagany jest identyfikator użytkownika';

  @override
  String get profileSaved => 'Profil zapisany pomyślnie';

  @override
  String get saveFailed => 'Nie udało się zapisać profilu';

  @override
  String get errorPrefix => 'Błąd:';

  @override
  String get onboardingChooseLanguage => 'Wybierz swój język';

  @override
  String get onboardingChooseLanguageDesc =>
      'Aby kontynuować, wybierz preferowany język.';

  @override
  String get onboardingWhatIsAstrology => 'Czym jest astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologia jest nauką zajmującą się badaniem ciał niebieskich.';

  @override
  String get onboardingWhyUseApp => 'Dlaczego warto używać tej aplikacji?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Otrzymaj spersonalizowane horoskopy, codzienne prognozy i wskazówki, które pomogą Ci podejmować świadome decyzje.';

  @override
  String get onboardingHowToUse => 'Jak korzystać z tej aplikacji?';

  @override
  String get onboardingHowToUseDesc =>
      'Łatwa nawigacja, sprawdzanie codziennych horoskopów i zarządzanie profilem w celu uzyskania dokładnych przewidywań.';

  @override
  String get onboardingGetStarted => 'Zacznij';

  @override
  String get onboardingNewUser => 'Nowy użytkownik';

  @override
  String get onboardingExistingUser => 'Istniejący użytkownik';

  @override
  String get onboardingBack => 'Z powrotem';

  @override
  String get onboardingNext => 'Następny';

  @override
  String get userIdNotFound =>
      'Nie znaleziono identyfikatora użytkownika. Zaloguj się lub skonfiguruj swój profil.';

  @override
  String get clearNotificationsTitle => 'Wyczyść powiadomienia';

  @override
  String get clearNotificationsMessage =>
      'Czy na pewno chcesz wyczyścić wszystkie powiadomienia?';

  @override
  String get clearNotificationsSuccess =>
      'Wszystkie powiadomienia zostały pomyślnie usunięte.';

  @override
  String get clearHoroscopeTitle => 'Wyczyść horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Czy na pewno chcesz wyczyścić dane swojego horoskopu?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop został pomyślnie wyczyszczony.';

  @override
  String get clearChatTitle => 'Wyczyść historię czatów';

  @override
  String get clearChatMessage =>
      'Czy na pewno chcesz usunąć całą historię czatów?';

  @override
  String get clearChatLocal => 'Czat został wyczyszczony lokalnie.';

  @override
  String get deleteAccountTitle => 'Usuń konto';

  @override
  String get deleteAccountMessage =>
      'Czy na pewno chcesz usunąć swoje konto? Spowoduje to również wyczyszczenie całej historii czatów i powiadomień.';

  @override
  String get deleteAccountSuccess =>
      'Twoje konto i wszystkie dane zostały usunięte.';

  @override
  String get deleteAccountError => 'Błąd usuwania konta';

  @override
  String get logoutTitle => 'Wyloguj';

  @override
  String get logoutMessage => 'Czy na pewno chcesz się wylogować?';

  @override
  String get termsPrivacyTitle => 'Warunki i prywatność';

  @override
  String get privacyPolicyTitle => 'Polityka prywatności';

  @override
  String get termsConditionsTitle => 'Warunki korzystania';

  @override
  String get dataControlTitle => 'Kontrola danych';

  @override
  String get cancelButton => 'Anulować';

  @override
  String get confirmButton => 'Potwierdzać';

  @override
  String get clearQuestionsSuccess =>
      'Wszystkie pytania zostały pomyślnie usunięte.';

  @override
  String get yoginiLabel => 'Joginka';

  @override
  String get lordLabel => 'Lord';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Odzyskaj konto';

  @override
  String get endLabel => 'Koniec';

  @override
  String get startDateLabel => 'Data rozpoczęcia';

  @override
  String get endDateLabel => 'Data zakończenia';

  @override
  String get notAvailable => 'Niedostępne';

  @override
  String get noData => 'Brak danych';

  @override
  String get unknownError => 'Nieznany błąd';

  @override
  String get retryButton => 'Spróbować ponownie';

  @override
  String get kundaliGeneratorTitle => 'Generator Kundali';

  @override
  String get natalChartTitle => 'Horoskop urodzeniowy';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raszi';

  @override
  String get ascDegreeLabel => 'Stopień wstępujący';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Nieznany';

  @override
  String get clearHoroscope => 'Wyczyść horoskop';

  @override
  String get clearNotifications => 'Wyczyść powiadomienia';

  @override
  String get clearChatHistory => 'Wyczyść historię czatów';

  @override
  String get logout => 'Wyloguj';

  @override
  String get deleteAccount => 'Usuń konto';

  @override
  String get allFieldsRequired => 'Wszystkie pola są wymagane.';

  @override
  String get accountRecoveredSuccess => 'Konto zostało pomyślnie odzyskane.';

  @override
  String get recoveryFailed =>
      'Odzyskiwanie nie powiodło się. Sprawdź swoje dane.';

  @override
  String get recoverySecretLabel => 'Sekret odzyskiwania:';

  @override
  String get aboutUsTitle => 'O nas';

  @override
  String get aboutOurCompany => 'O naszej firmie';

  @override
  String get aboutCompanyDescription =>
      'Zależy nam na dostarczaniu naszym użytkownikom najlepszych wrażeń astrologicznych.';

  @override
  String get ourMission => 'Nasza misja';

  @override
  String get missionDescription =>
      'Aby zapewnić dokładne i spersonalizowane informacje astrologiczne, które pomogą użytkownikom podejmować świadome decyzje w życiu.';

  @override
  String get ourVision => 'Nasza wizja';

  @override
  String get visionDescription =>
      'Stać się najbardziej zaufaną platformą astrologiczną, łączącą technologię i starożytną mądrość.';

  @override
  String get ourValues => 'Nasze wartości';

  @override
  String get valuesDescription =>
      'Integralność, dokładność, projektowanie zorientowane na użytkownika i ciągła innowacyjność.';

  @override
  String get contactUs => 'Skontaktuj się z nami';

  @override
  String get contactEmail => 'E-mail: support@twojafirma.com';

  @override
  String get contactWebsite => 'Strona internetowa: www.twojafirma.com';

  @override
  String get customerSupport => 'Obsługa klienta';

  @override
  String get supportHeroTitle => 'Jesteśmy tutaj, aby pomóc';

  @override
  String get supportHeroDescription =>
      'Wypełnij poniższy formularz, a nasz zespół wsparcia skontaktuje się z Tobą najszybciej jak to możliwe.';

  @override
  String get yourName => 'Twoje imię';

  @override
  String get yourEmail => 'Twój adres e-mail';

  @override
  String get message => 'Wiadomość';

  @override
  String get enterEmail => 'Podaj swój adres e-mail';

  @override
  String get enterValidEmail => 'Podaj prawidłowy adres e-mail';

  @override
  String enterField(Object fieldName) {
    return 'Wpisz $fieldName';
  }

  @override
  String get send => 'Wysłać';

  @override
  String get sending => 'Przesyłka...';

  @override
  String get emailSentSuccess => '✅ E-mail został wysłany pomyślnie!';

  @override
  String get emailSendFailed => '❌ Nie udało się wysłać wiadomości e-mail';

  @override
  String get astroDictionaryTitle => 'Słownik astrologiczny';

  @override
  String get searchTermsHint => 'Terminy wyszukiwania...';

  @override
  String get noTermsFound => 'Nie znaleziono terminów';

  @override
  String get buyQuestionsTitle => 'Kup pytania';

  @override
  String get userNotAuthenticated => 'Użytkownik nie został uwierzytelniony';

  @override
  String get loadStoreDataFailed => 'Nie udało się załadować danych ze sklepu';

  @override
  String get missingAuthToken => 'Brak tokenu uwierzytelniającego';

  @override
  String get merchantDisplayName => 'Aplikacja Astro Chat';

  @override
  String get paymentSuccessful => '✅ Płatność pomyślna! Pytanie wysłane';

  @override
  String paymentFailed(Object error) {
    return '❌ Płatność nie powiodła się: $error';
  }

  @override
  String get yourBalance => 'Twoje saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Pytania';
  }

  @override
  String get availableOffers => 'Dostępne oferty';

  @override
  String questionsCount(Object count) {
    return '$count Pytanie';
  }

  @override
  String get buyButton => 'Kupić';

  @override
  String get dailyHoroscopeTitle => '🌟 Horoskop dzienny';

  @override
  String get userIdMissing => 'Brak identyfikatora użytkownika';

  @override
  String get fetchHoroscopesFailed => 'Nie udało się pobrać horoskopów';

  @override
  String get noHoroscopeFound => 'Nie znaleziono horoskopu.';

  @override
  String get signLabel => 'Podpisać';

  @override
  String get todayLabel => 'Dzisiaj';

  @override
  String get yesterdayLabel => 'Wczoraj';

  @override
  String get thisWeekLabel => 'W tym tygodniu';

  @override
  String get lastMonthLabel => 'Ostatni miesiąc';

  @override
  String get chatTitle => 'Pogawędzić';

  @override
  String get typeYourQuestionHint => 'Wpisz swoje pytanie...';

  @override
  String get paymentRequired => 'Wymagana płatność';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Wykorzystałeś swoje darmowe pytania. Zapłać 50 ₹, aby kontynuować.';
  }

  @override
  String get payNowButton => 'Zapłać teraz';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count Pozostało bezpłatnych pytań';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count pozostałych pytań płatnych';
  }

  @override
  String get thankYouFeedback => 'Dziękujemy za opinię!';

  @override
  String get ratingSubmitted => 'Ocena wysłana!';

  @override
  String get setUserIdFirst => 'Najpierw ustaw swój identyfikator użytkownika';

  @override
  String get failedToFetchPrevious =>
      'Nie udało się pobrać poprzednich pytań i odpowiedzi';

  @override
  String errorOccurred(Object error) {
    return 'Błąd: $error';
  }

  @override
  String get drawerAstroProfile => 'Profil Astro';

  @override
  String get drawerDailyHoroscope => 'Horoskop dzienny';

  @override
  String get drawerBuyQuestions => 'Kup pytania';

  @override
  String get drawerAstroDictionary => 'Słownik astrologiczny';

  @override
  String get drawerSettings => 'Ustawienia';

  @override
  String get drawerCustomerSupport => 'Obsługa klienta';

  @override
  String get drawerAbout => 'O';

  @override
  String get drawerProfileSettings => 'Ustawienia profilu';

  @override
  String get demoNotificationTitle =>
      '🔔 Powiadomienie o wersji demonstracyjnej';

  @override
  String get demoNotificationBody =>
      'To jest powiadomienie testowe z Twojej aplikacji!';

  @override
  String get notificationsTitle => 'Powiadomienia';

  @override
  String get noNotifications => 'Brak powiadomień';

  @override
  String get allTab => 'Wszystko';

  @override
  String get markAllAsRead => 'Oznacz wszystkie jako przeczytane';

  @override
  String get notificationMarkedRead =>
      'Powiadomienie oznaczone jako przeczytane';

  @override
  String get failedToLoadNotifications => 'Nie udało się załadować powiadomień';

  @override
  String get failedToMarkRead => 'Nie udało się oznaczyć jako przeczytane';

  @override
  String get failedToMarkAllRead =>
      'Nie udało się oznaczyć wszystkich jako przeczytanych';

  @override
  String get socketConnected => 'Gniazdo podłączone';

  @override
  String get socketDisconnected => 'Gniazdo odłączone';

  @override
  String get newNotificationReceived => 'Otrzymano nowe powiadomienie';

  @override
  String get generalCategory => 'Ogólny';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Pogawędzić';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Aktualizacje';

  @override
  String get howToAskTitle => 'Jak pytać';

  @override
  String get noQuestionsAvailable => 'Brak dostępnych pytań';

  @override
  String get failedToLoadQuestions => 'Nie udało się załadować pytań';

  @override
  String get pullToRefresh => 'Pociągnij, aby odświeżyć';

  @override
  String get careerCategory => 'Kariera';

  @override
  String get loveCategory => 'Miłość i związki';

  @override
  String get healthCategory => 'Zdrowie';

  @override
  String get financeCategory => 'Finanse';

  @override
  String get familyCategory => 'Rodzina';

  @override
  String get educationCategory => 'Edukacja';

  @override
  String get travelCategory => 'Podróż';

  @override
  String get spiritualCategory => 'Duchowy';

  @override
  String get profileLoaded => 'Profil załadowany pomyślnie';

  @override
  String get imageUploaded => 'Obraz przesłany pomyślnie';

  @override
  String get savedInformationConfirmation => 'Zapisałem te informacje';

  @override
  String get noHistoryAvailable => 'Brak dostępnej historii';

  @override
  String get missingUserIdError => 'Wymagany jest identyfikator użytkownika';

  @override
  String get networkError => 'Błąd sieci. Spróbuj ponownie.';

  @override
  String get timeoutError => 'Żądanie przekroczyło limit czasu';

  @override
  String get genericError => 'Coś poszło nie tak';

  @override
  String get reactionUpdateError => 'Nie udało się zaktualizować reakcji';

  @override
  String get noSearchResults => 'Nie znaleziono wyników wyszukiwania';

  @override
  String get clearSearch => 'Wyczyść wyszukiwanie';

  @override
  String get resultsFound => 'Znaleziono wyniki';

  @override
  String get recoverySecretHint =>
      'Kopiowanie i wklejanie może nie działać, wpisz ręcznie';

  @override
  String get recoverAccountDescription =>
      'Aby odzyskać swoje konto, wykonaj poniższe kroki';

  @override
  String get processingLabel => 'Przetwarzanie...';

  @override
  String get clearChatSuccess => 'Czat został pomyślnie wyczyszczony';

  @override
  String get notificationsEnabled => 'Powiadomienia włączone';

  @override
  String get notificationsDisabled => 'Powiadomienia wyłączone';

  @override
  String get securityNotice =>
      'Twoje dane są bezpiecznie szyfrowane i przechowywane';

  @override
  String get loading => 'Załadunek...';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get onboardingGetStartedDesc => 'Zacznij od wybrania swojego języka';

  @override
  String get accountRecoveryTitle => '🔐 Szczegóły odzyskiwania konta';

  @override
  String get recoveryInstructions =>
      'Proszę zachować te informacje w bezpiecznym miejscu. Będą potrzebne do odzyskania konta.';

  @override
  String get importantNotice => '⚠️ Ważne:';

  @override
  String get astrologerProfileTitle => 'Profil astrologa';

  @override
  String get personalAstrologer => 'Astrolog osobisty';

  @override
  String get makePersonalAstrologer => 'Zostań osobistym astrologiem';

  @override
  String get favoriteDescription =>
      'Twoje pytania zostaną przekazane priorytetowo temu astrologowi. Jeśli nie będzie on dostępny, pomoże Ci inny wykwalifikowany astrolog.';

  @override
  String get educationQualifications => 'Edukacja i kwalifikacje';

  @override
  String get aboutSection => 'O';

  @override
  String get shareProfile => 'Udostępnij profil';

  @override
  String get loadingAstrologer => 'Ładowanie szczegółów astrologa...';

  @override
  String get failedToLoadAstrologer =>
      'Nie udało się załadować szczegółów astrologa';

  @override
  String get authenticationRequired =>
      'Wymagane uwierzytelnienie. Zaloguj się.';

  @override
  String securityCheckFailed(Object error) {
    return 'Kontrola bezpieczeństwa nie powiodła się: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name jest teraz Twoim osobistym astrologiem';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Usunięto $name z ulubionych';
  }

  @override
  String get toggleFavoriteError =>
      'Nie udało się zaktualizować statusu ulubionych';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Wykształcenie: $education\n📜 Kwalifikacje: $qualification\n⏳ Doświadczenie: $experience';
  }

  @override
  String get notProvided => 'Nie podano';

  @override
  String reviews(Object count) {
    return '($count recenzji)';
  }

  @override
  String get specialties => 'Specjalizacje';

  @override
  String get experience => 'Doświadczenie';

  @override
  String get qualification => 'Kwalifikacja';

  @override
  String get education => 'Edukacja';

  @override
  String get recoveryTips =>
      '• Zrób zrzut ekranu tych informacji\n• Przechowuj je w bezpiecznym miejscu\n• Nie udostępniaj nikomu\n• Informacje te zostaną wyświetlone tylko raz';

  @override
  String get themeSettingsTitle => 'Ustawienia motywu';

  @override
  String get lightThemeLabel => 'Światło';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Ciemny';

  @override
  String get darkThemeDescription => 'Always use dark theme';

  @override
  String get systemThemeLabel => 'System';

  @override
  String get systemThemeDarkDescription => 'Using system dark theme';

  @override
  String get systemThemeLightDescription => 'Using system light theme';

  @override
  String get switchToLight => 'Switch to Light';

  @override
  String get switchToDark => 'Switch to Dark';
}
