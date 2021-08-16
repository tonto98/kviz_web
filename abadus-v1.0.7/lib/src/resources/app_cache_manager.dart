import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'dart:async';
import 'package:http/http.dart' as http;
import 'abadus_dio.dart';
import 'package:flutter_cache_manager/src/storage/file_system/file_system_io.dart';

class AppCacheManager {
  static Dio _dio = AbadusDio();

  static const key = 'appCache';
  static late final AppCacheManager _instance;
  static bool _isInstanceCreated = false;

  static final CacheManager _cacheManager = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 20,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileSystem: IOFileSystem(key),
      fileService: DioFileService(dio: _dio),
    ),
  );

  factory AppCacheManager() {
    if (_isInstanceCreated == false) {
      _instance = AppCacheManager._();
    }
    _isInstanceCreated = true;
    return _instance;
  }

  AppCacheManager._();

  AbadusDio get dio => _dio as AbadusDio;

  /// Get the file from the cache and/or online, depending on availability and age.
  /// Downloaded form [url], [headers] can be used for example for authentication.
  /// The files are returned as stream. First the cached file if available,
  /// downloaded file is returned afterwards.
  Stream<FileInfo> getFileCacheDownload(String url,
      {Map<String, String>? headers, String? tag}) async* {
    var cacheFile = await _cacheManager.getFileFromCache(url);
    if (cacheFile != null) {
      yield cacheFile;
    }
    try {
      FileInfo webFile = await _cacheManager.downloadFile(url,
          authHeaders: headers, force: true);
      yield webFile;
    } catch (e) {
      if (cacheFile == null) {
        throw e;
      }
    }
  }

  Future<FileInfo?> getFileFromInternetOrCache(String url,
      {Map<String, String>? headers, String? tag}) async {
    try {
      FileInfo webFile =
          await _cacheManager.downloadFile(url, authHeaders: headers);
      return webFile;
    } catch (e) {
      var cacheFile = await _cacheManager.getFileFromCache(url);
      if (cacheFile == null) {
        throw e;
      } else {
        return cacheFile;
      }
    }
  }
}

class DioFileService implements FileService {
  late Dio _dio;
  DioFileService({Dio? dio}) {
    _dio = dio ?? AbadusDio();
  }

  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers = const {}}) async {
    String? _tag;
    if (headers != null) _tag = headers['X-Tag'];
    Response<ResponseBody> _dioResponse = await _dio.get<ResponseBody>(
      url,
      options: Options(
        responseType: ResponseType.stream,
        extra: _tag != null ? {"tag": _tag} : null,
        headers: headers,
      ),
    );
    return HttpGetResponse(
      http.StreamedResponse(_dioResponse.data!.stream, _dioResponse.statusCode!,
          headers: _dioResponse.headers.map.map(
              (key, value) => MapEntry<String, String>(key, value.join(','))),
          isRedirect: _dioResponse.isRedirect!),
    );
  }

  @override
  int concurrentFetches = 10;
}
