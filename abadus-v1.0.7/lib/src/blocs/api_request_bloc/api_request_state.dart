part of 'api_request_bloc.dart';

abstract class BlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends BlocState {}

class LoadingState extends BlocState {}

class SuccessState<T> extends BlocState {
  final T response;

  SuccessState(this.response);

  @override
  List<Object?> get props => [response];
}

class FailState extends BlocState {
  final String message;
  final Map<String?, dynamic>? fail;

  FailState(this.message, {required this.fail});

  @override
  List<Object?> get props => [message, fail];
}

class ErrorState extends BlocState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
