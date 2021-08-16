part of 'pagination_list_bloc.dart';

class PaginationListErrorState<T> extends ErrorState {
  final String message;
  final Pagination<T>? pagination; //

  PaginationListErrorState(this.message, this.pagination)
      : super(message: message);

  @override
  List<Object?> get props => [message, pagination];
}

class PaginationListLoadingState<T> extends LoadingState {
  final Pagination<T>? pagination;

  PaginationListLoadingState(this.pagination);

  @override
  List<Object?> get props => [pagination];
}

class PaginationListSuccessState<T> extends SuccessState<Pagination<T>> {
  final Pagination<T> pagination;

  PaginationListSuccessState(this.pagination) : super(pagination);

  @override
  List<Object> get props => [pagination];
}
