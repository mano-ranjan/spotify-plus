import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/user_data.dart';
import 'package:spotify_app/services/navigation_service.dart';

class GetCurrentUser {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void currentUser() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    if (uid != null) {
      print('the current user UID is : $uid');
      Provider.of<UserData>(NavService.navKey.currentContext!, listen: false)
          .updateUid(uid);
    } else {
      print('no user logged in');
    }
  }
}
