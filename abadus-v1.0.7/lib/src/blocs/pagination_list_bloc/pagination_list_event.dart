part of 'pagination_list_bloc.dart';

class PaginationDeleteFromListEvent extends BlocEvent {
  final int id;

  PaginationDeleteFromListEvent(this.id);

  @override
  List<Object> get props => [id];
}

class PaginationAddToListEvent<T> extends BlocEvent {
  final T data;

  PaginationAddToListEvent(this.data);

  @override
  List<Object?> get props => [data];
}

class PaginationRefreshFromListEvent<T> extends BlocEvent {
  final T data;

  PaginationRefreshFromListEvent(this.data);

  @override
  List<Object?> get props => [data];
}
