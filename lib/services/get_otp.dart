import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/services/navigation_service.dart';

class GetMobileOtp {
  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      // phoneNumber: '${Provider.of<MobileOtpLoginData>(
      //   NavService.navKey.currentContext!,
      //   listen: false,
      // ).countryCode}${Provider.of<MobileOtpLoginData>(
      //   NavService.navKey.currentContext!,
      //   listen: false,
      // ).mobileNo}',
      phoneNumber: '+918910101599',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print('verificationCompleted');
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print(credential);
            print('user logged in');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print('the error is : ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        print('code sent , $verificationId');

        Provider.of<MobileOtpLoginData>(
          NavService.navKey.currentContext!,
          listen: false,
        ).updateVerId(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Provider.of<MobileOtpLoginData>(
          NavService.navKey.currentContext!,
          listen: false,
        ).updateVerCode(verificationId);
      },
      timeout: const Duration(seconds: 60),
    );
  }
}
