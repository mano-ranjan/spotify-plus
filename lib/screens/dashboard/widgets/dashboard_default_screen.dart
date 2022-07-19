import 'package:flutter/material.dart';
import 'package:spotify_app/screens/dashboard/widgets/playlist_cards_list.dart';
import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/routes/routes.dart' as route;
import 'package:spotify_app/utils/constants/strings.dart';

class DashBoardDefaultScreen extends StatefulWidget {
  const DashBoardDefaultScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardDefaultScreen> createState() => _DashBoardDefaultScreenState();
}

class _DashBoardDefaultScreenState extends State<DashBoardDefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SpotifyPlusStrings().defaultHeaderName,
                        style: TextStyle(
                          fontSize: 26,
                          color: SpotifyPlusColors().pureWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        SpotifyPlusStrings().dashboardSubHeaderText,
                        style: TextStyle(
                          fontSize: 14,
                          color: SpotifyPlusColors().pureWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, route.notificationScreen);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: SpotifyPlusColors().greyShade900,
                      ),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: SpotifyPlusColors().pureWhite,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    SpotifyPlusStrings().dashboardFavArtistString,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                // width: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: SpotifyPlusColors().pureGrey,
                                ),
                                // borderRadius: BorderRadius.circular(46),
                              ),
                              // clipper: MyClipper(),
                              // borderRadius: BorderRadius.circular(),
                              child: SpotifyPlusImage().defaultArtistImage,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            SpotifyPlusStrings().defaultArtistName,
                            style: TextStyle(
                              color: SpotifyPlusColors().pureWhite,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const PlayListCards(
                playlistLabel: 'Recently Played',
              ),
              const SizedBox(
                height: 20,
              ),
              const PlayListCards(
                playlistLabel: 'Jump back in',
              ),
              const SizedBox(
                height: 20,
              ),
              const PlayListCards(
                playlistLabel: 'Recommended for today',
              ),
              const SizedBox(
                height: 20,
              ),
              const PlayListCards(
                playlistLabel: 'Uniquely yours',
              ),
              const SizedBox(
                height: 20,
              ),
              const PlayListCards(
                playlistLabel: 'Sad songs',
              ),
              const SizedBox(
                height: 20,
              ),
              const PlayListCards(
                playlistLabel: "India's best",
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
