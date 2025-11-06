// extract_localization_methods.dart
import 'dart:io';

void main() {
  print('🚀 Extracting MaterialLocalizations methods...');
  extractMaterialMethods();

  print('\n🚀 Extracting CupertinoLocalizations methods...');
  extractCupertinoMethods();
}

void extractMaterialMethods() {
  final materialMethods = '''
// MaterialLocalizations Methods to Implement
// Generated from: flutter/packages/flutter/lib/src/material/localizations.dart

// Required Getters
String get openAppDrawerTooltip;
String get backButtonTooltip;
String get clearButtonTooltip;
String get closeButtonTooltip;
String get deleteButtonTooltip;
String get moreButtonTooltip;
String get nextMonthTooltip;
String get previousMonthTooltip;
String get firstPageTooltip;
String get lastPageTooltip;
String get nextPageTooltip;
String get previousPageTooltip;
String get showMenuTooltip;
String get licensesPageTitle;
String get rowsPerPageTitle;
String get cancelButtonLabel;
String get closeButtonLabel;
String get continueButtonLabel;
String get copyButtonLabel;
String get cutButtonLabel;
String get scanTextButtonLabel;
String get okButtonLabel;
String get pasteButtonLabel;
String get selectAllButtonLabel;
String get lookUpButtonLabel;
String get searchWebButtonLabel;
String get shareButtonLabel;
String get viewLicensesButtonLabel;
String get anteMeridiemAbbreviation;
String get postMeridiemAbbreviation;
String get timePickerHourModeAnnouncement;
String get timePickerMinuteModeAnnouncement;
String get modalBarrierDismissLabel;
String get menuDismissLabel;
String get drawerLabel;
String get popupMenuLabel;
String get menuBarMenuLabel;
String get dialogLabel;
String get alertDialogLabel;
String get searchFieldLabel;
String get currentDateLabel;
String get selectedDateLabel;
String get scrimLabel;
String get bottomSheetLabel;
String get dateSeparator;
String get dateHelpText;
String get selectYearSemanticsLabel;
String get unspecifiedDate;
String get unspecifiedDateRange;
String get dateInputLabel;
String get dateRangeStartLabel;
String get dateRangeEndLabel;
String get invalidDateFormatLabel;
String get invalidDateRangeLabel;
String get dateOutOfRangeLabel;
String get saveButtonLabel;
String get datePickerHelpText;
String get dateRangePickerHelpText;
String get calendarModeButtonLabel;
String get inputDateModeButtonLabel;
String get timePickerDialHelpText;
String get timePickerInputHelpText;
String get timePickerHourLabel;
String get timePickerMinuteLabel;
String get invalidTimeLabel;
String get dialModeButtonLabel;
String get inputTimeModeButtonLabel;
String get signedInLabel;
String get hideAccountsLabel;
String get showAccountsLabel;
String get expandedIconTapHint;
String get collapsedIconTapHint;
String get expansionTileExpandedHint;
String get expansionTileCollapsedHint;
String get expansionTileExpandedTapHint;
String get expansionTileCollapsedTapHint;
String get expandedHint;
String get collapsedHint;
String get refreshIndicatorSemanticLabel;
String get keyboardKeyAlt;
String get keyboardKeyAltGraph;
String get keyboardKeyBackspace;
String get keyboardKeyCapsLock;
String get keyboardKeyChannelDown;
String get keyboardKeyChannelUp;
String get keyboardKeyControl;
String get keyboardKeyDelete;
String get keyboardKeyEject;
String get keyboardKeyEnd;
String get keyboardKeyEscape;
String get keyboardKeyFn;
String get keyboardKeyHome;
String get keyboardKeyInsert;
String get keyboardKeyMeta;
String get keyboardKeyMetaMacOs;
String get keyboardKeyMetaWindows;
String get keyboardKeyNumLock;
String get keyboardKeyNumpad1;
String get keyboardKeyNumpad2;
String get keyboardKeyNumpad3;
String get keyboardKeyNumpad4;
String get keyboardKeyNumpad5;
String get keyboardKeyNumpad6;
String get keyboardKeyNumpad7;
String get keyboardKeyNumpad8;
String get keyboardKeyNumpad9;
String get keyboardKeyNumpad0;
String get keyboardKeyNumpadAdd;
String get keyboardKeyNumpadComma;
String get keyboardKeyNumpadDecimal;
String get keyboardKeyNumpadDivide;
String get keyboardKeyNumpadEnter;
String get keyboardKeyNumpadEqual;
String get keyboardKeyNumpadMultiply;
String get keyboardKeyNumpadParenLeft;
String get keyboardKeyNumpadParenRight;
String get keyboardKeyNumpadSubtract;
String get keyboardKeyPageDown;
String get keyboardKeyPageUp;
String get keyboardKeyPower;
String get keyboardKeyPowerOff;
String get keyboardKeyPrintScreen;
String get keyboardKeyScrollLock;
String get keyboardKeySelect;
String get keyboardKeyShift;
String get keyboardKeySpace;

// Required Methods with Parameters
String aboutListTileTitle(String applicationName);
String licensesPackageDetailText(int licenseCount);
String pageRowsInfoTitle(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate);
String tabLabel({required int tabIndex, required int tabCount});
String selectedRowCountTitle(int selectedRowCount);
String scrimOnTapHint(String modalRouteContentName);
String formatDecimal(int number);
String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false});
String formatMinute(TimeOfDay timeOfDay);
String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false});
String formatYear(DateTime date);
String formatCompactDate(DateTime date);
String formatShortDate(DateTime date);
String formatMediumDate(DateTime date);
String formatFullDate(DateTime date);
String formatMonthYear(DateTime date);
String formatShortMonthDay(DateTime date);
DateTime? parseCompactDate(String? inputString);
String dateRangeStartDateSemanticLabel(String formattedDate);
String dateRangeEndDateSemanticLabel(String formattedDate);
String remainingTextFieldCharacterCount(int remaining);

// Required Properties
ScriptCategory get scriptCategory;
TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false});
List<String> get narrowWeekdays;
int get firstDayOfWeekIndex;
''';

  File('material_methods.txt').writeAsStringSync(materialMethods);
  print('✅ Material methods saved to material_methods.txt');
}

void extractCupertinoMethods() {
  final cupertinoMethods = '''
// CupertinoLocalizations Methods to Implement
// Generated from: flutter/packages/flutter/lib/src/cupertino/localizations.dart

// Required Getters
String get anteMeridiemAbbreviation;
String get postMeridiemAbbreviation;
String get todayLabel;
String get alertDialogLabel;
String get cutButtonLabel;
String get copyButtonLabel;
String get pasteButtonLabel;
String get clearButtonLabel;
String get noSpellCheckReplacementsLabel;
String get selectAllButtonLabel;
String get lookUpButtonLabel;
String get searchWebButtonLabel;
String get shareButtonLabel;
String get searchTextFieldPlaceholderLabel;
String get modalBarrierDismissLabel;
String get menuDismissLabel;
String get cancelButtonLabel;
String get backButtonLabel;
DatePickerDateOrder get datePickerDateOrder;
DatePickerDateTimeOrder get datePickerDateTimeOrder;

// Required Methods with Parameters
String datePickerYear(int yearIndex);
String datePickerMonth(int monthIndex);
String datePickerStandaloneMonth(int monthIndex);
String datePickerDayOfMonth(int dayIndex, [int? weekDay]);
String datePickerMediumDate(DateTime date);
String datePickerHour(int hour);
String? datePickerHourSemanticsLabel(int hour);
String datePickerMinute(int minute);
String? datePickerMinuteSemanticsLabel(int minute);
String tabSemanticsLabel({required int tabIndex, required int tabCount});
String timerPickerHour(int hour);
String timerPickerMinute(int minute);
String timerPickerSecond(int second);
String? timerPickerHourLabel(int hour);
List<String> get timerPickerHourLabels;
String? timerPickerMinuteLabel(int minute);
List<String> get timerPickerMinuteLabels;
String? timerPickerSecondLabel(int second);
List<String> get timerPickerSecondLabels;
''';

  File('cupertino_methods.txt').writeAsStringSync(cupertinoMethods);
  print('✅ Cupertino methods saved to cupertino_methods.txt');
}
