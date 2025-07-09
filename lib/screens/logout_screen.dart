import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.exit_to_app, size: 100, color: Colors.red),
            SizedBox(height: 20),
            Text(
              "Are you sure you want to logout?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle logout logic here, e.g., clear user session or navigate to login screen
                Navigator.of(context).pop(); // Close the current screen
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
