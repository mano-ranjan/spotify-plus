import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/services/navigation_service.dart';

class VerifyOtp {
  void verifyOtp() {
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
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print('Logged in successfully');
    });
  }
}
