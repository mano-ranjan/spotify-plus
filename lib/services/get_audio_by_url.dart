// class GetAudioByUrl {
//   Future<void> getAudio() async {
//     String url = 'https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther60.wav';
//     if (playing == PlayerState.playing) {
//       setState(() {
//         playing = PlayerState.paused;
//       });
//       await audioPlayer.pause();
//     } else {
//       await audioPlayer.play(UrlSource(url));
//       setState(() {
//         playing = PlayerState.playing;
//       });
//     }
//   }
// }
