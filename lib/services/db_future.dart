import 'package:ai/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DBFuture extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> createUser(UserModel user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'userName': user.userName.trim(),
        'email': user.email.trim(),
        'accountCreated': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      retVal = e.toString();
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  Future<UserModel> getUser(String uid) async {
    UserModel retVal;

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal = UserModel.fromDocumentSnapshot(doc: _docSnapshot);
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }
}
