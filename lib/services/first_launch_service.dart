// lib/services/first_launch_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class FirstLaunchService {
  static final Logger _logger = Logger();

  // Keys for shared preferences
  static const String _hasLaunchedKey = 'has_launched';
  static const String _firstLaunchTimestampKey = 'first_launch_timestamp';
  static const String _appVersionKey = 'app_version_first_launch';
  static const String _launchCountKey = 'launch_count';
  static const String _lastLaunchTimestampKey = 'last_launch_timestamp';

  // Check if this is the first launch ever
  static Future<FirstLaunchResult> checkFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Check if app has been launched before
      final hasLaunched = prefs.getBool(_hasLaunchedKey) ?? false;
      final currentVersion = await _getCurrentAppVersion();

      if (!hasLaunched) {
        // This is the first launch - initialize all values
        await _initializeFirstLaunch(prefs, currentVersion);

        _logger.i('🚀 First launch detected - App version: $currentVersion');

        return FirstLaunchResult(
          isFirstLaunch: true,
          isFirstLaunchForVersion: true,
          launchCount: 1,
          firstLaunchTimestamp: DateTime.now(),
          appVersion: currentVersion,
        );
      } else {
        // Not first launch - update launch count and check if first for this version
        final launchCount = (prefs.getInt(_launchCountKey) ?? 0) + 1;
        final firstLaunchTimestamp = await _getFirstLaunchTimestamp(prefs);
        final firstLaunchVersion = prefs.getString(_appVersionKey) ?? 'unknown';
        final isFirstForVersion = await _checkFirstLaunchForVersion(
          prefs,
          currentVersion,
        );

        // Update launch metrics
        await _updateLaunchMetrics(prefs, launchCount);

        _logger.d('📱 App launch #$launchCount - Version: $currentVersion');

        return FirstLaunchResult(
          isFirstLaunch: false,
          isFirstLaunchForVersion: isFirstForVersion,
          launchCount: launchCount,
          firstLaunchTimestamp: firstLaunchTimestamp ?? DateTime.now(),
          appVersion: currentVersion,
          firstLaunchVersion: firstLaunchVersion,
        );
      }
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Error checking first launch',
        error: e,
        stackTrace: stackTrace,
      );

      // Fallback: assume not first launch to avoid breaking user experience
      return FirstLaunchResult(
        isFirstLaunch: false,
        isFirstLaunchForVersion: false,
        launchCount: 1,
        firstLaunchTimestamp: DateTime.now(),
        appVersion: 'unknown',
        error: e.toString(),
      );
    }
  }

  // Get detailed launch statistics
  static Future<LaunchStatistics> getLaunchStatistics() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final firstLaunchTimestamp = await _getFirstLaunchTimestamp(prefs);
      final lastLaunchTimestamp = await _getLastLaunchTimestamp(prefs);
      final launchCount = prefs.getInt(_launchCountKey) ?? 1;
      final firstLaunchVersion = prefs.getString(_appVersionKey) ?? 'unknown';
      final currentVersion = await _getCurrentAppVersion();

      return LaunchStatistics(
        firstLaunchTimestamp: firstLaunchTimestamp,
        lastLaunchTimestamp: lastLaunchTimestamp,
        totalLaunches: launchCount,
        firstLaunchVersion: firstLaunchVersion,
        currentVersion: currentVersion,
        daysSinceFirstLaunch:
            firstLaunchTimestamp != null
                ? DateTime.now().difference(firstLaunchTimestamp).inDays
                : 0,
      );
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Error getting launch statistics',
        error: e,
        stackTrace: stackTrace,
      );

      return LaunchStatistics(
        firstLaunchTimestamp: DateTime.now(),
        lastLaunchTimestamp: DateTime.now(),
        totalLaunches: 1,
        firstLaunchVersion: 'unknown',
        currentVersion: 'unknown',
        daysSinceFirstLaunch: 0,
        error: e.toString(),
      );
    }
  }

  // Reset first launch state (useful for testing)
  static Future<void> resetFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_hasLaunchedKey);
      await prefs.remove(_firstLaunchTimestampKey);
      await prefs.remove(_appVersionKey);
      await prefs.remove(_launchCountKey);
      await prefs.remove(_lastLaunchTimestampKey);

      _logger.i('🔄 First launch state reset');
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Error resetting first launch',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Force set as first launch (useful for migration scenarios)
  static Future<void> setAsFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentVersion = await _getCurrentAppVersion();

      await _initializeFirstLaunch(prefs, currentVersion);

      _logger.i('🔧 Manually set as first launch');
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Error setting as first launch',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Private helper methods
  static Future<void> _initializeFirstLaunch(
    SharedPreferences prefs,
    String currentVersion,
  ) async {
    final now = DateTime.now();

    await Future.wait([
      prefs.setBool(_hasLaunchedKey, true),
      prefs.setString(_firstLaunchTimestampKey, now.toIso8601String()),
      prefs.setString(_appVersionKey, currentVersion),
      prefs.setInt(_launchCountKey, 1),
      prefs.setString(_lastLaunchTimestampKey, now.toIso8601String()),
    ]);
  }

  static Future<void> _updateLaunchMetrics(
    SharedPreferences prefs,
    int launchCount,
  ) async {
    final now = DateTime.now();

    await Future.wait([
      prefs.setInt(_launchCountKey, launchCount),
      prefs.setString(_lastLaunchTimestampKey, now.toIso8601String()),
    ]);
  }

  static Future<bool> _checkFirstLaunchForVersion(
    SharedPreferences prefs,
    String currentVersion,
  ) async {
    final versionFirstLaunchKey = '${_appVersionKey}_$currentVersion';
    final isFirstForVersion = prefs.getBool(versionFirstLaunchKey) ?? true;

    if (isFirstForVersion) {
      await prefs.setBool(versionFirstLaunchKey, false);
      return true;
    }

    return false;
  }

  static Future<DateTime?> _getFirstLaunchTimestamp(
    SharedPreferences prefs,
  ) async {
    try {
      final timestamp = prefs.getString(_firstLaunchTimestampKey);
      return timestamp != null ? DateTime.parse(timestamp) : DateTime.now();
    } catch (e) {
      _logger.w('⚠️ Error parsing first launch timestamp: $e');
      return DateTime.now();
    }
  }

  static Future<DateTime?> _getLastLaunchTimestamp(
    SharedPreferences prefs,
  ) async {
    try {
      final timestamp = prefs.getString(_lastLaunchTimestampKey);
      return timestamp != null ? DateTime.parse(timestamp) : DateTime.now();
    } catch (e) {
      _logger.w('⚠️ Error parsing last launch timestamp: $e');
      return DateTime.now();
    }
  }

  static Future<String> _getCurrentAppVersion() async {
    try {
      // You can integrate with your package_info or environment config
      // For now, using a placeholder - integrate with your actual version source
      const String version = String.fromEnvironment(
        'APP_VERSION',
        defaultValue: '1.0.0',
      );
      return version;
    } catch (e) {
      _logger.w('⚠️ Error getting app version: $e');
      return 'unknown';
    }
  }
}

// Result class for first launch check
class FirstLaunchResult {
  final bool isFirstLaunch;
  final bool isFirstLaunchForVersion;
  final int launchCount;
  final DateTime firstLaunchTimestamp;
  final String appVersion;
  final String? firstLaunchVersion;
  final String? error;

  const FirstLaunchResult({
    required this.isFirstLaunch,
    required this.isFirstLaunchForVersion,
    required this.launchCount,
    required this.firstLaunchTimestamp,
    required this.appVersion,
    this.firstLaunchVersion,
    this.error,
  });

  bool get hasError => error != null;

  @override
  String toString() {
    return 'FirstLaunchResult('
        'isFirstLaunch: $isFirstLaunch, '
        'isFirstLaunchForVersion: $isFirstLaunchForVersion, '
        'launchCount: $launchCount, '
        'appVersion: $appVersion'
        ')';
  }
}

// Detailed launch statistics
class LaunchStatistics {
  final DateTime? firstLaunchTimestamp;
  final DateTime? lastLaunchTimestamp;
  final int totalLaunches;
  final String firstLaunchVersion;
  final String currentVersion;
  final int daysSinceFirstLaunch;
  final String? error;

  const LaunchStatistics({
    required this.firstLaunchTimestamp,
    required this.lastLaunchTimestamp,
    required this.totalLaunches,
    required this.firstLaunchVersion,
    required this.currentVersion,
    required this.daysSinceFirstLaunch,
    this.error,
  });

  bool get hasError => error != null;

  @override
  String toString() {
    return 'LaunchStatistics('
        'totalLaunches: $totalLaunches, '
        'firstLaunchVersion: $firstLaunchVersion, '
        'currentVersion: $currentVersion, '
        'daysSinceFirstLaunch: $daysSinceFirstLaunch'
        ')';
  }
}
