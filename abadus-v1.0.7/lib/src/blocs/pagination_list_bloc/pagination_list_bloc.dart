import 'dart:async';
import 'package:abadus/src/models/api_models.dart';
import 'package:abadus/src/utility/api/response_exceptions.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/api_request_bloc/api_request_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'pagination_list_event.dart';
part 'pagination_list_state.dart';

class ApiPaginationRequestBloc<Request, Response>
    extends Bloc<BlocEvent, BlocState> {
  ApiPaginationRequestBloc(
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
  final Stream<PaginationModel<Response>> Function(
      Request request, BlocState state, String? nextPageUrl)? requestFunction;
  final Function(Request request, PaginationModel<Response> successResponse)?
      afterSuccessCallback;
  final Function(Request request, String message, Map<String?, dynamic>? fail)?
      onFailCallback;
  final Function(Request request, String message)? onErrorCallback;

  Stream<PaginationModel<Response>> request(
          Request request, BlocState state, String? nextPageUrl) =>
      requestFunction!(request, state, nextPageUrl);

  void init() => onInit;

  int? dataId(Response data) => null;

  void afterSuccess(
          Request request, PaginationModel<Response> successResponse) =>
      afterSuccessCallback != null
          ? afterSuccessCallback!(request, successResponse)
          : null;

  void onFail(Request request, String message, Map<String?, dynamic>? fail) =>
      onFailCallback != null ? onFailCallback!(request, message, fail) : null;

  void onErrorResponse(Request request, String message) =>
      onErrorCallback != null ? onErrorCallback!(request, message) : null;

  bool? _sourceCache;

  String? _nextPageUrl;

  bool _hasReachedMax() {
    if (state is InitState) {
      return false;
    }

    if (_sourceCache == true) {
      return true;
    }
    if (_nextPageUrl != null) {
      return false;
    }
    return true;
  }

  bool condition(Request request) => false;

  Pagination<Response>? getCurrentStatePagination() {
    if (state is PaginationListErrorState) {
      return (state as PaginationListErrorState).pagination
          as Pagination<Response>?;
    }
    if (state is PaginationListLoadingState) {
      return (state as PaginationListLoadingState).pagination
          as Pagination<Response>?;
    }
    if (state is PaginationListSuccessState) {
      return (state as PaginationListSuccessState).pagination
          as Pagination<Response>?;
    }
    return null;
  }

  @override
  Stream<Transition<BlocEvent, BlocState>> transformEvents(
    Stream<BlocEvent> events,
    TransitionFunction<BlocEvent, BlocState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      transitionFn,
    );
  }

  @override
  Stream<BlocState> mapEventToState(
    BlocEvent event,
  ) async* {
    if (event is RequestDataEvent &&
        (!_hasReachedMax() || condition(event.request))) {
      yield PaginationListLoadingState<Response>(
        condition(event.request) ? null : getCurrentStatePagination(),
      );

      try {
        await for (PaginationModel<Response> _response
            in request(event.request, state, _nextPageUrl)) {
          List<Response>? _currentList = condition(event.request)
              ? null
              : getCurrentStatePagination()?.data ?? [];

          if (_sourceCache == true && _response.sourceCache == false) {
            _currentList = [];
          }
          // if (isSearch && _nextPageUrl == null) {
          //   _currentList = BuiltList<T>();
          // }

          _sourceCache = _response.sourceCache;
          _nextPageUrl = _response.pagination!.nextPageUrl;
          yield PaginationListSuccessState<Response>(_response.pagination!
              .copyWith(
                  data: _response.pagination!.data!
                    ..insertAll(0, _currentList!)));
          //afterSuccess(_response);
        }
      } on ApiException catch (e) {
        if (e.apiExceptionType == ApiExceptionType.FAIL) {
          RestApiFail? _restApiFail;
          String _message = e.message;
          try {
            _restApiFail = RestApiFail.fromObject(e.response?.data?.value);
            _message = _restApiFail?.message ?? e.message;
          } catch (e) {}
          yield FailState(_message,
              fail: _restApiFail?.errors?.asMap as Map<String?, dynamic>?);
          onFail(event.request, _message,
              _restApiFail?.errors?.asMap as Map<String?, dynamic>?);
        }
        if (e.apiExceptionType == ApiExceptionType.ERROR) {
          yield PaginationListErrorState<Response>(
            e.error.toString(),
            getCurrentStatePagination(),
          );
          onErrorResponse(event.request, e.error.toString());
        }
        // } on DioError catch (e) {
        //   yield PaginationListErrorState<Response>(
        //     e.error.toString(),
        //     getCurrentStatePagination(),
        //   );
        //   onErrorResponse(e.error.toString());
      } catch (e) {
        yield PaginationListErrorState<Response>(
          e.toString(),
          getCurrentStatePagination(),
        );
        onErrorResponse(event.request, e.toString());
      }
    }
    if (event is SetToInitEvent) {
      yield InitState();
    }
    if (event is RefreshDataEvent<Response>) {
      yield SuccessState(event.data);
    }
    if (event is PaginationDeleteFromListEvent &&
        state is PaginationListSuccessState) {
      Pagination<Response> _paginationsPaginaton = getCurrentStatePagination()!;

      yield PaginationListSuccessState<Response>(_paginationsPaginaton.copyWith(
        data: _paginationsPaginaton.data!
          ..removeWhere((data) => dataId(data) == event.id),
      ));
    }
    if (event is PaginationAddToListEvent &&
        state is PaginationListSuccessState) {
      Pagination<Response> _paginationsPaginaton = getCurrentStatePagination()!;

      yield PaginationListSuccessState<Response>(_paginationsPaginaton.copyWith(
        data: _paginationsPaginaton.data!..insert(0, event.data),
      ));
    }
    if (event is PaginationRefreshFromListEvent &&
        state is PaginationListSuccessState) {
      Pagination<Response> _paginationsPaginaton = getCurrentStatePagination()!;
      Map<int, Response> _paginationMap = _paginationsPaginaton.data!.asMap();
      MapEntry<int, Response>? _mapEntry =
          _paginationMap.entries.firstWhereOrNull(
        (element) => dataId(element.value) == event.data.id,
      );

      if (_mapEntry != null) {
        yield PaginationListSuccessState<Response>(
          _paginationsPaginaton.copyWith(
            data: _paginationsPaginaton.data!
              ..replaceRange(
                _mapEntry.key,
                _mapEntry.key + 1,
                [event.data],
              ),
          ),
        );
      }
    }
  }
}
