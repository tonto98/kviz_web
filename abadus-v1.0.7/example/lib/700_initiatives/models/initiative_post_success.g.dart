// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_post_success;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitiativePostSuccess> _$initiativePostSuccessSerializer =
    new _$InitiativePostSuccessSerializer();

class _$InitiativePostSuccessSerializer
    implements StructuredSerializer<InitiativePostSuccess> {
  @override
  final Iterable<Type> types = const [
    InitiativePostSuccess,
    _$InitiativePostSuccess
  ];
  @override
  final String wireName = 'InitiativePostSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, InitiativePostSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'initiative',
      serializers.serialize(object.initiative,
          specifiedType: const FullType(Initiative)),
    ];

    return result;
  }

  @override
  InitiativePostSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativePostSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'initiative':
          result.initiative.replace(serializers.deserialize(value,
              specifiedType: const FullType(Initiative)) as Initiative);
          break;
      }
    }

    return result.build();
  }
}

class _$InitiativePostSuccess extends InitiativePostSuccess {
  @override
  final Initiative initiative;

  factory _$InitiativePostSuccess(
          [void Function(InitiativePostSuccessBuilder) updates]) =>
      (new InitiativePostSuccessBuilder()..update(updates)).build();

  _$InitiativePostSuccess._({this.initiative}) : super._() {
    if (initiative == null) {
      throw new BuiltValueNullFieldError('InitiativePostSuccess', 'initiative');
    }
  }

  @override
  InitiativePostSuccess rebuild(
          void Function(InitiativePostSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativePostSuccessBuilder toBuilder() =>
      new InitiativePostSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitiativePostSuccess && initiative == other.initiative;
  }

  @override
  int get hashCode {
    return $jf($jc(0, initiative.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitiativePostSuccess')
          ..add('initiative', initiative))
        .toString();
  }
}

class InitiativePostSuccessBuilder
    implements Builder<InitiativePostSuccess, InitiativePostSuccessBuilder> {
  _$InitiativePostSuccess _$v;

  InitiativeBuilder _initiative;
  InitiativeBuilder get initiative =>
      _$this._initiative ??= new InitiativeBuilder();
  set initiative(InitiativeBuilder initiative) =>
      _$this._initiative = initiative;

  InitiativePostSuccessBuilder();

  InitiativePostSuccessBuilder get _$this {
    if (_$v != null) {
      _initiative = _$v.initiative?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitiativePostSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitiativePostSuccess;
  }

  @override
  void update(void Function(InitiativePostSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitiativePostSuccess build() {
    _$InitiativePostSuccess _$result;
    try {
      _$result =
          _$v ?? new _$InitiativePostSuccess._(initiative: initiative.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'initiative';
        initiative.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitiativePostSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
