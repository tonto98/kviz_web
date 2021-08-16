import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:kviz_web/app/home_page.dart';
import '../core/application_core.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ApplicationCore.navigatorKey,
      title: 'Exevio App',
      // theme: myTheme
      home: HomePage(),
    );
  }
}
