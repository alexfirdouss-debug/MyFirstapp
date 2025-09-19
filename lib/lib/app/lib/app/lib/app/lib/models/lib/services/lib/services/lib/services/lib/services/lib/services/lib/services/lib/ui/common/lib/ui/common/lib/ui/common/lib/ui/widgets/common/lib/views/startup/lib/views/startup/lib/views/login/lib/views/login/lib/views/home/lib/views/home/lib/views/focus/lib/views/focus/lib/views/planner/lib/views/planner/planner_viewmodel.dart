import 'package:stacked/stacked.dart';

class Task {
  final String id;
  final String title;
  bool completed;

  Task({required this.id, required this.title, this.completed = false});
}

class PlannerViewModel extends BaseViewModel {
  List<Task> tasks = [];

  Future<void> loadTasks() async {
    setBusy(true);
    // TODO: Load tasks from backend or local storage
    tasks = [
      Task(id: '1', title: 'Morning routine'),
      Task(id: '2', title: 'Study session'),
      Task(id: '3', title: 'Workout'),
    ];
    setBusy(false);
  }

  void addTask() {
    final newTask = Task(id: DateTime.now().toString(), title: 'New Task');
    tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskCompletion(int index, bool completed) {
    tasks[index].completed = completed;
    notifyListeners();
  }

  void reorderTasks(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    notifyListeners();
  }
}
