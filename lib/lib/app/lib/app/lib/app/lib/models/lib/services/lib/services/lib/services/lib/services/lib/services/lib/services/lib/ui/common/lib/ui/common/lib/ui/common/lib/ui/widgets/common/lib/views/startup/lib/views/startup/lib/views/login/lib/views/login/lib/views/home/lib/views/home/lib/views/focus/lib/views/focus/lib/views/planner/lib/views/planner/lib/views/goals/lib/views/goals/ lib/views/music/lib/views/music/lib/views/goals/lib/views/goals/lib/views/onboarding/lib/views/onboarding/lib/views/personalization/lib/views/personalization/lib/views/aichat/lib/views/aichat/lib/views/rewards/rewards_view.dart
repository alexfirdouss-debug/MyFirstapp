import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'rewards_viewmodel.dart';

class RewardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RewardsViewModel>.reactive(
      viewModelBuilder: () => RewardsViewModel(),
      onModelReady: (model) => model.loadRewards(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Rewards & Badges')),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.rewards.length,
                itemBuilder: (context, index) {
                  final reward = model.rewards[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(reward.emoji)),
                    title: Text(reward.title),
                    subtitle: Text('Earned on: ${reward.earnedDate.toLocal().toShortDateString()}'),
                    trailing: reward.isUnlocked
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.lock),
                  );
                },
              ),
      ),
    );
  }
}
