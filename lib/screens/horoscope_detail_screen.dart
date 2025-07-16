import 'package:flutter/material.dart';

class HoroscopeDetailScreen extends StatelessWidget {
  final String horoscopeId;

  const HoroscopeDetailScreen({Key? key, required this.horoscopeId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horoscope Detail")),
      body: Center(child: Text("🪐 Horoscope ID: $horoscopeId")),
    );
  }
}
