import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  LevelCard({
    @required this.level,
    @required this.description,
    @required this.color
  });

  final String level;
  final String description;
  final Color color;

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
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  level,
                  style: TextStyle(
                      fontSize: 72.0,
                      color: color,
                      fontFamily: "Soft",
                      fontWeight: FontWeight.w800
                  ),
                ),
              )
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: color,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child:
                    FlatButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        'Начать',
                        style: TextStyle(
                            fontSize: 35.0,
                            color: color,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}