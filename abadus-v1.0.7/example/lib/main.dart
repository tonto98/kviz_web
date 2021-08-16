import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/ui/initiative_list_page.dart';
import 'package:flutter/material.dart';

import '100_login/password_reset_dialog.dart';

void main() => Development();

class Development extends Env {
  final String appName = 'MyApp';
  final String baseUrl = 'https://test.kastapp.exevio.com/api';
  final Color primarySwatch = Colors.red;
  EnvType environmentType = EnvType.DEVELOPMENT;

  @override
  Widget get firstWidget => MyApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () => showDialog(
                context: context,
                builder: (_) {
                  return PasswordResetDialog();
                }),
          )
        ],
        title: Text(widget.title),
      ),
      body: InitiativeListWidget(),
    );
  }
}
