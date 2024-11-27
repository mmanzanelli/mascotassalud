import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await AuthService.login(email, password);

    if (success) {
      _isAuthenticated = true;
    }

    _isLoading = false;
    notifyListeners();

    return success;
  }

  Future<bool> register(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await AuthService.register(email, password);

    if (success) {
      _isAuthenticated = true;
    }

    _isLoading = false;
    notifyListeners();

    return success;
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
