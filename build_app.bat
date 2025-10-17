@echo off
echo 🚀 Building Flutter APK...
flutter clean
flutter pub get
flutter build apk
echo ✅ APK built successfully!
echo 📱 Output: build/app/outputs/flutter-apk/app-release.apk
pause