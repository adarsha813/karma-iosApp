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
  String get notificationSettings => 'Ajustes de notificacion';

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
  String get birthTimeLabel => 'Tiempo de nacimiento';

  @override
  String get birthTimePlaceholder => 'Seleccione el tiempo de nacimiento';

  @override
  String get saveProfileButton => 'Guardar perfil';

  @override
  String get noCitiesFound => 'No hay ciudades encontradas';

  @override
  String cityPlaceholder(Object country) {
    return 'Entra en la ciudad';
  }

  @override
  String get countryFirstPlaceholder => 'Seleccionar país primero';

  @override
  String get versionHistoryTitle => 'Versión Historia';

  @override
  String get notSetText => 'No está listo';

  @override
  String nameHistory(Object name) {
    return 'Nombre: $name';
  }

  @override
  String cityHistory(Object city) {
    return 'Ciudad:';
  }

  @override
  String countryHistory(Object country, Object pais) {
    return 'País: $pais';
  }

  @override
  String genderHistory(Object gender, Object genero) {
    return 'Género: $genero';
  }

  @override
  String birthDateHistory(Object date, Object fecha) {
    return 'Fecha de nacimiento: $fecha';
  }

  @override
  String birthTimeHistory(Object time) {
    return 'Hora de nacimiento:';
  }

  @override
  String locationHistory(
    Object latitud,
    Object latitude,
    Object longitud,
    Object longitude,
  ) {
    return 'Ubicación: $latitud, $longitud';
  }

  @override
  String timezoneHistory(Object offset) {
    return 'Zona horaria: GMT$offset';
  }

  @override
  String dstHistory(Object valor, Object value) {
    return 'DST: $valor';
  }

  @override
  String stateHistory(Object state) {
    return 'Estado:';
  }

  @override
  String versionFromText(Object date) {
    return 'Versión de $date';
  }

  @override
  String get userIdRequired => 'Se requiere ID de usuario';

  @override
  String get profileSaved => 'Perfil guardado con exito';

  @override
  String get saveFailed => 'Failed to save profile';

  @override
  String get errorPrefix => 'Error:';

  @override
  String get onboardingChooseLanguage => 'Elige tu idioma';

  @override
  String get onboardingChooseLanguageDesc =>
      'Selecciona tu idioma preferido para continuar.';

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
  String get onboardingHowToUse => 'Cómo usar esta aplicación?';

  @override
  String get onboardingHowToUseDesc =>
      'Navega fácilmente, consulta los horóscopos diarios y administra tu perfil para predicciones precisas.';

  @override
  String get onboardingGetStarted => 'Comenzar';

  @override
  String get onboardingNewUser => 'Nuevo usuario';

  @override
  String get onboardingExistingUser => 'Usuario existente';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingNext => 'Siguiente';
}
