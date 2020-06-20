import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final String text;
  final Color color;

  CardBody({
    @required this.text,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24.0,
                color: color,
                fontWeight: FontWeight.w300
            ),
          ),
        )
    );
  }
}