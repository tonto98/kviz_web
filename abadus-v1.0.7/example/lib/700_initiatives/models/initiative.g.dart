// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_read;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Initiative> _$initiativeSerializer = new _$InitiativeSerializer();

class _$InitiativeSerializer implements StructuredSerializer<Initiative> {
  @override
  final Iterable<Type> types = const [Initiative, _$Initiative];
  @override
  final String wireName = 'Initiative';

  @override
  Iterable<Object> serialize(Serializers serializers, Initiative object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ImageApi)])),
      'begin',
      serializers.serialize(object.begin,
          specifiedType: const FullType(DateTime)),
      'end',
      serializers.serialize(object.end,
          specifiedType: const FullType(DateTime)),
      'num_votes',
      serializers.serialize(object.numVotes,
          specifiedType: const FullType(int)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(InitiativeComment)])),
      'can_edit',
      serializers.serialize(object.canEdit,
          specifiedType: const FullType(bool)),
      'can_comment',
      serializers.serialize(object.canComment,
          specifiedType: const FullType(bool)),
      'can_delete',
      serializers.serialize(object.canDelete,
          specifiedType: const FullType(bool)),
      'can_vote',
      serializers.serialize(object.canVote,
          specifiedType: const FullType(bool)),
      'voted',
      serializers.serialize(object.voted, specifiedType: const FullType(bool)),
    ];
    if (object.shortDescription != null) {
      result
        ..add('short_description')
        ..add(serializers.serialize(object.shortDescription,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(Address)));
    }
    if (object.committee != null) {
      result
        ..add('committee')
        ..add(serializers.serialize(object.committee,
            specifiedType: const FullType(Committee)));
    }
    if (object.contactEmail != null) {
      result
        ..add('contact_email')
        ..add(serializers.serialize(object.contactEmail,
            specifiedType: const FullType(String)));
    }
    if (object.contactPhone != null) {
      result
        ..add('contact_phone')
        ..add(serializers.serialize(object.contactPhone,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Initiative deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativeBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'short_description':
          result.shortDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ImageApi)]))
              as BuiltList<Object>);
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address)) as Address);
          break;
        case 'committee':
          result.committee.replace(serializers.deserialize(value,
              specifiedType: const FullType(Committee)) as Committee);
          break;
        case 'begin':
          result.begin = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'contact_email':
          result.contactEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_phone':
          result.contactPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'num_votes':
          result.numVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(InitiativeComment)]))
              as BuiltList<Object>);
          break;
        case 'can_edit':
          result.canEdit = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_comment':
          result.canComment = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_delete':
          result.canDelete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_vote':
          result.canVote = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'voted':
          result.voted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Initiative extends Initiative {
  @override
  final int id;
  @override
  final String title;
  @override
  final String shortDescription;
  @override
  final String description;
  @override
  final BuiltList<ImageApi> images;
  @override
  final Address address;
  @override
  final Committee committee;
  @override
  final DateTime begin;
  @override
  final DateTime end;
  @override
  final String contactEmail;
  @override
  final String contactPhone;
  @override
  final int numVotes;
  @override
  final BuiltList<InitiativeComment> comments;
  @override
  final bool canEdit;
  @override
  final bool canComment;
  @override
  final bool canDelete;
  @override
  final bool canVote;
  @override
  final bool voted;

  factory _$Initiative([void Function(InitiativeBuilder) updates]) =>
      (new InitiativeBuilder()..update(updates)).build();

  _$Initiative._(
      {this.id,
      this.title,
      this.shortDescription,
      this.description,
      this.images,
      this.address,
      this.committee,
      this.begin,
      this.end,
      this.contactEmail,
      this.contactPhone,
      this.numVotes,
      this.comments,
      this.canEdit,
      this.canComment,
      this.canDelete,
      this.canVote,
      this.voted})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Initiative', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Initiative', 'title');
    }
    if (images == null) {
      throw new BuiltValueNullFieldError('Initiative', 'images');
    }
    if (begin == null) {
      throw new BuiltValueNullFieldError('Initiative', 'begin');
    }
    if (end == null) {
      throw new BuiltValueNullFieldError('Initiative', 'end');
    }
    if (numVotes == null) {
      throw new BuiltValueNullFieldError('Initiative', 'numVotes');
    }
    if (comments == null) {
      throw new BuiltValueNullFieldError('Initiative', 'comments');
    }
    if (canEdit == null) {
      throw new BuiltValueNullFieldError('Initiative', 'canEdit');
    }
    if (canComment == null) {
      throw new BuiltValueNullFieldError('Initiative', 'canComment');
    }
    if (canDelete == null) {
      throw new BuiltValueNullFieldError('Initiative', 'canDelete');
    }
    if (canVote == null) {
      throw new BuiltValueNullFieldError('Initiative', 'canVote');
    }
    if (voted == null) {
      throw new BuiltValueNullFieldError('Initiative', 'voted');
    }
  }

  @override
  Initiative rebuild(void Function(InitiativeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativeBuilder toBuilder() => new InitiativeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Initiative &&
        id == other.id &&
        title == other.title &&
        shortDescription == other.shortDescription &&
        description == other.description &&
        images == other.images &&
        address == other.address &&
        committee == other.committee &&
        begin == other.begin &&
        end == other.end &&
        contactEmail == other.contactEmail &&
        contactPhone == other.contactPhone &&
        numVotes == other.numVotes &&
        comments == other.comments &&
        canEdit == other.canEdit &&
        canComment == other.canComment &&
        canDelete == other.canDelete &&
        canVote == other.canVote &&
        voted == other.voted;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        title
                                                                            .hashCode),
                                                                    shortDescription
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            images.hashCode),
                                                        address.hashCode),
                                                    committee.hashCode),
                                                begin.hashCode),
                                            end.hashCode),
                                        contactEmail.hashCode),
                                    contactPhone.hashCode),
                                numVotes.hashCode),
                            comments.hashCode),
                        canEdit.hashCode),
                    canComment.hashCode),
                canDelete.hashCode),
            canVote.hashCode),
        voted.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Initiative')
          ..add('id', id)
          ..add('title', title)
          ..add('shortDescription', shortDescription)
          ..add('description', description)
          ..add('images', images)
          ..add('address', address)
          ..add('committee', committee)
          ..add('begin', begin)
          ..add('end', end)
          ..add('contactEmail', contactEmail)
          ..add('contactPhone', contactPhone)
          ..add('numVotes', numVotes)
          ..add('comments', comments)
          ..add('canEdit', canEdit)
          ..add('canComment', canComment)
          ..add('canDelete', canDelete)
          ..add('canVote', canVote)
          ..add('voted', voted))
        .toString();
  }
}

class InitiativeBuilder implements Builder<Initiative, InitiativeBuilder> {
  _$Initiative _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _shortDescription;
  String get shortDescription => _$this._shortDescription;
  set shortDescription(String shortDescription) =>
      _$this._shortDescription = shortDescription;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<ImageApi> _images;
  ListBuilder<ImageApi> get images =>
      _$this._images ??= new ListBuilder<ImageApi>();
  set images(ListBuilder<ImageApi> images) => _$this._images = images;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  CommitteeBuilder _committee;
  CommitteeBuilder get committee =>
      _$this._committee ??= new CommitteeBuilder();
  set committee(CommitteeBuilder committee) => _$this._committee = committee;

  DateTime _begin;
  DateTime get begin => _$this._begin;
  set begin(DateTime begin) => _$this._begin = begin;

  DateTime _end;
  DateTime get end => _$this._end;
  set end(DateTime end) => _$this._end = end;

  String _contactEmail;
  String get contactEmail => _$this._contactEmail;
  set contactEmail(String contactEmail) => _$this._contactEmail = contactEmail;

  String _contactPhone;
  String get contactPhone => _$this._contactPhone;
  set contactPhone(String contactPhone) => _$this._contactPhone = contactPhone;

  int _numVotes;
  int get numVotes => _$this._numVotes;
  set numVotes(int numVotes) => _$this._numVotes = numVotes;

  ListBuilder<InitiativeComment> _comments;
  ListBuilder<InitiativeComment> get comments =>
      _$this._comments ??= new ListBuilder<InitiativeComment>();
  set comments(ListBuilder<InitiativeComment> comments) =>
      _$this._comments = comments;

  bool _canEdit;
  bool get canEdit => _$this._canEdit;
  set canEdit(bool canEdit) => _$this._canEdit = canEdit;

  bool _canComment;
  bool get canComment => _$this._canComment;
  set canComment(bool canComment) => _$this._canComment = canComment;

  bool _canDelete;
  bool get canDelete => _$this._canDelete;
  set canDelete(bool canDelete) => _$this._canDelete = canDelete;

  bool _canVote;
  bool get canVote => _$this._canVote;
  set canVote(bool canVote) => _$this._canVote = canVote;

  bool _voted;
  bool get voted => _$this._voted;
  set voted(bool voted) => _$this._voted = voted;

  InitiativeBuilder();

  InitiativeBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _shortDescription = _$v.shortDescription;
      _description = _$v.description;
      _images = _$v.images?.toBuilder();
      _address = _$v.address?.toBuilder();
      _committee = _$v.committee?.toBuilder();
      _begin = _$v.begin;
      _end = _$v.end;
      _contactEmail = _$v.contactEmail;
      _contactPhone = _$v.contactPhone;
      _numVotes = _$v.numVotes;
      _comments = _$v.comments?.toBuilder();
      _canEdit = _$v.canEdit;
      _canComment = _$v.canComment;
      _canDelete = _$v.canDelete;
      _canVote = _$v.canVote;
      _voted = _$v.voted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Initiative other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Initiative;
  }

  @override
  void update(void Function(InitiativeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Initiative build() {
    _$Initiative _$result;
    try {
      _$result = _$v ??
          new _$Initiative._(
              id: id,
              title: title,
              shortDescription: shortDescription,
              description: description,
              images: images.build(),
              address: _address?.build(),
              committee: _committee?.build(),
              begin: begin,
              end: end,
              contactEmail: contactEmail,
              contactPhone: contactPhone,
              numVotes: numVotes,
              comments: comments.build(),
              canEdit: canEdit,
              canComment: canComment,
              canDelete: canDelete,
              canVote: canVote,
              voted: voted);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
        _$failedField = 'address';
        _address?.build();
        _$failedField = 'committee';
        _committee?.build();

        _$failedField = 'comments';
        comments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Initiative', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
