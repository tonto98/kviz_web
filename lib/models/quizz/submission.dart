
import 'package:kviz_web/models/quizz/answer.dart';

class Submission {
  String id;
  int score;
  String groupName;
  String comment;
  List<Answer> answers;

  Submission({
    required this.id,
    required this.score,
    required this.groupName,
    required this.comment,
    required this.answers,
  });
  factory Submission.fromJson(Map<String, dynamic> json) {
    var id = json["id"];
    var score = json["score"].toInt();
    var groupName = json["group_name"];
    var comment = json["comment"];
    final v = json["answers"];
    final arr0 = <Answer>[];
    v.forEach((v) {
      arr0.add(Answer.fromJson(v));
    });
    var answers = arr0;
    return Submission(id: id, score: score, groupName: groupName, comment: comment, answers: answers);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["score"] = score;
    data["group_name"] = groupName;
    data["comment"] = comment;
    if (answers != null) {
      final v = answers;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data["answers"] = arr0;
    }
    return data;
  }
}
