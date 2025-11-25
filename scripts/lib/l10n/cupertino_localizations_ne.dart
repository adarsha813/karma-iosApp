import 'package:flutter/cupertino.dart';

class CupertinoLocalizationsNe extends DefaultCupertinoLocalizations {
  const CupertinoLocalizationsNe();

  // Nepali

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
  String get noSpellCheckReplacementsLabel =>
      'TODO: Translate no replacements found';

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
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  // Methods with Parameters
  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => 'TODO: Translate month $monthIndex';

  @override
  String datePickerStandaloneMonth(int monthIndex) =>
      'TODO: Translate standalone month $monthIndex';

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return 'TODO: Translate weekday $weekDay day $dayIndex';
    }
    return dayIndex.toString();
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return 'TODO: Format medium date for ${date.day}/${date.month}/${date.year}';
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) =>
      '$hour TODO: Translate o\'clock';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return minute == 1
        ? 'TODO: Translate 1 minute'
        : 'TODO: Translate $minute minutes';
  }

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    return 'TODO: Translate tab $tabIndex of $tabCount';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) =>
      hour == 1 ? 'TODO: Translate hour' : 'TODO: Translate hours';

  @override
  List<String> get timerPickerHourLabels => const [
    'TODO: Translate hour',
    'TODO: Translate hours',
  ];

  @override
  String timerPickerMinuteLabel(int minute) => 'TODO: Translate min.';

  @override
  List<String> get timerPickerMinuteLabels => const ['TODO: Translate min.'];

  @override
  String timerPickerSecondLabel(int second) => 'TODO: Translate sec.';

  @override
  List<String> get timerPickerSecondLabels => const ['TODO: Translate sec.'];

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsNeDelegate();
}

class _CupertinoLocalizationsNeDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsNeDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ne';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return const CupertinoLocalizationsNe();
  }

  @override
  bool shouldReload(_CupertinoLocalizationsNeDelegate old) => false;
}
