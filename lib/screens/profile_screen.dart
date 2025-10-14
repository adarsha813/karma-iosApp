import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../l10n/app_localizations.dart'; // Add localization import

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

  // Calculate house information based on ascendant degree
  List<Map<String, dynamic>> _calculateHouseInfo() {
    if (astroData == null) return [];

    const List<String> zodiacSigns = [
      'Aries',
      'Taurus',
      'Gemini',
      'Cancer',
      'Leo',
      'Virgo',
      'Libra',
      'Scorpio',
      'Sagittarius',
      'Capricorn',
      'Aquarius',
      'Pisces',
    ];

    const List<String> nakshatras = [
      'Ashwini',
      'Bharani',
      'Krittika',
      'Rohini',
      'Mrigashira',
      'Ardra',
      'Punarvasu',
      'Pushya',
      'Ashlesha',
      'Magha',
      'Purva Phalguni',
      'Uttara Phalguni',
      'Hasta',
      'Chitra',
      'Swati',
      'Vishakha',
      'Anuradha',
      'Jyeshtha',
      'Mula',
      'Purva Ashadha',
      'Uttara Ashadha',
      'Shravana',
      'Dhanishta',
      'Shatabhisha',
      'Purva Bhadrapada',
      'Uttara Bhadrapada',
      'Revati',
    ];

    final String lagna = astroData?['lagna'] ?? 'Aries';
    final int ascendantSignIndex = zodiacSigns.indexOf(lagna);
    if (ascendantSignIndex == -1) return [];

    final double ascendantDegree =
        (astroData?['ascendant_degree'] ?? 0).toDouble();
    final List<dynamic> housesData = astroData?['houses'] ?? [];

    final List<Map<String, dynamic>> houses = [];

    for (int i = 0; i < 12; i++) {
      final int houseNumber = i + 1;
      final int signIndex = (ascendantSignIndex + i) % 12;
      final String sign = zodiacSigns[signIndex];

      final Map<String, dynamic> houseData =
          i < housesData.length
              ? Map<String, dynamic>.from(housesData[i])
              : {'planets': []};

      final double houseDegree = (ascendantDegree + (i * 30)) % 360;
      final int nakshatraIndex = (houseDegree / (360 / 27)).floor();
      final String nakshatra = nakshatras[nakshatraIndex % 27];

      houses.add({
        'house': houseNumber,
        'sign': sign,
        'degree': houseDegree,
        'nakshatra': nakshatra,
        'planets': houseData['planets'] ?? [],
      });
    }

    return houses;
  }

  // North Indian Chart Renderer
  Widget _buildNorthIndianChart() {
    final List<Map<String, dynamic>> calculatedHouses = _calculateHouseInfo();
    final Map<int, Map<String, dynamic>> houses = {};

    for (final house in calculatedHouses) {
      houses[house['house'] as int] = house;
    }

    Widget _buildHouse(int number, String x, String y) {
      final house =
          houses[number] ??
          {'planets': [], 'sign': '', 'nakshatra': '', 'degree': 0.0};
      final String sign = house['sign'] ?? '';
      final String nakshatra = house['nakshatra'] ?? '';
      final double degree = (house['degree'] ?? 0.0).toDouble();
      final List<dynamic> planets = house['planets'] ?? [];

      final Map<String, int> zodiacNumbers = {
        'Aries': 1,
        'Taurus': 2,
        'Gemini': 3,
        'Cancer': 4,
        'Leo': 5,
        'Virgo': 6,
        'Libra': 7,
        'Scorpio': 8,
        'Sagittarius': 9,
        'Capricorn': 10,
        'Aquarius': 11,
        'Pisces': 12,
      };

      final String zodiacNum =
          sign.isNotEmpty ? (zodiacNumbers[sign] ?? '-').toString() : '-';

      return Positioned(
        left: _parsePosition(x) - 25, // Shift 8 pixels to the left
        top: _parsePosition(y) - 25,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$zodiacNum ($sign)',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: number == 1 ? Colors.red : Colors.grey[800],
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                '$nakshatra ${degree.toStringAsFixed(2)}°',
                style: TextStyle(color: Colors.blue[700], fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              if (planets.isNotEmpty)
                ...planets.map<Widget>((planet) {
                  final planetName = planet['name'] ?? '';
                  final planetDegree = (planet['degree'] ?? 0).toDouble();
                  final planetNakshatra = planet['nakshatra'] ?? '';

                  return Column(
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        planetName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.green[700],
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '${planetDegree.toStringAsFixed(2)}° ($planetNakshatra)',
                        style: TextStyle(color: Colors.green[700], fontSize: 8),
                      ),
                    ],
                  );
                }).toList()
              else
                Text(
                  '-',
                  style: TextStyle(color: Colors.green[700], fontSize: 10),
                ),
            ],
          ),
        ),
      );
    }

    final Map<int, Map<String, String>> positions = {
      2: {'x': '25%', 'y': '10%'},
      12: {'x': '75%', 'y': '10%'},
      3: {'x': '10%', 'y': '25%'},
      1: {'x': '40%', 'y': '25%'},
      11: {'x': '90%', 'y': '25%'},
      4: {'x': '25%', 'y': '50%'},
      10: {'x': '75%', 'y': '50%'},
      5: {'x': '10%', 'y': '75%'},
      7: {'x': '50%', 'y': '75%'},
      9: {'x': '90%', 'y': '75%'},
      6: {'x': '25%', 'y': '90%'},
      8: {'x': '75%', 'y': '90%'},
    };

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          // SVG-like background
          CustomPaint(painter: _NorthIndianChartPainter(), size: Size.infinite),
          ...positions.entries.map((entry) {
            return _buildHouse(entry.key, entry.value['x']!, entry.value['y']!);
          }),
        ],
      ),
    );
  }

  double _parsePosition(String position) {
    final percentage = double.parse(position.replaceAll('%', ''));
    return (percentage / 100) * MediaQuery.of(context).size.width * 0.9;
  }

  // Dasha Table Widget
  Widget _buildDashaTable(List<dynamic> dashas, {bool isYogini = false}) {
    final l10n = AppLocalizations.of(context)!;

    final List<DataColumn> columns =
        isYogini
            ? [
              DataColumn(label: Text(l10n.yoginiLabel)),
              DataColumn(label: Text(l10n.lordLabel)),
              DataColumn(label: Text(l10n.startLabel)),
              DataColumn(label: Text(l10n.endLabel)),
            ]
            : [
              DataColumn(label: Text(l10n.lordLabel)),
              DataColumn(label: Text(l10n.startDateLabel)),
              DataColumn(label: Text(l10n.endDateLabel)),
            ];

    final List<DataRow> rows =
        dashas.isNotEmpty
            ? dashas.map<DataRow>((dasha) {
              final List<DataCell> cells =
                  isYogini
                      ? [
                        DataCell(
                          Text(
                            dasha['yogini']?.toString() ?? l10n.notAvailable,
                          ),
                        ),
                        DataCell(
                          Text(dasha['lord']?.toString() ?? l10n.notAvailable),
                        ),
                        DataCell(
                          Text(
                            dasha['start_date']?.toString() ??
                                l10n.notAvailable,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['end_date']?.toString() ?? l10n.notAvailable,
                          ),
                        ),
                      ]
                      : [
                        DataCell(
                          Text(
                            (dasha['mahadasha_lord'] ??
                                    dasha['lord'] ??
                                    l10n.notAvailable)
                                .toString(),
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['start_date']?.toString() ??
                                l10n.notAvailable,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['end_date']?.toString() ?? l10n.notAvailable,
                          ),
                        ),
                      ];
              return DataRow(cells: cells);
            }).toList()
            : [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      l10n.noData,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  ...List.generate(
                    isYogini ? 3 : 2,
                    (index) => const DataCell(Text('')),
                  ),
                ],
              ),
            ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
        columns: columns,
        rows: rows,
      ),
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
            // Chart skeleton
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            // Table skeletons
            ...List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _error ?? l10n.unknownError,
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
              child: Text(l10n.retryButton),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.kundaliGeneratorTitle),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child:
            _isLoading
                ? _buildSkeletonLoader()
                : _error != null
                ? _buildErrorWidget()
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Info
                      Text(
                        l10n.natalChartTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text: "${l10n.lagnaLabel}: ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "${astroData?['lagna'] ?? l10n.unknown} | ",
                            ),
                            TextSpan(
                              text: "${l10n.rashiLabel}: ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "${astroData?['rashi'] ?? l10n.unknown} | ",
                            ),
                            TextSpan(
                              text: "${l10n.ascDegreeLabel}: ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${(astroData?['ascendant_degree'] ?? 0).toStringAsFixed(2)}°",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // North Indian Chart
                      _buildNorthIndianChart(),

                      // Vimshottari Dasha
                      const SizedBox(height: 32),
                      Text(
                        l10n.vimshottariDashaTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDashaTable(astroData?['vimshottari_dasha'] ?? []),

                      // Yogini Dasha
                      const SizedBox(height: 32),
                      Text(
                        l10n.yoginiDashaTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDashaTable(
                        astroData?['yogini_dasha'] ?? [],
                        isYogini: true,
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}

// Custom painter for the North Indian chart background
class _NorthIndianChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;

    final center = Offset(size.width / 2, size.height / 2);

    // Outer rectangle
    canvas.drawRect(
      Rect.fromLTWH(2, 2, size.width - 4, size.height - 4),
      paint,
    );

    // Diagonal lines
    final lines = [
      // Top to right
      [Offset(center.dx, 2), Offset(size.width - 2, center.dy)],
      // Top to left
      [Offset(center.dx, 2), Offset(2, center.dy)],
      // Left to bottom
      [Offset(2, center.dy), Offset(center.dx, size.height - 2)],
      // Right to bottom
      [Offset(size.width - 2, center.dy), Offset(center.dx, size.height - 2)],
      // Center to bottom-right
      [Offset(center.dx, center.dy), Offset(size.width - 2, size.height - 2)],
      // Center to bottom-left
      [Offset(center.dx, center.dy), Offset(2, size.height - 2)],
      // Top-right to center
      [Offset(size.width - 2, 2), Offset(center.dx, center.dy)],
      // Top-left to center
      [Offset(2, 2), Offset(center.dx, center.dy)],
    ];

    for (final line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
