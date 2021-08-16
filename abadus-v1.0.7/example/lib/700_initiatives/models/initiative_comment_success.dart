library initiative_comment_success;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';
import 'package:example/700_initiatives/models/models.dart';

part 'initiative_comment_success.g.dart';

abstract class InitiativeCommentSuccess
    implements
        Built<InitiativeCommentSuccess, InitiativeCommentSuccessBuilder> {
  InitiativeCommentSuccess._();

  factory InitiativeCommentSuccess(
          [updates(InitiativeCommentSuccessBuilder b)]) =
      _$InitiativeCommentSuccess;

  @BuiltValueField(wireName: 'initiative_comment')
  InitiativeComment get initiativeComment;
  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        InitiativeCommentSuccess.serializer, this));
  }

  static InitiativeCommentSuccess fromObject(Object object) {
    return standardSerializers.deserializeWith(
        InitiativeCommentSuccess.serializer, object);
  }

  static InitiativeCommentSuccess fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        InitiativeCommentSuccess.serializer, json.decode(jsonString));
  }

  static Serializer<InitiativeCommentSuccess> get serializer =>
      _$initiativeCommentSuccessSerializer;
}
