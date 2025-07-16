import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utils/pending_notification_navigation.dart';
import 'horoscope_detail_screen.dart';

class DailyHoroscopeScreen extends StatefulWidget {
  final String? userId;
  const DailyHoroscopeScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<DailyHoroscopeScreen> createState() => _DailyHoroscopeScreenState();
}

class _DailyHoroscopeScreenState extends State<DailyHoroscopeScreen> {
  bool _loading = true;
  String? _error;
  DateTime? _lastHoroscopeTime;
  List<Map<String, dynamic>> _horoscopes = [];
  IO.Socket? _socket;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _connectSocket();
    _fetchHoroscopes();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final payload = pendingNavigation.payload;
      if (payload != null) {
        _handleNotificationTap(payload);
        pendingNavigation.payload = null;
      }
    });
  }

  void _handleNotificationTap(String payload) {
    final data = jsonDecode(payload);
    if (data['type'] == 'horoscope') {
      final id = data['id'];
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HoroscopeDetailScreen(horoscopeId: id),
        ),
      );
    }
  }

  void _showHoroscopeNotification(
    String title,
    String message, {
    String? id,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'horoscope_channel',
      'Horoscope Notifications',
      channelDescription: 'Notifications for new daily horoscopes',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      id.hashCode, // unique ID for the notification
      title,
      message,
      notificationDetails,
      payload: jsonEncode({
        'type': 'horoscope',
        'id': id ?? '',
        'source': 'socket',
      }),
    );
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payload = response.payload;
        if (payload != null) {
          _handleNotificationTap(payload);
        }
      },
    );
  }

  void _connectSocket() {
    _socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': widget.userId ?? ''})
          .disableAutoConnect()
          .build(),
    );

    _socket!.onConnect((_) {
      print('✅ Connected to socket with userId: ${widget.userId}');
    });

    _socket!.on('new_horoscope', (data) {
      final now = DateTime.now();

      if (_lastHoroscopeTime != null &&
          now.difference(_lastHoroscopeTime!).inSeconds < 3) {
        print("🛑 Skipping duplicate horoscope notification");
        return;
      }

      _lastHoroscopeTime = now;

      print('📩 Received new_horoscope: $data');

      final horoscope = Map<String, dynamic>.from(data);
      final title = horoscope['title'] ?? 'New Horoscope';
      final content = horoscope['text'] ?? '';

      _showHoroscopeNotification("🔮 $title", content, id: horoscope['_id']);

      setState(() {
        _horoscopes.insert(0, horoscope);
      });
    });

    _socket!.onDisconnect((_) => print('🔌 Disconnected from socket'));
    _socket!.connect();
  }

  @override
  void dispose() {
    _socket?.disconnect();
    _socket?.destroy();
    super.dispose();
  }

  Future<void> _fetchHoroscopes() async {
    if (widget.userId == null || widget.userId!.isEmpty) {
      setState(() {
        _error = 'User ID is missing';
        _loading = false;
      });
      return;
    }

    final url =
        'https://chat-backend-rvk9.onrender.com/horoscope/user/${widget.userId}';
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final List<dynamic> data = json.decode(res.body);
        setState(() {
          _horoscopes = List<Map<String, dynamic>>.from(data);
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to fetch horoscopes';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🌟 Daily Horoscope")),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
              ? Center(child: Text(_error!))
              : _horoscopes.isEmpty
              ? const Center(child: Text("No horoscope found."))
              : ListView.builder(
                itemCount: _horoscopes.length,
                itemBuilder: (context, index) {
                  final item = _horoscopes[index];
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item['title'] != null)
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (item['sign'] != null)
                            Text("Sign: ${item['sign']}"),
                          const SizedBox(height: 8),
                          Text(item['text'] ?? ''),
                          const SizedBox(height: 4),
                          Text(
                            "📅 ${item['createdAt'] != null ? DateTime.parse(item['createdAt']).toLocal().toString() : ''}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

// 👇 Move this outside the State class
