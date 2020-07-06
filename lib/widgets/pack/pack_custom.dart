import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/pack/pack_content_custom.dart';

class AppPackCustom extends StatelessWidget {
  AppPackCustom({
    @required this.level,
    @required this.description,
    @required this.color,
    @required this.onGame
  });

  final Function() onGame;
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
          child: PackContentCustom(
            level: level,
            description: description,
            color: color,
            onGame: onGame,
          )
      ),
    );
  }
}