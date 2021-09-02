import 'package:flutter/material.dart';
import 'package:kviz_web/models/quizz/quizz_list.dart';
import 'package:kviz_web/screens/components/quizz_item.dart';

class QuizzesWidget extends StatefulWidget {
  final QuizzesList quizzesList;
  const QuizzesWidget({
    Key? key,
    required this.quizzesList,
  }) : super(key: key);

  @override
  _QuizzesWidgetState createState() => _QuizzesWidgetState();
}

class _QuizzesWidgetState extends State<QuizzesWidget>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(widget.quizzesList.quizzes.first.categories.first.questions.first.order);
      },
      child: Container(
        color: Colors.purple[100],
        child: ListView.builder(
          itemCount: widget.quizzesList.quizzes.length,
          itemBuilder: (context, index) {
            return QuizzItem(quizz: widget.quizzesList.quizzes[index]);
          },
        ),
      ),
    );
  }
}
