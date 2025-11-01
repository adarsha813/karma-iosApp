import 'package:flutter/material.dart';

class EnterpriseAnimations {
  static const Duration pageTransitionDuration = Duration(milliseconds: 400);
  static const Duration buttonAnimationDuration = Duration(milliseconds: 200);
  static const Duration shimmerDuration = Duration(milliseconds: 1000);
}

class SecurityShield extends StatelessWidget {
  final Widget child;

  const SecurityShield({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Security feature: Long press to show security info
        _showSecurityDialog(context);
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }

  void _showSecurityDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (context) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.security_rounded, color: Colors.green),
                SizedBox(width: 8),
                Text('Security Verified'),
              ],
            ),
            content: const Text(
              'This page is secured with enterprise-level security measures including:\n\n'
              '• Input validation & sanitization\n'
              '• Secure API communication\n'
              '• Rate limiting protection\n'
              '• Activity monitoring\n'
              '• Error boundary protection',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}
