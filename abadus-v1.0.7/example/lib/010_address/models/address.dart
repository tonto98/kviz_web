library address;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';

part 'address.g.dart';

abstract class Address implements Built<Address, AddressBuilder> {
  Address._();

  factory Address([updates(AddressBuilder b)]) = _$Address;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;
  @nullable
  @BuiltValueField(wireName: 'street_name')
  String get streetName;
  @nullable
  @BuiltValueField(wireName: 'house_number')
  String get houseNumber;
  @BuiltValueField(wireName: 'postal_code')
  String get postalCode;
  @BuiltValueField(wireName: 'city')
  String get city;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Address.serializer, this));
  }

  static Address fromObject(Object object) {
    return standardSerializers.deserializeWith(Address.serializer, object);
  }

  static Address fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Address.serializer, json.decode(jsonString));
  }

  static Serializer<Address> get serializer => _$addressSerializer;
}
