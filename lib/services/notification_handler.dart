import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../providers/notification_provider.dart';
import '../providers/profile_provider.dart';
import '../services/http_service.dart';
import '../config/environment.dart'; // ✅ Add missing import
import 'dart:convert';

class NotificationHandler {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final HttpService _httpService = HttpService();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await notificationsPlugin.initialize(initSettings);

    // Create all notification channels
    await _createNotificationChannels();
  }

  // Create all notification channels
  static Future<void> _createNotificationChannels() async {
    const channels = [
      AndroidNotificationChannel(
        'payment_channel',
        'Payment Notifications',
        description: 'Purchase confirmations',
        importance: Importance.high,
      ),
      AndroidNotificationChannel(
        'default_channel',
        'Default Notifications',
        description: 'Default app notifications',
        importance: Importance.max,
      ),
      AndroidNotificationChannel(
        'chat_channel',
        'Chat Notifications',
        description: 'New messages and replies',
        importance: Importance.high,
      ),
      AndroidNotificationChannel(
        'horoscope_channel',
        'Horoscope Notifications',
        description: 'Daily horoscope updates',
        importance: Importance.high,
      ),
      AndroidNotificationChannel(
        'promo_channel',
        'Promotional Notifications',
        description: 'Offers and promotions',
        importance: Importance.defaultImportance,
      ),
    ];

    final androidPlugin =
        notificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    for (final channel in channels) {
      await androidPlugin?.createNotificationChannel(channel);
    }

    //AppLogger.info("✅ All notification channels created");
  }

  // Check both app toggle AND system permissions
  static Future<bool> _areNotificationsEnabled(BuildContext context) async {
    try {
      // 1. Check app-level toggle
      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      if (!notificationProvider.notificationsEnabled) {
        //AppLogger.info("🔕 App notifications disabled via toggle");
        return false;
      }

      // 2. Check system-level permissions
      final androidPlugin =
          notificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      final systemEnabled =
          await androidPlugin?.areNotificationsEnabled() ?? true;

      if (!systemEnabled) {
        //AppLogger.info("🔕 System notifications disabled");
        return false;
      }

      return true;
    } catch (e) {
      //AppLogger.info("⚠️ Error checking notification permissions: $e");
      return true; // Default to enabled if there's an error
    }
  }

  // Show system notification with category
  static Future<void> showSystemNotification(
    dynamic data, {
    BuildContext? context,
  }) async {
    final category = data['category']?.toString() ?? 'general';
    final message = data['message']?.toString() ?? 'No message provided';
    final title =
        data['title']?.toString() ?? "🎉 New ${_capitalize(category)}";

    // Check if notifications are enabled (if context provided)
    if (context != null && !await _areNotificationsEnabled(context)) {
      //AppLogger.info(   "🔕 Notifications disabled - skipping system notification", );
      return;
    }

    // Determine which channel to use
    final channelId = _getChannelForCategory(category);

    final androidDetails = AndroidNotificationDetails(
      channelId,
      '${_capitalize(category)} Notifications',
      channelDescription: 'Notifications for $category',
      importance: Importance.high,
      priority: Priority.high,
      enableVibration: true,
      playSound: true,
      showWhen: true,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    await notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique ID
      title,
      message,
      notificationDetails,
      payload: data['payload']?.toString(),
    );

    //AppLogger.info("✅ System notification shown: $title");
  }

  // Get appropriate channel for category
  static String _getChannelForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'payment':
      case 'purchase':
        return 'payment_channel';
      case 'chat':
      case 'message':
        return 'chat_channel';
      case 'horoscope':
        return 'horoscope_channel';
      case 'promo':
      case 'offer':
        return 'promo_channel';
      default:
        return 'default_channel';
    }
  }

  // Show basic notification (existing method)
  static Future<void> showBasicNotification({
    required String title,
    required String body,
    String? payload,
    required BuildContext context,
    bool force = false, // Only for critical notifications
    String category = 'default',
  }) async {
    // STRICT CHECK: Don't show if disabled (unless forced for critical alerts)
    if (!force && !await _areNotificationsEnabled(context)) {
      //AppLogger.info(  "🔕 Notifications disabled - skipping ALL system notifications"  );
      return;
    }

    final channelId = _getChannelForCategory(category);

    final androidDetails = AndroidNotificationDetails(
      channelId,
      '${_capitalize(category)} Notifications',
      channelDescription: 'Notifications for $category',
      importance: force ? Importance.max : Importance.high,
      priority: force ? Priority.high : Priority.defaultPriority,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    await notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // Sync notification preferences with backend
  static Future<bool> syncNotificationPreferencesWithBackend(
    BuildContext context,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      if (profileProvider.userId == null) {
        //AppLogger.info("⚠️ Cannot sync preferences: No user ID");
        return false;
      }

      // ✅ Use only properties that exist in your NotificationProvider
      final response = await _httpService.post(
        '${Environment.baseUrl}/api/notification-preferences',
        body: {
          'userId': profileProvider.userId,
          'preferences': {
            'enabled': notificationProvider.notificationsEnabled,
            // Only include properties that actually exist in your provider
            // Remove these if they don't exist:
            // 'chat': notificationProvider.chatNotifications,
            // 'horoscope': notificationProvider.horoscopeNotifications,
            // 'promotional': notificationProvider.promotionalNotifications,
            // 'sound': notificationProvider.soundEnabled,
            // 'vibration': notificationProvider.vibrationEnabled,
          },
          'timestamp': DateTime.now().toIso8601String(),
        },
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        //AppLogger.info("✅ Notification preferences synced with backend");
        return true;
      } else {
        //AppLogger.info("⚠️ Failed to sync preferences: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      //AppLogger.info("❌ Error syncing notification preferences: $e");
      return false;
    }
  }

  // Fetch notification preferences from backend
  static Future<Map<String, dynamic>?> fetchNotificationPreferences(
    BuildContext context,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      if (profileProvider.userId == null) {
        return null;
      }

      final response = await _httpService.get(
        '${Environment.baseUrl}/api/notification-preferences?userId=${profileProvider.userId}',
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        //AppLogger.info("✅ Fetched notification preferences from backend");
        return data['preferences'] as Map<String, dynamic>?;
      } else {
        //AppLogger.info(   "⚠️ Failed to fetch preferences: ${response.statusCode}", );
        return null;
      }
    } catch (e) {
      //AppLogger.info("❌ Error fetching notification preferences: $e");
      return null;
    }
  }

  // Mark notification as read on backend
  static Future<bool> markNotificationAsRead(
    String notificationId,
    BuildContext context,
  ) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      if (profileProvider.userId == null) {
        return false;
      }

      final response = await _httpService.post(
        '${Environment.baseUrl}/api/notifications/mark-read',
        body: {
          'userId': profileProvider.userId,
          'notificationId': notificationId,
        },
        requiresAuth: true,
      );

      return response.statusCode == 200;
    } catch (e) {
      //AppLogger.info("❌ Error marking notification as read: $e");
      return false;
    }
  }

  // Get unread count from backend
  static Future<int> getUnreadCount(BuildContext context) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      if (profileProvider.userId == null) {
        return 0;
      }

      final response = await _httpService.get(
        '${Environment.baseUrl}/api/notifications/unread-count?userId=${profileProvider.userId}',
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return data['count'] ?? 0;
      }
      return 0;
    } catch (e) {
      //AppLogger.info("❌ Error getting unread count: $e");
      return 0;
    }
  }

  // Clear all notifications
  static Future<void> clearAllNotifications() async {
    await notificationsPlugin.cancelAll();
    //AppLogger.info("🔔 All notifications cleared");
  }

  static Future<void> disableAllNotifications(BuildContext context) async {
    try {
      // Capture provider BEFORE async gap
      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      // Clear notifications
      await notificationsPlugin.cancelAll();

      // Update local provider
      await notificationProvider.setNotificationsEnabled(false);

      // Sync with backend using post-frame callback
      WidgetsBinding.instance.addPostFrameCallback((_) {
        syncNotificationPreferencesWithBackend(context);
      });

      //AppLogger.info("🔕 All notifications disabled and cleared");
    } catch (e) {
      //AppLogger.info("⚠️ Error disabling notifications: $e");
    }
  }

  // Helper method to capitalize strings
  static String _capitalize(String s) =>
      s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
}
