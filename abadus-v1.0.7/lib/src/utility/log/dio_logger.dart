import 'dart:convert';
import 'package:abadus/src/utility/log/log.dart';
import 'package:dio/dio.dart';

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    String _prettyprintRequest;
    String _res;

    _prettyprintRequest =
        _prettyPrint(options.data.toString()) ?? options.data.toString();

    _res = '$tag [${options.method}]' +
        '\nREQUEST PATH: ${options.baseUrl}${options.path}\n' +
        'REQUEST DATA: $_prettyprintRequest';
    log.i(_res);
  }

  static String? _prettyPrint(dynamic data) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String? _res;

    try {
      _res = encoder.convert(jsonDecode(data));
    } catch (e) {
      _res = null;
    }
    return _res;
  }

  static void onSuccess(String tag, Response response) {
    String _prettyprintResponse;
    String _prettyprintRequest;
    String _res;

    _prettyprintResponse = _prettyPrint(response.data) ?? response.toString();
    _prettyprintRequest =
        _prettyPrint(response.requestOptions.data.toString()) ??
            response.toString();

    _res = '$tag [${response.requestOptions.method}] STATUS CODE: ${response.statusCode}' +
        '\nREQUEST PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}\n' +
        'REQUEST DATA: $_prettyprintRequest\n' +
        'RESPONSE DATA: $_prettyprintResponse';

    log.i(_res);
  }

  static void onError(String tag, DioError error) {
    String _prettyprintResponse;
    String _prettyprintRequest;
    String _res;

    if (null != error.response) {
      _prettyprintResponse = _prettyPrint(null != error.response!.data
              ? error.response!.data.toString()
              : '') ??
          error.response!.data.toString();
      _prettyprintRequest = _prettyPrint(error.response!.requestOptions.data) ??
          error.response!.requestOptions.data.toString();

      _res = '$tag [${error.response!.requestOptions.method}] STATUS CODE: ${error.response!.statusCode}' +
          '\nERROR REQUEST PATH: ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path}' +
          '\nERROR REQUEST DATA: $_prettyprintRequest' +
          '\nERROR RESPONSE DATA: $_prettyprintResponse' +
          '\nERROR MESSAGE: ${error.message}';
    } else {
      _res = 'ERROR MESSAGE: ${error.message}';
    }

    log.i(_res);
  }
}
