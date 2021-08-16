// GENERATED CODE - DO NOT MODIFY BY HAND

part of committees_success;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommitteesSuccess> _$committeesSuccessSerializer =
    new _$CommitteesSuccessSerializer();

class _$CommitteesSuccessSerializer
    implements StructuredSerializer<CommitteesSuccess> {
  @override
  final Iterable<Type> types = const [CommitteesSuccess, _$CommitteesSuccess];
  @override
  final String wireName = 'CommitteesSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, CommitteesSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'committees',
      serializers.serialize(object.committees,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Committee)])),
    ];

    return result;
  }

  @override
  CommitteesSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommitteesSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'committees':
          result.committees.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Committee)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CommitteesSuccess extends CommitteesSuccess {
  @override
  final BuiltList<Committee> committees;

  factory _$CommitteesSuccess(
          [void Function(CommitteesSuccessBuilder) updates]) =>
      (new CommitteesSuccessBuilder()..update(updates)).build();

  _$CommitteesSuccess._({this.committees}) : super._() {
    if (committees == null) {
      throw new BuiltValueNullFieldError('CommitteesSuccess', 'committees');
    }
  }

  @override
  CommitteesSuccess rebuild(void Function(CommitteesSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommitteesSuccessBuilder toBuilder() =>
      new CommitteesSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommitteesSuccess && committees == other.committees;
  }

  @override
  int get hashCode {
    return $jf($jc(0, committees.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommitteesSuccess')
          ..add('committees', committees))
        .toString();
  }
}

class CommitteesSuccessBuilder
    implements Builder<CommitteesSuccess, CommitteesSuccessBuilder> {
  _$CommitteesSuccess _$v;

  ListBuilder<Committee> _committees;
  ListBuilder<Committee> get committees =>
      _$this._committees ??= new ListBuilder<Committee>();
  set committees(ListBuilder<Committee> committees) =>
      _$this._committees = committees;

  CommitteesSuccessBuilder();

  CommitteesSuccessBuilder get _$this {
    if (_$v != null) {
      _committees = _$v.committees?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommitteesSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CommitteesSuccess;
  }

  @override
  void update(void Function(CommitteesSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommitteesSuccess build() {
    _$CommitteesSuccess _$result;
    try {
      _$result =
          _$v ?? new _$CommitteesSuccess._(committees: committees.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'committees';
        committees.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommitteesSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
