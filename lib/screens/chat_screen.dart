import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'profile_settings_screen.dart';
import '../services/chat_service.dart';
import '../widgets/chat_bubble.dart';
import '../providers/profile_provider.dart';
import '../models/message.dart' as chat_model;
import 'package:permission_handler/permission_handler.dart';
import '../providers/notification_provider.dart';
import '../providers/dictionary_provider.dart';
import 'dailyHoroscope_Screen.dart';
import '../utils/pending_notification_navigation.dart';
import 'horoscope_detail_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'notifications_screen.dart';
import 'how_to_ask_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'question_store_screen.dart';
import '../providers/horoscope_provider.dart';
import 'astroDictionary_Screen.dart';
import 'package:kundali/widgets/bouncing_dots.dart';
import 'package:kundali/screens/CustomerSupportPage.dart';
import 'package:kundali/screens/AboutUsPage.dart';
import '../l10n/app_localizations.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class ChatScreen extends StatefulWidget {
  final String? chatId; // make nullable
  final String? initialMessageId; // Add this parameter
  const ChatScreen({super.key, required this.chatId, this.initialMessageId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late final AnimationController _animationController;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? userId;
  bool _isSocketConnected = false;
  Completer<void>? _socketConnectionCompleter;
  bool _isSending = false;
  bool _showScrollToBottomButton = false;

  late IO.Socket socket;
  Timer? _refreshTimer;
  String? currentUserId;
  bool _isReinitializing = false;

  @override
  void initState() {
    super.initState();
    _handleDeepLink();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();

    socket = IO.io(
      'wss://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();

    _initializeNotifications();
    _initializeSocket();
    WidgetsBinding.instance.addObserver(this);

    // Async initialization
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      // Load userId securely
      await profileProvider.loadUserId();
      currentUserId = profileProvider.userId;

      // Load token if missing
      if (profileProvider.token == null) {
        await profileProvider.loadToken();
      }

      // Handle deep link payload
      final payload = pendingNavigation.payload;
      if (payload != null) {
        final data = jsonDecode(payload);
        if (data['type'] == 'horoscope') {
          final id = data['id'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HoroscopeDetailScreen(horoscopeId: id),
            ),
          );
        }
        pendingNavigation.payload = null;
      }

      setState(() {}); // refresh UI if needed
    });

    // Scroll to top initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset > 100) {
          if (!_showScrollToBottomButton) {
            setState(() => _showScrollToBottomButton = true);
          }
        } else {
          if (_showScrollToBottomButton) {
            setState(() => _showScrollToBottomButton = false);
          }
        }
      }
    });

    _fetchInitialData();
    _refreshTimer = Timer.periodic(const Duration(seconds: 30000), (_) {
      _fetchInitialData();
    });
  }

  void _handleDeepLink() {
    if (widget.initialMessageId != null) {
      // Scroll to or highlight the specific message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Implement message highlighting logic here
      });
    }
  }

  Future<void> _sendQuestionViaHttp(
    String text,
    String userId, {
    bool paid = false,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://chat-backend-rvk9.onrender.com/questions/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': text, 'userId': userId, 'paid': paid}),
      );

      if (response.statusCode == 200) {
        print('✅ HTTP fallback succeeded: ${response.body}');
      } else {
        print(
          '❌ HTTP fallback failed: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      print('❌ HTTP fallback error: $e');
    }
  }

  Future<void> sendQuestionToSocket(
    String text,
    String userId, {
    bool paid = false,
    int? amount, // <-- Add this line
  }) async {
    // Ensure socket is connected
    if (!socket.connected) {
      print('⚠️ Socket not connected - reinitializing...');
      await _initializeSocket(); // Reinitialize socket
      final completer = Completer<void>();
      socket.once('connect', (_) {
        completer.complete();
      });
      socket.connect();
      await completer.future.timeout(
        Duration(seconds: 5),
        onTimeout: () {
          print('⚠️ Socket connection timeout');
        },
      );
    }
    if (_isReinitializing) {
      print('⚠️ Skipping send - socket reinitialization in progress');
      await _sendQuestionViaHttp(text, userId, paid: paid);
      return;
    }

    print('🔥 Current socket connected: ${socket.connected}');
    print('🔥 Current socket ID: ${socket.id}');
    print(
      '🔥 Sending question to backend: $text, userId: $userId, paid: $paid',
    );

    if (socket.connected) {
      socket.emit('send_question', {
        'text': text,
        'userId': userId,
        'paid': paid,
        if (amount != null) 'amount': amount, // send only if present
        'createdAt': DateTime.now().toIso8601String(),
      });
    } else {
      print('❌ Failed to send question - socket still not connected');
      // Fallback: Send via HTTP API if socket fails
      await _sendQuestionViaHttp(text, userId, paid: paid);
    }
  }

  Future<void> startStripePayment(String userId, String questionText) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final token = profileProvider.token;

      if (token == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Missing auth token")));
        return;
      }

      // Call single-payment endpoint
      final response = await http.post(
        Uri.parse(
          "https://chat-backend-rvk9.onrender.com/api/single-question-payment",
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final clientSecret = jsonResponse['clientSecret'];

        // Initialize and present payment sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'Astro Chat App',
          ),
        );

        await Stripe.instance.presentPaymentSheet();

        // Send question after successful payment
        sendQuestionToSocket(questionText, userId, paid: true, amount: 5000);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Payment successful! Question sent")),
        );
      } else {
        throw Exception("Failed to create payment intent");
      }
    } catch (e) {
      print('Payment failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Payment failed: ${e.toString()}")),
      );
    }
  }

  Future<void> _fetchInitialData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    final String userId = profileProvider.userId ?? '';

    if (userId.isEmpty) return;

    final chatService = Provider.of<ChatService>(context, listen: false);
    List<chat_model.Message> allMessages = [];

    // --- FETCH QUESTIONS & ANSWERS ---
    final questionsResponse = await http.get(
      Uri.parse(
        'https://chat-backend-rvk9.onrender.com/questions/previous/$userId',
      ),
    );

    if (questionsResponse.statusCode == 200) {
      final List<dynamic> data = json.decode(questionsResponse.body);

      for (var item in data) {
        final questionId = item['_id'] ?? item['id'];

        allMessages.add(
          chat_model.Message(
            id: questionId,
            text: item['text'],
            isMe: true,
            createdAt: DateTime.parse(item['createdAt']),
          ),
        );

        if (item['answerTranslated'] != null) {
          allMessages.add(
            chat_model.Message(
              id: questionId,
              text: item['answerTranslated'],
              isMe: false,
              adminId: item['adminId'],
              adminName: item['adminName'],
              answeredAt: DateTime.parse(item['answeredAt']),
              rating: item['rating'],
              feedback: item['feedback'],
            ),
          );
        }

        if (item['isClarified'] == true &&
            item['clarificationMessages'] != null) {
          for (var clarification in item['clarificationMessages']) {
            if (clarification['clarificationHide'] == true) continue;
            allMessages.add(
              chat_model.Message(
                id: questionId,
                text: clarification['clarificationMessage'],
                isMe: false,
                isClarification: true,
                adminId: clarification['adminId'],
                adminName: clarification['adminName'],
                clarificatedAt: DateTime.parse(clarification['clarificatedAt']),
              ),
            );
          }
        }

        if (item['adviceTranslated'] != null && item['advisedAt'] != null) {
          allMessages.add(
            chat_model.Message(
              id: questionId,
              text: item['adviceTranslated'],
              isMe: false,
              adminId: item['adminId'],
              adminName: item['adminName'],
              answeredAt: DateTime.parse(item['advisedAt']),
              isAdvice: true,
              rating: item['rating'],
              feedback: item['feedback'],
            ),
          );
        }
      }
    }

    // --- FETCH ADVICES ---
    final advicesResponse = await http.get(
      Uri.parse('https://chat-backend-rvk9.onrender.com/advices/$userId'),
    );

    if (advicesResponse.statusCode == 200) {
      final List<dynamic> data = json.decode(advicesResponse.body);

      for (var item in data) {
        if (item['text'] != null && item['createdAt'] != null) {
          allMessages.add(
            chat_model.Message(
              id: item['_id'],
              text: item['text'],
              isMe: false,
              isAdvice: true,
              adminId: item['adminId'] ?? '',
              adminName: item['adminName'] ?? '',
              answeredAt: DateTime.parse(item['createdAt']),
              rating: item['rating'],
              feedback: item['feedback'],
            ),
          );
        }
      }
    }

    // --- SORT MESSAGES ---
    allMessages.sort((a, b) {
      DateTime dateA =
          a.createdAt ??
          a.answeredAt ??
          a.clarificatedAt ??
          DateTime.fromMillisecondsSinceEpoch(0);
      DateTime dateB =
          b.createdAt ??
          b.answeredAt ??
          b.clarificatedAt ??
          DateTime.fromMillisecondsSinceEpoch(0);
      return dateA.compareTo(dateB); // ✅ ascending
    });

    // --- SET ONCE ---
    chatService.setMessages(allMessages);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profileProvider = Provider.of<ProfileProvider>(context);
    final newUserId = profileProvider.userId;

    if (newUserId != null && newUserId != currentUserId) {
      currentUserId = newUserId;
      // Update local storage

      Future.microtask(() => _reinitializeForUserId(newUserId));
    }
  }

  Future<void> _disposeSocket() async {
    try {
      socket.clearListeners();
      if (socket.connected) {
        final completer = Completer<void>();
        socket.once('disconnect', (_) => completer.complete());
        socket.disconnect();
        await completer.future.timeout(Duration(seconds: 2));
      }
    } catch (e) {
      print('⚠️ Error disposing socket: $e');
    }
  }

  Future<void> _reinitializeForUserId(String userId) async {
    if (_isReinitializing) return;
    _isReinitializing = true;
    if (socket.connected) {
      socket.clearListeners(); // Clear all event listeners
      socket.disconnect();
      await _disposeSocket(); // Properly dispose old socket
      await Future.delayed(Duration(milliseconds: 500)); // Brief delay
    }

    // Clear old messages
    Provider.of<ChatService>(context, listen: false).clearMessages();

    this.userId = userId; // Add this line
    // Disconnect existing socket if any

    // 🔌 Reconnect for new user
    await _initializeSocket();

    await _fetchInitialData();
    // 🔄 Fetch new messages
    await _fetchPreviousQuestionsAndAnswers();

    await _fetchPreviousAdvices(); // 👈 Add this

    setState(() {}); // Optional - UI rebuild trigger
    _isReinitializing = false;
  }

  // Update _initializeSocket and _fetchPreviousQuestionsAndAnswers to accept userId param or
  // use currentUserId inside those methods.

  void _initializeNotifications() async {
    if (_socketConnectionCompleter != null &&
        !_socketConnectionCompleter!.isCompleted) {
      _socketConnectionCompleter!.completeError('Reinitializing socket');
    }
    _socketConnectionCompleter = Completer<void>();
    _isSocketConnected = false;

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    final userId = profileProvider.userId ?? '';

    if (userId.isEmpty) {
      print("❗ Missing userId for socket connection");
      _socketConnectionCompleter!.completeError('No user ID');
      return;
    }
    // Disconnect existing socket if connected
    if (socket.connected) {
      socket.disconnect();
      await Future.delayed(Duration(milliseconds: 300));
    }

    String serverUrl =
        isProduction()
            ? "wss://chat-backend-rvk9.onrender.com"
            : "ws://10.0.2.2:3000";

    socket = IO.io(
      serverUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': userId})
          .setReconnectionAttempts(5)
          .setReconnectionDelay(2000)
          .setTimeout(5000)
          .build(),
    );
    socket.onConnect((_) {
      print("✅✅✅ CONNECTED TO SOCKET WITH USER ID: $userId");
      _isSocketConnected = true;
      socket.emit('join_room', {'room': userId});
      _socketConnectionCompleter?.complete();
    });
    socket.onDisconnect((_) {
      print("❌❌❌ DISCONNECTED");
      _isSocketConnected = false;
    });

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    // 🟢 Request Android 13+ Notification Permission
    if (Platform.isAndroid) {
      var status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }
    }

    // 🟢 iOS Permission
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    Timer(Duration(seconds: 5), () {
      if (!_isSocketConnected && !_socketConnectionCompleter!.isCompleted) {
        _socketConnectionCompleter!.completeError('Connection timeout');
      }
    });

    return _socketConnectionCompleter!.future;
  }

  Future<void> _initializeSocket() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    await profileProvider.loadUserId();
    final userId = profileProvider.userId ?? '';

    // Ensure userID is properly loaded
    if (profileProvider.userId == null) {
      await profileProvider.loadUserId();
    }

    if (userId.isEmpty) {
      print("❗ Missing userId for socket connection");
      return;
    }

    String localUrl =
        kIsWeb
            ? "ws://localhost:3000"
            : Platform.isAndroid
            ? "ws://10.0.2.2:3000"
            : "ws://localhost:3000";
    String serverUrl =
        isProduction() ? "wss://chat-backend-rvk9.onrender.com" : localUrl;

    socket = IO.io(
      serverUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': userId})
          .setReconnectionAttempts(5)
          .setReconnectionDelay(2000)
          .setTimeout(5000)
          .build(),
    );

    _isSocketConnected = false;
    if (_socketConnectionCompleter != null &&
        !_socketConnectionCompleter!.isCompleted) {
      _socketConnectionCompleter!.completeError('Reinitializing socket');
    }
    _socketConnectionCompleter = Completer<void>();

    socket.onConnect((_) {
      print("✅ Connected to $serverUrl");
      print("🔁 Emitting join_room with room: $userId");

      // 🟢 Emit join_room to subscribe to your personal room
      socket.emit('join_room', {'room': userId.toString()});

      // Confirm connection status
      print("Socket status: ${socket.connected}");
    });

    socket.onDisconnect((_) => print("❌ Disconnected from server"));
    socket.onConnectError((error) => print("⚠️ Connection Error: $error"));
    socket.onError((error) => print("⚠️ WebSocket Error: $error"));
    socket.onReconnect((_) => print('🔁 Socket reconnected'));
    socket.onReconnectAttempt((_) => print('🔄 Socket reconnect attempt'));
    socket.onReconnectError((err) => print('⚠️ Socket reconnect error: $err'));
    socket.onReconnectFailed((_) => print('❌ Socket reconnect failed'));

    socket.off('new_question');
    socket.off('new_answer');
    socket.off('new_clarification');
    socket.off('new_advice');

    socket.on('new_question', (data) {
      print('Received new_question: ${data.toString()}');
      _addMessage(
        chat_model.Message(
          id: data['_id'] ?? data['id'],
          text: data['text'],
          isMe: true,
          createdAt: DateTime.parse(data['createdAt']),
        ),
      );
    });

    socket.on('new_answer', (data) {
      print('Received new_answer: ${data.toString()}');

      // final rawText = data['answerTranslated'] as String? ?? '';
      // final cleanedText = _stripHtmlIfNeeded(rawText);

      final message = chat_model.Message(
        id: data['questionId'],
        text: data['answerTranslated'],
        isMe: false,
        adminId: data['adminId'],
        adminName: data['adminName'],
        answeredAt: DateTime.parse(data['answeredAt']),
      );

      _addMessage(message);

      /*_showAnswerNotification(
        "💬 Answer from ${message.adminName ?? 'Councillor'}",
        cleanedText,
      );*/
    });

    socket.on('new_clarification', (data) {
      print('Received new_clarification: ${data.toString()}');

      // final rawText = data['answerTranslated'] as String? ?? '';
      //final cleanedText = _stripHtmlIfNeeded(rawText);

      final message = chat_model.Message(
        id: data['questionId'],
        text: data['clarificationMessage'],
        isMe: false,
        isClarification: true,
        adminId: data['adminId'],
        adminName: data['adminName'],
        clarificatedAt: DateTime.parse(data['clarificatedAt']),
      );

      _addMessage(message);

      /*_showAnswerNotification(
        "🔍 Clarification from ${message.adminName ?? 'Councillor'}",
        cleanedText,
      );*/
    });

    socket.on('new_advice', (data) {
      print('Received new_advice: ${data.toString()}');

      // final rawText = data['adviceTranslated'] as String? ?? '';
      // final cleanedText = _stripHtmlIfNeeded(rawText);

      final message = chat_model.Message(
        id: data['_id'] ?? data['id'] ?? data['questionId'],
        text: data['adviceTranslated'],
        isMe: false,
        adminId: data['adminId'],
        adminName: data['adminName'],
        answeredAt: DateTime.parse(data['advisedAt']),
        isAdvice: true, // ✅ NEW FLAG
      );

      _addMessage(message);

      /*_showAnswerNotification(
        "🧠 Advice from ${message.adminName ?? 'Councillor'}",
        cleanedText,
      ); */
    });
  }

  void _addMessage(chat_model.Message message) {
    if (mounted) {
      final chatService = Provider.of<ChatService>(context, listen: false);
      chatService.addMessage(message);
      setState(() {});

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (_scrollController.hasClients) {
          // Wait until the frame renders new message size
          await Future.delayed(const Duration(milliseconds: 400));
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  Future<void> showDemoNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'demo_channel_id',
      'Demo Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      1, // Notification ID
      '🔔 Demo Notification',
      'This is a test notification from your app!',
      notificationDetails,
    );
  }

  Future<void> _fetchPreviousAdvices() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    final String userId = profileProvider.userId ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please set your User ID first')),
      );
      return;
    }

    const String baseUrl = 'https://chat-backend-rvk9.onrender.com';
    final String url = '$baseUrl/advices/$userId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final chatService = Provider.of<ChatService>(context, listen: false);
        List<chat_model.Message> loadedAdvices = [];

        loadedAdvices.sort((a, b) {
          final aDate = a.answeredAt ?? DateTime.fromMillisecondsSinceEpoch(0);
          final bDate = b.answeredAt ?? DateTime.fromMillisecondsSinceEpoch(0);
          return aDate.compareTo(bDate); // ✅ ascending
        });

        for (var item in data) {
          if (item['text'] != null && item['createdAt'] != null) {
            loadedAdvices.add(
              chat_model.Message(
                id: item['_id'],
                text: item['text'],
                isMe: false,
                isAdvice: true,
                adminId: item['adminId'] ?? '',
                adminName: item['adminName'] ?? '',
                answeredAt: DateTime.parse(item['createdAt']),
                rating: item['rating'], // Add rating
                feedback: item['feedback'], // Add feedback
              ),
            );
          }
        }
        print("Loaded advices to add: ${loadedAdvices.length}");
        // Remove old advice messages before adding new advices
        final nonAdviceMessages =
            chatService.messages.where((m) => !m.isAdvice).toList();
        final newMessages = [...nonAdviceMessages, ...loadedAdvices];
        newMessages.sort((a, b) {
          final aDate =
              a.createdAt ??
              a.answeredAt ??
              a.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          final bDate =
              b.createdAt ??
              b.answeredAt ??
              b.clarificatedAt ??
              DateTime.fromMillisecondsSinceEpoch(0);
          return aDate.compareTo(bDate);
        });
        chatService.setMessages(newMessages);

        print(
          "Total messages count after adding advices: ${chatService.messages.length}",
        );
      } else {
        print('❌ Failed to fetch advices: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching advices: $e');
    }
  }

  Future<void> _fetchPreviousQuestionsAndAnswers() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    final String userId = profileProvider.userId ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please set your User ID in Profile Settings.'),
        ),
      );
      return;
    }

    const String baseUrl = 'https://chat-backend-rvk9.onrender.com';
    final String apiUrl = '$baseUrl/questions/previous/$userId';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final chatService = Provider.of<ChatService>(context, listen: false);

        List<chat_model.Message> loadedMessages = [];

        data.sort(
          (a, b) => DateTime.parse(
            a['createdAt'],
          ).compareTo(DateTime.parse(b['createdAt'])),
        );

        for (var item in data) {
          final questionId = item['_id'] ?? item['id'];

          loadedMessages.add(
            chat_model.Message(
              id: questionId,
              text: item['text'],
              isMe: true,
              createdAt: DateTime.parse(item['createdAt']),
            ),
          );

          if (item['answerTranslated'] != null) {
            loadedMessages.add(
              chat_model.Message(
                id: questionId,
                text: item['answerTranslated'],
                isMe: false,
                adminId: item['adminId'],
                adminName: item['adminName'],
                answeredAt: DateTime.parse(item['answeredAt']),
                rating: item['rating'],
                feedback: item['feedback'],
              ),
            );
          }

          if (item['isClarified'] == true &&
              item['clarificationMessages'] != null &&
              (item['clarificationMessages'] as List).isNotEmpty) {
            for (var clarification in item['clarificationMessages']) {
              if (clarification['clarificationMessage'] != null) {
                loadedMessages.add(
                  chat_model.Message(
                    id: questionId,
                    text: clarification['clarificationMessage'],
                    isMe: false,
                    isClarification: true,
                    adminId: clarification['adminId'],
                    adminName: clarification['adminName'],
                    clarificatedAt: DateTime.parse(
                      clarification['clarificatedAt'],
                    ),
                  ),
                );
              }
            }
          }

          if (item['adviceTranslated'] != null && item['advisedAt'] != null) {
            loadedMessages.add(
              chat_model.Message(
                id: questionId,
                text: item['adviceTranslated'],
                isMe: false,
                adminId: item['adminId'],
                adminName: item['adminName'],
                answeredAt: DateTime.parse(item['advisedAt']),
                isAdvice: true,
                rating: item['rating'],
                feedback: item['feedback'],
                // ✅
              ),
            );
          }
        }

        chatService.setMessages(loadedMessages);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to fetch previous questions and answers'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  /*
  DateTime? _lastNotificationTime;

  Future<void> _showAnswerNotification(String title, String body) async {
    final now = DateTime.now();
    if (_lastNotificationTime != null &&
        now.difference(_lastNotificationTime!).inSeconds < 3) {
      print("🛑 Skipping duplicate notification");
      return;
    }
    _lastNotificationTime = now;

    final notificationProvider = Provider.of<NotificationProvider>(
      context,
      listen: false,
    );

    if (!notificationProvider.notificationsEnabled) {
      print('🔕 Notifications disabled by user');
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      'answer_channel_id',
      'Answer Notifications',
      channelDescription: 'Notifies when a new answer arrives',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique ID
      title,
      body,
      notificationDetails,
    );
  }
*/
  Future<bool> confirmStripePayment(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Kundali',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      return true; // ✅ Payment was successful
    } catch (e) {
      print("❌ Payment failed: $e");
      return false; // ❌ Payment failed
    }
  }

  Future<int> getUserQuestionCount(String userId) async {
    final url = Uri.parse(
      'https://chat-backend-rvk9.onrender.com/api/user-question-count/$userId',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['count'] ?? 0;
    } else {
      print("❌ Failed to get question count: ${response.body}");
      throw Exception('Failed to fetch question count');
    }
  }

  Future<String> createPaymentIntent(String userId, int amount) async {
    final url = Uri.parse(
      'https://chat-backend-rvk9.onrender.com/create-payment-intent',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'amount': amount}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['clientSecret'];
    } else {
      print('⚠️ Failed to fetch count: ${response.statusCode}');
      print('⚠️ Response body: ${response.body}');
      throw Exception(
        'Failed to create payment intent. Status: ${response.statusCode}',
      );
    }
  }

  void handleSendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final currentUserId = profileProvider.userId;

    if (currentUserId == null || currentUserId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User ID not found. Please login or set your profile.'),
        ),
      );
      return;
    }

    try {
      // Show loading indicator

      setState(() {
        _isSending = true;
      });

      // 1. First check eligibility
      final eligibilityResponse = await http.get(
        Uri.parse(
          'https://chat-backend-rvk9.onrender.com/api/check-question-eligibility/$currentUserId?t=${DateTime.now().millisecondsSinceEpoch}',
        ),
      );

      if (eligibilityResponse.statusCode == 200) {
        final eligibilityData = json.decode(eligibilityResponse.body);
        final isFreeEligible = eligibilityData['isFreeEligible'] ?? false;
        final remaining = eligibilityData['remainingFreeQuestions'] ?? 0;
        if (isFreeEligible) {
          await sendQuestionToSocket(text, currentUserId);

          setState(() {
            _isSending = false; // ✅ stop loader
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$remaining free questions remaining")),
          );
          _controller.clear();

          // ✅ Scroll to bottom instantly
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(0);
          }

          return;
        }
      }

      // 2. If not eligible, check count
      final countResponse = await http.get(
        Uri.parse(
          'https://chat-backend-rvk9.onrender.com/api/user-question-count/$currentUserId',
        ),
      );

      if (countResponse.statusCode == 200) {
        final countData = json.decode(countResponse.body);
        final count = countData['count'] ?? 0;
        final freeQuota =
            countData['freeQuota'] ?? 2; // Get from backend if available

        if (count < freeQuota) {
          await sendQuestionToSocket(text, currentUserId);
          setState(() {
            _isSending = false; // ✅ stop loader
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "You have ${freeQuota - count - 1} free questions left.",
              ),
            ),
          );
          _controller.clear();
          return;
        }
      }
      // 3. Check paid balance
      final balanceResponse = await http.get(
        Uri.parse(
          'https://chat-backend-rvk9.onrender.com/api/questionspayment/balance',
        ),
        headers: {
          'Authorization':
              'Bearer ${profileProvider.token}', // Make sure this token is set
        },
      );

      setState(() {
        _isSending = false; // ✅ stop loader
      });

      if (balanceResponse.statusCode == 200) {
        final balanceData = json.decode(balanceResponse.body);
        final remainingBalance = balanceData['remaining'] ?? 0;

        if (remainingBalance > 0) {
          await sendQuestionToSocket(text, currentUserId, paid: true);

          // Ideally, backend should decrement count automatically
          _controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$remainingBalance paid questions remaining"),
            ),
          );
          return;
        } else {
          showPaymentDialog(context, currentUserId, text);
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to fetch balance: ${balanceResponse.body}"),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error sending question: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      _controller.clear();
    }
  }

  void showPaymentDialog(BuildContext context, String userId, String text) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(l10n.paymentRequired),
            content: Text(l10n.paymentRequiredMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.cancelButton),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  startStripePayment(userId, text);
                },
                child: Text(l10n.payNowButton),
              ),
            ],
          ),
    );
  }

  Future<void> _rateAnswer(
    String questionId,
    int rating,
    String? feedback,
  ) async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final String userId = profileProvider.userId ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please set your User ID first')),
      );
      return;
    }

    const String apiUrl =
        'https://chat-backend-rvk9.onrender.com/questions/rate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'questionId': questionId,
          'rating': rating,
          'userId': userId,
          if (feedback != null && feedback.isNotEmpty) 'feedback': feedback,
        }),
      );

      if (response.statusCode == 200) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).updateMessageRating(questionId, rating, feedback);

        if (response.statusCode == 200) {
          final chatService = Provider.of<ChatService>(context, listen: false);
          chatService.updateMessageRating(questionId, rating, feedback);

          // ✅ Debug log
          print('🟢 Messages now:');
          chatService.messages.forEach(
            (m) => print('${m.id}: ${m.rating}, ${m.feedback}'),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                rating == 1
                    ? 'Thank you for your feedback!'
                    : 'Rating submitted!',
              ),
            ),
          );
        }
      } else {
        throw Exception('Failed to submit rating');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to submit rating: $e')));
    }
  }

  Future<void> _rateAdvice(String id, int rating, String? feedback) async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please set your User ID first')),
      );
      return;
    }

    final String apiUrl =
        'https://chat-backend-rvk9.onrender.com/advices/$id/rate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'rating': rating,
          'userId': userId,
          if (feedback != null && feedback.isNotEmpty) 'feedback': feedback,
        }),
      );

      if (response.statusCode == 200) {
        Provider.of<ChatService>(
          context,
          listen: false,
        ).updateAdviceRating(id, rating, feedback);
      } else {
        throw Exception('Failed to submit rating');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to submit rating: $e')));
    }
  }

  bool isProduction() => true;
  /* String _stripHtmlIfNeeded(String htmlText) {
    final RegExp exp = RegExp(
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: false,
    );
    return htmlText.replaceAll(exp, '');
  } */

  @override
  void dispose() {
    if (socket.connected) {
      socket.disconnect();
    }

    _refreshTimer?.cancel();
    socket.dispose();
    _scrollController.dispose();
    _textController.dispose();
    _controller.dispose();
    messageController.dispose();
    _animationController.dispose();

    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Refresh unread count when app comes to foreground
      Provider.of<NotificationProvider>(
        context,
        listen: false,
      ).reloadUnreadCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.chatTitle), // Updated
        // Wrap leading icon with Consumer to listen to HoroscopeProvider
        leading: Consumer<HoroscopeProvider>(
          builder: (context, horoscopeProvider, _) {
            final hasUnread = horoscopeProvider.unreadCount > 0;
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                if (hasUnread)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () async {
              final selectedQuestion = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HowToAskScreen()),
              );

              if (selectedQuestion != null && selectedQuestion is String) {
                setState(() {
                  _controller.text = selectedQuestion; // Auto-fill
                });

                // 🔹 Open the keyboard automatically
                Future.delayed(const Duration(milliseconds: 100), () {
                  FocusScope.of(context).requestFocus(_focusNode);
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: _controller.text.length,
                    ), // cursor at end
                  );
                });
              }
            },
          ),

          IconButton(
            icon: Consumer<NotificationProvider>(
              builder: (context, provider, _) {
                print("Badge rebuild with count: ${provider.unreadCount}");
                if (provider.unreadCount > 0) {
                  return badges.Badge(
                    badgeContent: Text(
                      provider.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: const Icon(Icons.notifications),
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                  );
                } else {
                  return const Icon(Icons.notifications);
                }
              },
            ),
            onPressed: () {
              Provider.of<NotificationProvider>(
                context,
                listen: false,
              ).clearUnreadCount();

              final userId =
                  Provider.of<ProfileProvider>(context, listen: false).userId ??
                  '';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NotificationsScreen(userId: userId),
                ),
              ).then((_) {
                Provider.of<NotificationProvider>(
                  context,
                  listen: false,
                ).clearUnreadCount();
              });
            },
          ),
        ],
      ),

      drawer: _buildDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: // In ChatScreen - replace the Consumer2 builder
                    Consumer2<ChatService, DictionaryProvider>(
                  builder: (context, chatService, dictProvider, _) {
                    final dictionaryMap = dictProvider.dictionaryMap;

                    return ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: chatService.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatService.messages[index];
                        return ChatBubble(
                          key: ValueKey(
                            '${message.id}_${message.rating}_${message.feedback}',
                          ),
                          message: message,
                          onRateAnswer: _rateAnswer,
                          onRateAdvice: _rateAdvice,
                          chatService: chatService,
                          dictionaryMap: dictionaryMap,
                        );
                      },
                    );
                  },
                ),
              ),
              _buildMessageInput(),
            ],
          ),
          if (_showScrollToBottomButton)
            Positioned(
              bottom: 80,
              right: 16,
              child: Material(
                color: Colors.transparent, // No background
                shape: const CircleBorder(), // Optional circular shape
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                  ), // Arrow color
                  onPressed: () {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        0, // scroll to bottom for reverse: true
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                      );
                    }
                  },
                ),
              ),
            ),
          // ✅ Small bottom-left loader instead of fullscreen dialo
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    final userId = Provider.of<ProfileProvider>(context, listen: false).userId;
    final l10n = AppLocalizations.of(context)!;

    return Consumer<HoroscopeProvider>(
      builder: (context, horoscopeProvider, _) {
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                        Icons.person,
                        l10n.drawerAstroProfile,
                        ProfileScreen(userId: userId ?? ''),
                      ),
                      _buildDrawerItem(
                        Icons.auto_awesome,
                        l10n.drawerDailyHoroscope,
                        DailyHoroscopeScreen(userId: userId),
                        badge:
                            horoscopeProvider.unreadCount > 0
                                ? _buildBadge(horoscopeProvider.unreadCount)
                                : null,
                      ),
                      _buildDrawerItem(
                        Icons.shopping_cart,
                        l10n.drawerBuyQuestions,
                        const QuestionStoreScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.menu_book,
                        l10n.drawerAstroDictionary,
                        AstroDictionaryScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.settings,
                        l10n.drawerSettings,
                        SettingsScreen(),
                      ),
                      _buildDrawerItem(
                        Icons.support_agent,
                        l10n.drawerCustomerSupport,
                        const CustomerSupportPage(),
                      ),
                      _buildDrawerItem(
                        Icons.info_outline,
                        l10n.drawerAbout,
                        const AboutUsPage(),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                _buildDrawerItem(
                  Icons.settings_suggest,
                  l10n.drawerProfileSettings,
                  ProfileSettingsScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    Widget screen, {
    Widget? badge,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Row(
        children: [
          Text(title),
          if (badge != null) ...[SizedBox(width: 6), badge],
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }

  Widget _buildMessageInput() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: l10n.typeYourQuestionHint, // Updated
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              minLines: 1,
              maxLines: 3,
            ),
          ),
          const SizedBox(width: 8),
          // ✅ Show BouncingDots animation while sending
          _isSending
              ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const BouncingDots(color: Colors.black, size: 8),
              )
              : IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: handleSendMessage,
              ),
        ],
      ),
    );
  }
}
