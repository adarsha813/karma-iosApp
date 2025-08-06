import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

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

    // 🔔 Create the payment channel
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
  }) async {
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

  static String _capitalize(String s) =>
      s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;

  static Future<void> showPaymentNotification(int questions) async {
    const androidDetails = AndroidNotificationDetails(
      'payment_channel',
      'Payment Notifications',
      channelDescription: 'Purchase confirmations',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await notificationsPlugin.show(
      0,
      '🎉 Purchase Successful',
      'You have purchased $questions questions!',
      notificationDetails,
      payload: json.encode({'type': 'payment', 'questions': questions}),
    );
  }
}
