import 'package:stacked/stacked.dart';

class Track {
  final String title;
  final String artist;

  Track({required this.title, required this.artist});
}

class MusicViewModel extends BaseViewModel {
  List<Track> tracks = [];
  bool isPlaying = false;
  int currentTrackIndex = -1;

  Future<void> loadTracks() async {
    setBusy(true);
    // TODO: Load tracks from API, local storage or Spotify integration
    tracks = [
      Track(title: 'Focus Beats', artist: 'Dopamind Curated'),
      Track(title: 'Calm Piano', artist: 'Dopamind Curated'),
      Track(title: 'Lo-fi Chill', artist: 'Dopamind Curated'),
    ];
    setBusy(false);
  }

  void playMusic(int index) {
    currentTrackIndex = index;
    isPlaying = true;
    notifyListeners();
  }

  void pauseMusic() {
    isPlaying = false;
    notifyListeners();
  }
}
