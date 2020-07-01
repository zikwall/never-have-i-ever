import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  final String title;
  final Color color;

  SettingsHeader({
    @required this.title,
    @required this.color,
  });

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
                child: Icon(Icons.chevron_left, color: Colors.black, size: 45.0)
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
            const Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}