import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../services/authentication_service.dart';
import '../../services/user_service.dart';
import '../../app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = AuthenticationService();
  final _userService = UserService();
  final _navigationService = locator<NavigationService>();

  String userName = '';
  String currentMood = 'Neutral';
  int focusStreak = 0;
  String dailyQuote = 'Focus on what matters today!';

  void loadUserData() async {
    setBusy(true);
    // Example: fetch user profile (mocked here)
    userName = 'User';
    currentMood = 'Happy';
    focusStreak = 5;
    dailyQuote = 'You are doing great — keep the momentum!';
    setBusy(false);
  }

  void startFocusSession() {
    _navigationService.navigateTo(Routes.focusView);
  }

  void logout() async {
    await _authService.signOut();
    _navigationService.replaceWith(Routes.loginView);
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on Home
            break;
          case 1:
            _navigationService.navigateTo(Routes.focusView);
            break;
          case 2:
            _navigationService.navigateTo(Routes.plannerView);
            break;
          case 3:
            _navigationService.navigateTo(Routes.musicView);
            break;
          case 4:
            _navigationService.navigateTo(Routes.goalsView);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.center_focus_strong), label: 'Focus'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Planner'),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
        BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
      ],
    );
  }
}
