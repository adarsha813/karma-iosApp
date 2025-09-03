import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../screens/astro_term_detail_screen.dart';

class DictionaryHighlighter {
  static TextSpan highlightText(
    BuildContext context,
    String text,
    Map<String, AstroTerm> dictionary,
  ) {
    final spans = <TextSpan>[];
    final lowerText = text.toLowerCase();
    int start = 0;

    // Sort dictionary terms by length descending for multi-word matches
    final sortedEntries =
        dictionary.entries.toList()
          ..sort((a, b) => b.key.length.compareTo(a.key.length));

    while (start < text.length) {
      bool matched = false;

      for (final entry in sortedEntries) {
        final word = entry.key.toLowerCase();
        final index = lowerText.indexOf(word, start);

        // Ensure match is exactly at current position
        if (index == start) {
          spans.add(
            TextSpan(
              text: text.substring(index, index + word.length),
              style: const TextStyle(decoration: TextDecoration.underline),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => AstroTermDetailScreen(term: entry.value),
                        ),
                      );
                    },
            ),
          );
          start = index + word.length;
          matched = true;
          break;
        }
      }

      if (!matched) {
        spans.add(TextSpan(text: text[start]));
        start++;
      }
    }

    return TextSpan(
      children: spans,
      style: const TextStyle(color: Colors.black),
    );
  }
}
