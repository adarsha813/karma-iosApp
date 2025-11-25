import 'dart:convert';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
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

class HowToAskScreen extends StatefulWidget {
  const HowToAskScreen({Key? key}) : super(key: key);

  @override
  State<HowToAskScreen> createState() => _HowToAskScreenState();
}

class _HowToAskScreenState extends State<HowToAskScreen> {
  List<Question>? _cachedQuestions;
  bool _isLoading = true;
  String? _error;
  bool _retrying = false;

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  static const Duration _cacheDuration = Duration(
    hours: 24,
  ); // Cache for 24 hours
  Completer<void>? _initialLoadCompleter;
  String? _authToken;

  @override
  void initState() {
    super.initState();
    _loadToken();
    _logger.i('🔹 Initializing HowToAskScreen');
    _initialLoadCompleter = Completer<void>();

    _loadQuestionsWithRetry();
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

  String _getLocalizedError(String errorKey) {
    final l10n = AppLocalizations.of(context);
    switch (errorKey) {
      case 'network_error':
        return l10n?.networkError ?? 'Network error occurred';
      case 'timeout_error':
        return l10n?.timeoutError ?? 'Request timed out';
      case 'load_questions_error':
        return l10n?.genericError ?? 'Failed to load questions';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _loadQuestionsWithRetry() async {
    _logger.d('Loading questions with retry logic');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _loadQuestions();
        _logger.i('✅ Successfully loaded questions on attempt $attempt');
        _logAnalyticsEvent(
          'questions_loaded_success',
          params: {
            'attempt': attempt,
            'questions_count': _cachedQuestions?.length ?? 0,
          },
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          '❌ Attempt $attempt failed to load questions',
          error: e,
          stackTrace: stackTrace,
        );

        if (attempt == _maxRetries) {
          _logger.e('💥 All $attempt attempts failed to load questions');
          rethrow;
        }

        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  /// Load from cache first, then update from backend
  Future<void> _loadQuestions() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _retrying = false;
    });

    try {
      final prefs = await SharedPreferences.getInstance();

      // Load cached questions if available and not expired
      final cachedData = prefs.getString('howToAskCache');
      final cacheTimestamp = prefs.getInt('howToAskCacheTimestamp');
      final now = DateTime.now().millisecondsSinceEpoch;

      if (cachedData != null &&
          cacheTimestamp != null &&
          (now - cacheTimestamp) < _cacheDuration.inMilliseconds) {
        try {
          final List<dynamic> data = json.decode(cachedData);
          final cachedQuestions =
              data.map((e) => Question.fromJson(e)).toList();

          if (mounted) {
            setState(() {
              _cachedQuestions = cachedQuestions;
              _isLoading = false;
            });
          }

          _logger.d('📚 Loaded ${cachedQuestions.length} questions from cache');
          _logAnalyticsEvent(
            'cache_loaded',
            params: {'questions_count': cachedQuestions.length},
          );
        } catch (e, stackTrace) {
          _reportError(e, stackTrace, context: 'parse_cached_questions');
          _logger.w('⚠️ Failed to parse cached questions, clearing cache');
          await prefs.remove('howToAskCache');
          await prefs.remove('howToAskCacheTimestamp');
        }
      }

      // Always fetch fresh data in background
      final freshQuestions = await _fetchQuestions();

      if (mounted) {
        setState(() {
          _cachedQuestions = freshQuestions;
          _isLoading = false;
        });
      }

      // Save to cache with timestamp
      await prefs.setString('howToAskCache', json.encode(freshQuestions));
      await prefs.setInt(
        'howToAskCacheTimestamp',
        DateTime.now().millisecondsSinceEpoch,
      );

      _logger.i('💾 Saved ${freshQuestions.length} questions to cache');
      _logAnalyticsEvent(
        'questions_fetched_fresh',
        params: {'questions_count': freshQuestions.length},
      );

      _initialLoadCompleter?.complete();
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'load_questions');

      if (_cachedQuestions == null) {
        // Show error only if no cache available
        if (mounted) {
          setState(() {
            _error = _getLocalizedError('load_questions_error');
            _isLoading = false;
          });
        }
      } else {
        // If we have cached data, just log the error but don't show it to user
        if (mounted) {
          setState(() => _isLoading = false);
        }
        _logger.w('⚠️ Failed to fetch fresh questions, but using cached data');
      }
      _initialLoadCompleter?.completeError(e);
    }
  }

  Future<List<Question>> _fetchQuestions() async {
    final url = Uri.parse('${Environment.baseUrl}/api/howtoask');
    _logger.d('Fetching questions from: $url');

    try {
      final response = await http
          .get(
            url,
            headers: {
              ...Environment.securityHeaders,
              'Authorization': 'Bearer $_authToken', // Use loaded token
            },
          )
          .timeout(_apiTimeout);

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final List<dynamic> data = json.decode(responseBody);

        // Validate and sanitize response data
        final questions =
            data
                .map((item) {
                  if (item is Map<String, dynamic>) {
                    return Question.fromJson(item);
                  }
                  throw const FormatException('Invalid question data format');
                })
                .where((question) {
                  // Filter out invalid questions
                  final isValid =
                      question.id.isNotEmpty &&
                      question.category.isNotEmpty &&
                      question.question.isNotEmpty;
                  if (!isValid) {
                    _logger.w('⚠️ Invalid question skipped: ${question.id}');
                  }
                  return isValid;
                })
                .toList();

        _logger.i('✅ Successfully fetched ${questions.length} questions');
        return questions;
      } else {
        _logger.w('❌ HTTP ${response.statusCode} - Failed to load questions');
        throw Exception('Failed to load questions: ${response.statusCode}');
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout fetching questions');
      throw TimeoutException('Question fetch operation timed out');
    } on FormatException catch (e) {
      _logger.e('📄 Response format error: $e');
      throw FormatException('Invalid response format from server');
    } catch (e) {
      _logger.e('🔴 Error fetching questions: $e');
      rethrow;
    }
  }

  String _getLocalizedCategory(String category, AppLocalizations l10n) {
    final lowerCategory = category.toLowerCase();

    switch (lowerCategory) {
      case 'career':
        return l10n.careerCategory;
      case 'love':
      case 'love & relationships':
      case 'relationships':
        return l10n.loveCategory;
      case 'health':
        return l10n.healthCategory;
      case 'finance':
        return l10n.financeCategory;
      case 'family':
        return l10n.familyCategory;
      case 'education':
        return l10n.educationCategory;
      case 'travel':
        return l10n.travelCategory;
      case 'spiritual':
        return l10n.spiritualCategory;
      case 'general':
        return l10n.generalCategory;
      default:
        return category.isNotEmpty ? category : 'Uncategorized';
    }
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          color: theme.colorScheme.surface,
          child: Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceVariant,
            highlightColor: theme.colorScheme.surface,
            child: const ListTile(
              leading: CircleAvatar(backgroundColor: Colors.white),
              title: SizedBox(
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              ),
              subtitle: SizedBox(
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
              // In _buildErrorWidget:
              _error ?? _getLocalizedError('load_questions_error'),

              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed:
                  _retrying
                      ? null
                      : () {
                        _logAnalyticsEvent('retry_questions_load');
                        setState(() => _retrying = true);
                        _loadQuestionsWithRetry().whenComplete(() {
                          if (mounted) {
                            setState(() => _retrying = false);
                          }
                        });
                      },
              icon:
                  _retrying
                      ? SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                      : Icon(Icons.refresh, color: theme.colorScheme.onPrimary),
              label: Text(
                _retrying ? 'Loading...' : l10n.retryButton,
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

  Widget _buildEmptyState(ThemeData theme, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.help_outline,
            size: 64,
            color: theme.colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noQuestionsAvailable,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              _logAnalyticsEvent('refresh_empty_state');
              _loadQuestionsWithRetry();
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsList(
    List<Question> questions,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    // Group by category
    final Map<String, List<Question>> categorized = {};
    for (var q in questions) {
      final localizedCategory = _getLocalizedCategory(q.category, l10n);
      categorized.putIfAbsent(localizedCategory, () => []).add(q);
    }

    // Sort categories alphabetically
    final sortedCategories =
        categorized.entries.toList()..sort((a, b) => a.key.compareTo(b.key));

    return RefreshIndicator(
      onRefresh: _loadQuestionsWithRetry,
      color: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.background,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children:
            sortedCategories.map((entry) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                color: theme.colorScheme.surface,
                child: ExpansionTile(
                  leading: Icon(
                    _getCategoryIcon(entry.key),
                    color: theme.colorScheme.primary,
                  ),
                  title: Text(
                    entry.key,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    '${entry.value.length} ${entry.value.length == 1 ? 'question' : 'questions'}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  children:
                      entry.value.map((q) {
                        return ListTile(
                          title: Text(
                            q.question,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          onTap: () {
                            _logAnalyticsEvent(
                              'question_selected',
                              params: {
                                'category': entry.key,
                                'question_length': q.question.length,
                              },
                            );
                            Navigator.pop(context, q.question);
                          },
                          leading: Icon(
                            Icons.question_answer,
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          visualDensity: VisualDensity.compact,
                        );
                      }).toList(),
                ),
              );
            }).toList(),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'career':
        return Icons.work;
      case 'love & relationships':
      case 'love':
        return Icons.favorite;
      case 'health':
        return Icons.health_and_safety;
      case 'finance':
        return Icons.attach_money;
      case 'family':
        return Icons.family_restroom;
      case 'education':
        return Icons.school;
      case 'travel':
        return Icons.flight;
      case 'spiritual':
        return Icons.self_improvement;
      default:
        return Icons.lightbulb_outline;
    }
  }

  @override
  void dispose() {
    _logger.d('Disposing HowToAskScreen');
    // ✅ SAFE: Only complete if not already completed
    if (_initialLoadCompleter != null && !_initialLoadCompleter!.isCompleted) {
      _initialLoadCompleter!.completeError('Screen disposed');
    }
    _logAnalyticsEvent(
      'how_to_ask_screen_closed',
      params: {'questions_loaded': _cachedQuestions?.length ?? 0},
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.howToAskTitle),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: theme.colorScheme.background,
        child:
            _isLoading
                ? _buildSkeletonLoader(theme)
                : _error != null &&
                    (_cachedQuestions == null || _cachedQuestions!.isEmpty)
                ? _buildErrorWidget(theme, l10n)
                : _cachedQuestions == null || _cachedQuestions!.isEmpty
                ? _buildEmptyState(theme, l10n)
                : _buildQuestionsList(_cachedQuestions!, theme, l10n),
      ),
    );
  }
}

class Question {
  final String id;
  final String category;
  final String question;

  Question({required this.id, required this.category, required this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      question: json['question']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "category": category, "question": question};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          category == other.category &&
          question == other.question;

  @override
  int get hashCode => Object.hash(id, category, question);
}
