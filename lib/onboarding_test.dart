import 'package:flutter/material.dart';
import './screens/onboarding_screen.dart';
import './providers/profile_provider.dart'; // import your provider

void main() {
  final profileProvider = ProfileProvider(); // create a provider instance

  runApp(
    MaterialApp(
      home: OnboardingScreen(
        profileProvider: profileProvider, // pass it here
        onFinish: () {
          print("Onboarding finished!");
        },
      ),
    ),
  );
}
