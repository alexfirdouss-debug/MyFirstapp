import 'package:stacked/stacked.dart';

class Goal {
  final String id;
  final String title;
  final double progress; // 0 to 1

  Goal({required this.id, required this.title, this.progress = 0});
}

class GoalsViewModel extends BaseViewModel {
  List<Goal> goals = [];

  Future<void> loadGoals() async {
    setBusy(true);
    // TODO: Load goals from backend or local storage
    goals = [
      Goal(id: 'goal1', title: 'Read 20 books', progress: 0.4),
      Goal(id: 'goal2', title: 'Run 100 km', progress: 0.7),
      Goal(id: 'goal3', title: 'Meditate daily', progress: 0.2),
    ];
    setBusy(false);
  }

  void addGoal() {
    final newGoal = Goal(id: DateTime.now().toString(), title: 'New Goal');
    goals.add(newGoal);
    notifyListeners();
  }
}
