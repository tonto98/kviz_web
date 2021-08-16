import 'package:abadus/abadus.dart';
import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:example/700_initiatives/models/models.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as cache;

//https://kastapp.matteo.devpc.exevio.com/api

class InitiativeApiProvider extends APIProvider {
  static const String _INITIATIVES_LIST = '/citizens-initiatives';

  Map<String, String> _headers = {
    "requires-token": "",
    "default-headers": "",
  };

  Stream<PaginationModel<Initiative>> getInitiativeListWithCache() {
    return paginationApiHelper.getDataListWithCache<Initiative>(
      fromJson: (object) => Initiative.fromObject(object),
      url: _INITIATIVES_LIST,
      headers: {
        "requires-token": "",
        "default-headers": "",
      },
    );
  }

  Future<PaginationModel<Initiative>> getInitiativeList(
      String nextPageUrl) async {    
    return await paginationApiHelper.getDataList<Initiative>(
      _INITIATIVES_LIST,
      headers: {
        "requires-token": "",
        "default-headers": "",
      },
      fromJson: (object) => Initiative.fromObject(object),
    );
  }

  // Future<PaginationModel<Initiative>> getInitiativeList(
  //     String nextPageUrl) async {    
  //   Response _response = await dio.get(
  //     nextPageUrl ?? _INITIATIVES_LIST,
  //     options: Options(headers: Map.from(_headers)),
  //   );
  //   Pagination<Initiative> _pagination = Pagination<Initiative>.fromObject(
  //       (_response.data.value as Map)['pagination'],
  //       (object) => Initiative.fromObject(object));

  //   return PaginationModel(
  //     pagination: _pagination,
  //     sourceCache: false,
  //   );
  // }

  Future<InitiativePostSuccess> updateInitiative(
      InitiativePost initiative, int id) async {
    Response _response = await dio.post(
      _INITIATIVES_LIST + '/' + id.toString(),
      data: initiative.toJson(),
      options: Options(
        headers: _headers,
      ),
    );
    return InitiativePostSuccess.fromObject(_response.data.value);
  }

  Future<InitiativePostSuccess> createInitiative(
      InitiativePost initiative) async {
    Response _response = await dio.post(
      _INITIATIVES_LIST,
      data: initiative.toJson(),
      options: Options(
        headers: Map.from(_headers),
      ),
    );
    return InitiativePostSuccess.fromObject(_response.data.value);
  }

  Stream<InitiativeReadSuccess> getInitiative(int id) async* {
    Stream<cache.FileInfo> _streamSource = cacheManager.getFileCacheDownload(
        _INITIATIVES_LIST + '/' + id.toString(),
        headers: Map.from(_headers));

    await for (cache.FileInfo fileInfo in _streamSource) {
      JsonObject _jsonObject = await Api.fileSerialization(fileInfo.file);
      yield InitiativeReadSuccess.fromObject(_jsonObject.value);
    }
  }

  Future<InitiativeReadSuccess> getInitiativeNoCache(int id) async {
    Response _response = await dio.get(
      _INITIATIVES_LIST + '/' + id.toString(),
      options: Options(
        headers: Map.from(_headers),
      ),
    );

    return InitiativeReadSuccess.fromObject(_response.data.value);
  }
}
