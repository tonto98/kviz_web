part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class GoogleAuthEvent extends AuthenticationEvent {
  final String param;

  GoogleAuthEvent(this.param);

  @override
  List<Object> get props => [param];
}

class AuthenticationInitialEvent extends AuthenticationEvent {}
