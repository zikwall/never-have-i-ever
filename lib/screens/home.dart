import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:never_have_i_ever/screens/_home_sets.dart';
import 'package:never_have_i_ever/constants/colors.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  PageController pageController;
  Animatable<Color> background;

  final Map<String, ColorTween> LevelColors = {
    'easy': ColorTween(
      begin: ColorConstants.AppColors['easy'],
      end: ColorConstants.AppColors['spicy'],
    ),
    'spicy': ColorTween(
      begin: ColorConstants.AppColors['spicy'],
      end: ColorConstants.AppColors['hard'],
    ),
    'hard': ColorTween(
      begin: ColorConstants.AppColors['hard'],
      end: ColorConstants.AppColors['extreme'],
    ),
    'extreme': ColorTween(
      begin:  ColorConstants.AppColors['extreme'],
      end: ColorConstants.AppColors['custom'],
    )
  };

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: LevelColors['easy'],
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: LevelColors['spicy'],
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: LevelColors['hard'],
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: LevelColors['extreme'],
      ),
    ]);
    pageController = PageController();
  }

  @override
  void reassemble() {
    pageController.dispose();
    _initialize();
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          final color = pageController.hasClients ? pageController.page / 4 : .0;

          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: background.evaluate(AlwaysStoppedAnimation(color)), // status bar color
          ));

          return DecoratedBox(
            decoration: BoxDecoration(
              color: background.evaluate(AlwaysStoppedAnimation(color)),
            ),
            child: child,
          );
        },
        child: PageView(
          controller: pageController,
          children: HomeLevelsContent
          ,
        ),
      ),
    );
  }
}