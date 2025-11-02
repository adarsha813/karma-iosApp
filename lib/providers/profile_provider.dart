import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/environment.dart';

/// Secure keys for storage
class _StorageKeys {
  static const String userId = 'secure_user_id';
  static const String token = 'secure_auth_token';
  static const String language = 'app_language';
  static const String profileData = 'encrypted_profile_data';
  static const String versionHistory = 'secure_version_history';

  // Prevent instantiation
  _StorageKeys._();
}

/// Error types for profile operations
enum ProfileErrorType {
  networkError,
  authenticationError,
  storageError,
  dataCorruption,
  versionMismatch,
  unknownError,
}

class ProfileException implements Exception {
  final ProfileErrorType type;
  final String message;
  final dynamic underlyingError;

  const ProfileException({
    required this.type,
    required this.message,
    this.underlyingError,
  });

  @override
  String toString() => 'ProfileException($type): $message';
}

/// Profile data model for type safety
class ProfileData {
  final String userId;
  final String? name;
  final String? city;
  final String? country;
  final String? gender;
  final DateTime? birthDate;
  final TimeOfDay? birthTime;
  final String? profileImageUrl;
  final double? latitude;
  final double? longitude;
  final double? timezone;
  final double? dst;
  final String? state;
  final String language;

  const ProfileData({
    required this.userId,
    this.name,
    this.city,
    this.country,
    this.gender,
    this.birthDate,
    this.birthTime,
    this.profileImageUrl,
    this.latitude,
    this.longitude,
    this.timezone,
    this.dst,
    this.state,
    this.language = 'en',
  });

  ProfileData copyWith({
    String? userId,
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
  }) {
    return ProfileData(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      city: city ?? this.city,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthTime: birthTime ?? this.birthTime,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      dst: dst ?? this.dst,
      state: state ?? this.state,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'city': city,
      'country': country,
      'gender': gender,
      'birthDate': birthDate?.toIso8601String(),
      'birthTime':
          birthTime != null
              ? '${birthTime!.hour.toString().padLeft(2, '0')}:${birthTime!.minute.toString().padLeft(2, '0')}'
              : null,
      'profileImageUrl': profileImageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'timezone': timezone,
      'dst': dst,
      'state': state,
      'language': language,
    };
  }

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    DateTime? parseBirthDate(String? dateString) {
      if (dateString == null) return null;
      try {
        return DateTime.parse(dateString);
      } catch (e) {
        return null;
      }
    }

    TimeOfDay? parseBirthTime(String? timeString) {
      if (timeString == null) return null;
      try {
        final parts = timeString.split(':');
        if (parts.length == 2) {
          return TimeOfDay(
            hour: int.parse(parts[0]),
            minute: int.parse(parts[1]),
          );
        }
      } catch (e) {
        // Ignore parsing errors
      }
      return null;
    }

    return ProfileData(
      userId: json['userId'] as String,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
      birthDate: parseBirthDate(json['birthDate'] as String?),
      birthTime: parseBirthTime(json['birthTime'] as String?),
      profileImageUrl: json['profileImageUrl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: (json['timezone'] as num?)?.toDouble(),
      dst: (json['dst'] as num?)?.toDouble(),
      state: json['state'] as String?,
      language: json['language'] as String? ?? 'en',
    );
  }
}

class ProfileProvider with ChangeNotifier {
  static final ProfileProvider _instance = ProfileProvider._internal();
  factory ProfileProvider() => _instance;
  ProfileProvider._internal();

  // Secure storage configuration
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.passcode),
  );

  // Current profile state
  ProfileData? _currentProfile;
  String? _token;
  bool _isInitialized = false;
  bool _isLoading = false;
  String? _lastError;
  ProfileErrorType? _lastErrorType;

  // Version history
  final List<Map<String, dynamic>> _versionHistory = [];
  final StreamController<ProfileData> _profileUpdatesController =
      StreamController<ProfileData>.broadcast();

  // Getters
  ProfileData? get currentProfile => _currentProfile;
  String? get token => _token;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get lastError => _lastError;
  ProfileErrorType? get lastErrorType => _lastErrorType;
  List<Map<String, dynamic>> get versionHistory =>
      List.unmodifiable(_versionHistory);
  Stream<ProfileData> get profileUpdates => _profileUpdatesController.stream;

  // Convenience getters
  String? get userId => _currentProfile?.userId;
  String? get name => _currentProfile?.name;
  String? get city => _currentProfile?.city;
  String? get country => _currentProfile?.country;
  String? get gender => _currentProfile?.gender;
  DateTime? get birthDate => _currentProfile?.birthDate;
  TimeOfDay? get birthTime => _currentProfile?.birthTime;
  String? get profileImageUrl => _currentProfile?.profileImageUrl;
  double? get latitude => _currentProfile?.latitude;
  double? get longitude => _currentProfile?.longitude;
  double? get timezone => _currentProfile?.timezone;
  double? get dst => _currentProfile?.dst;
  String? get state => _currentProfile?.state;
  String get language => _currentProfile?.language ?? 'en';

  /// Check if profile is complete for onboarding
  bool get isProfileComplete {
    return _currentProfile != null &&
        _currentProfile!.name != null &&
        _currentProfile!.name!.isNotEmpty &&
        _currentProfile!.city != null &&
        _currentProfile!.city!.isNotEmpty &&
        _currentProfile!.country != null &&
        _currentProfile!.country!.isNotEmpty &&
        _currentProfile!.birthDate != null &&
        _currentProfile!.birthTime != null;
  }

  /// Main initialization method
  Future<void> initialize() async {
    if (_isInitialized) return;

    _isLoading = true;
    _lastError = null;
    _lastErrorType = null;
    notifyListeners();

    try {
      await _performInitialization();
      _isInitialized = true;
      debugPrint('✅ ProfileProvider initialized successfully');
    } on ProfileException catch (e) {
      _lastError = e.message;
      _lastErrorType = e.type;
      debugPrint('❌ ProfileProvider initialization failed: ${e.message}');
      // Still mark as initialized to prevent blocking the app
      _isInitialized = true;
    } catch (e, stackTrace) {
      _lastError = 'Unexpected initialization error: $e';
      _lastErrorType = ProfileErrorType.unknownError;
      debugPrint('🔴 Critical initialization error: $e\n$stackTrace');
      _isInitialized = true; // Don't block the app
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _performInitialization() async {
    // Load secure data first
    await _loadSecureData();

    // Load profile data
    await _loadProfileData();

    // Validate consistency
    await _validateDataConsistency();

    // Sync with backend if needed
    if (_currentProfile != null && _token != null) {
      await _syncWithBackend();
    }
  }

  Future<void> _loadSecureData() async {
    try {
      final storedUserId = await _secureStorage.read(key: _StorageKeys.userId);
      final storedToken = await _secureStorage.read(key: _StorageKeys.token);

      if (storedUserId != null) {
        _currentProfile = ProfileData(userId: storedUserId);
        debugPrint('✅ Loaded user ID from secure storage');
      }

      _token = storedToken;
      debugPrint(
        '✅ Loaded token from secure storage: ${_token != null ? 'Present (${_token!.length} chars)' : 'NULL'}',
      );
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to load secure data',
        underlyingError: e,
      );
    }
  }

  Future<void> _loadProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load language preference
      final language = prefs.getString(_StorageKeys.language) ?? 'en';

      // Load profile data if user exists
      if (_currentProfile != null) {
        final profileJson = prefs.getString(_StorageKeys.profileData);
        if (profileJson != null) {
          try {
            final profileMap = jsonDecode(profileJson) as Map<String, dynamic>;
            _currentProfile = ProfileData.fromJson(
              profileMap,
            ).copyWith(language: language);
            debugPrint('✅ Loaded profile data from local storage');
          } catch (e) {
            debugPrint('⚠️ Corrupted profile data, starting fresh');
            // Continue with basic profile
          }
        }

        // Load version history
        await _loadVersionHistory();
      } else {
        // No user ID, set default language
        _currentProfile = ProfileData(
          userId: 'temp_${DateTime.now().millisecondsSinceEpoch}',
          language: language,
        );
      }
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to load profile data',
        underlyingError: e,
      );
    }
  }

  Future<void> _validateDataConsistency() async {
    if (_currentProfile == null) return;

    // Validate that user ID exists in both secure storage and profile data
    final secureUserId = await _secureStorage.read(key: _StorageKeys.userId);
    if (secureUserId != _currentProfile!.userId) {
      debugPrint('⚠️ User ID mismatch detected, resetting profile');
      await clearProfile();
      throw ProfileException(
        type: ProfileErrorType.dataCorruption,
        message: 'User ID consistency check failed',
      );
    }
  }

  /// Save or update user ID
  Future<void> saveUserId(String newUserId) async {
    if (_currentProfile?.userId == newUserId) return;

    try {
      // Save to secure storage
      await _secureStorage.write(key: _StorageKeys.userId, value: newUserId);

      // Update current profile
      _currentProfile = (_currentProfile ?? ProfileData(userId: newUserId))
          .copyWith(userId: newUserId);

      // Clear old token when user changes
      await _secureStorage.delete(key: _StorageKeys.token);
      _token = null;

      // Fetch new token
      await fetchAndSaveToken(newUserId);

      debugPrint('✅ User ID saved and token refreshed');
      notifyListeners();
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to save user ID',
        underlyingError: e,
      );
    }
  }

  /// Save authentication token
  Future<void> saveToken(String newToken) async {
    try {
      await _secureStorage.write(key: _StorageKeys.token, value: newToken);
      _token = newToken;
      debugPrint('✅ Token saved securely');
      notifyListeners();
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to save token',
        underlyingError: e,
      );
    }
  }

  /// Save language preference
  Future<void> saveLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_StorageKeys.language, languageCode);

      _currentProfile =
          _currentProfile?.copyWith(language: languageCode) ??
          ProfileData(userId: 'temp', language: languageCode);

      // Sync to backend if user is authenticated
      if (_currentProfile?.userId != null &&
          _currentProfile!.userId.startsWith('user_') &&
          _token != null) {
        await _updateLanguageOnBackend(languageCode);
      }

      notifyListeners();
      debugPrint('✅ Language saved: $languageCode');
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to save language',
        underlyingError: e,
      );
    }
  }

  /// Update full profile
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
    _isLoading = true;
    notifyListeners();

    try {
      // Create new profile data
      final newProfile = ProfileData(
        userId: userId,
        name: name,
        city: city,
        country: country,
        gender: gender,
        birthDate: birthDate,
        birthTime: birthTime,
        profileImageUrl: profileImageUrl,
        latitude: latitude,
        longitude: longitude,
        timezone: timezone,
        dst: dst,
        state: state,
        language: language ?? _currentProfile?.language ?? 'en',
      );

      // Save to local storage
      await _saveProfileToLocalStorage(newProfile);

      // Create version snapshot if requested
      if (createVersion && _currentProfile != null) {
        await _createVersionSnapshot();
      }

      // Update current instance
      _currentProfile = newProfile;

      // Sync to backend if authenticated
      if (_token != null && !userId.startsWith('default_')) {
        await _syncProfileToBackend(newProfile);
      }

      // Notify listeners and stream
      _profileUpdatesController.add(newProfile);
      debugPrint('✅ Profile saved successfully');
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to save profile',
        underlyingError: e,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveProfileToLocalStorage(ProfileData profile) async {
    final prefs = await SharedPreferences.getInstance();

    // Save basic profile data
    await prefs.setString(
      _StorageKeys.profileData,
      jsonEncode(profile.toJson()),
    );

    // Save user ID to secure storage if different
    if (await _secureStorage.read(key: _StorageKeys.userId) != profile.userId) {
      await _secureStorage.write(
        key: _StorageKeys.userId,
        value: profile.userId,
      );
    }

    // Save language preference
    await prefs.setString(_StorageKeys.language, profile.language);
  }

  Future<void> _createVersionSnapshot() async {
    try {
      final snapshot = {
        ..._currentProfile!.toJson(),
        'updatedAt': DateTime.now().toIso8601String(),
        'versionId': 'v_${DateTime.now().millisecondsSinceEpoch}',
      };

      _versionHistory.add(snapshot);

      // Keep only last 50 versions
      if (_versionHistory.length > 50) {
        _versionHistory.removeAt(0);
      }

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _StorageKeys.versionHistory,
        jsonEncode(_versionHistory),
      );
    } catch (e) {
      debugPrint('⚠️ Failed to create version snapshot: $e');
    }
  }

  /// Load version history
  Future<void> _loadVersionHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString(_StorageKeys.versionHistory);

      if (historyJson != null) {
        final historyList = jsonDecode(historyJson) as List;
        _versionHistory.clear();
        _versionHistory.addAll(historyList.cast<Map<String, dynamic>>());
        debugPrint('✅ Loaded ${_versionHistory.length} version histories');
      }
    } catch (e) {
      debugPrint('⚠️ Failed to load version history: $e');
      _versionHistory.clear();
    }
  }

  /// Fetch and save token from backend
  Future<void> fetchAndSaveToken(String userId) async {
    try {
      final url = Uri.parse('${Environment.baseUrl}/api/auth/generate-token');

      final response = await http
          .post(
            url,
            headers: Environment.securityHeaders,
            body: jsonEncode({'userId': userId}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'] as String?;

        if (token != null) {
          await saveToken(token);
          debugPrint('✅ Token fetched and saved successfully');
        } else {
          throw ProfileException(
            type: ProfileErrorType.authenticationError,
            message: 'Invalid token response from server',
          );
        }
      } else {
        throw ProfileException(
          type: ProfileErrorType.networkError,
          message: 'Failed to fetch token: ${response.statusCode}',
        );
      }
    } on TimeoutException {
      throw ProfileException(
        type: ProfileErrorType.networkError,
        message: 'Token request timed out',
      );
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.networkError,
        message: 'Failed to fetch token: $e',
        underlyingError: e,
      );
    }
  }

  /// Sync profile with backend
  Future<void> _syncProfileToBackend(ProfileData profile) async {
    if (_token == null) return;

    try {
      final url = Uri.parse('${Environment.baseUrl}/api/profile/update');

      final response = await http
          .post(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_token',
            },
            body: jsonEncode(profile.toJson()),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        debugPrint('✅ Profile synced to backend successfully');
      } else if (response.statusCode == 401) {
        throw ProfileException(
          type: ProfileErrorType.authenticationError,
          message: 'Authentication failed during sync',
        );
      } else {
        debugPrint('⚠️ Backend sync failed: ${response.statusCode}');
        // Don't throw error for sync failures - local data is primary
      }
    } on TimeoutException {
      debugPrint('⚠️ Backend sync timed out');
    } catch (e) {
      debugPrint('⚠️ Backend sync error: $e');
      // Don't throw error - local data is primary
    }
  }

  /// Update language on backend
  Future<void> _updateLanguageOnBackend(String languageCode) async {
    if (_token == null || _currentProfile == null) return;

    try {
      final url = Uri.parse(
        '${Environment.baseUrl}/api/profile/update-language',
      );

      await http
          .post(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_token',
            },
            body: jsonEncode({
              'userId': _currentProfile!.userId,
              'language': languageCode,
            }),
          )
          .timeout(const Duration(seconds: 10));

      debugPrint('✅ Language updated on backend');
    } on TimeoutException {
      debugPrint('⚠️ Language update timed out');
    } catch (e) {
      debugPrint('⚠️ Language update error: $e');
    }
  }

  /// Sync with backend (for initialization)
  Future<void> _syncWithBackend() async {
    if (_token == null || _currentProfile == null) return;

    try {
      // Fetch latest profile from backend
      final url = Uri.parse(
        '${Environment.baseUrl}/api/profile/get-profile?userId=${_currentProfile!.userId}',
      );

      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_token',
            },
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final backendProfile = data['profile'];

        if (backendProfile != null) {
          // Merge backend data with local data (backend wins conflicts)
          await _mergeWithBackendData(backendProfile);
          debugPrint('✅ Successfully synced with backend');
        }
      }
    } on TimeoutException {
      debugPrint('⚠️ Backend sync timed out during initialization');
    } catch (e) {
      debugPrint('⚠️ Backend sync failed during initialization: $e');
    }
  }

  Future<void> _mergeWithBackendData(Map<String, dynamic> backendData) async {
    // Implement merge logic based on your requirements
    // For now, we'll prioritize local data but update version history
    if (backendData['versions'] != null) {
      await _updateVersionHistoryFromBackend(backendData['versions']);
    }
  }

  Future<void> _updateVersionHistoryFromBackend(
    List<dynamic> backendVersions,
  ) async {
    try {
      final backendHistory =
          backendVersions
              .map((v) => _parseBackendVersion(v))
              .where((v) => v != null)
              .cast<Map<String, dynamic>>()
              .toList();

      // Merge with local history, removing duplicates
      final mergedHistory = [..._versionHistory, ...backendHistory];

      // Remove duplicates based on versionId or timestamp
      final uniqueHistory = <Map<String, dynamic>>[];
      final seenIds = <String>{};

      for (final version in mergedHistory) {
        final id =
            version['versionId'] as String? ?? version['updatedAt'] as String;
        if (!seenIds.contains(id)) {
          seenIds.add(id);
          uniqueHistory.add(version);
        }
      }

      // Sort by timestamp (newest first)
      uniqueHistory.sort((a, b) {
        final aTime = DateTime.parse(a['updatedAt'] as String);
        final bTime = DateTime.parse(b['updatedAt'] as String);
        return bTime.compareTo(aTime);
      });

      _versionHistory
        ..clear()
        ..addAll(uniqueHistory.take(50)); // Keep only 50 most recent

      // Save merged history
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _StorageKeys.versionHistory,
        jsonEncode(_versionHistory),
      );

      debugPrint('✅ Version history merged with backend');
    } catch (e) {
      debugPrint('⚠️ Failed to merge version history: $e');
    }
  }

  Map<String, dynamic>? _parseBackendVersion(dynamic versionData) {
    try {
      // Implement your backend version parsing logic here
      return {
        'versionId': versionData['_id']?.toString(),
        'updatedAt':
            versionData['updatedAt']?.toString() ??
            DateTime.now().toIso8601String(),
        // Add other fields as needed
      };
    } catch (e) {
      debugPrint('⚠️ Failed to parse backend version: $e');
      return null;
    }
  }

  /// Create default profile for anonymous users
  Future<void> createDefaultProfile() async {
    if (_currentProfile != null &&
        !_currentProfile!.userId.startsWith('default_')) {
      return; // Don't create if already has a proper profile
    }

    final defaultUserId = 'default_${DateTime.now().millisecondsSinceEpoch}';

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

  /// Clear all profile data (logout)
  Future<void> clearProfile() async {
    try {
      // Clear secure storage
      await _secureStorage.deleteAll();

      // Clear shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Reset state
      _currentProfile = null;
      _token = null;
      _versionHistory.clear();
      _lastError = null;
      _lastErrorType = null;

      debugPrint('✅ Profile cleared successfully');
      notifyListeners();
    } catch (e) {
      throw ProfileException(
        type: ProfileErrorType.storageError,
        message: 'Failed to clear profile',
        underlyingError: e,
      );
    }
  }

  /// Debug method for development
  void debugTokenState() {
    debugPrint('''
🔄 ProfileProvider Debug State:
   - User ID: ${_currentProfile?.userId ?? 'NULL'}
   - Token: ${_token != null ? "✅ Present (${_token!.length} chars)" : "❌ NULL"}
   - Is Initialized: $_isInitialized
   - Is Loading: $_isLoading
   - Profile Complete: $isProfileComplete
   - Language: ${_currentProfile?.language}
   - Last Error: ${_lastError ?? 'None'}
   - Version History: ${_versionHistory.length} entries
''');
  }

  /// Dispose method
  @override
  void dispose() {
    _profileUpdatesController.close();
    super.dispose();
  }

  void refreshProfile() {
    notifyListeners(); // ✅ safe here
  }
}
