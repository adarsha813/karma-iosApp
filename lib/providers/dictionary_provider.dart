import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../services/astro_api_service.dart'; // make sure this points to your ApiService

class DictionaryProvider with ChangeNotifier {
  Map<String, AstroTerm> _dictionaryMap = {};
  bool _isLoading = false;
  String? _error;

  Map<String, AstroTerm> get dictionaryMap => _dictionaryMap;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDictionary() async {
    if (_dictionaryMap.isNotEmpty || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final terms = await ApiService.fetchTerms();
      // ✅ Use 'term' instead of 'word'
      _dictionaryMap = {for (var t in terms) t.term.toLowerCase(): t};
      _error = null;
    } catch (e) {
      _error = "Failed to load dictionary: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
