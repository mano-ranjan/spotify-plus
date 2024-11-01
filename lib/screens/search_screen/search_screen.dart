import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/services/search_firebase_data.dart';

import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/utils/constants/strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearchBarTapped = false;
  List queryResultSet = [];
  List tempSearchStore = [];
  bool artistFilterState = true;
  bool songsFilterState = false;
  QuerySnapshot? snapshotData;
  TextEditingController searchTextController = TextEditingController();

  startSearch(String value, bool artistFilterState, bool songsFilterState) {
    print('the searched text is : $value');
    if (value.isEmpty) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (true) {
      SearchFirebaseDatabase()
          .searchMethod(value)[songsFilterState ? 0 : 1]
          .then((QuerySnapshot docs) {
        print('start searching');
        print(docs.docs.length);
        if (docs.docs.isEmpty) {
          setState(() {
            queryResultSet = [];
          });
        } else {
          for (int i = 0; i < docs.docs.length; i++) {
            setState(() {
              queryResultSet.add(docs.docs[i]
                  .get(songsFilterState ? "songName" : "artistName"));
            });
            print(queryResultSet);
          }
        }
      });
    } else {
      tempSearchStore = [];
      for (var element in queryResultSet) {
        if (element.startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      }
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   SearchFirebaseDatabase().getData();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SpotifyPlusColors().greyShade900,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: isSearchBarTapped
            ? Column(
                children: [
                  TextField(
                    controller: searchTextController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    onChanged: (val) {
                      if (artistFilterState || songsFilterState) {
                        startSearch(val, artistFilterState, songsFilterState);
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back_ios_new_sharp),
                        onPressed: () {
                          setState(() {
                            isSearchBarTapped = false;
                          });
                        },
                      ),
                    ),
                  ),
                  // Text(
                  //   SpotifyPlusStrings().searchGoBackText,
                  //   style: TextStyle(
                  //     color: SpotifyPlusColors().pureWhite,
                  //   ),
                  // ),
                  // GridView.count(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 4.0,
                  //   mainAxisSpacing: 4.0,
                  //   primary: false,
                  //   shrinkWrap: true,
                  //   children: tempSearchStore.map((element) {
                  //     return buildResultCard(element);
                  //   }).toList(),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // artistFilterState = !artistFilterState;
                            artistFilterState = true;
                            songsFilterState = false;
                          });
                          startSearch(searchTextController.text, true, false);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: artistFilterState
                                ? SpotifyPlusColors().pureGreen
                                : Colors.transparent,
                            border: Border.all(
                              color: SpotifyPlusColors().pureGrey,
                            ),
                            borderRadius: BorderRadius.circular(
                              36,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Center(
                              child: Text(
                                'artist',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: SpotifyPlusColors().pureWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            // songsFilterState = !songsFilterState;
                            songsFilterState = true;
                            artistFilterState = false;
                          });
                          startSearch(searchTextController.text, false, true);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: songsFilterState
                                ? SpotifyPlusColors().pureGreen
                                : Colors.transparent,
                            border: Border.all(
                              color: SpotifyPlusColors().pureGrey,
                            ),
                            borderRadius: BorderRadius.circular(
                              36,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Center(
                              child: Text(
                                'songs',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: SpotifyPlusColors().pureWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  queryResultSet.isEmpty
                      ? SizedBox(
                          height: 400,
                          child: buildResultCard(
                              'no serached items found\nor nothing searched'),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height - 259,
                          child: ListView.builder(
                              itemCount: queryResultSet.length,
                              itemBuilder: (BuildContext context, index) {
                                return Column(
                                  children: [
                                    // Text(
                                    //   queryResultSet[index],
                                    //   style: const TextStyle(
                                    //     fontSize: 24,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),

                                    SizedBox(
                                      height: 150,
                                      child: buildResultCard(
                                        queryResultSet[index],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }),
                        )
                ],
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
                        SpotifyPlusStrings().searchSearchText,
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
                          children: [
                            const Icon(
                              Icons.search,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              SpotifyPlusStrings().searchBarHintText,
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
                      SpotifyPlusStrings().searchTopGenreText,
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
                ],
              ),
      ),
    );
  }

  Widget buildResultCard(data) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2.0,
      child: Center(
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
