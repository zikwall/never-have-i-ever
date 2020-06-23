import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_title.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_description.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_bottom.dart';

import 'package:never_have_i_ever/screens/custom/custom.dart';
import 'package:never_have_i_ever/transitions/scale_route.dart';

class PackContentCustom extends StatelessWidget {
  PackContentCustom({
    @required this.level,
    @required this.description,
    @required this.color
  });

  final String level;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: PackBodyTitle(
              title: level,
              color: color
          ),
        ),
        Expanded(
            child: PackBodyDescription(
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
            child: PackBodyBottom(color: color)
        ),
      ],
    );
  }
}