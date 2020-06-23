import 'package:flutter/material.dart';
import 'package:never_have_i_ever/screens/home/home.dart';

void main() {
  runApp(NeverHaveIEverApp());
}

class NeverHaveIEverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
