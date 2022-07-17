import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/screens/dashboard/dashboard.dart';
import 'package:spotify_app/screens/login_screens/fill_form_screen.dart';
import 'package:spotify_app/services/navigation_service.dart';
import 'package:spotify_app/routes/routes.dart' as route;

class VerifyOtp {
  Future<void> verifyOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: Provider.of<MobileOtpLoginData>(
              NavService.navKey.currentContext!,
              listen: false)
          .verificationId,
      smsCode: Provider.of<MobileOtpLoginData>(
              NavService.navKey.currentContext!,
              listen: false)
          .verificationCode,
    );
    UserCredential _authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print('Logged in successfully');
      // Provider.of<MobileOtpLoginData>(NavService.navKey.currentContext!,
      //         listen: false)
      //     .updateLoggedIn(true);
      if (_authResult.additionalUserInfo!.isNewUser) {
        print('new user');
        Navigator.of(NavService.navKey.currentContext!).push(MaterialPageRoute(
            builder: (context) => const LoginFirstTimeFormScreen()));
      } else {
        print('old user');
        // Navigator.of(NavService.navKey.currentContext!).push(MaterialPageRoute(
        //     builder: (context) => const LoginFirstTimeFormScreen()));
        Navigator.of(NavService.navKey.currentContext!)
            .pushNamedAndRemoveUntil(route.dashBoardPage, (route) => false);
        // Navigator.pushNamed(
        //     NavService.navKey.currentContext!, route.dashBoardPage);
        // Navigator.of(NavService.navKey.currentContext!).push(
        //     MaterialPageRoute(builder: (context) => const DashBoardScreen()));
      }
    });
  }
}
