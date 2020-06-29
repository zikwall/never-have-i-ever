import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/app/settings_header.dart';
import 'package:flutter/services.dart';

class SettingItem extends StatelessWidget {
  final String label;
  final Function() onPressed;

  SettingItem({
    @required this.label,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: FlatButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300
              ),
            )
        )
    );
  }
}

class Settings extends StatelessWidget with NavigatorObserver {
  final Color color;

  Settings({
    @required this.color,
  });

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
              SettingsHeader(color: color),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        SettingItem(label: 'написать нам', onPressed: () =>
                        {

                        }),
                        SettingItem(label: 'поставить оценку', onPressed: () =>
                        {

                        }),
                        SettingItem(label: 'правила', onPressed: () =>
                        {

                        }),
                        SettingItem(label: 'политика конфиденциальности', onPressed: () =>
                        {

                        }),
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