import 'package:cloud_firestore/cloud_firestore.dart';

class SearchFirebaseDatabase {
  // Future getData() async {
  //   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   QuerySnapshot snapshot = await firebaseFirestore.collection('songs').get();
  //   return snapshot.docs;
  // }

  // Future queryData(String queryString) async {
  //   return FirebaseFirestore.instance.collection('songs').where()
  // }
  List searchMethod(String searchText) {
    // DatabaseReference searchRef =
    //     FirebaseDatabase.instance.ref().child('songs');
    // searchRef.once().then((DataSnapshot snapShot) {
    //   dataList
    // });
    // print('the search text: ${searchText.substring(0, 1).toUpperCase()}');
    // FirebaseFirestore.instance
    //     .collection('songs')
    //     .where('SearchKey', isEqualTo: searchText.substring(0, 1).toUpperCase())
    //     .get()
    //     .then(
    //   (QuerySnapshot docs) {
    //     print('->>>>>> ${docs.docs.isEmpty}');
    //   },
    // );
    return [
      FirebaseFirestore.instance
          .collection('artist')
          .doc('KcHTxqHAaKmNpRjfUq6o')
          .collection('songs')
          .where('SearchKey',
              isEqualTo: searchText.substring(0, 1).toUpperCase())
          .get(),
      FirebaseFirestore.instance
          .collection('artist')
          .where('SearchKey',
              isEqualTo: searchText.substring(0, 1).toUpperCase())
          .get()
    ];
  }
}
