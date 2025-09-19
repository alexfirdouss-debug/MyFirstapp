import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'focus_viewmodel.dart';
import '../../ui/common/app_strings.dart';
import '../../ui/widgets/common/glass_button.dart';
import '../../ui/common/ui_helpers.dart';

class FocusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FocusViewModel>.reactive(
      viewModelBuilder: () => FocusViewModel(),
      onModelReady: (model) => model.initializeSession(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Focus Session'),
          actions: [
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: model.canPause ? model.pauseSession : null,
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: model.canResume ? model.resumeSession : null,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: model.stopSession,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.sessionTitle, style: Theme.of(context).textTheme.headline4),
                    UiHelpers.verticalSpaceLarge,
                    Text(
                      model.timerText,
                      style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.greenAccent),
                    ),
                    UiHelpers.verticalSpaceLarge,
                    Text('Focus Mode: ${model.selectedFocusMode}'),
                    UiHelpers.verticalSpaceMedium,
                    DropdownButton<String>(
                      value: model.selectedFocusMode,
                      items: model.focusModes.map((mode) {
                        return DropdownMenuItem(value: mode, child: Text(mode));
                      }).toList(),
                      onChanged: model.isSessionActive ? null : model.changeFocusMode,
                    ),
                    UiHelpers.verticalSpaceMedium,
                    Text('Reward Emoji: ${model.selectedReward}'),
                    UiHelpers.verticalSpaceMedium,
                    if (!model.isSessionActive)
                      GlassButton(
                        label: 'Start Session',
                        onPressed: model.startSession,
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
