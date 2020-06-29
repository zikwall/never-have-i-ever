import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsHeader extends StatelessWidget {
  final Color color;

  SettingsHeader({
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
              'настройки',
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