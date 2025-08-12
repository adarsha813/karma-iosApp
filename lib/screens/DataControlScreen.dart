import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/profile_provider.dart';

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
      "Are you sure you want to hide all your chat history, clarifications, questions, and answers?",
      () async {
        try {
          // Trigger all requests in parallel
          await Future.wait([
            _sendRequest(
              context,
              "advices/hide-all",
              "All advice hidden successfully.",
              method: 'PATCH',
              body: {'userId': userId, 'hide': true},
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-clarifications",
              "All clarifications hidden successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-questions",
              "All questions hidden successfully.",
              method: 'PATCH',
            ),
            _sendRequest(
              context,
              "questions/user/$userId/hide-answers",
              "All answers hidden successfully.",
              method: 'PATCH',
            ),
          ]);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Everything hidden successfully.")),
          );
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: $e")));
        }
      },
    );
  }

  void _deleteAccount(BuildContext context) {
    _showConfirmationDialog(
      context,
      "Delete Account",
      "Are you sure you want to delete your account?",
      () => _sendRequest(context, "users/delete", "Account deleted."),
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
      () {
        Navigator.pushReplacementNamed(context, '/login');
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
