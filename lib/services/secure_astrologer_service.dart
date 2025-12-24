import 'dart:convert';
import 'dart:async';
import 'dart:io'; // ✅ ADDED IMPORT
import 'package:http/http.dart' as http;
import '../config/environment.dart';
import './secure_http_client.dart';
import 'package:flutter/foundation.dart';

class AstrologerDetail {
  final String id;
  final String employeeId; // ✅ ADDED employeeId FIELD
  final String fullName;
  final String? image;
  final String? education;
  final String? qualification;
  final String? experience;
  final String? bio;
  final double? rating;
  final int? reviewCount;
  final List<String> specialties;
  final Map<String, dynamic>? metadata;

  AstrologerDetail({
    required this.id,
    required this.employeeId, // ✅ ADDED
    required this.fullName,
    this.image,
    this.education,
    this.qualification,
    this.experience,
    this.bio,
    this.rating,
    this.reviewCount,
    this.specialties = const [],
    this.metadata,
  });

  factory AstrologerDetail.fromJson(Map<String, dynamic> json) {
    return AstrologerDetail(
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      employeeId: json['employeeId']?.toString() ?? '', // ✅ ADDED
      fullName: json['fullName']?.toString() ?? 'Astrologer',
      image: json['image']?.toString(),
      education: json['education']?.toString(),
      qualification: json['qualification']?.toString(),
      experience: json['experience']?.toString(),
      bio: json['bio']?.toString(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      specialties: List<String>.from(json['specialties'] ?? []),
      metadata: json['metadata'] is Map
          ? Map<String, dynamic>.from(json['metadata'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'employeeId': employeeId, // ✅ ADDED
        'fullName': fullName,
        'image': image,
        'education': education,
        'qualification': qualification,
        'experience': experience,
        'bio': bio,
        'rating': rating,
        'reviewCount': reviewCount,
        'specialties': specialties,
        'metadata': metadata,
      };
}

class SecureAstrologerService {
  static const Duration _requestTimeout = Duration(seconds: 15);
  static final SecureHttpClient _httpClient = SecureHttpClient();

  static Future<AstrologerDetail> getAstrologerDetails(
    String astrologerId,
    String? token,
  ) async {
    _validateAstrologerId(astrologerId);

    try {
      final headers = {
        'X-Feature': 'astrologer_details',
        'X-Request-ID': 'astro_${DateTime.now().millisecondsSinceEpoch}',
      };

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await _httpClient
          .get(
            '${Environment.baseUrl}/api/councillor/$astrologerId',
            headers: headers,
            requireAuth: token != null && token.isNotEmpty,
            token: token,
          )
          .timeout(_requestTimeout);

      return _handleAstrologerResponse(response);
    } on TimeoutException catch (e) {
      throw AstrologerException('Request timeout', 'TIMEOUT', e);
    } on http.ClientException catch (e) {
      throw AstrologerException('Network error: $e', 'NETWORK_ERROR', e);
    } catch (e) {
      throw AstrologerException(
        'Failed to load astrologer details: $e',
        'LOAD_ERROR',
        e,
      );
    }
  }

  static Future<bool> getFavoriteStatus(
    String userId,
    String astrologerId,
    String? token,
  ) async {
    _validateUserId(userId);
    _validateAstrologerId(astrologerId);

    if (token == null || token.isEmpty) {
      debugPrint('❌ No token available for favorite status check');
      return false;
    }

    try {
      final response = await _httpClient
          .get(
            '${Environment.baseUrl}/api/favorite-astrologer?userId=$userId',
            requireAuth: true,
            token: token,
            headers: {
              'X-Request-ID': 'fav_check_${DateTime.now().millisecondsSinceEpoch}',
            },
          )
          .timeout(_requestTimeout);

      return _handleFavoriteStatusResponse(response, astrologerId);
    } on TimeoutException catch (e) {
      throw AstrologerException('Favorite status timeout', 'TIMEOUT', e);
    } catch (e) {
      if (e.toString().contains('Authentication token not available')) {
        return false;
      }
      throw AstrologerException(
        'Failed to get favorite status: $e',
        'FAVORITE_STATUS_ERROR',
        e,
      );
    }
  }

  static Future<bool> toggleFavorite({
    required String userId,
    required String astrologerId,
    required String employeeId, // ✅ ADDED NEW PARAMETER
    required bool isCurrentlyFavorite,
    required String? token,
  }) async {
    _validateUserId(userId);
    _validateAstrologerId(astrologerId);

    // ✅ ADDED: Validate employeeId
    if (employeeId.isEmpty) {
      debugPrint('❌ EmployeeId is empty, cannot toggle favorite');
      throw AstrologerException('Employee ID is required', 'INVALID_EMPLOYEE_ID');
    }

    if (token == null || token.isEmpty) {
      throw AstrologerException('Authentication required', 'AUTH_REQUIRED');
    }

    try {
      debugPrint('''
🎯 Toggle Favorite Request:
   - User ID: $userId
   - Astrologer ID: $astrologerId
   - Employee ID: $employeeId
   - Current State: $isCurrentlyFavorite
   - Platform: ${Platform.operatingSystem}
''');

      final response = await _httpClient
          .post(
            '${Environment.baseUrl}/api/favorite-astrologer/set',
            body: {
              'userId': userId,
              'employeeId': isCurrentlyFavorite ? null : employeeId, // ✅ Sending employeeId NOT astrologerId
              'timestamp': DateTime.now().toIso8601String(),
              'platform': Platform.operatingSystem, // ✅ FIXED: Now works with dart:io import
            },
            headers: {
              'X-Idempotency-Key': 'fav_${DateTime.now().millisecondsSinceEpoch}',
              'Content-Type': 'application/json',
            },
            requireAuth: true,
            token: token,
          )
          .timeout(_requestTimeout);

      // ✅ ADDED: Debug response
      debugPrint('📥 Toggle Response: ${response.statusCode} - ${response.body}');

      return _handleToggleFavoriteResponse(response);
    } on TimeoutException catch (e) {
      throw AstrologerException('Toggle favorite request timeout', 'TIMEOUT', e);
    } catch (e) {
      debugPrint('❌ Toggle favorite error: $e');
      throw AstrologerException(
        'Failed to toggle favorite: $e',
        'TOGGLE_FAVORITE_ERROR',
        e,
      );
    }
  }

  static void dispose() {
    _httpClient.dispose();
  }

  static void _validateAstrologerId(String astrologerId) {
    if (astrologerId.isEmpty || astrologerId.length > 100) {
      throw AstrologerException('Invalid astrologer ID', 'INVALID_ASTROLOGER_ID');
    }

    final validPattern = RegExp(r'^[a-zA-Z0-9_-]+$');
    if (!validPattern.hasMatch(astrologerId)) {
      throw AstrologerException(
        'Invalid astrologer ID format',
        'INVALID_ASTROLOGER_ID_FORMAT',
      );
    }
  }

  static void _validateUserId(String userId) {
    if (userId.isEmpty || userId.length > 100) {
      throw AstrologerException('Invalid user ID', 'INVALID_USER_ID');
    }
  }

  static AstrologerDetail _handleAstrologerResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final data = json.decode(utf8.decode(response.bodyBytes));

        debugPrint('🔍 Raw API Response: $data');

        // ✅ ADDED: Debug employeeId in response
        if (data['data'] != null && data['data']['employeeId'] != null) {
          debugPrint('✅ Found employeeId in response: ${data['data']['employeeId']}');
        }

        if (data['success'] == true && data['data'] != null) {
          return AstrologerDetail.fromJson(data['data']);
        } else {
          throw AstrologerException(
            data['message'] ?? 'Astrologer not found',
            'ASTROLOGER_NOT_FOUND',
          );
        }
      } catch (e) {
        throw AstrologerException(
          'Invalid response format',
          'INVALID_RESPONSE_FORMAT',
          e,
        );
      }
    } else if (response.statusCode == 404) {
      throw AstrologerException('Astrologer not found', 'ASTROLOGER_NOT_FOUND');
    } else {
      throw AstrologerException(
        'Server error: ${response.statusCode}',
        'SERVER_ERROR_${response.statusCode}',
      );
    }
  }

  static bool _handleFavoriteStatusResponse(
    http.Response response,
    String astrologerId,
  ) {
    if (response.statusCode == 200) {
      try {
        final data = json.decode(utf8.decode(response.bodyBytes));

        if (data['success'] == true) {
          final favoriteId = data['favoriteAstrologerId'];
          return favoriteId != null && favoriteId == astrologerId;
        }
        return false;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  static bool _handleToggleFavoriteResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final data = json.decode(utf8.decode(response.bodyBytes));
        debugPrint('✅ Toggle response success: ${data['success']}');
        debugPrint('✅ Favorite astrologer ID set to: ${data['favoriteAstrologerId']}');
        return data['success'] == true;
      } catch (e) {
        debugPrint('❌ Error parsing toggle response: $e');
        throw AstrologerException(
          'Invalid toggle response',
          'INVALID_TOGGLE_RESPONSE',
          e,
        );
      }
    } else {
      debugPrint('❌ Toggle failed with status: ${response.statusCode}');
      throw AstrologerException(
        'Toggle favorite failed: ${response.statusCode}',
        'TOGGLE_FAILED_${response.statusCode}',
      );
    }
  }
}

class AstrologerException implements Exception {
  final String message;
  final String code;
  final dynamic underlyingError;
  final DateTime timestamp;

  AstrologerException(this.message, this.code, [this.underlyingError])
      : timestamp = DateTime.now();

  @override
  String toString() => 'AstrologerException[$code]: $message';
}