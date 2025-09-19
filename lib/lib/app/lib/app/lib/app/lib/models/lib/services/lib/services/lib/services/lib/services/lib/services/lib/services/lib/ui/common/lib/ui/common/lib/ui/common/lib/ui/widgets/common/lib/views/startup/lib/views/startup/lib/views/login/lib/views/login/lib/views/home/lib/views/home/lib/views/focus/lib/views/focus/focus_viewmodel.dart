import 'dart:async';
import 'package:stacked/stacked.dart';

class FocusViewModel extends BaseViewModel {
  Timer? _timer;
  Duration _sessionDuration = Duration(minutes: 25);
  Duration _currentDuration = Duration.zero;

  bool _isSessionActive = false;
  bool get isSessionActive => _isSessionActive;

  bool _canPause = false;
  bool get canPause => _canPause;

  bool _canResume = false;
  bool get canResume => _canResume;

  String _sessionTitle = 'Pomodoro Focus';
  String get sessionTitle => _sessionTitle;

  String _timerText = '25:00';
  String get timerText => _timerText;

  List<String> focusModes = ['Deep Work', 'Pomodoro (25/5)', 'Flow State', 'Quick Sprint'];
  String selectedFocusMode = 'Pomodoro (25/5)';

  String selectedReward = '🔥';

  void initializeSession() {
    resetTimer();
  }

  void startSession() {
    if (_isSessionActive) return;
    _isSessionActive = true;
    _canPause = true;
    _canResume = false;
    _setSessionDurationBasedOnMode();

    _currentDuration = Duration.zero;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentDuration += Duration(seconds: 1);
      int remainingSeconds = _sessionDuration.inSeconds - _currentDuration.inSeconds;
      if (remainingSeconds <= 0) {
        stopSession();
      } else {
        _timerText = _formatDuration(Duration(seconds: remainingSeconds));
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void pauseSession() {
    if (!_isSessionActive || !_canPause) return;
    _timer?.cancel();
    _canPause = false;
    _canResume = true;
    notifyListeners();
  }

  void resumeSession() {
    if (!_isSessionActive || !_canResume) return;
    _canPause = true;
    _canResume = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentDuration += Duration(seconds: 1);
      int remainingSeconds = _sessionDuration.inSeconds - _currentDuration.inSeconds;
      if (remainingSeconds <= 0) {
        stopSession();
      } else {
        _timerText = _formatDuration(Duration(seconds: remainingSeconds));
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void stopSession() {
    _timer?.cancel();
    _isSessionActive = false;
    _canPause = false;
    _canResume = false;
    _timerText = _formatDuration(_sessionDuration);
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _isSessionActive = false;
    _canPause = false;
    _canResume = false;
    _timerText = _formatDuration(_sessionDuration);
    notifyListeners();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void changeFocusMode(String? mode) {
    if (mode == null) return;
    selectedFocusMode = mode;
    _setSessionDurationBasedOnMode();
    resetTimer();
  }

  void _setSessionDurationBasedOnMode() {
    switch (selectedFocusMode) {
      case 'Deep Work':
        _sessionDuration = Duration(minutes: 50);
        _sessionTitle = 'Deep Work Session';
        break;
      case 'Pomodoro (25/5)':
        _sessionDuration = Duration(minutes: 25);
        _sessionTitle = 'Pomodoro Focus';
        break;
      case 'Flow State':
        _sessionDuration = Duration(minutes: 90);
        _sessionTitle = 'Flow State Session';
        break;
      case 'Quick Sprint':
        _sessionDuration = Duration(minutes: 15);
        _sessionTitle = 'Quick Sprint Session';
        break;
      default:
        _sessionDuration = Duration(minutes: 25);
        _sessionTitle = 'Focus Session';
    }
  }

  void selectRewardEmoji(String emoji) {
    selectedReward = emoji;
    notifyListeners();
  }
}
