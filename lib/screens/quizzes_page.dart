import 'package:flutter/material.dart';
import 'package:kviz_web/blocs/quizzes/quizzes_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kviz_web/screens/components/quizzes_widget.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  _QuizzesPageState createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  late QuizzesBloc _quizzesBloc;

  @override
  void initState() {
    _quizzesBloc = QuizzesBloc()..add(QuizzesGetEvent("param"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _quizzesBloc,
      child: Container(
          color: Colors.pink,
          child: BlocBuilder<QuizzesBloc, QuizzesState>(
            builder: (context, state) {
              if (state is QuizzesSuccess){
                return QuizzesWidget(quizzesList: state.quizzes);
              }
              return Text("Loading..");
            },
          )),
    );
  }
}
