import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void logIn() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
