import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../models/notification_model.dart';
import '../services/notification_handler.dart';
import '../services/socket_service.dart'; // adjust the relative path as needed

// Initialize the FlutterLocalNotificationsPlugin globally
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
late NotificationProvider _notificationProvider;

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
    with TickerProviderStateMixin {
  TabController? _tabController;
  Map<String, List<Map<String, dynamic>>> notificationsByCategory = {};
  bool isLoading = true;
  late IO.Socket socket;
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    print('🔹 NotificationsScreen initState');
    _tabController = TabController(length: 1, vsync: this);

    _notificationProvider = Provider.of<NotificationProvider>(
      context,
      listen: false,
    );
    _notificationProvider.setNotificationScreenOpen(true);
    print('📱 NotificationScreen setNotificationScreenOpen(true)');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final provider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );
      provider.setNotificationScreenOpen(true);
      provider.clearUnreadCount();
    });

    _initializeNotifications();
    fetchNotifications();
    SocketService().initialize(widget.userId, context);
    //setupSocket();
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

  void setupSocket() {
    socket = IO.io('https://chat-backend-rvk9.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'userId': widget.userId},
    });

    socket.connect();

    socket.onConnect((_) {
      print('Socket connected');
      socket.emit('joinRoom', widget.userId);
    });

    socket.on('newNotification', (data) {
      print('Socket notification received: $data');

      final provider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );
      final notification = NotificationModel.fromJson(data);
      provider.addNotification(notification);

      if (!provider.isNotificationScreenOpen) {
        provider.incrementUnreadCount();
      }

      NotificationHandler.showSystemNotification(data);
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
          cleanedData[key.toLowerCase()] = List<Map<String, dynamic>>.from(
            value.map(
              (msg) => {
                "id": msg['_id'] is Map ? msg['_id']['\$oid'] : msg['_id'],
                "message": msg['message'],
                "read": msg['read'] ?? false,
              },
            ),
          );
        });
        if (!mounted) return;
        setState(() {
          notificationsByCategory = cleanedData;
          // Categories except "all"
          categories = cleanedData.keys.where((key) => key != 'all').toList();
          isLoading = false;

          // Reset the TabController because tabs changed
          _tabController?.dispose();
          _tabController = TabController(
            length: categories.length + 1,
            vsync: this,
          );

          _tabController?.index = 0;
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
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _markAllNotificationsAsRead() async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://chat-backend-rvk9.onrender.com/notifications/mark-all-read',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"userId": widget.userId}),
      );

      if (response.statusCode == 200) {
        // Update local UI state: mark all read true
        if (!mounted) return;
        setState(() {
          notificationsByCategory.forEach((key, list) {
            for (var notif in list) {
              notif['read'] = true;
            }
          });
        });

        // Update unread count in provider
        final provider = Provider.of<NotificationProvider>(
          context,
          listen: false,
        );
        provider.setUnreadCount(0);
      } else {
        print('Failed to mark all as read');
      }
    } catch (e) {
      print('Error marking all notifications as read: $e');
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
        final item = items[index];
        print('ℹ️ Notification item at $index: $item');
        final message = item['message'] ?? 'No message';
        final read = items[index]['read'] ?? false;

        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(
            message,
            style: TextStyle(
              fontWeight: read ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          onTap: () async {
            // Update UI instantly
            if (!mounted) return;
            setState(() {
              items[index]['read'] = true;
            });

            // Send request to mark as read
            await http.post(
              Uri.parse(
                'https://chat-backend-rvk9.onrender.com/notifications/mark-read',
              ),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                "notificationId": items[index]['id'],
                "userId": widget.userId,
              }),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      print('⚠️ _tabController is null in build!');
      // Show loading or empty placeholder until tabController ready
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    assert(_tabController != null);
    print('ℹ️ _tabController length: ${_tabController!.length}');
    print('ℹ️ categories count: ${categories.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        bottom: TabBar(
          controller: _tabController!,
          tabs: [
            const Tab(text: "All"),
            ...categories.map((cat) => Tab(text: cat.capitalize())).toList(),
          ],
        ),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                controller: _tabController!,
                children: [
                  _buildNotificationList(_getAllNotifications()),
                  ...categories
                      .map(
                        (cat) => _buildNotificationList(
                          notificationsByCategory[cat] ?? [],
                        ),
                      )
                      .toList(),
                ],
              ),
    );
  }

  @override
  void dispose() {
    _notificationProvider.setNotificationScreenOpen(false);
    print('📴 NotificationScreen setNotificationScreenOpen(false)');
    print('🔸 NotificationsScreen dispose');

    // Fire and forget:
    _markAllNotificationsAsRead().catchError((e) {
      print('Error marking all notifications as read on dispose: $e');
    });

    _tabController?.dispose();
    super.dispose();
  }
}
