import 'package:flutter/material.dart';
import 'package:spotify_app/utils/constants/colors.dart';

class PlayListCards extends StatefulWidget {
  final String playlistLabel;
  const PlayListCards({Key? key, required this.playlistLabel})
      : super(key: key);

  @override
  State<PlayListCards> createState() => _PlayListCardsState();
}

class _PlayListCardsState extends State<PlayListCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.playlistLabel,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: SpotifyPlusColors().pureWhite,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: SpotifyPlusColors().pureWhite,
              size: 18,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 150,
          // width: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/images/pngs/artist_logo.jpeg',
                          fit: BoxFit.cover,
                          // scale: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'artist',
                      style: TextStyle(color: SpotifyPlusColors().pureWhite),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
