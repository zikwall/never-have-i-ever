import 'package:flutter/material.dart';

class PackBodyBottom extends StatelessWidget {
  final Color color;
  final Function() onGame;

  PackBodyBottom({
    @required this.color,
    @required this.onGame
  });

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Красава"),
      content: Text("Хорошо, хорошо, ты нажал..."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child:
            FlatButton(
              onPressed: () {
                onGame();
              },
              child: Text(
                'начать',
                style: TextStyle(
                    fontSize: 35.0,
                    color: color,
                    fontFamily: "Soft",
                    fontWeight: FontWeight.w700
                ),
              ),
            )
        )
    );
  }
}