import 'package:flutter/material.dart'; // For BuildContext
import 'package:provider/provider.dart'; // For Provider
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../providers/notification_provider.dart'; // Import your NotificationProvider

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
    bool force = false, // ✅ optional: force showing even if toggle off
  }) async {
    // 1️⃣ Check in-app toggle
    final notificationProvider = Provider.of<NotificationProvider>(
      context,
      listen: false,
    );

    // Skip showing in notification bar if toggle is off
    if (!notificationProvider.notificationsEnabled && !force) {
      print("🔕 Notifications disabled → skipping system notification");
      return;
    }

    // 2️⃣ Check system-level settings
    final androidPlugin =
        notificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    final areEnabled = await androidPlugin?.areNotificationsEnabled() ?? true;

    if (!areEnabled) {
      print("🔕 System notifications disabled → skipping notification");
      return;
    }

    // 3️⃣ Show notification only if both are enabled
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

  // ✅ Add missing helper
  static String _capitalize(String s) =>
      s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
}
