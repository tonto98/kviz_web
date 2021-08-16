library initiative_post_success;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';
import 'package:example/700_initiatives/models/models.dart';

part 'initiative_post_success.g.dart';

abstract class InitiativePostSuccess
    implements Built<InitiativePostSuccess, InitiativePostSuccessBuilder> {
  InitiativePostSuccess._();

  factory InitiativePostSuccess([updates(InitiativePostSuccessBuilder b)]) =
      _$InitiativePostSuccess;

  @BuiltValueField(wireName: 'initiative')
  Initiative get initiative;
  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        InitiativePostSuccess.serializer, this));
  }

  static InitiativePostSuccess fromObject(Object object) {
    return standardSerializers.deserializeWith(
        InitiativePostSuccess.serializer, object);
  }

  static InitiativePostSuccess fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        InitiativePostSuccess.serializer, json.decode(jsonString));
  }

  static Serializer<InitiativePostSuccess> get serializer =>
      _$initiativePostSuccessSerializer;
}
