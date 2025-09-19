import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'music_viewmodel.dart';

class MusicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MusicViewModel>.reactive(
      viewModelBuilder: () => MusicViewModel(),
      onModelReady: (model) => model.loadTracks(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Music')),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.tracks.length,
                itemBuilder: (context, index) {
                  final track = model.tracks[index];
                  return ListTile(
                    title: Text(track.title),
                    subtitle: Text(track.artist),
                    trailing: IconButton(
                      icon: Icon(model.isPlaying && model.currentTrackIndex == index
                          ? Icons.pause
                          : Icons.play_arrow),
                      onPressed: () {
                        if (model.isPlaying && model.currentTrackIndex == index) {
                          model.pauseMusic();
                        } else {
                          model.playMusic(index);
                        }
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
