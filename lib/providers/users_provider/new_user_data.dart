import 'package:flutter/material.dart';

class NewUserData with ChangeNotifier {
  String firstName = '';
  String lastName = '';
  String emailId = '';

  void updateFirstName(incomingFirstname) {
    firstName = incomingFirstname;
    notifyListeners();
  }

  void updateLastName(incomingLastName) {
    lastName = incomingLastName;
    notifyListeners();
  }

  void updateEmailId(incomingEmailId) {
    emailId = incomingEmailId;
    notifyListeners();
  }
}
