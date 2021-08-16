// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_comment_success;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitiativeCommentSuccess> _$initiativeCommentSuccessSerializer =
    new _$InitiativeCommentSuccessSerializer();

class _$InitiativeCommentSuccessSerializer
    implements StructuredSerializer<InitiativeCommentSuccess> {
  @override
  final Iterable<Type> types = const [
    InitiativeCommentSuccess,
    _$InitiativeCommentSuccess
  ];
  @override
  final String wireName = 'InitiativeCommentSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, InitiativeCommentSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'initiative_comment',
      serializers.serialize(object.initiativeComment,
          specifiedType: const FullType(InitiativeComment)),
    ];

    return result;
  }

  @override
  InitiativeCommentSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativeCommentSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'initiative_comment':
          result.initiativeComment.replace(serializers.deserialize(value,
                  specifiedType: const FullType(InitiativeComment))
              as InitiativeComment);
          break;
      }
    }

    return result.build();
  }
}

class _$InitiativeCommentSuccess extends InitiativeCommentSuccess {
  @override
  final InitiativeComment initiativeComment;

  factory _$InitiativeCommentSuccess(
          [void Function(InitiativeCommentSuccessBuilder) updates]) =>
      (new InitiativeCommentSuccessBuilder()..update(updates)).build();

  _$InitiativeCommentSuccess._({this.initiativeComment}) : super._() {
    if (initiativeComment == null) {
      throw new BuiltValueNullFieldError(
          'InitiativeCommentSuccess', 'initiativeComment');
    }
  }

  @override
  InitiativeCommentSuccess rebuild(
          void Function(InitiativeCommentSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativeCommentSuccessBuilder toBuilder() =>
      new InitiativeCommentSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitiativeCommentSuccess &&
        initiativeComment == other.initiativeComment;
  }

  @override
  int get hashCode {
    return $jf($jc(0, initiativeComment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitiativeCommentSuccess')
          ..add('initiativeComment', initiativeComment))
        .toString();
  }
}

class InitiativeCommentSuccessBuilder
    implements
        Builder<InitiativeCommentSuccess, InitiativeCommentSuccessBuilder> {
  _$InitiativeCommentSuccess _$v;

  InitiativeCommentBuilder _initiativeComment;
  InitiativeCommentBuilder get initiativeComment =>
      _$this._initiativeComment ??= new InitiativeCommentBuilder();
  set initiativeComment(InitiativeCommentBuilder initiativeComment) =>
      _$this._initiativeComment = initiativeComment;

  InitiativeCommentSuccessBuilder();

  InitiativeCommentSuccessBuilder get _$this {
    if (_$v != null) {
      _initiativeComment = _$v.initiativeComment?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitiativeCommentSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitiativeCommentSuccess;
  }

  @override
  void update(void Function(InitiativeCommentSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitiativeCommentSuccess build() {
    _$InitiativeCommentSuccess _$result;
    try {
      _$result = _$v ??
          new _$InitiativeCommentSuccess._(
              initiativeComment: initiativeComment.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'initiativeComment';
        initiativeComment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitiativeCommentSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
