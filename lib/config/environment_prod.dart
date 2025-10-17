import 'environment.dart';

class ProductionEnvironment extends Environment {
  static const String baseUrl = 'https://your-production-domain.com';
  static const String stripePublishableKey =
      'pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG';
  static const bool isProduction = true;
}
