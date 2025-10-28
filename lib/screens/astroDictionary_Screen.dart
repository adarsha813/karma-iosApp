import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart';
import 'astro_term_detail_screen.dart';
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

class AstroDictionaryScreen extends StatefulWidget {
  const AstroDictionaryScreen({Key? key}) : super(key: key);

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

  String _getLocalizedError(String errorKey, BuildContext context) {
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
          _error = _getLocalizedError('timeout_error', context);
          _loading = false;
        });
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'load_astro_terms');
      if (mounted) {
        setState(() {
          _error = _getLocalizedError('load_terms_error', context);
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

  Widget _buildSkeletonLoader() {
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
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
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
            separatorBuilder: (_, __) => const Divider(height: 0.5),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 4),
                        // Colon placeholder
                        Container(width: 8, height: 18, color: Colors.white),
                        const SizedBox(width: 4),
                        // Meaning placeholder
                        Expanded(
                          child: Container(
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
              _error ?? _getLocalizedError('load_terms_error', context),
              style: const TextStyle(fontSize: 16),
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
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retryButton),
              style: ElevatedButton.styleFrom(
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

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;
    final hasSearchQuery = _searchController.text.trim().isNotEmpty;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            hasSearchQuery ? Icons.search_off : Icons.auto_stories,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            hasSearchQuery ? l10n.noSearchResults : l10n.noTermsFound,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          if (hasSearchQuery) ...[
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _searchController.clear();
                _logAnalyticsEvent('search_cleared');
              },
              child: Text(l10n.clearSearch),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.grey.shade800,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSearchField(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: l10n.searchTermsHint,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon:
              _searchController.text.isNotEmpty
                  ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      _logAnalyticsEvent('search_cleared_icon');
                    },
                  )
                  : null,
          filled: true,
          fillColor: Colors.grey.shade100,
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
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
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

  Widget _buildTermListItem(AstroTerm term, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 1,
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            // Separator
            const Text(
              ":",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(width: 8),
            // Meaning
            Flexible(
              flex: 5,
              child: Text(
                term.meaning,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey.shade600,
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.astroDictionaryTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body:
          _loading
              ? _buildSkeletonLoader()
              : _error != null
              ? _buildErrorWidget()
              : Column(
                children: [
                  _buildSearchField(l10n),
                  const SizedBox(height: 8),
                  // Search results info
                  if (_searchController.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            '${_filteredTerms.length} ${l10n.resultsFound}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _searchController.clear();
                              _logAnalyticsEvent('search_cleared_button');
                            },
                            child: Text(l10n.clearSearch),
                          ),
                        ],
                      ),
                    ),
                  // Terms list
                  Expanded(
                    child:
                        _filteredTerms.isEmpty
                            ? _buildEmptyState()
                            : ListView.builder(
                              itemCount: _filteredTerms.length,
                              itemBuilder: (context, index) {
                                final term = _filteredTerms[index];
                                return _buildTermListItem(term, index);
                              },
                            ),
                  ),
                ],
              ),
    );
  }
}
