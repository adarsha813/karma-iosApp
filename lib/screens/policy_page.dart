import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/environment.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart'; // Add this
import 'package:logger/logger.dart';
import '../providers/theme_provider.dart'; // Add this

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

class PolicyPage extends StatefulWidget {
  final String title;
  final String url;

  const PolicyPage({super.key, required this.title, required this.url});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  String _content = "";
  bool _isLoading = true;
  String? _error;
  bool _retrying = false;

  // Network configuration
  static const int _maxRetries = 3;
  static const Duration _apiTimeout = Duration(seconds: 15);
  Completer<void>? _policyLoadCompleter;

  @override
  void initState() {
    super.initState();
    _logger.i('🔹 Initializing PolicyPage: ${widget.title}');
    _policyLoadCompleter = Completer<void>();

    _fetchPolicyWithRetry();
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
      case 'load_policy_error':
        return l10n?.genericError ?? 'Failed to load policy';
      case 'invalid_response':
        return l10n?.genericError ?? 'Invalid response from server';
      default:
        return l10n?.genericError ?? 'Something went wrong';
    }
  }

  Future<void> _fetchPolicyWithRetry() async {
    // Reset the completer at the start of every fetch
    _policyLoadCompleter = Completer<void>();

    _logger.d('Fetching policy with retry logic: ${widget.title}');

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      try {
        await _fetchPolicy();
        _logger.i(
          '✅ Successfully loaded policy on attempt $attempt: ${widget.title}',
        );
        _logAnalyticsEvent(
          'policy_loaded_success',
          params: {
            'policy_type': widget.title,
            'attempt': attempt,
            'content_length': _content.length,
          },
        );
        return;
      } catch (e, stackTrace) {
        _logger.w(
          '❌ Attempt $attempt failed to load policy',
          error: e,
          stackTrace: stackTrace,
        );

        if (attempt == _maxRetries) {
          _logger.e(
            '💥 All $attempt attempts failed to load policy: ${widget.title}',
          );
          return; // no rethrow, error already handled
        }

        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }

  Future<void> _fetchPolicy() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _retrying = false;
    });

    // Validate URL
    if (widget.url.isEmpty) {
      _setErrorState('Invalid policy URL');
      return;
    }

    _logger.d('Fetching policy from: ${widget.url}');

    try {
      final response = await http
          .get(Uri.parse(widget.url), headers: Environment.securityHeaders)
          .timeout(_apiTimeout);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> data =
            json.decode(responseBody) as Map<String, dynamic>;

        final content =
            data['content']?.toString() ??
            data['text']?.toString() ??
            data['html']?.toString() ??
            _getDefaultPolicyContent();

        if (mounted) {
          setState(() {
            _content = _sanitizeContent(content);
            _isLoading = false;
          });
        }

        _logAnalyticsEvent(
          'policy_content_loaded',
          params: {
            'policy_type': widget.title,
            'content_length': content.length,
            'has_content': content.isNotEmpty,
          },
        );

        // ✅ FIX: Safe completer completion
        if (_policyLoadCompleter != null &&
            !_policyLoadCompleter!.isCompleted) {
          _policyLoadCompleter!.complete();
        }
      } else if (response.statusCode == 404) {
        _setErrorState('Policy not found');
        _logAnalyticsEvent(
          'policy_not_found',
          params: {
            'policy_type': widget.title,
            'status_code': response.statusCode,
          },
        );
      } else {
        _setErrorState('Server error: ${response.statusCode}');
        _logAnalyticsEvent(
          'policy_server_error',
          params: {
            'policy_type': widget.title,
            'status_code': response.statusCode,
          },
        );
      }
    } on TimeoutException {
      _logger.e('⏰ Timeout loading policy: ${widget.title}');
      _setErrorState(_getLocalizedError('timeout_error', context));
      _logAnalyticsEvent(
        'policy_timeout',
        params: {'policy_type': widget.title},
      );
    } on FormatException catch (e) {
      _logger.e('📄 Response format error: $e');
      _setErrorState(_getLocalizedError('invalid_response', context));
      _logAnalyticsEvent(
        'policy_format_error',
        params: {'policy_type': widget.title, 'error': e.toString()},
      );
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'fetch_policy_${widget.title}');
      _setErrorState(_getLocalizedError('load_policy_error', context));
      _logAnalyticsEvent(
        'policy_fetch_error',
        params: {'policy_type': widget.title, 'error': e.toString()},
      );
    }
  }

  void _setErrorState(String error) {
    if (mounted) {
      setState(() {
        _error = error;
        _isLoading = false;
      });
    }

    // Complete the completer only if not completed
    if (_policyLoadCompleter != null && !_policyLoadCompleter!.isCompleted) {
      _policyLoadCompleter!.complete();
    }
  }

  String _getDefaultPolicyContent() {
    switch (widget.title.toLowerCase()) {
      case 'privacy policy':
        return 'Privacy policy content is currently unavailable. Please check back later or contact support for more information.';
      case 'terms & conditions':
        return 'Terms and conditions are currently unavailable. Please check back later or contact support for more information.';
      default:
        return 'The requested policy content is currently unavailable. Please check back later or contact support for more information.';
    }
  }

  String _sanitizeContent(String content) {
    // Basic content sanitization
    if (content.isEmpty) return _getDefaultPolicyContent();

    // Remove any potential malicious scripts (basic protection)
    final sanitized =
        content
            .replaceAll(
              RegExp(
                r'<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>',
                caseSensitive: false,
              ),
              '',
            )
            .replaceAll(RegExp(r'on\w+="[^"]*"'), '')
            .trim();

    return sanitized.isEmpty ? _getDefaultPolicyContent() : sanitized;
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header skeleton
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.only(bottom: 16),
          ),
          // Content skeletons
          ...List.generate(
            15,
            (index) => Container(
              width: double.infinity,
              height: 16,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.only(bottom: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              _error ?? _getLocalizedError('load_policy_error', context),
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
                        _logAnalyticsEvent('retry_policy_load');
                        setState(() => _retrying = true);
                        _fetchPolicyWithRetry().whenComplete(() {
                          if (mounted) {
                            setState(() => _retrying = false);
                          }
                        });
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyContent(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: SelectionArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Last updated info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha((0.1 * 255).toInt()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withAlpha(
                    (0.3 * 255).toInt(),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Last updated: ${DateTime.now().toString().split(' ')[0]}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Policy content
            Text(
              _content,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),
            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'If you have any questions about this policy, please contact our support team.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    // Log analytics when page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logAnalyticsEvent(
        'policy_page_viewed',
        params: {'policy_type': widget.title, 'url': widget.url},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        actions: [
          if (!_isLoading && _error == null)
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: theme.appBarTheme.foregroundColor,
              ),
              onPressed: () {
                _logAnalyticsEvent('policy_manual_refresh');
                _fetchPolicyWithRetry();
              },
              tooltip: 'Refresh',
            ),
        ],
      ),
      body: Container(
        color: theme.colorScheme.background,
        child:
            _isLoading
                ? _buildSkeletonLoader(theme)
                : _error != null
                ? _buildErrorWidget(theme)
                : _buildPolicyContent(theme),
      ),
    );
  }

  @override
  void dispose() {
    _logger.d('Disposing PolicyPage: ${widget.title}');
    // ✅ FIX: Only complete if not already completed
    if (_policyLoadCompleter != null && !_policyLoadCompleter!.isCompleted) {
      _policyLoadCompleter!.completeError('Screen disposed');
    }
    _logAnalyticsEvent(
      'policy_page_closed',
      params: {
        'policy_type': widget.title,
        'content_loaded': _content.isNotEmpty,
      },
    );
    super.dispose();
  }
}
