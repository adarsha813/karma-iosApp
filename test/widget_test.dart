import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kundali/main.dart';
import 'package:kundali/screens/onboarding_screen.dart'; // ← add this

void main() {
  testWidgets('Smoke test for MyApp', (WidgetTester tester) async {
    // Provide the required 'firstLaunch' argument
    await tester.pumpWidget(MyApp(firstLaunch: true));

    // Now you can test widgets inside MyApp
    expect(find.byType(OnboardingScreen), findsOneWidget);

    // Simulate finishing onboarding
    await tester.tap(find.text('New User'));
    await tester.pump();

    // After finishing, OnboardingScreen should disappear
    expect(find.byType(OnboardingScreen), findsNothing);
  });
}
