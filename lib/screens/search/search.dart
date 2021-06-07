import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  buildSearch(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: Theme(
            data: ThemeData(primaryColor: Color(0xffF2F2F2)),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(25.0),
                  ),
                ),
                fillColor: Color(0xffF2F2F2),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffBDBDBD),
                  size: 30,
                ),
                hintText: 'Search',
                labelStyle: TextStyle(fontSize: 20),
                hintStyle: TextStyle(color: Color(0xffBDBDBD)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 5)],
            ),
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Text("Search",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              buildSearch(context),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
