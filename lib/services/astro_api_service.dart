// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/astro_term.dart';

class ApiService {
  static const String baseUrl =
      "https://chat-backend-rvk9.onrender.com/api"; // replace

  static Future<List<AstroTerm>> fetchTerms() async {
    final response = await http.get(Uri.parse("$baseUrl/dictionary"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => AstroTerm.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load terms");
    }
  }
}
