import 'package:flutter/material.dart';

class CheckoutHelpers extends ChangeNotifier {
  Container buildTotal() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "TOTAL",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )),
                Text("\$41.24",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Subtotal",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold))),
                Text("\$36.00",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Shipping",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold))),
                Text("\$2.00",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Tax",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold))),
                Text("\$3.24",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildButton() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 100, bottom: 10),
      child: ButtonTheme(
        buttonColor: Colors.amber,
        minWidth: double.infinity,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "CHECKOUT",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
