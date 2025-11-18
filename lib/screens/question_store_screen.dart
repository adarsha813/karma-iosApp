import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:shimmer/shimmer.dart';
import '../providers/profile_provider.dart';
import '../services/payment_service.dart';
import '../services/socket_service.dart';
import '../services/secure_storage_service.dart';
import '../services/local_auth_service.dart';
import '../services/analytics_service.dart';
import '../services/http_service.dart';
import '../utils/error_handler.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'dart:convert';

class QuestionStoreScreen extends StatefulWidget {
  const QuestionStoreScreen({super.key});

  @override
  State<QuestionStoreScreen> createState() => _QuestionStoreScreenState();
}

class _QuestionStoreScreenState extends State<QuestionStoreScreen> {
  int questionBalance = 0;
  List<Map<String, dynamic>> offers = [];
  bool isLoading = true;
  int? _processingOfferId; // Track which offer is being processed

  final PaymentService _paymentService = PaymentService();
  final SecureStorageService _secureStorage = SecureStorageService();
  DateTime? _lastPaymentAttempt;
  int _retryCount = 0;
  final int _maxRetries = 3;

  @override
  void initState() {
    super.initState();
    _initializePayment();
    Future.delayed(Duration.zero, _loadData);
  }

  Future<void> _initializePayment() async {
    try {
      await _paymentService.initializeStripe();
    } catch (e) {
      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e as Exception));
    }
  }

  Future<bool> _authenticateWithBiometrics(String reason) async {
    try {
      final canAuthenticate = await LocalAuthService().isBiometricAvailable();
      if (!canAuthenticate) {
        // Fallback to PIN/pattern or require re-authentication
        _logPaymentEvent('biometric_unavailable', {});
        return true; // Or implement alternative auth
      }

      return await LocalAuthService().authenticate(reason);
    } catch (e) {
      _logPaymentEvent('biometric_failed', {'error': e.toString()});
      return false; // Fail secure
    }
  }

  Future<void> _loadData() async {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    // Use secure storage as backup
    final token = profileProvider.token ?? await _secureStorage.getToken();
    final userId = profileProvider.userId ?? await _secureStorage.getUserId();

    if (token == null || userId == null) {
      _showErrorSnackBar(l10n.userNotAuthenticated);
      return;
    }

    setState(() => isLoading = true);

    try {
      final results = await Future.wait([
        _paymentService.getQuestionBalance(token),
        _paymentService.getOffers(),
      ]);

      final balance = results[0] as int;
      final offersList = results[1] as List<Map<String, dynamic>>;

      setState(() {
        questionBalance = balance;
        offers = offersList;
        //usageStats = results[0]['usageStats'];
      });

      _retryCount = 0; // Reset retry count on success
    } on Exception catch (e) {
      _logPaymentEvent('load_data_failed', {
        'error': e.toString(),
        'retry_count': _retryCount,
      });

      // Implement retry logic with exponential backoff
      if (_retryCount < _maxRetries) {
        _retryCount++;
        final delay = Duration(seconds: 2 * _retryCount); // 2, 4, 6 seconds

        await Future.delayed(delay);
        return _loadData(); // Retry
      }

      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e));
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _startStripePayment(int questions) async {
    // 1. Input validation
    if (questions <= 0 || questions > 1000) {
      _showErrorSnackBar(
        'Invalid question quantity. Please select a valid offer.',
      );
      return;
    }

    // 2. Rate limiting
    if (_lastPaymentAttempt != null &&
        DateTime.now().difference(_lastPaymentAttempt!) <
            const Duration(seconds: 10)) {
      _showErrorSnackBar('Please wait a moment before making another payment.');
      return;
    }

    // 3. Check if already processing
    if (_processingOfferId != null) return; // ← Changed this lin

    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    final token = profileProvider.token ?? await _secureStorage.getToken();

    if (token == null) {
      _showErrorSnackBar(l10n.missingAuthToken);
      return;
    }

    // 4. Biometric auth for high-value purchases
    final offer = offers.firstWhere((o) => o['questions'] == questions);
    final packageId = offer['id'];
    final double price = (offer['price'] as num).toDouble(); // <-- add this

    if (price >= 15.0) {
      final bool authenticated = await _authenticateWithBiometrics(
        'Confirm payment of \$${price.toStringAsFixed(2)}',
      );
      if (!authenticated) {
        _showErrorSnackBar('Authentication required for this purchase.');
        return;
      }
    }

    // Log payment initiation
    AnalyticsService().logPaymentInitiated(questions, price);

    _lastPaymentAttempt = DateTime.now();
    setState(() {
      _processingOfferId = questions;
    });

    try {
      final clientSecret = await _paymentService.createPaymentIntent(
        token: token,
        packageId: packageId,
      );

      // Extract payment intent ID for verification
      final paymentIntentId = _extractPaymentIntentId(clientSecret);

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: l10n.merchantDisplayName,
          applePay:
              Environment.isProduction
                  ? const PaymentSheetApplePay(merchantCountryCode: 'US')
                  : null,
          googlePay:
              Environment.isProduction
                  ? const PaymentSheetGooglePay(
                    merchantCountryCode: 'US',
                    currencyCode: 'USD',
                    testEnv: true,
                  )
                  : null,
          style:
              Theme.of(context).brightness == Brightness.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Colors.deepPurple,
              background: Colors.white,
              componentBackground: Colors.white,
              componentBorder: Colors.grey,
              componentDivider: Colors.grey,
              primaryText: Colors.black,
              secondaryText: Colors.grey,
              componentText: Colors.black,
              icon: Colors.deepPurple,
            ),
          ),
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();

      // ✅ CRITICAL: Verify payment with backend - FIXED LINE
      final isVerified = await _verifyPayment(
        paymentIntentId,
        token,
        questions,
      );

      if (!isVerified) {
        throw Exception('Payment verification failed');
      }

      // Log successful payment
      AnalyticsService().logPaymentSuccess(paymentIntentId, questions, price);

      _showSuccessSnackBar(l10n.paymentSuccessful);

      // Reload balance
      await _loadData();

      // Notify server via socket
      final userId = profileProvider.userId ?? await _secureStorage.getUserId();
      if (userId != null) {
        SocketService().socket.emit('paymentComplete', {
          'userId': userId,
          'questions': questions,
          'paymentIntentId': paymentIntentId,
          'timestamp': DateTime.now().toIso8601String(),
        });
      }

      // Log successful payment
      _logPaymentSuccess(questions, userId, paymentIntentId);
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        AnalyticsService().logPaymentCancelled(questions, price);
        return;
      }
      AnalyticsService().logPaymentFailed(
        e.error.localizedMessage ?? 'Unknown error',
        questions,
        price,
      );
      _showErrorSnackBar('${l10n.paymentFailed}: ${e.error.localizedMessage}');
    } on Exception catch (e) {
      AnalyticsService().logPaymentFailed(e.toString(), questions, price);
      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e));
    } finally {
      setState(() {
        _processingOfferId = null;
      });
    }
  }

  // Helper method to extract payment intent ID
  String _extractPaymentIntentId(String clientSecret) {
    // clientSecret format: "pi_xxx_secret_yyy"
    return clientSecret.split('_secret_').first;
  }

  Future<bool> _verifyPayment(
    String paymentIntentId,
    String token,
    int expectedQuestions,
  ) async {
    try {
      final response = await HttpService.post(
        '${Environment.baseUrl}/api/questionspayment/verify-payment',
        token: token,
        body: {
          'paymentIntentId': paymentIntentId,
          'expectedQuestions': expectedQuestions,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['verified'] == true;
      } else {
        // Log the actual error from backend
        final errorBody = json.decode(response.body);
        print('Payment verification failed: ${errorBody['error']}');
        return false;
      }
    } catch (e) {
      print('Payment verification error: $e');
      return false;
    }
  }

  void _logPaymentEvent(String event, Map<String, dynamic> params) {
    // For now, just print - you can integrate with your analytics service
    print('Payment Event: $event - $params');
  }

  void _logPaymentSuccess(
    int questions,
    String? userId,
    String paymentIntentId,
  ) {
    print(
      'Payment successful: $questions questions for user $userId, Payment ID: $paymentIntentId',
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Row(
                children: [
                  Container(width: 30, height: 30, color: Colors.white),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14,
                          color: Colors.white,
                          margin: const EdgeInsets.only(bottom: 8),
                        ),
                        Container(height: 14, width: 80, color: Colors.white),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.buyQuestionsTitle),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SafeArea(
        child:
            isLoading
                ? _buildSkeletonLoader()
                : RefreshIndicator(
                  onRefresh: _loadData,
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                    ),
                    children: [
                      _buildBalanceCard(l10n),
                      const SizedBox(height: 20),
                      Text(
                        l10n.availableOffers,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...offers
                          .map((offer) => _buildOfferCard(offer, l10n))
                          .toList(),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildBalanceCard(AppLocalizations l10n) {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.stars, color: Colors.deepPurple, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.yourBalance,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    l10n.questionsBalance(questionBalance),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> offer, AppLocalizations l10n) {
    int questions = offer['questions'];
    double price = (offer['price'] as num).toDouble();

    bool isThisOfferProcessing = _processingOfferId == questions;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: Icon(
          Icons.question_answer,
          color: Colors.purple.shade300,
          size: 30,
        ),
        title: Text(
          l10n.questionsCount(questions),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "\$${price.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        trailing:
            isThisOfferProcessing // ← Use the specific check
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () => _startStripePayment(questions),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    l10n.buyButton,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up any resources if needed
    super.dispose();
  }
}
