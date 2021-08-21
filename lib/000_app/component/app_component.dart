import 'package:abadus/abadus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:kviz_web/blocs/auth_bloc/auth_bloc.dart';
import 'package:kviz_web/screens/home_page.dart';
import '../core/application_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    print("---------------------- APP START ----------------------");
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => ApplicationCore().getAuthBloc(),
        )
      ],
      child: MaterialApp(
        navigatorKey: ApplicationCore.navigatorKey,
        title: 'Kviz (Material) App',
        // theme: myTheme
        home: HomePage(),
      ),
    );
  }
}
