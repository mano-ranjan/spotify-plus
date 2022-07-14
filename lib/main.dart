import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/firebase_options.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/providers/login_provider/user_data.dart';
import 'package:spotify_app/providers/songs_provider/songs_data.dart';
import 'package:spotify_app/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
// import 'package:spotify_app/screens/login_screens/login_screen.dart';
import 'package:spotify_app/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SongsData(),
        ),
        ChangeNotifierProvider(
          create: (_) => MobileOtpLoginData(),
        ),
        ChangeNotifierProvider(
          create: (_) => MediaPlayerData(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavService.navKey,
      debugShowCheckedModeBanner: false,
      title: 'spotify app',
      home: const DashBoardScreen(),
    );
  }
}
