// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get notificationSettings => 'Impostazioni di notifica';

  @override
  String get privacySettings => 'Impostazioni sulla privacy';

  @override
  String get accountSettings => 'Impostazioni dell\'account';

  @override
  String get languageSettings => 'Impostazioni della lingua';

  @override
  String get languageChanged => 'Lingua cambiata';

  @override
  String get existingUserButton => 'Sono un utente esistente';

  @override
  String get chooseCountryTitle => 'Scegli il Paese';

  @override
  String get yesText => 'SÌ';

  @override
  String get noText => 'NO';

  @override
  String get appBarTitle => 'Impostazioni del profilo';

  @override
  String get userIdLabel => 'ID utente *';

  @override
  String get nameLabel => 'Nome';

  @override
  String get birthCountryLabel => 'Paese di nascita';

  @override
  String get birthCityLabel => 'Città di nascita';

  @override
  String get countrySelectionTitle => 'Scegli il tuo paese';

  @override
  String get maleLabel => 'Maschio';

  @override
  String get femaleLabel => 'Femmina';

  @override
  String get birthDateLabel => 'Data di nascita';

  @override
  String get birthDatePlaceholder => 'Seleziona la data di nascita';

  @override
  String get birthTimeLabel => 'Ora di nascita';

  @override
  String get birthTimePlaceholder => 'Seleziona l\'ora di nascita';

  @override
  String get saveProfileButton => 'Salva profilo';

  @override
  String get noCitiesFound => 'Nessuna città trovata';

  @override
  String cityPlaceholder(Object country) {
    return 'Inserisci la città in $country';
  }

  @override
  String get countryFirstPlaceholder => 'Seleziona prima il paese';

  @override
  String get versionHistoryTitle => 'Cronologia delle versioni';

  @override
  String get notSetText => 'Non impostato';

  @override
  String nameHistory(Object name) {
    return 'Nome: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Città: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'Paese: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Genere: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data di nascita: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Ora di nascita: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Posizione: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Fuso orario: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'Ora legale: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Stato: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Aggiornato il $date';
  }

  @override
  String get userIdRequired => 'È richiesto l\'ID utente';

  @override
  String get profileSaved => 'Profilo salvato con successo';

  @override
  String get saveFailed => 'Impossibile salvare il profilo';

  @override
  String get errorPrefix => 'Errore:';

  @override
  String get onboardingChooseLanguage => 'Scegli la tua lingua';

  @override
  String get onboardingChooseLanguageDesc =>
      'Seleziona la lingua preferita per continuare.';

  @override
  String get onboardingWhatIsAstrology => 'Cos\'è l\'astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'L\'astrologia è l\'antico studio dei movimenti celesti e della loro influenza sulla vita umana, offrendo spunti di riflessione sulla personalità, sulle relazioni e sugli eventi della vita.';

  @override
  String get onboardingWhyUseApp => 'Perché usare questa app?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Ricevi oroscopi accurati, generati da persone e personalizzati in base al tuo tema natale. Prendi decisioni consapevoli con previsioni quotidiane e consigli personalizzati da astrologi esperti.';

  @override
  String get onboardingHowToUse => 'Come utilizzare questa app?';

  @override
  String get onboardingHowToUseDesc =>
      'Inserisci semplicemente la tua data di nascita, l\'ora esatta, il luogo di nascita e qualsiasi altro dettaglio rilevante per iniziare subito. Esplora gli oroscopi giornalieri, poni domande ad astrologi esperti e gestisci il tuo profilo per previsioni precise e personalizzate, senza dover effettuare l\'accesso.';

  @override
  String get onboardingGetStarted => 'Per iniziare';

  @override
  String get onboardingNewUser => 'Nuovo utente';

  @override
  String get onboardingExistingUser => 'Utente esistente';

  @override
  String get onboardingBack => 'Indietro';

  @override
  String get onboardingNext => 'Prossimo';

  @override
  String get userIdNotFound =>
      'ID utente non trovato. Accedi o imposta il tuo profilo.';

  @override
  String get clearNotificationsTitle => 'Cancella notifiche';

  @override
  String get clearNotificationsMessage =>
      'Vuoi davvero cancellare tutte le notifiche?';

  @override
  String get clearNotificationsSuccess =>
      'Tutte le notifiche sono state cancellate correttamente.';

  @override
  String get clearHoroscopeTitle => 'Oroscopo chiaro';

  @override
  String get clearHoroscopeMessage =>
      'Sei sicuro di voler cancellare i dati del tuo oroscopo?';

  @override
  String get clearHoroscopeSuccess => 'Oroscopo cancellato con successo.';

  @override
  String get clearChatTitle => 'Cancella cronologia chat';

  @override
  String get clearChatMessage =>
      'Sei sicuro di voler eliminare tutta la cronologia delle chat?';

  @override
  String get clearChatLocal => 'Chat cancellata localmente.';

  @override
  String get deleteAccountTitle => 'Elimina account';

  @override
  String get deleteAccountMessage =>
      'Vuoi davvero eliminare il tuo account? Questa operazione cancellerà anche la cronologia delle chat e le notifiche.';

  @override
  String get deleteAccountSuccess =>
      'Il tuo account e tutti i dati sono stati rimossi.';

  @override
  String get deleteAccountError =>
      'Errore durante l\'eliminazione dell\'account';

  @override
  String get logoutTitle => 'Esci';

  @override
  String get logoutMessage => 'Sei sicuro di voler uscire?';

  @override
  String get termsPrivacyTitle => 'Termini e privacy';

  @override
  String get privacyPolicyTitle => 'politica sulla riservatezza';

  @override
  String get termsConditionsTitle => 'Termini e condizioni';

  @override
  String get dataControlTitle => 'Controllo dei dati';

  @override
  String get cancelButton => 'Cancellare';

  @override
  String get confirmButton => 'Confermare';

  @override
  String get clearQuestionsSuccess =>
      'Tutte le domande sono state eliminate correttamente.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Signore';

  @override
  String get startLabel => 'Inizio';

  @override
  String get recoverAccount => 'Recupera account';

  @override
  String get endLabel => 'FINE';

  @override
  String get startDateLabel => 'Data di inizio';

  @override
  String get endDateLabel => 'Data di fine';

  @override
  String get notAvailable => 'Non disponibile';

  @override
  String get noData => 'Nessun dato';

  @override
  String get unknownError => 'Errore sconosciuto';

  @override
  String get retryButton => 'Riprova';

  @override
  String get kundaliGeneratorTitle => 'Generatore di Kundali';

  @override
  String get natalChartTitle => 'Tema Natale';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Grado ascendente';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get clearHoroscope => 'Oroscopo chiaro';

  @override
  String get clearNotifications => 'Cancella notifiche';

  @override
  String get clearChatHistory => 'Cancella cronologia chat';

  @override
  String get logout => 'Esci';

  @override
  String get deleteAccount => 'Elimina account';

  @override
  String get allFieldsRequired => 'Tutti i campi sono obbligatori.';

  @override
  String get accountRecoveredSuccess => 'Account recuperato con successo.';

  @override
  String get recoveryFailed =>
      'Recupero fallito. Controlla le tue informazioni.';

  @override
  String get recoverySecretLabel => 'Segreto di recupero:';

  @override
  String get aboutUsTitle => 'Chi siamo';

  @override
  String get aboutOurCompany => 'Informazioni sulla nostra azienda';

  @override
  String get aboutCompanyDescription =>
      'Da Karma, ti aiutiamo a scoprire il tuo vero percorso di vita attraverso la saggezza senza tempo dell\'astrologia vedica. Ogni intuizione proviene da astrologi veri ed esperti, ed è accuratamente elaborata in base al tuo tema natale unico. Dagli oroscopi giornalieri alla guida personalizzata, Karma rende la conoscenza antica accessibile in oltre 100 lingue.';

  @override
  String get ourMission => 'La nostra missione';

  @override
  String get missionDescription =>
      'La nostra missione è semplice: fornire una guida astrologica autentica e guidata da persone vere, che ti aiuti a prendere decisioni consapevoli e consapevoli. Ogni previsione e consulenza riflette anni di esperienza professionale, non algoritmi automatizzati.';

  @override
  String get ourVision => 'La nostra visione';

  @override
  String get visionDescription =>
      'Ci impegniamo a essere la piattaforma più affidabile al mondo per l\'astrologia vedica, aiutando le persone di tutto il mondo a comprendere se stesse, le proprie scelte e il proprio percorso di vita con chiarezza e sicurezza.';

  @override
  String get ourValues => 'I nostri valori';

  @override
  String get valuesDescription =>
      'Noi di Karma diamo valore all\'autenticità, alla precisione e alla fiducia. Ci impegniamo a offrire una guida non solo accurata, ma anche significativa, aiutandovi ad affrontare la vita con intuito e sicurezza.';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get contactEmail => 'E-mail: care@karmalifepath.com';

  @override
  String get contactWebsite => 'Sito web: www.karmalifepath.com';

  @override
  String get customerSupport => 'Assistenza clienti';

  @override
  String get supportHeroTitle => 'Siamo qui per aiutarti';

  @override
  String get supportHeroDescription =>
      'Compila il modulo sottostante e il nostro team di supporto ti risponderà il prima possibile.';

  @override
  String get yourName => 'Il tuo nome';

  @override
  String get yourEmail => 'La tua email';

  @override
  String get message => 'Messaggio';

  @override
  String get enterEmail => 'Inserisci la tua email';

  @override
  String get enterValidEmail => 'Inserisci un indirizzo email valido';

  @override
  String enterField(Object fieldName) {
    return 'Inserisci $fieldName';
  }

  @override
  String get send => 'Inviare';

  @override
  String get sending => 'Invio in corso...';

  @override
  String get emailSentSuccess => '✅ Email inviata con successo!';

  @override
  String get emailSendFailed => '❌ Impossibile inviare l\'e-mail';

  @override
  String get astroDictionaryTitle => 'Dizionario Astrologico';

  @override
  String get searchTermsHint => 'Termini di ricerca...';

  @override
  String get noTermsFound => 'Nessun termine trovato';

  @override
  String get buyQuestionsTitle => 'Acquista Domande';

  @override
  String get userNotAuthenticated => 'Utente non autenticato';

  @override
  String get loadStoreDataFailed => 'Impossibile caricare i dati del negozio';

  @override
  String get missingAuthToken => 'Token di autorizzazione mancante';

  @override
  String get merchantDisplayName => 'App Astro Chat';

  @override
  String get paymentSuccessful => '✅ Pagamento effettuato! Domanda inviata';

  @override
  String paymentFailed(Object error) {
    return '❌ Pagamento non riuscito: $error';
  }

  @override
  String get yourBalance => 'Il tuo saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Domande';
  }

  @override
  String get availableOffers => 'Offerte disponibili';

  @override
  String questionsCount(Object count) {
    return '$count Domanda';
  }

  @override
  String get buyButton => 'Acquistare';

  @override
  String get dailyHoroscopeTitle => ' Oroscopo del giorno';

  @override
  String get userIdMissing => 'ID utente mancante';

  @override
  String get fetchHoroscopesFailed => 'Impossibile recuperare gli oroscopi';

  @override
  String get noHoroscopeFound => 'Nessun oroscopo trovato.';

  @override
  String get signLabel => 'Cartello';

  @override
  String get todayLabel => 'Oggi';

  @override
  String get yesterdayLabel => 'Ieri';

  @override
  String get thisWeekLabel => 'Questa settimana';

  @override
  String get lastMonthLabel => 'Il mese scorso';

  @override
  String get chatTitle => 'Chiacchierata';

  @override
  String get typeYourQuestionHint => 'Scrivi la tua domanda...';

  @override
  String get paymentRequired => 'Pagamento richiesto';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Hai utilizzato le tue domande gratuite. Paga $amount per continuare.';
  }

  @override
  String get payNowButton => 'Paga ora';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count domande gratuite rimanenti';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count domande a pagamento rimanenti';
  }

  @override
  String get thankYouFeedback => 'Grazie per il tuo feedback!';

  @override
  String get ratingSubmitted => 'Valutazione inviata!';

  @override
  String get setUserIdFirst => 'Per prima cosa imposta il tuo ID utente';

  @override
  String get failedToFetchPrevious =>
      'Impossibile recuperare le domande e le risposte precedenti';

  @override
  String errorOccurred(Object error) {
    return 'Errore: $error';
  }

  @override
  String get drawerAstroProfile => 'Profilo astrologico';

  @override
  String get drawerDailyHoroscope => 'Oroscopo del giorno';

  @override
  String get drawerBuyQuestions => 'Acquista Domande';

  @override
  String get drawerAstroDictionary => 'Dizionario Astrologico';

  @override
  String get drawerSettings => 'Impostazioni';

  @override
  String get drawerCustomerSupport => 'Assistenza clienti';

  @override
  String get drawerAbout => 'Di';

  @override
  String get drawerProfileSettings => 'Impostazioni del profilo';

  @override
  String get demoNotificationTitle => '🔔 Notifica demo';

  @override
  String get demoNotificationBody =>
      'Questa è una notifica di prova dalla tua app!';

  @override
  String get notificationsTitle => 'Notifiche';

  @override
  String get noNotifications => 'Nessuna notifica';

  @override
  String get allTab => 'Tutto';

  @override
  String get markAllAsRead => 'Segna tutto come letto';

  @override
  String get notificationMarkedRead => 'Notifica contrassegnata come letta';

  @override
  String get failedToLoadNotifications => 'Impossibile caricare le notifiche';

  @override
  String get failedToMarkRead => 'Impossibile contrassegnare come letto';

  @override
  String get failedToMarkAllRead =>
      'Impossibile contrassegnare tutto come letto';

  @override
  String get socketConnected => 'Presa collegata';

  @override
  String get socketDisconnected => 'Presa scollegata';

  @override
  String get newNotificationReceived => 'Nuova notifica ricevuta';

  @override
  String get generalCategory => 'Generale';

  @override
  String get horoscopeCategory => 'Oroscopo';

  @override
  String get chatCategory => 'Chiacchierata';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Aggiornamenti';

  @override
  String get howToAskTitle => 'Come chiedere';

  @override
  String get noQuestionsAvailable => 'Nessuna domanda disponibile';

  @override
  String get failedToLoadQuestions => 'Impossibile caricare le domande';

  @override
  String get pullToRefresh => 'Tirare per aggiornare';

  @override
  String get careerCategory => 'Carriera';

  @override
  String get loveCategory => 'Amore e relazioni';

  @override
  String get healthCategory => 'Salute';

  @override
  String get financeCategory => 'Finanza';

  @override
  String get familyCategory => 'Famiglia';

  @override
  String get educationCategory => 'Istruzione';

  @override
  String get travelCategory => 'Viaggio';

  @override
  String get spiritualCategory => 'Spirituale';

  @override
  String get profileLoaded => 'Profilo caricato con successo';

  @override
  String get imageUploaded => 'Immagine caricata con successo';

  @override
  String get savedInformationConfirmation => 'Ho salvato queste informazioni';

  @override
  String get noHistoryAvailable => 'Nessuna cronologia disponibile';

  @override
  String get missingUserIdError => 'È richiesto l\'ID utente';

  @override
  String get networkError => 'Errore di rete. Riprova.';

  @override
  String get timeoutError => 'Richiesta scaduta';

  @override
  String get genericError => 'Qualcosa è andato storto';

  @override
  String get reactionUpdateError => 'Impossibile aggiornare la reazione';

  @override
  String get noSearchResults => 'Nessun risultato trovato';

  @override
  String get clearSearch => 'Cancella ricerca';

  @override
  String get resultsFound => 'Risultati trovati';

  @override
  String get recoverySecretHint =>
      'Copia e incolla potrebbe non funzionare, digita manualmente';

  @override
  String get recoverAccountDescription =>
      'Segui questi passaggi per recuperare il tuo account';

  @override
  String get processingLabel => 'Elaborazione in corso...';

  @override
  String get clearChatSuccess => 'Chat cancellata con successo';

  @override
  String get notificationsEnabled => 'Notifiche abilitate';

  @override
  String get notificationsDisabled => 'Notifiche disabilitate';

  @override
  String get securityNotice =>
      'I tuoi dati sono crittografati e archiviati in modo sicuro';

  @override
  String get loading => 'Caricamento...';

  @override
  String get selectLanguage => 'Seleziona la lingua';

  @override
  String get onboardingGetStartedDesc => 'Inizia scegliendo la tua lingua';

  @override
  String get accountRecoveryTitle => '🔐 Dettagli sul recupero dell\'account';

  @override
  String get recoveryInstructions =>
      'Conserva queste informazioni in modo sicuro. Ti serviranno per recuperare il tuo account.';

  @override
  String get importantNotice => '⚠️ Importante:';

  @override
  String get astrologerProfileTitle => 'Profilo dell\'astrologo';

  @override
  String get personalAstrologer => 'Astrologo personale';

  @override
  String get makePersonalAstrologer => 'Diventa un astrologo personale';

  @override
  String get favoriteDescription =>
      'Le tue domande saranno indirizzate prioritariamente a questo astrologo. Se non disponibile, un altro astrologo qualificato ti assisterà.';

  @override
  String get educationQualifications => 'Istruzione e qualifiche';

  @override
  String get aboutSection => 'Di';

  @override
  String get shareProfile => 'Condividi profilo';

  @override
  String get loadingAstrologer => 'Caricamento dettagli astrologo...';

  @override
  String get failedToLoadAstrologer =>
      'Impossibile caricare i dettagli dell\'astrologo';

  @override
  String get authenticationRequired =>
      'Autenticazione richiesta. Effettua l\'accesso.';

  @override
  String securityCheckFailed(Object error) {
    return 'Controllo di sicurezza fallito: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name è ora il tuo astrologo personale';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Rimosso $name dai preferiti';
  }

  @override
  String get toggleFavoriteError => 'Impossibile aggiornare lo stato preferito';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Istruzione: $education\n📜 Qualifica: $qualification\n⏳ Esperienza: $experience';
  }

  @override
  String get notProvided => 'Non fornito';

  @override
  String reviews(Object count) {
    return '($count recensioni)';
  }

  @override
  String get specialties => 'Specialità';

  @override
  String get experience => 'Esperienza';

  @override
  String get qualification => 'Qualificazione';

  @override
  String get education => 'Istruzione';

  @override
  String get recoveryTips =>
      '• Fai uno screenshot di queste informazioni\n• Conservale in un luogo sicuro\n• Non condividerle con nessuno\n• Verranno mostrate solo una volta';

  @override
  String get themeSettingsTitle => 'Impostazioni del tema';

  @override
  String get lightThemeLabel => 'Leggero';

  @override
  String get lightThemeDescription => 'Usa sempre il tema chiaro';

  @override
  String get darkThemeLabel => 'Buio';

  @override
  String get darkThemeDescription => 'Usa sempre il tema scuro';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription =>
      'Segui le impostazioni di sistema per il tema scuro';

  @override
  String get systemThemeLightDescription =>
      'Segui le impostazioni di sistema per il tema chiaro';

  @override
  String get switchToLight => 'Passa alla luce';

  @override
  String get switchToDark => 'Passa a Scuro';

  @override
  String get ourTeam => 'Il nostro team';

  @override
  String get teamDescription =>
      'Il nostro team di astrologi vedici professionisti vanta anni di esperienza nell\'interpretazione delle influenze planetarie e dei modelli di vita. Grazie al supporto di un team di supporto e sviluppo dedicato, Karma offre un\'esperienza fluida, affidabile e globale per ogni utente.';
}
