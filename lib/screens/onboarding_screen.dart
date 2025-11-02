import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../providers/LocaleProvider.dart';
import '../l10n/app_localizations.dart';
import 'profile_settings_screen.dart';
import 'recovery_screen.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
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
    printTime: true,
  ),
);

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onFinish;
  final ProfileProvider profileProvider;

  const OnboardingScreen({
    Key? key,
    required this.onFinish,
    required this.profileProvider,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _isNavigating = false;
  Completer<void>? _onboardingCompleter;
  late final DateTime _onboardingStartTime;

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

  void _logOnboardingPerformance() {
    final duration = DateTime.now().difference(_onboardingStartTime);
    _logAnalyticsEvent(
      'onboarding_performance',
      params: {
        'total_duration_seconds': duration.inSeconds,
        'pages_viewed': _currentPage + 1,
        'completed': _currentPage == _pagesLength - 1,
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

      // Ensure language is set (default to English if not set)
      final selectedLanguage = profileProvider.language;
      await profileProvider.saveLanguage(selectedLanguage);
      localeProvider.setLocale(Locale(selectedLanguage));

      // Sync language to backend if user exists
      if (profileProvider.userId != null && profileProvider.token != null) {
        try {
          _logger.i('✅ Language set to: $selectedLanguage');
          _logger.i('✅ Language synced to backend for existing user');
        } catch (e, stackTrace) {
          _reportError(e, stackTrace, context: 'sync_language_new_user');
          // Non-critical error - continue
        }
      }

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
      await _completeOnboarding().timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          ProductionLogger.warning('Onboarding completion timeout');
        },
      );

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.genericError),
            backgroundColor: Colors.red,
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.genericError),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
  }

  int get _pagesLength =>
      _buildLocalizedPages(AppLocalizations.of(context)!).length + 1;

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
  ) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          l10n.selectLanguage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          child: Column(
            children: [
              RadioListTile<String>(
                title: const Text("English"),
                value: "en",
                groupValue: profileProvider.language,
                onChanged: (value) async {
                  if (value != null && !_isNavigating) {
                    _logAnalyticsEvent(
                      'language_selected',
                      params: {'language': value},
                    );
                    await _updateLanguage(
                      value,
                      profileProvider,
                      localeProvider,
                    );
                  }
                },
              ),
              const Divider(height: 1),
              RadioListTile<String>(
                title: const Text("Español"),
                value: "es",
                groupValue: profileProvider.language,
                onChanged: (value) async {
                  if (value != null && !_isNavigating) {
                    _logAnalyticsEvent(
                      'language_selected',
                      params: {'language': value},
                    );
                    await _updateLanguage(
                      value,
                      profileProvider,
                      localeProvider,
                    );
                  }
                },
              ),
              const Divider(height: 1),
              RadioListTile<String>(
                title: const Text("हिन्दी"),
                value: "hi",
                groupValue: profileProvider.language,
                onChanged: (value) async {
                  if (value != null && !_isNavigating) {
                    _logAnalyticsEvent(
                      'language_selected',
                      params: {'language': value},
                    );
                    await _updateLanguage(
                      value,
                      profileProvider,
                      localeProvider,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

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

  Widget _buildPageIndicator(int currentPage, int totalPages) {
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
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button
        if (_currentPage > 0 && _currentPage < _pagesLength)
          TextButton(
            onPressed: _isNavigating ? null : _previousPage,
            child: Text(l10n.onboardingBack),
          )
        else
          const SizedBox(width: 80),

        // Page indicators
        _buildPageIndicator(_currentPage, _pagesLength),

        // Next button
        if (_currentPage < _pagesLength - 1)
          TextButton(
            onPressed: _isNavigating ? null : _nextPage,
            child: Text(l10n.onboardingNext),
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
  ) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            page['animation']!,
            height: 250,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              _logger.w('⚠️ Failed to load animation: ${page['animation']}');
              return Icon(
                Icons.psychology_outlined,
                size: 100,
                color: Theme.of(context).primaryColor,
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            page['title']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page['desc']!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          if (index == 0)
            _buildLanguageSelection(profileProvider, localeProvider, l10n),
        ],
      ),
    );
  }

  Widget _buildGetStartedPage(AppLocalizations l10n) {
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
                color: Theme.of(context).primaryColor,
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            l10n.onboardingGetStarted,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.onboardingGetStartedDesc,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _isNavigating ? null : _goToNewUser,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.onboardingNewUser),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _isNavigating ? null : _goToExistingUser,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(200, 50),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Text(l10n.onboardingExistingUser),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer2<ProfileProvider, LocaleProvider>(
          builder: (context, profileProvider, localeProvider, _) {
            final l10n = AppLocalizations.of(context)!;
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
                      );
                    }
                    return _buildGetStartedPage(l10n);
                  },
                ),

                // Bottom navigation
                Positioned(
                  bottom: 20,
                  left: 24,
                  right: 24,
                  child: _buildNavigationButtons(l10n),
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
      params: {'last_page': _currentPage, 'total_pages': _pagesLength},
    );
    // Cancel any pending operations
    _isNavigating = false;
    super.dispose();
  }
}
