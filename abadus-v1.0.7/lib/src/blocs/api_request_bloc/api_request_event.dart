part of 'api_request_bloc.dart';

abstract class BlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetToInitEvent extends BlocEvent {}

class RequestDataEvent<T> extends BlocEvent {
  final T request;
  final bool emitLoading;
  final bool emitError;
  final bool emitFail;

  RequestDataEvent(
    this.request, {
    this.emitLoading = true,
    this.emitError = true,
    this.emitFail = true,
  });
}

class RefreshDataEvent<T> extends BlocEvent {
  final T data;

  RefreshDataEvent(this.data);
}

class SetToFailEvent extends BlocEvent {
  final String message;
  final Map<String, dynamic> fail;

  SetToFailEvent(this.message, {required this.fail});

  @override
  List<Object> get props => [message, fail];
}

class SetStateEvent extends BlocEvent {
  final BlocState state;

  SetStateEvent(this.state);

  @override
  List<Object> get props => [state];
}
