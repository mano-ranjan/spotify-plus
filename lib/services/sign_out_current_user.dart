import 'package:firebase_auth/firebase_auth.dart';

class SignOutCurrentUser {
  Future<void> signOutCurrentUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
