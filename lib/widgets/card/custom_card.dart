import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/card/title.dart';
import 'package:never_have_i_ever/widgets/card/body.dart';
import 'package:never_have_i_ever/widgets/card/bottom.dart';
import 'package:never_have_i_ever/screens/custom/custom.dart';
import 'package:never_have_i_ever/transitions/scale_route.dart';

class CustomLevelCard extends StatelessWidget {
  CustomLevelCard({
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

            if (true)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 0,
                            top: 0,
                            right: 15,
                            bottom: 0,
                          ),
                          child:
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  ScaleRouteTransition(widget: Custom())
                              );
                            },
                            child: Text(
                              'конфигурация',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: color,
                                  fontFamily: "Soft",
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          )
                      )
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