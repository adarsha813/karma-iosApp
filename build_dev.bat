@echo off
echo 🚀 Building DEVELOPMENT APK...
flutter clean
flutter pub get
flutter build apk --dart-define=IS_PRODUCTION=false --dart-define=BASE_URL=https://chat-backend-rvk9.onrender.com --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_51RlNTwGaHP8m8qhhqIJz0i2rNalP9dbOt3GnAErdPSuSCZOErnr0NCVwbhCDFiJinKEF7JuEzq6hDzDHCylGa86100vhGegsKG
echo ✅ Development APK built successfully!
echo 📱 Output: build/app/outputs/flutter-apk/app-release.apk
pause