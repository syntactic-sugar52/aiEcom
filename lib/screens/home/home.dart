import 'package:ai/json/json.dart';
import 'package:ai/screens/home/homepage_helpers.dart';
import 'package:ai/screens/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int selectedCategory = 0;
  List selectedCategoryList = randomStore;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var helper = Provider.of<HomepageHelpers>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      key: _key,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
            color: Colors.white,
          )
          // NotificationButton(),
        ],
      ),
      body: Container(
        height: height,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  helper.buildSearchTextField,
                  helper.buildCategory(height, context),
                  Container(
                    height: 60.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 18 : 0,
                          right: 20,
                        ),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = index;
                              selectedCategoryList = categories[index]['array'];
                            });
                          },
                          child: PrimaryText(
                            text: categories[index]['label'],
                            color: selectedCategory == index
                                ? Colors.blueGrey
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                            size: 18,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                            primary: selectedCategory == index
                                ? Colors.black
                                : Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryText(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    text: "Home and Entertainment",
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: height * 0.5,
                    width: width,
                    child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  selectedCategoryList.length,
                                  (index) => helper.productCard(
                                      context,
                                      selectedCategoryList[index]["image"],
                                      selectedCategoryList[index]["label"],
                                      selectedCategoryList[index]["price"]))),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
