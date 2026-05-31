import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import '../models/notification_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kundali/config/environment.dart';
import 'package:kundali/services/http_service.dart'; // ✅ Add HttpService
import 'dart:convert';
import 'package:logger/logger.dart';
import '../utils/app_logger.dart';

class NotificationProvider extends ChangeNotifier {
  // Core properties
  bool _notificationsEnabled = true;
  int _unreadCount = 0;
  bool _dirty = false;
  bool _isDisposed = false;
  bool _isNotificationScreenOpen = false;

  // ✅ Add missing properties for granular notification control
  bool _chatNotifications = true;
  bool _horoscopeNotifications = true;
  bool _promotionalNotifications = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  final Logger _logger = Logger();
  final List<NotificationModel> _notifications = [];

  // HttpService instance
  final HttpService _httpService = HttpService();

  // Getters
  bool get notificationsEnabled => _notificationsEnabled;
  int get unreadCount => _unreadCount;
  List<NotificationModel> get notifications =>
      List.unmodifiable(_notifications);
  bool get isNotificationScreenOpen => _isNotificationScreenOpen;

  // ✅ New getters for granular controls
  bool get chatNotifications => _chatNotifications;
  bool get horoscopeNotifications => _horoscopeNotifications;
  bool get promotionalNotifications => _promotionalNotifications;
  bool get soundEnabled => _soundEnabled;
  bool get vibrationEnabled => _vibrationEnabled;

  NotificationProvider() {
    _loadFromPrefs();
  }

  // Dispose pattern
  void disposeProvider() {
    _isDisposed = true;
    _logger.d('🛑 NotificationProvider disposed');
  }

  // Load all preferences from SharedPreferences
  Future<void> _loadFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
      _unreadCount = prefs.getInt('unread_notification_count') ?? 0;

      // ✅ Load granular preferences
      _chatNotifications = prefs.getBool('chat_notifications') ?? true;
      _horoscopeNotifications =
          prefs.getBool('horoscope_notifications') ?? true;
      _promotionalNotifications =
          prefs.getBool('promotional_notifications') ?? true;
      _soundEnabled = prefs.getBool('sound_enabled') ?? true;
      _vibrationEnabled = prefs.getBool('vibration_enabled') ?? true;

      _safeNotifyListeners();
      _logger.d('✅ Loaded notification preferences from storage');
    } catch (e) {
      _logger.e('Error loading from prefs', error: e);
    }
  }

  // ✅ Main toggle for all notifications
  Future<void> setNotificationsEnabled(bool value) async {
    if (_notificationsEnabled == value) return;

    _notificationsEnabled = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('notifications_enabled', value);

      // Clear all notifications when disabled
      if (!value) {
        await _clearAllSystemNotifications();
        await clearUnreadCount();
      }

      // Sync with backend
      await _syncPreferencesWithBackend();

      AppLogger.info("🔔 Notifications ${value ? 'enabled' : 'disabled'}");
    } catch (e) {
      _logger.e('Error setting notifications enabled', error: e);
    }
  }

  // ✅ Toggle chat notifications
  Future<void> setChatNotifications(bool value) async {
    if (_chatNotifications == value) return;

    _chatNotifications = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('chat_notifications', value);
      await _syncPreferencesWithBackend();
      AppLogger.info("💬 Chat notifications ${value ? 'enabled' : 'disabled'}");
    } catch (e) {
      _logger.e('Error setting chat notifications', error: e);
    }
  }

  // ✅ Toggle horoscope notifications
  Future<void> setHoroscopeNotifications(bool value) async {
    if (_horoscopeNotifications == value) return;

    _horoscopeNotifications = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('horoscope_notifications', value);
      await _syncPreferencesWithBackend();
      AppLogger.info(
        "🔮 Horoscope notifications ${value ? 'enabled' : 'disabled'}",
      );
    } catch (e) {
      _logger.e('Error setting horoscope notifications', error: e);
    }
  }

  // ✅ Toggle promotional notifications
  Future<void> setPromotionalNotifications(bool value) async {
    if (_promotionalNotifications == value) return;

    _promotionalNotifications = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('promotional_notifications', value);
      await _syncPreferencesWithBackend();
      AppLogger.info(
        "🎁 Promotional notifications ${value ? 'enabled' : 'disabled'}",
      );
    } catch (e) {
      _logger.e('Error setting promotional notifications', error: e);
    }
  }

  // ✅ Toggle sound
  void setSoundEnabled(bool value) async {
    if (_soundEnabled == value) return;

    _soundEnabled = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('sound_enabled', value);
      await _syncPreferencesWithBackend();
      AppLogger.info("🔊 Sound ${value ? 'enabled' : 'disabled'}");
    } catch (e) {
      _logger.e('Error setting sound', error: e);
    }
  }

  // ✅ Toggle vibration
  Future<void> setVibrationEnabled(bool value) async {
    if (_vibrationEnabled == value) return;

    _vibrationEnabled = value;
    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('vibration_enabled', value);
      await _syncPreferencesWithBackend();
      AppLogger.info("📳 Vibration ${value ? 'enabled' : 'disabled'}");
    } catch (e) {
      _logger.e('Error setting vibration', error: e);
    }
  }

  // ✅ Disable all notifications (used by NotificationHandler)
  Future<void> disableAll() async {
    _notificationsEnabled = false;
    _chatNotifications = false;
    _horoscopeNotifications = false;
    _promotionalNotifications = false;
    _soundEnabled = false;
    _vibrationEnabled = false;

    _safeNotifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('notifications_enabled', false);
      await prefs.setBool('chat_notifications', false);
      await prefs.setBool('horoscope_notifications', false);
      await prefs.setBool('promotional_notifications', false);
      await prefs.setBool('sound_enabled', false);
      await prefs.setBool('vibration_enabled', false);

      await _clearAllSystemNotifications();
      await clearUnreadCount();
      await _syncPreferencesWithBackend();

      AppLogger.info("🔕 All notifications disabled");
    } catch (e) {
      _logger.e('Error disabling all notifications', error: e);
    }
  }

  // ✅ Sync preferences with backend using HttpService
  Future<void> _syncPreferencesWithBackend() async {
    try {
      final userId = _getCurrentUserId();
      if (userId.isEmpty) return;

      await _httpService.post(
        '${Environment.baseUrl}/api/notification-preferences',
        body: {
          'userId': userId,
          'preferences': {
            'enabled': _notificationsEnabled,
            'chat': _chatNotifications,
            'horoscope': _horoscopeNotifications,
            'promotional': _promotionalNotifications,
            'sound': _soundEnabled,
            'vibration': _vibrationEnabled,
          },
          'timestamp': DateTime.now().toIso8601String(),
        },
        requiresAuth: true,
      );

      _logger.d('✅ Preferences synced with backend');
    } catch (e) {
      _logger.d('⚠️ Failed to sync preferences with backend: $e');
      // Don't throw - this is a background operation
    }
  }

  // Clear all system notifications
  Future<void> _clearAllSystemNotifications() async {
    try {
      final notificationsPlugin = FlutterLocalNotificationsPlugin();
      await notificationsPlugin.cancelAll();
      AppLogger.info("🗑️ Cleared all system notifications");
    } catch (e) {
      AppLogger.info("⚠️ Error clearing system notifications: $e");
    }
  }

  // Notification management methods
  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
    _safeNotifyListeners();
  }

  void setNotificationScreenOpen(bool isOpen) {
    if (_isNotificationScreenOpen == isOpen) return;

    _isNotificationScreenOpen = isOpen;
    _logger.d('🖥️ Notification screen open: $isOpen');
    _safeNotifyListeners();
  }

  // Mark all notifications as read
  Future<void> markAllNotificationsAsRead({bool silent = false}) async {
    if (_isDisposed) {
      _logger.d('ℹ️ Skip markAllNotificationsAsRead - provider disposed');
      return;
    }

    try {
      _logger.d('📖 Marking all notifications as read (silent: $silent)');

      final userId = _getCurrentUserId();
      if (userId.isEmpty) return;

      final response = await _httpService.post(
        '${Environment.baseUrl}/notifications/mark-all-read',
        body: {"userId": userId},
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        if (!silent) {
          _unreadCount = 0;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('unread_notification_count', 0);
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

  // Get current user ID (implement based on your auth system)
  String _getCurrentUserId() {
    // This could come from ProfileProvider
    return '';
  }

  // Safe notify listeners
  void _safeNotifyListeners() {
    if (_isDisposed || !hasListeners) {
      _logger.d(
        'ℹ️ Skip notify: disposed=$_isDisposed, hasListeners=$hasListeners',
      );
      return;
    }

    try {
      Future.microtask(() {
        if (!_isDisposed && hasListeners) {
          notifyListeners();
          _logger.d('✅ Listeners notified safely');
        }
      });
    } catch (e) {
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

  // Unread count management
  Future<void> setUnreadCount(int count) async {
    _unreadCount = count;
    _safeNotifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', count);
    await _updateBadge();
  }

  Future<void> incrementUnreadCount() async {
    if (_unreadCount < 0) _unreadCount = 0;
    _unreadCount++;
    _safeNotifyListeners();
    _dirty = true;
    await _persistCount();
    await _updateBadge();
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
    _safeNotifyListeners();
  }

  Future<void> clearUnreadCount() async {
    _unreadCount = 0;
    _safeNotifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unread_notification_count', 0);
    await _updateBadge();
  }

  // Badge management
  Future<void> _updateBadge() async {
    try {
      if (_unreadCount > 0) {
        FlutterAppBadger.updateBadgeCount(_unreadCount);
      } else {
        FlutterAppBadger.removeBadge();
      }
    } catch (e) {
      _logger.e('Error updating badge', error: e);
    }
  }

  // Fetch notifications from backend
  Future<List<NotificationModel>> fetchNotifications({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final userId = _getCurrentUserId();
      if (userId.isEmpty) return [];

      final response = await _httpService.get(
        '${Environment.baseUrl}/notifications?userId=$userId&page=$page&limit=$limit',
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final List<dynamic> notificationsJson = data['data'] ?? data;

        final notifications =
            notificationsJson
                .map((json) => NotificationModel.fromJson(json))
                .toList();

        _notifications.clear();
        _notifications.addAll(notifications);
        _safeNotifyListeners();

        return notifications;
      }
      return [];
    } catch (e) {
      _logger.e('Error fetching notifications', error: e);
      return [];
    }
  }
}
