import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:shimmer/shimmer.dart';
import '../providers/profile_provider.dart';
import '../services/payment_service.dart';
import '../services/socket_service.dart';
import '../services/secure_storage_service.dart';
import '../utils/error_handler.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';

class QuestionStoreScreen extends StatefulWidget {
  const QuestionStoreScreen({super.key});

  @override
  State<QuestionStoreScreen> createState() => _QuestionStoreScreenState();
}

class _QuestionStoreScreenState extends State<QuestionStoreScreen> {
  int questionBalance = 0;
  List<Map<String, dynamic>> offers = [];
  bool isLoading = true;
  bool isProcessingPayment = false;

  final PaymentService _paymentService = PaymentService();
  final SecureStorageService _secureStorage = SecureStorageService();

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
      });
    } on Exception catch (e) {
      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e));
    }

    setState(() => isLoading = false);
  }

  Future<void> _startStripePayment(int questions) async {
    if (isProcessingPayment) return;

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

    setState(() => isProcessingPayment = true);

    try {
      final clientSecret = await _paymentService.createPaymentIntent(
        token: token,
        questions: questions,
      );

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

      // Payment successful
      _showSuccessSnackBar(l10n.paymentSuccessful);

      // Reload balance
      await _loadData();

      // Notify server via socket
      final userId = profileProvider.userId ?? await _secureStorage.getUserId();
      if (userId != null) {
        SocketService().socket.emit('paymentComplete', {
          'userId': userId,
          'questions': questions,
          'timestamp': DateTime.now().toIso8601String(),
        });
      }

      // Log successful payment (for analytics)
      _logPaymentSuccess(questions, userId);
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        // User cancelled payment - no need to show error
        return;
      }
      _showErrorSnackBar('${l10n.paymentFailed}: ${e.error.localizedMessage}');
    } on Exception catch (e) {
      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e));
    } finally {
      setState(() => isProcessingPayment = false);
    }
  }

  void _logPaymentSuccess(int questions, String? userId) {
    // Implement your analytics/logging here
    print('Payment successful: $questions questions for user $userId');
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
            isProcessingPayment
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
