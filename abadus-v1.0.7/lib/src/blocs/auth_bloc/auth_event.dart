part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoggedIn<T> extends AuthEvent {
  final T data;

  AuthLoggedIn(this.data);
}

class AuthLoggedOut extends AuthEvent {}
