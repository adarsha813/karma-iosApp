import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/profile_provider.dart';
import '../services/chat_service.dart'; // adjust path if needed
import 'dart:io';
import 'package:flutter/services.dart';

class DataControlScreen extends StatelessWidget {
  const DataControlScreen({super.key});

  static const String baseUrl =
      "https://chat-backend-rvk9.onrender.com"; // change this

  Future<void> _sendRequest(
    BuildContext context,
    String endpoint,
    String successMessage, {
    String method = 'DELETE',
    Map<String, dynamic>? body,
  }) async {
    try {
      http.Response response;
      final uri = Uri.parse("$baseUrl/$endpoint");
      print("🌐 Calling endpoint: $uri");

      if (method == 'DELETE') {
        response = await http.delete(uri);
      } else if (method == 'PATCH') {
        response = await http.patch(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: body != null ? jsonEncode(body) : null,
        );
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }
      print("📨 Response status: ${response.statusCode}");
      print("📨 Response body: ${response.body}");

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(successMessage)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  void _showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  onConfirm();
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }

  void _clearNotifications(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Notifications",
      "Are you sure you want to Clear all notifications?",
      () async {
        try {
          await _sendRequest(
            context,
            "notifications/hide-all",
            "All notifications Cleared successfully.",
            method: 'PATCH',
            body: {'userId': userId},
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Notifications cleared.")),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error clearing notifications: $e")),
          );
        }
      },
    );
  }

  void _clearHoroscope(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Horoscope",
      "Are you sure you want to clear your horoscope data?",
      () => _sendRequest(
        context,
        "horoscope/hide-all",
        "Horoscope Cleared successfully.",
        method: 'PATCH',
        body: {'userId': userId},
      ),
    );
  }

  void _clearChatHistory(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Clear Chat History",
      "Are you sure you want to delete all your chat history, clarifications, questions, and answers?",
      () async {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        final chatService = Provider.of<ChatService>(context, listen: false);
        final userId = profileProvider.userId;

        if (userId == null || userId.isEmpty) return;

        // 1️⃣ Clear UI instantly
        chatService.clearMessages();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Chat cleared locally.")));

        try {
          // 2️⃣ Send API requests in background
          await Future.wait([
            _sendRequest(
              context,
              "advices/hide-all",
              "All advice deleted successfully.",
              method: 'PATCH',
              body: {'userId': userId, 'hide': true},
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-clarifications",
              "All clarifications deleted successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-questions",
              "All questions deleted successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-answers",
              "All answers deleted successfully.",
              method: 'PATCH',
            ),
          ]);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("All chat history deleted successfully."),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error deleting chat: $e")));
        }
      },
    );
  }

  void _deleteAccount(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;

    if (userId == null || userId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User ID not found.")));
      return;
    }

    _showConfirmationDialog(
      context,
      "Delete Account",
      "Are you sure you want to delete your account? This will also clear all your chat history and notifications.",
      () async {
        try {
          // 1️⃣ Delete account (soft delete profile)
          await _sendRequest(
            context,
            "api/profile/remove-profile",
            "Account removed successfully.",
            method: 'PATCH',
            body: {'userId': userId, 'removed': true},
          );

          // 2️⃣ Hide chats, advices, questions, answers, and notifications
          await Future.wait([
            _sendRequest(
              context,
              "advices/hide-all",
              "All advice deleted successfully.",
              method: 'PATCH',
              body: {'userId': userId, 'hide': true},
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-clarifications",
              "All clarifications deleted successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-questions",
              "All questions deleted successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-answers",
              "All answers deleted successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "notifications/hide-all",
              "All notifications hidden successfully.",
              method: 'PATCH',
              body: {'userId': userId},
            ),
          ]);

          // 3️⃣ Clear local profile data
          await profileProvider.clearProfile();

          // 4️⃣ Feedback
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Your account and all data have been removed."),
            ),
          );

          // 5️⃣ Navigate to login
          Navigator.pushReplacementNamed(context, '/login');
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error deleting account: $e")));
        }
      },
    );
  }

  void _recoverAccount(BuildContext context) {
    _showConfirmationDialog(
      context,
      "Recover Account",
      "Recover deleted account data?",
      () => _sendRequest(context, "users/recover", "Account recovery started."),
    );
  }

  void _logout(BuildContext context) {
    _showConfirmationDialog(
      context,
      "Logout",
      "Are you sure you want to logout?",
      () async {
        // 1️⃣ Clear local profile data
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        await profileProvider.clearProfile();

        // 2️⃣ Close the app
        if (Platform.isAndroid) {
          SystemNavigator.pop(); // closes app on Android
        } else if (Platform.isIOS) {
          exit(0); // closes app on iOS (Apple generally discourages this)
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Control")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.clear_all),
            title: const Text("Clear Horoscope"),
            onTap: () => _clearHoroscope(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_off),
            title: const Text("Clear Notifications"),
            onTap: () => _clearNotifications(context),
          ),

          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text("Clear Chat History"),
            onTap: () => _clearChatHistory(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text("Delete Account"),
            onTap: () => _deleteAccount(context),
          ),
          ListTile(
            leading: const Icon(Icons.restore),
            title: const Text("Recover Account"),
            onTap: () => _recoverAccount(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
