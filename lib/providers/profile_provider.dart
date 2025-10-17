import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // <--- Add this
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileProvider with ChangeNotifier {
  String? _userId;
  String? _name;
  String? _city;
  String? _country;
  String? _gender;
  DateTime? _birthDate;
  TimeOfDay? _birthTime;
  String? _profileImageUrl;
  double? _latitude;
  double? _longitude;
  double? _timezone;
  double? _dst;
  String? _state;
  List<Map<String, dynamic>> _versionHistory = [];

  // Getters
  String? get userId => _userId;
  String? get name => _name;
  String? get city => _city;
  String? get country => _country;
  String? get gender => _gender;
  DateTime? get birthDate => _birthDate;
  TimeOfDay? get birthTime => _birthTime;
  String? get profileImageUrl => _profileImageUrl;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  double? get timezone => _timezone;
  double? get dst => _dst;
  String? get state => _state;
  List<Map<String, dynamic>> get versionHistory => _versionHistory;

  String? _language;
  String? get language => _language;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
    _language = langCode;
    notifyListeners();
  }

  // Add this inside ProfileProvider class
  void setLanguage(String langCode) {
    _language = langCode;
    notifyListeners();
  }

  // Optional: sync language to backend
  Future<void> updateLanguageBackend(String langCode) async {
    if (_userId == null || _token == null) return;

    final url = Uri.parse(
      'https://chat-backend-rvk9.onrender.com/api/profile/update-language',
    );
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: jsonEncode({'userId': _userId, 'language': langCode}),
      );

      if (response.statusCode == 200) {
        _language = langCode;
        notifyListeners();
        print("✅ Language updated on backend");
      } else {
        print("❌ Failed to update language: ${response.body}");
      }
    } catch (e) {
      print("🔴 Error updating language: $e");
    }
  }

  Future<void> fetchVersionHistoryFromBackend(String userId) async {
    try {
      final uri = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/get-profile?userId=$userId',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final profileData = data['profile'];

        if (profileData != null && profileData['versions'] != null) {
          // Convert backend versions to our format
          _versionHistory = List<Map<String, dynamic>>.from(
            profileData['versions'].map((version) {
              return {
                'name': version['name'],
                'city': version['city'],
                'country': version['country'],
                'gender': version['gender'],
                'birthDate':
                    version['birthDate'] != null
                        ? _parseBackendDate(version['birthDate'])
                        : null,
                'birthTime': version['birthTime'],
                'profileImageUrl': version['profilePicture'],
                'latitude': version['latitude']?.toDouble(),
                'longitude': version['longitude']?.toDouble(),
                'timezone': version['timezone']?.toDouble(),
                'dst': version['dst']?.toDouble(),
                'state': version['state'],
                'updatedAt':
                    version['updatedAt'] != null
                        ? _parseBackendDate(version['updatedAt'])
                        : DateTime.now().toString(),
                'version': version['_id'] != null ? 'db' : 'local',
              };
            }).toList(),
          );

          // Save to local storage for offline access
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('versionHistory', json.encode(_versionHistory));

          debugPrint(
            '✅ Loaded ${_versionHistory.length} versions from backend',
          );
        }
      } else {
        debugPrint('❌ Failed to fetch version history: ${response.statusCode}');
        // Fallback to local storage
        await _loadVersionHistoryFromLocal();
      }
    } catch (e) {
      debugPrint('🔴 Error fetching version history: $e');
      // Fallback to local storage
      await _loadVersionHistoryFromLocal();
    }
    notifyListeners();
  }

  Future<void> _loadVersionHistoryFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString('versionHistory');
    if (historyJson != null) {
      try {
        _versionHistory = List<Map<String, dynamic>>.from(
          json.decode(historyJson),
        );
      } catch (e) {
        debugPrint('Error parsing local version history: $e');
      }
    }
  }

  String _parseBackendDate(dynamic backendDate) {
    try {
      if (backendDate is Map && backendDate['\$date'] != null) {
        final dateMap = backendDate['\$date'];
        if (dateMap['\$numberLong'] != null) {
          final timestamp = int.parse(dateMap['\$numberLong'].toString());
          return DateTime.fromMillisecondsSinceEpoch(timestamp).toString();
        }
      } else if (backendDate is String) {
        return backendDate;
      }
    } catch (e) {
      debugPrint('Error parsing backend date: $e');
    }
    return DateTime.now().toString();
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'en'; // default to English
    notifyListeners();
  }

  Future<void> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');
    _name = prefs.getString('name');
    _city = prefs.getString('city');
    _country = prefs.getString('country');
    _gender = prefs.getString('gender');
    _profileImageUrl = prefs.getString('profileImageUrl');
    _latitude = prefs.getDouble('latitude');
    _longitude = prefs.getDouble('longitude');
    _timezone = prefs.getDouble('timezone');
    _dst = prefs.getDouble('dst');
    _state = prefs.getString('state');

    // Clear local version history first
    _versionHistory = [];

    // Load version history from backend if userId exists
    if (_userId != null && _userId!.isNotEmpty) {
      await fetchVersionHistoryFromBackend(_userId!);
    } else {
      // Fallback to local storage only if no userId
      final historyJson = prefs.getString('versionHistory');
      if (historyJson != null) {
        try {
          _versionHistory = List<Map<String, dynamic>>.from(
            json.decode(historyJson),
          );
        } catch (e) {
          debugPrint('Error parsing version history: $e');
        }
      }
    }

    final birthDateStr = prefs.getString('birthDate');
    if (birthDateStr != null) {
      try {
        if (birthDateStr.contains('-')) {
          List<String> parts = birthDateStr.split('-');
          _birthDate = DateTime(
            int.parse(parts[0]),
            int.parse(parts[1]),
            int.parse(parts[2]),
          );
        } else {
          _birthDate = DateTime.parse(birthDateStr);
        }
      } catch (e) {
        debugPrint('Error parsing birthDate: $e');
      }
    }

    final birthTimeStr = prefs.getString('birthTime');
    if (birthTimeStr != null) {
      try {
        List<String> parts = birthTimeStr.split(':');
        _birthTime = TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      } catch (e) {
        debugPrint('Error parsing birthTime: $e');
      }
    }
    notifyListeners();
  }

  String? _token;
  String? get token => _token;

  Future<void> loadToken() async {
    print('➡️ Starting secure loadToken');
    _token = await _secureStorage.read(key: 'token');
    print('🛠️ Loaded token from secure storage: $_token');
    notifyListeners();
    print('⬅️ Finished loadToken');
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
    _token = token;
    notifyListeners();
  }

  Future<void> saveUserId(String newUserId) async {
    if (_userId == newUserId) return;

    await _secureStorage.write(key: 'userId', value: newUserId);
    _userId = newUserId;

    // Clear old profile data when ID changes
    _name = null;
    _city = null;
    _country = null;
    _gender = null;
    _birthDate = null;
    _birthTime = null;
    _profileImageUrl = null;
    _latitude = null;
    _longitude = null;
    _timezone = null;
    _dst = null;
    _state = null;
    _versionHistory = [];

    notifyListeners();
    await fetchAndSaveToken(newUserId);
  }

  Future<void> loadUserId() async {
    _userId = await _secureStorage.read(key: 'userId');
    notifyListeners();
  }

  Future<void> clearProfile() async {
    _userId = null;
    _token = null;
    _name = null;
    _city = null;
    _country = null;
    _gender = null;
    _birthDate = null;
    _birthTime = null;
    _profileImageUrl = null;
    _latitude = null;
    _longitude = null;
    _timezone = null;
    _dst = null;
    _state = null;
    _versionHistory = [];

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await _secureStorage.delete(key: 'userId');
    await _secureStorage.delete(key: 'token');

    notifyListeners();
  }

  // Add inside ProfileProvider
  Future<void> fetchAndSaveToken(String userId) async {
    final url = Uri.parse(
      "https://chat-backend-rvk9.onrender.com/api/auth/generate-token",
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId}),
      );

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['token'];
        print('✅ Token from backend: $token');
        await saveToken(token); // now uses secure storage
      } else {
        print('❌ Failed to get token: ${response.body}');
      }
    } catch (e) {
      print('🔴 Error generating token: $e');
    }
  }

  Future<void> saveFullProfile({
    required String userId,
    String? name,
    String? city,
    String? country,
    String? gender,
    DateTime? birthDate,
    TimeOfDay? birthTime,
    String? profileImageUrl,
    double? latitude,
    double? longitude,
    double? timezone,
    double? dst,
    String? state,
    String? language,
    Map<String, dynamic>? previousVersion,
    bool createVersion = false, // Add this parameter
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language != null) {
      await prefs.setString('language', language);
      _language = language;
    }

    // Only create version if explicitly requested
    if (createVersion && _userId != null) {
      final versionSnapshot = {
        'name': _name,
        'city': _city,
        'country': _country,
        'gender': _gender,
        'birthDate': _birthDate?.toString(),
        'birthTime': _birthTime?.toString(),
        'profileImageUrl': _profileImageUrl,
        'latitude': _latitude,
        'longitude': _longitude,
        'timezone': _timezone,
        'dst': _dst,
        'state': _state,
        'updatedAt': DateTime.now().toString(),
        'version': 'local', // Mark as local version
      };

      _versionHistory.add(versionSnapshot);

      // Don't limit locally - rely on backend to manage versions
      await prefs.setString('versionHistory', json.encode(_versionHistory));
    }

    await prefs.setString('userId', userId);
    if (name != null) await prefs.setString('name', name);
    if (city != null) await prefs.setString('city', city);
    if (country != null) await prefs.setString('country', country);
    if (gender != null) await prefs.setString('gender', gender);
    if (profileImageUrl != null) {
      await prefs.setString('profileImageUrl', profileImageUrl);
    }
    if (latitude != null) await prefs.setDouble('latitude', latitude);
    if (longitude != null) await prefs.setDouble('longitude', longitude);
    if (timezone != null) await prefs.setDouble('timezone', timezone);
    if (dst != null) await prefs.setDouble('dst', dst);
    if (state != null) await prefs.setString('state', state);

    if (birthDate != null) {
      await prefs.setString(
        'birthDate',
        '${birthDate.year}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}',
      );
    }

    if (birthTime != null) {
      await prefs.setString(
        'birthTime',
        '${birthTime.hour.toString().padLeft(2, '0')}:${birthTime.minute.toString().padLeft(2, '0')}',
      );
    }

    _userId = userId;
    _name = name;
    _city = city;
    _country = country;
    _gender = gender;
    _birthDate = birthDate;
    _birthTime = birthTime;
    _profileImageUrl = profileImageUrl;
    _latitude = latitude;
    _longitude = longitude;
    _timezone = timezone;
    _dst = dst;
    _state = state;

    notifyListeners();
  }

  void clearVersionHistory() {
    _versionHistory = [];
    notifyListeners();
  }

  Future<void> syncLanguageToBackend(String userId, String language) async {
    try {
      final url = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/update-language',
      );
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId, 'language': language}),
      );

      if (response.statusCode == 200) {
        debugPrint("✅ Language synced to backend successfully");
      } else {
        debugPrint("❌ Failed to sync language to backend");
      }
    } catch (e) {
      debugPrint("🔴 Error syncing language to backend: $e");
    }
  }
}
