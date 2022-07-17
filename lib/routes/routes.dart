import 'package:flutter/material.dart';
import 'package:spotify_app/screens/dashboard/dashboard.dart';
import 'package:spotify_app/screens/library_screens/library_screen.dart';
import 'package:spotify_app/screens/login_screens/login_screen.dart';
import 'package:spotify_app/screens/notifications/notification_screen.dart';
import 'package:spotify_app/screens/profile/profile_screen.dart';
import 'package:spotify_app/screens/search_screen/search_screen.dart';

const String dashBoardPage = 'dashBoardPage';
const String searchScreen = 'searchScreen';
const String libraryScreen = 'libraryScreen';
const String profileScreen = 'profileScreen';
const String notificationScreen = 'notificationScreen';
const String loginScreen = 'loginScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case dashBoardPage:
      return MaterialPageRoute(builder: (context) => const DashBoardScreen());
    case searchScreen:
      return MaterialPageRoute(builder: (context) => const SearchScreen());
    case libraryScreen:
      return MaterialPageRoute(builder: (context) => const LibraryScreen());
    case profileScreen:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case notificationScreen:
      return MaterialPageRoute(
          builder: (context) => const NotificationScreen());
    default:
      throw ('this route name does not exists');
  }
}
