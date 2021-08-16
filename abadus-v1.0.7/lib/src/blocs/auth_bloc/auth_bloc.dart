import 'dart:async';

import 'package:abadus/src/resources/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository authRepository;
  
  AuthBloc(this.authRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthStarted) {
      final bool hasToken = await authRepository.hasToken();
      final bool isValid = await authRepository.isValid();

      if (hasToken && isValid) {
        yield AuthSuccess();
      } else {
        yield AuthFail();
      }
    }

    if (event is AuthLoggedIn) {
      yield AuthLoading();
      await authRepository.persistToken(event.data);
      yield AuthSuccess();
    }

    if (event is AuthLoggedOut) {
      yield AuthLoading();
      await authRepository.deleteToken();
      yield AuthFail();
    }
  }
}
