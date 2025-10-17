import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../providers/LocaleProvider.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../l10n/app_localizations.dart'; // Add localization import
import '../widgets/Avaterloder.dart';
import 'recovery_screen.dart'; // Adjust the path if it's in another folder
import 'package:shared_preferences/shared_preferences.dart';
import 'chat_screen.dart'; // Add this line
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat

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

  static const String _locationIqApiKey = 'pk.2371ae85bf85964bfb986332dcc74851';
  static const String _locationIqBaseUrl = 'https://api.locationiq.com/v1';
  static const String _timezoneDbApiKey = 'PRCEAEL0H149';
  static const String _timezoneDbBaseUrl =
      'http://api.timezonedb.com/v2.1/get-time-zone';

  String _getCountryIsoCode(String countryName) {
    // This is a simplified mapping - you might want to use a complete package
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

  @override
  void initState() {
    super.initState();
    _loadSavedProfileData();

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    profileProvider.loadLanguage().then((_) {
      if (profileProvider.language != null &&
          _userIdController.text.isNotEmpty) {
        _updateLanguageOnBackend(profileProvider.language!);
      }
    });
    _userIdController.addListener(_onUserIdChanged);
  }

  @override
  void dispose() {
    _userIdController.removeListener(_onUserIdChanged);
    _reloadTimer?.cancel();
    if (_userIdController.text.trim().isNotEmpty) {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      profileProvider.saveUserId(_userIdController.text.trim());
    }
    _nameController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  void _onUserIdChanged() {
    final newUserId = _userIdController.text.trim();
    if (newUserId.isNotEmpty) {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      profileProvider.saveUserId(newUserId);
      _reloadTimer?.cancel();
      _reloadTimer = Timer(const Duration(seconds: 2), () {
        _loadProfileData(); // ✅ fetch new profile after debounce
      });
    }
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
    setState(() => _isLoading = true);
    final userId = _userIdController.text.trim();
    if (userId.isEmpty) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final uri = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/get-profile?userId=$userId',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['profile'];

        final String? languageFromBackend = data['language'];
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
          } catch (e) {
            debugPrint('Error parsing birth date: $e');
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
          } catch (e) {
            debugPrint('Error parsing time: $e');
          }
        }
        final profileProvider = Provider.of<ProfileProvider>(
          context,
          listen: false,
        );
        if (languageFromBackend != null &&
            languageFromBackend != profileProvider.language &&
            _userIdController.text.isNotEmpty) {
          await profileProvider.saveLanguage(languageFromBackend);
          Provider.of<LocaleProvider>(
            context,
            listen: false,
          ).setLocale(Locale(languageFromBackend));
        }

        await profileProvider.saveUserId(
          userId,
        ); // ✅ force update in local storage

        setState(() {
          _nameController.text = data['name'] ?? '';
          _cityController.text = data['city'] ?? '';
          _countryController.text = data['country'] ?? '';
          _gender = data['gender'] ?? '';
          _profileImageUrl = data['profilePicture'];
          _selectedDate = parsedDate;
          _selectedTime = parsedTime;
          _selectedCountry = data['country'];
          _latitude = data['latitude']?.toDouble();
          _longitude = data['longitude']?.toDouble();
          _timezone = data['timezone']?.toDouble();
          _dst = data['dst']?.toDouble();
          _state = data['state'];
        });
        final savedLang = profileProvider.language ?? 'en';
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
          language: savedLang, // ✅ pass saved language explicitly
        );
      } else {
        await _loadLocalProfileData();
      }
    } catch (e) {
      debugPrint('Error loading profile: $e');
      await _loadLocalProfileData();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updateLanguageOnBackend(String langCode) async {
    final userId = _userIdController.text.trim();
    if (userId.isEmpty) return;

    final body = {'userId': userId, 'language': langCode};

    try {
      final uri = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/update-language',
      );
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        debugPrint('Language updated on backend successfully.');
      } else {
        debugPrint('Failed to update language: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error updating language: $e');
    }
  }

  Future<void> _loadSavedProfileData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadUserId();
    await profileProvider.loadLanguage(); // Load local language first

    setState(() {
      _userIdController.text = profileProvider.userId ?? '';
      _selectedCountry = profileProvider.country;
    });

    if (_userIdController.text.isNotEmpty) {
      await _loadProfileData();
    } else {
      await profileProvider.loadProfileData();
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

  Future<void> _loadLocalProfileData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadProfileData();
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

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Future<void> _saveProfile(BuildContext context) async {
    if (_isSaving) return;
    setState(() => _isSaving = true);

    String? base64Image;
    if (_image != null) {
      final bytes = await _image!.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    final String? userId =
        _userIdController.text.trim().isEmpty
            ? null
            : _userIdController.text.trim();

    // Ensure we have fresh location data
    if (_cityController.text.isNotEmpty && _countryController.text.isNotEmpty) {
      await _fetchLocationDetails(
        _cityController.text.trim(),
        _countryController.text.trim(),
      );
    }

    final savedLang =
        Provider.of<ProfileProvider>(context, listen: false).language;

    final birthDateStr =
        _selectedDate != null
            ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}"
            : '';

    final birthTimeStr =
        _selectedTime != null
            ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
            : '';

    final body = {
      if (userId != null) 'userId': userId,
      'name': _nameController.text.trim(),
      'city': _cityController.text.trim(),
      'country': _countryController.text.trim(),
      'gender': _gender ?? '',
      'birthDate': birthDateStr,
      'birthTime': birthTimeStr,
      'latitude': _latitude,
      'longitude': _longitude,
      'timezone': _timezone,
      'dst': _dst ?? 0.0,
      'state': _state,
      'profilePicture': base64Image,
      if (savedLang != null) 'language': savedLang, // ✅ attach language
    };

    try {
      final uri = Uri.parse(
        'https://chat-backend-rvk9.onrender.com/api/profile/save-profile',
      );
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // ✅ Auto-update userId from backend if provided
        if (responseData['userId'] != null) {
          final generatedId = responseData['userId'].toString();
          setState(() {
            _userIdController.text = generatedId;
          });

          _showMessage(context, 'profileSaved', Colors.green);

          // Show recovery secret dialog **only once**
          if (responseData['recoverySecret'] != null) {
            debugPrint('Recovery secret exists, showing dialog');

            // Show the dialog and wait for user to acknowledge it
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "🔐 Account Recovery Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Please save this information securely. You'll need it to recover your account.",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        _buildInfoRow("Name", _nameController.text),
                        _buildInfoRow("Date of Birth", birthDateStr),
                        _buildInfoRow("Time of Birth", birthTimeStr),
                        const SizedBox(height: 10),
                        const Text(
                          "Recovery Secret:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 5, bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.amber[50],
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SelectableText(
                            responseData['recoverySecret'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Text(
                          "⚠️ Important:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "• Take a screenshot of this information\n"
                          "• Store it in a secure place\n"
                          "• Do not share with anyone\n"
                          "• This will only be shown once",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // Only after user acknowledges, save the user ID and navigate
                        Provider.of<ProfileProvider>(
                          context,
                          listen: false,
                        ).saveUserId(generatedId);
                        Navigator.of(context).pop();
                        Navigator.pushReplacementNamed(context, '/chat');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("I've Saved This Information"),
                    ),
                  ],
                );
              },
            );
          } else {
            // If no recovery secret (existing user), just save the user ID
            await Provider.of<ProfileProvider>(
              context,
              listen: false,
            ).saveUserId(generatedId);
            if (mounted) {
              // Replace with:
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chatId: null),
                ),
                (route) => false, // This removes all previous routes
              );
            }
          }
        } else {
          _showMessage(context, 'saveFailed', Colors.red);
        }
      } else {
        _showMessage(context, 'saveFailed', Colors.red);
      }
    } catch (e) {
      _showMessage(context, e.toString(), Colors.red);
    } finally {
      setState(() => _isSaving = false);
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
                        setState(() => _selectedDate = tempDate);
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
                        setState(() => _selectedTime = tempTime);
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
      // 1. First get coordinates from LocationIQ
      final encodedQuery = Uri.encodeComponent('$city,$country');
      final locationUrl = Uri.parse(
        '$_locationIqBaseUrl/search?key=$_locationIqApiKey'
        '&q=$encodedQuery'
        '&format=json'
        '&limit=1',
      );

      debugPrint('Fetching location from: ${locationUrl.toString()}');
      final locationResponse = await http.get(locationUrl);

      if (locationResponse.statusCode == 200) {
        final locationData = jsonDecode(locationResponse.body);
        if (locationData is List && locationData.isNotEmpty) {
          final firstResult = locationData[0];
          final lat =
              double.tryParse(firstResult['lat']?.toString() ?? '') ?? 0.0;
          final lon =
              double.tryParse(firstResult['lon']?.toString() ?? '') ?? 0.0;
          final state = firstResult['address']?['state']?.toString() ?? '';

          debugPrint('Location found: $lat,$lon, state: $state');

          // 2. Get timezone info
          final timezoneUrl = Uri.parse(
            '$_timezoneDbBaseUrl?key=$_timezoneDbApiKey'
            '&format=json'
            '&by=position'
            '&fields=gmtOffset,dst'
            '&lat=$lat'
            '&lng=$lon',
          );

          final timezoneResponse = await http.get(timezoneUrl);
          if (timezoneResponse.statusCode == 200) {
            final timezoneData = jsonDecode(timezoneResponse.body);
            if (timezoneData['status'] == 'OK') {
              setState(() {
                _latitude = lat;
                _longitude = lon;
                _state = state;
                _timezone = timezoneData['gmtOffset']?.toDouble();
                final dstValue = timezoneData['dst'];
                _dst = (dstValue == '1' || dstValue == 1) ? 1.0 : 0.0;
              });
              debugPrint('Timezone data: $_timezone, DST: $_dst');
              return;
            }
          }
        }
      }
      debugPrint('Location fetch failed: ${locationResponse.statusCode}');
    } catch (e, stack) {
      debugPrint('Location fetch error: $e');
      debugPrint('Stack trace: $stack');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showMessage(BuildContext context, String messageKey, Color color) {
    final l10n = AppLocalizations.of(context)!;
    String message;

    switch (messageKey) {
      case 'userIdRequired':
        message = l10n.userIdRequired;
        break;
      case 'profileSaved':
        message = l10n.profileSaved;
        break;
      case 'saveFailed':
        message = l10n.saveFailed;
        break;
      default:
        message = '$l10n.errorPrefix $messageKey';
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildCountryField(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              l10n.birthCountryLabel, // Localized
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(l10n.chooseCountryTitle), // Localized
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: false,
              isDownIcon: true,
              showEnglishName: true,
            ),
            initialSelection: _countryController.text,
            onChanged: (CountryCode? code) {
              if (code != null) {
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
        ],
      ),
    );
  }

  // Update _buildCityField to accept l10n parameter
  Widget _buildCityField(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              l10n.birthCityLabel, // Localized
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: l10n.birthCityLabel, // Localized
                prefixIcon: Icon(Icons.location_city, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText:
                    _selectedCountry == null
                        ? l10n
                            .countryFirstPlaceholder // Localized
                        : l10n.cityPlaceholder(_selectedCountry!),
              ),
              enabled: _selectedCountry != null,
            ),
            suggestionsCallback: (pattern) async {
              try {
                if (_selectedCountry == null || pattern.length < 2) return [];
                return await _getCitySuggestions(pattern);
              } catch (e) {
                debugPrint('City suggestion error: $e');
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
                  l10n.noCitiesFound, // Localized
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
              '$_locationIqBaseUrl/autocomplete?key=$_locationIqApiKey'
              '&q=$query'
              '&country=$countryCode'
              '&tag=place:city,place:town'
              '&limit=5',
            ),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

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
        debugPrint(
          'LocationIQ API error: ${response.statusCode} - ${response.body}',
        );
        return <String>[];
      }
    } on TimeoutException {
      debugPrint('LocationIQ API request timed out');
      return <String>[];
    } catch (e) {
      debugPrint('Error fetching city suggestions: $e');
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

  // Add this method to your _ProfileSettingsScreenState class
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
            // Header with timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.versionFromText(
                    dateFormat.format(updatedAt),
                  ), // Fixed: use the function
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
                  child: Text(
                    'v${version['version'] ?? '1'}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Profile data in a clean grid layout
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                if (version['name'] != null &&
                    version['name'].toString().isNotEmpty)
                  _buildHistoryItemChip(
                    icon: Icons.person,
                    label: 'Name', // Use simple string instead of l10n function
                    value: version['name'].toString(),
                  ),

                if (version['city'] != null &&
                    version['city'].toString().isNotEmpty)
                  _buildHistoryItemChip(
                    icon: Icons.location_city,
                    label: 'City',
                    value: version['city'].toString(),
                  ),

                if (version['country'] != null &&
                    version['country'].toString().isNotEmpty)
                  _buildHistoryItemChip(
                    icon: Icons.flag,
                    label: 'Country',
                    value: version['country'].toString(),
                  ),

                if (version['gender'] != null &&
                    version['gender'].toString().isNotEmpty)
                  _buildHistoryItemChip(
                    icon:
                        version['gender'] == 'male' ? Icons.male : Icons.female,
                    label: 'Gender',
                    value:
                        version['gender'] == 'male'
                            ? l10n.maleLabel
                            : l10n.femaleLabel,
                  ),

                if (version['birthDate'] != null)
                  _buildHistoryItemChip(
                    icon: Icons.calendar_today,
                    label: 'Birth Date',
                    value: DateFormat(
                      'MMM dd, yyyy',
                    ).format(DateTime.parse(version['birthDate'])),
                  ),

                if (version['birthTime'] != null)
                  _buildHistoryItemChip(
                    icon: Icons.access_time,
                    label: 'Birth Time',
                    value: version['birthTime'].toString(),
                  ),

                if (version['latitude'] != null && version['longitude'] != null)
                  _buildHistoryItemChip(
                    icon: Icons.gps_fixed,
                    label: 'Coordinates',
                    value:
                        '${version['latitude'].toStringAsFixed(4)}, ${version['longitude'].toStringAsFixed(4)}',
                  ),

                if (version['timezone'] != null)
                  _buildHistoryItemChip(
                    icon: Icons.time_to_leave,
                    label: 'Timezone',
                    value:
                        'GMT${version['timezone'] >= 0 ? '+' : ''}${version['timezone']}',
                  ),

                if (version['dst'] != null)
                  _buildHistoryItemChip(
                    icon: Icons.light_mode,
                    label: 'DST',
                    value: version['dst'] == 1.0 ? l10n.yesText : l10n.noText,
                    color: version['dst'] == 1.0 ? Colors.green : Colors.grey,
                  ),

                if (version['state'] != null &&
                    version['state'].toString().isNotEmpty)
                  _buildHistoryItemChip(
                    icon: Icons.map,
                    label: 'State',
                    value: version['state'].toString(),
                  ),
              ],
            ),

            // Empty state if no data
            if (_isVersionEmpty(version))
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'No data available', // Use simple string
                    style: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper method to build individual history items as chips
  Widget _buildHistoryItemChip({
    required IconData icon,
    required String label,
    required String value,
    Color color = Colors.blue,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to check if version has no data
  bool _isVersionEmpty(Map<String, dynamic> version) {
    final fields = [
      'name',
      'city',
      'country',
      'gender',
      'birthDate',
      'birthTime',
    ];
    return fields.every(
      (field) => version[field] == null || version[field].toString().isEmpty,
    );
  }

  // Update the history section in your build method:
  Widget _buildHistorySection(
    AppLocalizations l10n,
    ProfileProvider profileProvider,
  ) {
    return Column(
      children: [
        // Header
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
                      '${profileProvider.versionHistory.length} versions found', // Use simple string
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

        // Version list
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
                  'No history available', // Use simple string
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

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(
      context,
    ); // listen: true by default
    final locale = localeProvider.locale;
    print("Current locale: ${locale.languageCode}");
    final profileProvider = Provider.of<ProfileProvider>(context);
    final l10n = AppLocalizations.of(context)!; // Get localization instance

    return Scaffold(
      resizeToAvoidBottomInset: true, // prevent keyboard overlap
      appBar: AppBar(
        title: Text(l10n.appBarTitle), // Localized title
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              setState(() {
                _showHistory = !_showHistory;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),

          child: Column(
            children: [
              if (_showHistory) _buildHistorySection(l10n, profileProvider),

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

              // Show button only if userId is blank
              // Show as a clickable text if userId is empty
              const SizedBox(height: 20),
              _buildTextField(
                l10n.userIdLabel, // Localized
                Icons.person_outline,
                _userIdController,
              ),

              if (_userIdController.text.isEmpty)
                GestureDetector(
                  onTap: () async {
                    // ✅ make this async
                    final recoveredUserId = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(builder: (_) => const RecoveryScreen()),
                    );

                    if (recoveredUserId != null && recoveredUserId.isNotEmpty) {
                      setState(() {
                        _userIdController.text =
                            recoveredUserId; // ✅ fill textfield
                      });

                      // Optional: call profile fetch if you already have a method
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

              _buildTextField(
                l10n.nameLabel, // Localized
                Icons.person,
                _nameController,
              ),
              _buildCountryField(l10n), // Pass l10n
              _buildCityField(l10n), // Pass l10n
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 'male',
                      groupValue: _gender,
                      onChanged:
                          (val) => setState(() => _gender = val as String),
                      title: Text(l10n.maleLabel), // Localized
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 'female',
                      groupValue: _gender,
                      onChanged:
                          (val) => setState(() => _gender = val as String),
                      title: Text(l10n.femaleLabel), // Localized
                    ),
                  ),
                ],
              ),
              _buildDateTile(
                l10n.birthDateLabel, // Localized
                _selectedDate != null
                    ? "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}"
                    : l10n.birthDatePlaceholder, // Localized
                () => _pickDate(context),
                Icons.calendar_today,
              ),
              _buildDateTile(
                l10n.birthTimeLabel, // Localized
                _selectedTime != null
                    ? "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                    : l10n.birthTimePlaceholder, // Localized
                () => _pickTime(context),
                Icons.access_time,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : () => _saveProfile(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                  ),
                  child:
                      _isSaving
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                            l10n.saveProfileButton, // Localized
                            style: TextStyle(fontSize: 16),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
