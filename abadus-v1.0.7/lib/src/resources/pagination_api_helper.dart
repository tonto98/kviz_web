import 'dart:async';

import 'package:abadus/src/functions/api.dart';
import 'package:abadus/src/models/api_models.dart';
import 'package:abadus/src/resources/app_cache_manager.dart';
import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PaginationApiHelper {
  final AppCacheManager cacheManager;

  Dio get dio => cacheManager.dio;

  PaginationApiHelper(this.cacheManager);

  Stream<PaginationModel<T>> getDataListWithCache<T>(
      {String? url,
      Map<String, String>? headers,
      Stream<FileInfo> Function()? fetcher,
      T Function(dynamic)? fromJson}) async* {
    Stream<FileInfo> _streamSource;
    if (fetcher != null) {
      _streamSource = fetcher();
    } else {
      _streamSource = cacheManager.getFileCacheDownload(url!, headers: headers);
    }

    await for (FileInfo fileInfo in _streamSource) {
      JsonObject _jsonObject =
          await (Api.fileSerialization(fileInfo.file) as FutureOr<JsonObject>);

      Pagination<T> _pagination = Pagination<T>.fromObject(
          (_jsonObject.value as Map)['pagination'], fromJson);

      yield PaginationModel<T>(
        pagination: _pagination,
        sourceCache: fileInfo.source == FileSource.Online ? false : true,
      );
    }
  }

  Future<PaginationModel<T>> getDataList<T>(String url,
      {Map<String, String>? headers,
      String? nextPageUrl,
      T Function(dynamic)? fromJson}) async {
    String _path = nextPageUrl ?? url;
    Response _response = await dio.get(
      _path,
      options: Options(headers: headers),
    );

    Pagination<T> _pagination =
        Pagination<T>.fromObject(_response.data.value['pagination'], fromJson);
    return PaginationModel<T>(
      pagination: _pagination,
      sourceCache: false,
    );
  }
}
