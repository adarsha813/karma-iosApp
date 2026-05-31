import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/profile_provider.dart';
import '../services/billing_service.dart';
import '../services/secure_storage_service.dart';
import '../services/local_auth_service.dart';
import '../services/analytics_service.dart';
import '../services/payment_service.dart';
import '../utils/error_handler.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:async';

class QuestionStoreScreen extends StatefulWidget {
  const QuestionStoreScreen({super.key});

  @override
  State<QuestionStoreScreen> createState() => _QuestionStoreScreenState();
}

class _QuestionStoreScreenState extends State<QuestionStoreScreen> {
  int questionBalance = 0;
  List<Map<String, dynamic>> offers = [];
  bool isLoading = true;
  String? _processingProductId;

  // Track in-progress purchases
  final Set<String> _purchasesInProgress = {};
  bool _isProcessingPurchase = false;

  // Flag to prevent multiple callback registrations
  bool _callbacksInitialized = false;

  // Completer for purchase completion
  Completer<bool>? _activePurchaseCompleter;

  final PaymentService _paymentService = PaymentService();
  late final BillingService _billingService;
  final SecureStorageService _secureStorage = SecureStorageService();
  DateTime? _lastPurchaseAttempt;
  int _retryCount = 0;
  final int _maxRetries = 3;

  @override
  void initState() {
    super.initState();
    _billingService = BillingService();
    _initializeBilling();
    Future.delayed(Duration.zero, _loadData);
  }

  Future<void> _initializeBilling() async {
    try {
      // 🔥 ADD THIS LINE - Initialize billing service with current context
      _billingService.initialize(context);

      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      final token = profileProvider.token ?? await _secureStorage.getToken();

      if (token != null) {
        _billingService.setAuthToken(token);
      }

      await _billingService.init();

      if (!_callbacksInitialized) {
        _setupCallbacks();
        _callbacksInitialized = true;
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e as Exception));
      }
    }
  }

  void _setupCallbacks() {
    _billingService.onPackagePurchaseSuccess = (questionCount) {
      if (_isProcessingPurchase) return;
      _isProcessingPurchase = true;
      // Complete the completer
      _activePurchaseCompleter?.complete(true);
      _activePurchaseCompleter = null;

      // Remove from processing set
      if (_processingProductId != null) {
        _purchasesInProgress.remove(_processingProductId);
      }

      if (mounted) {
        setState(() {
          _processingProductId = null;
          questionBalance += questionCount;
        });

        _showSuccessSnackBar(AppLocalizations.of(context)!.paymentSuccessful);
        _loadData().then((_) {
          // Reset flag after loading completes
          Future.delayed(Duration(seconds: 1), () {
            _isProcessingPurchase = false;
          });
        });
      } else {
        _isProcessingPurchase = false;
      }
    };

    _billingService.onPurchaseError = (error) {
      // Only show error if not already processing a success
      if (!_isProcessingPurchase) {
        // Complete the completer with failure
        _activePurchaseCompleter?.complete(false);
        _activePurchaseCompleter = null;

        // Clear processing states
        _purchasesInProgress.clear();

        if (mounted) {
          setState(() {
            _processingProductId = null;
          });
          _showErrorSnackBar(error);
        }
      } else {}

      _isProcessingPurchase = false;
    };

    _billingService.onPurchaseError = (error) {
      // Complete the completer with failure
      _activePurchaseCompleter?.complete(false);
      _activePurchaseCompleter = null;

      // Clear processing states
      _purchasesInProgress.clear();

      if (mounted) {
        setState(() {
          _processingProductId = null;
        });
        _showErrorSnackBar(error);
      }
    };

    _billingService.onPurchaseCancelled = () {
      // Complete the completer with failure for cancelled
      _activePurchaseCompleter?.complete(false);
      _activePurchaseCompleter = null;

      // Remove from processing set
      if (_processingProductId != null) {
        _purchasesInProgress.remove(_processingProductId);
      }

      if (mounted) {
        setState(() {
          _processingProductId = null;
        });
        _showInfoSnackBar('Purchase cancelled');
      }
    };
  }

  Future<bool> _authenticateWithBiometrics(String reason) async {
    try {
      final canAuthenticate = await LocalAuthService().isBiometricAvailable();
      if (!canAuthenticate) return true;
      return await LocalAuthService().authenticate(reason);
    } catch (e) {
      return false;
    }
  }

  Future<void> _loadData() async {
    final l10n = AppLocalizations.of(context)!;
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    final token = profileProvider.token ?? await _secureStorage.getToken();
    final userId = profileProvider.userId ?? await _secureStorage.getUserId();

    if (token == null || userId == null) {
      _showErrorSnackBar(l10n.userNotAuthenticated);
      return;
    }

    _billingService.setAuthToken(token);

    setState(() => isLoading = true);

    try {
      final balance = await _paymentService.getQuestionBalance(token);

      final offersList =
          _billingService.packageProducts.map((product) {
            int questions = _getQuestionCountFromProductId(product.id);
            double price = _extractPriceFromProduct(product.price);

            return {
              'packageId': product.id,
              'questions': questions,
              'price': price,
              'savings': _calculateSavings(questions, price),
              'title': product.title,
              'description': product.description,
            };
          }).toList();

      setState(() {
        questionBalance = balance;
        offers =
            offersList..sort((a, b) {
              final qa = a['questions'] as int;
              final qb = b['questions'] as int;
              return qa.compareTo(qb);
            });
      });

      _retryCount = 0;
    } on Exception catch (e) {
      if (_retryCount < _maxRetries) {
        _retryCount++;
        final delay = Duration(seconds: 2 * _retryCount);
        await Future.delayed(delay);
        return _loadData();
      }

      if (mounted) {
        _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e));
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  int _getQuestionCountFromProductId(String productId) {
    switch (productId) {
      case 'question_1':
        return 1;
      case 'question_5':
        return 5;
      case 'question_10':
        return 10;
      default:
        return 0;
    }
  }

  double _extractPriceFromProduct(String priceString) {
    final RegExp regex = RegExp(r'[\d.]+');
    final match = regex.firstMatch(priceString);
    if (match != null) {
      return double.tryParse(match.group(0) ?? '0') ?? 0.0;
    }
    return 0.0;
  }

  int _calculateSavings(int questions, double price) {
    const double singleQuestionPrice = 3.0;
    double originalPrice = questions * singleQuestionPrice;
    if (originalPrice > 0) {
      return ((originalPrice - price) / originalPrice * 100).round();
    }
    return 0;
  }

  Future<void> _startPurchase(int questions) async {
    // Validate inputs
    if (questions <= 0 || questions > 1000) {
      _showErrorSnackBar('Invalid question quantity.');
      return;
    }

    // Rate limiting
    if (_lastPurchaseAttempt != null &&
        DateTime.now().difference(_lastPurchaseAttempt!) <
            const Duration(seconds: 10)) {
      _showErrorSnackBar('Please wait before making another purchase.');
      return;
    }

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );

    final token = profileProvider.token ?? await _secureStorage.getToken();
    final userId = profileProvider.userId ?? await _secureStorage.getUserId();

    if (userId == null || token == null) {
      _showErrorSnackBar("User not authenticated");
      return;
    }

    // Find the offer
    final offer = offers.firstWhere((o) => o['questions'] == questions);
    final packageId = offer['packageId'] as String;
    final double price = offer['price'] as double;

    // Check if this product is already being processed
    if (_purchasesInProgress.contains(packageId)) {
      _showInfoSnackBar('Purchase already in progress...');
      return;
    }

    // Biometric auth for high-value purchases
    if (price >= 15.0) {
      final bool authenticated = await _authenticateWithBiometrics(
        'Confirm purchase of \$${price.toStringAsFixed(2)}',
      );
      if (!authenticated) {
        _showErrorSnackBar('Authentication required.');
        return;
      }
    }

    // Find the product
    final product = _billingService.products.firstWhere(
      (p) => p.id == packageId,
      orElse: () => throw Exception('Product not found'),
    );

    // Log and mark as in progress
    AnalyticsService().logPaymentInitiated(questions, price);
    _lastPurchaseAttempt = DateTime.now();

    setState(() {
      _processingProductId = packageId;
    });
    _purchasesInProgress.add(packageId);

    // Create completer BEFORE setting it in billing service
    _activePurchaseCompleter = Completer<bool>();
    _billingService.activePurchaseCompleter = _activePurchaseCompleter;

    // Set token in billing service
    _billingService.setAuthToken(token);

    // Show loading dialog
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }

    try {
      // Process the purchase with a timeout
      await _billingService
          .buy(product)
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              throw TimeoutException('Purchase request timed out');
            },
          );

      // Wait for the purchase to complete - check if completer still exists
      if (_activePurchaseCompleter != null) {
        final success = await _activePurchaseCompleter!.future.timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            // Clean up on timeout
            if (mounted) {
              try {
                Navigator.pop(context);
              } catch (_) {}
            }
            _purchasesInProgress.remove(packageId);
            setState(() {
              if (_processingProductId == packageId) {
                _processingProductId = null;
              }
            });
            _showErrorSnackBar(
              'Purchase timed out. Please check your purchases and try restoring.',
            );
            return false;
          },
        );

        // Remove loading dialog
        if (mounted) {
          try {
            Navigator.pop(context);
          } catch (_) {}
        }

        if (!success && mounted) {
          _showErrorSnackBar('Purchase failed. Please try again.');
        }
      } else {
        // Completer was nullified - this shouldn't happen normally
        if (mounted) {
          try {
            Navigator.pop(context);
          } catch (_) {}
        }
        _purchasesInProgress.remove(packageId);
        setState(() {
          if (_processingProductId == packageId) {
            _processingProductId = null;
          }
        });
        _showErrorSnackBar('Purchase process interrupted. Please try again.');
      }
    } on TimeoutException {
      // Handle timeout specifically
      if (mounted) {
        try {
          Navigator.pop(context);
        } catch (_) {}
      }
      _purchasesInProgress.remove(packageId);
      setState(() {
        if (_processingProductId == packageId) {
          _processingProductId = null;
        }
      });
      _showErrorSnackBar('Request timed out. Please check your connection.');
    } catch (e) {
      // Clean up on error
      if (mounted) {
        try {
          Navigator.pop(context);
        } catch (_) {}
      }

      _purchasesInProgress.remove(packageId);
      if (mounted) {
        setState(() {
          if (_processingProductId == packageId) {
            _processingProductId = null;
          }
        });
      }

      // Only complete if completer still exists
      _activePurchaseCompleter?.complete(false);
      _activePurchaseCompleter = null;
      _billingService.activePurchaseCompleter = null;

      AnalyticsService().logPaymentFailed(e.toString(), questions, price);
      _showErrorSnackBar(ErrorHandler.getUserFriendlyMessage(e as Exception));
    }
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: theme.colorScheme.errorContainer,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) return;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showInfoSnackBar(String message) {
    if (!mounted) return;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: theme.colorScheme.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _buildSkeletonLoader(ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          color: theme.colorScheme.surface,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Shimmer.fromColors(
              baseColor: theme.colorScheme.surfaceContainerHighest,
              highlightColor: theme.colorScheme.surface,
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.3,
                          ),
                          margin: const EdgeInsets.only(bottom: 8),
                        ),
                        Container(
                          height: 14,
                          width: 80,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 36,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.buyQuestionsTitle),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed:
                _processingProductId == null
                    ? () {
                      InAppPurchase.instance.restorePurchases();
                      _showInfoSnackBar('Restoring purchases...');
                    }
                    : null,
          ),
        ],
      ),
      body: Container(
        color: theme.colorScheme.surface,
        child: SafeArea(
          child:
              isLoading
                  ? _buildSkeletonLoader(theme)
                  : RefreshIndicator(
                    onRefresh: _loadData,
                    color: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.surface,
                    child: ListView(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                      ),
                      children: [
                        _buildBalanceCard(theme, l10n),
                        const SizedBox(height: 20),
                        Text(
                          l10n.availableOffers,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (offers.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No products available',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Please check your internet connection',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          ...offers.map(
                            (offer) => _buildOfferCard(offer, theme, l10n),
                          ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(ThemeData theme, AppLocalizations l10n) {
    return Card(
      color: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.stars, color: theme.colorScheme.primary, size: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.yourBalance,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    l10n.questionsBalance(questionBalance),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
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

  Widget _buildOfferCard(
    Map<String, dynamic> offer,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    final questions = offer['questions'] as int;
    final price = offer['price'] as double;
    final packageId = offer['packageId'] as String;
    final savings = offer['savings'] as int;

    bool isThisOfferProcessing = _purchasesInProgress.contains(packageId);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      color: theme.colorScheme.surface,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: Icon(
          Icons.question_answer,
          color: theme.colorScheme.primary,
          size: 30,
        ),
        title: Text(
          l10n.questionsCount(questions),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${price.toStringAsFixed(2)}",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            if (savings > 0)
              Text(
                "Save $savings%",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        trailing:
            isThisOfferProcessing
                ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: theme.colorScheme.primary,
                  ),
                )
                : ElevatedButton(
                  onPressed: () => _startPurchase(questions),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
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
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
      ),
    );
  }

  @override
  void dispose() {
    _billingService.dispose();
    _activePurchaseCompleter = null;
    _purchasesInProgress.clear();
    super.dispose();
  }
}
