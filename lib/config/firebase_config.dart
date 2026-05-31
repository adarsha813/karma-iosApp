import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseConfig {
  static Future<FirebaseOptions> getOptions() async {
    // Ensure .env is loaded (call dotenv.load() in main.dart)
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _getAndroidOptions();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _getIOSOptions();
    }
    throw UnsupportedError('Unsupported platform: $defaultTargetPlatform');
  }

  static FirebaseOptions _getAndroidOptions() {
    // Required fields - throw clear errors if missing
    final apiKey = dotenv.env['FIREBASE_API_KEY'];
    final appId = dotenv.env['FIREBASE_APP_ID'];
    final senderId = dotenv.env['FIREBASE_SENDER_ID'];
    final projectId = dotenv.env['FIREBASE_PROJECT_ID'];
    final storageBucket = dotenv.env['FIREBASE_STORAGE_BUCKET'];

    if (apiKey == null ||
        appId == null ||
        senderId == null ||
        projectId == null ||
        storageBucket == null) {
      throw StateError(
        'Missing Firebase configuration in .env file. '
        'Please ensure FIREBASE_API_KEY, FIREBASE_APP_ID, FIREBASE_SENDER_ID, '
        'FIREBASE_PROJECT_ID, and FIREBASE_STORAGE_BUCKET are set.',
      );
    }

    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: senderId,
      projectId: projectId,
      storageBucket: storageBucket,
    );
  }

  static FirebaseOptions _getIOSOptions() {
    // iOS requires bundle ID as well
    final apiKey =
        dotenv.env['FIREBASE_IOS_API_KEY'] ?? dotenv.env['FIREBASE_API_KEY'];
    final appId =
        dotenv.env['FIREBASE_IOS_APP_ID'] ?? dotenv.env['FIREBASE_APP_ID'];
    final senderId = dotenv.env['FIREBASE_SENDER_ID'];
    final projectId = dotenv.env['FIREBASE_PROJECT_ID'];
    final storageBucket = dotenv.env['FIREBASE_STORAGE_BUCKET'];
    final iosBundleId = dotenv.env['IOS_BUNDLE_ID'];

    if (apiKey == null ||
        appId == null ||
        senderId == null ||
        projectId == null ||
        storageBucket == null) {
      throw StateError('Missing Firebase configuration for iOS in .env file');
    }

    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: senderId,
      projectId: projectId,
      storageBucket: storageBucket,
      iosBundleId: iosBundleId, // Optional but recommended
    );
  }
}
