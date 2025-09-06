import 'package:flutter/material.dart';
import '../services/email_service.dart';

class CustomerSupportPage extends StatefulWidget {
  const CustomerSupportPage({super.key});

  @override
  State<CustomerSupportPage> createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSending = true);

      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();

      final success = await EmailService.sendEmail(
        name: name,
        email: email,
        message: message,
      );

      setState(() => _isSending = false);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Email sent successfully!")),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("❌ Failed to send email")));
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your email";
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Customer Support"),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Icon(Icons.support_agent, size: 60, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    "We’re Here to Help",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Fill out the form below and our support team will get back to you as soon as possible.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Form Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Your Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? "Enter your name"
                                    : null,
                      ),
                      const SizedBox(height: 16),

                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Your Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 16),

                      // Message
                      TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          labelText: "Message",
                          prefixIcon: Icon(Icons.message),
                          border: OutlineInputBorder(),
                        ),
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    ? "Enter your message"
                                    : null,
                      ),
                      const SizedBox(height: 24),

                      // Send Button
                      ElevatedButton.icon(
                        onPressed: _isSending ? null : _sendEmail,
                        icon:
                            _isSending
                                ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : const Icon(Icons.send),
                        label: Text(_isSending ? "Sending..." : "Send"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
