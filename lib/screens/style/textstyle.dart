import 'package:flutter/material.dart';

const EdgeInsets standardPaddingX = EdgeInsets.only(left: 25, right: 25);

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;

  PrimaryText(
      {this.size: 20,
      this.text,
      this.fontWeight: FontWeight.w600,
      this.color: Colors.black,
      this.textAlign: TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
