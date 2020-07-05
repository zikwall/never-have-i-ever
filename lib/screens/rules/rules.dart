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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 35.0,
                      right: 35.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        HelpItem(content: 'вот короткая инструкция, как сделать так, чтобы вечер перестал быть томным и превратился в дикую ночь откровений, воспоминаний и незабываемых (или забываемых – не переборщите с сывороткой правды историй'),
                        HelpItem(content: 'правила просты и вполне укладываются в само название игры: участники по очереди читают вопросы, предваряя ее фразой «я никогда не», например, «я никогда не… занимался сексом в туалете»'),
                        HelpItem(content: 'после этого все те, кто не может согласиться с произнесенным (то есть, в нашем случае, те, кто предавался сладострастию в уборной), отпивают из своих бокалов (ну или делают шот чего-нибудь покрепче, но в этом случае игра рискует закончиться в течение часа'),
                        HelpItem(content: 'естественно, после того, как один или несколько игроков буквально признались в том, что они, например, хоть раз в жизни, но фотографировали себя голыми или писали в бассейн, им необходимо объясниться и поведать другим игрокам, «как так вышло», желательно по ролям, с демонстрацией доказательств, наглядных примеров и, конечно же, заявлениями, что они ни о чем не жалеют'),
                        HelpItem(content: 'игра продолжается до тех пор, пока участники не насытятся чужими секретами сполна, пока не опустеют все бокалы и прочие емкости в доме, ну или пока не закончатся вопросы. победит тот, кто наутро вспомнит как можно больше задорных чужих историй, и сам не ударит в грязь лицом. главное, чтобы голова не болела'),
                        HelpItem(content: 'элементарные правила, провокационные вопросы, приятный дизайн игры делают Я Никогда Не идеальным способом разнообразить вечеринку в большой компании или дружеские кухонные посиделки – с кем бы вы ни играли в нее, скучать вам точно не придется. главное, не играйте в нее с родителями. или со своими детьми. уважайте Минздрав и здравый смысл'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );

  }
}