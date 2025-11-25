import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../providers/notification_provider.dart';

class NotificationHandler {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await notificationsPlugin.initialize(initSettings);

    const AndroidNotificationChannel paymentChannel =
        AndroidNotificationChannel(
          'payment_channel',
          'Payment Notifications',
          description: 'Purchase confirmations',
          importance: Importance.high,
        );

    final androidPlugin =
        notificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    await androidPlugin?.createNotificationChannel(paymentChannel);
  }

  // ✅ UPDATED: Check both app toggle AND system permissions
  static Future<bool> _areNotificationsEnabled(BuildContext context) async {
    try {
      // 1. Check app-level toggle
      final notificationProvider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );

      if (!notificationProvider.notificationsEnabled) {
        debugPrint("🔕 App notifications disabled via toggle");
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
        debugPrint("🔕 System notifications disabled");
        return false;
      }

      return true;
    } catch (e) {
      debugPrint("⚠️ Error checking notification permissions: $e");
      return true; // Default to enabled if there's an error
    }
  }

  static void showSystemNotification(dynamic data) {
    final category = data['category']?.toString() ?? 'general';
    final message = data['message']?.toString() ?? 'No message provided';

    const androidDetails = AndroidNotificationDetails(
      'payment_channel',
      'Payment Notifications',
      channelDescription: 'Purchase confirmations',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    notificationsPlugin.show(
      0,
      "🎉 New ${_capitalize(category)}",
      message,
      notificationDetails,
    );
  }

  static Future<void> showBasicNotification({
    required String title,
    required String body,
    String? payload,
    required BuildContext context,
    bool force = false, // Only for critical notifications
  }) async {
    // ✅ STRICT CHECK: Don't show if disabled (unless forced for critical alerts)
    if (!force && !await _areNotificationsEnabled(context)) {
      debugPrint(
        "🔕 Notifications disabled - skipping ALL system notifications",
      );
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default',
      channelDescription: 'Default notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await notificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // ✅ NEW: Method to completely disable ALL notifications
  static Future<void> disableAllNotifications() async {
    try {
      // Clear all pending notifications
      await notificationsPlugin.cancelAll();

      debugPrint("🔕 All notifications disabled and cleared");
    } catch (e) {
      debugPrint("⚠️ Error disabling notifications: $e");
    }
  }

  static String _capitalize(String s) =>
      s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
}
