import 'package:flutter/material.dart';
import 'package:kviz_web/models/quizz/category.dart';
import 'package:kviz_web/models/quizz/question.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  late TextEditingController _categoryTitleController;

  @override
  void initState() {
    _categoryTitleController = TextEditingController(text: widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: ExpansionTile(
        title: TextField(
          controller: _categoryTitleController,
          onChanged: (value){
            widget.category.name = value;
          },
        ),
        children: List.generate(widget.category.questions.length, (index) {
          return QuestionItem(question: widget.category.questions[index]);
        }),
        maintainState: true,
      ),
    );
  }
}

class QuestionItem extends StatefulWidget {
  final Question question;
  const QuestionItem({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.question.order),
                Text(widget.question.question),
              ],
            ),
            Text(widget.question.answer),
          ],
        ),
      ),
    );
  }
}
