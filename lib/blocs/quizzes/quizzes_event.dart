part of 'quizzes_bloc.dart';

@immutable
abstract class QuizzesEvent {

  @override
  List<Object> get props => [];
}

class QuizzesMyEvent extends QuizzesEvent {
  final String param;

  QuizzesMyEvent(this.param);

  @override
  List<Object> get props => [param];


}
