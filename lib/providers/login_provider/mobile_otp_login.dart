import 'package:flutter/material.dart';

class MobileOtpLoginData with ChangeNotifier {
  String mobileNo = '';
  String verificationCode = '';
  String verificationId = '';
  String countryCode = '';
  bool codeSent = false;
  bool loggedIn = false;

  void updateMobileNo(String incomingMobileNo) {
    mobileNo = incomingMobileNo;
    notifyListeners();
  }

  void updateVerId(String incomingVerId) {
    verificationId = incomingVerId;
    notifyListeners();
  }

  void updateVerCode(String incomingVerCode) {
    verificationCode = incomingVerCode;
    notifyListeners();
  }

  void updateCountryCode(String incomingCountryCode) {
    countryCode = incomingCountryCode;
    notifyListeners();
  }

  void updateCodeSent(bool incomingCodeSent) {
    codeSent = incomingCodeSent;
    notifyListeners();
  }

  void updateLoggedIn(bool incomingLoggedIn) {
    loggedIn = incomingLoggedIn;
    notifyListeners();
  }
}
