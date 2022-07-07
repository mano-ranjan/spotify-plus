import 'package:flutter/material.dart';
import 'package:spotify_app/screens/library_screens/widgets/buttons.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
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
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: const Center(
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Your Library',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 38,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
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
                          children: const [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Most recent',
                      style: TextStyle(
                        color: Colors.white,
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
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            isExpanded
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
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Playlist Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Playlist . Spotify',
                                    style: TextStyle(
                                      color: Colors.grey,
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
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Top Gaming Tracks',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Top Gaming Tracks',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
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
                  )
          ],
        ),
      ),
    );
  }
}
