// scripts/translate_all_languages.dart
import 'dart:io';
import 'dart:convert'; // ✅ Add this line

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Usage: dart translate_all_languages.dart <api_key>');
    print('Example: dart translate_all_languages.dart YOUR_API_KEY');
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

  print('🚀 Starting batch translation for ${languages.length} languages...');

  for (final language in languages) {
    print('\n--- Translating $language ---');

    // Run the translation script for each language
    final process = await Process.start('dart', [
      'translate_localizations.dart',
      language,
      apiKey,
    ], runInShell: true);

    // Capture output
    process.stdout.transform(utf8.decoder).listen(print);
    process.stderr.transform(utf8.decoder).listen(print);

    // Wait for completion
    final exitCode = await process.exitCode;

    if (exitCode == 0) {
      print('✅ Successfully translated $language');
    } else {
      print('❌ Failed to translate $language');
    }

    // Add delay between languages to avoid overwhelming the API
    await Future.delayed(const Duration(seconds: 2));
  }

  print('\n🎉 Batch translation completed!');
}
