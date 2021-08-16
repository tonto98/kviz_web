// GENERATED CODE - DO NOT MODIFY BY HAND

part of rest_api_fail;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestApiFail> _$restApiFailSerializer = new _$RestApiFailSerializer();

class _$RestApiFailSerializer implements StructuredSerializer<RestApiFail> {
  @override
  final Iterable<Type> types = const [RestApiFail, _$RestApiFail];
  @override
  final String wireName = 'RestApiFail';

  @override
  Iterable<Object?> serialize(Serializers serializers, RestApiFail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.errors != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(object.errors,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  RestApiFail deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestApiFailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String?;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'errors':
          result.errors = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$RestApiFail extends RestApiFail {
  @override
  final String? message;
  @override
  final JsonObject? errors;

  factory _$RestApiFail([void Function(RestApiFailBuilder)? updates]) =>
      (new RestApiFailBuilder()..update(updates)).build();

  _$RestApiFail._({this.message, this.errors}) : super._();

  @override
  RestApiFail rebuild(void Function(RestApiFailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestApiFailBuilder toBuilder() => new RestApiFailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestApiFail &&
        message == other.message &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestApiFail')
          ..add('message', message)
          ..add('errors', errors))
        .toString();
  }
}

class RestApiFailBuilder implements Builder<RestApiFail, RestApiFailBuilder> {
  _$RestApiFail? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  JsonObject? _errors;
  JsonObject? get errors => _$this._errors;
  set errors(JsonObject? errors) => _$this._errors = errors;

  RestApiFailBuilder();

  RestApiFailBuilder get _$this {
    if (_$v != null) {
      _message = _$v!.message;
      _errors = _$v!.errors;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestApiFail other) {
    _$v = other as _$RestApiFail;
  }

  @override
  void update(void Function(RestApiFailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestApiFail build() {
    final _$result =
        _$v ?? new _$RestApiFail._(message: message, errors: errors);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
