import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  int _unreadCount = 0; // Track unread count

  bool get notificationsEnabled => _notificationsEnabled;
  int get unreadCount => _unreadCount;

  NotificationProvider() {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    _unreadCount = prefs.getInt('unread_notification_count') ?? 0;
    notifyListeners();
  }

  void setNotificationsEnabled(bool value) async {
    _notificationsEnabled = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
  }

  Future<void> setUnreadCount(int count) async {
    _unreadCount = count;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', count);
  }

  Future<void> incrementUnreadCount() async {
    _unreadCount++;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', _unreadCount);
  }

  Future<void> clearUnreadCount() async {
    _unreadCount = 0;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', 0);
  }
}
