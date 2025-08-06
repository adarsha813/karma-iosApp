import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // << Add this line

class NotificationProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  int _unreadCount = 0; // Track unread count
  bool _dirty = false; // Track if count needs persistence

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
    print(
      '[Notification] Incrementing count from $_unreadCount to ${_unreadCount + 1}',
    );
    _unreadCount++;
    print('Unread count incremented: $_unreadCount');
    _dirty = true;
    print('Increment unread count: $_unreadCount'); // <-- Add this
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', _unreadCount);

    if (_unreadCount > 0) {
      FlutterAppBadger.updateBadgeCount(_unreadCount);
    } else {
      FlutterAppBadger.removeBadge();
    }

    await _persistCount();
  }

  Future<void> _persistCount() async {
    if (_dirty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('unread_notification_count', _unreadCount);
      _dirty = false;
    }
  }

  Future<void> reloadUnreadCount() async {
    final prefs = await SharedPreferences.getInstance();
    _unreadCount = prefs.getInt('unread_notification_count') ?? 0;
    notifyListeners();
  }

  Future<void> clearUnreadCount() async {
    print('[Notification] Clearing count');
    _unreadCount = 0;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', 0);
  }
}
