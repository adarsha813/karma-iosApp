// scripts/fix_broken_translations.dart
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  final languages = ['mg']; // Add other languages if needed

  for (final lang in languages) {
    fixMaterialFile(lang);
    fixCupertinoFile(lang);
  }

  debugPrint('✅ Fixed broken translations');
}

void fixMaterialFile(String languageCode) {
  final fileName = 'lib/l10n/material_localizations_$languageCode.dart';
  final file = File(fileName);

  if (!file.existsSync()) {
    debugPrint('❌ File not found: $fileName');
    return;
  }

  var content = file.readAsStringSync();

  // Fix specific issues in Zulu file

  // Fix line 324: 'inombolo 9;' should be 'inombolo 9'
  content = content.replaceAll("'inombolo 9;", "'inombolo 9'");

  // Fix line 497: '$izinhlamvu ezisele' should be '$remaining izinhlamvu ezisele'
  content = content.replaceAll(
    "      _ => '\$izinhlamvu ezisele',",
    "      _ => '\$remaining izinhlamvu ezisele',",
  );

  // Fix any other common issues
  content = content.replaceAll('\\\$', '\$'); // Fix escaped dollar signs
  content = content.replaceAll('\\\\', '\\'); // Fix double backslashes

  file.writeAsStringSync(content);
  debugPrint('✅ Fixed Material: $fileName');
}

void fixCupertinoFile(String languageCode) {
  final fileName = 'lib/l10n/cupertino_localizations_$languageCode.dart';
  final file = File(fileName);

  if (!file.existsSync()) {
    debugPrint('❌ File not found: $fileName');
    return;
  }

  var content = file.readAsStringSync();

  // Fix line 82: 'phakathi nesonto\$isontoUsuku lwe-\$dayIndex'
  // Should be 'phakathi nesonto \$weekDay usuku lwe-\$dayIndex'
  content = content.replaceAll(
    "      return 'phakathi nesonto\$isontoUsuku lwe-\$dayIndex';",
    "      return 'phakathi nesonto \$weekDay usuku lwe-\$dayIndex';",
  );

  // Fix line 105: '$amaminithi amaminithi' should be '\$minute amaminithi'
  content = content.replaceAll(
    "        : '\$amaminithi amaminithi';",
    "        : '\$minute amaminithi';",
  );

  // Fix any other common issues
  content = content.replaceAll('\\\$', '\$'); // Fix escaped dollar signs
  content = content.replaceAll('\\\\', '\\'); // Fix double backslashes

  file.writeAsStringSync(content);
  debugPrint('✅ Fixed Cupertino: $fileName');
}
