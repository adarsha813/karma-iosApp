// lib/services/api_service.dart
import 'dart:convert';
import '../models/astro_term.dart';
import 'package:logger/logger.dart';
import 'package:kundali/config/environment.dart';
import 'package:kundali/services/http_service.dart'; // ✅ Import HttpService

class ApiService {
  static final Logger _logger = Logger();

  // Use environment configuration
  static String get baseUrl => '${Environment.baseUrl}/api';

  // ✅ Remove custom client - HttpService manages its own
  // ✅ Remove timeout constants - HttpService has its own

  static Future<List<AstroTerm>> fetchTerms() async {
    _logger.i('API Request: GET $baseUrl/dictionary');

    try {
      final response = await HttpService().get(
        '$baseUrl/dictionary',
        requiresAuth: true, // Dictionary might not need auth
      );

      _logger.i('API Response: ${response.statusCode} - $baseUrl/dictionary');

      if (response.statusCode == 200) {
        final decodedBody = json.decode(utf8.decode(response.bodyBytes));

        // Handle both array and object responses
        List<dynamic> data;
        if (decodedBody is List) {
          // If the response is directly an array
          data = decodedBody;
        } else if (decodedBody is Map) {
          // If the response is an object, look for common keys that might contain the array
          if (decodedBody.containsKey('data')) {
            data = decodedBody['data'];
          } else if (decodedBody.containsKey('terms')) {
            data = decodedBody['terms'];
          } else if (decodedBody.containsKey('results')) {
            data = decodedBody['results'];
          } else if (decodedBody.containsKey('items')) {
            data = decodedBody['items'];
          } else {
            // If no common key found, try to find any array in the response
            final arrays =
                decodedBody.entries
                    .where((entry) => entry.value is List)
                    .toList();

            if (arrays.isNotEmpty) {
              data = arrays.first.value;
              _logger.w(
                'Using first array found with key: "${arrays.first.key}"',
              );
            } else {
              throw DataParsingException('No array found in response');
            }
          }
        } else {
          throw DataParsingException(
            'Unexpected response type: ${decodedBody.runtimeType}',
          );
        }

        _logger.d('Fetched ${data.length} terms');
        return data.map((e) => AstroTerm.fromJson(e)).toList();
      } else {
        _logger.e('API Error: ${response.statusCode} - ${response.body}');
        throw _handleError(response.statusCode, response.body);
      }
    } catch (e) {
      _logger.e('Error fetching terms: $e');
      rethrow;
    }
  }

  static Future<AstroTerm> fetchTermById(String id) async {
    _logger.i('API Request: GET $baseUrl/dictionary/$id');

    try {
      final response = await HttpService().get(
        '$baseUrl/dictionary/$id',
        requiresAuth: true, // Dictionary might not need auth
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(
          utf8.decode(response.bodyBytes),
        );
        return AstroTerm.fromJson(data);
      } else {
        _logger.e('API Error: ${response.statusCode} - ${response.body}');
        throw _handleError(response.statusCode, response.body);
      }
    } catch (e) {
      _logger.e('Error fetching term $id: $e');
      rethrow;
    }
  }

  // ✅ Remove _buildHeaders - HttpService handles headers
  // ✅ Remove token handling - HttpService handles auth

  static Exception _handleError(int statusCode, String body) {
    switch (statusCode) {
      case 400:
        return BadRequestException('Invalid request: $body');
      case 401:
        return UnauthorizedException('Authentication required');
      case 403:
        return ForbiddenException('Access denied');
      case 404:
        return NotFoundException('Resource not found');
      case 429:
        return RateLimitException('Too many requests');
      case 500:
        return ServerException('Internal server error');
      case 502:
      case 503:
        return ServiceUnavailableException('Service temporarily unavailable');
      default:
        return ApiException('HTTP $statusCode: $body');
    }
  }

  // ✅ Remove dispose method - HttpService manages its own client
  // HttpService is a singleton, so we don't need to dispose it manually
}

// Custom exception classes for better error handling
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException extends ApiException {
  NetworkException(super.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

class ForbiddenException extends ApiException {
  ForbiddenException(super.message);
}

class NotFoundException extends ApiException {
  NotFoundException(super.message);
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class RateLimitException extends ApiException {
  RateLimitException(super.message);
}

class ServerException extends ApiException {
  ServerException(super.message);
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException(super.message);
}

class DataParsingException extends ApiException {
  DataParsingException(super.message);
}

class UnknownException extends ApiException {
  UnknownException(super.message);
}
