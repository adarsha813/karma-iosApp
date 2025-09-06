import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String serviceId = "service_2vhpf9d";
  static const String templateId = "template_ipikvr9";
  static const String publicKey = "YlsX0perbEKZWwWhP";

  static Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    final response = await http.post(
      url,
      headers: {
        "origin": "http://localhost",
        "Content-Type": "application/json",
      },
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": publicKey,
        "template_params": {
          "user_name": name,
          "user_email": email,
          "user_message": message,
        },
      }),
    );

    return response.statusCode == 200;
  }
}
