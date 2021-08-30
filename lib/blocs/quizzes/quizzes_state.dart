part of 'quizzes_bloc.dart';

@immutable
abstract class QuizzesState {}

class QuizzesInitial extends QuizzesState {}

class QuizzesLoading extends QuizzesState {}

class QuizzesSuccess extends QuizzesState {}

class QuizzesFail extends QuizzesState {
  final Map<String, dynamic> fail;

  QuizzesFail({required this.fail});

  @override
  List<Object> get props => [fail];
}

class QuizzesError extends QuizzesState {
  final String message;

  QuizzesError({required this.message});

  @override
  List<Object> get props => [message];
}
