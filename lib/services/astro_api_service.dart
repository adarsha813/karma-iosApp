// lib/services/api_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/astro_term.dart';
import 'package:logger/logger.dart';
import 'package:kundali/config/environment.dart';
import 'dart:async'; // ✅ Add this line
import '../providers/profile_provider.dart'; // import your profile provider

class ApiService {
  static final Logger _logger = Logger();

  // Use environment configuration
  static String get baseUrl => '${Environment.baseUrl}/api';

  // HTTP client with production settings
  static final http.Client _client = http.Client();

  // Timeout durations
  static const Duration _connectTimeout = Duration(seconds: 10);
  static const Duration _receiveTimeout = Duration(seconds: 15);

  static Future<List<AstroTerm>> fetchTerms() async {
    final Uri uri = Uri.parse('$baseUrl/dictionary');

    _logger.i('API Request: GET $uri');

    try {
      final response = await _client
          .get(uri, headers: _buildHeaders())
          .timeout(_connectTimeout + _receiveTimeout);

      _logger.i('API Response: ${response.statusCode} - $uri');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        _logger.d('Fetched ${data.length} terms');
        return data.map((e) => AstroTerm.fromJson(e)).toList();
      } else {
        _logger.e('API Error: ${response.statusCode} - ${response.body}');
        throw _handleError(response.statusCode, response.body);
      }
    } on SocketException catch (e) {
      _logger.e('Network error: $e');
      throw NetworkException('No internet connection');
    } on http.ClientException catch (e) {
      _logger.e('HTTP client error: $e');
      throw NetworkException('Failed to connect to server');
    } on TimeoutException catch (e) {
      _logger.e('Request timeout: $e');
      throw TimeoutException('Request timed out');
    } on FormatException catch (e) {
      _logger.e('JSON format error: $e');
      throw DataParsingException('Invalid response format');
    } catch (e) {
      _logger.e('Unexpected error: $e');
      throw UnknownException('An unexpected error occurred');
    }
  }

  // Additional API methods can follow the same pattern
  static Future<AstroTerm> fetchTermById(String id) async {
    final Uri uri = Uri.parse('$baseUrl/dictionary/$id');

    _logger.i('API Request: GET $uri');

    try {
      final response = await _client
          .get(uri, headers: _buildHeaders())
          .timeout(_receiveTimeout);

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

  static Map<String, String> _buildHeaders() {
    final token = ProfileProvider().token; // Singleton instance
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'AstroApp/${Environment.appVersion}',
      ...Environment.securityHeaders,
      if (token != null)
        'Authorization': 'Bearer $token', // add token if exists
    };

    // Add authentication token if available
    // final token = await AuthService.getToken();
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }

    return headers;
  }

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

  // Cleanup method to be called when app closes
  static void dispose() {
    _client.close();
    _logger.d('ApiService disposed');
  }
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
