import 'package:ai/screens/profile/admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatelessWidget {
  buildButton(context) => Container(
        padding: const EdgeInsets.only(left: 80, top: 0, right: 80, bottom: 0),
        child: FlatButton(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.amber),
            ),
            textColor: Colors.black,
            child: Text(
              "LOG OUT",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            onPressed: () {}),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "My Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "History",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.amber,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "Payment Details",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "Log in as Admin",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Admin(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.black,
                child: ListTile(
                  leading: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
