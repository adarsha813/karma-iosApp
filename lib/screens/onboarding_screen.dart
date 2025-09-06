import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/profile_provider.dart';
import '../providers/LocaleProvider.dart';
import '../l10n/app_localizations.dart';
import 'profile_settings_screen.dart';
import 'recovery_screen.dart';

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

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);
  }

  void _nextPage() {
    if (_currentPage < _pagesLength - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNewUser() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    if (profileProvider.language != null) {
      await profileProvider.saveLanguage(profileProvider.language!);
      localeProvider.setLocale(Locale(profileProvider.language!));

      if (profileProvider.userId != null) {
        await profileProvider.syncLanguageToBackend(
          profileProvider.userId!,
          profileProvider.language!,
        );
      }
    }

    await completeOnboarding();
    widget.onFinish();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (_) =>
                ProfileSettingsScreen(key: ValueKey(profileProvider.language)),
      ),
    );
  }

  void _goToExistingUser() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => RecoveryScreen()),
    );
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

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return Scaffold(
          key: ValueKey(
            localeProvider.locale.languageCode,
          ), // Force rebuild on locale change
          body: SafeArea(
            // ✅ Wrap in SafeArea
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
                      onPageChanged:
                          (index) => setState(() => _currentPage = index),
                      itemBuilder: (context, index) {
                        // Onboarding pages
                        if (index < pages.length) {
                          final page = pages[index];
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
                                    return const Icon(
                                      Icons.broken_image,
                                      size: 100,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  page['title']!,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  page['desc']!,
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                if (index == 0) ...[
                                  const SizedBox(height: 20),
                                  // Language selection
                                  Column(
                                    children: [
                                      RadioListTile<String>(
                                        title: const Text("English"),
                                        value: "en",
                                        groupValue: profileProvider.language,
                                        onChanged: (value) async {
                                          if (value != null) {
                                            await profileProvider.saveLanguage(
                                              value,
                                            );
                                            localeProvider.setLocale(
                                              Locale(value),
                                            );
                                            if (profileProvider.userId !=
                                                null) {
                                              await profileProvider
                                                  .syncLanguageToBackend(
                                                    profileProvider.userId!,
                                                    value,
                                                  );
                                            }
                                          }
                                        },
                                      ),
                                      RadioListTile<String>(
                                        title: const Text("Español"),
                                        value: "es",
                                        groupValue: profileProvider.language,
                                        onChanged: (value) async {
                                          if (value != null) {
                                            await profileProvider.saveLanguage(
                                              value,
                                            );
                                            localeProvider.setLocale(
                                              Locale(value),
                                            );
                                            if (profileProvider.userId !=
                                                null) {
                                              await profileProvider
                                                  .syncLanguageToBackend(
                                                    profileProvider.userId!,
                                                    value,
                                                  );
                                            }
                                          }
                                        },
                                      ),
                                      RadioListTile<String>(
                                        title: const Text("हिन्दी"),
                                        value: "hi",
                                        groupValue: profileProvider.language,
                                        onChanged: (value) async {
                                          if (value != null) {
                                            await profileProvider.saveLanguage(
                                              value,
                                            );
                                            localeProvider.setLocale(
                                              Locale(value),
                                            );
                                            if (profileProvider.userId !=
                                                null) {
                                              await profileProvider
                                                  .syncLanguageToBackend(
                                                    profileProvider.userId!,
                                                    value,
                                                  );
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          );
                        }

                        // Final "Get Started" page
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.onboardingGetStarted,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: _goToNewUser,
                                child: Text(l10n.onboardingNewUser),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 50),
                                ),
                              ),
                              const SizedBox(height: 12),
                              OutlinedButton(
                                onPressed: _goToExistingUser,
                                child: Text(l10n.onboardingExistingUser),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(200, 50),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // Bottom navigation indicators
                    Positioned(
                      bottom: 20,
                      left: 24,
                      right: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentPage > 0 && _currentPage < _pagesLength)
                            TextButton(
                              onPressed: _previousPage,
                              child: Text(l10n.onboardingBack),
                            )
                          else
                            const SizedBox(width: 60),
                          Row(
                            children: List.generate(_pagesLength, (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: _currentPage == index ? 12 : 8,
                                height: _currentPage == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  color:
                                      _currentPage == index
                                          ? Colors.blue
                                          : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              );
                            }),
                          ),

                          if (_currentPage < _pagesLength - 1)
                            TextButton(
                              onPressed: _nextPage,
                              child: Text(l10n.onboardingNext),
                            )
                          else
                            const SizedBox(
                              width: 60,
                            ), // leave blank in the last page
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
