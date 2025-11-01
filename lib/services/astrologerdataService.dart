// lib/services/astrologer_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/environment.dart';
import 'package:flutter/foundation.dart';

class AstroDetail {
  final String id;
  final String name;
  final String image;

  AstroDetail({required this.id, required this.name, required this.image});

  factory AstroDetail.fromJson(Map<String, dynamic> json) {
    return AstroDetail(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Astrologer',
      image: json['image']?.toString() ?? '',
    );
  }
}

class AstrologerService {
  final Map<String, AstroDetail> _cache = {};
  final Map<String, Future<AstroDetail?>> _pendingRequests = {};

  static final AstrologerService _instance = AstrologerService._internal();
  factory AstrologerService() => _instance;
  AstrologerService._internal();

  Future<AstroDetail?> getAstrologer(String id) async {
    // Return cached data if available
    if (_cache.containsKey(id)) {
      return _cache[id];
    }

    // Return pending request if already in progress
    if (_pendingRequests.containsKey(id)) {
      return _pendingRequests[id];
    }

    // Make new request
    final future = _fetchAstrologer(id);
    _pendingRequests[id] = future;

    try {
      final result = await future;
      if (result != null) {
        _cache[id] = result;
      }
      return result;
    } finally {
      _pendingRequests.remove(id);
    }
  }

  Future<AstroDetail?> _fetchAstrologer(String id) async {
    try {
      final url = Uri.parse('${Environment.baseUrl}/api/councillor/$id');
      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        if (data['success'] == true && data['data'] != null) {
          return AstroDetail.fromJson(data['data']);
        }
      }
    } catch (e) {
      debugPrint('Error fetching astrologer $id: $e');
    }
    return null;
  }

  void preloadAstrologer(String id) {
    if (!_cache.containsKey(id) && !_pendingRequests.containsKey(id)) {
      getAstrologer(id);
    }
  }

  // Clear cache if needed
  void clearCache() {
    _cache.clear();
    _pendingRequests.clear();
  }

  // Clear specific entry
  void removeFromCache(String id) {
    _cache.remove(id);
    _pendingRequests.remove(id);
  }
}
