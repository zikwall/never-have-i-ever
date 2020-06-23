import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final Color color;

  CardHeader({
    @required this.title,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          top: 10,
          right: 30,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.chevron_left, color: Colors.white, size: 45.0),
            Text(
              'наборы',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontFamily: "Soft",
                  fontWeight: FontWeight.w700
              ),
            ),
            Icon(Icons.settings, color: Colors.white, size: 25.0),
          ],
        ),
      )
    );
  }
}