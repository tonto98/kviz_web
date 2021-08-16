// GENERATED CODE - DO NOT MODIFY BY HAND

part of address;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Address> _$addressSerializer = new _$AddressSerializer();

class _$AddressSerializer implements StructuredSerializer<Address> {
  @override
  final Iterable<Type> types = const [Address, _$Address];
  @override
  final String wireName = 'Address';

  @override
  Iterable<Object> serialize(Serializers serializers, Address object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'postal_code',
      serializers.serialize(object.postalCode,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.streetName != null) {
      result
        ..add('street_name')
        ..add(serializers.serialize(object.streetName,
            specifiedType: const FullType(String)));
    }
    if (object.houseNumber != null) {
      result
        ..add('house_number')
        ..add(serializers.serialize(object.houseNumber,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Address deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressBuilder();

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
        case 'street_name':
          result.streetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'house_number':
          result.houseNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postal_code':
          result.postalCode = serializers.deserialize(value,
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

class _$Address extends Address {
  @override
  final int id;
  @override
  final String streetName;
  @override
  final String houseNumber;
  @override
  final String postalCode;
  @override
  final String city;

  factory _$Address([void Function(AddressBuilder) updates]) =>
      (new AddressBuilder()..update(updates)).build();

  _$Address._(
      {this.id, this.streetName, this.houseNumber, this.postalCode, this.city})
      : super._() {
    if (postalCode == null) {
      throw new BuiltValueNullFieldError('Address', 'postalCode');
    }
    if (city == null) {
      throw new BuiltValueNullFieldError('Address', 'city');
    }
  }

  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => new AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        id == other.id &&
        streetName == other.streetName &&
        houseNumber == other.houseNumber &&
        postalCode == other.postalCode &&
        city == other.city;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), streetName.hashCode),
                houseNumber.hashCode),
            postalCode.hashCode),
        city.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Address')
          ..add('id', id)
          ..add('streetName', streetName)
          ..add('houseNumber', houseNumber)
          ..add('postalCode', postalCode)
          ..add('city', city))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _streetName;
  String get streetName => _$this._streetName;
  set streetName(String streetName) => _$this._streetName = streetName;

  String _houseNumber;
  String get houseNumber => _$this._houseNumber;
  set houseNumber(String houseNumber) => _$this._houseNumber = houseNumber;

  String _postalCode;
  String get postalCode => _$this._postalCode;
  set postalCode(String postalCode) => _$this._postalCode = postalCode;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  AddressBuilder();

  AddressBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _streetName = _$v.streetName;
      _houseNumber = _$v.houseNumber;
      _postalCode = _$v.postalCode;
      _city = _$v.city;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Address build() {
    final _$result = _$v ??
        new _$Address._(
            id: id,
            streetName: streetName,
            houseNumber: houseNumber,
            postalCode: postalCode,
            city: city);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
