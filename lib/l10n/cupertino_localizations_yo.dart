import 'package:flutter/cupertino.dart';

class CupertinoLocalizationsYo extends DefaultCupertinoLocalizations {
  const CupertinoLocalizationsYo();

  @override
  String get alertDialogLabel => 'Ikilo';

  @override
  String get anteMeridiemAbbreviation => 'A.M.';

  @override
  String get copyButtonLabel => 'Daakọ';

  @override
  String get cutButtonLabel => 'Ge';

  @override
  String get pasteButtonLabel => 'Tẹ';

  @override
  String get selectAllButtonLabel => 'Yan gbogbo';

  @override
  String get postMeridiemAbbreviation => 'P.M.';

  @override
  String get todayLabel => 'Loni';

  @override
  String get searchTextFieldPlaceholderLabel => 'Wa';

  @override
  String timerPickerHourLabel(int hour) => 'wakati';

  @override
  String timerPickerMinuteLabel(int minute) => 'iseju';

  @override
  String timerPickerSecondLabel(int second) => 'isekendi';

  @override
  String get modalBarrierDismissLabel => 'Kọ';

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsYoDelegate();
}

class _CupertinoLocalizationsYoDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsYoDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'yo';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return const CupertinoLocalizationsYo();
  }

  @override
  bool shouldReload(_CupertinoLocalizationsYoDelegate old) => false;
}
