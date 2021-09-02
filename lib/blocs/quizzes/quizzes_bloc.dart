import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kviz_web/models/quizz/quizz_list.dart';
import 'package:kviz_web/repos/quizz_repo.dart';
import 'package:meta/meta.dart';

part 'quizzes_event.dart';
part 'quizzes_state.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  QuizzesBloc() : super(QuizzesInitial());

  @override
  Stream<QuizzesState> mapEventToState(
    QuizzesEvent event,
  ) async* {
    if (event is QuizzesGetEvent) {
      yield QuizzesLoading();

      try {
        QuizzesList quizzes = await QuizzRespository().getUserQuizzes();
        yield QuizzesSuccess(quizzes: quizzes);
      } catch (e) {
        print(e);
        yield QuizzesError(message: e.toString());
      }
    }
  }
}
