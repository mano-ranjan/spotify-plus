import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spotify_app/firebase_options.dart';
import 'package:spotify_app/models/liked_songs_hive.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/providers/login_provider/user_data.dart';
import 'package:spotify_app/providers/songs_provider/songs_data.dart';
import 'package:spotify_app/providers/users_provider/new_user_data.dart';
import 'package:spotify_app/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/login_screens/login_screen.dart';
import 'package:spotify_app/routes/routes.dart' as route;
import 'package:spotify_app/services/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter;
  Hive.registerAdapter(LikedSongsAdapter());
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
        ChangeNotifierProvider(
          create: (_) => NewUserData(),
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return MaterialApp(
      navigatorKey: NavService.navKey,
      debugShowCheckedModeBanner: false,
      title: 'spotify app',
      onGenerateRoute: route.controller,
      home: uid != null ? const DashBoardScreen() : const LoginScreen(),
    );
  }
}
