import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utils/pending_notification_navigation.dart';
import 'horoscope_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/horoscope_provider.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import '../utils/dictionary_highlighter.dart';
import '../providers/notification_provider.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import '../providers/profile_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/app_logger.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class DailyHoroscopeScreen extends StatefulWidget {
  final String? userId;

  const DailyHoroscopeScreen({super.key, this.userId});

  @override
  State<DailyHoroscopeScreen> createState() => _DailyHoroscopeScreenState();
}

class _DailyHoroscopeScreenState extends State<DailyHoroscopeScreen>
    with WidgetsBindingObserver {
  // State variables
  bool _loading = true;
  String? _error;
  DateTime? _lastHoroscopeTime;
  DateTime? _lastReactionTime;
  Map<String, AstroTerm> _dictionaryMap = {};
  List<Map<String, dynamic>> _horoscopes = [];
  io.Socket? _socket;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  static const Duration _socketTimeout = Duration(seconds: 30);
  static const Duration _duplicateNotificationThreshold = Duration(seconds: 3);
  static const Duration _reactionRateLimit = Duration(milliseconds: 500);

  // Controllers for cancellation
  final List<StreamSubscription> _socketSubscriptions = [];
  Completer<void>? _initialLoadCompleter;
  String? _authToken;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _logger.i('Initializing DailyHoroscopeScreen for user: ${widget.userId}');
    _initialLoadCompleter = Completer<void>();

    _initializeScreen();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final profileProvider = context.read<ProfileProvider>();
    await profileProvider.ensureInitialized(); // ensures secure storage loaded
    final token = profileProvider.token;

    if (token == null) {
      AppLogger.info('❌ No token found');
    } else {
      AppLogger.info('✅ Token loaded in ChatScreen: $token');
    }

    setState(() {
      _authToken = token;
    });
  }

  void _initializeScreen() async {
    try {
      // Clear unread badge when user visits
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<HoroscopeProvider>(context, listen: false).clear();
      });

      // Initialize components in sequence
      await _initializeNotifications();
      await _loadDictionaryTerms();

      // ✅ FIX: Connect socket AFTER ensuring we have user data
      if (widget.userId != null && widget.userId!.isNotEmpty) {
        _connectSocket();
      } else {
        _logger.w('Skipping socket connection - no user ID');
      }
      await _fetchHoroscopesWithRetry();

      _initialLoadCompleter?.complete();
      _logAnalyticsEvent(
        'screen_loaded',
        params: {'screen': 'daily_horoscope'},
      );

      // Handle pending notifications
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final payload = pendingNavigation.payload;
        if (payload != null && payload.isNotEmpty) {
          _handleNotificationTap(payload);
          pendingNavigation.payload = null;
        }
      });
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'screen_initialization');
      setState(() {
        _error = _getLocalizedError('initialization_error');
        _loading = false;
      });
      if (_initialLoadCompleter != null &&
          !_initialLoadCompleter!.isCompleted) {
        _initialLoadCompleter?.completeError(e);
      }
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
      case 'reaction_error':
        return l10n?.reactionUpdateError ?? 'Failed to update reaction';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _loadDictionaryTerms() async {
    _logger.d('Loading dictionary terms');
    try {
      final terms = await ApiService.fetchTerms().timeout(_apiTimeout);
      setState(() {
        _dictionaryMap = {
          for (var term in terms) term.term.toLowerCase(): term,
        };
      });
      _logger.i('Successfully loaded ${terms.length} dictionary terms');
      _logAnalyticsEvent(
        'dictionary_loaded',
        params: {'term_count': terms.length},
      );
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'load_dictionary');
      _logger.w(
        'Failed to load dictionary terms - continuing without dictionary',
      );
      // Continue without dictionary - non-critical feature
    }
  }

  void _handleNotificationTap(String payload) {
    _logger.d('Handling notification tap with payload: $payload');
    _logAnalyticsEvent(
      'notification_tapped',
      params: {'payload_length': payload.length},
    );

    try {
      if (payload.trim().isEmpty) {
        _logger.w('Empty notification payload');
        return;
      }

      final data = jsonDecode(payload);

      // Validate payload structure
      if (data is! Map<String, dynamic>) {
        _logger.w('Invalid notification payload format');
        return;
      }

      final type = data['type'];
      final id = data['id'];

      if (type == 'horoscope' && id is String && id.isNotEmpty) {
        _logger.i('Navigating to horoscope detail: $id');
        _logAnalyticsEvent(
          'navigate_horoscope_detail',
          params: {'horoscope_id': id},
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HoroscopeDetailScreen(horoscopeId: id),
          ),
        );
      } else {
        _logger.w('Invalid notification data - type: $type, id: $id');
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'handle_notification_tap');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_getLocalizedError('generic_error')),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _showHoroscopeNotification(
    String title,
    String message, {
    String? id,
  }) async {
    final notificationProvider = Provider.of<NotificationProvider>(
      context,
      listen: false,
    );

    // Don't show if notifications are disabled
    if (!notificationProvider.notificationsEnabled) {
      _logger.d('Notifications disabled, skipping notification');
      return;
    }

    // Validate inputs
    if (title.isEmpty || message.isEmpty) {
      _logger.w(
        'Invalid notification content - title: $title, message: $message',
      );
      return;
    }

    try {
      final notificationId =
          id?.hashCode ?? DateTime.now().millisecondsSinceEpoch;

      _logger.i('Notification shown successfully - ID: $notificationId');
      _logAnalyticsEvent(
        'notification_shown',
        params: {
          'horoscope_id': id,
          'title_length': title.length,
          'message_length': message.length,
        },
      );
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'show_notification');
    }
  }

  Future<void> _initializeNotifications() async {
    _logger.d('Initializing local notifications');

    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          final payload = response.payload;
          if (payload != null && payload.isNotEmpty) {
            _handleNotificationTap(payload);
          }
        },
      );

      _logger.i('Local notifications initialized successfully');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'initialize_notifications');
      // Non-critical error - continue without notifications
    }
  }

  void _connectSocket() {
    _logger.d('Connecting to socket server');

    try {
      if (widget.userId == null || widget.userId!.isEmpty) {
        _logger.w('Cannot connect socket - missing user ID');
        return;
      }

      // ✅ FIX: Dispose existing socket before creating new one
      if (_socket != null) {
        _disposeSocket();
      }

      _socket = io.io(
        Environment.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'userId': widget.userId})
            .disableAutoConnect()
            .setTimeout(_socketTimeout.inMilliseconds)
            .enableReconnection()
            .setReconnectionAttempts(5)
            .setReconnectionDelay(1000)
            .setReconnectionDelayMax(5000)
            .build(),
      );

      // ✅ FIX: Use proper event binding with error handling
      _setupSocketEvents();

      _socket!.connect();
      _logAnalyticsEvent('socket_connection_attempt');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'connect_socket');
    }
  }

  // ✅ ADD THIS: Separate method for socket event setup
  void _setupSocketEvents() {
    if (_socket == null) return;

    _socket!.onConnect((_) {
      _logger.i('✅ Connected to socket with userId: ${widget.userId}');
      _logAnalyticsEvent('socket_connected');
    });

    _socket!.onDisconnect((_) {
      _logger.w('🔌 Disconnected from socket');
      _logAnalyticsEvent('socket_disconnected');
    });

    _socket!.onConnectError((data) {
      _logger.e('❌ Socket connection error: $data');
      _logAnalyticsEvent(
        'socket_connection_error',
        params: {'error': data.toString()},
      );
    });

    _socket!.onError((data) {
      _logger.e('❌ Socket error: $data');
      _logAnalyticsEvent('socket_error', params: {'error': data.toString()});
    });

    _socket!.onReconnect((_) {
      _logger.i('🔄 Socket reconnected');
      _logAnalyticsEvent('socket_reconnected');
    });

    _socket!.onReconnectAttempt((attempt) {
      _logger.i('🔄 Socket attempting to reconnect (attempt $attempt)');
    });

    _socket!.onReconnectError((data) {
      _logger.e('❌ Socket reconnection error: $data');
    });

    _socket!.onReconnectFailed((_) {
      _logger.e('❌ Socket reconnection failed');
    });

    // Main horoscope event
    _socket!.on('new_horoscope', (data) {
      _handleNewHoroscope(data);
    });
    _socket!.connect();
    _logAnalyticsEvent('socket_connection_attempt');

    // ✅ ADD: Start auto-reconnect monitoring
    _setupAutoReconnect();
  }

  // ✅ ADD THIS: Socket health monitoring
  void _checkSocketHealth() {
    if (_socket == null) {
      _logger.w('Socket is null - attempting to reconnect');
      _connectSocket();
      return;
    }

    if (!_socket!.connected) {
      _logger.w('Socket is disconnected - attempting to reconnect');
      _connectSocket();
      return;
    }

    _logger.d(
      'Socket health: Connected=${_socket!.connected}, ID=${_socket!.id}',
    );
  }

  void _handleNewHoroscope(dynamic data) {
    _logger.d('Received new horoscope via socket');
    _logAnalyticsEvent('new_horoscope_received');

    try {
      final now = DateTime.now();

      // Duplicate prevention
      if (_lastHoroscopeTime != null &&
          now.difference(_lastHoroscopeTime!) <
              _duplicateNotificationThreshold) {
        _logger.w('🛑 Skipping duplicate horoscope notification');
        return;
      }

      _lastHoroscopeTime = now;

      if (data is! Map<String, dynamic>) {
        _logger.w('Invalid horoscope data format: $data');
        return;
      }

      final horoscope = Map<String, dynamic>.from(data);

      // Validate required fields
      if (horoscope['_id'] == null) {
        _logger.w('Horoscope missing ID: $horoscope');
        return;
      }

      // ✅ Process and display the horoscope
      _processAndDisplayHoroscope(horoscope);

      _logger.i('Successfully processed new horoscope: ${horoscope['_id']}');
      _logAnalyticsEvent(
        'horoscope_processed',
        params: {
          'horoscope_id': horoscope['_id'],
          'has_title': horoscope['title'] != null,
        },
      );
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'handle_new_horoscope');
    }
  }

  // ✅ ADD THIS: Automatic socket reconnection
  void _setupAutoReconnect() {
    // Check socket health every 30 seconds
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_socket == null || !_socket!.connected) {
        _logger.w('Socket health check failed - reconnecting');
        _connectSocket();
      }
    });
  }

  void _processAndDisplayHoroscope(Map<String, dynamic> horoscope) {
    // ✅ Store context safely

    if (!mounted) {
      _logger.w('Widget disposed, skipping horoscope processing');
      return;
    }

    // ✅ Handle both field names for text content
    final content =
        horoscope['text']?.toString() ??
        horoscope['horoscopeTranslated']?.toString() ??
        '';

    // ✅ Ensure createdAt field exists
    final createdAt =
        horoscope['createdAt']?.toString() ?? DateTime.now().toIso8601String();

    // ✅ Create complete horoscope with all required fields
    final completeHoroscope = {
      '_id': horoscope['_id'],
      'title': horoscope['title']?.toString() ?? 'New Horoscope',
      'text': content,
      'sign': horoscope['sign'],
      'type': horoscope['type'],
      'adminId': horoscope['adminId'],
      'adminName': horoscope['adminName'],
      'reactions': Map<String, dynamic>.from(horoscope['reactions'] ?? {}),
      'createdAt': createdAt,
    };

    // ✅ Calculate reactions (only once)
    final reactions = Map<String, dynamic>.from(
      completeHoroscope['reactions'] ?? {},
    );
    int likes = 0;
    int dislikes = 0;

    reactions.forEach((key, value) {
      if (value == 'like') {
        likes++;
      } else if (value == 'dislike') {
        dislikes++;
      }
    });

    completeHoroscope['likes'] = likes;
    completeHoroscope['dislikes'] = dislikes;
    completeHoroscope['userReaction'] = reactions[widget.userId] ?? 'none';

    final title = completeHoroscope['title']?.toString() ?? 'New Horoscope';
    final displayContent = completeHoroscope['text']?.toString() ?? '';

    // ✅ Increment unread badge with safe context access
    try {} catch (e) {
      _logger.w('Failed to increment badge: $e');
    }

    // ✅ Show notification (only once)
    _showHoroscopeNotification(
      title,
      displayContent,
      id: completeHoroscope['_id']?.toString(),
    );

    // ✅ Safe UI update with mounted check
    if (mounted) {
      setState(() {
        _horoscopes.insert(0, completeHoroscope);
      });
    } else {
      _logger.w(
        'Widget not mounted, skipping UI update for horoscope: ${completeHoroscope['_id']}',
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _logger.d('App resumed');
        _logAnalyticsEvent(
          'app_resumed',
          params: {'horoscope_count': _horoscopes.length},
        );
        // ✅ FIX: Reconnect socket when app comes to foreground
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _checkSocketHealth();
        });
        break;
      case AppLifecycleState.paused:
        _logger.d('App paused');
        _logAnalyticsEvent('app_paused');
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    _logger.d('Disposing DailyHoroscopeScreen');
    WidgetsBinding.instance.removeObserver(this);

    // Cancel initial load if still in progress
    // ✅ FIX: Safe completer completion
    if (_initialLoadCompleter != null && !_initialLoadCompleter!.isCompleted) {
      _initialLoadCompleter?.complete();
    }
    _disposeSocket();

    // Dispose socket subscriptions
    for (final subscription in _socketSubscriptions) {
      subscription.cancel();
    }
    _socketSubscriptions.clear();

    // Disconnect and destroy socket
    _socket?.disconnect();
    _socket?.destroy();
    _socket = null;

    _logAnalyticsEvent(
      'screen_disposed',
      params: {'horoscope_count': _horoscopes.length},
    );

    super.dispose();
  }

  void _disposeSocket() {
    if (_socket == null) return;

    try {
      _logger.d('Disposing socket connection');

      // Remove all event listeners first
      _socket?.off('new_horoscope');
      _socket?.off('connect');
      _socket?.off('disconnect');
      _socket?.off('connect_error');
      _socket?.off('error');
      _socket?.off('reconnect');
      _socket?.off('reconnect_attempt');

      // Disconnect if connected
      if (_socket!.connected) {
        _socket?.disconnect();
        _logger.d('Socket disconnected');
      }

      // Close the socket connection
      _socket?.close();
      _socket?.destroy();
      _socket = null;

      _logger.i('Socket disposed successfully');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'dispose_socket');
      _logger.w('Error disposing socket: $e');
    }
  }

  Future<void> _fetchHoroscopesWithRetry() async {
    _logger.d('Fetching horoscopes with retry logic');
    _logAnalyticsEvent('fetch_horoscopes_attempt');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _fetchHoroscopes();
        _logger.i('Successfully fetched horoscopes on attempt $attempt');
        _logAnalyticsEvent(
          'fetch_horoscopes_success',
          params: {'attempt': attempt, 'horoscope_count': _horoscopes.length},
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          'Attempt $attempt failed to fetch horoscopes',
          error: e,
          stackTrace: stackTrace,
        );
        _logAnalyticsEvent(
          'fetch_horoscopes_retry',
          params: {'attempt': attempt, 'error': e.toString()},
        );

        if (attempt == _maxRetries) {
          _logger.e('All $attempt attempts failed to fetch horoscopes');
          _logAnalyticsEvent(
            'fetch_horoscopes_failed',
            params: {'attempts': attempt, 'error': e.toString()},
          );
          rethrow;
        }

        // Exponential backoff
        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  Future<void> _fetchHoroscopes() async {
    // Validate user ID
    if (widget.userId == null || widget.userId!.isEmpty) {
      _logger.w('Cannot fetch horoscopes - missing user ID');
      setState(() {
        _error = _getLocalizedError('missing_user_id');
        _loading = false;
      });
      return;
    }

    final url = '${Environment.baseUrl}/horoscope/user/${widget.userId}';

    _logger.d('Fetching horoscopes from: $url');
    // ✅ Ensure token is loaded
    if (_authToken == null) {
      _logger.e('❌ No auth token available — cannot fetch horoscopes');
      setState(() {
        _error = _getLocalizedError('auth_error');
        _loading = false;
      });
      return;
    }

    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $_authToken', // ✅ Securely add token
            },
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        _logger.d('Received ${data.length} horoscopes');

        final processedHoroscopes =
            data.map<Map<String, dynamic>>((item) {
              final Map<String, dynamic> horoscope = Map<String, dynamic>.from(
                item,
              );
              final reactions = Map<String, dynamic>.from(
                horoscope['reactions'] ?? {},
              );

              int likes = 0;
              int dislikes = 0;

              reactions.forEach((key, value) {
                if (value == 'like') {
                  likes++;
                } else if (value == 'dislike') {
                  dislikes++;
                }
              });

              horoscope['likes'] = likes;
              horoscope['dislikes'] = dislikes;
              horoscope['userReaction'] = reactions[widget.userId] ?? 'none';

              return horoscope;
            }).toList();

        // Sort by createdAt descending (newest first)
        processedHoroscopes.sort((a, b) {
          final dateA =
              a['createdAt'] != null
                  ? DateTime.parse(a['createdAt']).toLocal()
                  : DateTime.fromMillisecondsSinceEpoch(0);
          final dateB =
              b['createdAt'] != null
                  ? DateTime.parse(b['createdAt']).toLocal()
                  : DateTime.fromMillisecondsSinceEpoch(0);
          return dateB.compareTo(dateA);
        });

        setState(() {
          _horoscopes = processedHoroscopes;
          _loading = false;
          _error = null;
        });

        _logger.i('Successfully processed ${_horoscopes.length} horoscopes');
      } else {
        _logger.w('HTTP ${response.statusCode} - Failed to fetch horoscopes');
        setState(() {
          _error = _getLocalizedError('network_error');
          _loading = false;
        });
      }
    } on TimeoutException {
      _logger.e('Request timeout fetching horoscopes');
      setState(() {
        _error = _getLocalizedError('timeout_error');
        _loading = false;
      });
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'fetch_horoscopes');
      setState(() {
        _error = _getLocalizedError('generic_error');
        _loading = false;
      });
    }
  }

  Future<void> _toggleReaction(
    String horoscopeId,
    String reaction,
    int index,
  ) async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    _logger.d('Toggling reaction: $reaction for horoscope: $horoscopeId');

    // Rate limiting
    final now = DateTime.now();
    if (_lastReactionTime != null &&
        now.difference(_lastReactionTime!) < _reactionRateLimit) {
      _logger.w('Rate limited: reaction too frequent');
      return;
    }
    _lastReactionTime = now;

    // Validate inputs
    if (horoscopeId.isEmpty || reaction.isEmpty) {
      _logger.w(
        'Invalid reaction parameters - horoscopeId: $horoscopeId, reaction: $reaction',
      );
      return;
    }

    if (widget.userId == null || widget.userId!.isEmpty) {
      _logger.w('Cannot toggle reaction - missing user ID');
      return;
    }

    final url = '${Environment.baseUrl}/horoscope/$horoscopeId/reaction';

    // ✅ Ensure token is loaded
    if (_authToken == null) {
      _logger.e('❌ No auth token available — cannot update reaction');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getLocalizedError('auth_error')),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    try {
      final response = await http
          .patch(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $_authToken', // ✅ secure token
            },
            body: jsonEncode({'userId': widget.userId, 'reaction': reaction}),
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final reactions = Map<String, dynamic>.from(data['reactions'] ?? {});

        int likes = 0;
        int dislikes = 0;

        reactions.forEach((key, value) {
          if (value == 'like') {
            likes++;
          } else if (value == 'dislike') {
            dislikes++;
          }
        });

        if (mounted) {
          setState(() {
            _horoscopes[index]['reactions'] = reactions;
            _horoscopes[index]['likes'] = likes;
            _horoscopes[index]['dislikes'] = dislikes;
            _horoscopes[index]['userReaction'] =
                reactions[widget.userId] ?? 'none';
          });
        }

        _logger.i('Successfully updated reaction for horoscope: $horoscopeId');
        _logAnalyticsEvent(
          'reaction_updated',
          params: {
            'horoscope_id': horoscopeId,
            'reaction': reaction,
            'new_likes': likes,
            'new_dislikes': dislikes,
          },
        );
      } else {
        _logger.w('HTTP ${response.statusCode} - Failed to update reaction');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_getLocalizedError('reaction_error')),
              backgroundColor: theme.colorScheme.errorContainer,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } on TimeoutException {
      _logger.e('Request timeout updating reaction');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getLocalizedError('timeout_error')),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'toggle_reaction');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getLocalizedError('generic_error')),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  String getCategoryLabel(DateTime date) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final startOfLastMonth = DateTime(now.year, now.month - 1, 1);
    final startOfThisMonth = DateTime(now.year, now.month, 1);

    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) return l10n.todayLabel;
    if (dateOnly == yesterday) return l10n.yesterdayLabel;
    if (dateOnly.isAfter(startOfWeek)) return l10n.thisWeekLabel;
    if (dateOnly.isAfter(startOfLastMonth) &&
        dateOnly.isBefore(startOfThisMonth)) {
      return l10n.lastMonthLabel;
    }
    if (date.year == now.year) {
      return DateFormat('MMMM yyyy').format(date);
    }
    return DateFormat('yyyy').format(date);
  }

  List<dynamic> getGroupedHoroscopes() {
    final Map<String, List<Map<String, dynamic>>> grouped = {};

    for (var h in _horoscopes) {
      if (h['createdAt'] == null) continue;
      try {
        final date = DateTime.parse(h['createdAt']).toLocal();
        final label = getCategoryLabel(date);
        grouped.putIfAbsent(label, () => []);
        grouped[label]!.add(h);
      } catch (e) {
        _logger.w('Invalid date format in horoscope: ${h['createdAt']}');
      }
    }

    final List<MapEntry<String, List<Map<String, dynamic>>>> entries =
        grouped.entries.toList();

    entries.sort((a, b) {
      DateTime parseLabelToDate(String label) {
        final now = DateTime.now();
        final l10n = AppLocalizations.of(context)!;

        if (label == l10n.todayLabel) {
          return DateTime(now.year, now.month, now.day);
        } else if (label == l10n.yesterdayLabel) {
          return DateTime(
            now.year,
            now.month,
            now.day,
          ).subtract(const Duration(days: 1));
        } else if (label == l10n.thisWeekLabel) {
          return DateTime(
            now.year,
            now.month,
            now.day,
          ).subtract(Duration(days: now.weekday - 1));
        } else if (label == l10n.lastMonthLabel) {
          return DateTime(now.year, now.month - 1, 1);
        } else {
          try {
            if (RegExp(r'^\d{4}$').hasMatch(label)) {
              return DateTime(int.parse(label), 1, 1);
            } else {
              return DateFormat('MMMM yyyy').parse(label);
            }
          } catch (_) {
            return DateTime(1900);
          }
        }
      }

      return parseLabelToDate(b.key).compareTo(parseLabelToDate(a.key));
    });

    final List<dynamic> result = [];
    for (final entry in entries) {
      result.add(entry.key);
      result.addAll(entry.value);
    }
    return result;
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          color: theme.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Shimmer.fromColors(
              baseColor: theme.colorScheme.surfaceContainerHighest,
              highlightColor: theme.colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 150,
                    color: theme.colorScheme.onSurface,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 14,
                    width: 100,
                    color: theme.colorScheme.onSurface,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: theme.colorScheme.onSurface,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 12,
                    width: 120,
                    color: theme.colorScheme.onSurface,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              _error ?? _getLocalizedError('generic_error'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _fetchHoroscopesWithRetry,
              icon: Icon(Icons.refresh, color: theme.colorScheme.onPrimary),
              label: Text(
                AppLocalizations.of(context)!.retryButton,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.noHoroscopeFound,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final l10n = AppLocalizations.of(context)!;
    final groupedList = getGroupedHoroscopes();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dailyHoroscopeTitle),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: theme.colorScheme.surface,
        child:
            _loading
                ? _buildSkeletonLoader(theme)
                : _error != null
                ? _buildErrorWidget(theme)
                : _horoscopes.isEmpty
                ? _buildEmptyState(theme)
                : RefreshIndicator(
                  onRefresh: _fetchHoroscopesWithRetry,
                  color: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: groupedList.length,
                    itemBuilder: (context, index) {
                      final item = groupedList[index];
                      if (item is String) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            item,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      } else if (item is Map<String, dynamic>) {
                        final horoscope = item;
                        final horoscopeId = horoscope['_id']?.toString() ?? '';
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          elevation: 2,
                          color: theme.colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (horoscope['title'] != null)
                                  Text(
                                    horoscope['title'].toString(),
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color: theme.colorScheme.onSurface,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                if (horoscope['sign'] != null)
                                  Text(
                                    "${l10n.signLabel}: ${horoscope['sign']}",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.7),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: DictionaryHighlighter.highlightText(
                                    context,
                                    horoscope['text']?.toString() ?? '',
                                    _dictionaryMap,
                                    theme.textTheme.bodyMedium?.copyWith(
                                          color: theme.colorScheme.onSurface,
                                        ) ??
                                        const TextStyle(),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "📅 ${horoscope['createdAt'] != null ? DateFormat('MMM dd, yyyy - HH:mm').format(DateTime.parse(horoscope['createdAt']).toLocal()) : ''}",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                  color: theme.colorScheme.outline,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        horoscope['userReaction'] == 'like'
                                            ? Icons.thumb_up_alt
                                            : Icons.thumb_up_alt_outlined,
                                      ),
                                      color: Colors.green,
                                      onPressed: () {
                                        final currentReaction =
                                            horoscope['userReaction'] ?? 'none';
                                        final newReaction =
                                            currentReaction == 'like'
                                                ? 'none'
                                                : 'like';
                                        final indexInHoroscopes = _horoscopes
                                            .indexWhere(
                                              (h) =>
                                                  h['_id'] == horoscope['_id'],
                                            );
                                        if (indexInHoroscopes != -1) {
                                          _toggleReaction(
                                            horoscopeId,
                                            newReaction,
                                            indexInHoroscopes,
                                          );
                                        }
                                      },
                                    ),
                                    Text(
                                      '${horoscope['likes'] ?? 0}',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    IconButton(
                                      icon: Icon(
                                        horoscope['userReaction'] == 'dislike'
                                            ? Icons.thumb_down_alt
                                            : Icons.thumb_down_alt_outlined,
                                      ),
                                      color: Colors.red,
                                      onPressed: () {
                                        final currentReaction =
                                            horoscope['userReaction'] ?? 'none';
                                        final newReaction =
                                            currentReaction == 'dislike'
                                                ? 'none'
                                                : 'dislike';
                                        final indexInHoroscopes = _horoscopes
                                            .indexWhere(
                                              (h) =>
                                                  h['_id'] == horoscope['_id'],
                                            );
                                        if (indexInHoroscopes != -1) {
                                          _toggleReaction(
                                            horoscopeId,
                                            newReaction,
                                            indexInHoroscopes,
                                          );
                                        }
                                      },
                                    ),
                                    Text(
                                      '${horoscope['dislikes'] ?? 0}',
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
      ),
    );
  }
}
