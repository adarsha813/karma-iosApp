import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'material_localizations_yo.dart';
import 'cupertino_localizations_yo.dart';

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true; // Support all locales

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    // Return custom localizations for Yoruba, fallback to default for others
    if (locale.languageCode == 'yo') {
      return MaterialLocalizationsYo(); // Remove const
    }

    // For other languages, use the default MaterialLocalizations
    return const DefaultMaterialLocalizations();
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}

class CustomCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CustomCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    if (locale.languageCode == 'yo') {
      return const CupertinoLocalizationsYo(); // This can stay const
    }

    return const DefaultCupertinoLocalizations();
  }

  @override
  bool shouldReload(CustomCupertinoLocalizationsDelegate old) => false;
}
