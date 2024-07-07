import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future appdetails(Map<String, dynamic> usermap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(usermap);
  }
}
