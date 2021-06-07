import 'package:ai/screens/profile/profile_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var helper = Provider.of<ProfileHelpers>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text("Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Text(
                "Manage",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text(
            "Admin",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: TabBarView(
            children: [
              Container(
                  child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  helper.buildContainer(Icons.person, " Product Views", "1"),
                  helper.buildContainer(Icons.person, "Sales", "20"),
                  helper.buildContainer(Icons.category, "Category", "1"),
                  helper.buildContainer(
                      Icons.celebration, "Featured Product", "1"),
                  helper.buildContainer(
                      Icons.center_focus_strong, "Retention", "1"),
                  helper.buildContainer(Icons.person, "Store Visit", "1"),
                ],
              )),
              Container(
                  child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  helper.buildContainer(Icons.person, " Edit Store Name", "1"),
                  helper.buildContainer(Icons.person, "Edit Shop Hours", "20"),
                  helper.buildContainer(Icons.category, "Category", "1"),
                  helper.buildContainer(Icons.add, "Add Product", "1"),
                  helper.buildContainer(
                      Icons.center_focus_strong, "Add Photo", "1"),
                  helper.buildContainer(Icons.person, "Delete Store", "1"),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
