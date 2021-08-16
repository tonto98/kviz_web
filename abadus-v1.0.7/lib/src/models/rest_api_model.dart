library rest_api_model;

import 'dart:convert';

import 'api_serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
//import 'package:example/serializers.dart';

part 'rest_api_model.g.dart';

abstract class RestApiModel
    implements Built<RestApiModel, RestApiModelBuilder> {
  RestApiModel._();

  factory RestApiModel([updates(RestApiModelBuilder b)?]) = _$RestApiModel;

  @BuiltValueField(wireName: 'status')
  String? get status;
  @nullable
  @BuiltValueField(wireName: 'data')
  JsonObject? get data;
  @nullable
  @BuiltValueField(wireName: 'message')
  String? get message;
  @nullable
  @BuiltValueField(wireName: 'code')
  int? get code;
  String toJson() {
    return json.encode(
        apiSerializers.serializeWith(RestApiModel.serializer, this));
  }

  static RestApiModel? fromObject(Object object) {
    return apiSerializers.deserializeWith(RestApiModel.serializer, object);
  }

  static RestApiModel? fromJson(String jsonString) {
    return apiSerializers.deserializeWith(
        RestApiModel.serializer, json.decode(jsonString));
  }

  static Serializer<RestApiModel> get serializer => _$restApiModelSerializer;
}
