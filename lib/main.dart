import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart' as log;
import 'screens/dailyHoroscope_screen.dart';
import 'package:kundali/config/environment.dart';
import 'services/first_launch_service.dart'; // Add this import

// Config
import 'config/firebase_config.dart';

// Screens
import 'screens/chat_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/notifications_screen.dart';

// Services
import 'services/chat_service.dart';
import 'services/notification_handler.dart';
import 'services/socket_service.dart';
import 'services/device_time_service.dart';
import 'services/error_reporting_service.dart';

// Providers
import 'providers/profile_provider.dart';
import 'providers/LocaleProvider.dart';
import 'providers/notification_provider.dart';
import 'providers/horoscope_provider.dart';
import 'providers/dictionary_provider.dart';
import 'providers/app_lifecycle_provider.dart';

// Localization
import 'l10n/app_localizations.dart';
import 'package:logger/logger.dart';

final _logger = Logger(); // local logger for this file

class SafeWidgetsBinding {
  static void ensureInitialized() {
    WidgetsFlutterBinding.ensureInitialized();

    // Add global error handler for widget lifecycle issues
    PlatformDispatcher.instance.onError = (error, stack) {
      final errorStr = error.toString();

      // Ignore expected widget lifecycle errors
      final isExpectedError =
          errorStr.contains('defunct') ||
          errorStr.contains('locked') ||
          errorStr.contains('Future already completed') ||
          errorStr.contains('setState()') && errorStr.contains('locked');

      if (!isExpectedError) {
        _logger.e('🚨 Platform error', error: error, stackTrace: stack);
      } else {
        _logger.d('ℹ️ Expected platform error (safe to ignore): $errorStr');
      }

      return true; // Prevent app crash
    };
  }
}

// Add this class to your main.dart file
class TextSanitizer {
  static String stripHtmlTags(String htmlText) {
    if (htmlText.isEmpty) return htmlText;

    try {
      // Remove HTML tags using regex
      final withoutHtml = htmlText.replaceAll(RegExp(r'<[^>]*>'), '');

      // Decode HTML entities
      return _decodeHtmlEntities(withoutHtml);
    } catch (e) {
      ProductionLogger.error('Error stripping HTML tags', e);
      return htmlText; // Return original if error occurs
    }
  }

  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&copy;', '©')
        .replaceAll('&reg;', '®');
  }

  static String sanitizeForNotification(String text) {
    if (text.isEmpty) return text;

    // Strip HTML first
    final cleanText = stripHtmlTags(text);

    // Trim and limit length for notifications
    final trimmed = cleanText.trim();

    // Limit length for notification display
    if (trimmed.length > 100) {
      return '${trimmed.substring(0, 100)}...';
    }

    return trimmed;
  }
}

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

  // Ensure payload contains all necessary data

  // Extract data from message
  final data = message.data;
  final type = data['type'] ?? 'general'; // Add type field to your FCM messages

  // ✅ SANITIZE THE TITLE AND BODY
  final rawTitle = data['title'] ?? 'New Notification';
  final rawBody = data['body'] ?? 'You have a new message';

  final sanitizedTitle = TextSanitizer.sanitizeForNotification(rawTitle);
  final sanitizedBody = TextSanitizer.sanitizeForNotification(rawBody);

  final payloadData = {
    'type': data['type'],
    'title': sanitizedTitle, // ✅ Use sanitized title
    'body': sanitizedBody, // ✅ Use sanitized body
    'id': data['id'],
    'userId': data['userId'],
    'questionId': data['questionId'],
    // Add chatId if needed for other types
    if (data['type'] == 'answer' ||
        data['type'] == 'clarification' ||
        data['type'] == 'advice')
      'chatId':
          data['chatId'] ??
          data['questionId'], // Use questionId as fallback for chatId
  };
  final payload = jsonEncode(payloadData);

  // Update badge count
  int count = prefs.getInt('unread_notification_count') ?? 0;

  // Only increment badge for specific types
  if (type == 'notification') {
    count++;
    await prefs.setInt('unread_notification_count', count);

    try {
      FlutterAppBadger.updateBadgeCount(count);
    } catch (e) {
      print("⚠️ Failed to update badge in background: $e");
    }
  } else {
    print('ℹ️ Badge not incremented for chat type: $type');
  }

  try {
    FlutterAppBadger.updateBadgeCount(count);
  } catch (e) {
    print("⚠️ Failed to update badge in background: $e");
  }

  // Increment specific counters
  if (type == 'horoscope') {
    int horoCount = prefs.getInt('unread_horoscope_count') ?? 0;
    horoCount++;
    await prefs.setInt('unread_horoscope_count', horoCount);
    print('📈 Horoscope unread count updated: $horoCount');
  } else if (type == 'notification') {
    // ✅ Only notifications page
    bool isScreenOpen = prefs.getBool('notification_screen_open') ?? false;
    if (!isScreenOpen) {
      int notifCount = prefs.getInt('unread_notifications_page_count') ?? 0;
      notifCount++;
      await prefs.setInt('unread_notifications_page_count', notifCount);
      print('📈 Notifications page unread count updated: $notifCount');
    } else {
      print('ℹ️ Notifications screen open, skipping unread increment');
    }
  } else {
    print('ℹ️ Other types ignored for unread counts');
  }
  // Initialize local notifications
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
  );

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

  // Local notification
  final androidDetails = AndroidNotificationDetails(
    type + "_channel",
    "${type[0].toUpperCase()}${type.substring(1)} Notifications",
    importance: Importance.high,
    priority: Priority.high,
  );

  final iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );
  final notificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch % 100000,
    sanitizedTitle,
    sanitizedBody,
    notificationDetails,
    payload: payload,
  );

  print('📩 Background notification displayed for type: $type');
  print('📩 Sanitized title: $sanitizedTitle');
  print('📩 Sanitized body: $sanitizedBody');
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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

class AppConstants {
  static const String appName = 'Astrology Chat';
  static const String appVersion = '1.0.0';
  static const int appVersionCode = 1;

  // Notification channels
  static const String generalChannel = 'general_channel';
  static const String horoscopeChannel = 'horoscope_channel';
  static const String answerChannel = 'answer_channel';
  static const String clarificationChannel = 'clarification_channel';
}

class ProductionLogger {
  static final log.Logger _logger = log.Logger(
    printer: log.PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void debug(String message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message, [dynamic error]) {
    _logger.w(message, error: error);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
    ErrorReportingService.recordError(error, stackTrace);
  }

  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
    ErrorReportingService.recordError(error, stackTrace);
  }
}

// Notification Payload Model
class NotificationPayload {
  final String type;
  final String? title;
  final String? body;
  final String? userId;
  final String? chatId;
  final String? messageId;
  final DateTime? timestamp;

  NotificationPayload({
    required this.type,
    this.title,
    this.body,
    this.userId,
    this.chatId,
    this.messageId,
    this.timestamp,
  });

  factory NotificationPayload.fromJson(Map<String, dynamic> json) {
    return NotificationPayload(
      type: json['type'] ?? 'general',
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      chatId: json['chatId'],
      messageId: json['messageId'],
      timestamp:
          json['timestamp'] != null
              ? DateTime.parse(json['timestamp'])
              : DateTime.now(),
    );
  }

  factory NotificationPayload.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString);
    return NotificationPayload.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'body': body,
      'userId': userId,
      'chatId': chatId,
      'messageId': messageId,
      'timestamp': timestamp?.toIso8601String(),
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}

// Secure Notification Navigation Handler
class SecureNotificationNavigation extends ChangeNotifier {
  String? _payload;
  bool _isProcessing = false;

  String? get payload => _payload;
  bool get isProcessing => _isProcessing;

  Future<void> setPayload(String? value) async {
    if (_payload != value && !_isProcessing) {
      _isProcessing = true;
      notifyListeners();

      try {
        _payload = value;
        if (value != null) {
          final displayValue =
              value.length > 100 ? '${value.substring(0, 100)}...' : value;
          ProductionLogger.info('Notification payload set: $displayValue');
        }
      } catch (e) {
        ProductionLogger.error('Error setting notification payload', e);
      } finally {
        _isProcessing = false;
        notifyListeners();
      }
    }
  }

  void clear() {
    _payload = null;
    _isProcessing = false;
    notifyListeners();
  }
}

final secureNotificationNavigation = SecureNotificationNavigation();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Secure Local Notifications Setup
class SecureNotificationManager {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get instance => _notificationsPlugin;

  // -------------------- Initialization --------------------
  static Future<void> initialize() async {
    try {
      const androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      const iosSettings = DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _notificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          ProductionLogger.info('Notification tapped: ${response.payload}');
          if (response.payload != null) {
            secureNotificationNavigation.setPayload(response.payload);
          }
        },
        onDidReceiveBackgroundNotificationResponse:
            _handleBackgroundNotificationTap,
      );

      ProductionLogger.info('Local notifications initialized successfully');
    } catch (e, stackTrace) {
      ProductionLogger.fatal(
        'Failed to initialize local notifications',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  static Future<void> _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    ProductionLogger.info('iOS local notification received: $payload');
  }

  @pragma('vm:entry-point')
  static Future<void> _handleBackgroundNotificationTap(
    NotificationResponse response,
  ) async {
    ProductionLogger.info(
      'Background notification tapped: ${response.payload}',
    );
    if (response.payload != null) {
      secureNotificationNavigation.setPayload(response.payload);
    }
  }

  // -------------------- Channels --------------------
  static Future<void> createNotificationChannels() async {
    try {
      final androidPlugin =
          _notificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      if (androidPlugin != null) {
        const channels = [
          AndroidNotificationChannel(
            AppConstants.generalChannel,
            'General Notifications',
            description: 'General notifications for the app',
            importance: Importance.high,
            enableVibration: true,
            playSound: true,
          ),
          AndroidNotificationChannel(
            AppConstants.horoscopeChannel,
            'Horoscope Notifications',
            description: 'Notifications for daily horoscopes',
            importance: Importance.high,
            enableVibration: true,
            playSound: true,
          ),
          AndroidNotificationChannel(
            AppConstants.answerChannel,
            'Answer Notifications',
            description: 'Notifications for chat answers',
            importance: Importance.max,
            enableVibration: true,
            playSound: true,
          ),
          AndroidNotificationChannel(
            AppConstants.clarificationChannel,
            'Clarification Notifications',
            description: 'Notifications for clarification requests',
            importance: Importance.high,
            enableVibration: true,
            playSound: true,
          ),
        ];

        for (final channel in channels) {
          await androidPlugin.createNotificationChannel(channel);
        }

        ProductionLogger.info('All notification channels created successfully');
      }
    } catch (e, stackTrace) {
      ProductionLogger.error(
        'Failed to create notification channels',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  // -------------------- ✅ Show Notification --------------------
  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
    required String channelId,
  }) async {
    try {
      final androidDetails = AndroidNotificationDetails(
        channelId,
        _getChannelName(channelId),
        channelDescription: _getChannelDescription(channelId),
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
      );

      const iosDetails = DarwinNotificationDetails();

      final notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _notificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000, // unique ID
        title,
        body,
        notificationDetails,
        payload: payload,
      );

      ProductionLogger.info('Notification shown: $title');
    } catch (e, stackTrace) {
      ProductionLogger.error('Failed to show notification', e, stackTrace);
    }
  }

  // Helpers to map channel info
  static String _getChannelName(String channelId) {
    switch (channelId) {
      case AppConstants.horoscopeChannel:
        return 'Horoscope Notifications';
      case AppConstants.answerChannel:
        return 'Answer Notifications';
      case AppConstants.clarificationChannel:
        return 'Clarification Notifications';
      default:
        return 'General Notifications';
    }
  }

  static String _getChannelDescription(String channelId) {
    switch (channelId) {
      case AppConstants.horoscopeChannel:
        return 'Notifications for daily horoscopes';
      case AppConstants.answerChannel:
        return 'Notifications for chat answers';
      case AppConstants.clarificationChannel:
        return 'Notifications for clarification requests';
      default:
        return 'General app notifications';
    }
  }
}

// Stripe Service
class StripeService {
  static Future<void> initialize() async {
    try {
      await Stripe.instance.applySettings();
      ProductionLogger.info('Stripe initialized successfully');
    } catch (e, stackTrace) {
      ProductionLogger.error('Failed to initialize Stripe', e, stackTrace);
    }
  }
}

// Secure FCM Background Handler
@pragma('vm:entry-point')
Future<void> _secureFirebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp(options: await FirebaseConfig.getOptions());

  ProductionLogger.info('Background message received: ${message.messageId}');

  try {
    final prefs = await SharedPreferences.getInstance();
    final notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;

    if (!notificationsEnabled) {
      ProductionLogger.info(
        'Notifications disabled - skipping background notification',
      );
      return;
    }

    final data = message.data;
    final type = data['type'] ?? 'general';

    // ✅ SANITIZE THE TITLE AND BODY
    final rawTitle = data['title'] ?? 'New Notification';
    final rawBody = data['body'] ?? 'You have a new message';

    final sanitizedTitle = TextSanitizer.sanitizeForNotification(rawTitle);
    final sanitizedBody = TextSanitizer.sanitizeForNotification(rawBody);

    // Validate required fields based on type
    if (!_validateNotificationData(type, data)) {
      ProductionLogger.warning('Invalid notification data for type: $type');
      return;
    }

    // Create sanitized payload
    final sanitizedData = Map<String, dynamic>.from(data);
    sanitizedData['title'] = sanitizedTitle;
    sanitizedData['body'] = sanitizedBody;

    final payload = NotificationPayload.fromJson(sanitizedData).toJsonString();

    // Update badge count securely
    final allowedBadgeTypes = ['notification'];
    if (allowedBadgeTypes.contains(type)) {
      int currentCount = prefs.getInt('unread_notification_count') ?? 0;
      currentCount++;
      await prefs.setInt('unread_notification_count', currentCount);

      if (Platform.isIOS) {
        await FlutterAppBadger.updateBadgeCount(currentCount);
      }

      ProductionLogger.info('✅ Badge count updated: $currentCount');
    } else {
      ProductionLogger.info('🔕 Skipping badge update for type: $type');
    }

    // Show local notification
    await _showLocalNotification(
      title: sanitizedTitle,
      body: sanitizedBody,
      payload: payload,
      channelId: _getChannelId(type),
    );

    ProductionLogger.info(
      'Background notification processed successfully for type: $type',
    );
    ProductionLogger.info('Sanitized title: $sanitizedTitle');
    ProductionLogger.info('Sanitized body: $sanitizedBody');
  } catch (e, stackTrace) {
    ProductionLogger.fatal(
      'Error in background message handler',
      e,
      stackTrace,
    );
  }
}

bool _validateNotificationData(String type, Map<String, dynamic> data) {
  switch (type) {
    case 'answer':
    case 'clarification':
    case 'advice':
      return data['chatId'] != null && data['userId'] != null;
    case 'horoscope':
      return data['userId'] != null;
    case 'notification':
      return data['userId'] != null;
    default:
      return data['title'] != null && data['body'] != null;
  }
}

String _getChannelId(String type) {
  switch (type) {
    case 'horoscope':
      return AppConstants.horoscopeChannel;
    case 'answer':
      return AppConstants.answerChannel;
    case 'clarification':
      return AppConstants.clarificationChannel;
    default:
      return AppConstants.generalChannel;
  }
}

Future<void> _showLocalNotification({
  required String title,
  required String body,
  required String payload,
  required String channelId,
}) async {
  final androidDetails = AndroidNotificationDetails(
    channelId,
    SecureNotificationManager._getChannelName(channelId),
    channelDescription: SecureNotificationManager._getChannelDescription(
      channelId,
    ),
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );

  const iosDetails = DarwinNotificationDetails();

  final platformChannelSpecifics = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  await SecureNotificationManager.instance.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    body,
    platformChannelSpecifics,
    payload: payload,
  );
}

class SecureAppInitializer {
  static Future<void> initialize() async {
    try {
      ProductionLogger.info('🚀 Starting secure app initialization...');

      // Initialize secure storage and error reporting
      await _initializeSecureStorage();
      await ErrorReportingService.init();

      // ✅ Initialize Firebase safely
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: await FirebaseConfig.getOptions(),
        );
        ProductionLogger.info('✅ Firebase initialized');
      } else {
        ProductionLogger.info('ℹ️ Firebase already initialized');
      }

      // Setup notifications
      await SecureNotificationManager.initialize();
      await SecureNotificationManager.createNotificationChannels();

      // Setup FCM
      await _setupFCM();

      // Initialize Stripe
      await StripeService.initialize();

      ProductionLogger.info(
        '✅ Secure app initialization completed successfully',
      );
    } catch (e, stackTrace) {
      ProductionLogger.fatal('❌ App initialization failed', e, stackTrace);
      rethrow;
    }
  }

  // --- Secure Storage Initialization ---
  static Future<void> _initializeSecureStorage() async {
    try {
      // If you use flutter_secure_storage, init it here
      ProductionLogger.info('🔐 Secure storage initialized');
    } catch (e, stackTrace) {
      ProductionLogger.error(
        'Failed to initialize secure storage',
        e,
        stackTrace,
      );
    }
  }

  // --- Firebase Cloud Messaging Setup ---
  static Future<void> _setupFCM() async {
    try {
      // Request iOS permissions if applicable
      if (Platform.isIOS) {
        await _requestIOSPermissions();
      }

      // Set background handler
      FirebaseMessaging.onBackgroundMessage(
        _secureFirebaseMessagingBackgroundHandler,
      );

      // Get FCM token
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        final tokenPreview = fcmToken.substring(0, min(20, fcmToken.length));
        ProductionLogger.info('📱 FCM Token obtained: ${tokenPreview}...');
        await _saveFcmToken(fcmToken);
      }

      // Listen for foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle message opened from background
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
    } catch (e, stackTrace) {
      ProductionLogger.error('🔥 FCM setup failed', e, stackTrace);
      rethrow;
    }
  }

  // --- Save FCM Token Securely ---
  static Future<void> _saveFcmToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('fcm_token', token);
      ProductionLogger.info('💾 FCM token saved securely');
    } catch (e) {
      ProductionLogger.error('Failed to save FCM token', e);
    }
  }

  // --- iOS Notification Permissions ---
  static Future<void> _requestIOSPermissions() async {
    try {
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        criticalAlert: true,
      );
      ProductionLogger.info(
        '📲 iOS notification permission: ${settings.authorizationStatus}',
      );
    } catch (e) {
      ProductionLogger.error('Failed to request iOS permissions', e);
    }
  }

  // --- Foreground Message Handler ---
  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    ProductionLogger.info(
      '💬 Foreground message received: ${message.messageId}',
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      final notificationsEnabled =
          prefs.getBool('notifications_enabled') ?? true;

      if (!notificationsEnabled) {
        ProductionLogger.info(
          '🔕 Notifications disabled - skipping foreground notification',
        );
        return;
      }
      final data = message.data;
      final type = data['type'] ?? 'general';

      // ✅ SANITIZE THE TITLE AND BODY
      final rawTitle = data['title'] ?? 'New Notification';
      final rawBody = data['body'] ?? 'You have a new message';

      final sanitizedTitle = TextSanitizer.sanitizeForNotification(rawTitle);
      final sanitizedBody = TextSanitizer.sanitizeForNotification(rawBody);

      if (!_validateNotificationData(type, data)) {
        ProductionLogger.warning(
          '⚠️ Invalid notification data for type: $type',
        );
        return;
      }

      // Create sanitized payload
      final sanitizedData = Map<String, dynamic>.from(data);
      sanitizedData['title'] = sanitizedTitle;
      sanitizedData['body'] = sanitizedBody;

      final payload =
          NotificationPayload.fromJson(sanitizedData).toJsonString();

      await _showLocalNotification(
        title: sanitizedTitle,
        body: sanitizedBody,
        payload: payload,
        channelId: _getChannelId(type),
      );

      // Update providers if context exists
      if (navigatorKey.currentContext != null) {
        await _updateUnreadCounts(type, navigatorKey.currentContext!);
      }
    } catch (e, stackTrace) {
      ProductionLogger.error(
        'Error handling foreground message',
        e,
        stackTrace,
      );
    }
  }

  // --- Handle Message When App is Opened ---
  static Future<void> _handleMessageOpenedApp(RemoteMessage message) async {
    ProductionLogger.info('📩 App opened from message: ${message.messageId}');
    try {
      final payload = NotificationPayload.fromJson(message.data).toJsonString();
      await secureNotificationNavigation.setPayload(payload);
    } catch (e, stackTrace) {
      ProductionLogger.error(
        'Error handling message opened app',
        e,
        stackTrace,
      );
    }
  }

  // --- Validate Notification Payload ---
  static bool _validateNotificationData(
    String type,
    Map<String, dynamic> data,
  ) {
    return data.containsKey('title') && data.containsKey('body');
  }

  // --- Choose Notification Channel ---
  static String _getChannelId(String type) {
    switch (type) {
      case 'horoscope':
        return 'horoscope_channel';
      case 'notification':
        return 'notification_channel';
      default:
        return 'general_channel';
    }
  }

  // --- Show Local Notification (placeholder for your manager) ---
  static Future<void> _showLocalNotification({
    required String title,
    required String body,
    required String payload,
    required String channelId,
  }) async {
    await SecureNotificationManager.showNotification(
      title: title,
      body: body,
      payload: payload,
      channelId: channelId,
    );
  }

  // --- Update Unread Counts in Providers ---
  static Future<void> _updateUnreadCounts(
    String type,
    BuildContext context,
  ) async {
    try {
      switch (type) {
        case 'horoscope':
          final horoscopeProvider = Provider.of<HoroscopeProvider>(
            context,
            listen: false,
          );
          await horoscopeProvider.increment(); // your HoroscopeProvider method
          ProductionLogger.info('🔮 Updated horoscope unread count');
          break;

        case 'notification':
          final notificationProvider = Provider.of<NotificationProvider>(
            context,
            listen: false,
          );
          await notificationProvider.incrementUnreadCount(); // use this
          ProductionLogger.info('🔔 Updated notification unread count');
          break;
      }
    } catch (e, stackTrace) {
      ProductionLogger.error('Error updating unread counts', e, stackTrace);
    }
  }
}

// Secure Badge Manager
class SecureBadgeManager extends StatefulWidget {
  final Widget child;

  const SecureBadgeManager({Key? key, required this.child}) : super(key: key);

  @override
  State<SecureBadgeManager> createState() => _SecureBadgeManagerState();
}

class _SecureBadgeManagerState extends State<SecureBadgeManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeBadge();
  }

  Future<void> _initializeBadge() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final count = prefs.getInt('unread_notification_count') ?? 0;

      if (count > 0 && Platform.isIOS) {
        await FlutterAppBadger.updateBadgeCount(count);
      }
    } catch (e) {
      ProductionLogger.error('Failed to initialize badge', e);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _syncBadgeCount();
    } else if (state == AppLifecycleState.paused) {
      _clearBadgeIfNeeded();
    }
  }

  Future<void> _syncBadgeCount() async {
    try {
      // Get unread counts from shared preferences
      final prefs = await SharedPreferences.getInstance();
      final totalCount = prefs.getInt('unread_notification_count') ?? 0;

      if (totalCount > 0 && Platform.isIOS) {
        await FlutterAppBadger.updateBadgeCount(totalCount);
      } else if (Platform.isIOS) {
        await FlutterAppBadger.removeBadge();
      }
    } catch (e) {
      ProductionLogger.error('Failed to sync badge count', e);
    }
  }

  Future<void> _clearBadgeIfNeeded() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final totalCount = prefs.getInt('unread_notification_count') ?? 0;

      if (totalCount == 0 && Platform.isIOS) {
        await FlutterAppBadger.removeBadge();
      }
    } catch (e) {
      ProductionLogger.error('Failed to clear badge', e);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

// Secure Home Router
class SecureHomeRouter extends StatefulWidget {
  const SecureHomeRouter({Key? key}) : super(key: key);

  @override
  State<SecureHomeRouter> createState() => _SecureHomeRouterState();
}

class _SecureHomeRouterState extends State<SecureHomeRouter>
    with WidgetsBindingObserver {
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    secureNotificationNavigation.addListener(_handleSecureNotification);
    _initializeSocket();
  }

  void _initializeSocket() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        // Since you don't have login, we'll use a default user ID
        final userId = profileProvider.userId ?? 'default_user';
        SocketService().initialize(userId, context);
        ProductionLogger.info('Socket service initialized');
      } catch (e, stackTrace) {
        ProductionLogger.error('Failed to initialize socket', e, stackTrace);
      }
    });
  }

  void _handleSecureNotification() {
    if (!_isNavigating && secureNotificationNavigation.payload != null) {
      _isNavigating = true;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          await _navigateToNotificationTarget(
            secureNotificationNavigation.payload!,
          );
        } catch (e, stackTrace) {
          ProductionLogger.error(
            'Notification navigation failed',
            e,
            stackTrace,
          );
        } finally {
          _isNavigating = false;
          secureNotificationNavigation.clear();
        }
      });
    }
  }

  Future<void> _navigateToNotificationTarget(String payload) async {
    try {
      final notificationPayload = NotificationPayload.fromJsonString(payload);
      final route = _getRouteForNotification(notificationPayload);

      if (route != null) {
        await navigatorKey.currentState?.push(route);
        ProductionLogger.info(
          'Navigated to notification target: ${notificationPayload.type}',
        );
      } else {
        ProductionLogger.warning(
          'No route defined for notification type: ${notificationPayload.type}',
        );
      }
    } catch (e, stackTrace) {
      ProductionLogger.error(
        'Failed to parse notification payload',
        e,
        stackTrace,
      );
    }
  }

  Route<dynamic>? _getRouteForNotification(NotificationPayload payload) {
    switch (payload.type) {
      case 'horoscope':
        return MaterialPageRoute(
          builder:
              (_) => DailyHoroscopeScreen(
                userId: payload.userId ?? 'default_user',
              ),
        );
      case 'notification':
        return MaterialPageRoute(
          builder:
              (_) =>
                  NotificationsScreen(userId: payload.userId ?? 'default_user'),
        );
      case 'advice':
      case 'answer':
      case 'clarification':
        if (payload.chatId != null) {
          return MaterialPageRoute(
            builder: (_) => ChatScreen(chatId: payload.chatId!),
          );
        }
        break;
    }
    return null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _reconnectSocket();
    }
  }

  void _reconnectSocket() {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final userId = profileProvider.userId ?? 'default_user';
      if (!SocketService().socket.connected) {
        SocketService().initialize(userId, context);
        ProductionLogger.info('Socket reconnected on app resume');
      }
    } catch (e, stackTrace) {
      ProductionLogger.error('Socket reconnection failed', e, stackTrace);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    secureNotificationNavigation.removeListener(_handleSecureNotification);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    // Since you don't have login, we'll always show the chat screen
    return ChatScreen(chatId: null);
  }
}

// Main App Widget
class SecureApp extends StatefulWidget {
  final FirstLaunchResult launchResult;

  const SecureApp({Key? key, required this.launchResult}) : super(key: key);

  @override
  State<SecureApp> createState() => _SecureAppState();
}

class _SecureAppState extends State<SecureApp> {
  late bool _showOnboarding;

  @override
  void initState() {
    super.initState();
    _showOnboarding = widget.launchResult.isFirstLaunch;
    _checkOnboardingStatus();
    _setupForegroundMessageHandler();
    _logLaunchAnalytics();
  }

  void _logLaunchAnalytics() {
    // Log launch analytics
    if (widget.launchResult.isFirstLaunch) {
      ProductionLogger.info('📊 Analytics: First app launch');
    } else if (widget.launchResult.isFirstLaunchForVersion) {
      ProductionLogger.info(
        '📊 Analytics: First launch for version ${widget.launchResult.appVersion}',
      );
    }

    ProductionLogger.info(
      '📊 Analytics: Total launches: ${widget.launchResult.launchCount}',
    );
  }

  Future<void> _checkOnboardingStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final onboardingDone = prefs.getBool('onboarding_done') ?? false;

      if (mounted) {
        setState(() {
          _showOnboarding =
              widget.launchResult.isFirstLaunch && !onboardingDone;
        });
      }
    } catch (e) {
      ProductionLogger.error('Failed to check onboarding status', e);
    }
  }

  void _finishOnboarding() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_done', true);

      if (mounted) {
        setState(() {
          _showOnboarding = false;
        });
      }

      ProductionLogger.info('✅ Onboarding completed');
    } catch (e) {
      ProductionLogger.error('Failed to save onboarding status', e);
    }
  }

  void _setupForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ProductionLogger.info('Foreground FCM message: ${message.messageId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    if (localeProvider.isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading...'),
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return SecureBadgeManager(child: child!);
      },
      home:
          _showOnboarding
              ? OnboardingScreen(
                onFinish: _finishOnboarding,
                profileProvider: Provider.of<ProfileProvider>(
                  context,
                  listen: false,
                ),
              )
              : const SecureHomeRouter(),
    );
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  final payload = response.payload;
  if (payload != null) {
    print('📱 (Background) Notification tapped: $payload');
    pendingNavigation.payload = payload;
  }
}

Future<void> setupNotificationChannels() async {
  final androidPlugin =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  if (androidPlugin != null) {
    await androidPlugin.createNotificationChannel(
      AndroidNotificationChannel(
        'general_channel',
        'General Notifications',
        description: 'General notifications',
        importance: Importance.high,
      ),
    );
    await androidPlugin.createNotificationChannel(
      AndroidNotificationChannel(
        'horoscope_channel',
        'Horoscope Notifications',
        description: 'Daily Horoscope',
        importance: Importance.high,
      ),
    );
    await androidPlugin.createNotificationChannel(
      AndroidNotificationChannel(
        'answer_channel',
        'Answer Notifications',
        description: 'Chat answer notifications',
        importance: Importance.high,
      ),
    );
    await androidPlugin.createNotificationChannel(
      AndroidNotificationChannel(
        'clarification_channel',
        'Clarification Notifications',
        description: 'Clarification messages',
        importance: Importance.high,
      ),
    );
  }
}

// First Launch Service
Future<bool> isFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('first_launch') ?? true;
  if (isFirstLaunch) {
    await prefs.setBool('first_launch', false);
  }
  return isFirstLaunch;
}

Future<void> sendFcmTokenToBackend(String userId, String fcmToken) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Environment.baseUrl}/api/register-fcm-token',
      ), // use Environment.baseUrl
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'token': fcmToken}),
    );

    if (response.statusCode == 200) {
      print('✅ FCM token sent successfully');
    } else {
      print(
        '⚠️ Failed to send FCM token: ${response.statusCode}, ${response.body}',
      );
    }
  } catch (e) {
    print('❌ Error sending FCM token: $e');
  }
}

Future<void> _initNotifications() async {
  // Initialize Flutter Local Notifications
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  final InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        pendingNavigation.payload = response.payload;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  // Create default notification channels
  await setupNotificationChannels();
}

Future<void> _requestPermissions() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);

  print('🔐 Notification permission status: ${settings.authorizationStatus}');
}

Future<void> _initFCMToken() async {
  final profileProvider = ProfileProvider();
  await profileProvider.loadUserId();

  try {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('🔑 FCM Token: $fcmToken');

    if (profileProvider.userId != null && fcmToken != null) {
      // Send token to backend
      await sendFcmTokenToBackend(profileProvider.userId!, fcmToken);
    }
  } catch (e) {
    print('❌ Error getting FCM token: $e');
  }
}

// Main Function
Future<void> main() async {
  SafeWidgetsBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // Get first launch result BEFORE using it
  final launchResult = await FirstLaunchService.checkFirstLaunch();

  // Add error handling for the entire app
  FlutterError.onError = (details) {
    ProductionLogger.fatal(
      'Flutter error caught',
      details.exception,
      details.stack,
    );
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    ProductionLogger.fatal('Platform error caught', error, stack);
    return true;
  };

  ProductionLogger.info('''
📱 Launch Details:
- First Launch: ${launchResult.isFirstLaunch}
- First Launch for Version: ${launchResult.isFirstLaunchForVersion}
- Launch Count: ${launchResult.launchCount}
- App Version: ${launchResult.appVersion}
- First Launch Version: ${launchResult.firstLaunchVersion}
''');

  await Firebase.initializeApp();

  await _initNotifications(); // Background + foreground
  await _requestPermissions(); // iOS/Android
  await _initFCMToken(); // Send token to backend

  final profileProvider = ProfileProvider();
  await profileProvider.loadUserId();
  await profileProvider.initialize(); // loads token, language, etc.

  final token = profileProvider.token ?? ''; // get token safely
  final chatService = SecureChatService(token); // pass token to chat service

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await NotificationHandler.init();
  // Add error handling for the entire app
  FlutterError.onError = (details) {
    ProductionLogger.fatal(
      'Flutter error caught',
      details.exception,
      details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    ProductionLogger.fatal('Platform error caught', error, stack);
    return true;
  };

  try {
    ProductionLogger.info('Starting application...');

    await SecureAppInitializer.initialize();

    final firstLaunch = await isFirstLaunch();
    if (firstLaunch) {
      ProductionLogger.info('🎉 This is the first launch!');
    }
    // Start device time service
    final deviceTimeService = DeviceTimeService(
      profileProvider.userId ?? 'default_user',
    );
    deviceTimeService.start(interval: const Duration(minutes: 1));

    final launchStats = await FirstLaunchService.getLaunchStatistics();
    ProductionLogger.info('''
📊 Launch Statistics:
- Total Launches: ${launchStats.totalLaunches}
- Days Since First Launch: ${launchStats.daysSinceFirstLaunch}
- First Launch Version: ${launchStats.firstLaunchVersion}
- Current Version: ${launchStats.currentVersion}
''');

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileProvider>.value(value: profileProvider),
          ChangeNotifierProvider<SecureChatService>.value(value: chatService),
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
          ChangeNotifierProvider(
            create: (_) => DictionaryProvider()..loadDictionary(),
          ),
          ChangeNotifierProvider(create: (_) => NotificationProvider()),
          ChangeNotifierProvider(create: (_) => HoroscopeProvider()),
          ChangeNotifierProvider<SecureNotificationNavigation>.value(
            value: secureNotificationNavigation,
          ),
          ChangeNotifierProvider(create: (_) => AppLifecycleProvider()),
        ],
        child: SecureApp(
          launchResult: launchResult,
        ), // Updated to use LaunchResult
      ),
    );

    // Initialize socket after app is running
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (profileProvider.userId != null) {
        SocketService().initialize(
          profileProvider.userId!,
          navigatorKey.currentContext!,
        );
      }
    });

    ProductionLogger.info('Application started successfully');

    // Log first launch events for analytics
    if (launchResult.isFirstLaunch) {
      ProductionLogger.info(
        '🎉 First app launch detected - showing onboarding',
      );
      // You can trigger first-time user setup here
    } else if (launchResult.isFirstLaunchForVersion) {
      ProductionLogger.info(
        '🔄 First launch for version ${launchResult.appVersion}',
      );
      // You can show "What's New" dialog here
    }
  } catch (e, stackTrace) {
    ProductionLogger.fatal('Application startup failed', e, stackTrace);

    // Show error UI
    // Show user-friendly error UI
    runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 80,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Unable to Start App',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'There was a problem starting the application. '
                    'Please try restarting the app.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'If the problem continues, please contact support.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          exit(0);
                        },
                        icon: const Icon(Icons.exit_to_app),
                        label: const Text('Exit App'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Try to restart the app
                          runApp(
                            const MaterialApp(
                              home: Scaffold(
                                body: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          );
                          main(); // Recursive call - use with caution
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
