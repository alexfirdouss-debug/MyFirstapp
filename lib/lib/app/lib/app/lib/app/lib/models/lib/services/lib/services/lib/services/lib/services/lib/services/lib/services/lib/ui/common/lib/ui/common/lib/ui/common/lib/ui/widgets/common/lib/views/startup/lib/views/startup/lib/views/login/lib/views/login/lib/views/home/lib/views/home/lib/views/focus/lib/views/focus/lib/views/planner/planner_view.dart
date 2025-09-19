import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'planner_viewmodel.dart';
import '../../ui/widgets/common/glass_button.dart';
import '../../ui/common/ui_helpers.dart';

class PlannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlannerViewModel>.reactive(
      viewModelBuilder: () => PlannerViewModel(),
      onModelReady: (model) => model.loadTasks(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Planner')),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : ReorderableListView.builder(
                itemCount: model.tasks.length,
                onReorder: model.reorderTasks,
                itemBuilder: (context, index) {
                  final task = model.tasks[index];
                  return ListTile(
                    key: ValueKey(task.id),
                    title: Text(task.title),
                    leading: Checkbox(
                      value: task.completed,
                      onChanged: (checked) => model.toggleTaskCompletion(index, checked ?? false),
                    ),
                    trailing: Icon(Icons.drag_handle),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.addTask,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
