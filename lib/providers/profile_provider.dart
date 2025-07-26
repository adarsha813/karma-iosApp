import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // <--- Add this

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

  Future<void> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');
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

    // Load version history if available
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
    print('➡️ Starting loadToken');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    print('🛠️ Loaded token in ProfileProvider: $_token'); // <-- print here
    notifyListeners();
    print('⬅️ Finished loadToken');
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    _token = token;
    notifyListeners();
  }

  Future<void> saveUserId(String newUserId) async {
    // Only proceed if the userId actually changes
    if (_userId == newUserId) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', newUserId);

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

  // Add inside ProfileProvider
  Future<void> fetchAndSaveToken(String userId) async {
    final url = Uri.parse(
      "https://chat-backend-rvk9.onrender.com/api/auth/generate-token",
    ); // Change to production URL later

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId}),
      );

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['token'];
        print('✅ Token from backend: $token');
        await saveToken(token);
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
    Map<String, dynamic>? previousVersion,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Create a version snapshot before updating
    if (previousVersion == null && _userId != null) {
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
      };

      _versionHistory.add(versionSnapshot);

      // Keep only last 5 versions
      if (_versionHistory.length > 5) {
        _versionHistory.removeAt(0);
      }

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
}
