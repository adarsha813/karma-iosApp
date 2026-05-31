import 'package:kundali/config/environment.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/profile_provider.dart';
import 'package:kundali/services/http_service.dart';

class ProfileService {
  // ✅ Remove _getToken method - HttpService handles tokens now
  // ✅ Remove timeout constant - HttpService has its own timeout

  static Future<Map<String, dynamic>> getProfile(
    String userId,
    BuildContext context,
  ) async {
    try {
      final response = await HttpService().get(
        '${Environment.baseUrl}/api/profile/get-profile?userId=$userId',
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return {'success': true, 'data': data};
      } else if (response.statusCode == 401) {
        // HttpService should handle refresh, but if we get here, refresh failed
        return {
          'success': false,
          'error': 'Authentication failed. Please try again.',
        };
      } else if (response.statusCode == 404) {
        return {'success': false, 'error': 'Profile not found'};
      } else {
        return {
          'success': false,
          'error': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'error': 'Network error: $e'};
    }
  }

  static Future<Map<String, dynamic>> saveProfile(
    Map<String, dynamic> profileData,
    BuildContext context,
  ) async {
    final localContext = context; // Capture context safely
    try {
      final response = await HttpService().post(
        '${Environment.baseUrl}/api/profile/save-profile',
        body: profileData,
        requiresAuth: false,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));

        if (responseData['token'] != null) {
          // Use post-frame callback to safely access context
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _storeNewToken(localContext, responseData['token']);
          });
        }

        return {'success': true, 'data': responseData};
      } else if (response.statusCode == 401) {
        return {'success': false, 'error': 'Authentication failed'};
      } else {
        return {
          'success': false,
          'error': 'Save failed: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'error': 'Network error: $e'};
    }
  }

  static Future<void> _storeNewToken(BuildContext context, String token) async {
    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      await profileProvider.saveToken(token);
      //AppLogger.info('✅ New token stored for user');
    } catch (e) {
      //AppLogger.info('Error storing new token: $e');
    }
  }

  static Future<Map<String, dynamic>> updateLanguage(
    String userId,
    String language,
    BuildContext context,
  ) async {
    try {
      final response = await HttpService().post(
        '${Environment.baseUrl}/api/profile/update-language',
        body: {'userId': userId, 'language': language},
        requiresAuth: true,
      );

      if (response.statusCode == 200) {
        return {'success': true};
      } else if (response.statusCode == 401) {
        return {'success': false, 'error': 'Authentication failed'};
      } else {
        return {'success': false, 'error': 'Language update failed'};
      }
    } catch (e) {
      return {'success': false, 'error': 'Network error: $e'};
    }
  }

  static Future<Map<String, dynamic>> getProfileHistory(
    String userId,
    BuildContext context,
  ) async {
    try {
      final response = await HttpService().get(
        '${Environment.baseUrl}/api/profile/profile-history?userId=$userId',
        requiresAuth: true,
      );

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
    } catch (e) {
      return {'success': false, 'error': 'Network error: $e'};
    }
  }

  // ✅ Optional: Add a method to check if user exists
  static Future<bool> userExists(String userId) async {
    try {
      final response = await HttpService().get(
        '${Environment.baseUrl}/api/profile/get-profile?userId=$userId',
        requiresAuth: true,
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // ✅ Fixed deleteProfilePicture method
  static Future<Map<String, dynamic>> deleteProfilePicture(
    String userId,
    BuildContext context,
  ) async {
    try {
      final response = await HttpService().delete(
        '${Environment.baseUrl}/api/profile/delete-picture',
        requiresAuth: true,
        additionalHeaders: {'Content-Type': 'application/json'},
        body: {'userId': userId}, // ✅ Pass as Map, not jsonEncode
      );

      if (response.statusCode == 200) {
        return {'success': true};
      } else {
        return {
          'success': false,
          'error': 'Failed to delete picture: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'success': false, 'error': 'Network error: $e'};
    }
  }
}
