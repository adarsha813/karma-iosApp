import 'package:flutter/foundation.dart';

class PendingNotificationNavigation extends ChangeNotifier {
  String? _payload;

  String? get payload => _payload;

  set payload(String? value) {
    if (_payload != value) {
      _payload = value;
      notifyListeners();
    }
  }
}

final pendingNavigation = PendingNotificationNavigation();
