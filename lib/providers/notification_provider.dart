import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // << Add this line
import '../models/notification_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:kundali/config/environment.dart';
import 'dart:convert';

import 'package:logger/logger.dart';

// In your notification_provider.dart
class NotificationProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  int _unreadCount = 0;
  bool _dirty = false;
  bool get notificationsEnabled => _notificationsEnabled;
  int get unreadCount => _unreadCount;
  bool _isDisposed = false;
  final _logger = Logger(); // local logger for this file
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
  // ✅ SAFE: Dispose pattern for provider
  void disposeProvider() {
    _isDisposed = true;
    _logger.d('🛑 NotificationProvider disposed');
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

  // ✅ UPDATED: Safe screen state update
  void setNotificationScreenOpen(bool isOpen) {
    if (_isNotificationScreenOpen == isOpen) return;

    _isNotificationScreenOpen = isOpen;
    _logger.d('🖥️ Notification screen open: $isOpen');

    _safeNotifyListeners();
  }

  // ✅ ENHANCED: Mark all notifications as read with lifecycle awareness
  Future<void> markAllNotificationsAsRead({bool silent = false}) async {
    if (_isDisposed) {
      _logger.d('ℹ️ Skip markAllNotificationsAsRead - provider disposed');
      return;
    }

    try {
      _logger.d('📖 Marking all notifications as read (silent: $silent)');

      // Your existing mark as read logic...
      final response = await http.post(
        Uri.parse('${Environment.baseUrl}/notifications/mark-all-read'),
        headers: Environment.securityHeaders,
        body: jsonEncode({
          "userId": _getCurrentUserId(),
        }), // You'll need to implement this
      );

      if (response.statusCode == 200) {
        if (!silent) {
          _unreadCount = 0;
          _safeNotifyListeners();
          await _updateBadge();
        }
        _logger.d('✅ All notifications marked as read');
      } else {
        throw Exception('HTTP ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      _logger.e(
        '⛔ Error in mark_all_notifications_read',
        error: e,
        stackTrace: stackTrace,
      );
      if (!silent) rethrow;
    }
  }

  // Add this helper method
  String _getCurrentUserId() {
    // You'll need to get the current user ID from your auth system
    // This is just a placeholder - implement based on your auth setup
    return 'current-user-id';
  }

  // ✅ ENTERPRISE: Safe notification method
  // ✅ ENTERPRISE: Safe notification method
  void _safeNotifyListeners() {
    if (_isDisposed || !hasListeners) {
      _logger.d(
        'ℹ️ Skip notify: disposed=$_isDisposed, hasListeners=$hasListeners',
      );
      return;
    }

    try {
      // Double-check we're not in a bad state using microtask
      Future.microtask(() {
        if (!_isDisposed && hasListeners) {
          notifyListeners();
          _logger.d('✅ Listeners notified safely');
        }
      });
    } catch (e) {
      // Check if this is a "defunct" or "locked" error (expected during dispose)
      final errorStr = e.toString();
      final isExpectedError =
          errorStr.contains('defunct') ||
          errorStr.contains('locked') ||
          errorStr.contains('Future already completed');

      if (!isExpectedError) {
        _logger.e('🚨 Unexpected error in safeNotifyListeners', error: e);
      } else {
        _logger.d('ℹ️ Expected error during dispose: $errorStr');
      }
    }
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
