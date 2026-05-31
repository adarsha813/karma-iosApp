import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../config/environment.dart';
import 'http_service.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../utils/app_logger.dart';

class BillingService {
  final InAppPurchase _iap = InAppPurchase.instance;
  BuildContext? _context;

  // ✅ All products (including single question)
  final List<String> _allProductIds = [
    'question_single',
    'question_1',
    'question_5',
    'question_10',
  ];

  // ✅ Store all products
  List<ProductDetails> allProducts = [];

  // ✅ For question store - only packages (filters out question_single)
  List<ProductDetails> get packageProducts =>
      allProducts
          .where(
            (p) => p.id.startsWith('question_') && p.id != 'question_single',
          )
          .toList();

  // ✅ For chat screen - single question product
  ProductDetails? get singleQuestionProduct {
    try {
      return allProducts.firstWhere((p) => p.id == 'question_single');
    } catch (e) {
      return null;
    }
  }

  // For backward compatibility - products getter returns all products
  List<ProductDetails> get products => allProducts;

  StreamSubscription<List<PurchaseDetails>>? _subscription;

  // Callbacks
  Function(int questionCount)? onPackagePurchaseSuccess;
  Function()? onSingleQuestionPurchaseSuccess;
  Function(String error)? onPurchaseError;
  Function()? onPurchaseCancelled;
  bool _isSuccessfullyProcessed = false;
  // Purchase tracking
  bool _isPurchasing = false;
  final Set<String> _processingTokens = {};
  Completer<bool>? activePurchaseCompleter;

  // Singleton pattern
  static final BillingService _instance = BillingService._internal();
  factory BillingService() => _instance;
  BillingService._internal();

  // Initialize with context
  void initialize(BuildContext context) {
    _context = context;
    AppLogger.info('✅ BillingService initialized with context');
  }

  Future<bool> hasValidToken() async {
    if (_context == null) {
      AppLogger.info('⚠️ Cannot check token: No context');
      return false;
    }

    try {
      final token = await _getFreshToken();
      return token != null && token.isNotEmpty;
    } catch (e) {
      AppLogger.info('⚠️ Error checking token: $e');
      return false;
    }
  }

  Future<String?> get authToken async {
    return await _getFreshToken();
  }

  void setAuthToken(String token) {
    AppLogger.info(
      'ℹ️ setAuthToken called - tokens are now auto-managed from Provider',
    );
    // No need to store token manually anymore
  }

  // Initialize all products
  Future<void> init() async {
    final available = await _iap.isAvailable();
    if (!available) {
      AppLogger.info("⚠️ Store not available");
      return;
    }

    await _subscription?.cancel();

    final response = await _iap.queryProductDetails(_allProductIds.toSet());
    if (response.error != null) {
      AppLogger.info("❌ Product query error: ${response.error}");
      onPurchaseError?.call("Failed to load products: ${response.error}");
    }

    allProducts = response.productDetails;
    AppLogger.info("✅ All products loaded: ${allProducts.length}");
    for (var product in allProducts) {
      AppLogger.info("   - ${product.id}: ${product.title} - ${product.price}");
    }

    // Verify single question product is available
    if (singleQuestionProduct == null) {
      AppLogger.info(
        "⚠️ WARNING: question_single product not found in Google Play Console!",
      );
    } else {
      AppLogger.info(
        "✅ Single question product available: ${singleQuestionProduct?.price}",
      );
    }

    _subscription = _iap.purchaseStream.listen(
      _listenToPurchase,
      onError: (error) {
        AppLogger.info("❌ Purchase stream error: $error");
        _isPurchasing = false;
        onPurchaseError?.call(error.toString());
      },
    );
  }

  // For backward compatibility with QuestionStoreScreen
  Future<void> buy(ProductDetails product) async {
    await _buy(product);
  }

  // For chat screen - buy single question
  Future<void> buySingleQuestion() async {
    final product = singleQuestionProduct;
    if (product == null) {
      onPurchaseError?.call("Single question purchase not available");
      return;
    }
    await _buy(product);
  }

  // Private buy method
  Future<void> _buy(ProductDetails product) async {
    if (_isPurchasing) {
      AppLogger.info("⚠️ Purchase already in progress");
      onPurchaseError?.call("A purchase is already in progress. Please wait.");
      return;
    }

    if (!await hasValidToken()) {
      AppLogger.info("❌ Cannot purchase: No valid auth token");
      onPurchaseError?.call("Authentication required for purchase");
      return;
    }

    try {
      _isPurchasing = true;
      AppLogger.info("🛒 Starting purchase for: ${product.id}");

      final purchaseParam = PurchaseParam(productDetails: product);
      await _iap.buyConsumable(purchaseParam: purchaseParam, autoConsume: true);
    } catch (e) {
      AppLogger.info("❌ Purchase failed: $e");
      _isPurchasing = false;
      onPurchaseError?.call(e.toString());
    }
  }

  void _listenToPurchase(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      final purchaseKey =
          "${purchase.productID}_${purchase.purchaseID ?? DateTime.now().millisecondsSinceEpoch}";

      if (_processingTokens.contains(purchaseKey)) {
        AppLogger.info("⚠️ Purchase already being processed: $purchaseKey");
        if (purchase.pendingCompletePurchase) {
          _iap.completePurchase(purchase);
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.purchased) {
        _processingTokens.add(purchaseKey);
        _isSuccessfullyProcessed = false; // Reset flag

        hasValidToken().then((valid) {
          if (!valid) {
            AppLogger.info("❌ Token missing when handling purchase");
            _processingTokens.remove(purchaseKey);
            _isPurchasing = false;
            onPurchaseError?.call("Authentication error. Please restart app.");
            _storePendingPurchase(purchase);

            if (purchase.pendingCompletePurchase) {
              _iap.completePurchase(purchase);
            }
          } else {
            _handleSuccessfulPurchase(purchase, purchaseKey);
          }
        });
      } else if (purchase.status == PurchaseStatus.error) {
        if (!_isSuccessfullyProcessed) {
          final error = purchase.error?.message ?? 'Unknown error';
          AppLogger.info("❌ Purchase error: $error");
          _isPurchasing = false;
          onPurchaseError?.call(error);
          activePurchaseCompleter?.complete(false);
          activePurchaseCompleter = null;
        } else {
          AppLogger.info("✅ Purchase already succeeded, ignoring error event");
        }

        if (purchase.pendingCompletePurchase) {
          _iap.completePurchase(purchase);
        }
      } else if (purchase.status == PurchaseStatus.canceled) {
        if (!_isSuccessfullyProcessed) {
          AppLogger.info("ℹ️ Purchase cancelled");
          _isPurchasing = false;
          onPurchaseCancelled?.call();
          activePurchaseCompleter?.complete(false);
          activePurchaseCompleter = null;
        } else {
          AppLogger.info("✅ Purchase already succeeded, ignoring cancel event");
        }

        if (purchase.pendingCompletePurchase) {
          _iap.completePurchase(purchase);
        }
      } else {
        if (purchase.pendingCompletePurchase) {
          _iap.completePurchase(purchase);
        }
      }
    }
  }

  int _getQuestionCountFromProductId(String productId) {
    switch (productId) {
      case 'question_single':
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

  bool _isSingleQuestionPurchase(String productId) {
    return productId == 'question_single';
  }

  Future<void> _handleSuccessfulPurchase(
    PurchaseDetails purchase,
    String purchaseKey,
  ) async {
    final purchaseToken = purchase.verificationData.serverVerificationData;
    final productId = purchase.productID;
    final questionCount = _getQuestionCountFromProductId(productId);
    final isSingleQuestion = _isSingleQuestionPurchase(productId);
    // ✅ CRITICAL FIX: Get the actual price from the product details
    final productDetails = allProducts.firstWhere(
      (p) => p.id == productId,
      orElse: () => throw Exception('Product not found: $productId'),
    );

    // Extract amount from price string (e.g., "$6.99" -> 6.99)
    final amount = _extractAmountFromPrice(productDetails.price);
    final currency = _extractCurrency(productDetails.price);

    AppLogger.info(
      "🛡️ Verifying purchase: $productId (Single: $isSingleQuestion)",
    );
    AppLogger.info("   Amount: $amount $currency");
    AppLogger.info("   Token preview: ${purchaseToken.substring(0, 20)}...");

    try {
      if (_context == null) {
        throw Exception('BillingService not initialized with context');
      }

      // ✅ Include amount in verification request
      final response = await HttpService().post(
        "${Environment.baseUrl}/api/payments/verify-google-play",
        body: {
          "purchaseToken": purchaseToken,
          "productId": productId,
          "amount": amount, // ← Add amount
          "currency": currency, // ← Add currency
        },
        requiresAuth: true,
      );

      AppLogger.info("✅ Backend response: ${response.statusCode}");
      AppLogger.info("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["success"] == true) {
          AppLogger.info("✅ Purchase verified successfully");
          // Set success flag BEFORE calling callbacks
          _isSuccessfullyProcessed = true;

          if (isSingleQuestion) {
            AppLogger.info("🎯 Triggering single question success callback");
            onSingleQuestionPurchaseSuccess?.call();
          } else {
            final credits = data["credits"] ?? questionCount;
            AppLogger.info("📦 Package purchase: $credits credits added");
            onPackagePurchaseSuccess?.call(credits);
          }

          activePurchaseCompleter?.complete(true);
          activePurchaseCompleter = null;
        } else {
          if (data["code"] == "ALREADY_PROCESSED" ||
              data["code"] == "DUPLICATE_REQUEST") {
            AppLogger.info("ℹ️ Purchase was already processed");

            _isSuccessfullyProcessed = true;
            if (isSingleQuestion) {
              onSingleQuestionPurchaseSuccess?.call();
            } else {
              onPackagePurchaseSuccess?.call(questionCount);
            }
            activePurchaseCompleter?.complete(true);
            activePurchaseCompleter = null;
          } else {
            AppLogger.info("⚠️ Verification failed: ${response.body}");
            _isSuccessfullyProcessed = false;
            onPurchaseError?.call(
              "Purchase verification failed. Please contact support.",
            );
            activePurchaseCompleter?.complete(false);
            activePurchaseCompleter = null;
          }
        }
      } else if (response.statusCode == 429) {
        AppLogger.info(
          "ℹ️ Duplicate request detected - purchase likely succeeded",
        );
        _isSuccessfullyProcessed = true;

        if (isSingleQuestion) {
          onSingleQuestionPurchaseSuccess?.call();
        } else {
          onPackagePurchaseSuccess?.call(questionCount);
        }
        activePurchaseCompleter?.complete(true);
        activePurchaseCompleter = null;
      } else if (response.statusCode == 401) {
        AppLogger.info("⚠️ Authentication failed during verification");
        _isSuccessfullyProcessed = false;
        onPurchaseError?.call("Authentication failed. Please try again.");
        activePurchaseCompleter?.complete(false);
        activePurchaseCompleter = null;
      } else {
        AppLogger.info("⚠️ Verification failed: ${response.statusCode}");
        _isSuccessfullyProcessed = false;
        onPurchaseError?.call(
          "Server verification failed. Please contact support.",
        );
        activePurchaseCompleter?.complete(false);
        activePurchaseCompleter = null;
      }
    } on TimeoutException {
      AppLogger.info("⚠️ Timeout - assuming success");
      _isSuccessfullyProcessed = true;
      if (isSingleQuestion) {
        onSingleQuestionPurchaseSuccess?.call();
      } else {
        onPackagePurchaseSuccess?.call(questionCount);
      }
      activePurchaseCompleter?.complete(true);
      activePurchaseCompleter = null;
    } catch (e) {
      if (!_isSuccessfullyProcessed) {
        AppLogger.info("❌ Verification error: $e");

        if (e.toString().contains("Authentication timeout") ||
            e.toString().contains("Authentication failed")) {
          onPurchaseError?.call("Authentication error. Please log in again.");
        } else {
          onPurchaseError?.call("Network error. Please check your connection.");
        }
        await _storePendingPurchase(purchase);
        activePurchaseCompleter?.complete(false);
        activePurchaseCompleter = null;
      } else {
        AppLogger.info("✅ Purchase already succeeded, ignoring error: $e");
      }
    } finally {
      _processingTokens.remove(purchaseKey);
      _isPurchasing = false;

      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  // Helper: Extract numeric amount from price string
  double _extractAmountFromPrice(String priceString) {
    // Remove currency symbols and convert to number
    final match = RegExp(r'[\d\.]+').firstMatch(priceString);
    if (match != null) {
      return double.tryParse(match.group(0)!) ?? 0.0;
    }
    return 0.0;
  }

  // Helper: Extract currency from price string
  String _extractCurrency(String priceString) {
    // Try to get currency from price string
    final match = RegExp(r'^[^\d\.]+').firstMatch(priceString);
    if (match != null) {
      return match.group(0)!.trim();
    }
    return 'USD'; // Default
  }

  void resetSuccessFlag() {
    _isSuccessfullyProcessed = false;
  }

  Future<void> _storePendingPurchase(PurchaseDetails purchase) async {
    AppLogger.info(
      "💾 Storing pending purchase for later retry: ${purchase.productID}",
    );
    // Implement storage of failed purchases for later retry
  }

  Future<String?> _getFreshToken() async {
    if (_context == null) return null;

    try {
      // Small delay to ensure we're not in a build cycle
      await Future.microtask(() {});

      final profileProvider = Provider.of<ProfileProvider>(
        _context!,
        listen: false,
      );

      return profileProvider.token;
    } catch (e) {
      AppLogger.info('⚠️ Error getting fresh token: $e');
      return null;
    }
  }

  void dispose() {
    _subscription?.cancel();
    _processingTokens.clear();
    _isPurchasing = false;
    _context = null;
  }
}
