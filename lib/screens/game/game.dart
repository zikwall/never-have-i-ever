import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:math";
import 'package:never_have_i_ever/widgets/app/game_header.dart';
import 'package:never_have_i_ever/questions/index.dart';
import 'package:never_have_i_ever/tasks/tasks.dart';

class Game extends StatefulWidget {
  final Color color;
  final String level;

  Game({
    @required this.color,
    @required this.level
  });

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  String currentQuestion;
  String currentTask;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentQuestion = getRandomQuestion();
        });

        //timer.cancel();
        _controller.reverse();
      }
      else if (status == AnimationStatus.dismissed) {
        // do stuff
      }
    });

    setState(() {
      currentQuestion = getRandomQuestion();
    });

    if (currentTask == null) {
      nextTask();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String getRandomQuestion() {
    final _random = new Random();
    var element = Questions[widget.level].questions[_random.nextInt(
        Questions[widget.level].questions.length
    )];
    return element;
  }

  void nextQuestion() {
    _controller.forward();
  }

  String getRandomTask() {
    final _random = new Random();
    var element = Tasks[_random.nextInt(
        Tasks.length
    )];
    return element;
  }

  void nextTask() {
    setState(() {
      currentTask = getRandomTask();
    });
  }

  Widget _buildQuestion(context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.width * 1.2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 0,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "$currentQuestion",
                    style: TextStyle(
                        fontSize: 28.0,
                        color: widget.color,
                        fontWeight: FontWeight.w600
                    ),
                  )
              )
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
          'я никогда не _______________.',
          style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.w700
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
                color: widget.color,
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
                      color: widget.color,
                      fontWeight: FontWeight.w300
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "$currentTask",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: widget.color,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: FlatButton(
        onPressed: () {
          nextQuestion();
          nextTask();
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
            backgroundColor: widget.color,
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
                            Spacer(),
                            _buildQuestion(context),
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