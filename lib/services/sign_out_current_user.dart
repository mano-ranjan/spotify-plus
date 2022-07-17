import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';

import 'navigation_service.dart';

class SignOutCurrentUser {
  Future<void> signOutCurrentUser() async {
    await FirebaseAuth.instance.signOut();
    print('user logged out');
    Provider.of<MobileOtpLoginData>(NavService.navKey.currentContext!,
            listen: false)
        .updateLoggedIn(false);
  }
}
