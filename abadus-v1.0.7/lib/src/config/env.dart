import 'package:abadus/src/core/application.dart';
import 'package:flutter/material.dart';

enum EnvType { DEVELOPMENT, STAGING, PRODUCTION, TESTING }

class Env {
  static Env? value;

  late Widget firstWidget;
  Application? application;

  late String appName;
  String? baseUrl;
  Color? primarySwatch;
  EnvType environmentType = EnvType.DEVELOPMENT;

  // Widget firstWidget;
  // Application application;
  // Database Config
  int dbVersion = 1;
  String? dbName;

  Env() {
    WidgetsFlutterBinding.ensureInitialized();
    value = this;
    _init();
  }

  void _init() async {
    // if(EnvType.DEVELOPMENT == environmentType || EnvType.STAGING == environmentType){
    //   Stetho.initialize();
    // }

    await application?.onCreate();
    //await initializeDateFormatting();
    runApp(firstWidget);
  }
}
