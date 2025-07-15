import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'services/fcm_service.dart';
import 'l10n/app_localizations.dart';
import 'screens/chat_screen.dart';
import 'services/chat_service.dart';
import 'providers/profile_provider.dart';
import 'providers/LocaleProvider.dart';
import 'providers/notification_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'services/HoroscopeService.dart'; // import at the top

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('📩 [Background] Message: ${message.messageId}');
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel horoscopeChannel = AndroidNotificationChannel(
  'horoscope_channel',
  'Horoscope Notifications',
  description: 'Notifications for new daily horoscopes',
  importance: Importance.high,
);

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

@pragma('vm:entry-point') // required if app is terminated
void notificationTapBackground(NotificationResponse response) {
  final payload = response.payload;
  if (payload != null) {
    print('📱 (Background) Notification tapped: $payload');
    // Handle logic here (e.g., save to local DB)
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupHoroscopeChannel(); // ✅ ADD THIS
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Load ProfileProvider before app launch
  final profileProvider = ProfileProvider();
  await profileProvider.loadUserId();

  // Get and send FCM token
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('🔑 FCM Token: $fcmToken');
  await sendFcmTokenToBackend(profileProvider.userId, fcmToken);

  // Request permissions
  await _requestNotificationPermission();

  HoroscopeService().initSocket(profileProvider.userId!);

  // Initialize local notifications
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSettings);

  // Handle app launched via notification
  final launchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (launchDetails?.didNotificationLaunchApp ?? false) {
    final payload = launchDetails!.notificationResponse?.payload;
    if (payload != null) {
      print('🚀 App launched from notification with payload: $payload');
      // TODO: Navigate using your navigator key or context
    }
  }

  // Listen for notification taps
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      final payload = response.payload;
      if (payload != null) {
        print('🔔 Notification tapped with payload: $payload');
        // TODO: Handle navigation
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider<ProfileProvider>.value(value: profileProvider),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print('🔐 Notification permission: ${settings.authorizationStatus}');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // FCM message received in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = notification?.android;

      if (notification != null && android != null) {
        // ✅ Only show FCM notification if app is NOT in foreground
        if (!WidgetsBinding.instance.lifecycleState.toString().contains(
          'resumed',
        )) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'default_channel',
                'Default',
                importance: Importance.max,
                priority: Priority.high,
              ),
            ),
          );
        } else {
          print(
            '🔕 Skipped FCM notification in foreground to avoid duplication',
          );
        }
      }

      print('🔔 [Foreground] ${notification?.title} - ${notification?.body}');
    });

    // FCM notification tap while app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final data = message.data;
      print('📲 App opened from FCM tap with data: $data');
      // TODO: Navigate using context if needed
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
      home: const ChatScreen(),
    );
  }
}
