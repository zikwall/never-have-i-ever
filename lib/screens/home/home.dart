import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:never_have_i_ever/screens/home/packs.dart';
import 'package:never_have_i_ever/constants/colors.dart';
import 'package:never_have_i_ever/widgets/app/app_header.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  PageController pageController;
  Animatable<Color> background;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: ColorConstants.AppColors['easy'],
          end: ColorConstants.AppColors['spicy'],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: ColorConstants.AppColors['spicy'],
          end: ColorConstants.AppColors['hard'],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: ColorConstants.AppColors['hard'],
          end: ColorConstants.AppColors['extreme'],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin:  ColorConstants.AppColors['extreme'],
          end: ColorConstants.AppColors['custom'],
        ),
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
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              final color = pageController.hasClients ? pageController.page / 4 : .0;
              final evaluateColor = background.evaluate(AlwaysStoppedAnimation(color));

              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: evaluateColor, // status bar color
              ));

              return DecoratedBox(
                decoration: BoxDecoration(
                  color: evaluateColor,
                ),
                child: child,
              );
            },
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppHeader(
                    color: Colors.white,
                    title: 'пакеты'
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      children: Packs,
                    ),
                  ),
                ]
            )
        ),
      )
    );
  }
}