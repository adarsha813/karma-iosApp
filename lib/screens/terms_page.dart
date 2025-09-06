import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Terms & Conditions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "1. Acceptance of Terms\n"
              "By using this app, you agree to the following terms...\n\n"
              "2. User Responsibilities\n"
              "Users must ensure...\n\n"
              "3. Limitation of Liability\n"
              "The app is provided as is...\n\n"
              "4. Intellectual Property\n"
              "All content is owned by...\n\n"
              "5. Privacy\n"
              "Your information will be used according to our privacy policy.\n\n"
              "6. Changes to Terms\n"
              "We may update these terms at any time...",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
