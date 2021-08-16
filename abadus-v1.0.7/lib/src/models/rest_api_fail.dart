library rest_api_fail;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import './api_serializers.dart';

part 'rest_api_fail.g.dart';

abstract class RestApiFail implements Built<RestApiFail, RestApiFailBuilder> {
  RestApiFail._();

  factory RestApiFail([updates(RestApiFailBuilder b)?]) = _$RestApiFail;

  @nullable
  @BuiltValueField(wireName: 'message')
  String? get message;
  @nullable
  @BuiltValueField(wireName: 'errors')
  JsonObject? get errors;
  String toJson() {
    return json
        .encode(apiSerializers.serializeWith(RestApiFail.serializer, this));
  }

  static RestApiFail? fromObject(Object? object) {
    return apiSerializers.deserializeWith(RestApiFail.serializer, object);
  }

  static RestApiFail? fromJson(String jsonString) {
    return apiSerializers.deserializeWith(
        RestApiFail.serializer, json.decode(jsonString));
  }

  static Serializer<RestApiFail> get serializer => _$restApiFailSerializer;
}
