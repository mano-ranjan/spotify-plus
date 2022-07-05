import 'package:flutter/material.dart';

class MediaPLayerUiScreen extends StatefulWidget {
  const MediaPLayerUiScreen({Key? key}) : super(key: key);

  @override
  State<MediaPLayerUiScreen> createState() => _MediaPLayerUiScreenState();
}

class _MediaPLayerUiScreenState extends State<MediaPLayerUiScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                // mediaPlayerTappedOpen = false;
              });
            },
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 28,
              ),
            ),
          ),
          // Marquee(
          //   text:
          //       'Some sample text that takes some space.',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          //   scrollAxis: Axis.horizontal,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   blankSpace: 20.0,
          //   velocity: 100.0,
          //   pauseAfterRound: Duration(seconds: 1),
          //   startPadding: 10.0,
          //   accelerationDuration: Duration(seconds: 1),
          //   accelerationCurve: Curves.linear,
          //   decelerationDuration:
          //       Duration(milliseconds: 500),
          //   decelerationCurve: Curves.easeOut,
          // )
        ],
      ),
    );
  }
}
