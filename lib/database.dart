import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Database {
  FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('employee').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            'id': doc.id,
            'firstname': doc.get('firstname'),
            'lastname': doc.get('lastname'),
          };

          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "database Null");
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("employee").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
