import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/widgets/common/glass_button.dart';
import '../../ui/common/ui_helpers.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.loadUserData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Dopamind Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: model.logout,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${AppStrings.welcomeGreeting}${model.userName}', style: Theme.of(context).textTheme.headline5),
                    UiHelpers.verticalSpaceMedium,
                    Text('Mood: ${model.currentMood}'),
                    UiHelpers.verticalSpaceMedium,
                    Text('Focus Streak: ${model.focusStreak} days'),
                    UiHelpers.verticalSpaceMedium,
                    Text('${AppStrings.dailyQuote}\n"${model.dailyQuote}"'),
                    UiHelpers.verticalSpaceLarge,
                    GlassButton(
                      label: AppStrings.startSession,
                      onPressed: model.startFocusSession,
                    ),
                  ],
                ),
        ),
        bottomNavigationBar: model.buildBottomNavigationBar(),
      ),
    );
  }
}
