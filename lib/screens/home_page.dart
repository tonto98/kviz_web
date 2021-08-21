import 'package:flutter/material.dart';
import 'package:kviz_web/blocs/auth_bloc/auth_bloc.dart';
import 'package:kviz_web/utils/google_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              return Center(
                child: Text(state.user.email!),
              );
            }
            if (state is AuthenticationFail) {
              return GoogleButton();
            }
            return Text("loading");
          },
        ),
      ),
    );
  }
}
