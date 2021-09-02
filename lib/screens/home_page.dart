import 'package:flutter/material.dart';
import 'package:kviz_web/repos/user_repo.dart';
import 'package:kviz_web/screens/quizzes_page.dart';

import 'components/user_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserWidget(),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  UserRepository().signOutGoogle();
                },
                child: Text("Log Out"),
              )
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(
          flex: 70,
          child: QuizzesPage(),
        )
      ],
    );
  }
}
