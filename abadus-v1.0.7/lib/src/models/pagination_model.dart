import 'rest_api_pagination.dart';

class PaginationModel<T> {
  final Pagination<T>? pagination;
  final bool sourceCache;

  PaginationModel({this.pagination, this.sourceCache = false});
}
