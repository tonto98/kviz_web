library initiative_image;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'image_api.g.dart';

abstract class ImageApi implements Built<ImageApi, ImageApiBuilder> {
  ImageApi._();

  factory ImageApi([updates(ImageApiBuilder b)]) = _$ImageApi;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'url')
  String get url;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(ImageApi.serializer, this));
  }

  static ImageApi fromObject(Object object) {
    return standardSerializers.deserializeWith(ImageApi.serializer, object);
  }

  static ImageApi fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        ImageApi.serializer, json.decode(jsonString));
  }

  static Serializer<ImageApi> get serializer => _$imageApiSerializer;
}
