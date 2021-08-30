import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quizzes_event.dart';
part 'quizzes_state.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  QuizzesBloc(QuizzesState initialState) : super(initialState);

  @override
  QuizzesState get initialState => QuizzesInitial();

  @override
  Stream<QuizzesState> mapEventToState(
    QuizzesEvent event,
  ) async* {
    if (event is QuizzesMyEvent) {
      // get req
    }
  }
}
