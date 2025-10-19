import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/security_config.dart';
import 'secure_storage_service.dart';

class SecureHttpClient {
  final SecureStorageService _secureStorage = SecureStorageService();

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    return _makeRequest('GET', url, headers: headers, requireAuth: requireAuth);
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool requireAuth = true,
  }) async {
    return _makeRequest(
      'POST',
      url,
      headers: headers,
      body: body,
      requireAuth: requireAuth,
    );
  }

  Future<http.Response> _makeRequest(
    String method,
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool requireAuth = true,
  }) async {
    // Check connectivity
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No internet connection');
    }

    // Prepare headers
    final requestHeaders = Map<String, String>.from(
      SecurityConfig.secureHeaders,
    );

    // Add auth token if required
    if (requireAuth) {
      final token = await _secureStorage.getToken();
      if (token == null) {
        throw Exception('Authentication required');
      }
      requestHeaders['Authorization'] = 'Bearer $token';
    }

    // Add custom headers
    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    // Make request with timeout
    final uri = Uri.parse(url);
    final request = http.Request(method, uri);
    request.headers.addAll(requestHeaders);

    if (body != null) {
      if (body is String) {
        request.body = body;
      } else {
        request.body = json.encode(body);
      }
    }

    final streamedResponse = await request.send().timeout(
      const Duration(seconds: SecurityConfig.apiTimeoutSeconds),
    );

    return http.Response.fromStream(streamedResponse);
  }
}
