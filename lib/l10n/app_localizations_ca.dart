// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get notificationSettings => 'Configuració de notificacions';

  @override
  String get privacySettings => 'Configuració de privadesa';

  @override
  String get accountSettings => 'Configuració del compte';

  @override
  String get languageSettings => 'Configuració d\'idioma';

  @override
  String get languageChanged => 'L\'idioma ha canviat';

  @override
  String get existingUserButton => 'Ja sóc un usuari';

  @override
  String get chooseCountryTitle => 'Tria el país';

  @override
  String get yesText => 'Sí';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Configuració del perfil';

  @override
  String get userIdLabel => 'ID d\'usuari *';

  @override
  String get nameLabel => 'Nom';

  @override
  String get birthCountryLabel => 'País de naixement';

  @override
  String get birthCityLabel => 'Ciutat de naixement';

  @override
  String get countrySelectionTitle => 'Tria el teu país';

  @override
  String get maleLabel => 'Masculí';

  @override
  String get femaleLabel => 'Dona';

  @override
  String get birthDateLabel => 'Data de naixement';

  @override
  String get birthDatePlaceholder => 'Selecciona la data de naixement';

  @override
  String get birthTimeLabel => 'Hora de naixement';

  @override
  String get birthTimePlaceholder => 'Selecciona l\'hora de naixement';

  @override
  String get saveProfileButton => 'Desa el perfil';

  @override
  String get noCitiesFound => 'No s\'han trobat ciutats';

  @override
  String cityPlaceholder(Object country) {
    return 'Introduïu la ciutat a $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selecciona primer el país';

  @override
  String get versionHistoryTitle => 'Historial de versions';

  @override
  String get notSetText => 'No definit';

  @override
  String nameHistory(Object name) {
    return 'Nom: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Ciutat: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'País: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Gènere: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data de naixement: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hora de naixement: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Ubicació: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Fus horari: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Estat: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Actualitzat el $date';
  }

  @override
  String get userIdRequired => 'Cal l\'ID d\'usuari';

  @override
  String get profileSaved => 'El perfil s\'ha desat correctament';

  @override
  String get saveFailed => 'No s\'ha pogut desar el perfil';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Trieu el vostre idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Seleccioneu el vostre idioma preferit per continuar.';

  @override
  String get onboardingWhatIsAstrology => 'Què és l\'astrologia?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'L\'astrologia és l\'estudi dels cossos celestes...';

  @override
  String get onboardingWhyUseApp => 'Per què utilitzar aquesta aplicació?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Obtén horòscops personalitzats, prediccions diàries i orientació per prendre decisions informades.';

  @override
  String get onboardingHowToUse => 'Com s\'utilitza aquesta aplicació?';

  @override
  String get onboardingHowToUseDesc =>
      'Navega fàcilment, consulta els horòscops diaris i gestiona el teu perfil per obtenir prediccions precises.';

  @override
  String get onboardingGetStarted => 'Començar';

  @override
  String get onboardingNewUser => 'Nou usuari';

  @override
  String get onboardingExistingUser => 'Usuari existent';

  @override
  String get onboardingBack => 'Enrere';

  @override
  String get onboardingNext => 'Següent';

  @override
  String get userIdNotFound =>
      'No s\'ha trobat l\'ID d\'usuari. Si us plau, inicia la sessió o configura el teu perfil.';

  @override
  String get clearNotificationsTitle => 'Esborrar notificacions';

  @override
  String get clearNotificationsMessage =>
      'Esteu segur que voleu esborrar totes les notificacions?';

  @override
  String get clearNotificationsSuccess =>
      'Totes les notificacions s\'han esborrat correctament.';

  @override
  String get clearHoroscopeTitle => 'Horòscop clar';

  @override
  String get clearHoroscopeMessage =>
      'Esteu segur que voleu esborrar les dades del vostre horòscop?';

  @override
  String get clearHoroscopeSuccess => 'Horòscop esborrat correctament.';

  @override
  String get clearChatTitle => 'Esborra l\'historial de xats';

  @override
  String get clearChatMessage =>
      'Esteu segur que voleu suprimir tot l\'historial de xat?';

  @override
  String get clearChatLocal => 'Xat esborrat localment.';

  @override
  String get deleteAccountTitle => 'Suprimeix el compte';

  @override
  String get deleteAccountMessage =>
      'Segur que vols eliminar el teu compte? Això també esborrarà tot l\'historial de xat i les notificacions.';

  @override
  String get deleteAccountSuccess =>
      'El vostre compte i totes les dades s\'han eliminat.';

  @override
  String get deleteAccountError =>
      'S\'ha produït un error en suprimir el compte';

  @override
  String get logoutTitle => 'Tanca la sessió';

  @override
  String get logoutMessage => 'Esteu segur que voleu tancar la sessió?';

  @override
  String get termsPrivacyTitle => 'Termes i privadesa';

  @override
  String get privacyPolicyTitle => 'Política de privacitat';

  @override
  String get termsConditionsTitle => 'Termes i condicions';

  @override
  String get dataControlTitle => 'Control de dades';

  @override
  String get cancelButton => 'Cancel·la';

  @override
  String get confirmButton => 'Confirma';

  @override
  String get clearQuestionsSuccess =>
      'Totes les preguntes s\'han suprimit correctament.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Senyor';

  @override
  String get startLabel => 'Inici';

  @override
  String get recoverAccount => 'Recuperar compte';

  @override
  String get endLabel => 'Final';

  @override
  String get startDateLabel => 'Data d\'inici';

  @override
  String get endDateLabel => 'Data de finalització';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get noData => 'Sense dades';

  @override
  String get unknownError => 'Error desconegut';

  @override
  String get retryButton => 'Torna-ho a intentar';

  @override
  String get kundaliGeneratorTitle => 'Generador de Kundali';

  @override
  String get natalChartTitle => 'Carta Natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Raixi';

  @override
  String get ascDegreeLabel => 'Grau d\'Ascendent';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Desconegut';

  @override
  String get clearHoroscope => 'Horòscop clar';

  @override
  String get clearNotifications => 'Esborrar notificacions';

  @override
  String get clearChatHistory => 'Esborra l\'historial de xats';

  @override
  String get logout => 'Tanca la sessió';

  @override
  String get deleteAccount => 'Suprimeix el compte';

  @override
  String get allFieldsRequired => 'Tots els camps són obligatoris.';

  @override
  String get accountRecoveredSuccess => 'Compte recuperat correctament.';

  @override
  String get recoveryFailed =>
      'La recuperació ha fallat. Revisa la teva informació.';

  @override
  String get recoverySecretLabel => 'Secret de recuperació:';

  @override
  String get aboutUsTitle => 'Sobre nosaltres';

  @override
  String get aboutOurCompany => 'Sobre la nostra empresa';

  @override
  String get aboutCompanyDescription =>
      'A Karma, t\'ajudem a descobrir el teu veritable camí de vida a través de la saviesa atemporal de l\'astrologia vèdica. Cada perspectiva prové d\'astròlegs reals i experimentats, elaborats acuradament en funció de la teva carta natal única. Des d\'horòscops diaris fins a una guia personalitzada, Karma fa que el coneixement antic sigui accessible en més de 100 idiomes.';

  @override
  String get ourMission => 'La nostra missió';

  @override
  String get missionDescription =>
      'La nostra missió és simple: proporcionar una guia astrològica autèntica i dirigida per humans que us permeti prendre decisions informades i segures. Cada predicció i consulta reflecteix anys d\'experiència professional, no algoritmes automatitzats.';

  @override
  String get ourVision => 'La nostra visió';

  @override
  String get visionDescription =>
      'Ens esforcem per ser la plataforma més fiable del món per a l\'astrologia vèdica, ajudant a persones de tot arreu a entendre\'s a si mateixes, les seves eleccions i el seu viatge vital amb claredat i confiança.';

  @override
  String get ourValues => 'Els nostres valors';

  @override
  String get valuesDescription =>
      'A Karma, valorem l\'autenticitat, la precisió i la confiança. Ens comprometem a oferir una guia que no només sigui precisa sinó també significativa, ajudant-vos a navegar per la vida amb perspicàcia i confiança.';

  @override
  String get contactUs => 'Contacta amb nosaltres';

  @override
  String get contactEmail => 'Correu electrònic: support@yourcompany.com';

  @override
  String get contactWebsite => 'Lloc web: www.latevaempresa.com';

  @override
  String get customerSupport => 'Atenció al client';

  @override
  String get supportHeroTitle => 'Som aquí per ajudar';

  @override
  String get supportHeroDescription =>
      'Empleneu el formulari següent i el nostre equip d\'assistència us respondrà el més aviat possible.';

  @override
  String get yourName => 'El vostre nom';

  @override
  String get yourEmail => 'El vostre correu electrònic';

  @override
  String get message => 'Missatge';

  @override
  String get enterEmail => 'Introdueix el teu correu electrònic';

  @override
  String get enterValidEmail => 'Introduïu una adreça electrònica vàlida';

  @override
  String enterField(Object fieldName) {
    return 'Introduïu $fieldName';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sending => 'Enviant...';

  @override
  String get emailSentSuccess => '✅ Correu electrònic enviat correctament!';

  @override
  String get emailSendFailed => '❌ No s\'ha pogut enviar el correu electrònic';

  @override
  String get astroDictionaryTitle => 'Diccionari d\'astrologia';

  @override
  String get searchTermsHint => 'Termes de cerca...';

  @override
  String get noTermsFound => 'No s\'han trobat termes';

  @override
  String get buyQuestionsTitle => 'Preguntes de compra';

  @override
  String get userNotAuthenticated => 'Usuari no autenticat';

  @override
  String get loadStoreDataFailed =>
      'No s\'han pogut carregar les dades de la botiga';

  @override
  String get missingAuthToken => 'Falta el testimoni d\'autorització';

  @override
  String get merchantDisplayName => 'Aplicació de xat Astro';

  @override
  String get paymentSuccessful => '✅ Pagament correcte! Pregunta enviada';

  @override
  String paymentFailed(Object error) {
    return '❌ El pagament ha fallat: $error';
  }

  @override
  String get yourBalance => 'El vostre saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Preguntes';
  }

  @override
  String get availableOffers => 'Ofertes disponibles';

  @override
  String questionsCount(Object count) {
    return '$count Pregunta';
  }

  @override
  String get buyButton => 'Comprar';

  @override
  String get dailyHoroscopeTitle => '🌟 Horòscop diari';

  @override
  String get userIdMissing => 'Falta l\'ID d\'usuari';

  @override
  String get fetchHoroscopesFailed => 'No s\'han pogut obtenir els horòscops';

  @override
  String get noHoroscopeFound => 'No s\'ha trobat cap horòscop.';

  @override
  String get signLabel => 'Signa';

  @override
  String get todayLabel => 'Avui';

  @override
  String get yesterdayLabel => 'Ahir';

  @override
  String get thisWeekLabel => 'Aquesta setmana';

  @override
  String get lastMonthLabel => 'El mes passat';

  @override
  String get chatTitle => 'Xat';

  @override
  String get typeYourQuestionHint => 'Escriu la teva pregunta...';

  @override
  String get paymentRequired => 'Pagament requerit';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Has utilitzat les teves preguntes gratuïtes. Paga a $amount per continuar.';
  }

  @override
  String get payNowButton => 'Paga ara';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count preguntes lliures restants';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count preguntes de pagament restants';
  }

  @override
  String get thankYouFeedback => 'Gràcies pels teus comentaris!';

  @override
  String get ratingSubmitted => 'Valoració enviada!';

  @override
  String get setUserIdFirst =>
      'Si us plau, primer configureu el vostre ID d\'usuari';

  @override
  String get failedToFetchPrevious =>
      'No s\'han pogut recuperar les preguntes i respostes anteriors';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Perfil d\'astro';

  @override
  String get drawerDailyHoroscope => 'Horòscop diari';

  @override
  String get drawerBuyQuestions => 'Preguntes de compra';

  @override
  String get drawerAstroDictionary => 'Diccionari d\'astrologia';

  @override
  String get drawerSettings => 'Configuració';

  @override
  String get drawerCustomerSupport => 'Atenció al client';

  @override
  String get drawerAbout => 'Sobre';

  @override
  String get drawerProfileSettings => 'Configuració del perfil';

  @override
  String get demoNotificationTitle => '🔔 Notificació de demostració';

  @override
  String get demoNotificationBody =>
      'Aquesta és una notificació de prova de la teva aplicació!';

  @override
  String get notificationsTitle => 'Notificacions';

  @override
  String get noNotifications => 'Sense notificacions';

  @override
  String get allTab => 'Tot';

  @override
  String get markAllAsRead => 'Marca-ho tot com a llegit';

  @override
  String get notificationMarkedRead => 'Notificació marcada com a llegida';

  @override
  String get failedToLoadNotifications =>
      'No s\'han pogut carregar les notificacions';

  @override
  String get failedToMarkRead => 'No s\'ha pogut marcar com llegit';

  @override
  String get failedToMarkAllRead => 'No s\'ha pogut marcar tot com a llegit';

  @override
  String get socketConnected => 'Presa connectada';

  @override
  String get socketDisconnected => 'Presa desconnectada';

  @override
  String get newNotificationReceived => 'Nova notificació rebuda';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horòscop';

  @override
  String get chatCategory => 'Xat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Actualitzacions';

  @override
  String get howToAskTitle => 'Com preguntar';

  @override
  String get noQuestionsAvailable => 'No hi ha preguntes disponibles';

  @override
  String get failedToLoadQuestions => 'No s\'han pogut carregar les preguntes';

  @override
  String get pullToRefresh => 'Estireu per actualitzar';

  @override
  String get careerCategory => 'Carrera professional';

  @override
  String get loveCategory => 'Amor i relacions';

  @override
  String get healthCategory => 'Salut';

  @override
  String get financeCategory => 'Finances';

  @override
  String get familyCategory => 'Família';

  @override
  String get educationCategory => 'Educació';

  @override
  String get travelCategory => 'Viatge';

  @override
  String get spiritualCategory => 'Espiritual';

  @override
  String get profileLoaded => 'El perfil s\'ha carregat correctament';

  @override
  String get imageUploaded => 'La imatge s\'ha carregat correctament';

  @override
  String get savedInformationConfirmation => 'He desat aquesta informació';

  @override
  String get noHistoryAvailable => 'No hi ha historial disponible';

  @override
  String get missingUserIdError => 'Cal l\'ID d\'usuari';

  @override
  String get networkError => 'Error de xarxa. Si us plau, torna-ho a intentar.';

  @override
  String get timeoutError =>
      'S\'ha esgotat el temps d\'espera de la sol·licitud';

  @override
  String get genericError => 'Alguna cosa ha anat malament';

  @override
  String get reactionUpdateError => 'No s\'ha pogut actualitzar la reacció';

  @override
  String get noSearchResults => 'No s\'han trobat resultats de cerca';

  @override
  String get clearSearch => 'Esborra la cerca';

  @override
  String get resultsFound => 'Resultats trobats';

  @override
  String get recoverySecretHint =>
      'Pot ser que copiar i enganxar no funcioni, escriviu manualment.';

  @override
  String get recoverAccountDescription =>
      'Segueix aquests passos per recuperar el teu compte';

  @override
  String get processingLabel => 'Processant...';

  @override
  String get clearChatSuccess => 'El xat s\'ha esborrat correctament';

  @override
  String get notificationsEnabled => 'Notificacions activades';

  @override
  String get notificationsDisabled => 'Notificacions desactivades';

  @override
  String get securityNotice =>
      'Les teves dades estan xifrades i emmagatzemades de manera segura';

  @override
  String get loading => 'S\'està carregant...';

  @override
  String get selectLanguage => 'Selecciona l\'idioma';

  @override
  String get onboardingGetStartedDesc => 'Comença triant el teu idioma';

  @override
  String get accountRecoveryTitle => '🔐 Detalls de recuperació del compte';

  @override
  String get recoveryInstructions =>
      'Si us plau, deseu aquesta informació de manera segura. La necessitareu per recuperar el vostre compte.';

  @override
  String get importantNotice => '⚠️ Important:';

  @override
  String get astrologerProfileTitle => 'Perfil d\'astròleg';

  @override
  String get personalAstrologer => 'Astròleg personal';

  @override
  String get makePersonalAstrologer => 'Fes-te astròleg personal';

  @override
  String get favoriteDescription =>
      'Les teves preguntes es prioritzaran a aquest astròleg. Si no està disponible, un altre astròleg qualificat t\'ajudarà.';

  @override
  String get educationQualifications => 'Educació i qualificacions';

  @override
  String get aboutSection => 'Sobre';

  @override
  String get shareProfile => 'Comparteix el perfil';

  @override
  String get loadingAstrologer =>
      'S\'estan carregant els detalls de l\'astròleg...';

  @override
  String get failedToLoadAstrologer =>
      'No s\'han pogut carregar els detalls de l\'astròleg';

  @override
  String get authenticationRequired =>
      'Cal autenticació. Si us plau, inicieu la sessió.';

  @override
  String securityCheckFailed(Object error) {
    return 'La comprovació de seguretat ha fallat: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ara és el teu astròleg personal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ S\'ha eliminat $name dels preferits';
  }

  @override
  String get toggleFavoriteError =>
      'No s\'ha pogut actualitzar l\'estat dels preferits';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Educació: $education\n📜 Titulació: $qualification\n⏳ Experiència: $experience';
  }

  @override
  String get notProvided => 'No proporcionat';

  @override
  String reviews(Object count) {
    return '($count ressenyes)';
  }

  @override
  String get specialties => 'Especialitats';

  @override
  String get experience => 'Experiència';

  @override
  String get qualification => 'Qualificació';

  @override
  String get education => 'Educació';

  @override
  String get recoveryTips =>
      '• Fes una captura de pantalla d\'aquesta informació\n• Guarda-la en un lloc segur\n• No la comparteixis amb ningú\n• Només es mostrarà una vegada';

  @override
  String get themeSettingsTitle => 'Configuració del tema';

  @override
  String get lightThemeLabel => 'Llum';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Fosc';

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

  @override
  String get ourTeam => 'El nostre equip';

  @override
  String get teamDescription =>
      'El nostre equip d\'astròlegs vèdics professionals té anys d\'experiència en la interpretació de les influències planetàries i els patrons de vida. Amb el suport d\'un equip dedicat de suport i desenvolupament, Karma ofereix una experiència fluida, fiable i global per a cada usuari.';
}
