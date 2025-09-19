import 'package:stacked/stacked.dart';

class Goal {
  final String id;
  final String title;
  final double progress; // 0 to 1

  Goal({required this.id, required this.title, required this.progress});
}

class GoalsViewModel extends BaseViewModel {
  List<Goal> _goals = [];
  List<Goal> get goals => _goals;

  void loadGoals() {
    setBusy(true);
    // Load goals from service or database, here sample goals
    _goals = [
      Goal(id: 'g1', title: 'Build Deep Focus Streak', progress: 0.6),
      Goal(id: 'g2', title: 'Complete Monthly Planner', progress: 0.3),
      Goal(id: 'g3', title: 'Listen to 10 Focus Music Playlists', progress: 0.8),
    ];
    setBusy(false);
  }

  void openGoalDetails(Goal goal) {
    // Navigate or show goal details with editing options
  }
}
