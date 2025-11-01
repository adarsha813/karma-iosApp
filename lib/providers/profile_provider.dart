import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:math';

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
  String? _language;
  String? _token;
  bool _isInitialized = false;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

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
  String? get language => _language;
  String? get token => _token;
  bool get isInitialized => _isInitialized;

  // Initialize method for main.dart
  Future<void> initialize() async {
    try {
      await loadUserId();
      await loadToken();
      await loadLanguage();
      await loadProfileData();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing ProfileProvider: $e');
      _isInitialized =
          true; // Still mark as initialized even if there's an error
      notifyListeners();
    }
  }

  // Language methods
  Future<void> saveLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
    _language = langCode;
    notifyListeners();
  }

  void setLanguage(String langCode) {
    _language = langCode;
    notifyListeners();
  }

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
        debugPrint("✅ Language updated on backend");
      } else {
        debugPrint("❌ Failed to update language: ${response.body}");
      }
    } catch (e) {
      debugPrint("🔴 Error updating language: $e");
    }
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'en';
    notifyListeners();
  }

  // Token methods
  Future<void> loadToken() async {
    debugPrint('➡️ Starting secure loadToken');
    _token = await _secureStorage.read(key: 'token');
    debugPrint('🛠️ Loaded token from secure storage: $_token');
    notifyListeners();
    debugPrint('⬅️ Finished loadToken');
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
    _token = token;
    notifyListeners();
  }

  // User ID methods
  Future<void> saveUserId(String newUserId) async {
    if (_userId == newUserId) return;

    await _secureStorage.write(key: 'userId', value: newUserId);
    _userId = newUserId;

    // Clear old profile data when ID changes
    _clearProfileData();

    notifyListeners();
    await fetchAndSaveToken(newUserId);
  }

  Future<void> loadUserId() async {
    _userId = await _secureStorage.read(key: 'userId');
    notifyListeners();
  }

  // Profile data methods
  Future<void> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load basic profile data
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
      await _loadVersionHistoryFromLocal();
    }

    // Parse birth date
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

    // Parse birth time
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
    bool createVersion = false,
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
        'version': 'local',
      };

      _versionHistory.add(versionSnapshot);
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

    // Update current instance
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

  // Version history methods
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
        await _loadVersionHistoryFromLocal();
      }
    } catch (e) {
      debugPrint('🔴 Error fetching version history: $e');
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

  void clearVersionHistory() {
    _versionHistory = [];
    notifyListeners();
  }

  // Token generation
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
        debugPrint('✅ Token from backend: $token');
        await saveToken(token);
      } else {
        debugPrint('❌ Failed to get token: ${response.body}');
      }
    } catch (e) {
      debugPrint('🔴 Error generating token: $e');
    }
  }

  // Backend sync methods
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

  // Clear profile
  Future<void> clearProfile() async {
    _clearProfileData();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await _secureStorage.delete(key: 'userId');
    await _secureStorage.delete(key: 'token');

    notifyListeners();
  }

  // Helper method to clear profile data
  void _clearProfileData() {
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
    _language = 'en'; // Reset to default language
  }

  // Check if profile is complete (for onboarding flow)
  bool get isProfileComplete {
    return _name != null &&
        _name!.isNotEmpty &&
        _city != null &&
        _city!.isNotEmpty &&
        _country != null &&
        _country!.isNotEmpty &&
        _birthDate != null &&
        _birthTime != null;
  }

  // Create a default profile for users without login
  Future<void> createDefaultProfile() async {
    if (_userId != null) return; // Don't create if already exists

    final defaultUserId =
        'default_user_${DateTime.now().millisecondsSinceEpoch}';
    await saveUserId(defaultUserId);

    // Set default values
    await saveFullProfile(
      userId: defaultUserId,
      name: 'User',
      city: 'New York',
      country: 'USA',
      gender: 'other',
      birthDate: DateTime(1990, 1, 1),
      birthTime: const TimeOfDay(hour: 12, minute: 0),
      language: 'en',
    );

    debugPrint('✅ Default profile created: $defaultUserId');
  }

  void debugTokenState() {
    debugPrint('''
🔄 ProfileProvider Token Debug:
   - User ID: $_userId
   - Token: ${_token != null ? "✅ Present (length: ${_token!.length})" : "❌ NULL"}
   - Is Initialized: $_isInitialized
   - Token Preview: ${_token != null ? _token!.substring(0, min(20, _token!.length)) + "..." : "N/A"}
''');
  }
}
