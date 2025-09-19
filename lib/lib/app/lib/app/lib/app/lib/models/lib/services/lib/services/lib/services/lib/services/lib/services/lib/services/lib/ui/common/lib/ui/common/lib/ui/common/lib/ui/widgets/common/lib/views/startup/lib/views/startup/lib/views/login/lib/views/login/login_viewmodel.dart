import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authService = AuthenticationService();
  final _navigationService = locator<NavigationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loginWithEmail() async {
    setBusy(true);
    _errorMessage = '';
    notifyListeners();

    try {
      final user = await _authService.signInWithEmail(emailController.text, passwordController.text);
      if (user != null) {
        _navigationService.replaceWith(Routes.homeView);
      }
    } catch (e) {
      _errorMessage = 'Login Failed. Please check your credentials.';
    }
    setBusy(false);
  }

  Future<void> loginWithGoogle() async {
    setBusy(true);
    _errorMessage = '';
    notifyListeners();

    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        _navigationService.replaceWith(Routes.homeView);
      }
    } catch (e) {
      _errorMessage = 'Google sign-in failed.';
    }
    setBusy(false);
  }

  Future<void> loginWithApple() async {
    setBusy(true);
    _errorMessage = '';
    notifyListeners();

    try {
      final user = await _authService.signInWithApple();
      if (user != null) {
        _navigationService.replaceWith(Routes.homeView);
      }
    } catch (e) {
      _errorMessage = 'Apple sign-in failed.';
    }
    setBusy(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
