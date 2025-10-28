import 'dart:collection';
import '../config/security_config.dart'; // Add this import

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
  // Action Rate Limiting
  // ----------------------------------------
  final Map<String, DateTime> _actionCooldowns = {};

  bool isActionAllowed(String actionKey, Duration cooldown) {
    final now = DateTime.now();

    if (_actionCooldowns.containsKey(actionKey)) {
      final lastAction = _actionCooldowns[actionKey]!;
      if (now.difference(lastAction) < cooldown) {
        return false;
      }
    }

    _actionCooldowns[actionKey] = now;
    return true;
  }

  Duration? getRemainingCooldown(String actionKey, Duration cooldown) {
    final now = DateTime.now();

    if (!_actionCooldowns.containsKey(actionKey)) return null;

    final lastAction = _actionCooldowns[actionKey]!;
    final remaining = cooldown - now.difference(lastAction);

    return remaining.isNegative ? null : remaining;
  }
}
