library initiative_committee;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';

part 'committee.g.dart';

abstract class Committee implements Built<Committee, CommitteeBuilder> {
  Committee._();

  factory Committee([updates(CommitteeBuilder b)]) = _$Committee;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'city')
  String get city;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Committee.serializer, this));
  }

  static Committee fromObject(Object object) {
    return standardSerializers.deserializeWith(Committee.serializer, object);
  }

  static Committee fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Committee.serializer, json.decode(jsonString));
  }

  static Serializer<Committee> get serializer => _$committeeSerializer;
}
