import 'package:ai/models/user.dart';
import 'package:ai/services/db_future.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database.dart';

class Auth with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _currentUser = UserModel();
  String _uid;
  String _email;
  UserModel get getCurrentUser => _currentUser;
  String get getEmail => _currentUser.email;
  String get getUserName => _currentUser.userName;

  Future<String> onSignOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      _currentUser = UserModel();

      retVal = "success";
    } catch (e) {
      print(e);
    }

    notifyListeners();
    return retVal;
  }

  Future<String> signUpUser(
    String email,
    String password,
    String userName,
  ) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      _currentUser.uid = _authResult.user.uid;
      _currentUser.email = _authResult.user.email;
      _currentUser.userName = userName;

      _currentUser.accountCreated = Timestamp.now();

      String _returnString = await DBFuture().createUser(_currentUser);

      _currentUser = await Database().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        if (_returnString == "success") {
          retVal = 'success';
        }
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = 'error';

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await Database().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retVal = 'success';
      }
    } catch (e) {
      retVal = e.toString();
    }
    notifyListeners();
    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        UserModel _user = UserModel(
          uid: _authResult.user.uid,
          email: _authResult.user.email,
          userName: _authResult.user.displayName,
          accountCreated: Timestamp.now(),
        );
        String _returnString = await DBFuture().createUser(_user);
        if (_returnString == "success") {
          retVal = "success";
        }
      }
      retVal = "success";
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  Future<String> onStartUp() async {
    String retVal = 'error';
    try {
      User _firebaseUser = await _auth.currentUser;
      if (_firebaseUser != null) {
        _currentUser = await Database().getUserInfo(_firebaseUser.uid);
        if (_currentUser != null) {
          retVal = 'success';
        }
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }
}
