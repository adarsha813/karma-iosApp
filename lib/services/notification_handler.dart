import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../providers/notification_provider.dart';

class NotificationHandler {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// 🔹 Initialize notifications (CALL ONCE in main)
  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings, // ✅ REQUIRED for iOS
    );

    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        debugPrint("🔔 Notification tapped: ${response.payload}");
      },
    );

    // Android channel
    const AndroidNotificationChannel paymentChannel =
        AndroidNotificationChannel(
      'payment_channel',
      'Payment Notifications',
      description: 'Purchase confirmations',
      importance: Importance.high,
    );

    final androidPlugin =
        notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidPlugin?.createNotificationChannel(paymentChannel);
  }

  /// 🔹 App-level notification toggle check
  static bool _isAppNotificationEnabled(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(
      context,
      listen: false,
    );
    return provider.notificationsEnabled;
  }

  /// 🔹 Simple system notification (no context needed)
  static Future<void> showSystemNotification(dynamic data) async {
    final category = data['category']?.toString() ?? 'general';
    final message = data['message']?.toString() ?? 'No message provided';

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'payment_channel',
      'Payment Notifications',
      channelDescription: 'Purchase confirmations',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails =
        DarwinNotificationDetails();

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      "🎉 New ${_capitalize(category)}",
      message,
      details,
    );
  }

  /// 🔹 Context-aware notification (respects app toggle)
  static Future<void> showBasicNotification({
    required String title,
    required String body,
    required BuildContext context,
    String? payload,
    bool force = false,
  }) async {
    if (!force && !_isAppNotificationEnabled(context)) {
      debugPrint("🔕 App notifications disabled — skipping");
      return;
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'General notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails =
        DarwinNotificationDetails();

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await notificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// 🔹 Clear all notifications
  static Future<void> disableAllNotifications() async {
    try {
      await notificationsPlugin.cancelAll();
      debugPrint("🔕 All notifications cleared");
    } catch (e) {
      debugPrint("⚠️ Failed to clear notifications: $e");
    }
  }

  static String _capitalize(String s) =>
      s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
}
