import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? astroData;
  bool _isLoading = true;
  String? _error;
  bool _retrying = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    try {
      await profileProvider.loadUserId();
      print("🔑 Loaded userId: ${profileProvider.userId}");

      if (mounted) {
        final userId = widget.userId ?? profileProvider.userId;
        if (userId != null && userId.isNotEmpty) {
          await _fetchAstroProfile(userId);
        } else {
          setState(() {
            _error = 'User ID is still null after loading.';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Initialization error: $e';
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _fetchAstroProfile([String? userId]) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _retrying = false;
    });

    if (userId == null || userId.isEmpty) {
      if (mounted) {
        setState(() {
          _error = 'No user ID available';
          _isLoading = false;
        });
      }
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://chat-backend-rvk9.onrender.com/api/kundali/generate/$userId',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        setState(() {
          astroData = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load profile: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Error fetching profile: $e';
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildHouseTable(List<dynamic> houses) {
    // Zodiac signs in order
    const List<String> zodiacSigns = [
      "Aries",
      "Taurus",
      "Gemini",
      "Cancer",
      "Leo",
      "Virgo",
      "Libra",
      "Scorpio",
      "Sagittarius",
      "Capricorn",
      "Aquarius",
      "Pisces",
    ];

    // Get lagna sign from astroData, default to 'Aries' if missing
    final String lagna = astroData?['lagna'] ?? 'Aries';
    final int lagnaIndex = zodiacSigns.indexOf(lagna);
    if (lagnaIndex == -1) {
      // fallback if lagna not found in list
      return Text("Invalid Lagna sign: $lagna");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          houses.asMap().entries.map((entry) {
            final index = entry.key;
            final house = entry.value;
            final planets = house['planets'] as List<dynamic>;

            // Calculate sign for this house
            final houseSign = zodiacSigns[(lagnaIndex + index) % 12];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "House ${index + 1} — $houseSign",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    if (planets.isEmpty)
                      const Text("No planets in this house")
                    else
                      ...planets.map((planet) {
                        return Text(
                          "${planet['name']} at ${planet['degree']}° (${planet['nakshatra']})",
                        );
                      }).toList(),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildSkeletonLoader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24,
              width: 150,
              color: Colors.white,
            ), // Lagna title
            const SizedBox(height: 8),
            Container(
              height: 20,
              width: 100,
              color: Colors.white,
            ), // Lagna value
            const SizedBox(height: 12),

            Container(
              height: 24,
              width: 120,
              color: Colors.white,
            ), // Rashi title
            const SizedBox(height: 8),
            Container(
              height: 20,
              width: 100,
              color: Colors.white,
            ), // Rashi value
            const SizedBox(height: 12),

            Container(
              height: 24,
              width: 180,
              color: Colors.white,
            ), // Ascendant Degree title
            const SizedBox(height: 8),
            Container(
              height: 20,
              width: 120,
              color: Colors.white,
            ), // Ascendant value
            const SizedBox(height: 20),

            Container(
              height: 28,
              width: 100,
              color: Colors.white,
            ), // Houses title
            const SizedBox(height: 12),

            // Simulate 3 houses with card placeholders
            ...List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _error ?? 'Unknown error',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          if (_retrying)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: () {
                setState(() => _retrying = true);
                _fetchAstroProfile();
              },
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Astro Profile')),
      body:
          _isLoading
              ? _buildSkeletonLoader()
              : _error != null
              ? _buildErrorWidget()
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lagna: ${astroData?['lagna'] ?? 'Unknown'}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rashi: ${astroData?['rashi'] ?? 'Unknown'}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ascendant Degree: ${astroData?['ascendant_degree'] ?? 'Unknown'}°",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Divider(height: 30),
                    const Text(
                      "Houses:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildHouseTable(astroData?['houses'] ?? []),
                  ],
                ),
              ),
    );
  }
}
