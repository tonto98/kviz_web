import 'package:http/http.dart' as http;
import 'package:kviz_web/000_app/core/application_core.dart';
import 'dart:convert';

import 'package:kviz_web/models/quizz/quizz_list.dart';
import 'package:kviz_web/repos/user_repo.dart';

class QuizzApiProvider {
  static Future<QuizzesList> getAllUserQuizzes() async {
    String uid = ApplicationCore().getUserRepo().user!.uid!;
    
    final response = await http.get(
      Uri.parse(
          "https://us-central1-kviz-a185e.cloudfunctions.net/getUserQuizzes?author=$uid"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*/*",
        "Accept-Encodig": "gzip, deflate, br",
        "Connection": "keep-alive"
      },

    );

    final result = QuizzesList.fromJson(jsonDecode(response.body));
    
    return result;
  }
}