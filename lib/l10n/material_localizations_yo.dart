import 'package:flutter/material.dart';

class MaterialLocalizationsYo extends DefaultMaterialLocalizations {
  MaterialLocalizationsYo();

  @override
  String get alertDialogLabel => 'Ikilo';

  @override
  String get backButtonTooltip => 'Pada';

  @override
  String get cancelButtonLabel => 'Fagilee';

  @override
  String get closeButtonLabel => 'Pa';

  @override
  String get closeButtonTooltip => 'Pa';

  @override
  String get continueButtonLabel => 'Tẹsiwaju';

  @override
  String get copyButtonLabel => 'Daakọ';

  @override
  String get cutButtonLabel => 'Ge';

  @override
  String get deleteButtonTooltip => 'Paarẹ';

  @override
  String get dialogLabel => 'Iwiregbe';

  @override
  String get drawerLabel => 'Awọn akojọ isẹ';

  @override
  String get hideAccountsLabel => 'Fi awọn akọọlẹ pamọ';

  @override
  String get licensesPageTitle => 'Awọn iwe-aṣẹ';

  @override
  String get modalBarrierDismissLabel => 'Kọ';

  @override
  String get nextPageTooltip => 'Ojú ewé tókàn';

  @override
  String get okButtonLabel => 'O dara';

  @override
  String get openAppDrawerTooltip => 'Ṣii awọn akojọ isẹ';

  @override
  String get pasteButtonLabel => 'Tẹ';

  @override
  String get popupMenuLabel => 'Akojọ aṣayan ita';

  @override
  String get previousPageTooltip => 'Ojú ewé tẹlẹ';

  @override
  String get refreshIndicatorSemanticLabel => 'Tun';

  @override
  String get reorderItemDown => 'Gbe silẹ';

  @override
  String get reorderItemLeft => 'Gbe si osi';

  @override
  String get reorderItemRight => 'Gbe si otun';

  @override
  String get reorderItemToEnd => 'Gbe si opin';

  @override
  String get reorderItemToStart => 'Gbe si ibẹrẹ';

  @override
  String get reorderItemUp => 'Gbe soke';

  @override
  String get rowsPerPageTitle => 'Awọn ila fun iwe:';

  @override
  String get saveButtonLabel => 'Fipamọ';

  @override
  String get scanTextButtonLabel => 'Ṣayẹwo ọrọ';

  @override
  String get scrimLabel => 'Iboju';

  @override
  String get searchFieldLabel => 'Wa';

  @override
  String get selectAllButtonLabel => 'Yan gbogbo';

  @override
  String get showAccountsLabel => 'Ṣe afihan awọn akọọlẹ';

  @override
  String get showMenuTooltip => 'Ṣe afihan akojọ aṣayan';

  @override
  String get signedInLabel => 'Wo ile';

  @override
  String get timePickerHourModeAnnouncement => 'Yan wakati';

  @override
  String get timePickerMinuteModeAnnouncement => 'Yan iseju';

  @override
  String get viewLicensesButtonLabel => 'Wo Awọn iwe-aṣẹ';

  @override
  String get bottomSheetLabel => 'Iwe isalẹ';

  @override
  String get currentDateLabel => 'Loni';

  @override
  String get menuBarMenuLabel => 'Akojọ aṣayan Menu';

  @override
  String get searchWebButtonLabel => 'Wa lori ayelujara';

  @override
  String get shareButtonLabel => 'Pin';

  // Remove @override from these since they are methods in parent class

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _MaterialLocalizationsYoDelegate();
}

class _MaterialLocalizationsYoDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _MaterialLocalizationsYoDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'yo';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return MaterialLocalizationsYo();
  }

  @override
  bool shouldReload(_MaterialLocalizationsYoDelegate old) => false;
}
