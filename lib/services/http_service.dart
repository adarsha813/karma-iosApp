import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../config/environment.dart';
import '../utils/app_logger.dart';

class HttpService {
  static final Logger _logger = Logger();
  static const int timeoutSeconds = 30;

  // Singleton pattern
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  ProfileProvider? _profileProvider;
  bool _isRefreshing = false;
  final List<Completer<http.Response>> _pendingRequests = [];

  // Initialize with context (call this once in your main app)
  void initialize(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _logger.i('✅ HttpService initialized');
  }

  Map<String, String> _getHeaders(String? token) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...Environment.securityHeaders,
    };

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  // Public methods
  Future<http.Response> get(
    String url, {
    Map<String, String>? additionalHeaders,
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = requiresAuth ? await _getValidToken() : null;
        final headers = _getHeaders(token);
        if (additionalHeaders != null) headers.addAll(additionalHeaders);

        _logger.d('📤 GET Request: $url');
        _logger.d('🔑 Token present: ${token != null}');

        final response = await http.get(Uri.parse(url), headers: headers);
        return response;
      },
      url,
      requiresAuth,
    );
  }

  Future<http.Response> post(
    String url, {
    Object? body,
    Map<String, String>? additionalHeaders,
    bool requiresAuth = true,
    String? customToken, // Add this parameter
  }) async {
    return _makeRequest(
      () async {
        final token = requiresAuth ? await _getValidToken() : null;
        final headers = _getHeaders(token);
        if (additionalHeaders != null) headers.addAll(additionalHeaders);

        _logger.d('📤 POST Request: $url');
        _logger.d('🔑 Token present: ${token != null}');
        _logger.d('📦 Body: $body');

        final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: body != null ? json.encode(body) : null,
        );
        return response;
      },
      url,
      requiresAuth,
    );
  }

  Future<http.Response> put(
    String url, {
    Object? body,
    Map<String, String>? additionalHeaders,
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = requiresAuth ? await _getValidToken() : null;
        final headers = _getHeaders(token);
        if (additionalHeaders != null) headers.addAll(additionalHeaders);

        _logger.d('📤 PUT Request: $url');
        return http.put(
          Uri.parse(url),
          headers: headers,
          body: body != null ? json.encode(body) : null,
        );
      },
      url,
      requiresAuth,
    );
  }

  Future<http.Response> delete(
    String url, {
    Object? body,
    Map<String, String>? additionalHeaders,
    bool requiresAuth = true,
  }) async {
    return _makeRequest(
      () async {
        final token = requiresAuth ? await _getValidToken() : null;
        final headers = _getHeaders(token);
        if (additionalHeaders != null) headers.addAll(additionalHeaders);

        _logger.d('📤 DELETE Request: $url');

        if (body != null) {
          // For DELETE with body, use Request object
          var request = http.Request('DELETE', Uri.parse(url));
          request.headers.addAll(headers);
          request.body = json.encode(body);
          var streamedResponse = await request.send();
          return await http.Response.fromStream(streamedResponse);
        } else {
          return await http.delete(Uri.parse(url), headers: headers);
        }
      },
      url,
      requiresAuth,
    );
  }

  // Private methods
  Future<String?> _getValidToken() async {
    if (_profileProvider == null) {
      _logger.w('⚠️ HttpService not initialized');
      return null;
    }

    // Get current token
    String? token = _profileProvider!.token;

    // If no token, try to get one
    if (token == null || token.isEmpty) {
      if (_profileProvider!.userId != null) {
        _logger.d('🔑 No token, fetching new one');
        await _profileProvider!.fetchAndSaveToken(_profileProvider!.userId!);
        token = _profileProvider!.token;
      }
    }

    return token;
  }

  // In HttpService._makeRequest
  Future<http.Response> _makeRequest(
    Future<http.Response> Function() request,
    String url,
    bool requiresAuth,
  ) async {
    AppLogger.info('🌐 Making request to: $url');
    AppLogger.info('🔑 Requires auth: $requiresAuth');

    try {
      var response = await request().timeout(
        const Duration(seconds: timeoutSeconds),
      );

      AppLogger.info('📥 Response: ${response.statusCode} - $url');

      if (response.statusCode == 401 && requiresAuth) {
        AppLogger.info('🔄 401 received, triggering refresh for: $url');
        return await _handleUnauthorized(request, url);
      }

      return response;
    } on TimeoutException {
      AppLogger.info('⏱️ Timeout: $url');
      throw Exception('Request timeout');
    } catch (e) {
      AppLogger.info('❌ Request failed: $url - $e');
      rethrow;
    }
  }

  Future<http.Response> _handleUnauthorized(
    Future<http.Response> Function() request,
    String url,
  ) async {
    AppLogger.info('🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥');
    AppLogger.info('🔥 401 HANDLER TRIGGERED at ${DateTime.now()}');
    AppLogger.info('🔥 URL: $url');
    AppLogger.info('🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥');
    if (_isRefreshing) {
      // Another request is already refreshing, wait for it
      _logger.d('⏳ Token refresh in progress, waiting...');
      final completer = Completer<http.Response>();
      _pendingRequests.add(completer);

      try {
        return await completer.future.timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            _logger.e('⏱️ Timeout waiting for token refresh');
            throw Exception('Authentication timeout');
          },
        );
      } finally {
        _pendingRequests.remove(completer);
      }
    }

    _isRefreshing = true;
    _logger.d('🔄 Starting token refresh process...');

    try {
      // Try to refresh token
      bool refreshSuccess = false;
      if (_profileProvider != null) {
        refreshSuccess = await _profileProvider!.refreshToken();
      }

      if (refreshSuccess) {
        _logger.i('✅ Token refreshed successfully, retrying request');

        // Retry the original request with new token
        final retryResponse = await request();

        // Complete all pending requests
        for (final completer in _pendingRequests) {
          try {
            final pendingResponse = await request();
            completer.complete(pendingResponse);
          } catch (e) {
            completer.completeError(e);
          }
        }

        return retryResponse;
      } else {
        // Refresh failed, try to get a completely new token
        _logger.w('⚠️ Token refresh failed, attempting to get new token');

        if (_profileProvider != null && _profileProvider!.userId != null) {
          final newTokenSuccess = await _profileProvider!.fetchAndSaveToken(
            _profileProvider!.userId!,
          );

          if (newTokenSuccess) {
            _logger.i('✅ New token obtained, retrying request');

            // Retry with new token
            final retryResponse = await request();

            // Complete pending requests
            for (final completer in _pendingRequests) {
              try {
                final pendingResponse = await request();
                completer.complete(pendingResponse);
              } catch (e) {
                completer.completeError(e);
              }
            }

            return retryResponse;
          }
        }

        // All authentication attempts failed
        _logger.e('❌ All authentication attempts failed');

        // Complete pending requests with error
        final error = Exception('Authentication failed. Please log in again.');
        for (final completer in _pendingRequests) {
          completer.completeError(error);
        }

        throw error;
      }
    } finally {
      _isRefreshing = false;
    }
  }
}
