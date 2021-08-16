import 'package:abadus/abadus.dart';
import 'package:dio/dio.dart';

class LoginApiProvider extends APIProvider {
  static const String _FORGOT_PASSWORD = '/auth/forgot-password';

  Future<bool> forgotPassword(String email) async {
    Response _response = await dio.post(LoginApiProvider._FORGOT_PASSWORD,
        options: Options(headers: {
          "default-headers": "",
        }),
        data: {
          'email' : email,
        });
    return _response.statusCode == 200;    
  }
}

class LogInRepository {
  LoginApiProvider _loginApiProvider = LoginApiProvider();

  Stream<bool> forgotPassword(
      String email) {
    return Stream.fromFuture(_loginApiProvider.forgotPassword(email));
  }

}