import 'dart:async';
import 'package:abadus/src/config/env.dart';
import 'package:abadus/src/core/application.dart';
import 'package:abadus/src/models/api_models.dart';
import 'package:abadus/src/resources/abadus_dio_transformer.dart';
import 'package:abadus/src/utility/api/response_exceptions.dart';
import 'package:abadus/src/utility/log/dio_logger.dart';
import 'package:abadus/src/utility/log/log.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class AbadusDio extends DioForNative {
  Application? get application => Env.value!.application;

  @override
  Transformer transformer = AbadusDefaultTransformer();

  AbadusDio([BaseOptions? options]) {
    if (application != null) {
      interceptors.add(TokenInterceptor(application!.tokenFail));
    }
    if (EnvType.DEVELOPMENT == Env.value?.environmentType ||
        EnvType.STAGING == Env.value?.environmentType) {
      interceptors..add(LogInterceptor());
    }
    interceptors.add(APIInterceptor(this));
    if (application?.abadusDioInterceptors != null) {
      application?.abadusDioInterceptors!.forEach((interceptor) {
        interceptors.add(interceptor);
      });
    }
  }
}

class LogInterceptor extends InterceptorsWrapper {
  @override
  onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) async {
    String _tag = 'N/A';
    DioLogger.onSend(_tag, requestOptions);
    handler.next(requestOptions);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.responseType != ResponseType.stream) {
      DioLogger.onSuccess(
          response.requestOptions.extra["tag"] ?? 'N/A', response);
    }
    handler.next(response);
  }

  @override
  onError(DioError error, ErrorInterceptorHandler handler) async {
    DioLogger.onError(error.requestOptions.extra["tag"] ?? 'N/A', error);
    if (error.response?.statusCode != 401 &&
        error.response?.statusCode != 403) {
      handler.next(error);
    }
  }
}

class APIInterceptor extends InterceptorsWrapper {
  final AbadusDio abadusDio;

  APIInterceptor(this.abadusDio);

  Future<void> addHeaders(dynamic headers, [bool cache = false]) async {
    if (cache) {
      headers["x-cache"] = 'true';
    }
    headers["user-agent"] =
        '${abadusDio.application?.getPackageInfo.appName}/${abadusDio.application?.getPackageInfo.version}+${abadusDio.application?.getPackageInfo.buildNumber}';
    headers["accept-language"] =
        abadusDio.application?.getCurrentLanguage ?? '';

    if (headers.containsKey("requires-token")) {
      headers.remove("requires-token");
      String? _token;
      if (abadusDio.application != null) {
        _token = await abadusDio.application!.getToken;
      }
      if (_token != null) {
        headers.addAll({"authorization": '$_token'});
      } else {
        log.i('Requires token: token does not exist!!!');
      }
    }

    if (headers.containsKey("default-headers")) {
      //remove the auxiliary header
      headers.remove("default-headers");
      headers.addAll({"accept": "application/json"});
      headers.addAll({"content-type": "application/json"});
    }
  }

  @override
  onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) async {
    if (requestOptions.headers.containsKey("x-cache")) {
      requestOptions.headers.remove("x-cache");
    } else {
      await addHeaders(requestOptions.headers);
    }

    if (requestOptions.headers.containsKey("logout-if-token-fails")) {
      requestOptions.extra["logout-if-token-fails"] =
          requestOptions.headers["logout-if-token-fails"];
      requestOptions.headers.remove("logout-if-token-fails");
    }
    handler.next(requestOptions);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 200 &&
        response.statusCode! <= 299 &&
        response.data is String) {
      try {
        RestApiModel? _restApiModel;
        _restApiModel = RestApiModel.fromJson(response.data);
        if ('success' == _restApiModel!.status) {
          response.data = _restApiModel.data;
          if (_restApiModel.message?.isNotEmpty ?? false) {
            response.extra['message'] = _restApiModel.message;
          }
        }
      } catch (e) {}
    }
    return handler.next(response);
  }

  @override
  onError(DioError error, ErrorInterceptorHandler handler) async {
    DioLogger.onError(error.requestOptions.extra["tag"] ?? 'N/A', error);
    if (error.response != null && error.response!.data is String) {
      try {
        RestApiModel? _restApiModel;
        _restApiModel = RestApiModel.fromJson(error.response.toString());
        if (error.response!.statusCode! >= 400 &&
            error.response!.statusCode! <= 499) {
          //fail
          if ('fail' == _restApiModel!.status) {
            handler.next(
              ApiException.copyFromDioError(error)
                ..error = _restApiModel.message
                ..apiExceptionType = ApiExceptionType.FAIL
                ..code = _restApiModel.code
                ..response!.data = _restApiModel.data,
            );
            return;
          }
        } else if (error.response!.statusCode! >= 500 &&
            error.response!.statusCode! <= 599) {
          //error
          if ('error' == _restApiModel!.status) {
            handler.next(
              ApiException.copyFromDioError(error)
                ..apiExceptionType = ApiExceptionType.ERROR
                ..error = _restApiModel.message
                ..code = _restApiModel.code,
            );
            return;
          }
        }
      } catch (e) {
        log.i('RestApiModel serialization error: $e');
      }
    }
    handler.next(error);
  }
}

class TokenInterceptor extends InterceptorsWrapper {
  final InterceptorErrorCallback onInvalidToken;

  TokenInterceptor(this.onInvalidToken);

  @override
  onError(DioError error, ErrorInterceptorHandler handler) async {
    if ((error.requestOptions.extra.containsKey("logout-if-token-fails")) &&
        error.requestOptions.extra["logout-if-token-fails"]
                .toString()
                .toLowerCase() ==
            'false') {
      handler.next(error);
      return;
    }
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      onInvalidToken(error, handler);
      return;
    }

    handler.next(error);
  }
}
