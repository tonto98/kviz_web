import 'package:abadus/src/config/env.dart';
import 'package:abadus/src/core/simple_bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

abstract class Application {
  static PackageInfo _packageInfo = PackageInfo(
    appName: Env.value!.appName,
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );
  PackageInfo get getPackageInfo => _packageInfo;
  String? get getCurrentLanguage => null;
  Future<String> get getToken async => Future.value(null);
  InterceptorErrorCallback get tokenFail => (e, handler) => null;
  List<InterceptorsWrapper>? get abadusDioInterceptors => null;

  @mustCallSuper
  Future<void> onCreate() async {
    _initPackageInfo();

    Bloc.observer = SimpleBlocObserver();
  }

  Future<void>? onTerminate() => null;

  void _initPackageInfo() {
    PackageInfo.fromPlatform().then((packageInfo) {
      _packageInfo = packageInfo;
    });
  }
}

// class ApplicationCore extends Application {
//   ApplicationCore._privateConstructor();

//   static final ApplicationCore _instance =
//       ApplicationCore._privateConstructor();

//   factory ApplicationCore() {
//     return _instance;
//   }

//   //navigator Key
//   static GlobalKey<NavigatorState> _navigatorKey;

//   GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

//   @override
//   String get getCurrentLanguage => 'en';

//   @override
//   Future<String> get getToken async => 'tokenType' + 'accessToken';

//   @override
//   Future<void> onCreate() async {
//     await super.onCreate();
//     //init navigator key
//     _navigatorKey = GlobalKey<NavigatorState>();
//   }
// }
