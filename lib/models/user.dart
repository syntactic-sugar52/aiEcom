import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  String uid;
  String email;
  String userName;
  Timestamp accountCreated;

  UserModel({
    this.uid,
    this.userName,
    this.email,
    this.accountCreated,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
    Map<String, dynamic> data = doc.data();
    uid = doc.id;
    email = data['email'];
    accountCreated = data['accountCreated'];
    userName = data['fullName'];
  }
}
