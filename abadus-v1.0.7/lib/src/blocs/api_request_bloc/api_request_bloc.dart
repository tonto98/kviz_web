import 'dart:async';
import 'package:abadus/abadus.dart';
import 'package:abadus/src/models/rest_api_fail.dart';
import 'package:abadus/src/utility/api/response_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'api_request_event.dart';
part 'api_request_state.dart';

class ApiRequestBloc<Request, Response> extends Bloc<BlocEvent, BlocState> {
  ApiRequestBloc(
      {this.initState,
      this.onInit,
      this.requestFunction,
      this.afterSuccessCallback,
      this.onFailCallback,
      this.onErrorCallback})
      : super(initState ?? InitState()) {
    init();
  }

  final BlocState? initState;
  final Function()? onInit;
  final Stream<Response> Function(Request? request)? requestFunction;
  final Function(Request? request, Response successResponse)?
      afterSuccessCallback;
  final Function(Request? request, String message, Map<String?, dynamic>? fail)?
      onFailCallback;
  final Function(Request? request, String message)? onErrorCallback;

  Stream<Response> request(Request? request) => requestFunction!(request);

  void init() => onInit;

  void afterSuccess(Request? request, Response successResponse) =>
      afterSuccessCallback != null
          ? afterSuccessCallback!(request, successResponse)
          : null;

  void onFail(Request? request, String message, Map<String?, dynamic>? fail) =>
      onFailCallback != null ? onFailCallback!(request, message, fail) : null;

  void onErrorResponse(Request? request, String message) =>
      onErrorCallback != null ? onErrorCallback!(request, message) : null;

  @override
  Stream<BlocState> mapEventToState(
    BlocEvent event,
  ) async* {
    if (event is RequestDataEvent) {
      if (event.emitLoading) yield LoadingState();
      try {
        await for (Response _response in request(event.request)) {
          yield SuccessState(_response);
          afterSuccess(event.request, _response);
        }
      } on ApiException catch (e) {
        if (e.apiExceptionType == ApiExceptionType.FAIL) {
          RestApiFail? _restApiFail;
          String _message = e.message;
          try {
            _restApiFail = RestApiFail.fromObject(e.response?.data?.value);
            _message = _restApiFail?.message ?? e.message;
          } catch (e) {}
          if (event.emitFail) {
            yield FailState(_message,
                fail: _restApiFail?.errors?.asMap as Map<String?, dynamic>?);
          }
          onFail(event.request, _message,
              _restApiFail?.errors?.asMap as Map<String?, dynamic>?);
        }
        if (e.apiExceptionType == ApiExceptionType.ERROR) {
          if (event.emitError) {
            yield ErrorState(message: e.error.toString());
          }
          onErrorResponse(event.request, e.error.toString());
        }
      } on DioError catch (e) {
        if (event.emitError) {
          yield ErrorState(message: e.toString());
        }
        onErrorResponse(event.request, e.error.toString());
      } catch (e) {
        if (event.emitError) {
          yield ErrorState(message: e.toString());
        }
        onErrorResponse(event.request, e.toString());
      }
    }
    if (event is SetToInitEvent) {
      yield InitState();
    }
    if (event is RefreshDataEvent<Response>) {
      yield SuccessState(event.data);
      afterSuccess(null, event.data);
    }

    if (event is SetToFailEvent) {
      yield FailState(event.message, fail: event.fail);
    }
    if (event is SetStateEvent) {
      yield event.state;
    }
  }
}
