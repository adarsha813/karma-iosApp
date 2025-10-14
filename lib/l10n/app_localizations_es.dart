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
  String get userIdNotFound => 'ID de usuario no encontrada.';

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
}
