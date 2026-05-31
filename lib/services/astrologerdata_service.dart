// lib/services/astrologer_service.dart
import 'dart:convert';
import '../config/environment.dart';
import 'package:kundali/services/http_service.dart'; // ✅ Import HttpService

class AstroDetail {
  final String id;
  final String name;
  final String image;

  AstroDetail({required this.id, required this.name, required this.image});

  factory AstroDetail.fromJson(Map<String, dynamic> json) {
    //AppLogger.info('🔄 Parsing AstroDetail from JSON: $json');

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

    //AppLogger.info('✅ Parsed fields:');
    //AppLogger.info('   - ID: $id');
    //AppLogger.info('   - Name: $name');
    //AppLogger.info('   - Image: $image');

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

  Future<AstroDetail?> _fetchAstrologer(String id) async {
    try {
      final url = '${Environment.baseUrl}/api/councillor/$id';
      //AppLogger.info('🔄 Fetching from: $url');

      // ✅ Use HttpService instead of direct http call
      final response = await HttpService().get(
        url,
        requiresAuth: true, // This endpoint likely needs authentication
      );

      //AppLogger.info('📡 Response status: ${response.statusCode}');
      //AppLogger.info('📡 Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        //AppLogger.info('📊 Parsed data: $data');
        //AppLogger.info('📊 Data type: ${data.runtimeType}');

        if (data is Map) {
          //AppLogger.info('📊 Data keys: ${data.keys}');
          data.forEach((key, value) {
            //AppLogger.info('   - $key: $value (${value.runtimeType})');
          });
        }

        // Check for success response
        if (data['success'] == true && data['data'] != null) {
          //AppLogger.info('✅ Success! Data field: ${data['data']}');
          final astroDetail = AstroDetail.fromJson(data['data']);
          //AppLogger.info('✅ Final AstroDetail:');
          //AppLogger.info('   - ID: ${astroDetail.id}');
          //AppLogger.info('   - Name: ${astroDetail.name}');
          //AppLogger.info('   - Image: ${astroDetail.image}');
          return astroDetail;
        }
        // Handle case where response is directly the councillor object
        else if (data['employeeId'] != null || data['fullName'] != null) {
          //AppLogger.info('✅ Direct councillor response');
          final astroDetail = AstroDetail.fromJson(data);
          return astroDetail;
        } else {
          //AppLogger.info('❌ API returned unexpected format');
        }
      } else if (response.statusCode == 401) {
        // HttpService will handle token refresh automatically
        // If we get here, refresh failed
        //AppLogger.info('❌ Authentication failed for astrologer $id');
      } else {
        //AppLogger.info('❌ HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      //AppLogger.info('❌ Error fetching astrologer $id: $e');
    }
    return null;
  }

  // ✅ Add a batch preload method for efficiency
  Future<void> preloadAstrologers(List<String> ids) async {
    //AppLogger.info('🔄 Preloading ${ids.length} astrologers');
    for (final id in ids) {
      if (!_cache.containsKey(id) && !_pendingRequests.containsKey(id)) {
        // Don't await - let them load in parallel
        getAstrologer(id);
      }
    }
  }

  // ✅ Add method to get multiple astrologers at once
  Future<Map<String, AstroDetail>> getAstrologers(List<String> ids) async {
    final results = <String, AstroDetail>{};
    final futures = <Future>[];

    for (final id in ids) {
      futures.add(
        getAstrologer(id).then((detail) {
          if (detail != null) {
            results[id] = detail;
          }
        }),
      );
    }

    await Future.wait(futures);
    return results;
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

  // ✅ Add cache size getter
  int get cacheSize => _cache.length;
}
