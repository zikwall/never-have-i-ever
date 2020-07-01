import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/app/settings_header.dart';
import 'package:flutter/services.dart';

class HelpItem extends StatelessWidget {
  final String content;

  HelpItem({
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0, bottom: 10.0
      ),
      child: Text(
        content,
        style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SettingsHeader(
                title: 'правила',
                color: Colors.black,
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 35.0,
                      right: 35.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        HelpItem(content: 'игроки могут читать вопросы по одному, или один человек может читать все'),
                        HelpItem(content: 'после прочтения вопроса каждый игрок должен ответить, делал он это или нет'),
                        HelpItem(content: 'все, кто ответил "да" следует выпить, а те кто ответил "нет" должны выполнить задание, которое будет на экране'),
                        HelpItem(content: 'З.Ы. если кого-то поймают на лжи, он должен пообещать, что обязательно сделает то, о чем он солгал.'),
                      ],
                    ),
                  )
              )
            ],
          )
      ),
    );

  }
}