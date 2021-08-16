library committees_success;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';
import 'package:example/010_address/models/committee.dart';
import 'package:example/010_address/models/models.dart';

part 'committees_success.g.dart';

abstract class CommitteesSuccess
    implements Built<CommitteesSuccess, CommitteesSuccessBuilder> {
  CommitteesSuccess._();

  factory CommitteesSuccess([updates(CommitteesSuccessBuilder b)]) =
      _$CommitteesSuccess;

  @BuiltValueField(wireName: 'committees')
  BuiltList<Committee> get committees;
  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(CommitteesSuccess.serializer, this));
  }

  static CommitteesSuccess fromObject(Object object) {
    return standardSerializers.deserializeWith(
        CommitteesSuccess.serializer, object);
  }

  static CommitteesSuccess fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        CommitteesSuccess.serializer, json.decode(jsonString));
  }

  static Serializer<CommitteesSuccess> get serializer =>
      _$committeesSuccessSerializer;
}
