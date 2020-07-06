import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/app/settings_header.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy extends StatelessWidget {
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
                title: 'политика',
                color: Colors.black,
              ),
              Expanded(
                child: WebView(
                  initialUrl: 'http://tv.zikwall.ru/vktv/static/never-privacy',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          )
      ),
    );

  }
}