// generate_localization_templates.dart
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  final unsupportedLanguages = [
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
    '🚀 Generating templates for ${unsupportedLanguages.length} languages...',
  );

  for (final langCode in unsupportedLanguages) {
    generateMaterialTemplate(langCode);
    generateCupertinoTemplate(langCode);
  }

  debugPrint('✅ All templates generated!');
}

void generateMaterialTemplate(String languageCode) {
  final className = 'MaterialLocalizations${_capitalize(languageCode)}';
  final fileName = 'material_localizations_$languageCode.dart';

  final template = '''
import 'package:flutter/material.dart';

class $className extends DefaultMaterialLocalizations {
  $className();

// ${_getLanguageName(languageCode)}
  
  // Getters
  @override
  String get openAppDrawerTooltip => 'TODO: Translate openAppDrawerTooltip';

  @override
  String get backButtonTooltip => 'TODO: Translate backButtonTooltip';

  @override
  String get clearButtonTooltip => 'TODO: Translate clearButtonTooltip';

  @override
  String get closeButtonTooltip => 'TODO: Translate closeButtonTooltip';

  @override
  String get deleteButtonTooltip => 'TODO: Translate deleteButtonTooltip';

  @override
  String get moreButtonTooltip => 'TODO: Translate moreButtonTooltip';

  @override
  String get nextMonthTooltip => 'TODO: Translate nextMonthTooltip';

  @override
  String get previousMonthTooltip => 'TODO: Translate previousMonthTooltip';

  @override
  String get firstPageTooltip => 'TODO: Translate firstPageTooltip';

  @override
  String get lastPageTooltip => 'TODO: Translate lastPageTooltip';

  @override
  String get nextPageTooltip => 'TODO: Translate nextPageTooltip';

  @override
  String get previousPageTooltip => 'TODO: Translate previousPageTooltip';

  @override
  String get showMenuTooltip => 'TODO: Translate showMenuTooltip';

  @override
  String get licensesPageTitle => 'TODO: Translate licensesPageTitle';

  @override
  String get rowsPerPageTitle => 'TODO: Translate rowsPerPageTitle';

  @override
  String get cancelButtonLabel => 'TODO: Translate cancelButtonLabel';

  @override
  String get closeButtonLabel => 'TODO: Translate closeButtonLabel';

  @override
  String get continueButtonLabel => 'TODO: Translate continueButtonLabel';

  @override
  String get copyButtonLabel => 'TODO: Translate copyButtonLabel';

  @override
  String get cutButtonLabel => 'TODO: Translate cutButtonLabel';

  @override
  String get scanTextButtonLabel => 'TODO: Translate scanTextButtonLabel';

  @override
  String get okButtonLabel => 'TODO: Translate okButtonLabel';

  @override
  String get pasteButtonLabel => 'TODO: Translate pasteButtonLabel';

  @override
  String get selectAllButtonLabel => 'TODO: Translate selectAllButtonLabel';

  @override
  String get lookUpButtonLabel => 'TODO: Translate lookUpButtonLabel';

  @override
  String get searchWebButtonLabel => 'TODO: Translate searchWebButtonLabel';

  @override
  String get shareButtonLabel => 'TODO: Translate shareButtonLabel';

  @override
  String get viewLicensesButtonLabel => 'TODO: Translate viewLicensesButtonLabel';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get timePickerHourModeAnnouncement => 'TODO: Translate timePickerHourModeAnnouncement';

  @override
  String get timePickerMinuteModeAnnouncement => 'TODO: Translate timePickerMinuteModeAnnouncement';

  @override
  String get modalBarrierDismissLabel => 'TODO: Translate modalBarrierDismissLabel';

  @override
  String get menuDismissLabel => 'TODO: Translate menuDismissLabel';

  @override
  String get drawerLabel => 'TODO: Translate drawerLabel';

  @override
  String get popupMenuLabel => 'TODO: Translate popupMenuLabel';

  @override
  String get menuBarMenuLabel => 'TODO: Translate menuBarMenuLabel';

  @override
  String get dialogLabel => 'TODO: Translate dialogLabel';

  @override
  String get alertDialogLabel => 'TODO: Translate alertDialogLabel';

  @override
  String get searchFieldLabel => 'TODO: Translate searchFieldLabel';

  @override
  String get currentDateLabel => 'TODO: Translate currentDateLabel';

  @override
  String get selectedDateLabel => 'TODO: Translate selectedDateLabel';

  @override
  String get scrimLabel => 'TODO: Translate scrimLabel';

  @override
  String get bottomSheetLabel => 'TODO: Translate bottomSheetLabel';

  @override
  String get dateSeparator => '/';

  @override
  String get dateHelpText => 'TODO: Translate dateHelpText';

  @override
  String get selectYearSemanticsLabel => 'TODO: Translate selectYearSemanticsLabel';

  @override
  String get unspecifiedDate => 'TODO: Translate unspecifiedDate';

  @override
  String get unspecifiedDateRange => 'TODO: Translate unspecifiedDateRange';

  @override
  String get dateInputLabel => 'TODO: Translate dateInputLabel';

  @override
  String get dateRangeStartLabel => 'TODO: Translate dateRangeStartLabel';

  @override
  String get dateRangeEndLabel => 'TODO: Translate dateRangeEndLabel';

  @override
  String get invalidDateFormatLabel => 'TODO: Translate invalidDateFormatLabel';

  @override
  String get invalidDateRangeLabel => 'TODO: Translate invalidDateRangeLabel';

  @override
  String get dateOutOfRangeLabel => 'TODO: Translate dateOutOfRangeLabel';

  @override
  String get saveButtonLabel => 'TODO: Translate saveButtonLabel';

  @override
  String get datePickerHelpText => 'TODO: Translate datePickerHelpText';

  @override
  String get dateRangePickerHelpText => 'TODO: Translate dateRangePickerHelpText';

  @override
  String get calendarModeButtonLabel => 'TODO: Translate calendarModeButtonLabel';

  @override
  String get inputDateModeButtonLabel => 'TODO: Translate inputDateModeButtonLabel';

  @override
  String get timePickerDialHelpText => 'TODO: Translate timePickerDialHelpText';

  @override
  String get timePickerInputHelpText => 'TODO: Translate timePickerInputHelpText';

  @override
  String get timePickerHourLabel => 'TODO: Translate timePickerHourLabel';

  @override
  String get timePickerMinuteLabel => 'TODO: Translate timePickerMinuteLabel';

  @override
  String get invalidTimeLabel => 'TODO: Translate invalidTimeLabel';

  @override
  String get dialModeButtonLabel => 'TODO: Translate dialModeButtonLabel';

  @override
  String get inputTimeModeButtonLabel => 'TODO: Translate inputTimeModeButtonLabel';

  @override
  String get signedInLabel => 'TODO: Translate signedInLabel';

  @override
  String get hideAccountsLabel => 'TODO: Translate hideAccountsLabel';

  @override
  String get showAccountsLabel => 'TODO: Translate showAccountsLabel';

  @override
  String get expandedIconTapHint => 'TODO: Translate expandedIconTapHint';

  @override
  String get collapsedIconTapHint => 'TODO: Translate collapsedIconTapHint';

  @override
  String get expansionTileExpandedHint => 'TODO: Translate expansionTileExpandedHint';

  @override
  String get expansionTileCollapsedHint => 'TODO: Translate expansionTileCollapsedHint';

  @override
  String get expansionTileExpandedTapHint => 'TODO: Translate expansionTileExpandedTapHint';

  @override
  String get expansionTileCollapsedTapHint => 'TODO: Translate expansionTileCollapsedTapHint';

  @override
  String get expandedHint => 'TODO: Translate expandedHint';

  @override
  String get collapsedHint => 'TODO: Translate collapsedHint';

  @override
  String get refreshIndicatorSemanticLabel => 'TODO: Translate refreshIndicatorSemanticLabel';

  @override
  String get keyboardKeyAlt => 'TODO: Translate keyboardKeyAlt';

  @override
  String get keyboardKeyAltGraph => 'TODO: Translate keyboardKeyAltGraph';

  @override
  String get keyboardKeyBackspace => 'TODO: Translate keyboardKeyBackspace';

  @override
  String get keyboardKeyCapsLock => 'TODO: Translate keyboardKeyCapsLock';

  @override
  String get keyboardKeyChannelDown => 'TODO: Translate keyboardKeyChannelDown';

  @override
  String get keyboardKeyChannelUp => 'TODO: Translate keyboardKeyChannelUp';

  @override
  String get keyboardKeyControl => 'TODO: Translate keyboardKeyControl';

  @override
  String get keyboardKeyDelete => 'TODO: Translate keyboardKeyDelete';

  @override
  String get keyboardKeyEject => 'TODO: Translate keyboardKeyEject';

  @override
  String get keyboardKeyEnd => 'TODO: Translate keyboardKeyEnd';

  @override
  String get keyboardKeyEscape => 'TODO: Translate keyboardKeyEscape';

  @override
  String get keyboardKeyFn => 'TODO: Translate keyboardKeyFn';

  @override
  String get keyboardKeyHome => 'TODO: Translate keyboardKeyHome';

  @override
  String get keyboardKeyInsert => 'TODO: Translate keyboardKeyInsert';

  @override
  String get keyboardKeyMeta => 'TODO: Translate keyboardKeyMeta';

  @override
  String get keyboardKeyMetaMacOs => 'TODO: Translate keyboardKeyMetaMacOs';

  @override
  String get keyboardKeyMetaWindows => 'TODO: Translate keyboardKeyMetaWindows';

  @override
  String get keyboardKeyNumLock => 'TODO: Translate keyboardKeyNumLock';

  @override
  String get keyboardKeyNumpad1 => 'TODO: Translate keyboardKeyNumpad1';

  @override
  String get keyboardKeyNumpad2 => 'TODO: Translate keyboardKeyNumpad2';

  @override
  String get keyboardKeyNumpad3 => 'TODO: Translate keyboardKeyNumpad3';

  @override
  String get keyboardKeyNumpad4 => 'TODO: Translate keyboardKeyNumpad4';

  @override
  String get keyboardKeyNumpad5 => 'TODO: Translate keyboardKeyNumpad5';

  @override
  String get keyboardKeyNumpad6 => 'TODO: Translate keyboardKeyNumpad6';

  @override
  String get keyboardKeyNumpad7 => 'TODO: Translate keyboardKeyNumpad7';

  @override
  String get keyboardKeyNumpad8 => 'TODO: Translate keyboardKeyNumpad8';

  @override
  String get keyboardKeyNumpad9 => 'TODO: Translate keyboardKeyNumpad9';

  @override
  String get keyboardKeyNumpad0 => 'TODO: Translate keyboardKeyNumpad0';

  @override
  String get keyboardKeyNumpadAdd => 'TODO: Translate keyboardKeyNumpadAdd';

  @override
  String get keyboardKeyNumpadComma => 'TODO: Translate keyboardKeyNumpadComma';

  @override
  String get keyboardKeyNumpadDecimal => 'TODO: Translate keyboardKeyNumpadDecimal';

  @override
  String get keyboardKeyNumpadDivide => 'TODO: Translate keyboardKeyNumpadDivide';

  @override
  String get keyboardKeyNumpadEnter => 'TODO: Translate keyboardKeyNumpadEnter';

  @override
  String get keyboardKeyNumpadEqual => 'TODO: Translate keyboardKeyNumpadEqual';

  @override
  String get keyboardKeyNumpadMultiply => 'TODO: Translate keyboardKeyNumpadMultiply';

  @override
  String get keyboardKeyNumpadParenLeft => 'TODO: Translate keyboardKeyNumpadParenLeft';

  @override
  String get keyboardKeyNumpadParenRight => 'TODO: Translate keyboardKeyNumpadParenRight';

  @override
  String get keyboardKeyNumpadSubtract => 'TODO: Translate keyboardKeyNumpadSubtract';

  @override
  String get keyboardKeyPageDown => 'TODO: Translate keyboardKeyPageDown';

  @override
  String get keyboardKeyPageUp => 'TODO: Translate keyboardKeyPageUp';

  @override
  String get keyboardKeyPower => 'TODO: Translate keyboardKeyPower';

  @override
  String get keyboardKeyPowerOff => 'TODO: Translate keyboardKeyPowerOff';

  @override
  String get keyboardKeyPrintScreen => 'TODO: Translate keyboardKeyPrintScreen';

  @override
  String get keyboardKeyScrollLock => 'TODO: Translate keyboardKeyScrollLock';

  @override
  String get keyboardKeySelect => 'TODO: Translate keyboardKeySelect';

  @override
  String get keyboardKeyShift => 'TODO: Translate keyboardKeyShift';

  @override
  String get keyboardKeySpace => 'TODO: Translate keyboardKeySpace';

  // Methods with Parameters
  @override
  String aboutListTileTitle(String applicationName) => 'TODO: Translate about \$applicationName';

  @override
  String licensesPackageDetailText(int licenseCount) {
    return switch (licenseCount) {
      0 => 'TODO: Translate no licenses',
      1 => 'TODO: Translate 1 license',
      _ => 'TODO: Translate \$licenseCount licenses',
    };
  }

  @override
  String pageRowsInfoTitle(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return rowCountIsApproximate
        ? 'TODO: Translate \$firstRow–\$lastRow of about \$rowCount'
        : 'TODO: Translate \$firstRow–\$lastRow of \$rowCount';
  }

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    return 'TODO: Translate tab \$tabIndex of \$tabCount';
  }

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    return switch (selectedRowCount) {
      0 => 'TODO: Translate no items selected',
      1 => 'TODO: Translate 1 item selected',
      _ => 'TODO: Translate \$selectedRowCount items selected',
    };
  }

  @override
  String scrimOnTapHint(String modalRouteContentName) => 'TODO: Translate close \$modalRouteContentName';

  @override
  String formatDecimal(int number) => number.toString();

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return alwaysUse24HourFormat 
        ? timeOfDay.hour.toString().padLeft(2, '0')
        : (timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod).toString();
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) => timeOfDay.minute.toString().padLeft(2, '0');

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    final hour = formatHour(timeOfDay, alwaysUse24HourFormat: alwaysUse24HourFormat);
    final minute = formatMinute(timeOfDay);
    if (alwaysUse24HourFormat) {
      return '\$hour:\$minute';
    }
    final period = timeOfDay.period == DayPeriod.am ? anteMeridiemAbbreviation : postMeridiemAbbreviation;
    return '\$hour:\$minute \$period';
  }

  @override
  String formatYear(DateTime date) => date.year.toString();

  @override
  String formatCompactDate(DateTime date) {
    return '\${date.month}/\${date.day}/\${date.year}';
  }

  @override
  String formatShortDate(DateTime date) {
    return 'TODO: Format short date for \${date.day}/\${date.month}/\${date.year}';
  }

  @override
  String formatMediumDate(DateTime date) {
    return 'TODO: Format medium date for \${date.day}/\${date.month}/\${date.year}';
  }

  @override
  String formatFullDate(DateTime date) {
    return 'TODO: Format full date for \${date.day}/\${date.month}/\${date.year}';
  }

  @override
  String formatMonthYear(DateTime date) {
    return 'TODO: Format month year for \${date.month}/\${date.year}';
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return 'TODO: Format short month day for \${date.month}/\${date.day}';
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    
    return null;
  }

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) => 'TODO: Translate start date \$formattedDate';

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) => 'TODO: Translate end date \$formattedDate';

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return switch (remaining) {
      0 => 'TODO: Translate no characters remaining',
      1 => 'TODO: Translate 1 character remaining',
      _ => 'TODO: Translate \$remaining characters remaining',
    };
  }

  // Properties
  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return alwaysUse24HourFormat 
        ? TimeOfDayFormat.HH_colon_mm 
        : TimeOfDayFormat.h_colon_mm_space_a;
  }

  @override
  List<String> get narrowWeekdays => const ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _${className}Delegate();
}

class _${className}Delegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _${className}Delegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == '$languageCode';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return $className();
  }

  @override
  bool shouldReload(_${className}Delegate old) => false;
}
''';

  File('lib/l10n/$fileName').writeAsStringSync(template);
  debugPrint('✅ Generated: $fileName');
}

void generateCupertinoTemplate(String languageCode) {
  final className = 'CupertinoLocalizations${_capitalize(languageCode)}';
  final fileName = 'cupertino_localizations_$languageCode.dart';

  final template = '''
import 'package:flutter/cupertino.dart';

class $className extends DefaultCupertinoLocalizations {
  const $className();

// ${_getLanguageName(languageCode)}

  // Getters
  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => 'TODO: Translate todayLabel';

  @override
  String get alertDialogLabel => 'TODO: Translate alertDialogLabel';

  @override
  String get cutButtonLabel => 'TODO: Translate cutButtonLabel';

  @override
  String get copyButtonLabel => 'TODO: Translate copyButtonLabel';

  @override
  String get pasteButtonLabel => 'TODO: Translate pasteButtonLabel';

  @override
  String get clearButtonLabel => 'TODO: Translate clearButtonLabel';

  @override
  String get noSpellCheckReplacementsLabel => 'TODO: Translate noSpellCheckReplacementsLabel';

  @override
  String get selectAllButtonLabel => 'TODO: Translate selectAllButtonLabel';

  @override
  String get lookUpButtonLabel => 'TODO: Translate lookUpButtonLabel';

  @override
  String get searchWebButtonLabel => 'TODO: Translate searchWebButtonLabel';

  @override
  String get shareButtonLabel => 'TODO: Translate shareButtonLabel';

  @override
  String get searchTextFieldPlaceholderLabel => 'TODO: Translate searchTextFieldPlaceholderLabel';

  @override
  String get modalBarrierDismissLabel => 'TODO: Translate modalBarrierDismissLabel';

  @override
  String get menuDismissLabel => 'TODO: Translate menuDismissLabel';

  @override
  String get cancelButtonLabel => 'TODO: Translate cancelButtonLabel';

  @override
  String get backButtonLabel => 'TODO: Translate backButtonLabel';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  // Methods with Parameters
  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => 'TODO: Translate month \$monthIndex';

  @override
  String datePickerStandaloneMonth(int monthIndex) => 'TODO: Translate standalone month \$monthIndex';

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return 'TODO: Translate weekday \$weekDay day \$dayIndex';
    }
    return dayIndex.toString();
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return 'TODO: Format medium date for \${date.day}/\${date.month}/\${date.year}';
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String? datePickerHourSemanticsLabel(int hour) => 'TODO: Translate \$hour o\\'clock';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String? datePickerMinuteSemanticsLabel(int minute) {
    return minute == 1 
        ? 'TODO: Translate 1 minute' 
        : 'TODO: Translate \$minute minutes';
  }

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    return 'TODO: Translate tab \$tabIndex of \$tabCount';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String? timerPickerHourLabel(int hour) => hour == 1 ? 'TODO: Translate hour' : 'TODO: Translate hours';

  @override
  List<String> get timerPickerHourLabels => const ['TODO: Translate hour', 'TODO: Translate hours'];

  @override
  String? timerPickerMinuteLabel(int minute) => 'TODO: Translate min.';

  @override
  List<String> get timerPickerMinuteLabels => const ['TODO: Translate min.'];

  @override
  String? timerPickerSecondLabel(int second) => 'TODO: Translate sec.';

  @override
  List<String> get timerPickerSecondLabels => const ['TODO: Translate sec.'];

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _${className}Delegate();
}

class _${className}Delegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _${className}Delegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == '$languageCode';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return const $className();
  }

  @override
  bool shouldReload(_${className}Delegate old) => false;
}
''';

  File('lib/l10n/$fileName').writeAsStringSync(template);
  debugPrint('✅ Generated: $fileName');
}

String _capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String _getLanguageName(String code) {
  final languages = {
    'af': 'Afrikaans',
    'am': 'Amharic',
    'az': 'Azerbaijani',
    'be': 'Belarusian',
    'bn': 'Bengali',
    'bs': 'Bosnian',
    'ca': 'Catalan',
    'ceb': 'Cebuano',
    'co': 'Corsican',
    'cy': 'Welsh',
    'eo': 'Esperanto',
    'et': 'Estonian',
    'eu': 'Basque',
    'fy': 'Frisian',
    'ga': 'Irish',
    'gd': 'Scots Gaelic',
    'gl': 'Galician',
    'gu': 'Gujarati',
    'ha': 'Hausa',
    'haw': 'Hawaiian',
    'hmn': 'Hmong',
    'ht': 'Haitian Creole',
    'hy': 'Armenian',
    'ig': 'Igbo',
    'is': 'Icelandic',
    'jv': 'Javanese',
    'ka': 'Georgian',
    'kk': 'Kazakh',
    'km': 'Khmer',
    'kn': 'Kannada',
    'ku': 'Kurdish',
    'ky': 'Kyrgyz',
    'lb': 'Luxembourgish',
    'lo': 'Lao',
    'mg': 'Malagasy',
    'mi': 'Maori',
    'mk': 'Macedonian',
    'mn': 'Mongolian',
    'mr': 'Marathi',
    'ms': 'Malay',
    'mt': 'Maltese',
    'my': 'Myanmar (Burmese)',
    'ne': 'Nepali',
    'ny': 'Nyanja (Chichewa)',
    'or': 'Odia (Oriya)',
    'ps': 'Pashto',
    'rw': 'Kinyarwanda',
    'sd': 'Sindhi',
    'si': 'Sinhala',
    'sk': 'Slovak',
    'sl': 'Slovenian',
    'sm': 'Samoan',
    'sn': 'Shona',
    'so': 'Somali',
    'sq': 'Albanian',
    'sr': 'Serbian',
    'st': 'Sesotho',
    'su': 'Sundanese',
    'sw': 'Swahili',
    'ta': 'Tamil',
    'te': 'Telugu',
    'tg': 'Tajik',
    'tk': 'Turkmen',
    'tl': 'Tagalog (Filipino)',
    'tt': 'Tatar',
    'ug': 'Uyghur',
    'uz': 'Uzbek',
    'xh': 'Xhosa',
    'yi': 'Yiddish',
    'yo': 'Yoruba',
    'zu': 'Zulu',
  };
  return languages[code] ?? code.toUpperCase();
}
