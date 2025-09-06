import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PolicyPage extends StatefulWidget {
  final String title; // add title to use in AppBar
  final String url; // backend endpoint

  const PolicyPage({super.key, required this.title, required this.url});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  String content = "";
  bool isLoading = true;
  String error = "";

  @override
  void initState() {
    super.initState();
    fetchPolicy();
  }

  Future<void> fetchPolicy() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          content = data['content'] ?? "No content available.";
          isLoading = false;
        });
      } else {
        setState(() {
          error = "Failed to load content. (${response.statusCode})";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = "An error occurred: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[700],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : error.isNotEmpty
              ? Center(child: Text(error))
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
    );
  }
}
