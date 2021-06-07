import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingHelpers extends ChangeNotifier {
  bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.black),
    );
  }

  Widget taglineText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
          child: Text(' AiCom ',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget createAccountText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
              child: Text(' Create account ',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  Widget privacyText(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "By continuing you agree to AiCom's Terms of",
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
        ),
        Text(
          "Services & Privacy Policy",
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
        ),
      ],
    );
  }
}
