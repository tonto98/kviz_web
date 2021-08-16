library initiative_comment;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';

part 'initiative_comment.g.dart';

abstract class InitiativeComment
    implements Built<InitiativeComment, InitiativeCommentBuilder> {
  InitiativeComment._();

  factory InitiativeComment([updates(InitiativeCommentBuilder b)]) =
      _$InitiativeComment;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'user_name')
  String get userName;
  @BuiltValueField(wireName: 'contents')
  String get contents;
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;
  @BuiltValueField(wireName: 'can_edit')
  bool get canEdit;
  @BuiltValueField(wireName: 'can_delete')
  bool get canDelete;
  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(InitiativeComment.serializer, this));
  }

  static InitiativeComment fromObject(Object object) {
    return standardSerializers.deserializeWith(
        InitiativeComment.serializer, object);
  }

  static InitiativeComment fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        InitiativeComment.serializer, json.decode(jsonString));
  }

  static Serializer<InitiativeComment> get serializer =>
      _$initiativeCommentSerializer;
}
