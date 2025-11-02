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
    debugPrint('🔄 Parsing AstroDetail from JSON: $json');

    // Try multiple field names for ID
    final id =
        json['employeeId']?.toString() ?? // ✅ PRIMARY - this is what API uses
        json['id']?.toString() ??
        json['_id']?.toString() ??
        json['councillorId']?.toString() ??
        '';

    // Try multiple field names for name
    final name =
        json['fullName']?.toString() ?? // ✅ PRIMARY - this is what API uses
        json['name']?.toString() ??
        json['councillorName']?.toString() ??
        json['username']?.toString() ??
        json['displayName']?.toString() ??
        'Councillor';

    final image =
        json['image']?.toString() ??
        json['profileImage']?.toString() ??
        json['avatar']?.toString() ??
        json['photo']?.toString() ??
        '';

    debugPrint('✅ Parsed fields:');
    debugPrint('   - ID: $id');
    debugPrint('   - Name: $name');
    debugPrint('   - Image: $image');

    return AstroDetail(id: id, name: name, image: image);
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

  // lib/services/astrologer_service.dart
  Future<AstroDetail?> _fetchAstrologer(String id) async {
    try {
      final url = Uri.parse('${Environment.baseUrl}/api/councillor/$id');
      debugPrint('🔄 Fetching from: $url');

      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 10));

      debugPrint('📡 Response status: ${response.statusCode}');
      debugPrint('📡 Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        debugPrint('📊 Parsed data: $data');
        debugPrint('📊 Data type: ${data.runtimeType}');

        if (data is Map) {
          debugPrint('📊 Data keys: ${data.keys}');
          data.forEach((key, value) {
            debugPrint('   - $key: $value (${value.runtimeType})');
          });
        }

        if (data['success'] == true && data['data'] != null) {
          debugPrint('✅ Success! Data field: ${data['data']}');
          final astroDetail = AstroDetail.fromJson(data['data']);
          debugPrint('✅ Final AstroDetail:');
          debugPrint('   - ID: ${astroDetail.id}');
          debugPrint('   - Name: ${astroDetail.name}');
          debugPrint('   - Image: ${astroDetail.image}');
          return astroDetail;
        } else {
          debugPrint('❌ API returned success:false or null data');
        }
      } else {
        debugPrint('❌ HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('❌ Error fetching astrologer $id: $e');
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
