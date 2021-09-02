import 'dart:html';

import 'package:abadus/abadus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kviz_web/blocs/auth_bloc/auth_bloc.dart';
import 'package:kviz_web/repos/user_repo.dart';

class ApplicationCore extends Application {
  static final ApplicationCore _instance = ApplicationCore._internal();

  factory ApplicationCore() => _instance;

  ApplicationCore._internal();

  //navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // @blocs
  late AuthenticationBloc _authBloc;

  // @repos
  late UserRepository _userRepository;

  // @getters blocs
  AuthenticationBloc getAuthBloc() => _authBloc;

  // @getters repos
  UserRepository getUserRepo() => _userRepository;

  @override
  String get getCurrentLanguage => 'en';

  @override
  Future<String> get getToken async => Future.value(null);

  @override
  Future<void> onCreate() async {
    await super.onCreate();

    await Firebase.initializeApp();

    // @init repos
    _userRepository = UserRepository();
    await _userRepository.init();

    // @init blocs
    _authBloc = AuthenticationBloc()..add(AuthenticationInitialEvent());
  }
}
