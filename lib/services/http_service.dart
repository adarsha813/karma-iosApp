import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpService {
  static final Logger _logger = Logger();

  static const int timeoutSeconds = 30;

  static Map<String, String> _getHeaders(String? token) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  static Future<http.Response> get(
    String url, {
    String? token,
    Map<String, String>? additionalHeaders,
  }) async {
    try {
      final headers = _getHeaders(token);
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }

      _logger.d('GET Request: $url');

      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: timeoutSeconds));

      _logger.d('GET Response: ${response.statusCode} - $url');

      return response;
    } catch (e) {
      _logger.e('GET Request failed: $url', error: e);
      rethrow;
    }
  }

  static Future<http.Response> post(
    String url, {
    String? token,
    Object? body,
    Map<String, String>? additionalHeaders,
  }) async {
    try {
      final headers = _getHeaders(token);
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }

      _logger.d('POST Request: $url');
      _logger.d('POST Body: $body');

      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: body != null ? json.encode(body) : null,
          )
          .timeout(const Duration(seconds: timeoutSeconds));

      _logger.d('POST Response: ${response.statusCode} - $url');

      return response;
    } catch (e) {
      _logger.e('POST Request failed: $url', error: e);
      rethrow;
    }
  }
}
