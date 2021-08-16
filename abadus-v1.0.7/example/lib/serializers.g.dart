// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Address.serializer)
      ..add(Committee.serializer)
      ..add(CommitteesSuccess.serializer)
      ..add(ImageApi.serializer)
      ..add(Initiative.serializer)
      ..add(InitiativeComment.serializer)
      ..add(InitiativeCommentSuccess.serializer)
      ..add(InitiativePost.serializer)
      ..add(InitiativePostSuccess.serializer)
      ..add(InitiativeReadSuccess.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Committee)]),
          () => new ListBuilder<Committee>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ImageApi)]),
          () => new ListBuilder<ImageApi>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(InitiativeComment)]),
          () => new ListBuilder<InitiativeComment>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
