import 'package:kundali/config/environment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart'; // or widgets.dart if you don’t need Material components
import '../providers/profile_provider.dart';

class ProfileService {
  static const Duration timeout = Duration(seconds: 30);

  // Helper method to get token from provider
  static String? _getToken(BuildContext context) {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      return profileProvider.token;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getProfile(
    String userId,
    BuildContext context,
  ) async {
    final token = _getToken(context);
    if (token == null) {
      return {'success': false, 'error': 'Set your profile'};
    }

    final uri = Uri.parse(
      '${Environment.baseUrl}/api/profile/get-profile',
    ).replace(queryParameters: {'userId': userId});

    final response = await http
        .get(
          uri,
          headers: {
            'Authorization': 'Bearer $token',
            ...Environment.securityHeaders,
          },
        )
        .timeout(timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return {'success': true, 'data': data};
    } else if (response.statusCode == 401) {
      return {'success': false, 'error': 'Authentication failed'};
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
    BuildContext context,
  ) async {
    final token = _getToken(context);

    final headers = {
      'Content-Type': 'application/json',
      'X-Request-ID': _generateRequestId(),
      ...Environment.securityHeaders,
    };

    // ✅ Only add Authorization header if token exists
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final uri = Uri.parse('${Environment.baseUrl}/api/profile/save-profile');
    final response = await http
        .post(uri, headers: headers, body: jsonEncode(profileData))
        .timeout(timeout);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      // ✅ Store the token if it's returned (for new users)
      if (responseData['token'] != null) {
        await _storeNewToken(context, responseData['token']);
      }

      return {'success': true, 'data': responseData};
    } else if (response.statusCode == 401) {
      return {'success': false, 'error': 'Authentication failed'};
    } else {
      return {'success': false, 'error': 'Save failed: ${response.statusCode}'};
    }
  }

  static Future<void> _storeNewToken(BuildContext context, String token) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      await profileProvider.saveToken(
        token,
      ); // Use saveToken instead of updateToken
      debugPrint('✅ New token stored for user');
    } catch (e) {
      debugPrint('Error storing new token: $e');
    }
  }

  static Future<Map<String, dynamic>> updateLanguage(
    String userId,
    String language,
    BuildContext context,
  ) async {
    final token = _getToken(context);
    if (token == null) {
      return {'success': false, 'error': 'Authentication not available'};
    }

    final uri = Uri.parse('${Environment.baseUrl}/api/profile/update-language');

    final response = await http
        .post(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
            ...Environment.securityHeaders,
          },
          body: jsonEncode({'userId': userId, 'language': language}),
        )
        .timeout(timeout);

    if (response.statusCode == 200) {
      return {'success': true};
    } else if (response.statusCode == 401) {
      return {'success': false, 'error': 'Authentication failed'};
    } else {
      return {'success': false, 'error': 'Language update failed'};
    }
  }

  static Future<Map<String, dynamic>> getProfileHistory(
    String userId,
    BuildContext context,
  ) async {
    final token = _getToken(context);
    if (token == null) {
      return {'success': false, 'error': 'Authentication not available'};
    }

    final uri = Uri.parse(
      '${Environment.baseUrl}/api/profile/profile-history',
    ).replace(queryParameters: {'userId': userId});

    final response = await http
        .get(
          uri,
          headers: {
            'Authorization': 'Bearer $token',
            ...Environment.securityHeaders,
          },
        )
        .timeout(timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return {'success': true, 'data': data};
    } else if (response.statusCode == 401) {
      return {'success': false, 'error': 'Authentication failed'};
    } else {
      return {
        'success': false,
        'error': 'Failed to load history: ${response.statusCode}',
      };
    }
  }

  static String _generateRequestId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${Uuid().v4().substring(0, 8)}';
  }
}
