import 'package:stacked/stacked.dart';
import '../../services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  final AuthenticationService _authService = AuthenticationService();

  bool get isBusy => busy('startup');

  Future<void> handleStartupLogic() async {
    setBusyForObject('startup', true);
    // Check user auth status and redirect accordingly
    // e.g., After Firebase check, navigate to Login or Home
    setBusyForObject('startup', false);
  }
}
