import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearchBarTapped = false;
  var _instance;
  var data;

  Future<void> getFirebaseSongUrl() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference urls = _instance!.collection('artist');
    DocumentSnapshot snapshot = await urls.doc('KcHTxqHAaKmNpRjfUq6o').get();
    data = snapshot.data() as Map;
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    getFirebaseSongUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: isSearchBarTapped
            ? SizedBox(
                child: InkWell(
                  onTap: () {
                    print(isSearchBarTapped);
                    setState(() {
                      isSearchBarTapped = false;
                    });
                  },
                  child: const Center(
                    child: Text(
                      'go back',
                      style: TextStyle(
                        color: Colors.white,
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
                    children: const [
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
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
                        color: Colors.white,
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your top genres',
                      style: TextStyle(
                        color: Colors.white,
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
