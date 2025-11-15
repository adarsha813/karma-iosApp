import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../config/environment.dart';
import './secure_http_client.dart'; // ✅ CORRECT IMPORT
import 'package:flutter/foundation.dart';

class AstrologerDetail {
  final String id;
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
      id: json['id']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? 'Astrologer',
      image: json['image']?.toString(),
      education: json['education']?.toString(),
      qualification: json['qualification']?.toString(),
      experience: json['experience']?.toString(),
      bio: json['bio']?.toString(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      specialties: List<String>.from(json['specialties'] ?? []),
      metadata:
          json['metadata'] is Map
              ? Map<String, dynamic>.from(json['metadata'])
              : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
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

  // ✅ ADD: Create instance of SecureHttpClient
  static final SecureHttpClient _httpClient = SecureHttpClient();

  // Enhanced error handling with specific error types
  static Future<AstrologerDetail> getAstrologerDetails(
    String astrologerId,
    String? token,
  ) async {
    _validateAstrologerId(astrologerId);

    try {
      // ✅ FIX: Always include token in headers if available
      final headers = {
        'X-Feature': 'astrologer_details',
        'X-Request-ID': 'astro_${DateTime.now().millisecondsSinceEpoch}',
      };

      // Add Authorization header if token is available
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await _httpClient
          .get(
            '${Environment.baseUrl}/api/councillor/$astrologerId',
            headers: headers,
            requireAuth:
                token != null &&
                token.isNotEmpty, // Auth required only if token exists
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

    // ✅ FIX: Add the same validation as payment service
    if (token == null || token.isEmpty) {
      debugPrint('❌ No token available for favorite status check');
      return false; // Default to not favorite
    }

    try {
      final response = await _httpClient
          .get(
            '${Environment.baseUrl}/api/favorite-astrologer/$userId',
            requireAuth: true,
            token: token, // ✅ PASS token for authenticated request
          )
          .timeout(_requestTimeout);

      return _handleFavoriteStatusResponse(response, astrologerId);
    } on TimeoutException catch (e) {
      throw AstrologerException('Favorite status timeout', 'TIMEOUT', e);
    } catch (e) {
      // If auth fails, return false instead of crashing
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
    required bool isCurrentlyFavorite,
    required String? token,
  }) async {
    _validateUserId(userId);
    _validateAstrologerId(astrologerId);

    // ✅ ADD: Check token before making request
    if (token == null || token.isEmpty) {
      throw AstrologerException('Authentication required', 'AUTH_REQUIRED');
    }

    try {
      // ✅ FIXED: Use SecureHttpClient
      final response = await _httpClient
          .post(
            '${Environment.baseUrl}/api/favorite-astrologer/set',
            body: {
              'userId': userId,
              'astrologerId': isCurrentlyFavorite ? null : astrologerId,
              'timestamp': DateTime.now().toIso8601String(),
              'platform': 'mobile',
            },
            headers: {
              'X-Idempotency-Key':
                  'fav_${DateTime.now().millisecondsSinceEpoch}',
            },
            requireAuth:
                true, // ✅ FIX: This should always be TRUE for this endpoint
            token: token, // ✅ PASS the token
          )
          .timeout(_requestTimeout);

      return _handleToggleFavoriteResponse(response);
    } on TimeoutException catch (e) {
      throw AstrologerException(
        'Toggle favorite request timeout',
        'TIMEOUT',
        e,
      );
    } catch (e) {
      throw AstrologerException(
        'Failed to toggle favorite: $e',
        'TOGGLE_FAVORITE_ERROR',
        e,
      );
    }
  }

  // ✅ ADD: Dispose method to clean up HttpClient
  static void dispose() {
    _httpClient.dispose();
  }

  // Validation methods
  static void _validateAstrologerId(String astrologerId) {
    if (astrologerId.isEmpty || astrologerId.length > 100) {
      throw AstrologerException(
        'Invalid astrologer ID',
        'INVALID_ASTROLOGER_ID',
      );
    }

    // Basic pattern validation
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

  // Response handlers
  static AstrologerDetail _handleAstrologerResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final data = json.decode(utf8.decode(response.bodyBytes));

        debugPrint('🔍 Raw API Response: $data');

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
        return false; // Default to false on parse errors
      }
    }
    return false; // Default to false on non-200 responses
  }

  static bool _handleToggleFavoriteResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return data['success'] == true;
      } catch (e) {
        throw AstrologerException(
          'Invalid toggle response',
          'INVALID_TOGGLE_RESPONSE',
          e,
        );
      }
    } else {
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
