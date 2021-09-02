
import 'package:flutter/material.dart';
import 'package:abadus/abadus.dart';
import '../component/app_component.dart';
import '../core/application_core.dart';

void main() => Production();

class Production extends Env {
  final String appName = 'KvizWeb';
  final String baseUrl = 'https://us-central1-kviz-a185e.cloudfunctions.net/';
  final Color primarySwatch = Colors.red;
  EnvType environmentType = EnvType.PRODUCTION;

  @override
  // TODO: implement application
  Application get application => ApplicationCore();

  @override
  Widget get firstWidget => AppComponent();
}
