// services/message_cache_service.dart
import 'package:hive_flutter/hive_flutter.dart';
import '../models/message.dart';
import '../models/hive_message.dart';
import '../utils/app_logger.dart';

class MessageCacheService {
  static const String messagesBoxName = 'chat_messages';
  static const String pendingBoxName = 'pending_messages';
  static const int _maxMessages = 5; // ✅ Changed to 5

  late Box<HiveMessage> _messagesBox;
  late Box<Map> _pendingBox;

  bool _isInitialized = false;

  // Singleton pattern
  static final MessageCacheService _instance = MessageCacheService._internal();
  factory MessageCacheService() => _instance;
  MessageCacheService._internal();

  // Initialize Hive
  Future<void> init() async {
    if (_isInitialized) return;

    try {
      await Hive.initFlutter();

      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(HiveMessageAdapter());
      }

      _messagesBox = await Hive.openBox<HiveMessage>(messagesBoxName);
      _pendingBox = await Hive.openBox<Map>(pendingBoxName);

      _isInitialized = true;
    } catch (e) {
      rethrow;
    }
  }

  // ✅ FIXED: Save message and maintain only latest 5
  Future<void> saveMessage(Message message) async {
    if (!_isInitialized) await init();

    try {
      final hiveMessage = HiveMessage.fromMessage(message);
      await _messagesBox.put(hiveMessage.id, hiveMessage);

      // ✅ CRITICAL FIX: Maintain only latest 5 messages
      await _maintainLatestMessages(); // Changed from _enforceMessageLimit
    } catch (e) {
      AppLogger.error('❌ Failed to save message: $e');
    }
  }

  // ✅ NEW METHOD: Always keep latest 5 messages, remove oldest when adding new
  Future<void> _maintainLatestMessages() async {
    if (_messagesBox.length <= _maxMessages) return;

    // Get all messages sorted by date (oldest first)
    final entries = _messagesBox.toMap().entries.toList();
    entries.sort((a, b) => a.value.createdAt.compareTo(b.value.createdAt));

    // Calculate how many to remove (keep only latest _maxMessages)
    final toRemoveCount = _messagesBox.length - _maxMessages;
    final toRemove = entries.take(toRemoveCount);

    for (final entry in toRemove) {
      await _messagesBox.delete(entry.key);
    }
  }

  // In message_cache_service.dart - Add this method
  Future<void> saveMessages(List<Message> messages) async {
    if (!_isInitialized) await init();

    try {
      // Clear existing cache first
      await _messagesBox.clear();

      if (messages.isEmpty) {
        return;
      }

      // ✅ DEDUPLICATE: Remove duplicate messages by ID
      final uniqueMessages = <String, Message>{};
      for (final message in messages) {
        final safeId = message.safeId;
        // Keep only the first occurrence of each ID
        if (!uniqueMessages.containsKey(safeId)) {
          uniqueMessages[safeId] = message;
        } else {}
      }

      final uniqueMessageList = uniqueMessages.values.toList();

      // Sort messages by date (newest first to take latest)
      final sortedMessages = List<Message>.from(uniqueMessageList)
        ..sort((a, b) {
          final aTime = a.createdAt ?? DateTime(1970);
          final bTime = b.createdAt ?? DateTime(1970);
          return bTime.compareTo(aTime); // Newest first
        });

      // Take only latest 5
      final latestMessages = sortedMessages.take(_maxMessages).toList();

      // Save each message using safeId
      for (final message in latestMessages) {
        final safeMessageId = message.safeId;

        final hiveMessage = HiveMessage.fromMessage(message);
        await _messagesBox.put(safeMessageId, hiveMessage);
      }

      final savedCount = _messagesBox.length;
      if (savedCount != latestMessages.length) {}
    } catch (e, stackTrace) {
      AppLogger.error('❌ Failed to save messages: $e');
      AppLogger.error('Stack trace: $stackTrace');
    }
  }

  // ✅ FIXED: Load messages in correct order (oldest first for display)
  Future<List<Message>> loadMessages() async {
    if (!_isInitialized) await init();

    try {
      final messages =
          _messagesBox.values.map((hiveMsg) => hiveMsg.toMessage()).toList();

      // Sort OLDEST FIRST for proper chat display
      messages.sort((a, b) {
        final aTime = a.createdAt ?? DateTime(1970);
        final bTime = b.createdAt ?? DateTime(1970);
        return aTime.compareTo(bTime);
      });

      return messages;
    } catch (e) {
      return [];
    }
  }

  // ✅ Helper: Get latest N messages
  Future<List<Message>> getLatestMessages({int count = 5}) async {
    final allMessages = await loadMessages();

    // Return the most recent 'count' messages
    if (allMessages.length > count) {
      return allMessages.sublist(allMessages.length - count);
    }
    return allMessages;
  }

  // ✅ Helper: Check if a new message should be added (always true, we handle removal)
  Future<void> addNewMessage(Message message) async {
    await saveMessage(message);
    // _maintainLatestMessages is called inside saveMessage
  }

  // Rest of your existing methods remain the same...
  Future<void> updateMessage(Message message) async {
    if (!_isInitialized) await init();

    try {
      if (_messagesBox.containsKey(message.id)) {
        final hiveMessage = HiveMessage.fromMessage(message);
        await _messagesBox.put(hiveMessage.id, hiveMessage);
      }
    } catch (e) {
      AppLogger.error('❌ Failed to update message: $e');
    }
  }

  Future<void> removeMessage(String id) async {
    if (!_isInitialized) await init();

    try {
      await _messagesBox.delete(id);
    } catch (e) {
      AppLogger.error('❌ Failed to remove message: $e');
    }
  }

  // In MessageCacheService.clearCache()
  Future<void> clearCache() async {
    if (!_isInitialized) await init();

    try {
      await _messagesBox.clear();
    } catch (e) {
      AppLogger.error('❌ Failed to clear cache: $e');
    }
  }

  Future<bool> hasCachedMessages() async {
    if (!_isInitialized) await init();
    return _messagesBox.isNotEmpty;
  }

  Future<int> getCacheSize() async {
    if (!_isInitialized) await init();
    return _messagesBox.length;
  }

  // Pending messages methods (unchanged)
  Future<void> storePendingMessage(Message message) async {
    if (!_isInitialized) await init();

    try {
      final pendingData = {
        'id': message.id,
        'text': message.text,
        'timestamp': DateTime.now().toIso8601String(),
      };

      await _pendingBox.put(message.id!, pendingData);
    } catch (e) {
      AppLogger.error('❌ Failed to store pending message: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getPendingMessages() async {
    if (!_isInitialized) await init();

    try {
      return _pendingBox.values
          .map((data) => Map<String, dynamic>.from(data))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> removePendingMessage(String id) async {
    if (!_isInitialized) await init();

    try {
      await _pendingBox.delete(id);
    } catch (e) {
      AppLogger.error('❌ Failed to remove pending message: $e');
    }
  }

  Future<void> clearPendingMessages() async {
    if (!_isInitialized) await init();

    try {
      await _pendingBox.clear();
    } catch (e) {
      AppLogger.error('❌ Failed to clear pending messages: $e');
    }
  }

  Future<bool> hasPendingMessages() async {
    if (!_isInitialized) await init();
    return _pendingBox.isNotEmpty;
  }

  Future<void> dispose() async {
    if (_isInitialized) {
      await _messagesBox.close();
      await _pendingBox.close();
      _isInitialized = false;
    }
  }
}
