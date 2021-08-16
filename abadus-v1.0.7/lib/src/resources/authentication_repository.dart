import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository<T> {
  late SharedPreferences _prefs;

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    _prefs = await SharedPreferences.getInstance();
    await _prefs.remove('auth_data');
    return;
  }

  String objectToString(T data) {
    return data.toString();
  }

  T? stringToObject(String? data) {
    return data as T?;
  }

  Future<void> persistToken(T data) async {
    /// write to keystore/keychain
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('auth_data', objectToString(data));
    return;
  }

  Future<bool> hasToken() async {
    _prefs = await SharedPreferences.getInstance();

    String? _authData;
    _authData = _prefs.getString('auth_data');

    return _authData != null;
  }

  Future<bool> isValid() async {
    return Future.value(true);
  }

  Future<T?> getToken() async {
    _prefs = await SharedPreferences.getInstance();

    String? _authData;
    _authData = _prefs.getString('auth_data');

    return stringToObject(_authData);
  }
}
