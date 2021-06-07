import 'package:ai/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ai/screens/home/home.dart';
import 'package:ai/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'account_screen.dart';
import 'package:page_transition/page_transition.dart';

enum LoginType { email, google }

class LandingService with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  googleButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ElevatedButton(
            child: Icon(FontAwesomeIcons.google, color: Colors.white),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.purple,
              onSurface: Colors.grey,
              side: BorderSide(color: Colors.black, width: 1),
              elevation: 20,
              minimumSize: Size(350, 40),
            ),
            onPressed: () {
              print('signed in with google.');
              _loginUser(type: LoginType.google, context: context);
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: HomeScreen(),
                      type: PageTransitionType.leftToRight));
            }));
  }

  Widget passwordlessSignIn(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children:
                  snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                Map<String, dynamic> data = documentSnapshot.data();
                return ListTile(
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.trashAlt,
                        color: Colors.redAccent,
                      )),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data['userImageUrl']),
                  ),
                  title: Text(
                    data['username'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data['user_email'],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  textOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "OR",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  login(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.grey,
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter email",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: TextField(
            cursorColor: Colors.grey,
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Enter password",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  void _loginUser({
    @required LoginType type,
    String email,
    String password,
    BuildContext context,
  }) async {
    try {
      String _returnString;

      switch (type) {
        case LoginType.email:
          _returnString = await Auth().loginUser(email, password);
          break;
        case LoginType.google:
          _returnString = await Auth().loginUserWithGoogle();
          break;
        default:
      }

      if (_returnString == "success") {
        // Navigator.pushReplacement(
        //     context,
        //     PageTransition(
        //         child: Root(), type: PageTransitionType.leftToRight));
      } else {
        print('$_returnString');
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(_returnString),
        //     duration: Duration(seconds: 2),
        //   ),
        // );
      }
    } catch (e) {
      print(e);
    }
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Signing in..",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  loginButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: ElevatedButton(
          child: Text(
            "Log in",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.amber,
            onSurface: Colors.grey,
            side: BorderSide(color: Colors.black, width: 1),
            elevation: 20,
            minimumSize: Size(350, 40),
          ),
          onPressed: () {
            if (emailController.text.isNotEmpty) {
              _loginUser(
                  type: LoginType.email,
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
            } else {
              waringText(context, "Make sure everything is filled.");
            }
          },
        ));
  }

  signInButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: ElevatedButton(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.amber,
            onSurface: Colors.grey,
            side: BorderSide(color: Colors.black, width: 1),
            elevation: 20,
            minimumSize: Size(350, 40),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: AccountScreen(),
                    type: PageTransitionType.leftToRight));
          },
        ));
  }

  void _signUpUser(String email, String password, String userName,
      BuildContext context) async {
    try {
      String _returnString = await Auth().signUpUser(email, password, userName);
      if (_returnString == "success") {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: HomeScreen(), type: PageTransitionType.leftToRight));
      }
    } catch (e) {
      print(e);
    }
  }

  createAccountButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: ElevatedButton(
          child: Text(
            "Create Account",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.amber,
            onSurface: Colors.grey,
            side: BorderSide(color: Colors.black, width: 1),
            elevation: 20,
            minimumSize: Size(350, 40),
          ),
          onPressed: () async {
            //todo : add validation
            try {
              if (emailController.text.isNotEmpty &&
                  usernameController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                _signUpUser(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    usernameController.text.trim(),
                    context);

                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: BottomNavigationScreen(),
                        type: PageTransitionType.leftToRight));
                emailController.clear();
                passwordController.clear();
                usernameController.clear();
              } else {
                waringText(context, "Make sure everything is filled.");
              }
            } catch (e) {
              print(e);
              // showSnackBar(context);
            }
          },
        ));
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Error'),
      backgroundColor: const Color(0xffae00f0),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Done',
          textColor: Colors.white,
          onPressed: () {
            print('Done pressed!');
          }),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  signInSheet(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: usernameController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: "Enter username",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.amber,
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter email",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Enter password",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  waringText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15.0)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                warning,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
  }
}
