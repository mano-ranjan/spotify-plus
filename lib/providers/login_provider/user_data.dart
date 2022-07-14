import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  User? user;
  String? uid;
  void updateUser(User incomingUser) {
    user = incomingUser;
    notifyListeners();
  }

  void updateUid(String incomingUid) {
    uid = incomingUid;
    notifyListeners();
  }
}
