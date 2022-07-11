import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify_app/components/slider.dart';
import 'package:spotify_app/screens/dashboard/widgets/dashboard_deault_screen.dart';
import 'package:spotify_app/screens/library_screens/library_screen.dart';
import 'package:spotify_app/screens/profile/profile_screen.dart';
import 'package:spotify_app/screens/search_screen/search_screen.dart';

import 'package:spotify_app/utils/constants/colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool homeSelected = true;
  bool profileSelected = false;
  bool searchSelected = false;
  bool librarySelected = false;
  bool mediaPlayerTappedOpen = false;
  bool mediaPlayerSongFav = false;
  ScrollController mediaPlayerScrollController = ScrollController();
  int speedFactor = 20;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  PlayerState playing = PlayerState.stopped;
  bool isLooped = false;
  bool isShuffled = false;
  bool isSongLoading = false;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        playing = event;
      });
    });

    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    // audioPlayer.o
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        playing = PlayerState.completed;
      });
      if (isLooped) {
        getAudio();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpotifyPlusColors().pureBlack,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0,
        backgroundColor: SpotifyPlusColors().pureBlack,
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              SpotifyPlusColors().greyShade700,
              SpotifyPlusColors().pureBlack,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.center,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            searchSelected
                ? const SearchScreen()
                : librarySelected
                    ? const LibraryScreen()
                    : profileSelected
                        ? const ProfileScreen()
                        : const DashBoardDefaultScreen(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              bottom: mediaPlayerTappedOpen ? 0 : 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      mediaPlayerTappedOpen = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: mediaPlayerTappedOpen
                        ? MediaQuery.of(context).size.height - 81
                        : 120,
                    width: mediaPlayerTappedOpen
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: mediaPlayerTappedOpen
                          ? SpotifyPlusColors().greyShade900
                          : SpotifyPlusColors().greyShade850,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: mediaPlayerTappedOpen
                        ? SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            mediaPlayerTappedOpen = false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          size: 28,
                                          color: SpotifyPlusColors().pureWhite,
                                        ),
                                      ),
                                      Text(
                                        'mano',
                                        style: TextStyle(
                                          color: SpotifyPlusColors().pureWhite,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.more_horiz_sharp,
                                        color: SpotifyPlusColors().pureWhite,
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  SizedBox(
                                    height: 400,
                                    width: 400,
                                    child: Image.asset(
                                      'assets/images/pngs/artist_logo.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Blinding Lights',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: SpotifyPlusColors()
                                                    .pureWhite,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'mano',
                                            style: TextStyle(
                                                color: SpotifyPlusColors()
                                                    .pureWhite),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            mediaPlayerSongFav =
                                                !mediaPlayerSongFav;
                                          });
                                        },
                                        child: Icon(
                                          mediaPlayerSongFav
                                              ? Icons.favorite
                                              : Icons.favorite_border_sharp,
                                          color: mediaPlayerSongFav
                                              ? SpotifyPlusColors().pureRed
                                              : SpotifyPlusColors()
                                                  .greyShade500,
                                          size: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SpotifySlider(
                                    audioPlayer: audioPlayer,
                                    duration: duration,
                                    mediaPlayerTappedOpen:
                                        mediaPlayerTappedOpen,
                                    position: position,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isShuffled = !isShuffled;
                                          });
                                        },
                                        child: Icon(
                                          Icons.shuffle,
                                          color: isShuffled
                                              ? SpotifyPlusColors().pureGreen
                                              : SpotifyPlusColors().pureWhite,
                                          size: 38,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          getAudio();
                                        },
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: isSongLoading
                                              ? const CircularProgressIndicator()
                                              : playing == PlayerState.playing
                                                  ? Icon(
                                                      Icons
                                                          .pause_circle_outline_sharp,
                                                      color: SpotifyPlusColors()
                                                          .pureWhite,
                                                      size: 58,
                                                    )
                                                  : playing ==
                                                              PlayerState
                                                                  .paused ||
                                                          playing ==
                                                              PlayerState
                                                                  .stopped ||
                                                          playing ==
                                                              PlayerState
                                                                  .completed
                                                      ? Icon(
                                                          Icons
                                                              .play_arrow_rounded,
                                                          color:
                                                              SpotifyPlusColors()
                                                                  .pureWhite,
                                                          size: 58,
                                                        )
                                                      : null,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isLooped = !isLooped;
                                          });
                                        },
                                        child: Icon(
                                          Icons.loop_sharp,
                                          color: isLooped
                                              ? SpotifyPlusColors().pureGreen
                                              : SpotifyPlusColors().pureWhite,
                                          size: 38,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                'assets/images/pngs/artist_logo.jpeg',
                                                fit: BoxFit.cover,
                                                // scale: 1,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 200,
                                                  child: Marquee(
                                                    text: 'Blinding Lights ',
                                                    numberOfRounds: 1,
                                                    style: TextStyle(
                                                      color: SpotifyPlusColors()
                                                          .pureWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'mano',
                                                style: TextStyle(
                                                  color: SpotifyPlusColors()
                                                      .pureWhite,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          getAudio();
                                        },
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: playing == PlayerState.playing
                                              ? Icon(
                                                  Icons
                                                      .pause_circle_outline_sharp,
                                                  color: SpotifyPlusColors()
                                                      .pureWhite,
                                                  size: 38,
                                                )
                                              : playing == PlayerState.paused ||
                                                      playing ==
                                                          PlayerState.stopped ||
                                                      playing ==
                                                          PlayerState.completed
                                                  ? Icon(
                                                      Icons.play_arrow_rounded,
                                                      color: SpotifyPlusColors()
                                                          .pureWhite,
                                                      size: 38,
                                                    )
                                                  : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SpotifySlider(
                                    audioPlayer: audioPlayer,
                                    duration: duration,
                                    mediaPlayerTappedOpen:
                                        mediaPlayerTappedOpen,
                                    position: position,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              bottom: mediaPlayerTappedOpen ? -80 : 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      color: SpotifyPlusColors().greyShade900.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              homeSelected = true;
                              searchSelected = false;
                              profileSelected = false;
                              librarySelected = false;
                            });
                          },
                          child: Icon(
                            Icons.home_outlined,
                            color: homeSelected
                                ? SpotifyPlusColors().pureGreen
                                : SpotifyPlusColors().pureGrey,
                            size: 32,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              homeSelected = false;
                              searchSelected = true;
                              profileSelected = false;
                              librarySelected = false;
                            });
                          },
                          child: Icon(
                            Icons.search_outlined,
                            color: searchSelected
                                ? SpotifyPlusColors().pureGreen
                                : SpotifyPlusColors().pureGrey,
                            size: 32,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              homeSelected = false;
                              searchSelected = false;
                              profileSelected = false;
                              librarySelected = true;
                            });
                          },
                          child: Icon(
                            Icons.library_add_check_outlined,
                            color: librarySelected
                                ? SpotifyPlusColors().pureGreen
                                : SpotifyPlusColors().pureGrey,
                            size: 32,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              homeSelected = false;
                              searchSelected = false;
                              profileSelected = true;
                              librarySelected = false;
                            });
                          },
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: profileSelected
                                ? SpotifyPlusColors().pureGreen
                                : SpotifyPlusColors().pureGrey,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> getAudio() async {
    String url = 'https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther60.wav';
    if (playing == PlayerState.playing) {
      setState(() {
        playing = PlayerState.paused;
      });
      await audioPlayer.pause();
    } else {
      setState(() {
        isSongLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isSongLoading = false;
        playing = PlayerState.playing;
      });
    }
  }
}
