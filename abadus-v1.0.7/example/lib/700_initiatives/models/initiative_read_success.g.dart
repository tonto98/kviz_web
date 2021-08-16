// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_read_success;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitiativeReadSuccess> _$initiativeReadSuccessSerializer =
    new _$InitiativeReadSuccessSerializer();

class _$InitiativeReadSuccessSerializer
    implements StructuredSerializer<InitiativeReadSuccess> {
  @override
  final Iterable<Type> types = const [
    InitiativeReadSuccess,
    _$InitiativeReadSuccess
  ];
  @override
  final String wireName = 'InitiativeReadSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, InitiativeReadSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'initiative',
      serializers.serialize(object.initiative,
          specifiedType: const FullType(Initiative)),
    ];

    return result;
  }

  @override
  InitiativeReadSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativeReadSuccessBuilder();

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

class _$InitiativeReadSuccess extends InitiativeReadSuccess {
  @override
  final Initiative initiative;

  factory _$InitiativeReadSuccess(
          [void Function(InitiativeReadSuccessBuilder) updates]) =>
      (new InitiativeReadSuccessBuilder()..update(updates)).build();

  _$InitiativeReadSuccess._({this.initiative}) : super._() {
    if (initiative == null) {
      throw new BuiltValueNullFieldError('InitiativeReadSuccess', 'initiative');
    }
  }

  @override
  InitiativeReadSuccess rebuild(
          void Function(InitiativeReadSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativeReadSuccessBuilder toBuilder() =>
      new InitiativeReadSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitiativeReadSuccess && initiative == other.initiative;
  }

  @override
  int get hashCode {
    return $jf($jc(0, initiative.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitiativeReadSuccess')
          ..add('initiative', initiative))
        .toString();
  }
}

class InitiativeReadSuccessBuilder
    implements Builder<InitiativeReadSuccess, InitiativeReadSuccessBuilder> {
  _$InitiativeReadSuccess _$v;

  InitiativeBuilder _initiative;
  InitiativeBuilder get initiative =>
      _$this._initiative ??= new InitiativeBuilder();
  set initiative(InitiativeBuilder initiative) =>
      _$this._initiative = initiative;

  InitiativeReadSuccessBuilder();

  InitiativeReadSuccessBuilder get _$this {
    if (_$v != null) {
      _initiative = _$v.initiative?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitiativeReadSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitiativeReadSuccess;
  }

  @override
  void update(void Function(InitiativeReadSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitiativeReadSuccess build() {
    _$InitiativeReadSuccess _$result;
    try {
      _$result =
          _$v ?? new _$InitiativeReadSuccess._(initiative: initiative.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'initiative';
        initiative.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitiativeReadSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
