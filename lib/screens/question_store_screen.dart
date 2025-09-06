import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import '../services/socket_service.dart';
import 'package:shimmer/shimmer.dart';

class QuestionStoreScreen extends StatefulWidget {
  const QuestionStoreScreen({super.key});

  @override
  State<QuestionStoreScreen> createState() => _QuestionStoreScreenState();
}

class _QuestionStoreScreenState extends State<QuestionStoreScreen> {
  int questionBalance = 0;
  List<Map<String, dynamic>> offers = [];
  bool isLoading = true;

  final String baseUrl = "https://chat-backend-rvk9.onrender.com";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadData);
  }

  Future<void> _loadData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    await profileProvider.loadToken(); // Make sure token is loaded

    final token = profileProvider.token;
    final userId = profileProvider.userId;

    if (token == null || userId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User not authenticated")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final balanceRes = await http.get(
        Uri.parse("$baseUrl/api/questionspayment/balance"),
        headers: {"Authorization": "Bearer $token"},
      );

      final offersRes = await http.get(
        Uri.parse("$baseUrl/api/questionspayment/offers"),
      );

      if (balanceRes.statusCode == 200 && offersRes.statusCode == 200) {
        final balanceJson = json.decode(balanceRes.body);
        final offersJson = json.decode(offersRes.body);

        setState(() {
          questionBalance = balanceJson['remaining'] ?? 0;
          offers = List<Map<String, dynamic>>.from(offersJson);
        });
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      print("Error loading store data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load store data")),
      );
    }

    setState(() => isLoading = false);
  }

  Future<void> startStripePayment(int questions) async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final token = profileProvider.token;

    if (token == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Missing auth token")));
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/questionspayment/create-payment-intent"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({'questions': questions}),
      );

      final jsonResponse = json.decode(response.body);
      final clientSecret = jsonResponse['clientSecret'];

      // 1. Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Astro Chat App',
          // style: ThemeMode.dark, // Optional
        ),
      );

      // 2. Present the sheet
      await Stripe.instance.presentPaymentSheet();

      // 3. Success message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Payment successful!')));

      // ✅ Show local notification

      // Reload the balance
      await _loadData();

      final userId = profileProvider.userId;

      if (userId != null) {
        SocketService().socket.emit('paymentComplete', {
          'userId': userId,
          'questions': questions,
        });
        print("✅ Emitted paymentComplete via socket");
      }
    } catch (e) {
      if (e is StripeException && e.error.code == FailureCode.Canceled) {
        print('Payment cancelled by user.');
        return;
      } else {
        print('Payment error: $e');
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: ${e.toString()}')),
      );
    }
  }

  void _handlePurchase(int questions) {
    startStripePayment(questions);
  }

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // Number of shimmer cards to show
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Questions"),
        backgroundColor: Colors.deepPurpleAccent,
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
                      _buildBalanceCard(),
                      const SizedBox(height: 20),
                      Text(
                        "Available Offers",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      ...offers.map(_buildOfferCard).toList(),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.stars, color: Colors.deepPurple, size: 36),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Balance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "$questionBalance Questions",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> offer) {
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
          "$questions Question${questions > 1 ? 's' : ''}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text("\$$price"),
        trailing: ElevatedButton(
          onPressed: () => _handlePurchase(questions),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Buy"),
        ),
      ),
    );
  }
}
