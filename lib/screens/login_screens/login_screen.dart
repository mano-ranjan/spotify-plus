import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/screens/dashboard/dashboard.dart';
import 'package:spotify_app/services/get_current_user.dart';
import 'package:spotify_app/services/get_otp.dart';
import 'package:spotify_app/services/verify_otp.dart';
import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/routes/routes.dart' as route;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  // void resetCodeSentValue() {
  //   Provider.of<MobileOtpLoginData>(context, listen: false)
  //       .updateCodeSent(false);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Spotify App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: SpotifyPlusColors().pureGreen,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: mobileNoController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Phone no with country code',
                      ),
                    ),
                  ),
                ),
                Provider.of<MobileOtpLoginData>(context).codeSent
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: SpotifyPlusColors().pureGreen,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                            controller: otpController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Sent Otp',
                            ),
                          ),
                        ),
                      )
                    : Container(),
                InkWell(
                  onTap: () {
                    if (!Provider.of<MobileOtpLoginData>(context, listen: false)
                        .codeSent) {
                      Provider.of<MobileOtpLoginData>(context, listen: false)
                          .updateMobileNo(mobileNoController.text);
                      GetMobileOtp().verifyPhone();
                    } else {
                      Provider.of<MobileOtpLoginData>(context, listen: false)
                          .updateVerCode(otpController.text);
                      VerifyOtp().verifyOtp();
                      Provider.of<MobileOtpLoginData>(context, listen: false)
                          .updateCodeSent(false);
                      // Provider.of<MobileOtpLoginData>(context, listen: false)
                      //         .loggedIn
                      //     ? Navigator.of(context).pushNamedAndRemoveUntil(
                      //         route.loginScreen, (route) => false)
                      //     : null;
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: SpotifyPlusColors().pureGreen,
                      borderRadius: BorderRadius.circular(18),
                      // border: Border.all(
                      //   color: SpotifyPlusColors().pureBlack,
                      // ),
                    ),
                    child: Center(
                      child: Text(
                        'Login / Sign Up',
                        style: TextStyle(
                          color: SpotifyPlusColors().pureWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
