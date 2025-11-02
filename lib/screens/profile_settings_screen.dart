import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart'; // for sha256
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../l10n/app_localizations.dart';
import '../widgets/Avaterloder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kundali/config/environment.dart';
import 'package:kundali/services/profile_service.dart';
import '../utils/security_utils.dart';
import '../utils/error_handler.dart';
import 'dart:math'; // for Random()
import 'package:device_info_plus/device_info_plus.dart';
import 'package:kundali/services/fcm_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  File? _image;
  String? _profileImageUrl;
  String? _gender = '';
  Timer? _reloadTimer;
  bool _isLoading = false;
  bool _showHistory = false;
  String? _selectedCountry;
  double? _latitude;
  double? _longitude;
  double? _timezone;
  double? _dst;
  String? _state;
  bool _isSaving = false;
  DateTime? _lastSaveAttempt;

  static const _minSaveInterval = Duration(seconds: 2);
  bool _canSave() {
    final now = DateTime.now();
    if (_lastSaveAttempt != null) {
      final difference = now.difference(_lastSaveAttempt!);
      if (difference < _minSaveInterval) {
        ErrorHandler.showErrorSnackbar(
          context,
          'Please wait before saving again',
        );
        return false;
      }
    }
    _lastSaveAttempt = now;
    return true;
  }

  // Security & Validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _debounceTimer = const Duration(milliseconds: 800);
  final _logger = Logger(); // local logger for this file
  Timer? _validationTimer;
  Timer? _citySearchDebounce;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _validationTimer?.cancel();
    _reloadTimer?.cancel();
    _validationTimer = null;
    _reloadTimer = null;
    _citySearchDebounce?.cancel();

    _nameController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _userIdController.dispose();

    super.dispose();
  }

  Future<void> _initializeData() async {
    try {
      await _loadSavedProfileData();

      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      if (_userIdController.text.isNotEmpty) {
        // Backend sync happens automatically in secured ProfileProvider
        _logger.d('🌐 Language initialized: ${profileProvider.language}');
      }
    } catch (e, stack) {
      ErrorHandler.recordError(
        e,
        stackTrace: stack,
        context: 'ProfileInitialization',
      );

      if (mounted) {
        ErrorHandler.showErrorSnackbar(
          context,
          'Failed to initialize profile data',
        );
      }
    }
  }

  void _onUserIdChanged() {
    _validationTimer?.cancel();
    _validationTimer = Timer(_debounceTimer, () {
      // Add mounted check
      if (!mounted) return;

      final newUserId = _userIdController.text.trim();
      if (newUserId.isNotEmpty && SecurityUtils.isValidUserId(newUserId)) {
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        profileProvider.saveUserId(newUserId);
        _loadProfileData();
      }
    });
  }

  Future<void> _pickImage() async {
    try {
      final picked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 70,
        requestFullMetadata: false,
      );

      if (picked != null) {
        final file = File(picked.path);
        final stat = await file.stat();

        // Validate file size
        if (stat.size > 2 * 1024 * 1024) {
          ErrorHandler.showErrorSnackbar(
            context,
            'Image size must be less than 2MB',
          );
          return;
        }

        // Validate file extension
        if (!SecurityUtils.isValidFileType(picked.path, [
          'jpg',
          'jpeg',
          'png',
          'gif',
        ])) {
          ErrorHandler.showErrorSnackbar(
            context,
            'Invalid image format. Please use JPG, PNG, or GIF',
          );
          return;
        }

        // Validate image type by signature
        final bytes = await file.readAsBytes();
        if (bytes.length < 4 ||
            !(_isJpeg(bytes) || _isPng(bytes) || _isGif(bytes))) {
          ErrorHandler.showErrorSnackbar(
            context,
            'Invalid image file. Please use a valid image',
          );
          return;
        }

        final compressedImage = await _compressImage(file);
        if (mounted) {
          setState(() => _image = compressedImage);
        }
      }
    } catch (e, stack) {
      ErrorHandler.recordError(e, stackTrace: stack, context: 'ImagePicker');
      if (mounted) {
        ErrorHandler.showErrorSnackbar(context, 'Failed to pick image');
      }
    }
  }

  bool _isJpeg(List<int> bytes) => bytes[0] == 0xFF && bytes[1] == 0xD8;
  bool _isPng(List<int> bytes) =>
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47;
  bool _isGif(List<int> bytes) =>
      bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46;

  Future<File> _compressImage(File imageFile) async {
    try {
      // For production, integrate flutter_image_compress
      // For now, validate and return original with size check
      final stat = await imageFile.stat();
      if (stat.size > 2 * 1024 * 1024) {
        throw ImageException('Image too large after compression');
      }
      return imageFile;
    } catch (e, stack) {
      ErrorHandler.recordError(
        e,
        stackTrace: stack,
        context: 'ImageCompression',
      );

      return imageFile;
    }
  }

  Future<ValidationResult> _validateProfileBeforeSave() async {
    if (!_formKey.currentState!.validate()) {
      return ValidationResult.invalid('Please fix the validation errors');
    }

    final name = _nameController.text.trim();
    if (name.isEmpty) {
      return ValidationResult.invalid('Name is required');
    }

    if (SecurityUtils.containsSuspiciousPatterns(name)) {
      return ValidationResult.invalid(
        'Invalid name: contains suspicious characters',
      );
    }

    if (_selectedDate == null) {
      return ValidationResult.invalid('Birth date is required');
    }

    if (_selectedDate!.isAfter(DateTime.now())) {
      return ValidationResult.invalid('Birth date cannot be in the future');
    }

    if (_selectedTime == null) {
      return ValidationResult.invalid('Birth time is required');
    }

    if (_gender == null || _gender!.isEmpty) {
      return ValidationResult.invalid('Gender is required');
    }

    final city = _cityController.text.trim();
    if (city.isEmpty) {
      return ValidationResult.invalid('City is required');
    }

    if (SecurityUtils.containsSuspiciousPatterns(city)) {
      return ValidationResult.invalid(
        'Invalid city: contains suspicious characters',
      );
    }

    if (_countryController.text.trim().isEmpty) {
      return ValidationResult.invalid('Country is required');
    }

    return ValidationResult.valid();
  }

  Future<void> _saveProfile(BuildContext context) async {
    // Rate limiting
    if (!_canSave()) return;
    if (_isSaving) return;

    // Validation
    if (!_validateRequiredFields()) return;

    final validationResult = await _validateProfileBeforeSave();
    if (!validationResult.isValid) {
      ErrorHandler.showErrorSnackbar(context, validationResult.errorMessage!);
      return;
    }

    if (!mounted) return;
    setState(() => _isSaving = true);

    try {
      final profileData = await _prepareProfileData();

      // Add timeout to prevent hanging
      final saveResult = await _executeProfileSave(profileData).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          return SaveProfileResult(success: false, message: 'Request timeout');
        },
      );

      if (saveResult.success) {
        // Secure userId extraction
        String? userId = await _extractUserIdSecurely(saveResult.data);

        // Send FCM token (non-blocking, don't fail profile save if this fails)
        if (userId != null && userId.isNotEmpty) {
          _sendFcmTokenSafely(userId);
        }

        await _handleSuccessfulSave(saveResult.data, context);
      } else {
        ErrorHandler.showErrorSnackbar(
          context,
          saveResult.message ?? 'Failed to save profile',
        );
      }
    } catch (e, stack) {
      ErrorHandler.recordError(e, stackTrace: stack, context: 'ProfileSave');
      ErrorHandler.showErrorSnackbar(
        context,
        ErrorHandler.getUserFriendlyMessage(
          e is Exception ? e : Exception('Unexpected error: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  // Secure userId extraction
  Future<String?> _extractUserIdSecurely(Map<String, dynamic>? saveData) async {
    String? userId;

    // 1. From save result
    if (saveData != null) {
      final responseData = saveData['data'] ?? saveData;
      userId = responseData['userId']?.toString();

      // Sanitize
      if (userId != null) {
        userId = SecurityUtils.sanitizeInput(userId);
        if (!SecurityUtils.isValidUserId(userId)) {
          userId = null; // Reset if invalid
        }
      }
    }

    // 2. From controller (sanitized)
    if (userId == null || userId.isEmpty) {
      userId = SecurityUtils.sanitizeInput(_userIdController.text.trim());
      if (!SecurityUtils.isValidUserId(userId)) {
        userId = null;
      }
    }

    // 3. From profile provider
    if (userId == null || userId.isEmpty) {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      userId = profileProvider.userId;
      if (userId != null) {
        userId = SecurityUtils.sanitizeInput(userId);
        if (!SecurityUtils.isValidUserId(userId)) {
          userId = null;
        }
      }
    }

    return userId;
  }

  // Safe FCM token sending (non-blocking)
  // Safe FCM token sending (non-blocking) - UPDATED VERSION
  Future<void> _sendFcmTokenSafely(String userId) async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null && token.isNotEmpty) {
        // Use the new service with retry mechanism
        final result = await FCMTokenService.registerWithRetry(
          userId: userId,
          token: token,
          maxRetries: 2,
        );

        if (result.success) {
          _logger.i('📡 FCM token successfully sent to backend');
        } else {
          _logger.w('⚠️ FCM token send failed: ${result.error}');
          // Don't throw - FCM failure shouldn't block profile save
        }
      }
    } catch (e, stack) {
      // Log but don't throw - FCM failure shouldn't block profile save
      _logger.e('⚠️ FCM token send failed (non-critical): $e');
      ErrorHandler.recordError(e, stackTrace: stack, context: 'FCMNonCritical');
    }
  }

  // Remove the old _isValidFcmToken method since it's now in FCMTokenService

  Future<SaveProfileResult> _executeProfileSave(
    Map<String, dynamic> profileData,
  ) async {
    try {
      final result = await ProfileService.saveProfile(profileData);

      if (result['success'] == true) {
        return SaveProfileResult(
          success: true,
          data: result['data'] ?? result, // Handle both response structures
        );
      } else {
        return SaveProfileResult(
          success: false,
          message: result['error'] ?? 'Save failed',
        );
      }
    } catch (e, stack) {
      ErrorHandler.recordError(
        e,
        stackTrace: stack,
        context: 'ProfileServiceFallback',
      );

      try {
        final directResult = await _sendProfileToBackend(profileData);
        return SaveProfileResult(
          success: directResult['success'],
          message: directResult['message'],
          data: directResult['data'],
        );
      } catch (fallbackError, stack) {
        ErrorHandler.recordError(
          fallbackError,
          stackTrace: stack,
          context: 'DirectProfileSave',
        );
        return SaveProfileResult(success: false, message: 'Network error');
      }
    }
  }

  bool _validateRequiredFields() {
    if (_nameController.text.trim().isEmpty) {
      ErrorHandler.showErrorSnackbar(context, 'Name is required');
      return false;
    }

    if (_selectedDate == null) {
      ErrorHandler.showErrorSnackbar(context, 'Birth date is required');
      return false;
    }

    if (_selectedTime == null) {
      ErrorHandler.showErrorSnackbar(context, 'Birth time is required');
      return false;
    }

    if (_gender == null || _gender!.isEmpty) {
      ErrorHandler.showErrorSnackbar(context, 'Gender is required');
      return false;
    }

    return true;
  }

  Future<Map<String, dynamic>> _prepareProfileData() async {
    String? base64Image;
    if (_image != null) {
      try {
        final bytes = await _image!.readAsBytes();
        if (bytes.length > 2 * 1024 * 1024) {
          throw ImageException('Image too large for upload');
        }
        base64Image = base64Encode(bytes);
        base64.decode(base64Image); // Validate base64
      } catch (e, stack) {
        ErrorHandler.recordError(
          e,
          stackTrace: stack,
          context: 'ImageEncoding',
        );
        throw ImageException('Failed to process image');
      }
    }

    // Generate or retrieve user ID internally
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    String? userId = await _getOrCreateUserId();

    if (_cityController.text.isNotEmpty && _countryController.text.isNotEmpty) {
      await _fetchLocationDetails(
        SecurityUtils.sanitizeInput(_cityController.text),
        SecurityUtils.sanitizeInput(_countryController.text),
      );
    }

    final savedLang = profileProvider.language;

    return {
      'userId': userId, // Always include userId internally
      'name': SecurityUtils.sanitizeInput(_nameController.text),
      'city': SecurityUtils.sanitizeInput(_cityController.text),
      'country': SecurityUtils.sanitizeInput(_countryController.text),
      'gender': _gender ?? '',
      'birthDate':
          _selectedDate != null
              ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}"
              : '',
      'birthTime':
          _selectedTime != null
              ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
              : '',
      'latitude': _latitude,
      'longitude': _longitude,
      'timezone': _timezone,
      'dst': _dst ?? 0.0,
      'state': _state,
      'profilePicture': base64Image,
      'language': savedLang,
      'timestamp': DateTime.now().toIso8601String(),
      'clientVersion': Environment.appVersion,
    };
  }

  // Internal user ID management
  Future<String> _getOrCreateUserId() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    // Try to load existing user ID

    String? existingUserId = profileProvider.userId;

    if (existingUserId != null && existingUserId.isNotEmpty) {
      return existingUserId;
    }

    // Generate new user ID based on device + profile data
    final newUserId = await _generateSecureUserId();
    await profileProvider.saveUserId(newUserId);
    return newUserId;
  }

  // Secure user ID generation
  Future<String> _generateSecureUserId() async {
    // Combine multiple factors to create a unique, non-predictable ID
    final random = Random.secure();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final nameHash =
        _nameController.text.isNotEmpty
            ? _nameController.text.hashCode.abs()
            : random.nextInt(999999);

    // Get device-specific identifier (you may need device_info_plus package)
    final deviceId = await _getDeviceIdentifier();

    // Create a hash of multiple factors
    final combinedString =
        '$timestamp$nameHash$deviceId${random.nextInt(999999)}';
    final bytes = utf8.encode(combinedString);
    final digest = sha256.convert(bytes);

    // Take first 12 characters of hash for reasonable length
    return digest.toString().substring(0, 12);
  }

  // Get device identifier (install device_info_plus package)
  Future<String> _getDeviceIdentifier() async {
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id; // ANDROID_ID
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'ios_device';
      }

      return 'unknown_device';
    } catch (e) {
      return 'error_device_${DateTime.now().millisecondsSinceEpoch}';
    }
  }

  Future<Map<String, dynamic>> _sendProfileToBackend(
    Map<String, dynamic> data,
  ) async {
    try {
      final uri = Uri.parse('${Environment.baseUrl}/api/profile/save-profile');
      final response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'X-Request-ID': _generateSecureRequestId(),
              ...Environment.securityHeaders,
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));

        // Handle different response structures
        if (responseData is Map) {
          // Ensure type is Map<String, dynamic>
          final Map<String, dynamic> typedResponse = Map<String, dynamic>.from(
            responseData,
          );

          if (typedResponse.containsKey('success')) {
            return typedResponse;
          } else {
            return {'success': true, 'data': typedResponse};
          }
        } else {
          return {
            'success': true,
            'data': {'message': 'Profile saved'},
          };
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        return {
          'success': false,
          'message': 'Client error: ${response.statusCode}',
        };
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } on TimeoutException {
      return {'success': false, 'message': 'Request timeout'};
    } on http.ClientException {
      return {'success': false, 'message': 'Network connection failed'};
    } catch (e, stack) {
      ErrorHandler.recordError(
        e,
        stackTrace: stack,
        context: 'SendProfileToBackend',
      );
      return {'success': false, 'message': 'Network error'};
    }
  }

  String _generateSecureRequestId() {
    final random = Random.secure();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomValue = random.nextInt(999999);
    return '${timestamp}_${randomValue}';
  }

  void _onCityChanged(String query) {
    _citySearchDebounce?.cancel();
    _citySearchDebounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted && query.length >= 2) {
        setState(() {});
      }
    });
  }

  Future<void> _handleSuccessfulSave(
    Map<String, dynamic>? result,
    BuildContext context,
  ) async {
    if (result == null) {
      ErrorHandler.showErrorSnackbar(context, 'Save failed: No response data');
      return;
    }

    final responseData = result['data'] ?? result;
    final String? userId = responseData['userId']?.toString();

    if (userId != null && userId.isNotEmpty) {
      if (mounted) {
        setState(() => _userIdController.text = userId);
      }

      await Provider.of<ProfileProvider>(
        context,
        listen: false,
      ).saveUserId(userId);

      // Show success message
      ErrorHandler.showSuccessSnackbar(context, 'Profile saved successfully!');

      // Check for recovery secret
      final recoverySecret = responseData['recoverySecret']?.toString();

      if (recoverySecret != null && recoverySecret.isNotEmpty) {
        // Show recovery info in a BottomSheet that doesn't block navigation
        _showRecoveryBottomSheet(context, recoverySecret);
      }

      // Always navigate to chat screen regardless of recovery secret
      _navigateToChatScreen(context);
    } else {
      ErrorHandler.showSuccessSnackbar(context, 'Profile saved successfully!');
      if (_userIdController.text.isNotEmpty) {
        await _loadProfileData();
      }
    }
  }

  void _showRecoveryBottomSheet(BuildContext context, String recoverySecret) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (context) => Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const Text(
                      "🔐 Save Your Recovery Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              "This information is crucial for account recovery. Please save it securely.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            _buildRecoveryCard(
                              "Recovery Secret",
                              recoverySecret,
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow("Name", _nameController.text),
                            _buildInfoRow(
                              "Birth Date",
                              _selectedDate != null
                                  ? DateFormat(
                                    'MMM dd, yyyy',
                                  ).format(_selectedDate!)
                                  : 'Not set',
                            ),
                            _buildInfoRow(
                              "Birth Time",
                              _selectedTime != null
                                  ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                                  : 'Not set',
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "💡 Tip: Take a screenshot or write this down in a secure place",
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text("I Understand - Continue to App"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      );
    });
  }

  Widget _buildRecoveryCard(String title, String value) {
    return Card(
      color: Colors.amber[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SelectableText(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChatScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen(chatId: null)),
      (route) => false,
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool isRequired = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label + (isRequired ? ' *' : ''),
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: (value) {
          if (controller == _userIdController) {
            _onUserIdChanged();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l10n.appBarTitle),
        backgroundColor: Colors.blue.shade700,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              setState(() => _showHistory = !_showHistory);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              children: [
                if (_showHistory) _buildHistorySection(l10n, profileProvider),

                // Profile Image
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            _image != null
                                ? FileImage(_image!)
                                : (_profileImageUrl != null
                                    ? NetworkImage(_profileImageUrl!)
                                    : null),
                        backgroundColor: Colors.grey[300],
                        child:
                            (_image == null && _profileImageUrl == null)
                                ? const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.white,
                                )
                                : null,
                      ),
                      if (_isLoading)
                        AvatarOrbitLoader(size: 120, color: Colors.blue),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                /*
                // User ID Field
                _buildTextField(
                  l10n.userIdLabel,
                  Icons.person_outline,
                  _userIdController,
                  validator: (value) {
                    if (value!.isNotEmpty &&
                        !SecurityUtils.isValidUserId(value)) {
                      return 'User ID must be 3-20 characters (letters, numbers, _, -)';
                    }

                    return null;
                  },
                ),

                if (_userIdController.text.isEmpty)
                  GestureDetector(
                    onTap: () async {
                      final recoveredUserId = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RecoveryScreen(),
                        ),
                      );
                      if (recoveredUserId != null &&
                          recoveredUserId.isNotEmpty &&
                          mounted) {
                        setState(
                          () => _userIdController.text = recoveredUserId,
                        );
                        await _loadProfileData();
                      }
                    },
                    child: Text(
                      l10n.existingUserButton,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
*/
                // Name Field (Required)
                _buildTextField(
                  l10n.nameLabel,
                  Icons.person,
                  _nameController,
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    if (SecurityUtils.containsSuspiciousPatterns(value)) {
                      return 'Invalid characters detected in name';
                    }

                    if (value.length < 2 || value.length > 50) {
                      return 'Name must be 2-50 characters';
                    }
                    return null;
                  },
                ),

                _buildCountryField(l10n),
                _buildCityField(l10n),

                // Gender Selection
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 'male',
                        groupValue: _gender,
                        onChanged:
                            (val) => setState(() => _gender = val as String),
                        title: Text(l10n.maleLabel),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 'female',
                        groupValue: _gender,
                        onChanged:
                            (val) => setState(() => _gender = val as String),
                        title: Text(l10n.femaleLabel),
                      ),
                    ),
                  ],
                ),

                // Date & Time Selection
                _buildDateTile(
                  l10n.birthDateLabel,
                  _selectedDate != null
                      ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}"
                      : l10n.birthDatePlaceholder,
                  () => _pickDate(context),
                  Icons.calendar_today,
                ),
                _buildDateTile(
                  l10n.birthTimeLabel,
                  _selectedTime != null
                      ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                      : l10n.birthTimePlaceholder,
                  () => _pickTime(context),
                  Icons.access_time,
                ),

                const SizedBox(height: 20),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : () => _saveProfile(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:
                        _isSaving
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                            : Text(
                              l10n.saveProfileButton,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),

                const SizedBox(height: 10),

                // Security Notice
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.security,
                        color: Colors.green.shade700,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Your data is securely encrypted and stored',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getCountryIsoCode(String countryName) {
    final countryCodes = {
      'Afghanistan': 'AF',
      'Albania': 'AL',
      'Algeria': 'DZ',
      'Andorra': 'AD',
      'Angola': 'AO',
      'Antigua and Barbuda': 'AG',
      'Argentina': 'AR',
      'Armenia': 'AM',
      'Australia': 'AU',
      'Austria': 'AT',
      'Azerbaijan': 'AZ',
      'Bahamas': 'BS',
      'Bahrain': 'BH',
      'Bangladesh': 'BD',
      'Barbados': 'BB',
      'Belarus': 'BY',
      'Belgium': 'BE',
      'Belize': 'BZ',
      'Benin': 'BJ',
      'Bhutan': 'BT',
      'Bolivia': 'BO',
      'Bosnia and Herzegovina': 'BA',
      'Botswana': 'BW',
      'Brazil': 'BR',
      'Brunei': 'BN',
      'Bulgaria': 'BG',
      'Burkina Faso': 'BF',
      'Burundi': 'BI',
      'Cabo Verde': 'CV',
      'Cambodia': 'KH',
      'Cameroon': 'CM',
      'Canada': 'CA',
      'Central African Republic': 'CF',
      'Chad': 'TD',
      'Chile': 'CL',
      'China': 'CN',
      'Colombia': 'CO',
      'Comoros': 'KM',
      'Congo (Congo-Brazzaville)': 'CG',
      'Costa Rica': 'CR',
      'Croatia': 'HR',
      'Cuba': 'CU',
      'Cyprus': 'CY',
      'Czech Republic': 'CZ',
      'Democratic Republic of the Congo': 'CD',
      'Denmark': 'DK',
      'Djibouti': 'DJ',
      'Dominica': 'DM',
      'Dominican Republic': 'DO',
      'Ecuador': 'EC',
      'Egypt': 'EG',
      'El Salvador': 'SV',
      'Equatorial Guinea': 'GQ',
      'Eritrea': 'ER',
      'Estonia': 'EE',
      'Eswatini (Swaziland)': 'SZ',
      'Ethiopia': 'ET',
      'Fiji': 'FJ',
      'Finland': 'FI',
      'France': 'FR',
      'Gabon': 'GA',
      'Gambia': 'GM',
      'Georgia': 'GE',
      'Germany': 'DE',
      'Ghana': 'GH',
      'Greece': 'GR',
      'Grenada': 'GD',
      'Guatemala': 'GT',
      'Guinea': 'GN',
      'Guinea-Bissau': 'GW',
      'Guyana': 'GY',
      'Haiti': 'HT',
      'Honduras': 'HN',
      'Hungary': 'HU',
      'Iceland': 'IS',
      'India': 'IN',
      'Indonesia': 'ID',
      'Iran': 'IR',
      'Iraq': 'IQ',
      'Ireland': 'IE',
      'Israel': 'IL',
      'Italy': 'IT',
      'Jamaica': 'JM',
      'Japan': 'JP',
      'Jordan': 'JO',
      'Kazakhstan': 'KZ',
      'Kenya': 'KE',
      'Kiribati': 'KI',
      'Kuwait': 'KW',
      'Kyrgyzstan': 'KG',
      'Laos': 'LA',
      'Latvia': 'LV',
      'Lebanon': 'LB',
      'Lesotho': 'LS',
      'Liberia': 'LR',
      'Libya': 'LY',
      'Liechtenstein': 'LI',
      'Lithuania': 'LT',
      'Luxembourg': 'LU',
      'Madagascar': 'MG',
      'Malawi': 'MW',
      'Malaysia': 'MY',
      'Maldives': 'MV',
      'Mali': 'ML',
      'Malta': 'MT',
      'Marshall Islands': 'MH',
      'Mauritania': 'MR',
      'Mauritius': 'MU',
      'Mexico': 'MX',
      'Micronesia': 'FM',
      'Moldova': 'MD',
      'Monaco': 'MC',
      'Mongolia': 'MN',
      'Montenegro': 'ME',
      'Morocco': 'MA',
      'Mozambique': 'MZ',
      'Myanmar (Burma)': 'MM',
      'Namibia': 'NA',
      'Nauru': 'NR',
      'Nepal': 'NP',
      'Netherlands': 'NL',
      'New Zealand': 'NZ',
      'Nicaragua': 'NI',
      'Niger': 'NE',
      'Nigeria': 'NG',
      'North Korea': 'KP',
      'North Macedonia': 'MK',
      'Norway': 'NO',
      'Oman': 'OM',
      'Pakistan': 'PK',
      'Palau': 'PW',
      'Palestine State': 'PS',
      'Panama': 'PA',
      'Papua New Guinea': 'PG',
      'Paraguay': 'PY',
      'Peru': 'PE',
      'Philippines': 'PH',
      'Poland': 'PL',
      'Portugal': 'PT',
      'Qatar': 'QA',
      'Romania': 'RO',
      'Russia': 'RU',
      'Rwanda': 'RW',
      'Saint Kitts and Nevis': 'KN',
      'Saint Lucia': 'LC',
      'Saint Vincent and the Grenadines': 'VC',
      'Samoa': 'WS',
      'San Marino': 'SM',
      'Sao Tome and Principe': 'ST',
      'Saudi Arabia': 'SA',
      'Senegal': 'SN',
      'Serbia': 'RS',
      'Seychelles': 'SC',
      'Sierra Leone': 'SL',
      'Singapore': 'SG',
      'Slovakia': 'SK',
      'Slovenia': 'SI',
      'Solomon Islands': 'SB',
      'Somalia': 'SO',
      'South Africa': 'ZA',
      'South Korea': 'KR',
      'South Sudan': 'SS',
      'Spain': 'ES',
      'Sri Lanka': 'LK',
      'Sudan': 'SD',
      'Suriname': 'SR',
      'Sweden': 'SE',
      'Switzerland': 'CH',
      'Syria': 'SY',
      'Taiwan': 'TW',
      'Tajikistan': 'TJ',
      'Tanzania': 'TZ',
      'Thailand': 'TH',
      'Timor-Leste': 'TL',
      'Togo': 'TG',
      'Tonga': 'TO',
      'Trinidad and Tobago': 'TT',
      'Tunisia': 'TN',
      'Turkey': 'TR',
      'Turkmenistan': 'TM',
      'Tuvalu': 'TV',
      'Uganda': 'UG',
      'Ukraine': 'UA',
      'United Arab Emirates': 'AE',
      'United Kingdom': 'GB',
      'United States': 'US',
      'Uruguay': 'UY',
      'Uzbekistan': 'UZ',
      'Vanuatu': 'VU',
      'Vatican City': 'VA',
      'Venezuela': 'VE',
      'Vietnam': 'VN',
      'Yemen': 'YE',
      'Zambia': 'ZM',
      'Zimbabwe': 'ZW',
    };

    return countryCodes[countryName] ?? '';
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value.isEmpty ? "Not set" : value)),
        ],
      ),
    );
  }

  Future<void> saveLanguageLocally(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_language', langCode);
  }

  Future<void> _loadProfileData() async {
    if (_isLoading) return;
    if (!mounted) return;
    setState(() => _isLoading = true);
    final userId = _userIdController.text.trim();
    if (userId.isEmpty) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      return;
    }

    try {
      final uri = Uri.parse(
        '${Environment.baseUrl}/api/profile/get-profile?userId=$userId',
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        final data = responseData['profile'];

        DateTime? parsedDate;
        TimeOfDay? parsedTime;

        if (data['birthDate'] != null) {
          try {
            if (data['birthDate'] is Map &&
                data['birthDate']['\$date'] != null) {
              final timestamp = int.parse(
                data['birthDate']['\$date']['\$numberLong'].toString(),
              );
              parsedDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
            } else if (data['birthDate'] is String) {
              parsedDate = DateTime.parse(data['birthDate']);
            }
          } catch (e, stack) {
            ErrorHandler.recordError(
              e,
              stackTrace: stack,
              context: 'ParseBirthDate',
            );
          }
        }

        if (data['birthTime'] != null && data['birthTime'] is String) {
          try {
            final timeParts = data['birthTime'].split(':');
            if (timeParts.length >= 2) {
              parsedTime = TimeOfDay(
                hour: int.parse(timeParts[0]),
                minute: int.parse(timeParts[1]),
              );
            }
          } catch (e, stack) {
            ErrorHandler.recordError(
              e,
              stackTrace: stack,
              context: 'ParseBirthTime',
            );
          }
        }

        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        _logger.d(
          '📚 Version history count: ${profileProvider.versionHistory.length}',
        );

        await profileProvider.saveUserId(userId);
        final country = data['country'] ?? '';
        if (mounted) {
          setState(() {
            _selectedCountry = country;
            _countryController.text = country;
            _nameController.text = data['name'] ?? '';
            _cityController.text = data['city'] ?? '';
            _gender = data['gender'] ?? '';
            _profileImageUrl = data['profilePicture'];
            _selectedDate = parsedDate;
            _selectedTime = parsedTime;
            _latitude = _safeDouble(data['latitude']);
            _longitude = _safeDouble(data['longitude']);
            _timezone = _safeDouble(data['timezone']);
            _dst = _safeDouble(data['dst']);
            _state = data['state'];
          });
        }

        final savedLang = profileProvider.language;
        await profileProvider.saveFullProfile(
          userId: userId,
          name: _nameController.text,
          city: _cityController.text,
          country: _countryController.text,
          gender: _gender,
          birthDate: _selectedDate,
          birthTime: _selectedTime,
          profileImageUrl: _profileImageUrl,
          latitude: _latitude,
          longitude: _longitude,
          timezone: _timezone,
          dst: _dst,
          state: _state,
          language: savedLang,
        );

        ErrorHandler.showSuccessSnackbar(
          context,
          'Profile loaded successfully',
        );
      } else {
        await _loadLocalProfileData();
        if (response.statusCode == 404) {
          ErrorHandler.showErrorSnackbar(
            context,
            'Profile not found. Please check your User ID.',
          );
        } else {
          ErrorHandler.showErrorSnackbar(
            context,
            'Failed to load profile from server',
          );
        }
      }
    } on TimeoutException {
      await _loadLocalProfileData();
      ErrorHandler.showErrorSnackbar(
        context,
        'Request timeout. Using local data.',
      );
    } on http.ClientException {
      await _loadLocalProfileData();
      ErrorHandler.showErrorSnackbar(
        context,
        'Network error. Using local data.',
      );
    } catch (e, stack) {
      ErrorHandler.recordError(e, stackTrace: stack, context: 'LoadProfile');
      await _loadLocalProfileData();
      ErrorHandler.showErrorSnackbar(context, 'Failed to load profile');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  double? _safeDouble(dynamic value) {
    if (value == null) return null;
    try {
      return double.tryParse(value.toString());
    } catch (e) {
      return null;
    }
  }

  Future<void> _loadSavedProfileData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    if (mounted) {
      setState(() {
        _userIdController.text = profileProvider.userId ?? '';
        _countryController.text = profileProvider.country ?? '';
        _selectedCountry = profileProvider.country ?? '';
      });
    }

    if (_userIdController.text.isNotEmpty) {
      await _loadProfileData();
    } else {
      await _loadLocalProfileData();
    }
  }

  Future<void> _loadLocalProfileData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    if (mounted) {
      setState(() {
        _nameController.text = profileProvider.name ?? '';
        _cityController.text = profileProvider.city ?? '';
        _countryController.text = profileProvider.country ?? '';
        _gender = profileProvider.gender ?? '';
        _profileImageUrl = profileProvider.profileImageUrl;
        _selectedDate = profileProvider.birthDate;
        _selectedTime = profileProvider.birthTime;
        _selectedCountry = profileProvider.country;
        _latitude = profileProvider.latitude;
        _longitude = profileProvider.longitude;
        _timezone = profileProvider.timezone;
        _dst = profileProvider.dst;
        _state = profileProvider.state;
      });
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime tempDate = _selectedDate ?? DateTime(2000, 1, 1);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 350,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Select Date of Birth",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(height: 20),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _selectedDate ?? DateTime(2000, 1, 1),
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (DateTime newDate) {
                      tempDate = newDate;
                    },
                  ),
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (mounted) {
                          setState(() => _selectedDate = tempDate);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay tempTime = _selectedTime ?? TimeOfDay.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Select Birth Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(height: 20),
                Expanded(
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm,
                    initialTimerDuration: Duration(
                      hours: _selectedTime?.hour ?? 0,
                      minutes: _selectedTime?.minute ?? 0,
                    ),
                    onTimerDurationChanged: (Duration newDuration) {
                      tempTime = TimeOfDay(
                        hour: newDuration.inHours,
                        minute: newDuration.inMinutes % 60,
                      );
                    },
                  ),
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (mounted) {
                          setState(() => _selectedTime = tempTime);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _fetchLocationDetails(String city, String country) async {
    if (city.isEmpty || country.isEmpty) return;

    try {
      final encodedQuery = Uri.encodeComponent('$city,$country');
      final locationUrl = Uri.parse(
        '${Environment.locationIqBaseUrl}/search?key=${Environment.locationIqApiKey}&q=$encodedQuery&format=json&limit=1',
      );

      final locationResponse = await http
          .get(locationUrl)
          .timeout(const Duration(seconds: 10));

      if (locationResponse.statusCode == 200) {
        final locationData = jsonDecode(
          utf8.decode(locationResponse.bodyBytes),
        );
        if (locationData is List && locationData.isNotEmpty) {
          final firstResult = locationData[0];
          final lat =
              double.tryParse(firstResult['lat']?.toString() ?? '') ?? 0.0;
          final lon =
              double.tryParse(firstResult['lon']?.toString() ?? '') ?? 0.0;
          final state = firstResult['address']?['state']?.toString() ?? '';

          final timezoneUrl = Uri.parse(
            '${Environment.timezoneDbBaseUrl}?key=${Environment.timezoneDbApiKey}&format=json&by=position&fields=gmtOffset,dst&lat=$lat&lng=$lon',
          );

          final timezoneResponse = await http
              .get(timezoneUrl)
              .timeout(const Duration(seconds: 10));
          if (timezoneResponse.statusCode == 200) {
            final timezoneData = jsonDecode(
              utf8.decode(timezoneResponse.bodyBytes),
            );
            if (timezoneData['status'] == 'OK') {
              if (mounted) {
                setState(() {
                  _latitude = lat;
                  _longitude = lon;
                  _state = state;
                  _timezone = timezoneData['gmtOffset']?.toDouble();
                  final dstValue = timezoneData['dst'];
                  _dst = (dstValue == '1' || dstValue == 1) ? 1.0 : 0.0;
                });
              }
              return;
            }
          }
        }
      }
    } on TimeoutException {
      ErrorHandler.showErrorSnackbar(context, 'Location service timeout');
    } on http.ClientException {
      ErrorHandler.showErrorSnackbar(
        context,
        'Network error fetching location',
      );
    } catch (e, stack) {
      ErrorHandler.recordError(e, stackTrace: stack, context: 'FetchLocation');
      ErrorHandler.showErrorSnackbar(
        context,
        'Failed to fetch location details',
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildCountryField(AppLocalizations l10n) {
    final initialCode =
        _selectedCountry != null ? _getCountryIsoCode(_selectedCountry!) : '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              l10n.birthCountryLabel,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          KeyedSubtree(
            key: ValueKey(_selectedCountry),
            child: CountryListPick(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text(l10n.chooseCountryTitle),
              ),
              theme: CountryTheme(
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: initialCode,
              onChanged: (CountryCode? code) {
                if (code != null && mounted) {
                  setState(() {
                    _countryController.text = code.name!;
                    _selectedCountry = code.name!;
                    _cityController.clear();
                    _latitude = null;
                    _longitude = null;
                    _timezone = null;
                    _dst = null;
                    _state = null;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityField(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(bottom: 4)),
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: l10n.birthCityLabel,
                prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText:
                    _selectedCountry == null
                        ? l10n.countryFirstPlaceholder
                        : l10n.cityPlaceholder(_selectedCountry!),
              ),
              enabled: _selectedCountry != null,
              onChanged: _onCityChanged,
            ),
            suggestionsCallback: (pattern) async {
              try {
                if (_selectedCountry == null || pattern.length < 2) return [];
                return await _getCitySuggestions(pattern);
              } catch (e, stack) {
                ErrorHandler.recordError(
                  e,
                  stackTrace: stack,
                  context: 'CitySuggestions',
                );
                return [];
              }
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion));
            },
            onSuggestionSelected: (suggestion) async {
              _cityController.text = suggestion;
              await _fetchLocationDetails(suggestion, _selectedCountry!);
            },
            noItemsFoundBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  l10n.noCitiesFound,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<List<String>> _getCitySuggestions(String query) async {
    if (_selectedCountry == null || query.length < 2) return <String>[];

    try {
      final countryCode = _getCountryIsoCode(_selectedCountry!);
      if (countryCode.isEmpty) return <String>[];

      final response = await http
          .get(
            Uri.parse(
              '${Environment.locationIqBaseUrl}/autocomplete?key=${Environment.locationIqApiKey}&q=$query&country=$countryCode&tag=place:city,place:town&limit=5',
            ),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final List<dynamic> data =
            jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

        final List<String> citySuggestions =
            data
                .where((item) => item['address'] != null)
                .map((item) {
                  final name =
                      item['address']['name'] ?? item['display_name'] ?? '';
                  return name.toString();
                })
                .where((name) => name.isNotEmpty)
                .toList();

        return citySuggestions;
      } else {
        return <String>[];
      }
    } on TimeoutException {
      return <String>[];
    } catch (e, stack) {
      ErrorHandler.recordError(
        e,
        stackTrace: stack,
        context: 'GetCitySuggestions',
      );
      return <String>[];
    }
  }

  Widget _buildDateTile(
    String label,
    String value,
    VoidCallback onTap,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
        leading: Icon(icon),
        onTap: onTap,
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildVersionHistoryItem(
    Map<String, dynamic> version,
    AppLocalizations l10n,
  ) {
    final updatedAt = DateTime.parse(version['updatedAt']).toLocal();
    final dateFormat = DateFormat('MMM dd, yyyy - HH:mm');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.versionFromText(dateFormat.format(updatedAt)),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            // Removed all the field chips - now only shows date and version
          ],
        ),
      ),
    );
  }

  Widget _buildHistorySection(
    AppLocalizations l10n,
    ProfileProvider profileProvider,
  ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.history, color: Colors.blue, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.versionHistoryTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${profileProvider.versionHistory.length} versions found',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  setState(() => _showHistory = false);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (profileProvider.versionHistory.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Icon(
                  Icons.history_toggle_off,
                  size: 64,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Text(
                  'No history available',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          ...profileProvider.versionHistory.reversed.map(
            (version) => _buildVersionHistoryItem(version, l10n),
          ),
        const Divider(height: 40),
      ],
    );
  }
}

class SaveProfileResult {
  final bool success;
  final String? message;
  final Map<String, dynamic>? data; // Allow null data

  SaveProfileResult({required this.success, this.message, this.data});
}

class ValidationResult {
  final bool isValid;
  final String? errorMessage;

  const ValidationResult({required this.isValid, this.errorMessage});

  factory ValidationResult.valid() => const ValidationResult(isValid: true);
  factory ValidationResult.invalid(String error) =>
      ValidationResult(isValid: false, errorMessage: error);
}

class ImageException implements Exception {
  final String message;
  ImageException(this.message);

  @override
  String toString() => 'ImageException: $message';
}
