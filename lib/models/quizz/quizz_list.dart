import 'package:kviz_web/models/quizz/quizz.dart';

class QuizzesList {
  final List<Quizz> quizzes;

  QuizzesList({
    required this.quizzes,
  });

  factory QuizzesList.fromJson(List<dynamic> parsedJson) {
    return QuizzesList(
        quizzes: parsedJson.map((e) => Quizz.fromJson(e)).toList());
  }
}
