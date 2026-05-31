// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get notificationSettings => 'Configuración de notificacións';

  @override
  String get privacySettings => 'Configuración de privacidade';

  @override
  String get accountSettings => 'Configuración da conta';

  @override
  String get languageSettings => 'Configuración de idioma';

  @override
  String get languageChanged => 'Idioma cambiado';

  @override
  String get existingUserButton => 'Xa son un usuario';

  @override
  String get chooseCountryTitle => 'Escolle o país';

  @override
  String get yesText => 'Si';

  @override
  String get noText => 'Non';

  @override
  String get appBarTitle => 'Configuración do perfil';

  @override
  String get userIdLabel => 'ID de usuario *';

  @override
  String get nameLabel => 'Nome';

  @override
  String get birthCountryLabel => 'País de nacemento';

  @override
  String get birthCityLabel => 'Cidade de nacemento';

  @override
  String get countrySelectionTitle => 'Escolle o teu país';

  @override
  String get maleLabel => 'Masculino';

  @override
  String get femaleLabel => 'Muller';

  @override
  String get birthDateLabel => 'Data de nacemento';

  @override
  String get birthDatePlaceholder => 'Seleccionar data de nacemento';

  @override
  String get birthTimeLabel => 'Hora de nacemento';

  @override
  String get birthTimePlaceholder => 'Seleccionar hora de nacemento';

  @override
  String get saveProfileButton => 'Gardar perfil';

  @override
  String get noCitiesFound => 'Non se atoparon cidades';

  @override
  String cityPlaceholder(Object country) {
    return 'Introduza a cidade en $country';
  }

  @override
  String get countryFirstPlaceholder => 'Selecciona primeiro o país';

  @override
  String get versionHistoryTitle => 'Historial de versións';

  @override
  String get notSetText => 'Sen definir';

  @override
  String nameHistory(Object name) {
    return 'Nome: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Cidade: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'País: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Xénero: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Data de nacemento: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hora de nacemento: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Localización: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Fuso horario: GMT$offset';
  }

  @override
  String dstHistory(Object value) {
    return 'DST: $value';
  }

  @override
  String stateHistory(Object state) {
    return 'Estado: $state';
  }

  @override
  String versionFromText(Object date) {
    return 'Actualizado o $date';
  }

  @override
  String get userIdRequired => 'É obrigatorio o ID de usuario';

  @override
  String get profileSaved => 'Perfil gardado correctamente';

  @override
  String get saveFailed => 'Non se puido gardar o perfil';

  @override
  String get errorPrefix => 'Erro:';

  @override
  String get onboardingChooseLanguage => 'Escolle o teu idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selecciona o teu idioma preferido para continuar.';

  @override
  String get onboardingWhatIsAstrology => 'Que é a Astroloxía?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'A astroloxía é o estudo antigo dos movementos celestes e a súa influencia na vida humana, ofrecendo información sobre a personalidade, as relacións e os acontecementos vitais.';

  @override
  String get onboardingWhyUseApp => 'Por que usar esta aplicación?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Recibe horóscopos precisos, xerados por humanos, e orientación adaptada á túa carta natal. Toma decisións informadas con predicións diarias e consellos personalizados de astrólogos experimentados.';

  @override
  String get onboardingHowToUse => 'Como usar esta aplicación?';

  @override
  String get onboardingHowToUseDesc =>
      'Simplemente introduce a túa data de nacemento, a hora exacta, o lugar de nacemento e calquera outro detalle relevante para comezar ao instante. Explora os horóscopos diarios, fai preguntas a astrólogos expertos e xestiona o teu perfil para obter predicións precisas e personalizadas, sen necesidade de iniciar sesión.';

  @override
  String get onboardingGetStarted => 'Comezar';

  @override
  String get onboardingNewUser => 'Novo usuario';

  @override
  String get onboardingExistingUser => 'Usuario existente';

  @override
  String get onboardingBack => 'Volver';

  @override
  String get onboardingNext => 'Seguinte';

  @override
  String get userIdNotFound =>
      'Non se atopou o ID de usuario. Inicie sesión ou configure o seu perfil.';

  @override
  String get clearNotificationsTitle => 'Borrar notificacións';

  @override
  String get clearNotificationsMessage =>
      'Seguro que queres borrar todas as notificacións?';

  @override
  String get clearNotificationsSuccess =>
      'Todas as notificacións borráronse correctamente.';

  @override
  String get clearHoroscopeTitle => 'Horóscopo claro';

  @override
  String get clearHoroscopeMessage =>
      'Seguro que queres borrar os datos do teu horóscopo?';

  @override
  String get clearHoroscopeSuccess => 'Horóscopo limpou correctamente.';

  @override
  String get clearChatTitle => 'Borrar o historial de chat';

  @override
  String get clearChatMessage =>
      'Seguro que queres eliminar todo o teu historial de chat?';

  @override
  String get clearChatLocal => 'Chat limpouse localmente.';

  @override
  String get deleteAccountTitle => 'Eliminar conta';

  @override
  String get deleteAccountMessage =>
      'Seguro que queres eliminar a túa conta? Isto tamén borrará todo o teu historial de chat e as notificacións.';

  @override
  String get deleteAccountSuccess =>
      'Elimináronse a túa conta e todos os datos.';

  @override
  String get deleteAccountError => 'Produciuse un erro ao eliminar a conta';

  @override
  String get logoutTitle => 'Pechar sesión';

  @override
  String get logoutMessage => 'Seguro que queres pechar sesión?';

  @override
  String get termsPrivacyTitle => 'Termos e privacidade';

  @override
  String get privacyPolicyTitle => 'Política de privacidade';

  @override
  String get termsConditionsTitle => 'Termos e condicións';

  @override
  String get dataControlTitle => 'Control de datos';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get confirmButton => 'Confirmar';

  @override
  String get clearQuestionsSuccess =>
      'Todas as preguntas foron eliminadas correctamente.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Señor';

  @override
  String get startLabel => 'Comezar';

  @override
  String get recoverAccount => 'Recuperar conta';

  @override
  String get endLabel => 'Fin';

  @override
  String get startDateLabel => 'Data de inicio';

  @override
  String get endDateLabel => 'Data de finalización';

  @override
  String get notAvailable => 'Non dispoñible';

  @override
  String get noData => 'Sen datos';

  @override
  String get unknownError => 'Erro descoñecido';

  @override
  String get retryButton => 'Reintentar';

  @override
  String get kundaliGeneratorTitle => 'Xerador de Kundali';

  @override
  String get natalChartTitle => 'Carta natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Grao ascendente';

  @override
  String get vimshottariDashaTitle => 'Vimshottari Dasha';

  @override
  String get yoginiDashaTitle => 'Yogini Dasha';

  @override
  String get unknown => 'Descoñecido';

  @override
  String get clearHoroscope => 'Horóscopo claro';

  @override
  String get clearNotifications => 'Borrar notificacións';

  @override
  String get clearChatHistory => 'Borrar o historial de chat';

  @override
  String get logout => 'Pechar sesión';

  @override
  String get deleteAccount => 'Eliminar conta';

  @override
  String get allFieldsRequired => 'Todos os campos son obrigatorios.';

  @override
  String get accountRecoveredSuccess => 'Conta recuperada correctamente.';

  @override
  String get recoveryFailed =>
      'Fallou a recuperación. Comproba a túa información.';

  @override
  String get recoverySecretLabel => 'Segredo de recuperación:';

  @override
  String get aboutUsTitle => 'Sobre nós';

  @override
  String get aboutOurCompany => 'Sobre a nosa empresa';

  @override
  String get aboutCompanyDescription =>
      'En Karma, axudámosche a descubrir o teu verdadeiro camiño vital a través da sabedoría atemporal da astroloxía védica. Cada coñecemento provén de astrólogos reais e experimentados, elaborados coidadosamente en función da túa carta natal única. Desde horóscopos diarios ata orientación personalizada, Karma fai que o coñecemento antigo sexa accesible en máis de 100 idiomas.';

  @override
  String get ourMission => 'A nosa misión';

  @override
  String get missionDescription =>
      'A nosa misión é sinxela: proporcionar unha guía astrolóxica auténtica e dirixida por humanos que che permita tomar decisións seguras e informadas. Cada predición e consulta reflicte anos de experiencia profesional, non algoritmos automatizados.';

  @override
  String get ourVision => 'A nosa visión';

  @override
  String get visionDescription =>
      'Esforzámonos por ser a plataforma máis fiable do mundo para a astroloxía védica, axudando a persoas de todo o mundo a comprenderse a si mesmas, as súas eleccións e a súa viaxe vital con claridade e confianza.';

  @override
  String get ourValues => 'Os nosos valores';

  @override
  String get valuesDescription =>
      'En Karma, valoramos a autenticidade, a precisión e a confianza. Comprometémonos a ofrecer unha orientación que non só sexa precisa senón tamén significativa, axudándoche a navegar pola vida con coñecemento e confianza.';

  @override
  String get contactUs => 'Contacta connosco';

  @override
  String get contactEmail => 'Correo electrónico: soporte@a túaempresa.com';

  @override
  String get contactWebsite => 'Sitio web: www.a súaempresa.com';

  @override
  String get customerSupport => 'Atención ao cliente';

  @override
  String get supportHeroTitle => 'Estamos aquí para axudar';

  @override
  String get supportHeroDescription =>
      'Encha o formulario a continuación e o noso equipo de asistencia porase en contacto con vostede o antes posible.';

  @override
  String get yourName => 'O teu nome';

  @override
  String get yourEmail => 'O teu correo electrónico';

  @override
  String get message => 'Mensaxe';

  @override
  String get enterEmail => 'Introduce o teu correo electrónico';

  @override
  String get enterValidEmail =>
      'Introduce un enderezo de correo electrónico válido';

  @override
  String enterField(Object fieldName) {
    return 'Introduza $fieldName';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sending => 'Enviando...';

  @override
  String get emailSentSuccess => '✅ Correo electrónico enviado correctamente!';

  @override
  String get emailSendFailed => '❌ Non se puido enviar o correo electrónico';

  @override
  String get astroDictionaryTitle => 'Dicionario astrolóxico';

  @override
  String get searchTermsHint => 'Termos de busca...';

  @override
  String get noTermsFound => 'Non se atoparon termos';

  @override
  String get buyQuestionsTitle => 'Preguntas de compra';

  @override
  String get userNotAuthenticated => 'Usuario non autenticado';

  @override
  String get loadStoreDataFailed => 'Non se puideron cargar os datos da tenda';

  @override
  String get missingAuthToken => 'Falta o token de autenticación';

  @override
  String get merchantDisplayName => 'Aplicación de chat Astro';

  @override
  String get paymentSuccessful =>
      '✅ Pago realizado correctamente! Pregunta enviada';

  @override
  String paymentFailed(Object error) {
    return '❌ Fallou o pago: $error';
  }

  @override
  String get yourBalance => 'O teu saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Preguntas';
  }

  @override
  String get availableOffers => 'Ofertas dispoñibles';

  @override
  String questionsCount(Object count) {
    return '$count Pregunta';
  }

  @override
  String get buyButton => 'Comprar';

  @override
  String get dailyHoroscopeTitle => ' Horóscopo diario';

  @override
  String get userIdMissing => 'Falta o ID de usuario';

  @override
  String get fetchHoroscopesFailed => 'Non se puideron obter os horóscopos';

  @override
  String get noHoroscopeFound => 'Non se atopou ningún horóscopo.';

  @override
  String get signLabel => 'Asinar';

  @override
  String get todayLabel => 'Hoxe';

  @override
  String get yesterdayLabel => 'Onte';

  @override
  String get thisWeekLabel => 'Esta semana';

  @override
  String get lastMonthLabel => 'O mes pasado';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Escribe a túa pregunta...';

  @override
  String get paymentRequired => 'Pago obrigatorio';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Usaches as túas preguntas gratuítas. Paga a $amount para continuar.';
  }

  @override
  String get payNowButton => 'Pagar agora';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count preguntas libres restantes';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count preguntas de pago restantes';
  }

  @override
  String get thankYouFeedback => 'Grazas polos teus comentarios!';

  @override
  String get ratingSubmitted => 'Clasificación enviada!';

  @override
  String get setUserIdFirst => 'Por favor, defina primeiro o seu ID de usuario';

  @override
  String get failedToFetchPrevious =>
      'Non se puideron obter as preguntas e respostas anteriores';

  @override
  String errorOccurred(Object error) {
    return 'Erro: $error';
  }

  @override
  String get drawerAstroProfile => 'Perfil astrolóxico';

  @override
  String get drawerDailyHoroscope => 'Horóscopo diario';

  @override
  String get drawerBuyQuestions => 'Preguntas de compra';

  @override
  String get drawerAstroDictionary => 'Dicionario astrolóxico';

  @override
  String get drawerSettings => 'Configuración';

  @override
  String get drawerCustomerSupport => 'Atención ao cliente';

  @override
  String get drawerAbout => 'Acerca de';

  @override
  String get drawerProfileSettings => 'Configuración do perfil';

  @override
  String get demoNotificationTitle => '🔔 Notificación de demostración';

  @override
  String get demoNotificationBody =>
      'Esta é unha notificación de proba da túa aplicación!';

  @override
  String get notificationsTitle => 'Notificacións';

  @override
  String get noNotifications => 'Sen notificacións';

  @override
  String get allTab => 'Todo';

  @override
  String get markAllAsRead => 'Marcar todo como lido';

  @override
  String get notificationMarkedRead => 'Notificación marcada como lida';

  @override
  String get failedToLoadNotifications =>
      'Non se puideron cargar as notificacións';

  @override
  String get failedToMarkRead => 'Non se puido marcar como lido';

  @override
  String get failedToMarkAllRead => 'Non se puido marcar todo como lido';

  @override
  String get socketConnected => 'Toma conectada';

  @override
  String get socketDisconnected => 'Toma desconectada';

  @override
  String get newNotificationReceived => 'Nova notificación recibida';

  @override
  String get generalCategory => 'Xeral';

  @override
  String get horoscopeCategory => 'Horóscopo';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Actualizacións';

  @override
  String get howToAskTitle => 'Como preguntar';

  @override
  String get noQuestionsAvailable => 'Non hai preguntas dispoñibles';

  @override
  String get failedToLoadQuestions => 'Non se puideron cargar as preguntas';

  @override
  String get pullToRefresh => 'Arrastra para actualizar';

  @override
  String get careerCategory => 'Carreira';

  @override
  String get loveCategory => 'Amor e relacións';

  @override
  String get healthCategory => 'Saúde';

  @override
  String get financeCategory => 'Finanzas';

  @override
  String get familyCategory => 'Familia';

  @override
  String get educationCategory => 'Educación';

  @override
  String get travelCategory => 'Viaxes';

  @override
  String get spiritualCategory => 'Espiritual';

  @override
  String get profileLoaded => 'O perfil cargouse correctamente';

  @override
  String get imageUploaded => 'Imaxe cargada correctamente';

  @override
  String get savedInformationConfirmation => 'Gardei esta información';

  @override
  String get noHistoryAvailable => 'Non hai historial dispoñible';

  @override
  String get missingUserIdError => 'É obrigatorio o ID de usuario';

  @override
  String get networkError => 'Erro de rede. Téntao de novo.';

  @override
  String get timeoutError => 'Esgotouse o tempo de espera da solicitude';

  @override
  String get genericError => 'Algo fallou';

  @override
  String get reactionUpdateError => 'Non se puido actualizar a reacción';

  @override
  String get noSearchResults => 'Non se atoparon resultados de busca';

  @override
  String get clearSearch => 'Limpar busca';

  @override
  String get resultsFound => 'Resultados atopados';

  @override
  String get recoverySecretHint =>
      'Pode que copiar e pegar non funcione, escribe manualmente';

  @override
  String get recoverAccountDescription =>
      'Sigue estes pasos para recuperar a túa conta';

  @override
  String get processingLabel => 'Procesando...';

  @override
  String get clearChatSuccess => 'O chat borrouse correctamente.';

  @override
  String get notificationsEnabled => 'Notificacións activadas';

  @override
  String get notificationsDisabled => 'Notificacións desactivadas';

  @override
  String get securityNotice =>
      'Os teus datos están cifrados e almacenados de forma segura';

  @override
  String get loading => 'Cargando...';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get onboardingGetStartedDesc => 'Comeza escollendo o teu idioma';

  @override
  String get accountRecoveryTitle => '🔐 Detalles da recuperación da conta';

  @override
  String get recoveryInstructions =>
      'Garda esta información de forma segura. Precisaraa para recuperar a túa conta.';

  @override
  String get importantNotice => '⚠️ Importante:';

  @override
  String get astrologerProfileTitle => 'Perfil do astrólogo';

  @override
  String get personalAstrologer => 'Astrólogo persoal';

  @override
  String get makePersonalAstrologer => 'Fai astrólogo persoal';

  @override
  String get favoriteDescription =>
      'As túas preguntas serán prioritarias para este astrólogo. Se non está dispoñible, outro astrólogo cualificado axudarache.';

  @override
  String get educationQualifications => 'Educación e cualificacións';

  @override
  String get aboutSection => 'Acerca de';

  @override
  String get shareProfile => 'Compartir perfil';

  @override
  String get loadingAstrologer => 'Cargando os detalles do astrólogo...';

  @override
  String get failedToLoadAstrologer =>
      'Non se puideron cargar os detalles do astrólogo';

  @override
  String get authenticationRequired =>
      'Requírese autenticación. Inicia sesión.';

  @override
  String securityCheckFailed(Object error) {
    return 'Fallou a comprobación de seguranza: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name é agora o teu astrólogo persoal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Eliminouse $name dos favoritos';
  }

  @override
  String get toggleFavoriteError =>
      'Non se puido actualizar o estado dos favoritos';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Educación: $education\n📜 Cualificación: $qualification\n⏳ Experiencia: $experience';
  }

  @override
  String get notProvided => 'Non proporcionado';

  @override
  String reviews(Object count) {
    return '($count avaliacións)';
  }

  @override
  String get specialties => 'Especialidades';

  @override
  String get experience => 'Experiencia';

  @override
  String get qualification => 'Cualificación';

  @override
  String get education => 'Educación';

  @override
  String get recoveryTips =>
      '• Fai unha captura de pantalla desta información\n• Gardaa nun lugar seguro\n• Non a compartas con ninguén\n• Isto só se mostrará unha vez';

  @override
  String get themeSettingsTitle => 'Configuración do tema';

  @override
  String get lightThemeLabel => 'Luz';

  @override
  String get lightThemeDescription => 'Usa sempre un tema claro';

  @override
  String get darkThemeLabel => 'Escuro';

  @override
  String get darkThemeDescription => 'Usar sempre o tema escuro';

  @override
  String get systemThemeLabel => 'Sistema';

  @override
  String get systemThemeDarkDescription =>
      'Segue a configuración do sistema para o tema escuro';

  @override
  String get systemThemeLightDescription =>
      'Segue a configuración do sistema para o tema claro';

  @override
  String get switchToLight => 'Cambiar á luz';

  @override
  String get switchToDark => 'Cambiar a Escuro';

  @override
  String get ourTeam => 'O noso equipo';

  @override
  String get teamDescription =>
      'O noso equipo de astrólogos védicos profesionais leva anos de experiencia interpretando as influencias planetarias e os patróns de vida. Respaldado por un equipo de apoio e desenvolvemento dedicado, Karma ofrece unha experiencia fluída, fiable e global para cada usuario.';
}
