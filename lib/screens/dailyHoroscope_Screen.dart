import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utils/pending_notification_navigation.dart';
import 'horoscope_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/horoscope_provider.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import '../screens/astroDictionary_Screen.dart';
import '../utils/dictionary_highlighter.dart';

class DailyHoroscopeScreen extends StatefulWidget {
  final String? userId;

  const DailyHoroscopeScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<DailyHoroscopeScreen> createState() => _DailyHoroscopeScreenState();
}

class _DailyHoroscopeScreenState extends State<DailyHoroscopeScreen> {
  bool _loading = true;
  String? _error;
  DateTime? _lastHoroscopeTime;
  Map<String, AstroTerm> _dictionaryMap = {};
  List<Map<String, dynamic>> _horoscopes = [];
  IO.Socket? _socket;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _loadDictionaryTerms(); // ✅ Load dictionary
    // 🧹 Clear unread badge when user visits
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HoroscopeProvider>(context, listen: false).clear();
    });

    _initializeNotifications();
    _connectSocket();
    _fetchHoroscopes();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final payload = pendingNavigation.payload;
      if (payload != null) {
        _handleNotificationTap(payload);
        pendingNavigation.payload = null;
      }
    });
  }

  Future<void> _loadDictionaryTerms() async {
    try {
      final terms = await ApiService.fetchTerms(); // Fetch from your backend
      setState(() {
        _dictionaryMap = {
          for (var term in terms) term.term.toLowerCase(): term,
        };
      });
    } catch (e) {
      print("Failed to load dictionary: $e");
    }
  }

  void _handleNotificationTap(String payload) {
    final data = jsonDecode(payload);
    if (data['type'] == 'horoscope') {
      final id = data['id'];
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HoroscopeDetailScreen(horoscopeId: id),
        ),
      );
    }
  }

  void _showHoroscopeNotification(
    String title,
    String message, {
    String? id,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'horoscope_channel',
      'Horoscope Notifications',
      channelDescription: 'Notifications for new daily horoscopes',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      id.hashCode, // unique ID for the notification
      title,
      message,
      notificationDetails,
      payload: jsonEncode({
        'type': 'horoscope',
        'id': id ?? '',
        'source': 'socket',
      }),
    );
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payload = response.payload;
        if (payload != null) {
          _handleNotificationTap(payload);
        }
      },
    );
  }

  void _connectSocket() {
    _socket = IO.io(
      'https://chat-backend-rvk9.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': widget.userId ?? ''})
          .disableAutoConnect()
          .build(),
    );

    _socket!.onConnect((_) {
      print('✅ Connected to socket with userId: ${widget.userId}');
    });

    _socket!.on('new_horoscope', (data) {
      final now = DateTime.now();

      if (_lastHoroscopeTime != null &&
          now.difference(_lastHoroscopeTime!).inSeconds < 3) {
        print("🛑 Skipping duplicate horoscope notification");
        return;
      }

      _lastHoroscopeTime = now;

      print('📩 Received new_horoscope: $data');

      final horoscope = Map<String, dynamic>.from(data);

      // Initialize likes, dislikes, and userReaction from reactions map if present
      final reactions = Map<String, dynamic>.from(horoscope['reactions'] ?? {});
      int likes = 0;
      int dislikes = 0;
      reactions.forEach((key, value) {
        if (value == 'like')
          likes++;
        else if (value == 'dislike')
          dislikes++;
      });

      horoscope['likes'] = likes;
      horoscope['dislikes'] = dislikes;
      horoscope['userReaction'] = reactions[widget.userId] ?? 'none';

      final title = horoscope['title'] ?? 'New Horoscope';
      final content = horoscope['text'] ?? '';

      // 🔵 Increment unread badge
      Provider.of<HoroscopeProvider>(context, listen: false).increment();

      _showHoroscopeNotification("🔮 $title", content, id: horoscope['_id']);

      setState(() {
        _horoscopes.insert(0, horoscope);
      });
    });

    _socket!.onDisconnect((_) => print('🔌 Disconnected from socket'));
    _socket!.connect();
  }

  @override
  void dispose() {
    _socket?.disconnect();
    _socket?.destroy();
    super.dispose();
  }

  Future<void> _fetchHoroscopes() async {
    if (widget.userId == null || widget.userId!.isEmpty) {
      setState(() {
        _error = 'User ID is missing';
        _loading = false;
      });
      return;
    }

    final url =
        'https://chat-backend-rvk9.onrender.com/horoscope/user/${widget.userId}';
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final List<dynamic> data = json.decode(res.body);

        // Process each horoscope to initialize reaction counts and userReaction
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
                if (value == 'like')
                  likes++;
                else if (value == 'dislike')
                  dislikes++;
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
                  ? DateTime.parse(a['createdAt'])
                  : DateTime.fromMillisecondsSinceEpoch(0);
          final dateB =
              b['createdAt'] != null
                  ? DateTime.parse(b['createdAt'])
                  : DateTime.fromMillisecondsSinceEpoch(0);
          return dateB.compareTo(dateA);
        });
        setState(() {
          _horoscopes = processedHoroscopes;
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to fetch horoscopes';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _loading = false;
      });
    }
  }

  Future<void> _toggleReaction(
    String horoscopeId,
    String reaction,
    int index,
  ) async {
    final url =
        'https://chat-backend-rvk9.onrender.com/horoscope/$horoscopeId/reaction';

    try {
      final res = await http.patch(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': widget.userId, 'reaction': reaction}),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final reactions = Map<String, dynamic>.from(data['reactions'] ?? {});
        int likes = 0;
        int dislikes = 0;

        reactions.forEach((key, value) {
          if (value == 'like')
            likes++;
          else if (value == 'dislike')
            dislikes++;
        });

        setState(() {
          _horoscopes[index]['reactions'] = reactions;
          _horoscopes[index]['likes'] = likes;
          _horoscopes[index]['dislikes'] = dislikes;
          _horoscopes[index]['userReaction'] =
              reactions[widget.userId] ?? 'none';
        });
      } else {
        print('Failed to update reaction');
      }
    } catch (e) {
      print('Error updating reaction: $e');
    }
  }

  String getCategoryLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final startOfWeek = today.subtract(
      Duration(days: today.weekday - 1),
    ); // Monday start
    final startOfLastMonth = DateTime(now.year, now.month - 1, 1);
    final startOfThisMonth = DateTime(now.year, now.month, 1);

    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) return 'Today';
    if (dateOnly == yesterday) return 'Yesterday';
    if (dateOnly.isAfter(startOfWeek)) return 'This Week';
    if (dateOnly.isAfter(startOfLastMonth) &&
        dateOnly.isBefore(startOfThisMonth)) {
      return 'Last Month';
    }
    if (date.year == now.year) {
      // Show month name e.g. June 2025
      return DateFormat('MMMM yyyy').format(date);
    }
    // Older than this year: just year
    return DateFormat('yyyy').format(date);
  }

  List<dynamic> getGroupedHoroscopes() {
    Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var h in _horoscopes) {
      if (h['createdAt'] == null) continue;
      final date = DateTime.parse(h['createdAt']);
      final label = getCategoryLabel(date);
      grouped.putIfAbsent(label, () => []);
      grouped[label]!.add(h);
    }

    List<MapEntry<String, List<Map<String, dynamic>>>> entries =
        grouped.entries.toList();

    entries.sort((a, b) {
      DateTime parseLabelToDate(String label) {
        final now = DateTime.now();
        switch (label) {
          case 'Today':
            return DateTime(now.year, now.month, now.day);
          case 'Yesterday':
            return DateTime(
              now.year,
              now.month,
              now.day,
            ).subtract(Duration(days: 1));
          case 'This Week':
            return DateTime(
              now.year,
              now.month,
              now.day,
            ).subtract(Duration(days: now.weekday - 1));
          case 'Last Month':
            return DateTime(now.year, now.month - 1, 1);
          default:
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

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      itemCount: 5, // Number of placeholder cards to show
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20, width: 150, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 14, width: 100, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(height: 12, width: 120, color: Colors.white),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupedList = getGroupedHoroscopes();

    return Scaffold(
      appBar: AppBar(title: const Text("🌟 Daily Horoscope")),
      body:
          _loading
              ? _buildSkeletonLoader()
              : _error != null
              ? Center(child: Text(_error!))
              : _horoscopes.isEmpty
              ? const Center(child: Text("No horoscope found."))
              : ListView.builder(
                itemCount: groupedList.length,
                itemBuilder: (context, index) {
                  final item = groupedList[index];
                  if (item is String) {
                    // Category header
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  } else if (item is Map<String, dynamic>) {
                    final horoscope = item;
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (horoscope['title'] != null)
                              Text(
                                horoscope['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (horoscope['sign'] != null)
                              Text("Sign: ${horoscope['sign']}"),
                            const SizedBox(height: 8),
                            RichText(
                              text: DictionaryHighlighter.highlightText(
                                context,
                                horoscope['text'] ?? '',
                                _dictionaryMap, // dynamically loaded from API
                              ),
                            ),

                            const SizedBox(height: 4),
                            Text(
                              "📅 ${horoscope['createdAt'] != null ? DateTime.parse(horoscope['createdAt']).toLocal().toString() : ''}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const Divider(height: 20),
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
                                          (h) => h['_id'] == horoscope['_id'],
                                        );
                                    if (indexInHoroscopes != -1) {
                                      _toggleReaction(
                                        horoscope['_id'],
                                        newReaction,
                                        indexInHoroscopes,
                                      );
                                    }
                                  },
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
                                          (h) => h['_id'] == horoscope['_id'],
                                        );
                                    if (indexInHoroscopes != -1) {
                                      _toggleReaction(
                                        horoscope['_id'],
                                        newReaction,
                                        indexInHoroscopes,
                                      );
                                    }
                                  },
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
    );
  }
}
