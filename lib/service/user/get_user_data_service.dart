import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserData {
  Future<DocumentSnapshot> getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      if (userDoc.exists) {
        return userDoc;
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
