import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/chat_screen.dart';
import 'screens/dailyHoroscope_screen.dart';
import 'services/fcm_service.dart';
import 'services/chat_service.dart';
import 'services/HoroscopeService.dart';
import 'providers/profile_provider.dart';
import 'providers/LocaleProvider.dart';
import 'providers/notification_provider.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

// -------------------------
// PendingNotificationNavigation as ChangeNotifier
class PendingNotificationNavigation extends ChangeNotifier {
  String? _payload;

  String? get payload => _payload;

  set payload(String? value) {
    if (_payload != value) {
      _payload = value;
      notifyListeners();
    }
  }
}

final pendingNavigation = PendingNotificationNavigation();

// -------------------------
// Notification channel for Android
const AndroidNotificationChannel horoscopeChannel = AndroidNotificationChannel(
  'horoscope_channel',
  'Horoscope Notifications',
  description: 'Notifications for new daily horoscopes',
  importance: Importance.high,
);

// Local notifications plugin instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Background message handler for FCM
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('📩 [Background] Message received: ${message.messageId}');
}

// Create notification channel (for Android 8.0+)
Future<void> setupHoroscopeChannel() async {
  final androidImplementation =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
  if (androidImplementation != null) {
    await androidImplementation.createNotificationChannel(horoscopeChannel);
    print('✅ Horoscope notification channel created');
  }
}

// Background notification tap handler
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  final payload = response.payload;
  if (payload != null) {
    print('📱 (Background) Notification tapped: $payload');
    pendingNavigation.payload = payload;
  }
}

// -------------------------
// HomeRouter widget: navigates on notification payload
class HomeRouter extends StatefulWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  State<HomeRouter> createState() => _HomeRouterState();
}

class _HomeRouterState extends State<HomeRouter> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    // Listen to payload changes and navigate if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = Provider.of<PendingNotificationNavigation>(
        context,
        listen: false,
      );
      notifier.addListener(_handlePayload);
    });
  }

  void _handlePayload() {
    final payload = pendingNavigation.payload;

    if (!_navigated && payload != null) {
      try {
        final data = jsonDecode(payload);

        if (data['type'] == 'horoscope' && data['userId'] != null) {
          _navigated = true;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => DailyHoroscopeScreen(userId: data['userId']),
            ),
          );
          pendingNavigation.payload = null;
        }
      } catch (e) {
        print('Error parsing notification payload: $e');
        pendingNavigation.payload = null;
      }
    }
  }

  @override
  void dispose() {
    Provider.of<PendingNotificationNavigation>(
      context,
      listen: false,
    ).removeListener(_handlePayload);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default fallback screen
    return const ChatScreen();
  }
}

// -------------------------
// Main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG'; // Replace with your publishable key

  await Firebase.initializeApp();
  await setupHoroscopeChannel();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final profileProvider = ProfileProvider();
  await profileProvider.loadUserId();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('🔑 FCM Token: $fcmToken');

  if (profileProvider.userId != null && fcmToken != null) {
    await sendFcmTokenToBackend(profileProvider.userId!, fcmToken);
  }

  await _requestNotificationPermission();

  if (profileProvider.userId != null) {
    HoroscopeService().initSocket(profileProvider.userId!);
  } else {
    print("⚠️ userId is null, skipping HoroscopeService.initSocket");
  }

  // Initialize local notifications plugin
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSettings);

  // Handle app launch from notification
  final launchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (launchDetails?.didNotificationLaunchApp ?? false) {
    final payload = launchDetails!.notificationResponse?.payload;
    if (payload != null) {
      pendingNavigation.payload = payload;
      print('🚀 App launched from notification with payload: $payload');
    }
  }

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      final payload = response.payload;
      if (payload != null) {
        print('🔔 Notification tapped with payload: $payload');
        pendingNavigation.payload = payload;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final payload = jsonEncode(message.data);
    print('📲 App opened from FCM tap with data: $payload');
    pendingNavigation.payload = payload;
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider<ProfileProvider>.value(value: profileProvider),
        ChangeNotifierProvider<PendingNotificationNavigation>.value(
          value: pendingNavigation,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// Request notification permission (especially iOS)
Future<void> _requestNotificationPermission() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);

  print('🔐 Notification permission status: ${settings.authorizationStatus}');
}

// -------------------------
// Root app widget
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Listen to FCM messages while app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = notification?.android;

      if (notification != null && android != null) {
        print('🔔 [Foreground] ${notification.title} - ${notification.body}');
        // Handle in-app display or sound here if desired
      }
    });

    // Also listen for taps on notifications while app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final payload = jsonEncode(message.data);
      print('📲 App opened from FCM tap with data: $payload');
      pendingNavigation.payload = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    if (localeProvider.isLoading) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale,
      home: const HomeRouter(),
    );
  }
}
