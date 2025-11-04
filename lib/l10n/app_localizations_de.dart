// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get notificationSettings => 'Benachrichtigungseinstellungen';

  @override
  String get privacySettings => 'Datenschutzeinstellungen';

  @override
  String get accountSettings => 'Kontoeinstellungen';

  @override
  String get languageSettings => 'Spracheinstellungen';

  @override
  String get languageChanged => 'Sprache geändert';

  @override
  String get existingUserButton => 'Ich bin bereits ein Benutzer.';

  @override
  String get chooseCountryTitle => 'Land auswählen';

  @override
  String get yesText => 'Ja';

  @override
  String get noText => 'NEIN';

  @override
  String get appBarTitle => 'Profileinstellungen';

  @override
  String get userIdLabel => 'Benutzer-ID *';

  @override
  String get nameLabel => 'Name';

  @override
  String get birthCountryLabel => 'Geburtsland';

  @override
  String get birthCityLabel => 'Geburtsort';

  @override
  String get countrySelectionTitle => 'Wählen Sie Ihr Land';

  @override
  String get maleLabel => 'Männlich';

  @override
  String get femaleLabel => 'Weiblich';

  @override
  String get birthDateLabel => 'Geburtsdatum';

  @override
  String get birthDatePlaceholder => 'Geburtsdatum auswählen';

  @override
  String get birthTimeLabel => 'Geburtszeit';

  @override
  String get birthTimePlaceholder => 'Geburtszeit auswählen';

  @override
  String get saveProfileButton => 'Profil speichern';

  @override
  String get noCitiesFound => 'Keine Städte gefunden';

  @override
  String cityPlaceholder(Object country) {
    return 'Geben Sie die Stadt in $country ein.';
  }

  @override
  String get countryFirstPlaceholder => 'Wählen Sie zuerst das Land aus.';

  @override
  String get versionHistoryTitle => 'Versionsverlauf';

  @override
  String get notSetText => 'Nicht festgelegt';

  @override
  String nameHistory(Object name) {
    return 'Name: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Stadt: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Land: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Geschlecht: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Geburtsdatum: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Geburtszeit: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Standort: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zeitzone: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Bundesland: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aktualisiert am $date';
  }

  @override
  String get userIdRequired => 'Benutzer-ID erforderlich';

  @override
  String get profileSaved => 'Profil erfolgreich gespeichert';

  @override
  String get saveFailed => 'Profil konnte nicht gespeichert werden';

  @override
  String get errorPrefix => 'Fehler:';

  @override
  String get onboardingChooseLanguage => 'Wählen Sie Ihre Sprache';

  @override
  String get onboardingChooseLanguageDesc =>
      'Wählen Sie Ihre bevorzugte Sprache, um fortzufahren.';

  @override
  String get onboardingWhatIsAstrology => 'Was ist Astrologie?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'Astrologie ist die Lehre von den Himmelskörpern...';

  @override
  String get onboardingWhyUseApp => 'Warum diese App nutzen?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Erhalten Sie personalisierte Horoskope, tägliche Vorhersagen und Ratschläge, um fundierte Entscheidungen zu treffen.';

  @override
  String get onboardingHowToUse => 'Wie benutzt man diese App?';

  @override
  String get onboardingHowToUseDesc =>
      'Navigieren Sie einfach, lesen Sie Ihre Tageshoroskope und verwalten Sie Ihr Profil für präzise Vorhersagen.';

  @override
  String get onboardingGetStarted => 'Los geht\'s';

  @override
  String get onboardingNewUser => 'Neuer Benutzer';

  @override
  String get onboardingExistingUser => 'Bestehender Benutzer';

  @override
  String get onboardingBack => 'Zurück';

  @override
  String get onboardingNext => 'Nächste';

  @override
  String get userIdNotFound =>
      'Benutzer-ID nicht gefunden. Bitte melden Sie sich an oder richten Sie Ihr Profil ein.';

  @override
  String get clearNotificationsTitle => 'Benachrichtigungen löschen';

  @override
  String get clearNotificationsMessage =>
      'Möchten Sie wirklich alle Benachrichtigungen löschen?';

  @override
  String get clearNotificationsSuccess =>
      'Alle Benachrichtigungen wurden erfolgreich gelöscht.';

  @override
  String get clearHoroscopeTitle => 'Klares Horoskop';

  @override
  String get clearHoroscopeMessage =>
      'Möchten Sie Ihre Horoskopdaten wirklich löschen?';

  @override
  String get clearHoroscopeSuccess => 'Horoskop erfolgreich gelöscht.';

  @override
  String get clearChatTitle => 'Chatverlauf löschen';

  @override
  String get clearChatMessage =>
      'Möchtest du wirklich deinen gesamten Chatverlauf löschen?';

  @override
  String get clearChatLocal => 'Chat wurde lokal gelöscht.';

  @override
  String get deleteAccountTitle => 'Konto löschen';

  @override
  String get deleteAccountMessage =>
      'Möchten Sie Ihr Konto wirklich löschen? Dadurch werden auch Ihr gesamter Chatverlauf und alle Benachrichtigungen gelöscht.';

  @override
  String get deleteAccountSuccess =>
      'Ihr Konto und alle zugehörigen Daten wurden gelöscht.';

  @override
  String get deleteAccountError => 'Fehler beim Löschen des Kontos';

  @override
  String get logoutTitle => 'Abmelden';

  @override
  String get logoutMessage => 'Möchten Sie sich wirklich abmelden?';

  @override
  String get termsPrivacyTitle => 'Nutzungsbedingungen und Datenschutz';

  @override
  String get privacyPolicyTitle => 'Datenschutzrichtlinie';

  @override
  String get termsConditionsTitle => 'Allgemeine Geschäftsbedingungen';

  @override
  String get dataControlTitle => 'Datenkontrolle';

  @override
  String get cancelButton => 'Stornieren';

  @override
  String get confirmButton => 'Bestätigen';

  @override
  String get clearQuestionsSuccess =>
      'Alle Fragen wurden erfolgreich gelöscht.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Herr';

  @override
  String get startLabel => 'Start';

  @override
  String get recoverAccount => 'Konto wiederherstellen';

  @override
  String get endLabel => 'Ende';

  @override
  String get startDateLabel => 'Startdatum';

  @override
  String get endDateLabel => 'Enddatum';

  @override
  String get notAvailable => 'Nicht verfügbar';

  @override
  String get noData => 'Keine Daten';

  @override
  String get unknownError => 'Unbekannter Fehler';

  @override
  String get retryButton => 'Wiederholen';

  @override
  String get kundaliGeneratorTitle => 'Kundali-Generator';

  @override
  String get natalChartTitle => 'Geburtsdiagramm';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Aszendent';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get clearHoroscope => 'Klares Horoskop';

  @override
  String get clearNotifications => 'Benachrichtigungen löschen';

  @override
  String get clearChatHistory => 'Chatverlauf löschen';

  @override
  String get logout => 'Abmelden';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get allFieldsRequired => 'Alle Felder sind Pflichtfelder.';

  @override
  String get accountRecoveredSuccess => 'Konto erfolgreich wiederhergestellt.';

  @override
  String get recoveryFailed =>
      'Die Wiederherstellung ist fehlgeschlagen. Überprüfen Sie Ihre Angaben.';

  @override
  String get recoverySecretLabel => 'Geheimnis der Genesung:';

  @override
  String get aboutUsTitle => 'Über uns';

  @override
  String get aboutOurCompany => 'Über unser Unternehmen';

  @override
  String get aboutCompanyDescription =>
      'Wir sind bestrebt, unseren Nutzern das beste Astrologie-Erlebnis zu bieten.';

  @override
  String get ourMission => 'Unsere Mission';

  @override
  String get missionDescription =>
      'Um präzise und personalisierte astrologische Einblicke zu bieten, die den Nutzern helfen, fundierte Entscheidungen in ihrem Leben zu treffen.';

  @override
  String get ourVision => 'Unsere Vision';

  @override
  String get visionDescription =>
      'Ziel ist es, die vertrauenswürdigste Astrologie-Plattform zu werden, indem Technologie und uralte Weisheit miteinander verbunden werden.';

  @override
  String get ourValues => 'Unsere Werte';

  @override
  String get valuesDescription =>
      'Integrität, Genauigkeit, nutzerzentriertes Design und kontinuierliche Innovation.';

  @override
  String get contactUs => 'Kontaktieren Sie uns';

  @override
  String get contactEmail => 'E-Mail: support@yourcompany.com';

  @override
  String get contactWebsite => 'Website: www.yourcompany.com';

  @override
  String get customerSupport => 'Kundensupport';

  @override
  String get supportHeroTitle => 'Wir sind hier, um zu helfen.';

  @override
  String get supportHeroDescription =>
      'Füllen Sie das untenstehende Formular aus, und unser Support-Team wird sich schnellstmöglich bei Ihnen melden.';

  @override
  String get yourName => 'Ihr Name';

  @override
  String get yourEmail => 'Ihre E-Mail';

  @override
  String get message => 'Nachricht';

  @override
  String get enterEmail => 'Geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get enterValidEmail => 'Geben Sie eine gültige E-Mail-Adresse ein.';

  @override
  String enterField(Object fieldName) {
    return 'Geben Sie $fieldName ein.';
  }

  @override
  String get send => 'Schicken';

  @override
  String get sending => 'Wird gesendet...';

  @override
  String get emailSentSuccess => '✅ E-Mail erfolgreich versendet!';

  @override
  String get emailSendFailed => '❌ E-Mail konnte nicht gesendet werden';

  @override
  String get astroDictionaryTitle => 'Astro-Wörterbuch';

  @override
  String get searchTermsHint => 'Suchbegriffe...';

  @override
  String get noTermsFound => 'Keine Begriffe gefunden';

  @override
  String get buyQuestionsTitle => 'Kauffragen';

  @override
  String get userNotAuthenticated => 'Benutzer nicht authentifiziert';

  @override
  String get loadStoreDataFailed => 'Fehler beim Laden der Speicherdaten';

  @override
  String get missingAuthToken => 'Fehlendes Authentifizierungstoken';

  @override
  String get merchantDisplayName => 'Astro Chat App';

  @override
  String get paymentSuccessful => '✅ Zahlung erfolgreich! Frage gesendet';

  @override
  String paymentFailed(Object error) {
    return '❌ Zahlung fehlgeschlagen: $error';
  }

  @override
  String get yourBalance => 'Ihr Guthaben';

  @override
  String questionsBalance(Object count) {
    return '$count Fragen';
  }

  @override
  String get availableOffers => 'Verfügbare Angebote';

  @override
  String questionsCount(Object count) {
    return '$count Frage';
  }

  @override
  String get buyButton => 'Kaufen';

  @override
  String get dailyHoroscopeTitle => '🌟 Tageshoroskop';

  @override
  String get userIdMissing => 'Die Benutzer-ID fehlt.';

  @override
  String get fetchHoroscopesFailed =>
      'Horoskope konnten nicht abgerufen werden';

  @override
  String get noHoroscopeFound => 'Kein Horoskop gefunden.';

  @override
  String get signLabel => 'Zeichen';

  @override
  String get todayLabel => 'Heute';

  @override
  String get yesterdayLabel => 'Gestern';

  @override
  String get thisWeekLabel => 'Diese Woche';

  @override
  String get lastMonthLabel => 'Letzter Monat';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Geben Sie Ihre Frage ein...';

  @override
  String get paymentRequired => 'Zahlung erforderlich';

  @override
  String get paymentRequiredMessage =>
      'Sie haben Ihre kostenlosen Fragen aufgebraucht. Zahlen Sie 50 ₹, um fortzufahren.';

  @override
  String get payNowButton => 'Jetzt bezahlen';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count verbleibende freie Fragen';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count verbleibende bezahlte Fragen';
  }

  @override
  String get thankYouFeedback => 'Vielen Dank für Ihr Feedback!';

  @override
  String get ratingSubmitted => 'Bewertung abgegeben!';

  @override
  String get setUserIdFirst => 'Bitte legen Sie zuerst Ihre Benutzer-ID fest.';

  @override
  String get failedToFetchPrevious =>
      'Vorherige Fragen und Antworten konnten nicht abgerufen werden.';

  @override
  String errorOccurred(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get drawerAstroProfile => 'Astroprofil';

  @override
  String get drawerDailyHoroscope => 'Tageshoroskop';

  @override
  String get drawerBuyQuestions => 'Kauffragen';

  @override
  String get drawerAstroDictionary => 'Astro-Wörterbuch';

  @override
  String get drawerSettings => 'Einstellungen';

  @override
  String get drawerCustomerSupport => 'Kundensupport';

  @override
  String get drawerAbout => 'Um';

  @override
  String get drawerProfileSettings => 'Profileinstellungen';

  @override
  String get demoNotificationTitle => '🔔 Demo-Benachrichtigung';

  @override
  String get demoNotificationBody =>
      'Dies ist eine Testbenachrichtigung Ihrer App!';

  @override
  String get notificationsTitle => 'Benachrichtigungen';

  @override
  String get noNotifications => 'Keine Benachrichtigungen';

  @override
  String get allTab => 'Alle';

  @override
  String get markAllAsRead => 'Alle als gelesen markieren';

  @override
  String get notificationMarkedRead => 'Benachrichtigung als gelesen markiert';

  @override
  String get failedToLoadNotifications =>
      'Benachrichtigungen konnten nicht geladen werden';

  @override
  String get failedToMarkRead => 'Fehler beim Markieren als gelesen';

  @override
  String get failedToMarkAllRead =>
      'Alle Artikel konnten nicht als gelesen markiert werden.';

  @override
  String get socketConnected => 'Steckdose angeschlossen';

  @override
  String get socketDisconnected => 'Steckdose getrennt';

  @override
  String get newNotificationReceived => 'Neue Benachrichtigung erhalten';

  @override
  String get generalCategory => 'Allgemein';

  @override
  String get horoscopeCategory => 'Horoskop';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'System';

  @override
  String get updateCategory => 'Aktualisierungen';

  @override
  String get howToAskTitle => 'Wie man fragt';

  @override
  String get noQuestionsAvailable => 'Keine Fragen verfügbar';

  @override
  String get failedToLoadQuestions => 'Fragen konnten nicht geladen werden';

  @override
  String get pullToRefresh => 'Zum Aktualisieren ziehen';

  @override
  String get careerCategory => 'Karriere';

  @override
  String get loveCategory => 'Liebe & Beziehungen';

  @override
  String get healthCategory => 'Gesundheit';

  @override
  String get financeCategory => 'Finanzen';

  @override
  String get familyCategory => 'Familie';

  @override
  String get educationCategory => 'Ausbildung';

  @override
  String get travelCategory => 'Reisen';

  @override
  String get spiritualCategory => 'Spirituell';

  @override
  String get profileLoaded => 'Profil erfolgreich geladen';

  @override
  String get imageUploaded => 'Bild erfolgreich hochgeladen';

  @override
  String get savedInformationConfirmation =>
      'Ich habe diese Informationen gespeichert.';

  @override
  String get noHistoryAvailable => 'Keine Historie verfügbar';

  @override
  String get missingUserIdError => 'Benutzer-ID erforderlich';

  @override
  String get networkError => 'Netzwerkfehler. Bitte versuchen Sie es erneut.';

  @override
  String get timeoutError => 'Zeitüberschreitung der Anfrage';

  @override
  String get genericError => 'Etwas ist schiefgelaufen.';

  @override
  String get reactionUpdateError => 'Reaktion konnte nicht aktualisiert werden';

  @override
  String get noSearchResults => 'Es wurden keine Suchergebnisse gefunden.';

  @override
  String get clearSearch => 'Suche löschen';

  @override
  String get resultsFound => 'Ergebnisse gefunden';

  @override
  String get recoverySecretHint =>
      'Kopieren und Einfügen funktioniert möglicherweise nicht, bitte manuell eingeben.';

  @override
  String get recoverAccountDescription =>
      'Befolgen Sie diese Schritte, um Ihr Konto wiederherzustellen.';

  @override
  String get processingLabel => 'Verarbeitung...';

  @override
  String get clearChatSuccess => 'Chat erfolgreich gelöscht';

  @override
  String get notificationsEnabled => 'Benachrichtigungen aktiviert';

  @override
  String get notificationsDisabled => 'Benachrichtigungen deaktiviert';

  @override
  String get securityNotice =>
      'Ihre Daten werden sicher verschlüsselt und gespeichert.';

  @override
  String get loading => 'Laden...';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get onboardingGetStartedDesc =>
      'Beginnen Sie, indem Sie Ihre Sprache auswählen.';

  @override
  String get accountRecoveryTitle => '🔐 Details zur Kontowiederherstellung';

  @override
  String get recoveryInstructions =>
      'Bitte bewahren Sie diese Informationen sicher auf. Sie benötigen sie, um Ihr Konto wiederherzustellen.';

  @override
  String get importantNotice => '⚠️ Wichtig:';

  @override
  String get astrologerProfileTitle => 'Astrologenprofil';

  @override
  String get personalAstrologer => 'Persönlicher Astrologe';

  @override
  String get makePersonalAstrologer => 'Persönlichen Astrologen erstellen';

  @override
  String get favoriteDescription =>
      'Ihre Fragen werden diesem Astrologen vorrangig vorgelegt. Sollte dieser nicht verfügbar sein, wird Ihnen ein anderer qualifizierter Astrologe weiterhelfen.';

  @override
  String get educationQualifications => 'Ausbildung & Qualifikationen';

  @override
  String get aboutSection => 'Um';

  @override
  String get shareProfile => 'Profil teilen';

  @override
  String get loadingAstrologer => 'Astrologendetails werden geladen...';

  @override
  String get failedToLoadAstrologer =>
      'Astrologendetails konnten nicht geladen werden';

  @override
  String get authenticationRequired =>
      'Authentifizierung erforderlich. Bitte melden Sie sich an.';

  @override
  String securityCheckFailed(Object error) {
    return 'Sicherheitsprüfung fehlgeschlagen: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ist jetzt Ihr persönlicher Astrologe';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ $name aus den Favoriten entfernt';
  }

  @override
  String get toggleFavoriteError =>
      'Status der Favoriten konnte nicht aktualisiert werden';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Ausbildung: $education\n📜 Qualifikation: $qualification\n⏳ Berufserfahrung: $experience';
  }

  @override
  String get notProvided => 'Nicht angegeben';

  @override
  String reviews(Object count) {
    return '($count Rezensionen)';
  }

  @override
  String get specialties => 'Spezialgebiete';

  @override
  String get experience => 'Erfahrung';

  @override
  String get qualification => 'Qualifikation';

  @override
  String get education => 'Ausbildung';

  @override
  String get recoveryTips =>
      '• Erstellen Sie einen Screenshot dieser Informationen.\n\n• Bewahren Sie ihn an einem sicheren Ort auf.\n\n• Geben Sie ihn nicht an Dritte weiter.\n\nDiese Information wird nur einmal angezeigt.';
}
