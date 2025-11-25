import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import '../providers/theme_provider.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class ProfileScreen extends StatefulWidget {
  final String? userId;

  const ProfileScreen({super.key, this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  Map<String, dynamic>? astroData;
  bool _isLoading = true;
  String? _error;
  bool _retrying = false;
  String? _authToken;

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  Completer<void>? _initialLoadCompleter;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _logger.i('Initializing ProfileScreen for user: ${widget.userId}');
    _initialLoadCompleter = Completer<void>();

    _initializeData();
    _loadToken();
  }

  Future<void> _loadToken() async {
    try {
      final profileProvider = context.read<ProfileProvider>();
      await profileProvider.ensureInitialized();

      // ✅ FIX: Add delay to ensure secure storage is fully loaded
      await Future.delayed(const Duration(milliseconds: 100));

      final token = profileProvider.token;

      if (token == null) {
        _logger.w('❌ No token found in ProfileProvider');
      } else {
        _logger.i('✅ Token loaded: ${token.length} characters');
      }

      if (mounted) {
        setState(() {
          _authToken = token;
        });
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'load_token');
      _logger.e('Failed to load token: $e');
    }
  }

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      // Integrate with your analytics service here
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  void _reportError(dynamic error, StackTrace stackTrace, {String? context}) {
    _logger.e('🚨 Error in $context', error: error, stackTrace: stackTrace);

    if (Environment.isProduction) {
      // Integrate with your crash reporting service here
      // Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  String _getLocalizedError(String errorKey) {
    final l10n = AppLocalizations.of(context);
    switch (errorKey) {
      case 'missing_user_id':
        return l10n?.missingUserIdError ?? 'User ID is required';
      case 'network_error':
        return l10n?.networkError ?? 'Network error occurred';
      case 'timeout_error':
        return l10n?.timeoutError ?? 'Request timed out';
      case 'initialization_error':
        return l10n?.genericError ?? 'Failed to initialize application';
      case 'profile_fetch_error':
        return l10n?.genericError ?? 'Failed to load profile';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _initializeData() async {
    _logAnalyticsEvent('profile_screen_loaded');

    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      _logger.d("🔑 Loaded userId: ${profileProvider.userId}");

      if (!mounted) return;

      final userId = widget.userId ?? profileProvider.userId;
      if (userId != null && userId.isNotEmpty) {
        await _fetchAstroProfileWithRetry(userId);
      } else {
        _reportError(
          'User ID is null',
          StackTrace.current,
          context: 'profile_initialization',
        );
        if (mounted) {
          setState(() {
            _error = _getLocalizedError('missing_user_id');
            _isLoading = false;
          });
        }
      }

      _initialLoadCompleter?.complete();
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'profile_initialization');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('initialization_error');
          _isLoading = false;
        });
      }
      _initialLoadCompleter?.completeError(e);
    }
  }

  Future<void> _fetchAstroProfileWithRetry([String? userId]) async {
    _logger.d('Fetching astro profile with retry logic');
    _logAnalyticsEvent('fetch_astro_profile_attempt');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _fetchAstroProfile(userId);
        _logger.i('Successfully fetched astro profile on attempt $attempt');
        _logAnalyticsEvent(
          'fetch_astro_profile_success',
          params: {'attempt': attempt, 'has_data': astroData != null},
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          'Attempt $attempt failed to fetch astro profile',
          error: e,
          stackTrace: stackTrace,
        );
        _logAnalyticsEvent(
          'fetch_astro_profile_retry',
          params: {'attempt': attempt, 'error': e.toString()},
        );

        if (attempt == _maxRetries) {
          _logger.e('All $attempt attempts failed to fetch astro profile');
          _logAnalyticsEvent(
            'fetch_astro_profile_failed',
            params: {'attempts': attempt, 'error': e.toString()},
          );
          rethrow;
        }

        // Exponential backoff
        await Future.delayed(Duration(seconds: attempt * 2));
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
    // ✅ FIX: Ensure token is loaded before making the request
    if (_authToken == null) {
      await _loadToken();
    }
    final actualUserId = userId ?? widget.userId;
    if (actualUserId == null || actualUserId.isEmpty) {
      _logger.w('Cannot fetch astro profile - missing user ID');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('missing_user_id');
          _isLoading = false;
        });
      }
      return;
    }

    // Validate user ID format
    if (!_isValidUserId(actualUserId)) {
      _logger.w('Invalid user ID format: $actualUserId');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('missing_user_id');
          _isLoading = false;
        });
      }
      return;
    }

    final url = '${Environment.baseUrl}/api/kundali/generate/$actualUserId';
    _logger.d('Fetching astro profile from: $url');

    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken',
            },
          )
          .timeout(_apiTimeout);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final decodedData = json.decode(responseBody);

        // Validate response structure
        if (decodedData is! Map<String, dynamic>) {
          throw FormatException('Invalid response format from API');
        }

        setState(() {
          astroData = decodedData;
          _isLoading = false;
        });

        _logAnalyticsEvent(
          'astro_profile_loaded',
          params: {
            'has_lagna': astroData?['lagna'] != null,
            'has_rashi': astroData?['rashi'] != null,
            'houses_count': (astroData?['houses'] as List?)?.length ?? 0,
            'vimshottari_count':
                (astroData?['vimshottari_dasha'] as List?)?.length ?? 0,
            'yogini_count': (astroData?['yogini_dasha'] as List?)?.length ?? 0,
          },
        );
      } else {
        _logger.w('HTTP ${response.statusCode} - Failed to load astro profile');
        if (mounted) {
          setState(() {
            _error = _getLocalizedError('profile_fetch_error');
            _isLoading = false;
          });
        }
      }
    } on TimeoutException {
      _logger.e('Request timeout fetching astro profile');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('timeout_error');
          _isLoading = false;
        });
      }
    } on FormatException catch (e) {
      _logger.e('Format exception parsing astro profile: $e');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('profile_fetch_error');
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'fetch_astro_profile');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('profile_fetch_error');
          _isLoading = false;
        });
      }
    }
  }

  bool _isValidUserId(String userId) {
    // Basic validation - adjust based on your user ID format
    return userId.isNotEmpty &&
        userId.length >= 1 &&
        userId.length <= 100 &&
        !userId.contains(' ') &&
        RegExp(r'^[a-zA-Z0-9\-_]+$').hasMatch(userId);
  }

  // Calculate house information based on ascendant degree
  List<Map<String, dynamic>> _calculateHouseInfo() {
    if (astroData == null) {
      _logger.d('No astro data available for house calculation');
      return [];
    }

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

    final String lagna = astroData?['lagna']?.toString() ?? 'Aries';
    final int ascendantSignIndex = zodiacSigns.indexOf(lagna);
    if (ascendantSignIndex == -1) {
      _logger.w('Invalid lagna sign: $lagna');
      return [];
    }

    final double ascendantDegree =
        (astroData?['ascendant_degree'] ?? 0).toDouble();
    final List<dynamic> housesData = astroData?['houses'] ?? [];

    final List<Map<String, dynamic>> houses = [];

    for (int i = 0; i < 12; i++) {
      final int houseNumber = i + 1;
      final int signIndex = (ascendantSignIndex + i) % 12;
      final String sign = zodiacSigns[signIndex];

      final Map<String, dynamic> houseData =
          i < housesData.length && housesData[i] is Map
              ? Map<String, dynamic>.from(housesData[i] as Map)
              : {'planets': []};

      final double houseDegree = (ascendantDegree + (i * 30)) % 360;
      final int nakshatraIndex = (houseDegree / (360 / 27)).floor();
      final String nakshatra = nakshatras[nakshatraIndex % 27];

      // Validate planets data
      final List<dynamic> planets =
          houseData['planets'] is List ? houseData['planets'] as List : [];

      final List<Map<String, dynamic>> validatedPlanets =
          planets.map((planet) {
            if (planet is Map) {
              return {
                'name': planet['name']?.toString() ?? 'Unknown',
                'degree': (planet['degree'] ?? 0).toDouble(),
                'nakshatra': planet['nakshatra']?.toString() ?? 'Unknown',
              };
            }
            return {'name': 'Unknown', 'degree': 0.0, 'nakshatra': 'Unknown'};
          }).toList();

      houses.add({
        'house': houseNumber,
        'sign': sign,
        'degree': houseDegree,
        'nakshatra': nakshatra,
        'planets': validatedPlanets,
      });
    }

    _logger.d('Calculated ${houses.length} houses');
    return houses;
  }

  // North Indian Chart Renderer
  Widget _buildNorthIndianChart(ThemeData theme) {
    final List<Map<String, dynamic>> calculatedHouses = _calculateHouseInfo();
    final Map<int, Map<String, dynamic>> houses = {};

    for (final house in calculatedHouses) {
      final houseNumber = house['house'] as int;
      if (houseNumber >= 1 && houseNumber <= 12) {
        houses[houseNumber] = house;
      }
    }

    Widget _buildHouse(int number, String x, String y) {
      final house =
          houses[number] ??
          {
            'planets': [],
            'sign': 'Unknown',
            'nakshatra': 'Unknown',
            'degree': 0.0,
          };

      final String sign = house['sign']?.toString() ?? 'Unknown';
      final String nakshatra = house['nakshatra']?.toString() ?? 'Unknown';
      final double degree = (house['degree'] ?? 0.0).toDouble();
      final List<dynamic> planets =
          house['planets'] is List ? house['planets'] : [];

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

      final String zodiacNum = zodiacNumbers[sign]?.toString() ?? '-';

      final position = _parsePosition(x, y);
      if (position == null) {
        return const SizedBox.shrink();
      }

      return Positioned(
        left: position.dx - 25,
        top: position.dy - 25,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          constraints: const BoxConstraints(maxWidth: 120, minWidth: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Zodiac number and sign
              Text(
                '$zodiacNum ($sign)',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      number == 1
                          ? theme.colorScheme.error
                          : theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              // Nakshatra and degree
              Text(
                '$nakshatra ${degree.toStringAsFixed(2)}°',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              // Planets
              if (planets.isNotEmpty)
                ...planets.map<Widget>((planet) {
                  final planetName = planet['name']?.toString() ?? 'Unknown';
                  final planetDegree = (planet['degree'] ?? 0).toDouble();
                  final planetNakshatra =
                      planet['nakshatra']?.toString() ?? 'Unknown';

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        planetName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.secondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${planetDegree.toStringAsFixed(2)}° ($planetNakshatra)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontSize: 8,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }).toList()
              else
                Text(
                  '-',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
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
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          CustomPaint(painter: _NorthIndianChartPainter(theme)),
          ...positions.entries.map((entry) {
            return _buildHouse(entry.key, entry.value['x']!, entry.value['y']!);
          }),
        ],
      ),
    );
  }

  Offset? _parsePosition(String x, String y) {
    try {
      final xPercentage = double.parse(x.replaceAll('%', ''));
      final yPercentage = double.parse(y.replaceAll('%', ''));

      final containerWidth = MediaQuery.of(context).size.width * 0.9;
      final containerHeight = MediaQuery.of(context).size.width * 0.9;

      return Offset(
        (xPercentage / 100) * containerWidth,
        (yPercentage / 100) * containerHeight,
      );
    } catch (e) {
      _logger.e('Error parsing position: x=$x, y=$y', error: e);
      return null;
    }
  }

  // Dasha Table Widget
  Widget _buildDashaTable(
    List<dynamic> dashas,
    ThemeData theme,
    AppLocalizations l10n, {
    bool isYogini = false,
  }) {
    final List<Map<String, dynamic>> validatedDashas =
        dashas
            .where((dasha) => dasha is Map)
            .map<Map<String, dynamic>>(
              (dasha) => Map<String, dynamic>.from(dasha),
            )
            .toList();

    final List<DataColumn> columns =
        isYogini
            ? [
              DataColumn(
                label: Text(
                  l10n.yoginiLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  l10n.lordLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  l10n.startLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  l10n.endLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ]
            : [
              DataColumn(
                label: Text(
                  l10n.lordLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  l10n.startDateLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  l10n.endDateLabel,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ];

    final List<DataRow> rows =
        validatedDashas.isNotEmpty
            ? validatedDashas.map<DataRow>((dasha) {
              final List<DataCell> cells =
                  isYogini
                      ? [
                        DataCell(
                          Text(
                            dasha['yogini']?.toString() ?? l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['lord']?.toString() ?? l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['start_date']?.toString() ??
                                l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['end_date']?.toString() ?? l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['start_date']?.toString() ??
                                l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            dasha['end_date']?.toString() ?? l10n.notAvailable,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ),
                  ...List.generate(
                    isYogini ? 3 : 2,
                    (index) => const DataCell(Text('')),
                  ),
                ],
              ),
            ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(
            theme.colorScheme.surfaceVariant,
          ),
          dataRowColor: MaterialStateProperty.resolveWith<Color?>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              return theme.colorScheme.primary.withAlpha((0.08 * 255).toInt());
            }
            return Colors.transparent;
          }),
          columns: columns,
          rows: rows,
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _logger.d('Profile screen resumed');
        _logAnalyticsEvent('profile_screen_resumed');
        break;
      case AppLifecycleState.paused:
        _logger.d('Profile screen paused');
        _logAnalyticsEvent('profile_screen_paused');
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    _logger.d('Disposing ProfileScreen');
    WidgetsBinding.instance.removeObserver(this);

    // Cancel initial load if still in progress
    if (_initialLoadCompleter != null && !_initialLoadCompleter!.isCompleted) {
      _initialLoadCompleter?.completeError('Screen disposed');
    }

    _logAnalyticsEvent('profile_screen_disposed');

    super.dispose();
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: theme.colorScheme.surfaceVariant,
        highlightColor: theme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic info skeleton
            Container(
              height: 20,
              width: 200,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 20),

            // Chart skeleton
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 32),

            // Table skeletons
            ...List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(ThemeData theme, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              _error ?? _getLocalizedError('generic_error'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (_retrying)
              CircularProgressIndicator(color: theme.colorScheme.primary)
            else
              ElevatedButton.icon(
                onPressed: () {
                  _logAnalyticsEvent('profile_retry_attempt');
                  setState(() => _retrying = true);
                  _fetchAstroProfileWithRetry();
                },
                icon: Icon(Icons.refresh, color: theme.colorScheme.onPrimary),
                label: Text(
                  l10n.retryButton,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.kundaliGeneratorTitle),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: theme.colorScheme.background,
        child: SafeArea(
          child:
              _isLoading
                  ? _buildSkeletonLoader(theme)
                  : _error != null
                  ? _buildErrorWidget(theme, l10n)
                  : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Basic Info
                        Text(
                          l10n.natalChartTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text: "${l10n.lagnaLabel}: ",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${astroData?['lagna'] ?? l10n.unknown}\n",
                                ),
                                TextSpan(
                                  text: "${l10n.rashiLabel}: ",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${astroData?['rashi'] ?? l10n.unknown}\n",
                                ),
                                TextSpan(
                                  text: "${l10n.ascDegreeLabel}: ",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${(astroData?['ascendant_degree'] ?? 0).toStringAsFixed(2)}°",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // North Indian Chart
                        Text(
                          l10n.natalChartTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildNorthIndianChart(theme),

                        // Vimshottari Dasha
                        const SizedBox(height: 32),
                        Text(
                          l10n.vimshottariDashaTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildDashaTable(
                          astroData?['vimshottari_dasha'] ?? [],
                          theme,
                          l10n,
                        ),

                        // Yogini Dasha
                        const SizedBox(height: 32),
                        Text(
                          l10n.yoginiDashaTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildDashaTable(
                          astroData?['yogini_dasha'] ?? [],
                          theme,
                          l10n,
                          isYogini: true,
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}

// Custom painter for the North Indian chart background
class _NorthIndianChartPainter extends CustomPainter {
  final ThemeData theme;

  _NorthIndianChartPainter(this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = theme.colorScheme.onSurface
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
      [Offset(center.dx, 2), Offset(size.width - 2, center.dy)],
      [Offset(center.dx, 2), Offset(2, center.dy)],
      [Offset(2, center.dy), Offset(center.dx, size.height - 2)],
      [Offset(size.width - 2, center.dy), Offset(center.dx, size.height - 2)],
      [Offset(center.dx, center.dy), Offset(size.width - 2, size.height - 2)],
      [Offset(center.dx, center.dy), Offset(2, size.height - 2)],
      [Offset(size.width - 2, 2), Offset(center.dx, center.dy)],
      [Offset(2, 2), Offset(center.dx, center.dy)],
    ];

    for (final line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
