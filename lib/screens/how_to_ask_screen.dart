import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HowToAskScreen extends StatefulWidget {
  const HowToAskScreen({Key? key}) : super(key: key);

  @override
  State<HowToAskScreen> createState() => _HowToAskScreenState();
}

class _HowToAskScreenState extends State<HowToAskScreen> {
  late Future<List<Question>> questionsFuture;

  @override
  void initState() {
    super.initState();
    questionsFuture = fetchQuestions();
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
      body: FutureBuilder<List<Question>>(
        future: questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No questions available'));
          }

          final questions = snapshot.data!;
          // Group by category
          final Map<String, List<Question>> categorized = {};
          for (var q in questions) {
            categorized.putIfAbsent(q.category, () => []).add(q);
          }

          return ListView(
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
          );
        },
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
}
