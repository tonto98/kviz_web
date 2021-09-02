import 'package:flutter/material.dart';
import 'package:abadus/abadus.dart';
import '../component/app_component.dart';
import '../core/application_core.dart';

// flutter run -d chrome — web-hostname localhost — web-port 7357
void main() => Development();

class Development extends Env {
  final String appName = 'KvizWeb';
  final String baseUrl = 'https://us-central1-kviz-a185e.cloudfunctions.net/';
  final Color primarySwatch = Colors.red;
  EnvType environmentType = EnvType.DEVELOPMENT;

  @override
  // TODO: implement application
  Application get application => ApplicationCore();

  @override
  Widget get firstWidget => AppComponent();
}
