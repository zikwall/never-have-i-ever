import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final Color color;

  CardTitle({
    @required this.title,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 72.0,
            color: color,
            fontFamily: "Soft",
            fontWeight: FontWeight.w800
        ),
      ),
    );
  }
}