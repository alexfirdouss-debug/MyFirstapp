import 'package:shared_preferences/shared_preferences.dart';

class PremiumService {
  static const _appLockKey = 'isAppLockEnabled';

  Future<bool> isAppLockEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_appLockKey) ?? false;
  }

  Future<void> setAppLock(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_appLockKey, enabled);
  }

  Future<void> exportTasksToCalendar(List<String> tasks) async {
    // TODO: Integrate Google Calendar / Apple Calendar export via platform channels or plugins
  }
}
