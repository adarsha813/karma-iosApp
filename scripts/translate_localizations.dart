// scripts/translate_localizations.dart
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

// Add this function at the beginning of the main function
Future<bool> ensureFilesExist(String languageCode) async {
  final materialFile = File(
    'lib/l10n/material_localizations_$languageCode.dart',
  );
  final cupertinoFile = File(
    'lib/l10n/cupertino_localizations_$languageCode.dart',
  );

  if (!materialFile.existsSync() || !cupertinoFile.existsSync()) {
    print('❌ Template files not found for $languageCode');
    print('   Please run: dart generate_all_templates.dart first');
    return false;
  }

  return true;
}

void main(List<String> arguments) async {
  if (arguments.length != 2) {
    print('Usage: dart translate_localizations.dart <language_code> <api_key>');
    print('Example: dart translate_localizations.dart yo YOUR_API_KEY');
    return;
  }

  final languageCode = arguments[0];
  final apiKey = arguments[1];

  if (!await ensureFilesExist(languageCode)) {
    return;
  }

  final translator = GoogleTranslateService(apiKey);

  print('🚀 Starting translation for $languageCode...');

  // Translate Material localizations
  await translateMaterialLocalizations(translator, languageCode);

  // Translate Cupertino localizations
  await translateCupertinoLocalizations(translator, languageCode);

  print('✅ Translation completed for $languageCode!');
}

Future<void> translateMaterialLocalizations(
  GoogleTranslateService translator,
  String languageCode,
) async {
  final fileName = 'material_localizations_$languageCode.dart';
  final filePath = path.join('lib', 'l10n', fileName);

  if (!File(filePath).existsSync()) {
    print('❌ File not found: $filePath');
    return;
  }

  final content = await File(filePath).readAsString();
  final lines = LineSplitter.split(content).toList();

  final textsToTranslate = <String, String>{};
  final lineIndices = <String, int>{};

  // Extract all TODO texts to translate
  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    final todoMatch = RegExp(r"TODO: Translate (.+)").firstMatch(line);

    if (todoMatch != null) {
      final text = todoMatch.group(1)!;
      final key = 'line_$i';
      textsToTranslate[key] = text;
      lineIndices[key] = i;
    }
  }

  print(
    '📝 Found ${textsToTranslate.length} texts to translate for Material...',
  );

  // Translate all texts
  final translations = await translator.translateMultiple(
    texts: textsToTranslate,
    targetLanguage: languageCode,
  );

  // Replace lines with translations
  for (final entry in translations.entries) {
    final originalLineIndex = lineIndices[entry.key]!;
    final originalLine = lines[originalLineIndex];
    final translatedText = entry.value;

    // Replace the TODO line with actual translation
    final newLine = originalLine.replaceAll(
      RegExp(r"TODO: Translate .+"),
      translatedText,
    );

    lines[originalLineIndex] = newLine;
  }

  // Write updated content back to file
  await File(filePath).writeAsString(lines.join('\n'));
  print('✅ Material translations saved for $languageCode');
}

Future<void> translateCupertinoLocalizations(
  GoogleTranslateService translator,
  String languageCode,
) async {
  final fileName = 'cupertino_localizations_$languageCode.dart';
  final filePath = path.join('lib', 'l10n', fileName);

  if (!File(filePath).existsSync()) {
    print('❌ File not found: $filePath');
    return;
  }

  final content = await File(filePath).readAsString();
  final lines = LineSplitter.split(content).toList();

  final textsToTranslate = <String, String>{};
  final lineIndices = <String, int>{};

  // Extract all TODO texts to translate
  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    final todoMatch = RegExp(r"TODO: Translate (.+)").firstMatch(line);

    if (todoMatch != null) {
      final text = todoMatch.group(1)!;
      final key = 'line_$i';
      textsToTranslate[key] = text;
      lineIndices[key] = i;
    }
  }

  print(
    '📝 Found ${textsToTranslate.length} texts to translate for Cupertino...',
  );

  // Translate all texts
  final translations = await translator.translateMultiple(
    texts: textsToTranslate,
    targetLanguage: languageCode,
  );

  // Replace lines with translations
  for (final entry in translations.entries) {
    final originalLineIndex = lineIndices[entry.key]!;
    final originalLine = lines[originalLineIndex];
    final translatedText = entry.value;

    // Replace the TODO line with actual translation
    final newLine = originalLine.replaceAll(
      RegExp(r"TODO: Translate .+"),
      translatedText,
    );

    lines[originalLineIndex] = newLine;
  }

  // Write updated content back to file
  await File(filePath).writeAsString(lines.join('\n'));
  print('✅ Cupertino translations saved for $languageCode');
}

// Copy the GoogleTranslateService class here or import it
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
        print(
          '❌ Translation failed: ${response.statusCode} - ${response.body}',
        );
        return null;
      }
    } catch (e) {
      print('❌ Translation error: $e');
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
      print('🔤 Translating: "${entry.value}"');

      final translated = await translateText(
        text: entry.value,
        targetLanguage: targetLanguage,
        sourceLanguage: sourceLanguage,
      );

      results[entry.key] = translated ?? 'TRANSLATION_FAILED: ${entry.value}';

      print('✅ Translated to: "${results[entry.key]}"');

      // Add delay to avoid rate limiting
      await Future.delayed(const Duration(milliseconds: 200));
    }

    return results;
  }
}
