import 'package:ai/json/json.dart';
import 'package:ai/screens/checout/checkout_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutList extends StatelessWidget {
  final String image;
  CheckoutList({this.image});
  @override
  Widget build(BuildContext context) {
    var helper = Provider.of<CheckoutHelpers>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
              child: Container(
                  child: Text(
                      sofaStore.length.toString() + " ITEMS IN YOUR CART",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sofaStore.length,
                  itemBuilder: (context, index) {
                    final item = sofaStore[index];
                    return Dismissible(
                      key: Key(UniqueKey().toString()),
                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: ListTile(
                                trailing: Text(
                                  sofaStore[index]['price'],
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Hero(
                                    tag: image,
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          image: DecorationImage(
                                              image: NetworkImage(image),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  sofaStore[index]['label'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, bottom: 1),
                                          child: Text('in stock',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            helper.buildTotal(),
            helper.buildButton()
          ],
        ));
  }
}
