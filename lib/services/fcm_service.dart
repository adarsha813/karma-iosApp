import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendFcmTokenToBackend(String? userId, String? token) async {
  if (userId == null || token == null) return;

  final url = Uri.parse(
    'https://chat-backend-rvk9.onrender.com/api/register-fcm-token',
  );

  try {
    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'token': token}), // ✅ match backend
    );

    if (res.statusCode == 200) {
      print('📡 FCM token successfully sent to backend.');
    } else {
      print('⚠️ Failed to send FCM token: ${res.statusCode} ${res.body}');
    }
  } catch (e) {
    print('❌ Error sending token to backend: $e');
  }
}
