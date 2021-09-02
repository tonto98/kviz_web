import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kviz_web/models/quizz/quizz.dart';
import 'package:kviz_web/screens/components/category_item.dart';

class QuizzItem extends StatefulWidget {
  final Quizz quizz;
  const QuizzItem({
    Key? key,
    required this.quizz,
  }) : super(key: key);

  @override
  _QuizzItemState createState() => _QuizzItemState();
}

class _QuizzItemState extends State<QuizzItem>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _titleController;

  @override
  void initState() {
    _titleController = TextEditingController(text: "${widget.quizz.name}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Colors.blue[50],
        ),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onChanged: (value) {
                widget.quizz.name = value;
              },
            ),
            Text("CATEGORIES"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children:
                      List.generate(widget.quizz.categories.length, (index) {
                    return CategoryItem(
                        category: widget.quizz.categories[index]);
                  }),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(widget.quizz.toJson());
              },
              child: Text("Save?"),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
