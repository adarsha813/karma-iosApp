import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // << Add this line
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
import 'services/notification_handler.dart';
import 'services/socket_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/horoscope_provider.dart';
import 'screens/profile_settings_screen.dart';
import 'services/first_launch_service.dart';
import 'screens/onboarding_screen.dart';
import 'providers/dictionary_provider.dart';

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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('📩 [Background] Message received: ${message.messageId}');
  print('📩 Message data: ${message.data}');

  // Initialize Firebase in background isolate
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;

  if (!notificationsEnabled) {
    print('🔕 Notifications disabled - skipping background notification');
    return;
  }

  // Extract data from message
  final data = message.data;
  final type = data['type'] ?? 'general'; // Add type field to your FCM messages
  final title = data['title'] ?? 'New Notification';
  final body = data['body'] ?? 'You have a new message';
  final payload = jsonEncode(data);

  // Update badge count
  int count = prefs.getInt('unread_notification_count') ?? 0;
  count++;
  await prefs.setInt('unread_notification_count', count);

  try {
    FlutterAppBadger.updateBadgeCount(count);
  } catch (e) {
    print("⚠️ Failed to update badge in background: $e");
  }

  // Initialize local notifications
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(initSettings);

  // Create appropriate notification channel based on type
  String channelId = 'general_channel';
  String channelName = 'General Notifications';

  if (type == 'answer') {
    channelId = 'answer_channel';
    channelName = 'Answer Notifications';
  } else if (type == 'clarification') {
    channelId = 'clarification_channel';
    channelName = 'Clarification Notifications';
  } else if (type == 'horoscope') {
    channelId = 'horoscope_channel';
    channelName = 'Horoscope Notifications';
  }

  // Ensure channel exists
  final androidPlugin =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  if (androidPlugin != null) {
    await androidPlugin.createNotificationChannel(
      AndroidNotificationChannel(
        channelId,
        channelName,
        description: 'Notifications for $channelName',
        importance: Importance.high,
      ),
    );
  }

  // Show notification
  final androidDetails = AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: 'Notifications for $channelName',
    importance: Importance.high,
    priority: Priority.high,
    ticker: 'ticker',
  );

  final notificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch % 100000,
    title,
    body,
    notificationDetails,
    payload: payload,
  );

  print('📩 Background notification displayed for type: $type');
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

class BadgeUpdater extends StatefulWidget {
  const BadgeUpdater({Key? key}) : super(key: key);

  @override
  State<BadgeUpdater> createState() => _BadgeUpdaterState();
}

class _BadgeUpdaterState extends State<BadgeUpdater> {
  late NotificationProvider notificationProvider;
  late HoroscopeProvider horoscopeProvider;
  bool _listenersAdded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_listenersAdded) {
      notificationProvider = Provider.of<NotificationProvider>(context);
      horoscopeProvider = Provider.of<HoroscopeProvider>(context);

      notificationProvider.addListener(_updateBadge);
      horoscopeProvider.addListener(_updateBadge);

      _listenersAdded = true;
      _updateBadge(); // initial badge set
    }
  }

  void _updateBadge() {
    final totalUnread =
        notificationProvider.unreadCount + horoscopeProvider.unreadCount;
    if (totalUnread > 0) {
      FlutterAppBadger.updateBadgeCount(totalUnread);
    } else {
      FlutterAppBadger.removeBadge();
    }
  }

  @override
  void dispose() {
    notificationProvider.removeListener(_updateBadge);
    horoscopeProvider.removeListener(_updateBadge);

    _listenersAdded = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // no UI
  }
}

// -------------------------
// HomeRouter widget: navigates on notification payload
class HomeRouter extends StatefulWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  State<HomeRouter> createState() => _HomeRouterState();
}

class _HomeRouterState extends State<HomeRouter> with WidgetsBindingObserver {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 👈 add this

    pendingNavigation.addListener(_handlePayload);
    // Listen to payload changes and navigate if needed

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      if (profileProvider.userId != null) {
        SocketService().initialize(profileProvider.userId!, context);
      }
    });
  }

  void _handlePayload() {
    final payload = pendingNavigation.payload;

    if (!_navigated && payload != null) {
      try {
        final data = jsonDecode(payload);

        if (data['type'] == 'horoscope' && data['userId'] != null) {
          _navigated = true;
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => DailyHoroscopeScreen(userId: data['userId']),
                ),
              )
              .then((_) {
                _navigated = false; // reset when user comes back
              });

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
    pendingNavigation.removeListener(_handlePayload);
    WidgetsBinding.instance.removeObserver(this); // 👈 add this

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('🔄 App resumed, checking socket...');

      final currentUserId =
          Provider.of<ProfileProvider>(context, listen: false).userId;

      if (currentUserId != null && !SocketService().socket.connected) {
        SocketService().initialize(currentUserId, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    if (profileProvider.userId == null || profileProvider.userId!.isEmpty) {
      // 👇 No user logged in → go to Profile Setting
      return ProfileSettingsScreen();
    } else {
      // 👇 User logged in → go to Chat
      return const ChatScreen();
    }
  }
}

// -------------------------
// Main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG'; // Replace with your publishable key

  await Firebase.initializeApp();
  print('🔔 Setting up notification channel...');
  await setupHoroscopeChannel();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  print('📦 Loading profile...');
  final profileProvider = ProfileProvider();
  await profileProvider.loadUserId();

  // ✅ Initialize NotificationHandler here
  await NotificationHandler.init();

  print('🔐 Requesting notification permission...');
  await _requestNotificationPermission();

  String? fcmToken;
  print('📬 Getting FCM token...');
  try {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print('🔑 FCM Token: $fcmToken');

    if (profileProvider.userId != null && fcmToken != null) {
      await sendFcmTokenToBackend(profileProvider.userId!, fcmToken);
    }
  } catch (e) {
    print('❌ Error getting FCM token: $e');
  }

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

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('🔔 [Foreground] Message received: ${message.messageId}');

    final data = message.data;
    final type = data['type'] ?? 'general';

    if (navigatorKey.currentContext == null) {
      print("⚠️ No navigator context to update badge counts");
      return;
    }
    if (type == 'answer' || type == 'clarification') {
      // Show notification using NotificationHandler
      await NotificationHandler.showBasicNotification(
        title: data['title'] ?? 'New Notification',
        body: data['body'] ?? 'You have a new message',
        payload: jsonEncode(message.data),
        context: navigatorKey.currentContext!,
      );

      // Update appropriate provider
      final notificationProvider = Provider.of<NotificationProvider>(
        navigatorKey.currentContext!,
        listen: false,
      );
      await notificationProvider.incrementUnreadCount();
    } else if (type == 'horoscope') {
      // Handle horoscope notifications
      final horoscopeProvider = Provider.of<HoroscopeProvider>(
        navigatorKey.currentContext!,
        listen: false,
      );
      await horoscopeProvider.increment();
    }

    if (type == 'horoscope') {
      // Increment only HoroscopeProvider unread count
      final horoscopeProvider = Provider.of<HoroscopeProvider>(
        navigatorKey.currentContext!,
        listen: false,
      );
      await horoscopeProvider.increment();
    } else {
      // Increment only NotificationProvider unread count
      final notificationProvider = Provider.of<NotificationProvider>(
        navigatorKey.currentContext!,
        listen: false,
      );
      await notificationProvider.incrementUnreadCount();
    }

    await NotificationHandler.showBasicNotification(
      title: message.notification?.title ?? 'New Notification',
      body: message.notification?.body ?? 'You have a new message',
      payload: jsonEncode(message.data),
      context: navigatorKey.currentContext!, // ✅ pass context here
    );
  });
  final firstLaunch = await isFirstLaunch();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(
          create: (_) => DictionaryProvider()..loadDictionary(),
        ),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => HoroscopeProvider()),
        ChangeNotifierProvider<ProfileProvider>.value(value: profileProvider),
        ChangeNotifierProvider<PendingNotificationNavigation>.value(
          value: pendingNavigation,
        ),
      ],
      child: MyApp(firstLaunch: firstLaunch),
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = navigatorKey.currentContext;
    if (context != null && profileProvider.userId != null) {
      SocketService().initialize(profileProvider.userId!, context);
      print('✅ SocketService initialized');
    } else {
      print('⚠️ Cannot initialize SocketService - context or userId is null');
    }
  });
}

Future<void> ensureToken(ProfileProvider profileProvider) async {
  await profileProvider.loadUserId();
  await profileProvider.loadToken();
  print('🛠️ Token from profileProvider: ${profileProvider.token}');

  if (profileProvider.token == null && profileProvider.userId != null) {
    // For dev only: generate fake token
    final token = jwtSimulate(profileProvider.userId!);
    await profileProvider.saveToken(token);
    print('✅ Saved fake token: $token');
  }
}

String jwtSimulate(String userId) {
  // DO NOT USE IN PRODUCTION. This just matches backend's dev fallback.
  // Simulate a JWT payload: { "userId": "xyz" }
  final payload = base64Url.encode(
    utf8.encode(json.encode({'userId': userId})),
  );
  return "dev.${payload}.sig"; // fake token
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
  final bool firstLaunch;
  const MyApp({Key? key, required this.firstLaunch}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showOnboarding = false;

  @override
  void initState() {
    super.initState();

    showOnboarding = widget.firstLaunch;
    // Listen for locale changes
    Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();
      final done = prefs.getBool('onboarding_done') ?? false;
      if (done && showOnboarding) {
        setState(() => showOnboarding = false);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      final android = notification?.android;

      if (notification != null && android != null) {
        print('🔔 [Foreground] ${notification.title} - ${notification.body}');

        if (navigatorKey.currentContext != null) {
          await NotificationHandler.showBasicNotification(
            title: notification.title ?? 'New Notification',
            body: notification.body ?? 'You have a new message',
            payload: jsonEncode(message.data),
            context: navigatorKey.currentContext!, // pass context
          );
        }
      }
    });

    // Also listen for taps on notifications while app in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final payload = jsonEncode(message.data);
      print('📲 App opened from FCM tap with data: $payload');
      pendingNavigation.payload = payload;
    });
  }

  void _finishOnboarding() {
    setState(() {
      showOnboarding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    if (localeProvider.isLoading) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale, // <-- use Provider directly
      routes: {'/chat': (context) => const ChatScreen()},
      home:
          showOnboarding
              ? OnboardingScreen(
                onFinish: _finishOnboarding,
                profileProvider: profileProvider,
              )
              : Stack(
                children: [
                  HomeRouter(), // remove const to allow rebuild on locale change
                  BadgeUpdater(),
                ],
              ),
    );
  }
}
