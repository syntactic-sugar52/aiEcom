import 'package:ai/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ai/screens/landing_page/landing_page.dart';
import 'package:ai/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  String currentUid;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Auth _user = Provider.of<Auth>(context, listen: false);

    String returnString = await _user.onStartUp();

    if (returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = LandingPage();
        break;
      case AuthStatus.loggedIn:
        retVal = BottomNavigationScreen();
        break;
      default:
    }
    return retVal;
  }
}
