library rest_api_pagination;

class Pagination<T> {
  final int? currentPage;
  final List<T>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  Pagination({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Pagination.fromObject(Object? object, T Function(dynamic)? fromJson) {
    if (object is Map) {
      List<dynamic> items = object['data'];
      return Pagination<T>(
        currentPage: object['current_page'],
        data: List<T>.from(items.map((itemsJson) => fromJson!(itemsJson))),
        firstPageUrl: object['first_page_url'],
        from: object['from'],
        lastPage: object['last_page'],
        lastPageUrl: object['last_page_url'],
        nextPageUrl: object['next_page_url'],
        path: object['path'],
        perPage: object['per_page'],
        prevPageUrl: object['prev_page_url'],
        to: object['to'],
        total: object['total'],
      );
    }
    throw ('Object is not map');
  }

  Pagination<T> copyWith({
    int? currentPage,
    List<T>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return Pagination<T>(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }
}
