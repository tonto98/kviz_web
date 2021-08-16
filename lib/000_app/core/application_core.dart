import 'package:abadus/abadus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ApplicationCore extends Application {
  static final ApplicationCore _instance = ApplicationCore._internal();

  factory ApplicationCore() => _instance;

  ApplicationCore._internal();

  //navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // @blocs

  // @repos

  // @getters blocs

  // @getters repos

  @override
  String get getCurrentLanguage => 'en';

  @override
  Future<String> get getToken async => Future.value(null);

  @override
  Future<void> onCreate() async {
    await super.onCreate();

    await Firebase.initializeApp();

    // @init blocs

    // @init repos
  }
}
