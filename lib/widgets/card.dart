import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  LevelCard({
    @required this.level,
    @required this.description,
    @required this.color
  });

  final String level;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width * 1.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              level,
              style: TextStyle(
                  fontSize: 72.0,
                  color: color,
                  fontFamily: "Soft",
                  fontWeight: FontWeight.w800
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 24.0,
                    color: color,
                    fontWeight: FontWeight.w300
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}