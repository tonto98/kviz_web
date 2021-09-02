import 'package:kviz_web/models/quizz/quizz_list.dart';
import 'package:kviz_web/repos/quizz_api_provider.dart';

class QuizzRespository {
  Future<QuizzesList> getUserQuizzes() async {
    return await QuizzApiProvider.getAllUserQuizzes();
  }
}

