import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<FirebaseOptions> getOptions() async {
    // Android Firebase Configuration
    return const FirebaseOptions(
      apiKey: 'AIzaSyATxafTzrNNI8dpzyBnOmqXx_7ZJpOs4h8',
      appId: '1:626975806754:android:0a97d6fbb7d174b5bd417b',
      messagingSenderId: '626975806754',
      projectId: 'projectm20250220',
      storageBucket: 'projectm20250220.firebasestorage.app',
    );
  }
}
