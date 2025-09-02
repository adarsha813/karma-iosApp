import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';

Future<void> hideItem(
  BuildContext context,
  String endpoint,
  String itemId,
) async {
  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  final baseUrl =
      'https://chat-backend-rvk9.onrender.com'; // change to your actual API URL

  final url = Uri.parse('$baseUrl$endpoint/$itemId/hide');

  try {
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${profileProvider.token}', // if you have auth
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Item hidden successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to hide item: ${response.body}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}
