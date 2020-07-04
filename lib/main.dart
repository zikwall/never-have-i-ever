import 'package:flutter/material.dart';
import 'package:never_have_i_ever/screens/home/home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(NeverHaveIEverApp());
}

class NeverHaveIEverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Я Никогда Не',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
