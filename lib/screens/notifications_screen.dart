import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    fetchNotifications();
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
            Tab(text: "Advices"), // adjust tab names as needed
          ],
        ),
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                controller: _tabController,
                children: [
                  _buildNotificationList(_getAllNotifications()), // All
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
    _tabController.dispose();
    super.dispose();
  }
}
