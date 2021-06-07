import 'package:ai/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ai/screens/checout/checkout.dart';
import 'package:ai/screens/style/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetail extends StatelessWidget {
  final String image;
  ProductDetail(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: CheckoutList(
                    image: image,
                  ),
                  type: PageTransitionType.rightToLeft));
        },
        child: PrimaryText(text: "Buy Now", color: Colors.black, size: 18),
        style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Hero(
                tag: image,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                  child: Padding(
                    padding: standardPaddingX,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: RawMaterialButton(
                            elevation: 2,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                      child: BottomNavigationScreen(),
                                      type: PageTransitionType.rightToLeft),
                                  (route) => false);
                            },
                            constraints:
                                BoxConstraints(minWidth: 10, maxWidth: 50),
                            child: Icon(Icons.chevron_left,
                                color: Colors.black, size: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fillColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: RawMaterialButton(
                            elevation: 2,
                            onPressed: () {},
                            constraints: BoxConstraints(
                              minWidth: 10,
                            ),
                            child: Icon(Icons.favorite_border,
                                color: Colors.black, size: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fillColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                  transform: Matrix4.translationValues(0, -30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.black,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 50.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        PrimaryText(
                            text: "Shoe",
                            color: Colors.black,
                            size: 26,
                            fontWeight: FontWeight.w700),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrimaryText(
                              text: "\$80.00",
                              size: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  RawMaterialButton(
                                    constraints: BoxConstraints(minWidth: 0),
                                    onPressed: () {},
                                    elevation: 0,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.blueGrey,
                                      size: 20,
                                    ),
                                    fillColor: Colors.grey[200],
                                    padding: EdgeInsets.all(5.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  PrimaryText(
                                    text: "01",
                                    size: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RawMaterialButton(
                                    constraints: BoxConstraints(minWidth: 0),
                                    elevation: 0,
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    fillColor: Colors.grey[200],
                                    padding: EdgeInsets.all(5.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        PrimaryText(
                          text:
                              "Bacon ipsum dolor amet corned beef spare ribs landjaeger, pancetta short loin cupim pork belly. Landjaeger shank pig picanha prosciutto hamburger. Turducken spare ribs filet mignon short ribs beef hamburger flank burgdoggen picanha. Pork chop jerky spare ribs, beef ribs ground round cupim buffalo shoulder venison short ribs.",
                          size: 17,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
