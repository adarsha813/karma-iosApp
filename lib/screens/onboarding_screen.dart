import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_localizations.dart';
import 'profile_settings_screen.dart';
import 'recovery_screen.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import '../providers/theme_provider.dart'; // Add this import
import '../services/first_launch_service.dart';
import '../services/production_logger.dart';

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

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onFinish;
  final ProfileProvider profileProvider;

  const OnboardingScreen({
    super.key,
    required this.onFinish,
    required this.profileProvider,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _isNavigating = false;
  Completer<void>? _onboardingCompleter;
  late final DateTime _onboardingStartTime;
  int? _cachedPagesLength;
  AppLocalizations? _cachedL10n;

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

  @override
  void initState() {
    super.initState();
    _onboardingStartTime = DateTime.now(); // Track onboarding start time
    _logger.i('🔹 Initializing OnboardingScreen');
    _onboardingCompleter = Completer<void>();
    _logAnalyticsEvent('onboarding_started');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ✅ SAFE: Cache localization and pages length when dependencies are available
    _cachedL10n = AppLocalizations.of(context);
    _cachedPagesLength = _calculatePagesLength();
  }

  // ✅ ADD THIS: Safe method to calculate pages length
  int _calculatePagesLength() {
    if (_cachedL10n != null) {
      return _buildLocalizedPages(_cachedL10n!).length + 1;
    }
    return 4; // Fallback to default number of pages
  }

  int get _pagesLength => _cachedPagesLength ?? _calculatePagesLength();

  void _logOnboardingPerformance() {
    final duration = DateTime.now().difference(_onboardingStartTime);
    _logAnalyticsEvent(
      'onboarding_performance',
      params: {
        'total_duration_seconds': duration.inSeconds,
        'pages_viewed': _currentPage + 1,
        'completed':
            _currentPage == (_cachedPagesLength ?? 4) - 1, // ✅ Use cached value
      },
    );
  }

  Future<void> _completeOnboarding() async {
    try {
      // Use the production first launch service
      final launchStats = await FirstLaunchService.getLaunchStatistics();

      _logAnalyticsEvent(
        'onboarding_completed',
        params: {
          'total_pages_viewed': _currentPage + 1,
          'app_version': launchStats.currentVersion,
          'first_launch_version': launchStats.firstLaunchVersion,
        },
      );

      ProductionLogger.i('✅ Onboarding completed successfully');
      _onboardingCompleter?.complete();
    } catch (e, stackTrace) {
      ProductionLogger.e('Failed to complete onboarding', e, stackTrace);
    }
  }

  void _nextPage() {
    if (_currentPage < _pagesLength - 1 && !_isNavigating) {
      _logAnalyticsEvent(
        'onboarding_next_page',
        params: {'from_page': _currentPage, 'to_page': _currentPage + 1},
      );

      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0 && !_isNavigating) {
      _logAnalyticsEvent(
        'onboarding_previous_page',
        params: {'from_page': _currentPage, 'to_page': _currentPage - 1},
      );

      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _goToNewUser() async {
    if (_isNavigating) return;

    _isNavigating = true;
    _logAnalyticsEvent('onboarding_new_user_selected');

    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );
      final localeProvider = Provider.of<LocaleProvider>(
        context,
        listen: false,
      );

      // Ensure language is set
      final selectedLanguage = profileProvider.language;
      await profileProvider.saveLanguage(selectedLanguage);
      localeProvider.setLocale(Locale(selectedLanguage));

      await _completeOnboarding();
      widget.onFinish();

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (_) => ProfileSettingsScreen(
                  key: ValueKey(
                    'profile_settings_${DateTime.now().millisecondsSinceEpoch}',
                  ),
                ),
          ),
        );
      }
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'navigate_new_user');
      _isNavigating = false;
      if (mounted) {
        final theme = Theme.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.genericError),
            backgroundColor: theme.colorScheme.error,
          ),
        );
      }
    }
  }

  void _goToExistingUser() {
    if (_isNavigating) return;

    _isNavigating = true;
    _logAnalyticsEvent('onboarding_existing_user_selected');

    _completeOnboarding()
        .then((_) {
          widget.onFinish();
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RecoveryScreen()),
            );
          }
        })
        .catchError((e, stackTrace) {
          _reportError(e, stackTrace, context: 'navigate_existing_user');
          _isNavigating = false;
          if (mounted) {
            final theme = Theme.of(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.genericError),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          }
        });
  }

  List<Map<String, String>> _buildLocalizedPages(AppLocalizations l10n) {
    return [
      {
        'title': l10n.onboardingChooseLanguage,
        'desc': l10n.onboardingChooseLanguageDesc,
        'animation': 'assets/language.json',
      },
      {
        'title': l10n.onboardingWhatIsAstrology,
        'desc': l10n.onboardingWhatIsAstrologyDesc,
        'animation': 'assets/astrology.json',
      },
      {
        'title': l10n.onboardingWhyUseApp,
        'desc': l10n.onboardingWhyUseAppDesc,
        'animation': 'assets/why_use.json',
      },
      {
        'title': l10n.onboardingHowToUse,
        'desc': l10n.onboardingHowToUseDesc,
        'animation': 'assets/how_to_use.json',
      },
    ];
  }

  Widget _buildLanguageSelection(
    ProfileProvider profileProvider,
    LocaleProvider localeProvider,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    final languages = localeProvider.getLanguagesWithSupportInfo();

    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          l10n.selectLanguage,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),

        // Info banner about language support
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.primary.withAlpha((0.3 * 255).toInt()),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Some languages may show system elements in English',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Search bar
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search languages...',
              prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest,
              hintStyle: TextStyle(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              isDense: true,
            ),
            style: TextStyle(color: theme.colorScheme.onSurface),
            onChanged: (value) => setState(() {}),
          ),
        ),

        // Language list
        Expanded(
          child: _buildLanguageList(
            languages,
            profileProvider,
            localeProvider,
            theme,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageList(
    List<Map<String, dynamic>> languages,
    ProfileProvider profileProvider,
    LocaleProvider localeProvider,
    ThemeData theme,
  ) {
    final query = _searchController.text.toLowerCase();
    final filteredLanguages =
        query.isEmpty
            ? languages
            : languages.where((lang) {
              final name = lang['name'].toString().toLowerCase();
              final code = lang['code'].toString().toLowerCase();
              return name.contains(query) || code.contains(query);
            }).toList();

    return Card(
      elevation: 2,
      color: theme.colorScheme.surface,
      child:
          filteredLanguages.isEmpty
              ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'No languages found',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              )
              : ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = filteredLanguages[index];
                  final isLast = index == filteredLanguages.length - 1;
                  final hasMaterialSupport =
                      language['hasMaterialSupport'] as bool;

                  return Column(
                    children: [
                      RadioListTile<String>(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                language['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            if (!hasMaterialSupport) ...[
                              const SizedBox(width: 4),
                              Tooltip(
                                message: 'System elements may show in English',
                              ),
                            ],
                          ],
                        ),
                        // ignore_for_file: deprecated_member_use
                        value: language['code'] as String,
                        groupValue:
                            profileProvider.language.isNotEmpty
                                ? profileProvider.language
                                : localeProvider.locale.languageCode,
                        onChanged: (value) async {
                          if (value != null && !_isNavigating) {
                            await _updateLanguage(
                              value,
                              profileProvider,
                              localeProvider,
                            );
                            _searchController.clear();
                            setState(() {});
                          }
                        },
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        activeColor: theme.colorScheme.primary,
                      ),
                      if (!isLast)
                        Divider(
                          height: 1,
                          color: theme.colorScheme.outline.withValues(
                            alpha: 0.3,
                          ),
                        ),
                    ],
                  );
                },
              ),
    );
  }

  // Add this to your state class
  final TextEditingController _searchController = TextEditingController();

  Future<void> _updateLanguage(
    String value,
    ProfileProvider profileProvider,
    LocaleProvider localeProvider,
  ) async {
    try {
      await profileProvider.saveLanguage(value);
      localeProvider.setLocale(Locale(value));
      // Add validation
      if (value.length <= 10 && ['en', 'es', 'hi'].contains(value)) {
        _logAnalyticsEvent('language_changed', params: {'language': value});
      } else {
        ProductionLogger.warning('Invalid language code: $value');
      }

      if (profileProvider.userId != null && profileProvider.token != null) {
        // ✅ Backend sync is automatically handled by ProfileProvider.saveLanguage()
        // No need for separate call
        _logger.i('🌐 Language updated to: $value (backend sync automatic)');
      }

      _logger.i('✅ Language updated to: $value');
    } catch (e, stackTrace) {
      _reportError(e, stackTrace, context: 'update_language');
      // Non-critical error - language change should still work locally
    }
  }

  Widget _buildPageIndicator(int currentPage, int totalPages, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color:
                currentPage == index
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons(AppLocalizations l10n, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button
        if (_currentPage > 0 && _currentPage < _pagesLength)
          TextButton(
            onPressed: _isNavigating ? null : _previousPage,
            child: Text(
              l10n.onboardingBack,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
          )
        else
          const SizedBox(width: 80),

        // Page indicators
        _buildPageIndicator(_currentPage, _pagesLength, theme),

        // Next button
        if (_currentPage < _pagesLength - 1)
          TextButton(
            onPressed: _isNavigating ? null : _nextPage,
            child: Text(
              l10n.onboardingNext,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
          )
        else
          const SizedBox(width: 80),
      ],
    );
  }

  Widget _buildOnboardingPage(
    Map<String, String> page,
    int index,
    ProfileProvider profileProvider,
    LocaleProvider localeProvider,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FIX: Make animation section flexible
          if (index == 0)
            Flexible(
              flex: 2,
              child: Lottie.asset(
                page['animation']!,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  _logger.w(
                    '⚠️ Failed to load animation: ${page['animation']}',
                  );
                  return Icon(
                    Icons.psychology_outlined,
                    size: 80,
                    color: theme.colorScheme.primary,
                  );
                },
              ),
            )
          else
            Lottie.asset(
              page['animation']!,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                _logger.w('⚠️ Failed to load animation: ${page['animation']}');
                return Icon(
                  Icons.psychology_outlined,
                  size: 80,
                  color: theme.colorScheme.primary,
                );
              },
            ),

          const SizedBox(height: 16),
          Text(
            page['title']!,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            page['desc']!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // FIX: Language selection takes remaining space
          if (index == 0)
            Expanded(
              flex: 3,
              child: _buildLanguageSelection(
                profileProvider,
                localeProvider,
                l10n,
                theme,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGetStartedPage(AppLocalizations l10n, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/get_started.json',
            height: 200,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.celebration,
                size: 100,
                color: theme.colorScheme.primary,
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            l10n.onboardingGetStarted,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.onboardingGetStartedDesc,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _isNavigating ? null : _goToNewUser,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            child: Text(l10n.onboardingNewUser),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _isNavigating ? null : _goToExistingUser,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(200, 50),
              side: BorderSide(color: theme.colorScheme.primary),
              foregroundColor: theme.colorScheme.primary,
            ),
            child: Text(l10n.onboardingExistingUser),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Consumer3<ProfileProvider, LocaleProvider, ThemeProvider>(
          builder: (
            context,
            profileProvider,
            localeProvider,
            themeProvider,
            _,
          ) {
            final l10n = AppLocalizations.of(context)!;
            final theme = themeProvider.getCurrentTheme(context);
            final pages = _buildLocalizedPages(l10n);

            return Stack(
              children: [
                PageView.builder(
                  key: ValueKey(localeProvider.locale.languageCode),
                  controller: _controller,
                  itemCount: pages.length + 1,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                    _logAnalyticsEvent(
                      'onboarding_page_changed',
                      params: {
                        'page_index': index,
                        'page_total': pages.length + 1,
                      },
                    );
                  },
                  itemBuilder: (context, index) {
                    if (index < pages.length) {
                      return _buildOnboardingPage(
                        pages[index],
                        index,
                        profileProvider,
                        localeProvider,
                        l10n,
                        theme,
                      );
                    }
                    return _buildGetStartedPage(l10n, theme);
                  },
                ),

                // Bottom navigation
                Positioned(
                  bottom: 10,
                  left: 16,
                  right: 16,
                  child: _buildNavigationButtons(l10n, theme),
                ),

                // Loading overlay
                if (_isNavigating)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    ProductionLogger.i('Disposing OnboardingScreen');

    _logger.d('Disposing OnboardingScreen');
    _controller.dispose();
    _logOnboardingPerformance(); // Log final metrics
    _logAnalyticsEvent(
      'onboarding_screen_closed',
      params: {
        'last_page': _currentPage,
        'total_pages': _cachedPagesLength ?? _pagesLength, // Use cached value
      },
    );
    // Cancel any pending operations
    _isNavigating = false;
    _searchController.dispose();
    super.dispose();
  }
}
