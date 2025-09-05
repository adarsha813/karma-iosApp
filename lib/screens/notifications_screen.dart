import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../providers/dictionary_provider.dart';
import '../models/notification_model.dart';
import '../services/notification_handler.dart';
import '../services/socket_service.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/dictionary_highlighter.dart';

// Initialize the FlutterLocalNotificationsPlugin globally
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late NotificationProvider _notificationProvider;

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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print('🔹 NotificationsScreen initState');

    _tabController = TabController(length: 1, vsync: this);
    _tabController!.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final provider = Provider.of<NotificationProvider>(
        context,
        listen: false,
      );
      provider.setNotificationScreenOpen(true);
      provider.clearUnreadCount();
      _notificationProvider = provider;
    });

    _initializeNotifications();
    fetchNotifications();
    SocketService().initialize(widget.userId, context);
    setupSocket();
  }

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
      print('📩 New notification: $data');

      final normalizedData = {
        "id": data["_id"]?.toString() ?? "",
        "message": data["message"] ?? "",
        "read": data["read"] ?? false,
        "category": (data["category"] ?? "general").toString().toLowerCase(),
        "createdAt": data["createdAt"] ?? DateTime.now().toIso8601String(),
      };

      final notification = NotificationModel.fromJson(normalizedData);
      final category = normalizedData['category'];

      setState(() {
        // Add category if missing
        if (!notificationsByCategory.containsKey(category)) {
          notificationsByCategory[category] = [];
          categories =
              notificationsByCategory.keys
                  .where((key) => key != 'all')
                  .toList();

          final previousIndex = _tabController?.index ?? 0;
          _tabController?.dispose();
          _tabController = TabController(
            length: categories.length + 1,
            vsync: this,
          );
          _tabController!.addListener(() => setState(() {}));
          _tabController!.index = previousIndex.clamp(0, categories.length);
        }

        // Add new notification at the top
        notificationsByCategory[category]?.insert(0, {
          "id": notification.id,
          "message": notification.message,
          "read": false,
          "createdAt": normalizedData['createdAt'],
        });

        // Scroll to top for visibility
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

      _notificationProvider.setUnreadCount(
        _notificationProvider.unreadCount + 1,
      );

      // Show system notification
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
                "createdAt":
                    msg['createdAt'] ?? DateTime.now().toIso8601String(),
              },
            ),
          );
        });

        if (!mounted) return;
        setState(() {
          notificationsByCategory = cleanedData;
          categories = cleanedData.keys.where((key) => key != 'all').toList();
          isLoading = false;

          _tabController?.dispose();
          _tabController = TabController(
            length: categories.length + 1,
            vsync: this,
          );
          _tabController!.index = 0;
        });

        if (!skipUnreadCount) {
          final count = _getUnreadCount();
          _notificationProvider.setUnreadCount(count);
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
        if (!mounted) return;
        setState(() {
          notificationsByCategory.forEach((key, list) {
            for (var notif in list) {
              notif['read'] = true;
            }
          });
        });
        _notificationProvider.setUnreadCount(0);
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
    final all = notificationsByCategory.values.expand((list) => list).toList();
    all.sort(
      (a, b) => DateTime.parse(
        b["createdAt"],
      ).compareTo(DateTime.parse(a["createdAt"])),
    );
    return all;
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> items) {
    final dictionaryMap = context.watch<DictionaryProvider>().dictionaryMap;
    if (items.isEmpty) {
      return const Center(child: Text("No notifications"));
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final message = item['message'] ?? 'No message';
        final read = items[index]['read'] ?? false;

        return ListTile(
          leading: const Icon(Icons.notifications),
          title: RichText(
            text: DictionaryHighlighter.highlightText(
              context,
              message,
              dictionaryMap,
              TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: read ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
          onTap: () async {
            if (!mounted) return;
            setState(() => items[index]['read'] = true);

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

  Widget _buildSkeletonLoader({int itemCount = 10}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 8),
                    ),
                    Container(height: 14, width: 150, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: CategoryTabs(
            tabController: _tabController!,
            categories: categories,
          ),
        ),
      ),
      body:
          isLoading
              ? _buildSkeletonLoader()
              : TabBarView(
                controller: _tabController!,
                children: [
                  _buildNotificationList(_getAllNotifications()),
                  ...categories.map(
                    (cat) => _buildNotificationList(
                      notificationsByCategory[cat] ?? [],
                    ),
                  ),
                ],
              ),
    );
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    _notificationProvider.setNotificationScreenOpen(false);
    _markAllNotificationsAsRead().catchError(
      (e) => print('Error marking all as read: $e'),
    );
    _tabController?.dispose();
    super.dispose();
  }
}

class CategoryTabs extends StatelessWidget {
  final TabController tabController;
  final List<String> categories;

  const CategoryTabs({
    super.key,
    required this.tabController,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, _) {
        return Row(
          children: [
            GestureDetector(
              onTap: () => tabController.animateTo(0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color:
                      tabController.index == 0
                          ? Colors.deepPurple
                          : Colors.deepPurpleAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "All",
                  style: TextStyle(
                    color:
                        tabController.index == 0 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    final tabIndex = index + 1;
                    final selected = tabController.index == tabIndex;
                    final cat = categories[index];
                    return GestureDetector(
                      onTap: () => tabController.animateTo(tabIndex),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color:
                              selected
                                  ? Colors.deepPurple
                                  : Colors.deepPurpleAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          cat.capitalize(),
                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
