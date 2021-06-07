import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing_helpers.dart';
import 'landing_services.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var landingService = Provider.of<LandingService>(context, listen: false);
    var landingHelpers = Provider.of<LandingHelpers>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            landingHelpers.createAccountText(context),
            landingService.signInSheet(context),
            landingService.createAccountButton(context),
          ],
        ),
      ),
    );
  }
}
