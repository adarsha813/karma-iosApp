import 'package:kundali/config/environment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ProfileService {
  static const Duration timeout = Duration(seconds: 30);

  static Future<Map<String, dynamic>> getProfile(String userId) async {
    final uri = Uri.parse(
      '${Environment.baseUrl}/api/profile/get-profile',
    ).replace(queryParameters: {'userId': userId});

    final response = await http.get(uri).timeout(timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {'success': true, 'data': data};
    } else if (response.statusCode == 404) {
      return {'success': false, 'error': 'Profile not found'};
    } else {
      return {
        'success': false,
        'error': 'Server error: ${response.statusCode}',
      };
    }
  }

  static Future<Map<String, dynamic>> saveProfile(
    Map<String, dynamic> profileData,
  ) async {
    final uri = Uri.parse('${Environment.baseUrl}/api/profile/save-profile');

    final response = await http
        .post(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'X-Request-ID': _generateRequestId(),
          },
          body: jsonEncode(profileData),
        )
        .timeout(timeout);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return {'success': true, 'data': responseData};
    } else {
      return {'success': false, 'error': 'Save failed: ${response.statusCode}'};
    }
  }

  static Future<Map<String, dynamic>> updateLanguage(
    String userId,
    String language,
  ) async {
    final uri = Uri.parse('${Environment.baseUrl}/api/profile/update-language');

    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'userId': userId, 'language': language}),
        )
        .timeout(timeout);

    if (response.statusCode == 200) {
      return {'success': true};
    } else {
      return {'success': false, 'error': 'Language update failed'};
    }
  }

  static String _generateRequestId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${Uuid().v4().substring(0, 8)}';
  }
}
