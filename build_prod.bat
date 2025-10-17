@echo off
echo 🚀 Building PRODUCTION App Bundle...
flutter clean
flutter pub get
flutter build appbundle --dart-define=IS_PRODUCTION=true --dart-define=BASE_URL=https://your-production-domain.com --dart-define=STRIPE_PUBLISHABLE_KEY=pk_live_your_actual_live_key_here
echo ✅ Production App Bundle built successfully!
echo 📱 Output: build/app/outputs/bundle/release/app-release.aab
pause