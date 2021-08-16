import 'dart:async';
import 'package:abadus/abadus.dart';
import 'package:example/100_login/forgot_password_repository.dart';


class PasswordResetBloc extends ApiRequestBloc<String, bool> {
  @override
  Stream<bool> request(String request) {
    return LogInRepository().forgotPassword(request);
  }

}
