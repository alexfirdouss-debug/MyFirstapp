import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'goals_viewmodel.dart';
import '../../ui/common/ui_helpers.dart';

class GoalsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GoalsViewModel>.reactive(
      viewModelBuilder: () => GoalsViewModel(),
      onModelReady: (model) => model.loadGoals(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Goals'),
        ),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.goals.length,
                itemBuilder: (context, index) {
                  final goal = model.goals[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(goal.title),
                      subtitle: LinearProgressIndicator(
                        value: goal.progress,
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                      ),
                      trailing: Text('${(goal.progress * 100).toStringAsFixed(0)}%'),
                      onTap: () => model.openGoalDetails(goal),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
