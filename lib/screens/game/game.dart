import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:never_have_i_ever/widgets/app/game_header.dart';

class Game extends StatelessWidget {
  final Color color;

  Game({
    @required this.color,
  });

  Widget _buildQuestion(context) {
    return Container(
      padding: EdgeInsets.only(bottom: 60.0),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width - 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'не курил кальян в своей жизни',
            style: TextStyle(
                fontSize: 24.0,
                color: color,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeverHaveIEver() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'я никогда не: _____________',
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }

  Widget _buildDrink(context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 75,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'если да. надо выпить',
            style: TextStyle(
                fontSize: 20.0,
                color: color,
                fontWeight: FontWeight.w300
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTask(context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'если нет. выполняй задание:',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: color,
                      fontWeight: FontWeight.w300
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'сядь на шпагат или хотя бы попытайся',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: color,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: () {

        },
        child: Text(
          'далее',
          style: TextStyle(
              fontSize: 35.0,
              color: Colors.white,
              fontFamily: "Soft",
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: color,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GameHeader(color: Colors.white, title: "игра"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildNeverHaveIEver(),
                      _buildQuestion(context),
                      _buildDrink(context),
                      _buildTask(context),
                      _buildNextButton()
                    ],
                  )
                ),
              )
            ]
          )
        )
    );
  }
}