import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/utils/validators/time_formatter.dart';

class SpotifySlider extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final AudioPlayer audioPlayer;
  final bool mediaPlayerTappedOpen;
  const SpotifySlider({
    Key? key,
    required this.duration,
    required this.position,
    required this.audioPlayer,
    required this.mediaPlayerTappedOpen,
  }) : super(key: key);

  @override
  State<SpotifySlider> createState() => _SpotifySliderState();
}

class _SpotifySliderState extends State<SpotifySlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0.0,
          max: widget.duration.inSeconds.toDouble(),
          value: widget.position.inSeconds.toDouble(),
          onChanged: (value) async {
            final position = Duration(seconds: value.toInt());
            await widget.audioPlayer.seek(position);
          },
        ),
        SizedBox(
          height: widget.mediaPlayerTappedOpen ? 10 : 0,
        ),
        widget.mediaPlayerTappedOpen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Formatters().formatTime(widget.position),
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                  Text(
                    Formatters().formatTime(widget.duration),
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

// Widget slider(
//   Duration duration,
//   Duration position,
//   AudioPlayer audioPlayer,
//   bool mediaPlayerTappedOpen,
// ) {
//   return Column(
//     children: [
//       Slider(
//         min: 0.0,
//         max: duration.inSeconds.toDouble(),
//         value: position.inSeconds.toDouble(),
//         onChanged: (value) async {
//           final position = Duration(seconds: value.toInt());
//           await audioPlayer.seek(position);
//         },
//       ),
//       SizedBox(
//         height: mediaPlayerTappedOpen ? 10 : 0,
//       ),
//       mediaPlayerTappedOpen
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   Formatters().formatTime(position),
//                   style: TextStyle(
//                     color: SpotifyPlusColors().pureWhite,
//                   ),
//                 ),
//                 Text(
//                   Formatters().formatTime(duration),
//                   style: TextStyle(
//                     color: SpotifyPlusColors().pureWhite,
//                   ),
//                 ),
//               ],
//             )
//           : Container(),
//     ],
//   );
// }
