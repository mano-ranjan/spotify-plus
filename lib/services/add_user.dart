import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/users_provider/new_user_data.dart';
import 'package:spotify_app/services/navigation_service.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser() {
  return users
      .add({
        'FirstName': Provider.of<NewUserData>(NavService.navKey.currentContext!,
                listen: false)
            .firstName,
        'LastName': Provider.of<NewUserData>(NavService.navKey.currentContext!,
                listen: false)
            .lastName,
        'emailId': Provider.of<NewUserData>(NavService.navKey.currentContext!,
                listen: false)
            .emailId
      })
      .then((value) => print("user added"))
      .catchError((error) => print(error));
}
