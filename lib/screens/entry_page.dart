import 'package:flutter/material.dart';
import 'package:kviz_web/blocs/auth_bloc/auth_bloc.dart';
import 'package:kviz_web/screens/home_page.dart';
import 'package:kviz_web/utils/google_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kviz Web App"),
      ),
      body: Center(
        // child: GoogleButton(),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationSuccess) {
              return HomePage();
            }
            if (state is AuthenticationFail || state is AuthenticationFail) {
              return GoogleButton();
            }
            return SpinKitRotatingCircle(
              color: Colors.blue,
              size: 50.0,
            );
          },
        ),
      ),
    );
  }
}
