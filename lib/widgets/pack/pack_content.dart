import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_title.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_description.dart';
import 'package:never_have_i_ever/widgets/pack/pack_body_bottom.dart';

class PackContent extends StatelessWidget {
  PackContent({
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
        Align(
            alignment: Alignment.bottomCenter,
            child: PackBodyBottom(color: color)
        ),
      ],
    );
  }
}