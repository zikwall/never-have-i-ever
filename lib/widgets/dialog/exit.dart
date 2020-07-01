import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppExitDialog extends StatelessWidget {
  final String title, description;

  AppExitDialog({
    @required this.title,
    @required this.description,
  });

  dialogContent(BuildContext context) {
    Widget yes = FlatButton(
      child: Text("Выйти",
        style: TextStyle(
          fontFamily: "Soup",
        ),
      ),
      onPressed: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );

    Widget no = FlatButton(
      child: Text("Остаться :)",
        style: TextStyle(
          fontFamily: "Soup",
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
              fontFamily: "Soft",
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Soup",
            ),
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              yes, no
            ],
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