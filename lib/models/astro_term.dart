// lib/models/astro_term.dart
class AstroTerm {
  final String id;
  final String term;
  final String meaning;
  final String? meaningNepali;

  AstroTerm({
    required this.id,
    required this.term,
    required this.meaning,
    this.meaningNepali,
  });

  factory AstroTerm.fromJson(Map<String, dynamic> json) {
    return AstroTerm(
      id: json['_id'],
      term: json['term'],
      meaning: json['meaning'],
      meaningNepali: json['meaningNepali'],
    );
  }
}
