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
  String get notificationSettings => 'Ajustes de notificación';

  @override
  String get privacySettings => 'Configuración de privacidad';

  @override
  String get accountSettings => 'Ajustes de la cuenta';

  @override
  String get languageSettings => 'Ajustes del idioma';

  @override
  String get languageChanged => 'Idioma cambiado';

  @override
  String get existingUserButton => 'Soy un usuario existente';

  @override
  String get chooseCountryTitle => 'Elige tu país';

  @override
  String get yesText => 'Sí';

  @override
  String get noText => 'No';

  @override
  String get appBarTitle => 'Ajustes del perfil';

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
  String get maleLabel => 'Hombre';

  @override
  String get femaleLabel => 'Mujer';

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get birthDatePlaceholder => 'Seleccionar fecha de nacimiento';

  @override
  String get birthTimeLabel => 'Hora de nacimiento';

  @override
  String get birthTimePlaceholder => 'Seleccione la hora de nacimiento';

  @override
  String get saveProfileButton => 'Guardar perfil';

  @override
  String get noCitiesFound => 'No se encontraron ciudades';

  @override
  String cityPlaceholder(Object country) {
    return 'Ingrese la ciudad';
  }

  @override
  String get countryFirstPlaceholder => 'Seleccione el país primero';

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
    return 'Zona horaria: GMT$offset';
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
    return 'Versión de $date';
  }

  @override
  String get userIdRequired => 'Se requiere ID de usuario';

  @override
  String get profileSaved => 'Perfil guardado con éxito';

  @override
  String get saveFailed => 'No se pudo guardar el perfil';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Elija su idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Seleccione su idioma preferido para continuar.';

  @override
  String get onboardingWhatIsAstrology => '¿Qué es la Astrología?';

  @override
  String get onboardingWhatIsAstrologyDesc =>
      'La astrología es el estudio de los cuerpos celestes...';

  @override
  String get onboardingWhyUseApp => '¿Por qué usar esta aplicación?';

  @override
  String get onboardingWhyUseAppDesc =>
      'Obtenga horóscopos personalizados, predicciones diarias y orientación para tomar decisiones informadas.';

  @override
  String get onboardingHowToUse => '¿Cómo utilizar esta aplicación?';

  @override
  String get onboardingHowToUseDesc =>
      'Navegue fácilmente, consulte los horóscopos diarios y gestione su perfil para predicciones precisas.';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get onboardingNewUser => 'Nuevo usuario';

  @override
  String get onboardingExistingUser => 'Usuario existente';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get userIdNotFound =>
      'ID de usuario no encontrado. Por favor inicia sesión o configura tu perfil.';

  @override
  String get clearNotificationsTitle => 'Borrar notificaciones';

  @override
  String get clearNotificationsMessage =>
      '¿Seguro que deseas borrar todas las notificaciones?';

  @override
  String get clearNotificationsSuccess =>
      'Todas las notificaciones se borraron correctamente.';

  @override
  String get clearHoroscopeTitle => 'Borrar horóscopo';

  @override
  String get clearHoroscopeMessage =>
      '¿Seguro que deseas borrar tus datos del horóscopo?';

  @override
  String get clearHoroscopeSuccess => 'Horóscopo borrado correctamente.';

  @override
  String get clearChatTitle => 'Borrar historial de chat';

  @override
  String get clearChatMessage =>
      '¿Seguro que deseas eliminar todo tu historial de chat?';

  @override
  String get clearChatLocal => 'Chat borrado localmente.';

  @override
  String get deleteAccountTitle => 'Eliminar cuenta';

  @override
  String get deleteAccountMessage =>
      '¿Seguro que deseas eliminar tu cuenta? Esto también borrará tu historial de chat y notificaciones.';

  @override
  String get deleteAccountSuccess =>
      'Tu cuenta y todos los datos han sido eliminados.';

  @override
  String get deleteAccountError => 'Error al eliminar la cuenta';

  @override
  String get logoutTitle => 'Cerrar sesión';

  @override
  String get logoutMessage => '¿Seguro que deseas cerrar sesión?';

  @override
  String get termsPrivacyTitle => 'Términos y privacidad';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

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
      'Todas las preguntas se borraron correctamente.';

  @override
  String get yoginiLabel => 'Yogini';

  @override
  String get lordLabel => 'Señor';

  @override
  String get startLabel => 'Inicio';

  @override
  String get recoverAccount => 'Recuperar cuenta';

  @override
  String get endLabel => 'Fin';

  @override
  String get startDateLabel => 'Fecha de inicio';

  @override
  String get endDateLabel => 'Fecha de fin';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get noData => 'Sin datos';

  @override
  String get unknownError => 'Error desconocido';

  @override
  String get retryButton => 'Reintentar';

  @override
  String get kundaliGeneratorTitle => 'Generador de Kundali';

  @override
  String get natalChartTitle => 'Carta natal';

  @override
  String get lagnaLabel => 'Lagna';

  @override
  String get rashiLabel => 'Rashi';

  @override
  String get ascDegreeLabel => 'Grado ascendente';

  @override
  String get vimshottariDashaTitle => 'Dasha Vimshottari';

  @override
  String get yoginiDashaTitle => 'Dasha Yogini';

  @override
  String get unknown => 'Desconocido';

  @override
  String get clearHoroscope => 'Borrar Horóscopo';

  @override
  String get clearNotifications => 'Borrar Notificaciones';

  @override
  String get clearChatHistory => 'Borrar Historial de Chat';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get deleteAccount => 'Eliminar Cuenta';

  @override
  String get allFieldsRequired => 'Todos los campos son obligatorios.';

  @override
  String get accountRecoveredSuccess => 'Cuenta recuperada exitosamente.';

  @override
  String get recoveryFailed => 'Recuperación fallida. Verifica tu información.';

  @override
  String get recoverySecretLabel => 'Secreto de Recuperación';

  @override
  String get aboutUsTitle => 'Acerca de Nosotros';

  @override
  String get aboutOurCompany => 'Acerca de Nuestra Empresa';

  @override
  String get aboutCompanyDescription =>
      'Estamos comprometidos a ofrecer la mejor experiencia de astrología a nuestros usuarios.';

  @override
  String get ourMission => 'Nuestra Misión';

  @override
  String get missionDescription =>
      'Proporcionar conocimientos astrológicos precisos y personalizados para ayudar a los usuarios a tomar decisiones informadas en sus vidas.';

  @override
  String get ourVision => 'Nuestra Visión';

  @override
  String get visionDescription =>
      'Convertirnos en la plataforma de astrología más confiable, combinando tecnología y sabiduría antigua.';

  @override
  String get ourValues => 'Nuestros Valores';

  @override
  String get valuesDescription =>
      'Integridad, Precisión, Diseño Centrado en el Usuario e Innovación Continua.';

  @override
  String get contactUs => 'Contáctenos';

  @override
  String get contactEmail => 'Correo: support@yourcompany.com';

  @override
  String get contactWebsite => 'Sitio web: www.yourcompany.com';

  @override
  String get customerSupport => 'Atención al Cliente';

  @override
  String get supportHeroTitle => 'Estamos Aquí para Ayudar';

  @override
  String get supportHeroDescription =>
      'Complete el formulario a continuación y nuestro equipo de soporte se comunicará con usted lo antes posible.';

  @override
  String get yourName => 'Tu Nombre';

  @override
  String get yourEmail => 'Tu Correo Electrónico';

  @override
  String get message => 'Mensaje';

  @override
  String get enterEmail => 'Ingresa tu correo electrónico';

  @override
  String get enterValidEmail =>
      'Ingresa una dirección de correo electrónico válida';

  @override
  String enterField(Object fieldName) {
    return 'Ingresa $fieldName';
  }

  @override
  String get send => 'Enviar';

  @override
  String get sending => 'Enviando...';

  @override
  String get emailSentSuccess => '✅ ¡Correo enviado exitosamente!';

  @override
  String get emailSendFailed => '❌ Error al enviar el correo';

  @override
  String get astroDictionaryTitle => 'Diccionario Astrológico';

  @override
  String get searchTermsHint => 'Buscar términos...';

  @override
  String get noTermsFound => 'No se encontraron términos';

  @override
  String get buyQuestionsTitle => 'Comprar Preguntas';

  @override
  String get userNotAuthenticated => 'Usuario no autenticado';

  @override
  String get loadStoreDataFailed => 'Error al cargar datos de la tienda';

  @override
  String get missingAuthToken => 'Falta token de autenticación';

  @override
  String get merchantDisplayName => 'App de Chat Astrológico';

  @override
  String get paymentSuccessful => '✅ ¡Pago exitoso! Pregunta enviada';

  @override
  String paymentFailed(Object error) {
    return '❌ Pago fallido: $error';
  }

  @override
  String get yourBalance => 'Tu Saldo';

  @override
  String questionsBalance(Object count) {
    return '$count Preguntas';
  }

  @override
  String get availableOffers => 'Ofertas Disponibles';

  @override
  String questionsCount(Object count) {
    return '$count Pregunta';
  }

  @override
  String get buyButton => 'Comprar';

  @override
  String get dailyHoroscopeTitle => '🌟 Horóscopo Diario';

  @override
  String get userIdMissing => 'Falta ID de usuario';

  @override
  String get fetchHoroscopesFailed => 'Error al obtener horóscopos';

  @override
  String get noHoroscopeFound => 'No se encontró horóscopo.';

  @override
  String get signLabel => 'Signo';

  @override
  String get todayLabel => 'Hoy';

  @override
  String get yesterdayLabel => 'Ayer';

  @override
  String get thisWeekLabel => 'Esta Semana';

  @override
  String get lastMonthLabel => 'Mes Pasado';

  @override
  String get chatTitle => 'Chat';

  @override
  String get typeYourQuestionHint => 'Escribe tu pregunta...';

  @override
  String get paymentRequired => 'Pago Requerido';

  @override
  String get paymentRequiredMessage =>
      'Has usado tus preguntas gratuitas. Paga ₹50 para continuar.';

  @override
  String get payNowButton => 'Pagar Ahora';

  @override
  String freeQuestionsRemaining(Object count) {
    return 'Te quedan $count preguntas gratuitas';
  }

  @override
  String paidQuestionsRemaining(Object count) {
    return 'Te quedan $count preguntas pagadas';
  }

  @override
  String get thankYouFeedback => '¡Gracias por tus comentarios!';

  @override
  String get ratingSubmitted => '¡Calificación enviada!';

  @override
  String get setUserIdFirst => 'Por favor, establece tu ID de usuario primero';

  @override
  String get failedToFetchPrevious =>
      'Error al obtener preguntas y respuestas anteriores';

  @override
  String errorOccurred(Object error) {
    return 'Error: $error';
  }

  @override
  String get drawerAstroProfile => 'Perfil Astrológico';

  @override
  String get drawerDailyHoroscope => 'Horóscopo Diario';

  @override
  String get drawerBuyQuestions => 'Comprar Preguntas';

  @override
  String get drawerAstroDictionary => 'Diccionario Astrológico';

  @override
  String get drawerSettings => 'Ajustes';

  @override
  String get drawerCustomerSupport => 'Atención al Cliente';

  @override
  String get drawerAbout => 'Acerca de';

  @override
  String get drawerProfileSettings => 'Ajustes de Perfil';

  @override
  String get demoNotificationTitle => '🔔 Notificación de Demo';

  @override
  String get demoNotificationBody =>
      '¡Esta es una notificación de prueba de tu aplicación!';

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get noNotifications => 'No hay notificaciones';

  @override
  String get allTab => 'Todos';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get notificationMarkedRead => 'Notificación marcada como leída';

  @override
  String get failedToLoadNotifications => 'Error al cargar notificaciones';

  @override
  String get failedToMarkRead => 'Error al marcar como leído';

  @override
  String get failedToMarkAllRead => 'Error al marcar todo como leído';

  @override
  String get socketConnected => 'Socket conectado';

  @override
  String get socketDisconnected => 'Socket desconectado';

  @override
  String get newNotificationReceived => 'Nueva notificación recibida';

  @override
  String get generalCategory => 'General';

  @override
  String get horoscopeCategory => 'Horóscopo';

  @override
  String get chatCategory => 'Chat';

  @override
  String get systemCategory => 'Sistema';

  @override
  String get updateCategory => 'Actualizaciones';

  @override
  String get howToAskTitle => 'Cómo Preguntar';

  @override
  String get noQuestionsAvailable => 'No hay preguntas disponibles';

  @override
  String get failedToLoadQuestions => 'Error al cargar preguntas';

  @override
  String get pullToRefresh => 'Tira para actualizar';

  @override
  String get careerCategory => 'Carrera';

  @override
  String get loveCategory => 'Amor y Relaciones';

  @override
  String get healthCategory => 'Salud';

  @override
  String get financeCategory => 'Finanzas';

  @override
  String get familyCategory => 'Familia';

  @override
  String get educationCategory => 'Educación';

  @override
  String get travelCategory => 'Viajes';

  @override
  String get spiritualCategory => 'Espiritual';
}
