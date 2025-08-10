// Remove FlutterAppBadger import
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoroscopeProvider with ChangeNotifier {
  static const String _prefsKey = 'unread_horoscope_count';

  int _unreadCount = 0;
  bool _dirty = false;

  int get unreadCount => _unreadCount;

  HoroscopeProvider() {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _unreadCount = prefs.getInt(_prefsKey) ?? 0;
    notifyListeners(); // Remove _updateBadge call
  }

  Future<void> increment() async {
    if (_unreadCount < 0) _unreadCount = 0;
    _unreadCount++;
    notifyListeners();
    _dirty = true;
    await _persistCount(); // Remove _updateBadge call
  }

  Future<void> clear() async {
    _unreadCount = 0;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, 0); // Remove _updateBadge call
  }

  Future<void> _persistCount() async {
    if (_dirty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_prefsKey, _unreadCount);
      _dirty = false;
    }
  }

  Future<void> reload() async {
    final prefs = await SharedPreferences.getInstance();
    _unreadCount = prefs.getInt(_prefsKey) ?? 0;
    notifyListeners();
  }

  // REMOVE _updateBadge METHOD ENTIRELY
}
