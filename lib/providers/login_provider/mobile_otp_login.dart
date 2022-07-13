import 'package:flutter/material.dart';

class MobileOtpLoginData with ChangeNotifier {
  String mobileNo = '';
  String verificationCode = '';
  String verificationId = '';
  String countryCode = '';

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
}
