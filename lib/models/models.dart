import 'package:flutter/material.dart';

class EmailProvider extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}

class UnderstoodMessageProvider extends ChangeNotifier {
  String? _understood;
  String? _notUnderstood;

  String? get understood => _understood;
  String? get notUnderstood => _notUnderstood;

  void setUnderstood(String message) {
    _understood = message;
    notifyListeners();
  }

  void setNotUnderstood(String message) {
    _notUnderstood = message;
    notifyListeners();
  }
}
