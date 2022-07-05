import 'package:flutter/material.dart';
import 'package:spotify_app/screens/dashboard/widgets/playlist_cards_list.dart';

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
                    children: const [
                      Text(
                        'Hello Mano!',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's listen to some music",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.grey[900],
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Your favorite artist',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
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
                                  color: Colors.grey,
                                ),
                                // borderRadius: BorderRadius.circular(46),
                              ),
                              // clipper: MyClipper(),
                              // borderRadius: BorderRadius.circular(),
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
                          const Text(
                            'artist',
                            style: TextStyle(color: Colors.white),
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
