import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  static Future<void> initialize() async {
    // Use environment variables or secure config in production
    const publishableKey = String.fromEnvironment(
      'STRIPE_PUBLISHABLE_KEY',
      defaultValue: 'pk_test_your_test_key', // Replace with your test key
    );

    Stripe.publishableKey = publishableKey;

    // Additional Stripe configuration
    Stripe.merchantIdentifier = 'merchant.flutter.app';
    await Stripe.instance.applySettings();
  }
}
