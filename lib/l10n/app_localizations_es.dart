// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get notificationSettings => 'Configuración de notificaciones';

  @override
  String get privacySettings => 'Configuración de privacidad';

  @override
  String get accountSettings => 'Configuraciones de la cuenta';

  @override
  String get languageSettings => 'Configuración de idioma';

  @override
  String get languageChanged => 'El idioma cambió';

  @override
  String get existingUserButton => 'Soy un usuario existente';

  @override
  String get chooseCountryTitle => 'Seleccione un país';

  @override
  String get yesText => 'Sí';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Configuración de perfil';

  @override
  String get userIdLabel => 'ID de usuario *';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get birthCountryLabel => 'País de nacimiento';

  @override
  String get birthCityLabel => 'Ciudad natal';

  @override
  String get countrySelectionTitle => 'Elige tu país';

  @override
  String get maleLabel => 'Masculino';

  @override
  String get femaleLabel => 'Femenino';

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get birthDatePlaceholder => 'Seleccionar fecha de nacimiento';

  @override
  String get birthTimeLabel => 'Hora de nacimiento';

  @override
  String get birthTimePlaceholder => 'Seleccionar hora de nacimiento';

  @override
  String get saveProfileButton => 'Guardar perfil';

  @override
  String get noCitiesFound => 'No se encontraron ciudades';

  @override
  String cityPlaceholder(Object country) {
    return 'Ingrese la ciudad en $country';
  }

  @override
  String get countryFirstPlaceholder => 'Primero, seleccione el país.';

  @override
  String get versionHistoryTitle => 'Historial de versiones';

  @override
  String get notSetText => 'No configurado';

  @override
  String nameHistory(Object name) {
    return 'Nombre: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Ciudad: $city';
  }

  @override
  String countryHistory(Object country) {
    return 'País: $country';
  }

  @override
  String genderHistory(Object gender) {
    return 'Género: $gender';
  }

  @override
  String birthDateHistory(Object date) {
    return 'Fecha de nacimiento: $date';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hora de nacimiento: $time';
  }

  @override
  String locationHistory(Object latitude, Object longitude) {
    return 'Ubicación: $latitude, $longitude';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Timezone: GMT$offset';
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
    return 'Actualizado el $date';
  }

  @override
  String get userIdRequired => 'Se requiere ID de usuario';

  @override
  String get profileSaved => 'Perfil guardado correctamente';

  @override
  String get saveFailed => 'No se pudo guardar el perfil';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Elige tu idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Seleccione su idioma preferido para continuar.';

  @override
  String get onboardingWhatIsAstrology => '¿Qué es la astrología?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'La astrología es el estudio de los cuerpos celestes...';

  @override
  String get onboardingWhyUseApp => '¿Por qué usar esta aplicación?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Obtén horóscopos personalizados, predicciones diarias y orientación para tomar decisiones informadas.';

  @override
  String get onboardingHowToUse => '¿Cómo se usa esta aplicación?';

  @override
  String get onboardingHowToUseDesc =>
      'Navega fácilmente, consulta los horóscopos diarios y gestiona tu perfil para obtener predicciones precisas.';

  @override
  String get onboardingGetStarted => 'Comienza';

  @override
  String get onboardingNewUser => 'Nuevo usuario';

  @override
  String get onboardingExistingUser => 'Usuario existente';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get userIdNotFound =>
      'No se encontró el ID de usuario. Por favor, inicie sesión o configure su perfil.';

  @override
  String get clearNotificationsTitle => 'Borrar notificaciones';

  @override
  String get clearNotificationsMessage =>
      '¿Seguro que quieres borrar todas las notificaciones?';

  @override
  String get clearNotificationsSuccess =>
      'Todas las notificaciones se han eliminado correctamente.';

  @override
  String get clearHoroscopeTitle => 'Horóscopo claro';

  @override
  String get clearHoroscopeMessage =>
      '¿Estás seguro de que quieres borrar los datos de tu horóscopo?';

  @override
  String get clearHoroscopeSuccess => 'Horóscopo revisado con éxito.';

  @override
  String get clearChatTitle => 'Borrar historial de chat';

  @override
  String get clearChatMessage =>
      '¿Estás seguro de que quieres borrar todo tu historial de chat?';

  @override
  String get clearChatLocal => 'Chat borrado localmente.';

  @override
  String get deleteAccountTitle => 'Eliminar cuenta';

  @override
  String get deleteAccountMessage =>
      '¿Seguro que quieres eliminar tu cuenta? Esto también borrará todo tu historial de chat y notificaciones.';

  @override
  String get deleteAccountSuccess =>
      'Tu cuenta y todos tus datos han sido eliminados.';

  @override
  String get deleteAccountError => 'Error al eliminar la cuenta';

  @override
  String get logoutTitle => 'Cerrar sesión';

  @override
  String get logoutMessage => '¿Seguro que quieres cerrar sesión?';

  @override
  String get termsPrivacyTitle => 'Términos y privacidad';

  @override
  String get privacyPolicyTitle => 'política de privacidad';

  @override
  String get termsConditionsTitle => 'Términos y condiciones';

  @override
  String get dataControlTitle => 'Control de datos';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get confirmButton => 'Confirmar';

  @override
  String get clearQuestionsSuccess =>
      'Todas las preguntas se eliminaron correctamente.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Caballero';

  @override
  String get startLabel => 'Comenzar';

  @override
  String get recoverAccount => 'Recuperar cuenta';

  @override
  String get endLabel => 'Fin';

  @override
  String get startDateLabel => 'Fecha de inicio';

  @override
  String get endDateLabel => 'Fecha de finalización';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get noData => 'Sin datos';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get retryButton => 'Rever';

  @override
  String get kundaliGeneratorTitle => 'Generador Kundali';

  @override
  String get natalChartTitle => 'Carta natal';

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
  String get unknown => 'Desconocido';

  @override
  String get clearHoroscope => 'Horóscopo claro';

  @override
  String get clearNotifications => 'Borrar notificaciones';

  @override
  String get clearChatHistory => 'Borrar historial de chat';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get allFieldsRequired => 'Todos los campos son obligatorios.';

  @override
  String get accountRecoveredSuccess => 'Cuenta recuperada correctamente.';

  @override
  String get recoveryFailed =>
      'La recuperación falló. Verifique su información.';

  @override
  String get recoverySecretLabel => 'Secreto de recuperación:';

  @override
  String get aboutUsTitle => 'Sobre nosotros';

  @override
  String get aboutOurCompany => 'Acerca de nuestra empresa';

  @override
  String get aboutCompanyDescription =>
      'Estamos comprometidos a brindar la mejor experiencia astrológica a nuestros usuarios.';

  @override
  String get ourMission => 'Nuestra misión';

  @override
  String get missionDescription =>
      'Proporcionar información astrológica precisa y personalizada para ayudar a los usuarios a tomar decisiones informadas en sus vidas.';

  @override
  String get ourVision => 'Nuestra Visión';

  @override
  String get visionDescription =>
      'Convertirnos en la plataforma de astrología más confiable, combinando tecnología y sabiduría ancestral.';

  @override
  String get ourValues => 'Nuestros valores';

  @override
  String get valuesDescription =>
      'Integridad, precisión, diseño centrado en el usuario e innovación continua.';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get contactEmail => 'Correo electrónico: support@tuempresa.com';

  @override
  String get contactWebsite => 'Sitio web: www.tuempresa.com';

  @override
  String get customerSupport => 'Soporte al cliente';

  @override
  String get supportHeroTitle => 'Estamos aquí para ayudar';

  @override
  String get supportHeroDescription =>
      'Rellene el siguiente formulario y nuestro equipo de soporte se pondrá en contacto con usted lo antes posible.';

  @override
  String get yourName => 'Su nombre';

  @override
  String get yourEmail => 'Tu correo electrónico';

  @override
  String get message => 'Mensaje';

  @override
  String get enterEmail => 'Introduce tu correo electrónico';

  @override
  String get enterValidEmail =>
      'Introduce una dirección de correo electrónico válida';

  @override
  String enterField(Object fieldName) {
    return 'Ingrese $fieldName';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sending => 'Envío...';

  @override
  String get emailSentSuccess => '✅ ¡Correo electrónico enviado correctamente!';

  @override
  String get emailSendFailed => '❌ No se pudo enviar el correo electrónico';

  @override
  String get astroDictionaryTitle => 'Diccionario de Astrología';

  @override
  String get searchTermsHint => 'Términos de búsqueda...';

  @override
  String get noTermsFound => 'No se encontraron términos';

  @override
  String get buyQuestionsTitle => 'Preguntas sobre la compra';

  @override
  String get userNotAuthenticated => 'Usuario no autenticado';

  @override
  String get loadStoreDataFailed =>
      'No se pudieron cargar los datos de la tienda.';

  @override
  String get missingAuthToken => 'Falta el token de autenticación';

  @override
  String get merchantDisplayName => 'Aplicación Astro Chat';

  @override
  String get paymentSuccessful =>
      '✅ ¡Pago realizado correctamente! Consulta enviada.';

  @override
  String paymentFailed(Object error) {
    return '❌ Error en el pago: $error';
  }

  @override
  String get yourBalance => 'Su saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Preguntas';
  }

  @override
  String get availableOffers => 'Ofertas disponibles';

  @override
  String questionsCount(Object count) {
    return '$count Pregunta';
  }

  @override
  String get buyButton => 'Comprar';

  @override
  String get dailyHoroscopeTitle => '🌟 Horóscopo diario';

  @override
  String get userIdMissing => 'Falta el ID de usuario.';

  @override
  String get fetchHoroscopesFailed => 'No se pudieron obtener los horóscopos.';

  @override
  String get noHoroscopeFound => 'No se encontró ningún horóscopo.';

  @override
  String get signLabel => 'Firmar';

  @override
  String get todayLabel => 'Hoy';

  @override
  String get yesterdayLabel => 'Ayer';

  @override
  String get thisWeekLabel => 'Esta semana';

  @override
  String get lastMonthLabel => 'Mes pasado';

  @override
  String get chatTitle => 'Charlar';

  @override
  String get typeYourQuestionHint => 'Escribe tu pregunta...';

  @override
  String get paymentRequired => 'Pago requerido';

  @override
  String paymentRequiredMessage(Object amount) {
    return 'Has usado tus preguntas gratuitas. Paga 50 rupias para continuar.';
  }

  @override
  String get payNowButton => 'Paga ahora';

  @override
  String freeQuestionsRemaining(Object count) {
    return '$count preguntas gratuitas restantes';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return '$count preguntas pagadas restantes';
  }

  @override
  String get thankYouFeedback => '¡Gracias por sus comentarios!';

  @override
  String get ratingSubmitted => '¡Calificación enviada!';

  @override
  String get setUserIdFirst => 'Por favor, configure primero su ID de usuario.';

  @override
  String get failedToFetchPrevious =>
      'No se pudieron recuperar las preguntas y respuestas anteriores.';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Perfil astrológico';

  @override
  String get drawerDailyHoroscope => 'Horóscopo diario';

  @override
  String get drawerBuyQuestions => 'Preguntas de compra';

  @override
  String get drawerAstroDictionary => 'Diccionario de Astrología';

  @override
  String get drawerSettings => 'Ajustes';

  @override
  String get drawerCustomerSupport => 'Soporte al cliente';

  @override
  String get drawerAbout => 'Acerca de';

  @override
  String get drawerProfileSettings => 'Configuración de perfil';

  @override
  String get demoNotificationTitle => '🔔 Notificación de demostración';

  @override
  String get demoNotificationBody =>
      '¡Esta es una notificación de prueba de tu aplicación!';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get noNotifications => 'Sin notificaciones';

  @override
  String get allTab => 'Todo';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get notificationMarkedRead => 'Notificación marcada como leída';

  @override
  String get failedToLoadNotifications =>
      'No se pudieron cargar las notificaciones';

  @override
  String get failedToMarkRead => 'No se pudo marcar como leído';

  @override
  String get failedToMarkAllRead => 'No se pudo marcar todo como leído.';

  @override
  String get socketConnected => 'Enchufe conectado';

  @override
  String get socketDisconnected => 'Enchufe desconectado';

  @override
  String get newNotificationReceived => 'Nueva notificación recibida';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horóscopo';

  @override
  String get chatCategory => 'Charlar';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Actualizaciones';

  @override
  String get howToAskTitle => 'Cómo preguntar';

  @override
  String get noQuestionsAvailable => 'No hay preguntas disponibles';

  @override
  String get failedToLoadQuestions => 'No se pudieron cargar las preguntas';

  @override
  String get pullToRefresh => 'Desliza para actualizar';

  @override
  String get careerCategory => 'Carrera';

  @override
  String get loveCategory => 'Amor y relaciones';

  @override
  String get healthCategory => 'Salud';

  @override
  String get financeCategory => 'Finanzas';

  @override
  String get familyCategory => 'Familia';

  @override
  String get educationCategory => 'Educación';

  @override
  String get travelCategory => 'Viajar';

  @override
  String get spiritualCategory => 'Espiritual';

  @override
  String get profileLoaded => 'Perfil cargado correctamente';

  @override
  String get imageUploaded => 'Imagen subida correctamente';

  @override
  String get savedInformationConfirmation => 'He guardado esta información.';

  @override
  String get noHistoryAvailable => 'No hay historial disponible.';

  @override
  String get missingUserIdError => 'Se requiere ID de usuario';

  @override
  String get networkError => 'Error de red. Inténtelo de nuevo.';

  @override
  String get timeoutError => 'La solicitud ha expirado';

  @override
  String get genericError => 'Algo salió mal';

  @override
  String get reactionUpdateError => 'No se pudo actualizar la reacción';

  @override
  String get noSearchResults => 'No se encontraron resultados de búsqueda.';

  @override
  String get clearSearch => 'Borrar búsqueda';

  @override
  String get resultsFound => 'Resultados encontrados';

  @override
  String get recoverySecretHint =>
      'Es posible que copiar y pegar no funcione; escriba manualmente.';

  @override
  String get recoverAccountDescription =>
      'Sigue estos pasos para recuperar tu cuenta.';

  @override
  String get processingLabel => 'Tratamiento...';

  @override
  String get clearChatSuccess => 'Chat finalizado correctamente';

  @override
  String get notificationsEnabled => 'Notificaciones habilitadas';

  @override
  String get notificationsDisabled => 'Notificaciones desactivadas';

  @override
  String get securityNotice =>
      'Sus datos están cifrados y almacenados de forma segura.';

  @override
  String get loading => 'Cargando...';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get onboardingGetStartedDesc => 'Comienza eligiendo tu idioma';

  @override
  String get accountRecoveryTitle => '🔐 Detalles de recuperación de cuenta';

  @override
  String get recoveryInstructions =>
      'Por favor, guarda esta información de forma segura. La necesitarás para recuperar tu cuenta.';

  @override
  String get importantNotice => '⚠️ Importante:';

  @override
  String get astrologerProfileTitle => 'Perfil de astrólogo';

  @override
  String get personalAstrologer => 'Astrólogo personal';

  @override
  String get makePersonalAstrologer => 'Hazte astrólogo personal';

  @override
  String get favoriteDescription =>
      'Sus preguntas serán priorizadas para este astrólogo. Si no está disponible, otro astrólogo cualificado le ayudará.';

  @override
  String get educationQualifications => 'Educación y cualificaciones';

  @override
  String get aboutSection => 'Acerca de';

  @override
  String get shareProfile => 'Compartir perfil';

  @override
  String get loadingAstrologer => 'Cargando detalles del astrólogo...';

  @override
  String get failedToLoadAstrologer =>
      'No se pudieron cargar los detalles del astrólogo';

  @override
  String get authenticationRequired =>
      'Se requiere autenticación. Por favor, inicie sesión.';

  @override
  String securityCheckFailed(Object error) {
    return 'Error en la comprobación de seguridad: $error';
  }

  @override
  String addedToFavorites(Object name) {
    return '🎯 $name ahora es tu astrólogo personal';
  }

  @override
  String removedFromFavorites(Object name) {
    return '✅ Eliminado $name de favoritos';
  }

  @override
  String get toggleFavoriteError =>
      'No se pudo actualizar el estado de favoritos';

  @override
  String shareMessage(
    Object name,
    Object education,
    Object qualification,
    Object experience,
  ) {
    return '$name\n🎓 Educación: $education\n📜 Cualificaciones: $qualification\n\n⏳ Experiencia: $experience';
  }

  @override
  String get notProvided => 'No se proporcionó';

  @override
  String reviews(Object count) {
    return '($count reseñas)';
  }

  @override
  String get specialties => 'Especialidades';

  @override
  String get experience => 'Experiencia';

  @override
  String get qualification => 'Calificación';

  @override
  String get education => 'Educación';

  @override
  String get recoveryTips =>
      '• Haz una captura de pantalla de esta información.\n• Guárdala en un lugar seguro.\n• No la compartas con nadie.\n• Esto solo se mostrará una vez.';

  @override
  String get themeSettingsTitle => 'Configuración del tema';

  @override
  String get lightThemeLabel => 'Luz';

  @override
  String get lightThemeDescription => 'Always use light theme';

  @override
  String get darkThemeLabel => 'Oscuro';

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
}
