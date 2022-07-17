import 'package:flutter/material.dart';
import 'package:spotify_app/screens/dashboard/widgets/dashboard_default_screen.dart';
import 'package:spotify_app/screens/library_screens/library_screen.dart';
import 'package:spotify_app/screens/profile/profile_screen.dart';
import 'package:spotify_app/screens/search_screen/search_screen.dart';
import 'package:spotify_app/utils/constants/colors.dart';

class DummyTest extends StatefulWidget {
  const DummyTest({Key? key}) : super(key: key);

  @override
  State<DummyTest> createState() => _DummyTestState();
}

class _DummyTestState extends State<DummyTest> {
  int selectedIndex = 0;
  final screenList = [
    const DashBoardDefaultScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add_check_outlined,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'home',
          ),
        ],
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
          child: screenList[selectedIndex],
        ),
      ),
    );
  }
}
