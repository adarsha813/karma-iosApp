abstract class AppConfig {
  static const String appName = 'Astrology Chat';
  static const String appVersion = '1.0.0';
  static const int appVersionCode = 1;
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'production',
  );

  static bool get isProduction => environment == 'production';
  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
}
