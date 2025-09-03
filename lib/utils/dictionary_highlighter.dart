import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../screens/astro_term_detail_screen.dart';

class DictionaryHighlighter {
  static TextSpan highlightText(
    BuildContext context,
    String text,
    Map<String, AstroTerm> dictionary,
    TextStyle? baseStyle, // 👈 nullable
  ) {
    final spans = <TextSpan>[];
    final lowerText = text.toLowerCase();
    int start = 0;

    // ✅ Use baseStyle from HTML, fallback to DefaultTextStyle
    final effectiveStyle = baseStyle ?? DefaultTextStyle.of(context).style;

    // Sort dictionary terms by length (multi-word terms first)
    final sortedEntries =
        dictionary.entries.toList()
          ..sort((a, b) => b.key.length.compareTo(a.key.length));

    while (start < text.length) {
      bool matched = false;

      for (final entry in sortedEntries) {
        final word = entry.key.toLowerCase();
        final index = lowerText.indexOf(word, start);

        if (index == start) {
          spans.add(
            TextSpan(
              text: text.substring(index, index + word.length),
              style: effectiveStyle.copyWith(
                decoration: TextDecoration.underline,
                color: Colors.blue, // highlight color
              ),
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
        spans.add(TextSpan(text: text[start], style: effectiveStyle));
        start++;
      }
    }

    return TextSpan(children: spans, style: effectiveStyle);
  }
}
