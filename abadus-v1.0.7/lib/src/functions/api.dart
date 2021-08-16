import 'dart:io';
import 'dart:convert';
import '../../src/models/api_models.dart';
import 'package:bloc/bloc.dart';
import 'package:built_value/json_object.dart';

typedef FormFieldApiValidator<T> = String? Function();

class Api {
  static Future<JsonObject?> fileSerialization(File file) async {
    String _data = await file.readAsString(encoding: utf8);
    RestApiModel? _restApiModel;
    _restApiModel = RestApiModel.fromJson(_data);
    return _restApiModel!.data;
  }

  // static FormFieldValidator email({
  //   String errorText = 'This field requires a valid email address.',
  // }) {
  //   return (valueCandidate) {
  //     if (valueCandidate != null && valueCandidate.isNotEmpty) {
  //       if (!isEmail(valueCandidate.trim())) return errorText;
  //     }
  //     return null;
  //   };
  // }

  static FormFieldApiValidator<T> apiValidator<T>(
    Bloc? bloc,
    String failKey, {
    String? errorText,
  }) {
    return () {
      if (bloc!.state is T &&
          (bloc.state?.fail?.containsKey(failKey) ?? false)) {
        String _fail = '';
        List<dynamic>? _failList = bloc.state.fail[failKey];
        if (_failList != null) {
          _fail = _failList.join('\n');
        }
        return errorText ?? _fail;
      }
      return null;
    };
  }
}

//general ApiValidator

// class DerivedClass<T extends BaseType> extends BaseClass<T /*not BaseType*/> {
//   DerivedClass(T /*not BaseType*/ prop) : super(prop);
// }
