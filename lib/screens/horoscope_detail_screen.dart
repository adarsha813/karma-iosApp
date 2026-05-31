import 'package:flutter/material.dart';

class HoroscopeDetailScreen extends StatelessWidget {
  final String horoscopeId;

  const HoroscopeDetailScreen({super.key, required this.horoscopeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horoscope Detail")),
      body: Center(child: Text("🪐 Horoscope ID: $horoscopeId")),
    );
  }
}
