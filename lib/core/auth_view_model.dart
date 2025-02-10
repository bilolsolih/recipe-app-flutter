import 'package:flutter/material.dart';
import 'package:recipe_app/core/secure_storage.dart';

import 'auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository {
    loadToken();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepository _authRepository;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> submitForm() async {
    if (formKey.currentState!.validate()) {
      String login = loginController.text;
      String password = passwordController.text;

      _isAuthenticated = await _authRepository.login(login, password);
      notifyListeners();
    }
    return _isAuthenticated;
  }

  Future<void> loadToken() async {
    final token = await SecureStorage.getToken();
    if (token != null) {
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  Future<void> obtainToken(String login, String password) async {
    _isAuthenticated = await _authRepository.login(login, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    _isAuthenticated = false;
    notifyListeners();
  }
}
