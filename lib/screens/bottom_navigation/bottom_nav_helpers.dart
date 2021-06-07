import 'package:ai/screens/home/home.dart';
import 'package:flutter/material.dart';

class BottomNavHelpers with ChangeNotifier {
  getBody(
    int activeTab,
  ) {
    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        Center(
          child: Text(
            "",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Search",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      // notifyListeners();
    );
  }
}
