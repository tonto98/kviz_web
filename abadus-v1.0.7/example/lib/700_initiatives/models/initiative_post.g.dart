// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_create_post;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitiativePost> _$initiativePostSerializer =
    new _$InitiativePostSerializer();

class _$InitiativePostSerializer
    implements StructuredSerializer<InitiativePost> {
  @override
  final Iterable<Type> types = const [InitiativePost, _$InitiativePost];
  @override
  final String wireName = 'InitiativePost';

  @override
  Iterable<Object> serialize(Serializers serializers, InitiativePost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'begin',
      serializers.serialize(object.begin,
          specifiedType: const FullType(String)),
      'end',
      serializers.serialize(object.end, specifiedType: const FullType(String)),
      'local_committee_id',
      serializers.serialize(object.localCommitteeId,
          specifiedType: const FullType(int)),
      'upload_buffer_id',
      serializers.serialize(object.uploadBufferId,
          specifiedType: const FullType(String)),
    ];
    if (object.contactPhone != null) {
      result
        ..add('contact_phone')
        ..add(serializers.serialize(object.contactPhone,
            specifiedType: const FullType(String)));
    }
    if (object.contactEmail != null) {
      result
        ..add('contact_email')
        ..add(serializers.serialize(object.contactEmail,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(Address)));
    }
    if (object.deletedIds != null) {
      result
        ..add('deleted_ids')
        ..add(serializers.serialize(object.deletedIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.deletedUuids != null) {
      result
        ..add('deleted_uuids')
        ..add(serializers.serialize(object.deletedUuids,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  InitiativePost deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativePostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'begin':
          result.begin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'local_committee_id':
          result.localCommitteeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'contact_phone':
          result.contactPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_email':
          result.contactEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address)) as Address);
          break;
        case 'upload_buffer_id':
          result.uploadBufferId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deleted_ids':
          result.deletedIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'deleted_uuids':
          result.deletedUuids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$InitiativePost extends InitiativePost {
  @override
  final String title;
  @override
  final String description;
  @override
  final String begin;
  @override
  final String end;
  @override
  final int localCommitteeId;
  @override
  final String contactPhone;
  @override
  final String contactEmail;
  @override
  final Address address;
  @override
  final String uploadBufferId;
  @override
  final BuiltList<int> deletedIds;
  @override
  final BuiltList<String> deletedUuids;

  factory _$InitiativePost([void Function(InitiativePostBuilder) updates]) =>
      (new InitiativePostBuilder()..update(updates)).build();

  _$InitiativePost._(
      {this.title,
      this.description,
      this.begin,
      this.end,
      this.localCommitteeId,
      this.contactPhone,
      this.contactEmail,
      this.address,
      this.uploadBufferId,
      this.deletedIds,
      this.deletedUuids})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'description');
    }
    if (begin == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'begin');
    }
    if (end == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'end');
    }
    if (localCommitteeId == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'localCommitteeId');
    }
    if (uploadBufferId == null) {
      throw new BuiltValueNullFieldError('InitiativePost', 'uploadBufferId');
    }
  }

  @override
  InitiativePost rebuild(void Function(InitiativePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativePostBuilder toBuilder() =>
      new InitiativePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitiativePost &&
        title == other.title &&
        description == other.description &&
        begin == other.begin &&
        end == other.end &&
        localCommitteeId == other.localCommitteeId &&
        contactPhone == other.contactPhone &&
        contactEmail == other.contactEmail &&
        address == other.address &&
        uploadBufferId == other.uploadBufferId &&
        deletedIds == other.deletedIds &&
        deletedUuids == other.deletedUuids;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, title.hashCode),
                                            description.hashCode),
                                        begin.hashCode),
                                    end.hashCode),
                                localCommitteeId.hashCode),
                            contactPhone.hashCode),
                        contactEmail.hashCode),
                    address.hashCode),
                uploadBufferId.hashCode),
            deletedIds.hashCode),
        deletedUuids.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitiativePost')
          ..add('title', title)
          ..add('description', description)
          ..add('begin', begin)
          ..add('end', end)
          ..add('localCommitteeId', localCommitteeId)
          ..add('contactPhone', contactPhone)
          ..add('contactEmail', contactEmail)
          ..add('address', address)
          ..add('uploadBufferId', uploadBufferId)
          ..add('deletedIds', deletedIds)
          ..add('deletedUuids', deletedUuids))
        .toString();
  }
}

class InitiativePostBuilder
    implements Builder<InitiativePost, InitiativePostBuilder> {
  _$InitiativePost _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _begin;
  String get begin => _$this._begin;
  set begin(String begin) => _$this._begin = begin;

  String _end;
  String get end => _$this._end;
  set end(String end) => _$this._end = end;

  int _localCommitteeId;
  int get localCommitteeId => _$this._localCommitteeId;
  set localCommitteeId(int localCommitteeId) =>
      _$this._localCommitteeId = localCommitteeId;

  String _contactPhone;
  String get contactPhone => _$this._contactPhone;
  set contactPhone(String contactPhone) => _$this._contactPhone = contactPhone;

  String _contactEmail;
  String get contactEmail => _$this._contactEmail;
  set contactEmail(String contactEmail) => _$this._contactEmail = contactEmail;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  String _uploadBufferId;
  String get uploadBufferId => _$this._uploadBufferId;
  set uploadBufferId(String uploadBufferId) =>
      _$this._uploadBufferId = uploadBufferId;

  ListBuilder<int> _deletedIds;
  ListBuilder<int> get deletedIds =>
      _$this._deletedIds ??= new ListBuilder<int>();
  set deletedIds(ListBuilder<int> deletedIds) =>
      _$this._deletedIds = deletedIds;

  ListBuilder<String> _deletedUuids;
  ListBuilder<String> get deletedUuids =>
      _$this._deletedUuids ??= new ListBuilder<String>();
  set deletedUuids(ListBuilder<String> deletedUuids) =>
      _$this._deletedUuids = deletedUuids;

  InitiativePostBuilder();

  InitiativePostBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _description = _$v.description;
      _begin = _$v.begin;
      _end = _$v.end;
      _localCommitteeId = _$v.localCommitteeId;
      _contactPhone = _$v.contactPhone;
      _contactEmail = _$v.contactEmail;
      _address = _$v.address?.toBuilder();
      _uploadBufferId = _$v.uploadBufferId;
      _deletedIds = _$v.deletedIds?.toBuilder();
      _deletedUuids = _$v.deletedUuids?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitiativePost other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitiativePost;
  }

  @override
  void update(void Function(InitiativePostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitiativePost build() {
    _$InitiativePost _$result;
    try {
      _$result = _$v ??
          new _$InitiativePost._(
              title: title,
              description: description,
              begin: begin,
              end: end,
              localCommitteeId: localCommitteeId,
              contactPhone: contactPhone,
              contactEmail: contactEmail,
              address: _address?.build(),
              uploadBufferId: uploadBufferId,
              deletedIds: _deletedIds?.build(),
              deletedUuids: _deletedUuids?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();

        _$failedField = 'deletedIds';
        _deletedIds?.build();
        _$failedField = 'deletedUuids';
        _deletedUuids?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InitiativePost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
