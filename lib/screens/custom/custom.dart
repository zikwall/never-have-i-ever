import 'package:flutter/material.dart';
import 'package:never_have_i_ever/constants/colors.dart';

class Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.AppColors['custom'],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'назад',
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontFamily: "Soft",
                          fontWeight: FontWeight.w700
                      ),
                    )
                )
            ),
          ],
        )
    );
  }
}