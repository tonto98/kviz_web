import 'package:kviz_web/models/quizz/question.dart';
import 'package:kviz_web/models/quizz/submission.dart';

class Category {
  String id;
  String name;
  List<Question> questions;
  List<Submission> submissions;

  Category({
    required this.id,
    required this.name,
    required this.questions,
    required this.submissions,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    var id = json["id"];
    var name = json["name"];
    
    final _questions = json["questions"];
    final questionArray = <Question>[];
    _questions.forEach((_questions) {
      questionArray.add(Question.fromJson(_questions));
    });
    var questions = questionArray;
    
    final _submissions = json["submissions"];
    final submissionArray = <Submission>[];
    _submissions.forEach((_submissions) {
      submissionArray.add(Submission.fromJson(_submissions));
    });
    var submissions = submissionArray;
    return Category(id: id, name: name, submissions: submissions, questions: questions);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    if (questions != null) {
      final v = questions;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["questions"] = arr0;
    }
    if (submissions != null) {
      final v = submissions;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["submissions"] = arr0;
    }
    return data;
  }
}
