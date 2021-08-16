import 'dart:async';
import 'package:abadus/src/functions/api.dart';
import 'package:abadus/src/resources/pagination_api_helper.dart';
import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../config/env.dart';
import 'app_cache_manager.dart';

class APIProvider {
  String _tag = 'ApiProvider';

  AppCacheManager _appCacheManager = AppCacheManager();

  PaginationApiHelper? _paginationApiHelper;

  AppCacheManager get cacheManager => this._appCacheManager;

  String get tag => _tag;

  Dio get dio => this._appCacheManager.dio;

  String? get baseUrl => Env.value?.baseUrl;

  PaginationApiHelper? get paginationApiHelper => this._paginationApiHelper;

  Stream<T> getCachedData<T>(
      {required T Function(Object) serializationFunction,
      String? url,
      Map<String, String>? headers,
      Stream<FileInfo> Function()? fetcher}) async* {
    Stream<FileInfo> _streamSource;
    if (fetcher != null) {
      _streamSource = fetcher();
    } else {
      _streamSource = cacheManager.getFileCacheDownload(url!, headers: headers);
    }
    await for (FileInfo fileInfo in _streamSource) {
      JsonObject _jsonObject =
          await (Api.fileSerialization(fileInfo.file) as FutureOr<JsonObject>);
      yield serializationFunction(_jsonObject.value);
    }
  }

  APIProvider() {
    _paginationApiHelper = PaginationApiHelper(cacheManager);
    dio.options =
        BaseOptions(baseUrl: baseUrl!, responseType: ResponseType.plain);
  }
}
