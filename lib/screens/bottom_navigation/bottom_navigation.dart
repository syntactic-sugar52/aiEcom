import 'package:ai/screens/bottom_navigation/bottom_nav_helpers.dart';
import 'package:ai/screens/home/home.dart';
import 'package:ai/screens/profile/profile.dart';
import 'package:ai/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int activeTab = 0;
  BottomNavHelpers _bottomNavHelpers;
  @override
  Widget build(BuildContext context) {
    this._bottomNavHelpers = Provider.of(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: getFooter(),
        body: getBody());
  }

  getBody() {
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
        Search(),
        Profile()
      ],
      // notifyListeners();
    );
  }

  Widget getFooter() {
    List items = [
      Feather.home,
      Feather.book,
      Feather.search,
      Feather.user,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return IconButton(
                  icon: Icon(
                    items[index],
                    color: activeTab == index ? Colors.white : Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
