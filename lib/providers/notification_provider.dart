import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // << Add this line
import '../models/notification_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// In your notification_provider.dart
class NotificationProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  int _unreadCount = 0;
  bool _dirty = false;
  bool get notificationsEnabled => _notificationsEnabled;
  int get unreadCount => _unreadCount;

  final List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications =>
      List.unmodifiable(_notifications);

  bool _isNotificationScreenOpen = false;
  bool get isNotificationScreenOpen {
    print('👁️ isNotificationScreenOpen read: $_isNotificationScreenOpen');
    return _isNotificationScreenOpen;
  }

  NotificationProvider() {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    _unreadCount = prefs.getInt('unread_notification_count') ?? 0;
    notifyListeners();
  }

  // ✅ UPDATED: Properly disable notifications
  void setNotificationsEnabled(bool value) async {
    _notificationsEnabled = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);

    // ✅ CRITICAL: Clear all notifications when disabled
    if (!value) {
      await _clearAllSystemNotifications();
    }

    print("🔔 Notifications ${value ? 'enabled' : 'disabled'}");
  }

  // ✅ NEW: Clear all system notifications
  Future<void> _clearAllSystemNotifications() async {
    try {
      final notificationsPlugin = FlutterLocalNotificationsPlugin();
      await notificationsPlugin.cancelAll();
      print("🗑️ Cleared all system notifications");
    } catch (e) {
      print("⚠️ Error clearing system notifications: $e");
    }
  }

  // ... rest of your existing methods ...

  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
    notifyListeners();
  }

  void setNotificationScreenOpen(bool isOpen) {
    _isNotificationScreenOpen = isOpen;
    print('🔄 setNotificationScreenOpen: $isOpen');

    if (isOpen) {
      clearUnreadCount();
    }
    notifyListeners();
  }

  Future<void> setUnreadCount(int count) async {
    _unreadCount = count;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', count);
  }

  Future<void> incrementUnreadCount() async {
    if (_unreadCount < 0) _unreadCount = 0;
    _unreadCount++;
    notifyListeners();
    _dirty = true; // ✅ Mark dirty before persisting
    await _persistCount();
    _updateBadge();
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
    _unreadCount = 0;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', 0);

    _updateBadge();
  }

  Future<void> _updateBadge() async {
    if (_unreadCount > 0) {
      FlutterAppBadger.updateBadgeCount(_unreadCount);
    } else {
      FlutterAppBadger.removeBadge();
    }
  }
}
