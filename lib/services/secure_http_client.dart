import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/security_config.dart';
import 'secure_storage_service.dart';
import 'error_reporting_service.dart'; // ✅ ADDED

class SecureHttpClient {
  final SecureStorageService _secureStorage = SecureStorageService();
  final http.Client _client = http.Client(); // ✅ ADDED: Reuse client
  final Connectivity _connectivity = Connectivity();

  // ✅ ADDED: Dispose method for cleanup
  void dispose() {
    _client.close();
  }

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    bool requireAuth = true,
    int retryCount = 0, // ✅ ADDED: Retry mechanism
  }) async {
    return _makeRequest(
      'GET',
      url,
      headers: headers,
      requireAuth: requireAuth,
      retryCount: retryCount,
    );
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool requireAuth = true,
    int retryCount = 0, // ✅ ADDED: Retry mechanism
  }) async {
    return _makeRequest(
      'POST',
      url,
      headers: headers,
      body: body,
      requireAuth: requireAuth,
      retryCount: retryCount,
    );
  }

  // ✅ ADDED: Patch method for hide operations
  Future<http.Response> patch(
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool requireAuth = true,
    int retryCount = 0,
  }) async {
    return _makeRequest(
      'PATCH',
      url,
      headers: headers,
      body: body,
      requireAuth: requireAuth,
      retryCount: retryCount,
    );
  }

  Future<http.Response> sendAuthenticatedRequest({
    required Uri url,
    required String method,
    String? body,
    String? token,
    Map<String, String>? headers, // <-- add this
    Duration? timeout,
  }) async {
    final request = http.Request(method, url);

    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    if (body != null) request.body = body;
    if (headers != null) request.headers.addAll(headers); // <-- merge headers

    final streamedResponse = await _client
        .send(request)
        .timeout(timeout ?? const Duration(seconds: 10));

    return http.Response.fromStream(streamedResponse);
  }

  Future<http.Response> _makeRequest(
    String method,
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool requireAuth = true,
    int retryCount = 0,
  }) async {
    try {
      // Validate URL
      _validateUrl(url);

      // Check connectivity with enhanced validation
      await _checkConnectivity();

      // Prepare headers with security enhancements
      final requestHeaders = await _prepareHeaders(headers, requireAuth);

      // Validate request body
      _validateBody(body);

      // Make request with retry logic
      return await _executeRequestWithRetry(
        method,
        url,
        requestHeaders,
        body,
        retryCount,
      );
    } catch (error, stackTrace) {
      // Enhanced error reporting
      ErrorReportingService.recordError(
        error,
        stackTrace,
        context: 'HTTP Request',
        extra: {'method': method, 'url': url, 'authRequired': requireAuth},
      );

      rethrow;
    }
  }

  // ✅ ADDED: URL validation
  void _validateUrl(String url) {
    if (url.isEmpty) {
      throw ArgumentError('URL cannot be empty');
    }

    final uri = Uri.tryParse(url);
    if (uri == null || !uri.isAbsolute) {
      throw ArgumentError('Invalid URL: $url');
    }

    // Prevent potential SSRF attacks
    if (!uri.host.endsWith('your-trusted-domain.com') &&
        !uri.host.endsWith('chat-backend-rvk9.onrender.com')) {
      throw ArgumentError('Untrusted domain: ${uri.host}');
    }
  }

  // ✅ ADDED: Enhanced connectivity check
  Future<void> _checkConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw Exception('No internet connection available');
      }

      // Additional check for actual connectivity
      if (connectivityResult != ConnectivityResult.wifi &&
          connectivityResult != ConnectivityResult.mobile) {
        throw Exception('Limited connectivity: $connectivityResult');
      }
    } catch (error) {
      throw Exception('Network connectivity check failed: $error');
    }
  }

  // ✅ ADDED: Enhanced header preparation
  Future<Map<String, String>> _prepareHeaders(
    Map<String, String>? customHeaders,
    bool requireAuth,
  ) async {
    final headers = Map<String, String>.from(SecurityConfig.secureHeaders);

    // Add authentication token if required
    if (requireAuth) {
      final token = await _secureStorage.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token not available');
      }

      // Validate token format (basic sanity check)
      if (token.length < 10) {
        throw Exception('Invalid token format');
      }

      headers['Authorization'] = 'Bearer $token';
    }

    // Add custom headers with validation
    if (customHeaders != null) {
      // Prevent header injection attacks
      for (final header in customHeaders.entries) {
        if (!_isValidHeader(header.key) || !_isValidHeaderValue(header.value)) {
          throw ArgumentError('Invalid header: ${header.key}');
        }
      }
      headers.addAll(customHeaders);
    }

    return headers;
  }

  // ✅ ADDED: Header validation
  bool _isValidHeader(String header) {
    return header.isNotEmpty &&
        header.length <= 100 &&
        RegExp(r'^[a-zA-Z0-9\-]+$').hasMatch(header);
  }

  bool _isValidHeaderValue(String value) {
    return value.isNotEmpty && value.length <= 1000;
  }

  // ✅ ADDED: Body validation
  void _validateBody(Object? body) {
    if (body == null) return;

    if (body is String) {
      if (body.length > SecurityConfig.maxMessageLength * 10) {
        throw ArgumentError('Request body too large');
      }
    } else if (body is Map) {
      final jsonString = json.encode(body);
      if (jsonString.length > SecurityConfig.maxMessageLength * 10) {
        throw ArgumentError('Request body too large');
      }
    }
  }

  // ✅ ADDED: Retry mechanism with exponential backoff
  Future<http.Response> _executeRequestWithRetry(
    String method,
    String url,
    Map<String, String> headers,
    Object? body,
    int retryCount,
  ) async {
    for (int attempt = 0; attempt <= retryCount; attempt++) {
      try {
        final request = http.Request(method, Uri.parse(url));
        request.headers.addAll(headers);

        if (body != null) {
          if (body is String) {
            request.body = body;
          } else {
            request.body = json.encode(body);
          }
        }

        final streamedResponse = await _client
            .send(request)
            .timeout(const Duration(seconds: SecurityConfig.apiTimeoutSeconds));

        final response = await http.Response.fromStream(streamedResponse);

        // ✅ ADDED: Response validation
        _validateResponse(response);

        return response;
      } catch (error) {
        // Don't retry on certain errors
        if (_shouldNotRetry(error) || attempt == retryCount) {
          rethrow;
        }

        // Wait before retry (exponential backoff)
        await Future.delayed(
          Duration(
            seconds: SecurityConfig.retryDelay.inSeconds * (attempt + 1),
          ),
        );
      }
    }

    throw Exception('Max retry attempts exceeded');
  }

  // ✅ ADDED: Response validation
  void _validateResponse(http.Response response) {
    // Check for HTTP error status
    if (response.statusCode >= 400) {
      throw HttpException(
        'HTTP ${response.statusCode}: ${response.body}',
        response.statusCode,
      );
    }

    // Validate response size (prevent memory exhaustion)
    if (response.contentLength != null &&
        response.contentLength! > 10 * 1024 * 1024) {
      // 10MB limit
      throw Exception('Response too large: ${response.contentLength} bytes');
    }

    // Validate JSON response if content-type is JSON
    final contentType = response.headers['content-type']?.toLowerCase();
    if (contentType?.contains('application/json') == true) {
      try {
        json.decode(response.body);
      } catch (e) {
        throw FormatException('Invalid JSON response');
      }
    }
  }

  // ✅ ADDED: Determine if request should not be retried
  bool _shouldNotRetry(dynamic error) {
    return error is ArgumentError ||
        (error is http.ClientException && error.message.contains('Invalid'));
  }
}

// ✅ ADDED: Custom HTTP exception
class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(this.message, this.statusCode);

  @override
  String toString() => 'HttpException: $message (Status: $statusCode)';
}
