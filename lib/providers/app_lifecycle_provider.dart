import 'package:flutter/material.dart';

class AppLifecycleProvider with ChangeNotifier {
  AppLifecycleState _state = AppLifecycleState.resumed;
  DateTime? _lastBackgroundTime;
  DateTime? _lastForegroundTime;

  AppLifecycleState get state => _state;
  DateTime? get lastBackgroundTime => _lastBackgroundTime;
  DateTime? get lastForegroundTime => _lastForegroundTime;

  void updateState(AppLifecycleState newState) {
    _state = newState;

    if (newState == AppLifecycleState.paused ||
        newState == AppLifecycleState.inactive) {
      _lastBackgroundTime = DateTime.now();
    } else if (newState == AppLifecycleState.resumed) {
      _lastForegroundTime = DateTime.now();
    }

    notifyListeners();
  }

  Duration? get timeInBackground {
    if (_lastBackgroundTime != null && _lastForegroundTime != null) {
      return _lastForegroundTime!.difference(_lastBackgroundTime!);
    }
    return null;
  }

  bool get isInBackground {
    return _state == AppLifecycleState.paused ||
        _state == AppLifecycleState.inactive;
  }

  bool get isInForeground {
    return _state == AppLifecycleState.resumed;
  }
}
