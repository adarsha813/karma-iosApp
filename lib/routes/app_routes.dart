import 'package:flutter/material.dart';
import '../screens/profile_settings_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/recovery_screen.dart';

class AppRoutes {
  static const String profileSettings = '/profile-settings';
  static const String settings = '/settings';
  static const String chat = '/chat';
  static const String recovery = '/recovery';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case profileSettings:
        return MaterialPageRoute(builder: (_) => const ProfileSettingsScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case chat:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(chatId: null),
        );
      case recovery:
        return MaterialPageRoute(builder: (_) => const RecoveryScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${routeSettings.name}'),
                ),
              ),
        );
    }
  }
}
