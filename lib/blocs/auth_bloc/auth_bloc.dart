import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kviz_web/000_app/core/application_core.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationInitialEvent) {
      // check if authenticated
      try {
        User? _user = ApplicationCore().getAuthRepo().getUser();
        if (_user != null) {
          yield AuthenticationSuccess(user: _user);
        } else {
          yield AuthenticationFail(message: "Unauthenticated");
        }
      } catch (e) {
        yield AuthenticationError(message: e.toString());
      }
    }

    if (event is GoogleAuthEvent) {
      // do auth
      try {
        User? _user = await ApplicationCore().getAuthRepo().signInWithGoogle();
        if (_user != null) {
          yield AuthenticationSuccess(user: _user);
        } else {
          yield AuthenticationFail(message: "Unauthenticated");
        }
      } catch (e) {
        yield AuthenticationError(message: e.toString());
      }
    }
  }
}
