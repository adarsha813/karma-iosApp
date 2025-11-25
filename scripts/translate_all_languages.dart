// scripts/translate_all_languages.dart
import 'dart:io';
import 'dart:convert'; // ✅ Add this line
import 'package:flutter/foundation.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    debugPrint('Usage: dart translate_all_languages.dart <api_key>');
    debugPrint('Example: dart translate_all_languages.dart YOUR_API_KEY');
    return;
  }

  final apiKey = arguments[0];

  final languages = [
    'af',
    'am',
    'az',
    'be',
    'bn',
    'bs',
    'ca',
    'ceb',
    'co',
    'cy',
    'eo',
    'et',
    'eu',
    'fy',
    'ga',
    'gd',
    'gl',
    'gu',
    'ha',
    'haw',
    'hmn',
    'ht',
    'hy',
    'ig',
    'is',
    'jv',
    'ka',
    'kk',
    'km',
    'kn',
    'ku',
    'ky',
    'lb',
    'lo',
    'mg',
    'mi',
    'mk',
    'mn',
    'mr',
    'ms',
    'mt',
    'my',
    'ne',
    'ny',
    'or',
    'ps',
    'rw',
    'sd',
    'si',
    'sk',
    'sl',
    'sm',
    'sn',
    'so',
    'sq',
    'sr',
    'st',
    'su',
    'sv',
    'sw',
    'ta',
    'te',
    'tg',
    'tk',
    'tl',
    'tt',
    'ug',
    'uz',
    'xh',
    'yi',
    'yo',
    'zu',
  ];

  debugPrint(
    '🚀 Starting batch translation for ${languages.length} languages...',
  );

  for (final language in languages) {
    debugPrint('\n--- Translating $language ---');

    // Run the translation script for each language
    final process = await Process.start('dart', [
      'translate_localizations.dart',
      language,
      apiKey,
    ], runInShell: true);

    // Capture output
    process.stdout.transform(utf8.decoder).listen(debugPrint);
    process.stderr.transform(utf8.decoder).listen(debugPrint);

    // Wait for completion
    final exitCode = await process.exitCode;

    if (exitCode == 0) {
      debugPrint('✅ Successfully translated $language');
    } else {
      debugPrint('❌ Failed to translate $language');
    }

    // Add delay between languages to avoid overwhelming the API
    await Future.delayed(const Duration(seconds: 2));
  }

  debugPrint('\n🎉 Batch translation completed!');
}
