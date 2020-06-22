import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/card/title.dart';
import 'package:never_have_i_ever/widgets/card/body.dart';
import 'package:never_have_i_ever/widgets/card/bottom.dart';

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
      height: MediaQuery.of(context).size.width * 1.6,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: CardTitle(
                  title: level,
                  color: color
              ),
            ),
            Expanded(
                child: CardBody(
                    text: description,
                    color: color
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CardBottom(color: color)
            ),
          ],
        ),
      ),
    );
  }
}