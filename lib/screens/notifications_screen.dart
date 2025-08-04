import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Initialize the FlutterLocalNotificationsPlugin globally
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// String extension to capitalize first letter
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

class NotificationsScreen extends StatefulWidget {
  final String userId;
  const NotificationsScreen({super.key, required this.userId});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, List<String>> notificationsByCategory = {};
  bool isLoading = true;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeNotifications();
    fetchNotifications();
    setupSocket();
  }

  // Initialize flutter_local_notifications
  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void _showSystemNotification(String title, String body) {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'your_channel_id',
          'Your Channel Name',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    flutterLocalNotificationsPlugin.show(
      0, // Notification ID, change if you want multiple notifications
      title,
      body,
      platformDetails,
    );
  }

  void setupSocket() {
    socket = IO.io('https://chat-backend-rvk9.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userId': widget.userId, // <---- ADD THIS LINE
      },
    });

    socket.connect();

    socket.onConnect((_) {
      print('Socket connected');
      print('Socket connected with id: ${socket.id}');
      print(
        'Socket handshake query: ${socket.io.options == null ? 'null' : socket.io.options!['query']}',
      );

      socket.emit('joinRoom', widget.userId);
    });

    socket.on('newNotification', (data) {
      print('Received newNotification: $data');

      String category = data['category'] ?? 'general';
      String message = data['message'] ?? '';

      setState(() {
        notificationsByCategory.putIfAbsent(category, () => []);
        notificationsByCategory[category]!.insert(0, message);
      });

      _showSystemNotification("🔔 New ${category.capitalize()}", message);
    });

    socket.onDisconnect((_) => print('Socket disconnected'));
  }

  Future<void> fetchNotifications() async {
    final url = Uri.parse(
      'https://chat-backend-rvk9.onrender.com/notifications/${widget.userId}',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("Raw response: ${response.body}");

        final Map<String, List<String>> cleanedData = {};
        data.forEach((key, value) {
          cleanedData[key] = List<String>.from(value);
        });

        setState(() {
          notificationsByCategory = cleanedData;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  List<String> _getAllNotifications() {
    return notificationsByCategory.values.expand((list) => list).toList();
  }

  Widget _buildNotificationList(List<String> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No notifications"));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final message = items[index];
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Offers"),
            Tab(text: "Advices"),
          ],
        ),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                controller: _tabController,
                children: [
                  _buildNotificationList(_getAllNotifications()),
                  _buildNotificationList(
                    notificationsByCategory['offers'] ?? [],
                  ),
                  _buildNotificationList(
                    notificationsByCategory['advices'] ?? [],
                  ),
                ],
              ),
    );
  }

  @override
  void dispose() {
    socket.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
