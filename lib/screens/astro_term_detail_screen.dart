import 'package:flutter/material.dart';
import '../models/astro_term.dart';

class AstroTermDetailScreen extends StatelessWidget {
  final AstroTerm term;
  const AstroTermDetailScreen({Key? key, required this.term}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(term.term)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              term.term,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if ((term.meaning).isNotEmpty)
              Text(term.meaning, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            if ((term.meaningNepali ?? '').isNotEmpty)
              Text(
                "Nepali: ${term.meaningNepali ?? ''}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
