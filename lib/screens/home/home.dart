import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:never_have_i_ever/widgets/pack/pack.dart';
import 'package:never_have_i_ever/widgets/pack/pack_custom.dart';
import 'package:never_have_i_ever/constants/colors.dart';
import 'package:never_have_i_ever/widgets/app/app_header.dart';
import 'package:never_have_i_ever/transitions/pack.dart';
import 'package:never_have_i_ever/screens/game/game.dart';
import 'package:never_have_i_ever/widgets/dialog/todo.dart';

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

  showTodoDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) => AppTodoDialog(
        title: "Скоро",
        description: "Вот реально скоро, подожди еще немного)",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Packs = <Widget> [
      Center(child: AppPack(
        level: 'easy',
        description: 'легкие и не принужденные вопросы для разогрева',
        color: ColorConstants.AppColors['easy'],
        onGame: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.downToUp,
                  child: Game(
                    color: ColorConstants.AppColors['easy'],
                    level: 'easy',
                  ),
                  duration: const Duration(milliseconds: 200)
              )
          );
        },
      )),
      Center(child: AppPack(
        level: 'spicy',
        description: 'становится интересней. более откровенные вопросы, которые помогут узнать друзей еще лучше',
        color: ColorConstants.AppColors['spicy'],
        onGame: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.downToUp,
                  child: Game(
                    color: ColorConstants.AppColors['spicy'],
                    level: 'spicy',
                  ),
                  duration: const Duration(milliseconds: 200)
              )
          );
        },
      )),
      Center(child: AppPack(
        level: 'hard',
        description: 'начинается жара. откровенные вопросы, которые заставят покраснеть не один раз',
        color:  ColorConstants.AppColors['hard'],
        onGame: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.downToUp,
                  child: Game(
                    color: ColorConstants.AppColors['hard'],
                    level: 'hard',
                  ),
                  duration: const Duration(milliseconds: 200)
              )
          );
        },
      )),
      Center(child: AppPack(
        level: 'extreme',
        description: 'самые горячие вопросы, которые позволят узнать самые пошлые секреты друзей',
        color:  ColorConstants.AppColors['extreme'],
        onGame: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.downToUp,
                  child: Game(
                    color: ColorConstants.AppColors['extreme'],
                    level: 'extreme',
                  ),
                  duration: const Duration(milliseconds: 200)
              )
          );
        },
      )),
      Center(child: AppPackCustom(
        level: 'custom',
        description: 'начните свою собственную игру. создайте свой набор, добавляйте любые вопросы из любого пакета или же придумывайте новые',
        color:  ColorConstants.AppColors['custom'],
        onGame: () {
          showTodoDialog(context);
        },
      )),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                final color = pageController.hasClients ? pageController.page / 4 : .0;
                final evaluateColor = background.evaluate(AlwaysStoppedAnimation(color));

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