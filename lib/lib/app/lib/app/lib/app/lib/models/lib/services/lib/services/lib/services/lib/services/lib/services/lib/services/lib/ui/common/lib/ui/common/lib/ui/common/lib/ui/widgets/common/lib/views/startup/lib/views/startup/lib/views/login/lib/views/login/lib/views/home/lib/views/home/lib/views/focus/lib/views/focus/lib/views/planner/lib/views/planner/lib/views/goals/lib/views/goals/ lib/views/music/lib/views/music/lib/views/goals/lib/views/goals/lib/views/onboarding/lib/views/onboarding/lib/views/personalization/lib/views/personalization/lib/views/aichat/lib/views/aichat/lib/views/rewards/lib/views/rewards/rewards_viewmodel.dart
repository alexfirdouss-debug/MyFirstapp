import 'package:stacked/stacked.dart';

class Reward {
  final String id;
  final String title;
  final String emoji;
  final DateTime earnedDate;
  final bool isUnlocked;

  Reward({
    required this.id,
    required this.title,
    required this.emoji,
    required this.earnedDate,
    this.isUnlocked = false,
  });
}

class RewardsViewModel extends BaseViewModel {
  List<Reward> rewards = [];

  Future<void> loadRewards() async {
    setBusy(true);
    // TODO: Load rewards from backend or local storage
    rewards = [
      Reward(id: '1', title: 'First Focus Session', emoji: '🔥', earnedDate: DateTime.now().subtract(Duration(days: 2)), isUnlocked: true),
      Reward(id: '2', title: '7 Day Streak', emoji: '🏅', earnedDate: DateTime.now().subtract(Duration(days: 1)), isUnlocked: true),
      Reward(id: '3', title: 'Deep Work Master', emoji: '💎', earnedDate: DateTime.now(), isUnlocked: false),
    ];
    setBusy(false);
  }
}
