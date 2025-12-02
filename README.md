git reset --hard HEAD


flutter run

flutter gen-l10n
cd scripts
dart translate_localizations.dart bn AIzaSyAUuH6x-9851lyy5bLH7QPRfsYj58dHUm8
cd scripts  
dart translate_all_languages.dart AIzaSyAUuH6x-9851lyy5bLH7QPRfsYj58dHUm8

cd scripts
dart generate_all_templates.dart

cd scripts
dart fix_broken_translations.dart


dart run rename_app:main all="Karma - Life Path"


flutter pub get
flutter pub run flutter_launcher_icons

