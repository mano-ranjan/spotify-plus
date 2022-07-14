import 'package:flutter/material.dart';
import 'package:spotify_app/screens/library_screens/widgets/buttons.dart';
import 'package:spotify_app/services/get_current_user.dart';

import 'package:spotify_app/utils/constants/colors.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GetCurrentUser().currentUser();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SpotifyPlusColors().greyShade900,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: SpotifyPlusColors().pureAmber,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: SpotifyPlusColors().pureBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Your Library',
                      style: TextStyle(
                        fontSize: 24,
                        color: SpotifyPlusColors().pureWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: SpotifyPlusColors().pureWhite,
                      size: 38,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add,
                      color: SpotifyPlusColors().pureWhite,
                      size: 38,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SpotifyPlusButton(
                  buttonText: 'Playlists',
                ),
                SizedBox(
                  width: 10,
                ),
                SpotifyPlusButton(
                  buttonText: 'Artists',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: SpotifyPlusColors().pureWhite,
                            ),
                            Icon(
                              Icons.arrow_upward,
                              color: SpotifyPlusColors().pureWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Most recent',
                      style: TextStyle(
                        color: SpotifyPlusColors().pureWhite,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded
                        ? Icons.zoom_in_map_sharp
                        : Icons.zoom_out_map_sharp,
                    color: SpotifyPlusColors().pureWhite,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 10),
              child: isExpanded
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 285,
                      child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.25,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 180,
                                    width: 190,
                                    color: SpotifyPlusColors().pureRed,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Playlist Name',
                                      style: TextStyle(
                                        color: SpotifyPlusColors().pureWhite,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Playlist . Spotify',
                                      style: TextStyle(
                                        color: SpotifyPlusColors().pureGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height - 285,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    color: SpotifyPlusColors().pureAmber,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Top Gaming Tracks',
                                        style: TextStyle(
                                          color: SpotifyPlusColors().pureWhite,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Top Gaming Tracks',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: SpotifyPlusColors().pureGrey,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
