// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_image;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageApi> _$imageApiSerializer = new _$ImageApiSerializer();

class _$ImageApiSerializer implements StructuredSerializer<ImageApi> {
  @override
  final Iterable<Type> types = const [ImageApi, _$ImageApi];
  @override
  final String wireName = 'ImageApi';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ImageApi deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageApiBuilder();

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
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageApi extends ImageApi {
  @override
  final int id;
  @override
  final String url;

  factory _$ImageApi([void Function(ImageApiBuilder) updates]) =>
      (new ImageApiBuilder()..update(updates)).build();

  _$ImageApi._({this.id, this.url}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ImageApi', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('ImageApi', 'url');
    }
  }

  @override
  ImageApi rebuild(void Function(ImageApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageApiBuilder toBuilder() => new ImageApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageApi && id == other.id && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageApi')
          ..add('id', id)
          ..add('url', url))
        .toString();
  }
}

class ImageApiBuilder implements Builder<ImageApi, ImageApiBuilder> {
  _$ImageApi _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ImageApiBuilder();

  ImageApiBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageApi other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageApi;
  }

  @override
  void update(void Function(ImageApiBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageApi build() {
    final _$result = _$v ?? new _$ImageApi._(id: id, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
