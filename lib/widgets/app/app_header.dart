import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final Color color;

  AppHeader({
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
                title,
                style: TextStyle(
                    fontSize: 35.0,
                    color: color,
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