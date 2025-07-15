import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    _initializeNotifications(); // <--- add this
    _connectSocket();
    _fetchHoroscopes();
  }

  Future<void> _showSystemNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'horoscope_channel', // channel id
          'Horoscope Notifications', // channel name
          channelDescription: 'Notifications for new daily horoscopes',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000), // ✅ not 0
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void _showHoroscopeNotification(String title, String message) {
    if (!mounted) return;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _connectSocket() {
    _socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket']) // required
          .setQuery({'userId': widget.userId ?? ''}) // ✅ important
          .disableAutoConnect()
          .build(),
    );

    _socket!.onConnect((_) {
      print('✅ Connected to socket with userId: ${widget.userId}');
    });

    _socket!.on('new_horoscope', (data) {
      final now = DateTime.now();

      // 🔁 Debounce: ignore if last message was within 3 seconds
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

      // 1. Show system notification
      //_showSystemNotification("🔮 $title", content);

      // 2. Show custom popup
      //_showHoroscopeNotification("🔮 $title", content);

      // 3. Update the list
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
