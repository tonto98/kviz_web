part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final User user;
  AuthenticationSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthenticationFail extends AuthenticationState {
  final String? message;

  AuthenticationFail({@required this.message});

  @override
  List<Object?> get props => [message];
}

class AuthenticationError extends AuthenticationState {
  final String? message;

  AuthenticationError({@required this.message});

  @override
  List<Object?> get props => [message];
}
