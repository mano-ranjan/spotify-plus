import 'package:flutter/material.dart';
import 'package:spotify_app/utils/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SpotifyPlusColors().greyShade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              BackButton(
                color: SpotifyPlusColors().pureWhite,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "What's New",
                style: TextStyle(
                  fontSize: 28,
                  color: SpotifyPlusColors().pureWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'The latest releases from artists, podcasts, and shows you follow',
                style: TextStyle(
                  fontSize: 12,
                  color: SpotifyPlusColors().pureGrey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'New',
                style: TextStyle(
                  fontSize: 18,
                  color: SpotifyPlusColors().pureWhite,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 317,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // color: Colors.amber,
                            height: 200,
                            // width: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        'assets/images/pngs/artist_logo.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '14 hr ago',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: SpotifyPlusColors().pureGrey,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Blinding Lights',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                SpotifyPlusColors().pureWhite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Weeknd',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: SpotifyPlusColors().pureGrey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Single',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: SpotifyPlusColors().pureGrey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.favorite_outline_sharp,
                                            color: SpotifyPlusColors()
                                                .greyShade500,
                                            size: 28,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
