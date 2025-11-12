import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../providers/dictionary_provider.dart';
import '../providers/profile_provider.dart';

import 'package:shimmer/shimmer.dart';
import '../utils/dictionary_highlighter.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';

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

// Initialize the FlutterLocalNotificationsPlugin globally
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

late NotificationProvider _notificationProvider;

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

class NotificationsScreen extends StatefulWidget {
  final String userId;

  const NotificationsScreen({super.key, required this.userId});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  Map<String, List<Map<String, dynamic>>> notificationsByCategory = {};
  bool _isLoading = true;
  String? _error;
  bool _retrying = false;
  Completer<void>? _markAllReadCompleter;
  bool _isDisposed = false;
  String? _authToken;

  late IO.Socket _socket;
  List<String> _categories = [];
  final ScrollController _scrollController = ScrollController();

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  static const int _socketTimeoutMs = 30000; // 30 seconds in milliseconds
  Completer<void>? _initialLoadCompleter;

  @override
  void initState() {
    super.initState();
    _loadToken();
    _logger.i('🔹 Initializing NotificationsScreen for user: ${widget.userId}');
    _initialLoadCompleter = Completer<void>();

    _initializeScreen();
  }

  Future<void> _loadToken() async {
    final profileProvider = context.read<ProfileProvider>();
    await profileProvider.ensureInitialized(); // ensures secure storage loaded
    final token = profileProvider.token;

    if (token == null) {
      debugPrint('❌ No token found');
    } else {
      debugPrint('✅ Token loaded in ChatScreen: $token');
    }

    setState(() {
      _authToken = token;
    });
  }

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  void _reportError(dynamic error, StackTrace stackTrace, {String? context}) {
    _logger.e('🚨 Error in $context', error: error, stackTrace: stackTrace);

    if (Environment.isProduction) {
      // Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  String _getLocalizedError(String errorKey, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (errorKey) {
      case 'network_error':
        return l10n?.networkError ?? 'Network error occurred';
      case 'timeout_error':
        return l10n?.timeoutError ?? 'Request timed out';
      case 'load_notifications_error':
        return l10n?.genericError ?? 'Failed to load notifications';
      case 'mark_read_error':
        return l10n?.genericError ?? 'Failed to mark as read';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  void _initializeScreen() async {
    try {
      _tabController = TabController(length: 1, vsync: this);
      _tabController!.addListener(() => setState(() {}));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final provider = Provider.of<NotificationProvider>(
          context,
          listen: false,
        );
        provider.setNotificationScreenOpen(true);
        provider.clearUnreadCount();
        _notificationProvider = provider;
      });

      await _initializeNotifications();
      await _fetchNotificationsWithRetry();
      _setupSocket();

      _initialLoadCompleter?.complete();
      _logAnalyticsEvent(
        'notifications_screen_loaded',
        params: {
          'user_id': widget.userId,
          'categories_count': _categories.length,
        },
      );
    } catch (e, stackTrace) {
      _reportError(
        e,
        stackTrace,
        context: 'notifications_screen_initialization',
      );
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('load_notifications_error', context);
          _isLoading = false;
        });
      }
      _initialLoadCompleter?.completeError(e);
    }
  }

  Future<void> _initializeNotifications() async {
    _logger.d('Initializing local notifications');

    try {
      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initSettings = InitializationSettings(
        android: androidSettings,
      );

      await flutterLocalNotificationsPlugin.initialize(initSettings);
      _logger.i('✅ Local notifications initialized successfully');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'initialize_notifications');
      // Non-critical error - continue without local notifications
    }
  }

  Future<void> _fetchNotificationsWithRetry() async {
    _logger.d('Fetching notifications with retry logic');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _fetchNotifications();
        _logger.i('✅ Successfully fetched notifications on attempt $attempt');
        _logAnalyticsEvent(
          'notifications_fetch_success',
          params: {'attempt': attempt, 'categories_count': _categories.length},
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          '❌ Attempt $attempt failed to fetch notifications',
          error: e,
          stackTrace: stackTrace,
        );

        if (attempt == _maxRetries) {
          _logger.e('💥 All $attempt attempts failed to fetch notifications');
          rethrow;
        }

        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  Future<void> _fetchNotifications({bool skipUnreadCount = false}) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _retrying = false;
    });

    final url = Uri.parse(
      '${Environment.baseUrl}/notifications/${widget.userId}',
    );

    _logger.d('Fetching notifications from: $url');

    try {
      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken',
            },
          )
          .timeout(_apiTimeout);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> data = json.decode(responseBody);

        _logger.d('📩 Raw notifications response: ${data.keys}');

        final Map<String, List<Map<String, dynamic>>> cleanedData = {};

        data.forEach((category, value) {
          if (value is List) {
            final validNotifications =
                value.where((msg) {
                  final id = msg['_id']?.toString() ?? '';
                  return id.isNotEmpty;
                }).toList();

            _logger.d(
              '📊 Category "$category" has ${validNotifications.length} notifications',
            );

            cleanedData[category
                .toLowerCase()] = List<Map<String, dynamic>>.from(
              validNotifications.map((msg) {
                // ✅ FIXED: Use the exact structure from backend
                return {
                  "id": msg['_id']?.toString() ?? '',
                  "message": msg['message']?.toString() ?? 'No message',
                  "read": msg['read'] == true,
                  "createdAt":
                      msg['createdAt']?.toString() ??
                      DateTime.now().toIso8601String(),
                  "category": category.toLowerCase(), // ✅ ADD CATEGORY
                  "translations": msg['translations'], // ✅ ADD TRANSLATIONS
                  "originalMessage":
                      msg['originalMessage']
                          ?.toString(), // ✅ ADD ORIGINAL MESSAGE
                };
              }),
            );
          }
        });

        if (mounted) {
          setState(() {
            notificationsByCategory = cleanedData;
            _categories =
                cleanedData.keys.where((key) => key != 'all').toList();
            _isLoading = false;

            _logger.d(
              '📈 Loaded ${cleanedData.length} categories with total ${_getAllNotifications().length} notifications',
            );

            // Recreate tab controller with new categories
            _tabController?.dispose();
            _tabController = TabController(
              length: _categories.length + 1, // +1 for "All" tab
              vsync: this,
            );
            _tabController!.addListener(() => setState(() {}));
            _tabController!.index = 0;
          });
        }

        if (!skipUnreadCount) {
          final count = _getUnreadCount();
          _notificationProvider.setUnreadCount(count);
          _logger.d('🔔 Unread count: $count');
        }

        _logAnalyticsEvent(
          'notifications_processed',
          params: {
            'total_categories': cleanedData.length,
            'total_notifications': cleanedData.values.fold(
              0,
              (sum, list) => sum + list.length,
            ),
          },
        );
      } else {
        _logger.w(
          '❌ HTTP ${response.statusCode} - Failed to load notifications: ${response.body}',
        );
        if (mounted) {
          setState(() {
            _error = _getLocalizedError('load_notifications_error', context);
            _isLoading = false;
          });
        }
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout fetching notifications');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('timeout_error', context);
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'fetch_notifications');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('load_notifications_error', context);
          _isLoading = false;
        });
      }
    }
  }

  void _setupSocket() {
    _logger.d('Setting up socket connection');

    try {
      _socket = IO.io(Environment.socketUrl, <String, dynamic>{
        'transports': ['websocket'],
        'query': {'userId': widget.userId},
        'autoConnect': false, // equivalent of disableAutoConnect()
        'reconnection': true, // enable reconnection
        'reconnectionAttempts': 5,
        'reconnectionDelay': 1000,
        'timeout': _socketTimeoutMs,
      });

      _socket.onConnect((_) {
        _logger.i('✅ Socket connected for notifications');
        _socket.emit('joinRoom', widget.userId);
        _logAnalyticsEvent('socket_connected_notifications');
      });

      _socket.onDisconnect((_) {
        _logger.w('🔌 Socket disconnected from notifications');
        _logAnalyticsEvent('socket_disconnected_notifications');
      });

      _socket.onConnectError((data) {
        _logger.e('❌ Socket connection error: $data');
        _logAnalyticsEvent('socket_connection_error_notifications');
      });

      _socket.onError((data) {
        _logger.e('❌ Socket error: $data');
        _logAnalyticsEvent('socket_error_notifications');
      });

      _socket.on('newNotification', (data) {
        _handleNewNotification(data);
      });

      _socket.connect();
      _logAnalyticsEvent('socket_connection_attempt_notifications');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'setup_socket_notifications');
    }
  }

  void _handleNewNotification(dynamic data) {
    _logger.d('📩 Received new notification via socket: $data');
    _logAnalyticsEvent('new_notification_received');

    try {
      if (data is! Map<String, dynamic>) {
        _logger.w('Invalid notification data format: $data');
        return;
      }

      // ✅ FIXED: Match backend socket structure exactly
      final id = data["_id"]?.toString() ?? "";
      final message = data["message"]?.toString() ?? "";
      final category = (data["category"] ?? "general").toString().toLowerCase();
      final read = data["read"] == true;
      final createdAt =
          data["createdAt"]?.toString() ?? DateTime.now().toIso8601String();
      final translations =
          data["translations"] is Map
              ? Map<String, dynamic>.from(data["translations"])
              : null;

      // Validate required fields
      if (id.isEmpty) {
        _logger.w('Invalid notification - missing ID');
        return;
      }

      _logger.d(
        '📝 Processing socket notification: category=$category, message=$message',
      );

      if (mounted) {
        setState(() {
          // ✅ FIXED: Ensure category exists
          if (!notificationsByCategory.containsKey(category)) {
            notificationsByCategory[category] = [];
            _categories =
                notificationsByCategory.keys
                    .where((key) => key != 'all')
                    .toList();

            // Update tab controller
            final previousIndex = _tabController?.index ?? 0;
            _tabController?.dispose();
            _tabController = TabController(
              length: _categories.length + 1,
              vsync: this,
            );
            _tabController!.addListener(() => setState(() {}));
            _tabController!.index = previousIndex.clamp(0, _categories.length);

            _logger.d('➕ Added new category: $category');
          }

          // ✅ FIXED: Check for duplicates
          final existingIndex =
              notificationsByCategory[category]?.indexWhere(
                (n) => n["id"] == id,
              ) ??
              -1;

          if (existingIndex == -1) {
            // Add new notification at the top with complete data
            notificationsByCategory[category]?.insert(0, {
              "id": id,
              "message": message,
              "read": read,
              "createdAt": createdAt,
              "category": category,
              "translations": translations,
            });

            _logger.d('✅ Added socket notification to category: $category');

            // Scroll to top
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }

            // Update unread count
            // ✅ FIXED: Only increment unread count if notification screen is NOT open
            if (!read) {
              final provider = Provider.of<NotificationProvider>(
                context,
                listen: false,
              );

              // Check if notification screen is currently open
              if (!provider.isNotificationScreenOpen) {
                final newCount = provider.unreadCount + 1;
                provider.setUnreadCount(newCount);
                _logger.d('📈 Updated unread count: $newCount (screen closed)');
              } else {
                _logger.d(
                  'ℹ️ Notification screen open - skipping unread count increment',
                );

                // Optional: Still mark as unread in local state for visual feedback
                // but don't update the badge count
                if (mounted) {
                  setState(() {
                    // Ensure the notification shows as unread visually
                    // but don't trigger badge update
                  });
                }
              }
            }
          } else {
            _logger.d('ℹ️ Socket notification already exists, updating');
            // Update existing notification
            notificationsByCategory[category]?[existingIndex] = {
              "id": id,
              "message": message,
              "read": read,
              "createdAt": createdAt,
              "category": category,
              "translations": translations,
            };
          }
        });
      }

      _logAnalyticsEvent(
        'socket_notification_processed',
        params: {
          'category': category,
          'has_message': message.isNotEmpty,
          'is_read': read,
        },
      );
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'handle_socket_notification');
      _logger.e('❌ Error handling socket notification: $e');
    }
  }

  Future<void> _markAllNotificationsAsRead() async {
    _logger.d('Marking all notifications as read');
    _logAnalyticsEvent('mark_all_read_attempt');

    try {
      final response = await http
          .post(
            Uri.parse('${Environment.baseUrl}/notifications/mark-all-read'),
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken',
            },
            body: jsonEncode({"userId": widget.userId}),
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            notificationsByCategory.forEach((key, list) {
              for (var notif in list) {
                notif['read'] = true;
              }
            });
          });
        }
        _notificationProvider.setUnreadCount(0);
        _logAnalyticsEvent('mark_all_read_success');

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('All notifications marked as read'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        _logger.w('❌ HTTP ${response.statusCode} - Failed to mark all as read');
        _logAnalyticsEvent('mark_all_read_failed');
        throw Exception('Failed to mark all notifications as read');
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout marking all as read');
      _logAnalyticsEvent('mark_all_read_timeout');
      throw TimeoutException('Mark all read operation timed out');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'mark_all_notifications_read');
      _logAnalyticsEvent(
        'mark_all_read_error',
        params: {'error': e.toString()},
      );
      rethrow;
    }
  }

  Future<void> _markNotificationAsRead(String notificationId) async {
    if (_authToken == null) {
      _logger.w('❌ Cannot mark notifications as read: no auth token');
      return; // silent fail
    }
    _logger.d('Marking notification as read: $notificationId');

    try {
      final response = await http
          .post(
            Uri.parse('${Environment.baseUrl}/notifications/mark-read'),
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken', // use token
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              "notificationId": notificationId,
              "userId": widget.userId,
            }),
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        _logAnalyticsEvent(
          'notification_marked_read',
          params: {'notification_id': notificationId},
        );
      } else {
        _logger.w(
          '❌ HTTP ${response.statusCode} - Failed to mark notification as read',
        );
        throw Exception('Failed to mark notification as read');
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout marking notification as read');
      throw TimeoutException('Mark read operation timed out');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'mark_notification_read');
      // Don't rethrow - this is a non-critical operation
    }
  }

  int _getUnreadCount() {
    int count = 0;
    notificationsByCategory.forEach((category, notifications) {
      count += notifications.where((n) => !n['read']).length;
    });
    return count;
  }

  List<Map<String, dynamic>> _getAllNotifications() {
    final all = notificationsByCategory.values.expand((list) => list).toList();
    all.sort(
      (a, b) => DateTime.parse(
        b["createdAt"],
      ).compareTo(DateTime.parse(a["createdAt"])),
    );
    return all;
  }

  Widget _buildSkeletonLoader({int itemCount = 10}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 8),
                    ),
                    Container(height: 14, width: 150, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget() {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              _error ?? _getLocalizedError('load_notifications_error', context),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed:
                  _retrying
                      ? null
                      : () {
                        _logAnalyticsEvent('retry_notifications_load');
                        setState(() => _retrying = true);
                        _fetchNotificationsWithRetry().whenComplete(() {
                          if (mounted) {
                            setState(() => _retrying = false);
                          }
                        });
                      },
              icon:
                  _retrying
                      ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : const Icon(Icons.refresh),
              label: Text(_retrying ? 'Loading...' : l10n.retryButton),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> items) {
    final l10n = AppLocalizations.of(context)!;
    final dictionaryMap = context.watch<DictionaryProvider>().dictionaryMap;

    _logger.d('🔄 Building notification list with ${items.length} items');

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noNotifications,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final message = item['message'] ?? 'No message';
        final read = item['read'] ?? false;
        final notificationId = item['id'] ?? '';
        final category = item['category'] ?? 'unknown'; // ✅ Now used
        final createdAt = item['createdAt'] ?? '';

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          elevation: 1,
          child: ListTile(
            leading: Icon(
              _getCategoryIcon(category), // ✅ Use category for different icons
              color: read ? Colors.grey : Theme.of(context).primaryColor,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Add category badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(category).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: _getCategoryColor(category),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: DictionaryHighlighter.highlightText(
                    context,
                    message,
                    dictionaryMap,
                    TextStyle(
                      fontSize: 14,
                      color: read ? Colors.grey.shade600 : Colors.black87,
                      fontWeight: read ? FontWeight.normal : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              _formatDate(createdAt),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            trailing:
                read
                    ? null
                    : Icon(
                      Icons.circle,
                      size: 12,
                      color: Theme.of(context).primaryColor,
                    ),
            onTap: () async {
              if (!read && notificationId.isNotEmpty) {
                _logger.d('👆 Marking notification as read: $notificationId');

                if (mounted) {
                  setState(() => items[index]['read'] = true);
                }

                // Update provider unread count immediately
                final provider = Provider.of<NotificationProvider>(
                  context,
                  listen: false,
                );
                final newUnread = provider.unreadCount - 1;
                provider.setUnreadCount(
                  newUnread.clamp(0, double.infinity).toInt(),
                );

                await _markNotificationAsRead(notificationId);
              }
            },
          ),
        );
      },
    );
  }

  // ✅ Helper methods for category styling
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'horoscope':
        return Icons.auto_awesome;
      case 'chat':
        return Icons.chat;
      case 'system':
        return Icons.settings;
      case 'updates':
        return Icons.update;
      case 'offer':
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'horoscope':
        return Colors.purple;
      case 'chat':
        return Colors.blue;
      case 'system':
        return Colors.orange;
      case 'updates':
        return Colors.green;
      case 'offer':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inMinutes < 1) return 'Just now';
      if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
      if (difference.inHours < 24) return '${difference.inHours}h ago';
      if (difference.inDays < 7) return '${difference.inDays}d ago';

      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Unknown date';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_tabController == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(l10n.loading),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: _isLoading ? null : _markAllNotificationsAsRead,
            tooltip: l10n.markAllAsRead,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: CategoryTabs(
            tabController: _tabController!,
            categories: _categories,
            l10n: l10n,
          ),
        ),
      ),
      body: SafeArea(
        child:
            _isLoading
                ? _buildSkeletonLoader()
                : _error != null
                ? _buildErrorWidget()
                : TabBarView(
                  controller: _tabController!,
                  children: [
                    _buildNotificationList(_getAllNotifications()),
                    ..._categories.map(
                      (cat) => _buildNotificationList(
                        notificationsByCategory[cat] ?? [],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  @override
  void dispose() {
    _isDisposed = true;

    _logger.d('🛑 Starting NotificationsScreen dispose process');

    // ✅ SAFE: Cancel any pending operations first
    _cancelPendingOperations();

    // ✅ SAFE: Socket cleanup (non-blocking)
    _safeSocketCleanup();

    // ✅ SAFE: Mark notifications as read with disposal protection
    _safeMarkAllNotificationsAsReadOnDispose();

    // ✅ SAFE: Update provider state without causing rebuilds
    _safeUpdateNotificationScreenState();

    // ✅ SAFE: Dispose controllers
    _safeDisposeControllers();

    _logAnalyticsEvent('notifications_screen_disposed');

    super.dispose();

    _logger.d('✅ NotificationsScreen dispose completed safely');
  }

  void _cancelPendingOperations() {
    _logger.d('🔄 Canceling pending operations');

    // Safely complete any pending completers
    if (_markAllReadCompleter != null && !_markAllReadCompleter!.isCompleted) {
      _markAllReadCompleter!.complete();
      _logger.d('✅ Mark all read completer completed');
    }
    _markAllReadCompleter = null;

    if (_initialLoadCompleter != null && !_initialLoadCompleter!.isCompleted) {
      _initialLoadCompleter!.completeError('Screen disposed');
      _logger.d('✅ Initial load completer completed with error');
    }
    _initialLoadCompleter = null;
  }

  void _safeSocketCleanup() {
    try {
      _logger.d('🔌 Starting socket cleanup');

      if (_socket.connected) {
        _socket.disconnect();
        _logger.d('✅ Socket disconnected');
      }

      _socket.destroy();
      _logger.d('✅ Socket destroyed');
    } catch (e) {
      _logger.w('⚠️ Non-critical error during socket cleanup: $e');
      // Don't rethrow - socket cleanup failures are non-critical
    }
  }

  void _safeMarkAllNotificationsAsReadOnDispose() {
    if (_isDisposed) return;

    _logger.d('📖 Marking all notifications as read on dispose');

    try {
      // Use microtask to avoid setState during dispose
      Future.microtask(() async {
        try {
          // Check if we have any unread notifications
          final hasUnread = notificationsByCategory.values.any(
            (list) => list.any((n) => n['read'] == false),
          );

          if (hasUnread && mounted) {
            _logger.d('🔄 Marking ${_getUnreadCount()} unread notifications');
            await _markAllNotificationsAsReadSilent();
          } else {
            _logger.d('ℹ️ No unread notifications to mark');
          }
        } catch (e) {
          _logger.w('⚠️ Non-critical error in mark all read on dispose: $e');
        }
      });
    } catch (e) {
      _logger.w('⚠️ Error scheduling mark all read: $e');
    }
  }

  void _safeUpdateNotificationScreenState() {
    _logger.d('🔄 Updating notification screen state to closed');

    try {
      // Use post-frame callback to avoid widget tree conflicts
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          if (!_isDisposed) {
            _notificationProvider.setNotificationScreenOpen(false);
            _logger.d('✅ Notification screen state updated to closed');
          }
        } catch (e) {
          // Expected to fail sometimes during dispose - this is OK
          _logger.d('ℹ️ Expected error during notification state update: $e');
        }
      });
    } catch (e) {
      _logger.w('⚠️ Error scheduling screen state update: $e');
    }
  }

  void _safeDisposeControllers() {
    _logger.d('🔄 Disposing controllers');

    try {
      _tabController?.removeListener(() {});
      _tabController?.dispose();
      _logger.d('✅ Tab controller disposed');
    } catch (e) {
      _logger.w('⚠️ Error disposing tab controller: $e');
    }

    try {
      _scrollController.dispose();
      _logger.d('✅ Scroll controller disposed');
    } catch (e) {
      _logger.w('⚠️ Error disposing scroll controller: $e');
    }
  }

  // ✅ NEW: Silent version without setState
  Future<void> _markAllNotificationsAsReadSilent() async {
    _logger.d('🔇 Silent mark all notifications as read');

    try {
      final response = await http
          .post(
            Uri.parse('${Environment.baseUrl}/notifications/mark-all-read'),
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken',
            },
            body: jsonEncode({"userId": widget.userId}),
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        _logger.d('✅ All notifications marked as read silently');

        // Update provider without UI updates
        _notificationProvider.setUnreadCount(0);

        _logAnalyticsEvent('mark_all_read_success_silent');
      } else {
        _logger.w(
          '❌ HTTP ${response.statusCode} - Silent mark all read failed',
        );
        _logAnalyticsEvent('mark_all_read_failed_silent');
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout in silent mark all read');
      _logAnalyticsEvent('mark_all_read_timeout_silent');
    } catch (e) {
      _logger.w('⚠️ Non-critical error in silent mark all read: $e');
      _logAnalyticsEvent(
        'mark_all_read_error_silent',
        params: {'error': e.toString()},
      );
      // Don't rethrow - this is a non-critical operation during dispose
    }
  }
}

class CategoryTabs extends StatelessWidget {
  final TabController tabController;
  final List<String> categories;
  final AppLocalizations l10n;

  const CategoryTabs({
    super.key,
    required this.tabController,
    required this.categories,
    required this.l10n,
  });

  String _getCategoryDisplayName(String category) {
    switch (category.toLowerCase()) {
      case 'general':
        return l10n.generalCategory;
      case 'horoscope':
        return l10n.horoscopeCategory;
      case 'chat':
        return l10n.chatCategory;
      case 'system':
        return l10n.systemCategory;
      case 'updates':
        return l10n.updateCategory;
      default:
        return category.capitalize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            children: [
              // All tab
              GestureDetector(
                onTap: () => tabController.animateTo(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        tabController.index == 0
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    l10n.allTab,
                    style: TextStyle(
                      color:
                          tabController.index == 0
                              ? Colors.white
                              : Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Category tabs
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final tabIndex = index + 1;
                      final selected = tabController.index == tabIndex;
                      final cat = categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => tabController.animateTo(tabIndex),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selected
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _getCategoryDisplayName(cat),
                              style: TextStyle(
                                color:
                                    selected
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
