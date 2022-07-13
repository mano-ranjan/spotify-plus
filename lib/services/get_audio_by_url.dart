import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/songs_provider/songs_data.dart';
import 'package:spotify_app/services/navigation_service.dart';

class GetAudioByUrl {
  Future<void> getAudioByUrl() async {
    var provider = Provider.of<MediaPlayerData>(
        NavService.navKey.currentContext!,
        listen: false);
    // String url = 'https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther60.wav';
    if (provider.playingState == PlayerState.playing) {
      provider.updatePlayingState(PlayerState.paused);
      await provider.audioPlayer.pause();
    } else {
      provider.updateIsSongLoading(true);
      await provider.audioPlayer.play(
        UrlSource(
          Provider.of<SongsData>(NavService.navKey.currentContext!,
                  listen: false)
              .songUrl,
        ),
      );
      provider.updateIsSongLoading(false);
      provider.updatePlayingState(PlayerState.playing);
      // setState(() {
      //   isSongLoading = false;
      //   playingState = PlayerState.playing;
      // });
    }
  }
}
