import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

  final _navigationService = locator<NavigationService>();

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void completeOnboarding() {
    _navigationService.navigateTo(Routes.personalizationView);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
