import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTodoDialog extends StatelessWidget {
  final String title, description;

  AppTodoDialog({
    @required this.title,
    @required this.description,
  });

  dialogContent(BuildContext context) {
    Widget yasnoponyatno = FlatButton(
      child: Text("Я поняль",
        style: TextStyle(
            color: Colors.red
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: yasnoponyatno,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}