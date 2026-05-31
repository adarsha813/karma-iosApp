import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../config/environment.dart'; // ✅ Add this import

Future<void> hideItem(
  BuildContext context,
  String endpoint,
  String itemId,
) async {
  // Capture references before async call
  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  final messenger = ScaffoldMessenger.of(context);

  final url = Uri.parse('${Environment.baseUrl}$endpoint/$itemId/hide');

  try {
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${profileProvider.token}',
      },
      body: jsonEncode({}),
    );

    // Use captured messenger, not context
    if (response.statusCode == 200) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Item hidden successfully')),
      );
    } else {
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to hide item: ${response.body}')),
      );
    }
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}
