import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  final hasLaunched = prefs.getBool('hasLaunched') ?? false;

  if (!hasLaunched) {
    await prefs.setBool('hasLaunched', true);
    return true;
  }

  return false;
}
