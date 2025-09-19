import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class PersonalizationViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  String? mainFocusGoal;
  double dailyFocusTarget = 1.0;
  String? usualDistractionTime;
  String? motivationType;
  String? preferredFocusStyle;
  String? bigWin;
  String? preferredFocusBackground;

  final _navigationService = locator<NavigationService>();

  String? validateNotEmpty(value) => (value == null || value.toString().isEmpty) ? 'Required' : null;

  void setMainFocusGoal(String? value) {
    mainFocusGoal = value;
    notifyListeners();
  }

  void setDailyFocusTarget(double value) {
    dailyFocusTarget = value;
    notifyListeners();
  }

  void setUsualDistractionTime(String? value) {
    usualDistractionTime = value;
    notifyListeners();
  }

  void setMotivationType(String? value) {
    motivationType = value;
    notifyListeners();
  }

  void setPreferredFocusStyle(String? value) {
    preferredFocusStyle = value;
    notifyListeners();
  }

  void setBigWin(String? value) {
    bigWin = value;
    notifyListeners();
  }

  void setPreferredFocusBackground(String? value) {
    preferredFocusBackground = value;
    notifyListeners();
  }

  void submitPersonalization() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      // TODO: Save personalization data to backend or local storage

      // Navigate to home dashboard
      _navigationService.replaceWith(Routes.homeView);
    }
  }
}
