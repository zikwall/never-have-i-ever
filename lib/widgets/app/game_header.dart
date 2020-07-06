import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/dialog/todo.dart';

class GameHeader extends StatelessWidget {
  final String title;
  final Color color;

  GameHeader({
    @required this.title,
    @required this.color,
  });

  showTodoDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) => AppTodoDialog(
        title: "Скоро",
        description: "Вот реально скоро, подожди еще немного)",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      alignment: Alignment.topCenter,
      child:
      Padding(
        padding: EdgeInsets.only(
          left: 0,
          top: 10 + statusBarHeight,
          right: 0,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.chevron_left, color: color, size: 45.0)
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 35.0,
                color: color,
                fontFamily: "Soft",
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            FlatButton(
                onPressed: () {
                  showTodoDialog(context);
                },
                child: Icon(Icons.exposure_plus_1, color: color, size: 35.0)
            ),
          ],
        ),
      ),
    );
  }
}