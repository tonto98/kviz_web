library initiative_read;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/010_address/models/models.dart';
import 'package:example/700_initiatives/models/models.dart';
import 'package:example/serializers.dart';

import '../../030_image/models/image_api.dart';

part 'initiative.g.dart';

abstract class Initiative implements Built<Initiative, InitiativeBuilder> {
  Initiative._();

  factory Initiative([updates(InitiativeBuilder b)]) = _$Initiative;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'title')
  String get title;
  @nullable
  @BuiltValueField(wireName: 'short_description')
  String get shortDescription;
  @nullable
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'images')
  BuiltList<ImageApi> get images;
  @nullable
  @BuiltValueField(wireName: 'address')
  Address get address;
  @nullable
  @BuiltValueField(wireName: 'committee')
  Committee get committee;
  @BuiltValueField(wireName: 'begin')
  DateTime get begin;
  @BuiltValueField(wireName: 'end')
  DateTime get end;
  @nullable
  @BuiltValueField(wireName: 'contact_email')
  String get contactEmail;
  @nullable
  @BuiltValueField(wireName: 'contact_phone')
  String get contactPhone;
  @BuiltValueField(wireName: 'num_votes')
  int get numVotes;
  @BuiltValueField(wireName: 'comments')
  BuiltList<InitiativeComment> get comments;
  @BuiltValueField(wireName: 'can_edit')
  bool get canEdit;
  @BuiltValueField(wireName: 'can_comment')
  bool get canComment;
  @BuiltValueField(wireName: 'can_delete')
  bool get canDelete;
  @BuiltValueField(wireName: 'can_vote')
  bool get canVote;
  @BuiltValueField(wireName: 'voted')
  bool get voted;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Initiative.serializer, this));
  }

  static Initiative fromObject(Object object) {
    return standardSerializers.deserializeWith(Initiative.serializer, object);
  }

  static Initiative fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Initiative.serializer, json.decode(jsonString));
  }

  static Serializer<Initiative> get serializer => _$initiativeSerializer;
}
