import 'dart:collection';
import '../config/security_config.dart';
import '../utils/app_logger.dart';

class RateLimitingService {
  static final RateLimitingService _instance = RateLimitingService._internal();
  factory RateLimitingService() => _instance;
  RateLimitingService._internal();

  final Map<String, Queue<DateTime>> _userMessageTimestamps = {};

  bool canSendMessage(String userId) {
    final now = DateTime.now();
    final oneMinuteAgo = now.subtract(const Duration(minutes: 1));

    // Initialize queue for user if not exists
    _userMessageTimestamps.putIfAbsent(userId, () => Queue<DateTime>());

    final userTimestamps = _userMessageTimestamps[userId]!;

    // Remove timestamps older than 1 minute
    while (userTimestamps.isNotEmpty &&
        userTimestamps.first.isBefore(oneMinuteAgo)) {
      userTimestamps.removeFirst();
    }

    // Check if under limit
    if (userTimestamps.length >= SecurityConfig.maxMessagesPerMinute) {
      return false;
    }

    // Add current timestamp
    userTimestamps.add(now);
    return true;
  }

  int getRemainingMessages(String userId) {
    final now = DateTime.now();
    final oneMinuteAgo = now.subtract(const Duration(minutes: 1));

    final userTimestamps = _userMessageTimestamps[userId];
    if (userTimestamps == null) return SecurityConfig.maxMessagesPerMinute;

    // Remove old timestamps
    while (userTimestamps.isNotEmpty &&
        userTimestamps.first.isBefore(oneMinuteAgo)) {
      userTimestamps.removeFirst();
    }

    return SecurityConfig.maxMessagesPerMinute - userTimestamps.length;
  }

  // ----------------------------------------
  // Action Rate Limiting - FIXED VERSION
  // ----------------------------------------
  final Map<String, DateTime> _actionCooldowns = {};

  bool isActionAllowed(String actionKey, Duration cooldown) {
    final now = DateTime.now();

    // Check if action exists and is within cooldown
    if (_actionCooldowns.containsKey(actionKey)) {
      final lastAction = _actionCooldowns[actionKey]!;
      final timeSinceLastAction = now.difference(lastAction);

      if (timeSinceLastAction < cooldown) {
        // Action is still in cooldown period - BLOCK IT
        return false;
      }
    }

    // Action is allowed - update the timestamp
    _actionCooldowns[actionKey] = now;
    return true;
  }

  Duration? getRemainingCooldown(String actionKey, Duration cooldown) {
    final now = DateTime.now();

    if (!_actionCooldowns.containsKey(actionKey)) return null;

    final lastAction = _actionCooldowns[actionKey]!;
    final timeSinceLastAction = now.difference(lastAction);

    if (timeSinceLastAction >= cooldown) {
      // Cooldown has expired
      return null;
    }

    return cooldown - timeSinceLastAction;
  }

  // Add a method to manually reset cooldown (useful for testing)
  void resetActionCooldown(String actionKey) {
    _actionCooldowns.remove(actionKey);
  }

  // Debug method to check current state
  void debugActionState(String actionKey, Duration cooldown) {
    final now = DateTime.now();
    final lastAction = _actionCooldowns[actionKey];

    if (lastAction == null) {
      AppLogger.info('🔍 $actionKey: No previous action recorded');
      return;
    }

    final timeSinceLastAction = now.difference(lastAction);
    final isAllowed = timeSinceLastAction >= cooldown;

    AppLogger.info(
      '🔍 $actionKey: '
      'Last action: $lastAction, '
      'Time since: $timeSinceLastAction, '
      'Cooldown: $cooldown, '
      'Allowed: $isAllowed',
    );
  }
}
