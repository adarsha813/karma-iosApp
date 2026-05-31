import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import 'astro_term_detail_screen.dart';
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
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class AstroDictionaryScreen extends StatefulWidget {
  const AstroDictionaryScreen({super.key});

  @override
  State<AstroDictionaryScreen> createState() => _AstroDictionaryScreenState();
}

class _AstroDictionaryScreenState extends State<AstroDictionaryScreen> {
  List<AstroTerm> _terms = [];
  List<AstroTerm> _filteredTerms = [];
  bool _loading = true;
  String? _error;
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounceTimer;

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  static const Duration _searchDebounceDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _logAnalyticsEvent('astro_dictionary_screen_opened');
    _loadTermsWithRetry();

    _searchController.addListener(_onSearchChanged);
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
      case 'load_terms_error':
        return l10n?.genericError ?? 'Failed to load terms';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _loadTermsWithRetry() async {
    _logger.d('Loading astro terms with retry logic');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _loadTerms();
        _logger.i('✅ Successfully loaded terms on attempt $attempt');
        _logAnalyticsEvent(
          'terms_loaded_success',
          params: {'attempt': attempt, 'term_count': _terms.length},
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          '❌ Attempt $attempt failed to load terms',
          error: e,
          stackTrace: stackTrace,
        );
        _logAnalyticsEvent(
          'terms_load_retry',
          params: {'attempt': attempt, 'error': e.toString()},
        );

        if (attempt == _maxRetries) {
          _logger.e('💥 All $attempt attempts failed to load terms');
          _logAnalyticsEvent(
            'terms_load_failed',
            params: {'attempts': attempt, 'error': e.toString()},
          );
          rethrow;
        }

        // Exponential backoff
        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  Future<void> _loadTerms() async {
    try {
      final terms = await ApiService.fetchTerms().timeout(_apiTimeout);

      // Validate terms data
      final validatedTerms =
          terms.where((term) {
            final isValid = term.term.isNotEmpty && term.meaning.isNotEmpty;
            if (!isValid) {
              _logger.w('⚠️ Invalid term skipped: ${term.term}');
            }
            return isValid;
          }).toList();

      if (mounted) {
        setState(() {
          _terms = validatedTerms;
          _filteredTerms = validatedTerms;
          _loading = false;
          _error = null;
        });
      }

      _logAnalyticsEvent(
        'terms_processed',
        params: {
          'total_terms': terms.length,
          'valid_terms': validatedTerms.length,
        },
      );
    } on TimeoutException {
      _logger.e('⏰ Timeout loading astro terms');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('timeout_error');
          _loading = false;
        });
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'load_astro_terms');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('load_terms_error');
          _loading = false;
        });
      }
    }
  }

  void _onSearchChanged() {
    // Debounce search to avoid excessive filtering
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(_searchDebounceDuration, _filterTerms);
  }

  void _filterTerms() {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      if (mounted) {
        setState(() {
          _filteredTerms = _terms;
        });
      }
      return;
    }

    _logAnalyticsEvent(
      'search_performed',
      params: {'query_length': query.length, 'query': query},
    );

    final filtered =
        _terms.where((term) {
          final termName = term.term.toLowerCase();
          final meaning = term.meaning.toLowerCase();
          final meaningNepali = (term.meaningNepali ?? '').toLowerCase();

          return termName.contains(query) ||
              meaning.contains(query) ||
              meaningNepali.contains(query);
        }).toList();

    if (mounted) {
      setState(() {
        _filteredTerms = filtered;
      });
    }

    _logAnalyticsEvent(
      'search_results',
      params: {'query': query, 'results_count': filtered.length},
    );
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    final screenHeight = MediaQuery.of(context).size.height;
    final searchBarHeight = 60.0;
    final rowHeight = 36.0;
    final remainingHeight = screenHeight - searchBarHeight - kToolbarHeight;
    final itemCount = (remainingHeight / rowHeight).ceil().clamp(5, 20);

    return Column(
      children: [
        // Search bar skeleton
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Shimmer.fromColors(
            baseColor: theme.colorScheme.surfaceContainerHighest,
            highlightColor: theme.colorScheme.surface,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        // Terms list skeleton
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            itemCount: itemCount,
            separatorBuilder:
                (_, __) =>
                    Divider(height: 0.5, color: theme.colorScheme.outline),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: theme.colorScheme.surfaceContainerHighest,
                highlightColor: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: SizedBox(
                    height: rowHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Term placeholder
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 18,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Colon placeholder
                        Container(
                          width: 8,
                          height: 18,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.3,
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Meaning placeholder
                        Expanded(
                          child: Container(
                            height: 16,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.3,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
              _error ?? _getLocalizedError('load_terms_error'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _logAnalyticsEvent('retry_terms_load');
                setState(() {
                  _loading = true;
                  _error = null;
                });
                _loadTermsWithRetry();
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

  Widget _buildEmptyState(ThemeData theme, AppLocalizations l10n) {
    final hasSearchQuery = _searchController.text.trim().isNotEmpty;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            hasSearchQuery ? Icons.search_off : Icons.auto_stories,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            hasSearchQuery ? l10n.noSearchResults : l10n.noTermsFound,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          if (hasSearchQuery) ...[
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _searchController.clear();
                _logAnalyticsEvent('search_cleared');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                foregroundColor: theme.colorScheme.onSurfaceVariant,
              ),
              child: Text(
                l10n.clearSearch,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSearchField(ThemeData theme, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextField(
        controller: _searchController,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: l10n.searchTermsHint,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          suffixIcon:
              _searchController.text.isNotEmpty
                  ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    onPressed: () {
                      _searchController.clear();
                      _logAnalyticsEvent('search_cleared_icon');
                    },
                  )
                  : null,
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          _logAnalyticsEvent(
            'search_text_changed',
            params: {'text_length': value.length},
          );
        },
      ),
    );
  }

  Widget _buildTermListItem(AstroTerm term, int index, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 1,
      color: theme.colorScheme.surface,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Term
            Flexible(
              flex: 2,
              child: Text(
                term.term,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            // Separator
            Text(
              ":",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(width: 8),
            // Meaning
            Flexible(
              flex: 5,
              child: Text(
                term.meaning,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        onTap: () {
          _logAnalyticsEvent(
            'term_selected',
            params: {'term': term.term, 'index': index},
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AstroTermDetailScreen(term: term),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchDebounceTimer?.cancel();
    _searchController.dispose();
    _logAnalyticsEvent(
      'astro_dictionary_screen_closed',
      params: {
        'terms_loaded': _terms.length,
        'last_search': _searchController.text,
      },
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
        title: Text(l10n.astroDictionaryTitle),
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
                ? _buildErrorWidget(theme, l10n)
                : Column(
                  children: [
                    _buildSearchField(theme, l10n),
                    const SizedBox(height: 8),
                    // Search results info
                    if (_searchController.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              '${_filteredTerms.length} ${l10n.resultsFound}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                _searchController.clear();
                                _logAnalyticsEvent('search_cleared_button');
                              },
                              child: Text(
                                l10n.clearSearch,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Terms list
                    Expanded(
                      child:
                          _filteredTerms.isEmpty
                              ? _buildEmptyState(theme, l10n)
                              : ListView.builder(
                                itemCount: _filteredTerms.length,
                                itemBuilder: (context, index) {
                                  final term = _filteredTerms[index];
                                  return _buildTermListItem(term, index, theme);
                                },
                              ),
                    ),
                  ],
                ),
      ),
    );
  }
}
