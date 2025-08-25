import 'package:flutter/material.dart';
import 'profile_settings_screen.dart';
import 'recovery_screen.dart';
import 'package:lottie/lottie.dart'; // For animations
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart'; // Adjust path if needed

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

  final List<Map<String, String>> _pages = [
    {
      'title': 'What is Astrology?',
      'desc':
          'Astrology is the study of celestial bodies and their influence on human behavior and events.',
      'animation': 'assets/astrology.json',
    },
    {
      'title': 'Why use this app?',
      'desc':
          'Get personalized horoscopes, daily predictions, and guidance to make informed decisions.',
      'animation': 'assets/why_use.json',
    },
    {
      'title': 'How to use this app?',
      'desc':
          'Navigate easily, check daily horoscopes, and manage your profile for accurate predictions.',
      'animation': 'assets/how_to_use.json',
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length) {
      // allow moving to last page
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNewUser() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ProfileSettingsScreen()),
    );
  }

  void _goToExistingUser() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => RecoveryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length + 1, // +1 for the final "Get Started"
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              if (index < _pages.length) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(_pages[index]['animation']!, height: 250),
                      SizedBox(height: 20),
                      Text(
                        _pages[index]['title']!,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        _pages[index]['desc']!,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              } else {
                // Final page with New/Existing buttons
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _goToNewUser,
                        child: Text('New User'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                        ),
                      ),
                      SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: _goToExistingUser,
                        child: Text('Existing User'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(200, 50),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          // Bottom navigation buttons
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0 && _currentPage < _pages.length)
                  TextButton(onPressed: _previousPage, child: Text('Back'))
                else
                  SizedBox(width: 60), // placeholder
                Row(
                  children: List.generate(_pages.length + 1, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                if (_currentPage < _pages.length) // show Next until last page
                  TextButton(onPressed: _nextPage, child: Text('Next'))
                else
                  SizedBox(width: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
