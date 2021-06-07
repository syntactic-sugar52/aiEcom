import 'package:flutter/material.dart';

class ProfileHelpers extends ChangeNotifier {
  buildContainer(IconData icon, String views, String count) {
    return Card(
        color: Colors.blueGrey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(views,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  count,
                  style: TextStyle(fontSize: 23.0, color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
