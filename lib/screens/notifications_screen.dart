import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';

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
  Map<String, List<Map<String, dynamic>>> notificationsByCategory = {};
  bool isLoading = true;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeNotifications();
    fetchNotifications(skipUnreadCount: true).then((_) {
      _markAllAsRead();
    });

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

  void _markAllAsRead() {
    setState(() {
      notificationsByCategory.forEach((key, list) {
        for (var notif in list) {
          notif['read'] = true;
        }
      });
    });

    // Also tell the NotificationProvider to clear count
    final provider = Provider.of<NotificationProvider>(context, listen: false);
    provider.setUnreadCount(0);
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

    socket.onDisconnect((_) => print('Socket disconnected'));
  }

  Future<void> fetchNotifications({bool skipUnreadCount = false}) async {
    final url = Uri.parse(
      'https://chat-backend-rvk9.onrender.com/notifications/${widget.userId}',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("Raw response: ${response.body}");

        final Map<String, List<Map<String, dynamic>>> cleanedData = {};
        data.forEach((key, value) {
          cleanedData[key] = List<Map<String, dynamic>>.from(
            value.map((msg) => {"message": msg, "read": false}),
          );
        });

        setState(() {
          notificationsByCategory = cleanedData;
          isLoading = false;
        });

        if (!skipUnreadCount) {
          final count = _getUnreadCount();
          final provider = Provider.of<NotificationProvider>(
            context,
            listen: false,
          );
          provider.setUnreadCount(count);
        }
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

  int _getUnreadCount() {
    int count = 0;
    notificationsByCategory.forEach((category, notifications) {
      count += notifications.where((n) => !n['read']).length;
    });
    return count;
  }

  List<Map<String, dynamic>> _getAllNotifications() {
    return notificationsByCategory.values.expand((list) => list).toList();
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No notifications"));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final message = items[index]['message'];
        final read = items[index]['read'] ?? false;

        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(
            message,
            style: TextStyle(
              fontWeight: read ? FontWeight.normal : FontWeight.bold,
            ),
          ),
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
