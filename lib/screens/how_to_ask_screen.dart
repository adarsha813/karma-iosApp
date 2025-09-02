import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HowToAskScreen extends StatefulWidget {
  const HowToAskScreen({Key? key}) : super(key: key);

  @override
  State<HowToAskScreen> createState() => _HowToAskScreenState();
}

class _HowToAskScreenState extends State<HowToAskScreen> {
  List<Question>? _cachedQuestions; // cached data
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  /// Load from cache first, then update from backend
  Future<void> _loadQuestions() async {
    final prefs = await SharedPreferences.getInstance();

    // Load cached questions if available
    final cachedData = prefs.getString('howToAskCache');
    if (cachedData != null) {
      List data = json.decode(cachedData);
      setState(() {
        _cachedQuestions = data.map((e) => Question.fromJson(e)).toList();
        _isLoading = false;
      });
    }

    // Always fetch fresh data in background
    try {
      final freshQuestions = await fetchQuestions();
      setState(() {
        _cachedQuestions = freshQuestions;
        _isLoading = false;
      });
      // Save to cache
      prefs.setString('howToAskCache', json.encode(freshQuestions));
    } catch (e) {
      if (_cachedQuestions == null) {
        // show error only if no cache
        setState(() => _isLoading = false);
      }
    }
  }

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(
      Uri.parse('https://chat-backend-rvk9.onrender.com/api/howtoask'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Question.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("How To Ask"), elevation: 0),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _cachedQuestions == null || _cachedQuestions!.isEmpty
              ? const Center(child: Text('No questions available'))
              : _buildQuestionsList(_cachedQuestions!),
    );
  }

  Widget _buildQuestionsList(List<Question> questions) {
    // Group by category
    final Map<String, List<Question>> categorized = {};
    for (var q in questions) {
      categorized.putIfAbsent(q.category, () => []).add(q);
    }

    return RefreshIndicator(
      onRefresh: _loadQuestions,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children:
            categorized.entries.map((entry) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ExpansionTile(
                  leading: const Icon(
                    Icons.lightbulb_outline,
                    color: Colors.blue,
                  ),
                  title: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children:
                      entry.value.map((q) {
                        return ListTile(
                          title: Text(
                            q.question,
                            style: const TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            // Send question back to ChatScreen
                            Navigator.pop(context, q.question);
                          },
                          leading: const Icon(
                            Icons.question_answer,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        );
                      }).toList(),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class Question {
  final String id;
  final String category;
  final String question;

  Question({required this.id, required this.category, required this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      category: json['category'],
      question: json['question'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "category": category, "question": question};
  }
}
