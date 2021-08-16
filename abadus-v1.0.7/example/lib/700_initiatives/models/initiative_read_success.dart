library initiative_read_success;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';
import 'package:example/700_initiatives/models/models.dart';

part 'initiative_read_success.g.dart';

abstract class InitiativeReadSuccess
    implements Built<InitiativeReadSuccess, InitiativeReadSuccessBuilder> {
  InitiativeReadSuccess._();

  factory InitiativeReadSuccess([updates(InitiativeReadSuccessBuilder b)]) =
      _$InitiativeReadSuccess;

  @BuiltValueField(wireName: 'initiative')
  Initiative get initiative;
  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        InitiativeReadSuccess.serializer, this));
  }

  static InitiativeReadSuccess fromObject(Object object) {
    return standardSerializers.deserializeWith(
        InitiativeReadSuccess.serializer, object);
  }

  static InitiativeReadSuccess fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        InitiativeReadSuccess.serializer, json.decode(jsonString));
  }

  static Serializer<InitiativeReadSuccess> get serializer =>
      _$initiativeReadSuccessSerializer;
}
