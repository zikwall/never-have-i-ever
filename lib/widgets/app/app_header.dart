import 'package:flutter/material.dart';
import 'package:never_have_i_ever/screens/settings/settings.dart';
import 'package:never_have_i_ever/transitions/pack.dart';
import 'package:never_have_i_ever/widgets/dialog/exit.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final Color color;

  AppHeader({
    @required this.title,
    @required this.color,
  });

  showExitDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) => AppExitDialog(
        title: "Куда, куда!?",
        description: "Ты вот ща серьезно, хочешь выйти?",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            left: 0,
            top: 10 + statusBarHeight,
            right: 0,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    showExitDialog(context);
                  },
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 45.0)
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: 35.0,
                    color: color,
                    fontFamily: "Soft",
                    fontWeight: FontWeight.w700
                ),
              ),
              const Spacer(),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.downToUp,
                            child: Settings(),
                            duration: const Duration(milliseconds: 200)
                        )
                    );
                  },
                  child: Icon(Icons.settings, color: Colors.white, size: 25.0)
              ),
            ],
          ),
        )
    );
  }
}