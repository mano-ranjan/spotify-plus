import 'package:flutter/material.dart';

import 'package:spotify_app/utils/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearchBarTapped = false;
  var _instance;
  var data;

  // Future<void> getFirebaseSongUrl() async {
  //   _instance = FirebaseFirestore.instance;
  //   CollectionReference urls = _instance!.collection('artist');
  //   DocumentSnapshot snapshot = await urls.doc('KcHTxqHAaKmNpRjfUq6o').get();
  //   data = snapshot.data() as Map;
  //   print(data);
  // }

  @override
  void initState() {
    // getFirebaseSongUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SpotifyPlusColors().greyShade900,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: isSearchBarTapped
            ? SizedBox(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSearchBarTapped = false;
                    });
                  },
                  child: Center(
                    child: Text(
                      'go back',
                      style: TextStyle(
                        color: SpotifyPlusColors().pureWhite,
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                          color: SpotifyPlusColors().pureWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: SpotifyPlusColors().pureWhite,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSearchBarTapped = true;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: SpotifyPlusColors().pureWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Artists, songs, or podcasts',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your top genres',
                      style: TextStyle(
                        color: SpotifyPlusColors().pureWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('artist/KcHTxqHAaKmNpRjfUq6o/')
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return Text('Loading data please wait');
                  //     }
                  //     return Column(
                  //       children: [
                  //         Text(snapshot.data!.docs[0]['artistEmailId']),
                  //       ],
                  //     );
                  //   },
                  // )
                ],
              ),
      ),
    );
  }
}
