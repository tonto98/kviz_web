// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_committee;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Committee> _$committeeSerializer = new _$CommitteeSerializer();

class _$CommitteeSerializer implements StructuredSerializer<Committee> {
  @override
  final Iterable<Type> types = const [Committee, _$Committee];
  @override
  final String wireName = 'Committee';

  @override
  Iterable<Object> serialize(Serializers serializers, Committee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Committee deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommitteeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Committee extends Committee {
  @override
  final int id;
  @override
  final String name;
  @override
  final String city;

  factory _$Committee([void Function(CommitteeBuilder) updates]) =>
      (new CommitteeBuilder()..update(updates)).build();

  _$Committee._({this.id, this.name, this.city}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Committee', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Committee', 'name');
    }
    if (city == null) {
      throw new BuiltValueNullFieldError('Committee', 'city');
    }
  }

  @override
  Committee rebuild(void Function(CommitteeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommitteeBuilder toBuilder() => new CommitteeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Committee &&
        id == other.id &&
        name == other.name &&
        city == other.city;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), city.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Committee')
          ..add('id', id)
          ..add('name', name)
          ..add('city', city))
        .toString();
  }
}

class CommitteeBuilder implements Builder<Committee, CommitteeBuilder> {
  _$Committee _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  CommitteeBuilder();

  CommitteeBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _city = _$v.city;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Committee other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Committee;
  }

  @override
  void update(void Function(CommitteeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Committee build() {
    final _$result = _$v ?? new _$Committee._(id: id, name: name, city: city);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
