import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'personalization_viewmodel.dart';

class PersonalizationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalizationViewModel>.reactive(
      viewModelBuilder: () => PersonalizationViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Personalize Your Experience')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: model.formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: model.mainFocusGoal,
                  decoration: InputDecoration(labelText: 'Main Focus Goal'),
                  items: ['Study', 'Work', 'Fitness', 'Exams', 'Side Hustle', 'Other']
                      .map((goal) => DropdownMenuItem(value: goal, child: Text(goal)))
                      .toList(),
                  onChanged: model.setMainFocusGoal,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 16),
                Slider(
                  min: 0.5,
                  max: 10,
                  divisions: 19,
                  label: '${model.dailyFocusTarget}h',
                  value: model.dailyFocusTarget,
                  onChanged: model.setDailyFocusTarget,
                ),
                Text('Daily Focus Target: ${model.dailyFocusTarget.toStringAsFixed(1)} hours'),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: model.usualDistractionTime,
                  decoration: InputDecoration(labelText: 'Usual Distraction Time'),
                  items: ['Morning', 'Afternoon', 'Night']
                      .map((time) => DropdownMenuItem(value: time, child: Text(time)))
                      .toList(),
                  onChanged: model.setUsualDistractionTime,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: model.motivationType,
                  decoration: InputDecoration(labelText: 'What motivates you most?'),
                  items: ['Progress', 'Rewards', 'Growth', 'Competition']
                      .map((motivation) => DropdownMenuItem(value: motivation, child: Text(motivation)))
                      .toList(),
                  onChanged: model.setMotivationType,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: model.preferredFocusStyle,
                  decoration: InputDecoration(labelText: 'Preferred Focus Style'),
                  items: ['Calm', 'High-Energy', 'Challenge Mode']
                      .map((style) => DropdownMenuItem(value: style, child: Text(style)))
                      .toList(),
                  onChanged: model.setPreferredFocusStyle,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'One big win you want this month'),
                  onChanged: model.setBigWin,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: model.preferredFocusBackground,
                  decoration: InputDecoration(labelText: 'Preferred Focus Background'),
                  items: ['Silence', 'Lo-fi', 'Nature', 'Own Music']
                      .map((bg) => DropdownMenuItem(value: bg, child: Text(bg)))
                      .toList(),
                  onChanged: model.setPreferredFocusBackground,
                  validator: model.validateNotEmpty,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: model.submitPersonalization,
                  child: Text('Continue'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
