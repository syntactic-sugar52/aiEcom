import 'package:ai/screens/product_detail.dart/product_detail.dart';
import 'package:ai/screens/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomepageHelpers extends ChangeNotifier {
  TextEditingController _searchController = TextEditingController();
  Widget buildCategory(double height, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Stores",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget productCard(
      BuildContext context, String image, String label, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: ProductDetail(image),
                type: PageTransitionType.rightToLeft));
      },
      child: Hero(
        tag: image,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                              text: label, color: Colors.blueGrey, size: 16),
                          SizedBox(height: 5),
                          PrimaryText(
                              text: price,
                              size: 18,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          constraints: BoxConstraints(
                            minWidth: 0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          padding: EdgeInsets.all(5),
                          child:
                              Icon(Icons.add, size: 16, color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get buildSearchTextField => Container(
        padding: const EdgeInsets.all(12),
        height: 65,
        child: TextField(
          enabled: false,
          controller: _searchController,
          decoration: InputDecoration(
            isDense: true, // Added this
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
              size: 23,
            ),
            hintText: 'Search..',
            labelStyle: TextStyle(fontSize: 20),
            contentPadding: const EdgeInsets.symmetric(vertical: 1),
            hintStyle: TextStyle(color: Color(0xffBDBDBD)),
          ),
        ),
      );
}
