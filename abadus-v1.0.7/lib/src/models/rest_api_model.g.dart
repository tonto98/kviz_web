// GENERATED CODE - DO NOT MODIFY BY HAND

part of rest_api_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestApiModel> _$restApiModelSerializer =
    new _$RestApiModelSerializer();

class _$RestApiModelSerializer implements StructuredSerializer<RestApiModel> {
  @override
  final Iterable<Type> types = const [RestApiModel, _$RestApiModel];
  @override
  final String wireName = 'RestApiModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RestApiModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(JsonObject)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RestApiModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestApiModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String?;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$RestApiModel extends RestApiModel {
  @override
  final String? status;
  @override
  final JsonObject? data;
  @override
  final String? message;
  @override
  final int? code;

  factory _$RestApiModel([void Function(RestApiModelBuilder)? updates]) =>
      (new RestApiModelBuilder()..update(updates)).build();

  _$RestApiModel._({this.status, this.data, this.message, this.code})
      : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('RestApiModel', 'status');
    }
  }

  @override
  RestApiModel rebuild(void Function(RestApiModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestApiModelBuilder toBuilder() => new RestApiModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestApiModel &&
        status == other.status &&
        data == other.data &&
        message == other.message &&
        code == other.code;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, status.hashCode), data.hashCode), message.hashCode),
        code.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestApiModel')
          ..add('status', status)
          ..add('data', data)
          ..add('message', message)
          ..add('code', code))
        .toString();
  }
}

class RestApiModelBuilder
    implements Builder<RestApiModel, RestApiModelBuilder> {
  _$RestApiModel? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  RestApiModelBuilder();

  RestApiModelBuilder get _$this {
    if (_$v != null) {
      _status = _$v!.status;
      _data = _$v!.data;
      _message = _$v!.message;
      _code = _$v!.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestApiModel other) {
    _$v = other as _$RestApiModel;
  }

  @override
  void update(void Function(RestApiModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestApiModel build() {
    final _$result = _$v ??
        new _$RestApiModel._(
            status: status, data: data, message: message, code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
