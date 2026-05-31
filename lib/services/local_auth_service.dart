import 'package:local_auth/local_auth.dart';
import '../utils/app_logger.dart';

class LocalAuthService {
  static final LocalAuthService _instance = LocalAuthService._internal();
  factory LocalAuthService() => _instance;
  LocalAuthService._internal();

  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate(String reason) async {
    try {
      // Check if device supports biometrics
      final bool canAuthenticate = await _auth.canCheckBiometrics;
      if (!canAuthenticate) return true; // Skip if not available

      // Perform authentication
      final bool authenticated = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      return authenticated;
    } catch (e) {
      AppLogger.info('Biometric auth error: $e');
      return false;
    }
  }

  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }
}
