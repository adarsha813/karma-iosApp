// scripts/generate_all_templates.dart
import 'dart:io';

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

  print(
    '🚀 Generating templates for ${unsupportedLanguages.length} languages...',
  );

  // Create l10n directory if it doesn't exist
  final l10nDir = Directory('lib/l10n');
  if (!l10nDir.existsSync()) {
    l10nDir.createSync(recursive: true);
  }

  for (final langCode in unsupportedLanguages) {
    generateMaterialTemplate(langCode);
    generateCupertinoTemplate(langCode);
  }

  print('✅ All templates generated!');
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

void generateMaterialTemplate(String languageCode) {
  final className = 'MaterialLocalizations${_capitalize(languageCode)}';
  final fileName = 'material_localizations_$languageCode.dart';

  final template = '''
import 'package:flutter/material.dart';

class $className extends DefaultMaterialLocalizations {
  $className();

  // TODO: Add translations for ${_getLanguageName(languageCode)}
  
  @override
  String get openAppDrawerTooltip => 'TODO: Translate open navigation menu';

  @override
  String get backButtonTooltip => 'TODO: Translate back';

  @override
  String get clearButtonTooltip => 'TODO: Translate clear text';

  @override
  String get closeButtonTooltip => 'TODO: Translate close';

  @override
  String get deleteButtonTooltip => 'TODO: Translate delete';

  @override
  String get moreButtonTooltip => 'TODO: Translate more';

  @override
  String get nextMonthTooltip => 'TODO: Translate next month';

  @override
  String get previousMonthTooltip => 'TODO: Translate previous month';

  @override
  String get firstPageTooltip => 'TODO: Translate first page';

  @override
  String get lastPageTooltip => 'TODO: Translate last page';

  @override
  String get nextPageTooltip => 'TODO: Translate next page';

  @override
  String get previousPageTooltip => 'TODO: Translate previous page';

  @override
  String get showMenuTooltip => 'TODO: Translate show menu';

  @override
  String get licensesPageTitle => 'TODO: Translate licenses';

  @override
  String get rowsPerPageTitle => 'TODO: Translate rows per page';

  @override
  String get cancelButtonLabel => 'TODO: Translate cancel';

  @override
  String get closeButtonLabel => 'TODO: Translate close';

  @override
  String get continueButtonLabel => 'TODO: Translate continue';

  @override
  String get copyButtonLabel => 'TODO: Translate copy';

  @override
  String get cutButtonLabel => 'TODO: Translate cut';

  @override
  String get scanTextButtonLabel => 'TODO: Translate scan text';

  @override
  String get okButtonLabel => 'TODO: Translate ok';

  @override
  String get pasteButtonLabel => 'TODO: Translate paste';

  @override
  String get selectAllButtonLabel => 'TODO: Translate select all';

  @override
  String get lookUpButtonLabel => 'TODO: Translate look up';

  @override
  String get searchWebButtonLabel => 'TODO: Translate search web';

  @override
  String get shareButtonLabel => 'TODO: Translate share';

  @override
  String get viewLicensesButtonLabel => 'TODO: Translate view licenses';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get timePickerHourModeAnnouncement => 'TODO: Translate select hours';

  @override
  String get timePickerMinuteModeAnnouncement => 'TODO: Translate select minutes';

  @override
  String get modalBarrierDismissLabel => 'TODO: Translate dismiss';

  @override
  String get menuDismissLabel => 'TODO: Translate dismiss menu';

  @override
  String get drawerLabel => 'TODO: Translate navigation menu';

  @override
  String get popupMenuLabel => 'TODO: Translate popup menu';

  @override
  String get menuBarMenuLabel => 'TODO: Translate menu bar menu';

  @override
  String get dialogLabel => 'TODO: Translate dialog';

  @override
  String get alertDialogLabel => 'TODO: Translate alert';

  @override
  String get searchFieldLabel => 'TODO: Translate search';

  @override
  String get currentDateLabel => 'TODO: Translate today';

  @override
  String get selectedDateLabel => 'TODO: Translate selected';

  @override
  String get scrimLabel => 'TODO: Translate scrim';

  @override
  String get bottomSheetLabel => 'TODO: Translate bottom sheet';

  @override
  String get dateSeparator => '/';

  @override
  String get dateHelpText => 'TODO: Translate mm/dd/yyyy';

  @override
  String get selectYearSemanticsLabel => 'TODO: Translate select year';

  @override
  String get unspecifiedDate => 'TODO: Translate date';

  @override
  String get unspecifiedDateRange => 'TODO: Translate date range';

  @override
  String get dateInputLabel => 'TODO: Translate enter date';

  @override
  String get dateRangeStartLabel => 'TODO: Translate start date';

  @override
  String get dateRangeEndLabel => 'TODO: Translate end date';

  @override
  String get invalidDateFormatLabel => 'TODO: Translate invalid format';

  @override
  String get invalidDateRangeLabel => 'TODO: Translate invalid range';

  @override
  String get dateOutOfRangeLabel => 'TODO: Translate out of range';

  @override
  String get saveButtonLabel => 'TODO: Translate save';

  @override
  String get datePickerHelpText => 'TODO: Translate select date';

  @override
  String get dateRangePickerHelpText => 'TODO: Translate select range';

  @override
  String get calendarModeButtonLabel => 'TODO: Translate switch to calendar';

  @override
  String get inputDateModeButtonLabel => 'TODO: Translate switch to input';

  @override
  String get timePickerDialHelpText => 'TODO: Translate select time';

  @override
  String get timePickerInputHelpText => 'TODO: Translate enter time';

  @override
  String get timePickerHourLabel => 'TODO: Translate hour';

  @override
  String get timePickerMinuteLabel => 'TODO: Translate minute';

  @override
  String get invalidTimeLabel => 'TODO: Translate enter a valid time';

  @override
  String get dialModeButtonLabel => 'TODO: Translate switch to dial picker mode';

  @override
  String get inputTimeModeButtonLabel => 'TODO: Translate switch to text input mode';

  @override
  String get signedInLabel => 'TODO: Translate signed in';

  @override
  String get hideAccountsLabel => 'TODO: Translate hide accounts';

  @override
  String get showAccountsLabel => 'TODO: Translate show accounts';

  @override
  String get expandedIconTapHint => 'TODO: Translate collapse';

  @override
  String get collapsedIconTapHint => 'TODO: Translate expand';

  @override
  String get expansionTileExpandedHint => 'TODO: Translate double tap to collapse';

  @override
  String get expansionTileCollapsedHint => 'TODO: Translate double tap to expand';

  @override
  String get expansionTileExpandedTapHint => 'TODO: Translate collapse';

  @override
  String get expansionTileCollapsedTapHint => 'TODO: Translate expand for more details';

  @override
  String get expandedHint => 'TODO: Translate collapsed';

  @override
  String get collapsedHint => 'TODO: Translate expanded';

  @override
  String get refreshIndicatorSemanticLabel => 'TODO: Translate refresh';

  @override
  String get keyboardKeyAlt => 'TODO: Translate alt';

  @override
  String get keyboardKeyAltGraph => 'TODO: Translate altgr';

  @override
  String get keyboardKeyBackspace => 'TODO: Translate backspace';

  @override
  String get keyboardKeyCapsLock => 'TODO: Translate caps lock';

  @override
  String get keyboardKeyChannelDown => 'TODO: Translate channel down';

  @override
  String get keyboardKeyChannelUp => 'TODO: Translate channel up';

  @override
  String get keyboardKeyControl => 'TODO: Translate ctrl';

  @override
  String get keyboardKeyDelete => 'TODO: Translate del';

  @override
  String get keyboardKeyEject => 'TODO: Translate eject';

  @override
  String get keyboardKeyEnd => 'TODO: Translate end';

  @override
  String get keyboardKeyEscape => 'TODO: Translate esc';

  @override
  String get keyboardKeyFn => 'TODO: Translate fn';

  @override
  String get keyboardKeyHome => 'TODO: Translate home';

  @override
  String get keyboardKeyInsert => 'TODO: Translate insert';

  @override
  String get keyboardKeyMeta => 'TODO: Translate meta';

  @override
  String get keyboardKeyMetaMacOs => 'TODO: Translate command';

  @override
  String get keyboardKeyMetaWindows => 'TODO: Translate win';

  @override
  String get keyboardKeyNumLock => 'TODO: Translate num lock';

  @override
  String get keyboardKeyNumpad1 => 'TODO: Translate num 1';

  @override
  String get keyboardKeyNumpad2 => 'TODO: Translate num 2';

  @override
  String get keyboardKeyNumpad3 => 'TODO: Translate num 3';

  @override
  String get keyboardKeyNumpad4 => 'TODO: Translate num 4';

  @override
  String get keyboardKeyNumpad5 => 'TODO: Translate num 5';

  @override
  String get keyboardKeyNumpad6 => 'TODO: Translate num 6';

  @override
  String get keyboardKeyNumpad7 => 'TODO: Translate num 7';

  @override
  String get keyboardKeyNumpad8 => 'TODO: Translate num 8';

  @override
  String get keyboardKeyNumpad9 => 'TODO: Translate num 9';

  @override
  String get keyboardKeyNumpad0 => 'TODO: Translate num 0';

  @override
  String get keyboardKeyNumpadAdd => 'TODO: Translate num +';

  @override
  String get keyboardKeyNumpadComma => 'TODO: Translate num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'TODO: Translate num .';

  @override
  String get keyboardKeyNumpadDivide => 'TODO: Translate num /';

  @override
  String get keyboardKeyNumpadEnter => 'TODO: Translate num enter';

  @override
  String get keyboardKeyNumpadEqual => 'TODO: Translate num =';

  @override
  String get keyboardKeyNumpadMultiply => 'TODO: Translate num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'TODO: Translate num (';

  @override
  String get keyboardKeyNumpadParenRight => 'TODO: Translate num )';

  @override
  String get keyboardKeyNumpadSubtract => 'TODO: Translate num -';

  @override
  String get keyboardKeyPageDown => 'TODO: Translate pgdown';

  @override
  String get keyboardKeyPageUp => 'TODO: Translate pgup';

  @override
  String get keyboardKeyPower => 'TODO: Translate power';

  @override
  String get keyboardKeyPowerOff => 'TODO: Translate power off';

  @override
  String get keyboardKeyPrintScreen => 'TODO: Translate print screen';

  @override
  String get keyboardKeyScrollLock => 'TODO: Translate scroll lock';

  @override
  String get keyboardKeySelect => 'TODO: Translate select';

  @override
  String get keyboardKeyShift => 'TODO: Translate shift';

  @override
  String get keyboardKeySpace => 'TODO: Translate space';

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
    // TODO: Implement parsing for your locale
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
  print('✅ Generated: $fileName');
}

void generateCupertinoTemplate(String languageCode) {
  final className = 'CupertinoLocalizations${_capitalize(languageCode)}';
  final fileName = 'cupertino_localizations_$languageCode.dart';

  final template = '''
import 'package:flutter/cupertino.dart';

class $className extends DefaultCupertinoLocalizations {
  const $className();

  // TODO: Add translations for ${_getLanguageName(languageCode)}

  // Getters
  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => 'TODO: Translate today';

  @override
  String get alertDialogLabel => 'TODO: Translate alert';

  @override
  String get cutButtonLabel => 'TODO: Translate cut';

  @override
  String get copyButtonLabel => 'TODO: Translate copy';

  @override
  String get pasteButtonLabel => 'TODO: Translate paste';

  @override
  String get clearButtonLabel => 'TODO: Translate clear';

  @override
  String get noSpellCheckReplacementsLabel => 'TODO: Translate no replacements found';

  @override
  String get selectAllButtonLabel => 'TODO: Translate select all';

  @override
  String get lookUpButtonLabel => 'TODO: Translate look up';

  @override
  String get searchWebButtonLabel => 'TODO: Translate search web';

  @override
  String get shareButtonLabel => 'TODO: Translate share';

  @override
  String get searchTextFieldPlaceholderLabel => 'TODO: Translate search';

  @override
  String get modalBarrierDismissLabel => 'TODO: Translate dismiss';

  @override
  String get menuDismissLabel => 'TODO: Translate dismiss menu';

  @override
  String get cancelButtonLabel => 'TODO: Translate cancel';

  @override
  String get backButtonLabel => 'TODO: Translate back';

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
  String datePickerHourSemanticsLabel(int hour) => '\$hour TODO: Translate o\\'clock';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
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
  String timerPickerHourLabel(int hour) => hour == 1 ? 'TODO: Translate hour' : 'TODO: Translate hours';

  @override
  List<String> get timerPickerHourLabels => const ['TODO: Translate hour', 'TODO: Translate hours'];

  @override
  String timerPickerMinuteLabel(int minute) => 'TODO: Translate min.';

  @override
  List<String> get timerPickerMinuteLabels => const ['TODO: Translate min.'];

  @override
  String timerPickerSecondLabel(int second) => 'TODO: Translate sec.';

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
  print('✅ Generated: $fileName');
}
