import 'package:ai/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection("users");

class Database {
  static Database _database;
  static Database get instance {
    if (_database == null) {
      _database = Database();
    }
    return _database;
  }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel retVal = UserModel();
    try {
      DocumentSnapshot _doc = await usersRef.doc(uid).get();
      Map<String, dynamic> data = _doc.data();
      retVal.uid = uid;

      retVal.userName = data["user_name"];
      retVal.email = data["email"];
      retVal.accountCreated = data["account_created"];
      retVal.accountCreated = data["accountCreated"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
