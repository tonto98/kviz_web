import 'package:dio/dio.dart';

enum ApiExceptionType {
  ERROR,
  FAIL,
}

class ApiException extends DioError {
  ApiException({
    required this.requestOptions,
    this.response,
    this.type = DioErrorType.other,
    this.error,
  }) : super(requestOptions: requestOptions);

  /// Request info.
  @override
  RequestOptions requestOptions;

  /// Response info, it may be `null` if the request can't reach to
  /// the http server, for example, occurring a dns error, network is not available.
  Response? response;

  DioErrorType type;

  /// The original error/exception object; It's usually not null when `type`
  /// is DioErrorType.DEFAULT
  dynamic error;

  set code(int? code) {
    this.response!.extra["code"] = code;
  }

  int? get code {
    return this.response!.extra['code'];
  }

  set apiExceptionType(ApiExceptionType? apiExceptionType) {
    this.response!.extra["apiExceptionType"] = apiExceptionType;
  }

  ApiExceptionType? get apiExceptionType {
    return this.response!.extra['apiExceptionType'];
  }

  String get message => (error?.toString() ?? '');

  static ApiException copyFromDioError(DioError dioError) {
    return ApiException(
      requestOptions: dioError.requestOptions,
      response: dioError.response,
      type: dioError.type,
      error: dioError.error,
    );
  }
}
