// google_translate_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class GoogleTranslateService {
  static const String _baseUrl =
      'https://translation.googleapis.com/language/translate/v2';
  final String apiKey;

  GoogleTranslateService(this.apiKey);

  Future<String?> translateText({
    required String text,
    required String targetLanguage,
    String sourceLanguage = 'en',
  }) async {
    try {
      final url = Uri.parse('$_baseUrl?key=$apiKey');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'q': text,
          'target': targetLanguage,
          'source': sourceLanguage,
          'format': 'text',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data']['translations'][0]['translatedText'];
      } else {
        debugPrint(
          '❌ Translation failed: ${response.statusCode} - ${response.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('❌ Translation error: $e');
      return null;
    }
  }

  Future<Map<String, String>> translateMultiple({
    required Map<String, String> texts,
    required String targetLanguage,
    String sourceLanguage = 'en',
  }) async {
    final Map<String, String> results = {};

    for (final entry in texts.entries) {
      final translated = await translateText(
        text: entry.value,
        targetLanguage: targetLanguage,
        sourceLanguage: sourceLanguage,
      );

      results[entry.key] = translated ?? 'TRANSLATION_FAILED: ${entry.value}';

      // Add delay to avoid rate limiting
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return results;
  }
}
