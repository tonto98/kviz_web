part of 'quizzes_bloc.dart';

@immutable
abstract class QuizzesEvent {

  @override
  List<Object> get props => [];
}

class QuizzesGetEvent extends QuizzesEvent {
  final String param;

  QuizzesGetEvent(this.param);

  @override
  List<Object> get props => [param];


}
