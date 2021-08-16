library initiative_create_post;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';
import 'package:example/010_address/models/models.dart';

part 'initiative_post.g.dart';

abstract class InitiativePost
    implements Built<InitiativePost, InitiativePostBuilder> {
  InitiativePost._();

  factory InitiativePost([updates(InitiativePostBuilder b)]) = _$InitiativePost;

  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'begin')
  String get begin;
  @BuiltValueField(wireName: 'end')
  String get end;
  @BuiltValueField(wireName: 'local_committee_id')
  int get localCommitteeId;
  @nullable
  @BuiltValueField(wireName: 'contact_phone')
  String get contactPhone;
  @nullable
  @BuiltValueField(wireName: 'contact_email')
  String get contactEmail;
  @nullable
  @BuiltValueField(wireName: 'address')
  Address get address;
  @BuiltValueField(wireName: 'upload_buffer_id')
  String get uploadBufferId;
  @nullable
  @BuiltValueField(wireName: 'deleted_ids')
  BuiltList<int> get deletedIds;
  @nullable
  @BuiltValueField(wireName: 'deleted_uuids')
  BuiltList<String> get deletedUuids;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(InitiativePost.serializer, this));
  }

  static InitiativePost fromObject(Object object) {
    return standardSerializers.deserializeWith(
        InitiativePost.serializer, object);
  }

  static InitiativePost fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        InitiativePost.serializer, json.decode(jsonString));
  }

  static Serializer<InitiativePost> get serializer =>
      _$initiativePostSerializer;
}
