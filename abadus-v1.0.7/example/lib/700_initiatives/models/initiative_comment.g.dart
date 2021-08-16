// GENERATED CODE - DO NOT MODIFY BY HAND

part of initiative_comment;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitiativeComment> _$initiativeCommentSerializer =
    new _$InitiativeCommentSerializer();

class _$InitiativeCommentSerializer
    implements StructuredSerializer<InitiativeComment> {
  @override
  final Iterable<Type> types = const [InitiativeComment, _$InitiativeComment];
  @override
  final String wireName = 'InitiativeComment';

  @override
  Iterable<Object> serialize(Serializers serializers, InitiativeComment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'user_name',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'contents',
      serializers.serialize(object.contents,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'can_edit',
      serializers.serialize(object.canEdit,
          specifiedType: const FullType(bool)),
      'can_delete',
      serializers.serialize(object.canDelete,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  InitiativeComment deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitiativeCommentBuilder();

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
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contents':
          result.contents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'can_edit':
          result.canEdit = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_delete':
          result.canDelete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$InitiativeComment extends InitiativeComment {
  @override
  final int id;
  @override
  final String userName;
  @override
  final String contents;
  @override
  final DateTime createdAt;
  @override
  final bool canEdit;
  @override
  final bool canDelete;

  factory _$InitiativeComment(
          [void Function(InitiativeCommentBuilder) updates]) =>
      (new InitiativeCommentBuilder()..update(updates)).build();

  _$InitiativeComment._(
      {this.id,
      this.userName,
      this.contents,
      this.createdAt,
      this.canEdit,
      this.canDelete})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'id');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'userName');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'contents');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'createdAt');
    }
    if (canEdit == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'canEdit');
    }
    if (canDelete == null) {
      throw new BuiltValueNullFieldError('InitiativeComment', 'canDelete');
    }
  }

  @override
  InitiativeComment rebuild(void Function(InitiativeCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitiativeCommentBuilder toBuilder() =>
      new InitiativeCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitiativeComment &&
        id == other.id &&
        userName == other.userName &&
        contents == other.contents &&
        createdAt == other.createdAt &&
        canEdit == other.canEdit &&
        canDelete == other.canDelete;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), userName.hashCode),
                    contents.hashCode),
                createdAt.hashCode),
            canEdit.hashCode),
        canDelete.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitiativeComment')
          ..add('id', id)
          ..add('userName', userName)
          ..add('contents', contents)
          ..add('createdAt', createdAt)
          ..add('canEdit', canEdit)
          ..add('canDelete', canDelete))
        .toString();
  }
}

class InitiativeCommentBuilder
    implements Builder<InitiativeComment, InitiativeCommentBuilder> {
  _$InitiativeComment _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  bool _canEdit;
  bool get canEdit => _$this._canEdit;
  set canEdit(bool canEdit) => _$this._canEdit = canEdit;

  bool _canDelete;
  bool get canDelete => _$this._canDelete;
  set canDelete(bool canDelete) => _$this._canDelete = canDelete;

  InitiativeCommentBuilder();

  InitiativeCommentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userName = _$v.userName;
      _contents = _$v.contents;
      _createdAt = _$v.createdAt;
      _canEdit = _$v.canEdit;
      _canDelete = _$v.canDelete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitiativeComment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitiativeComment;
  }

  @override
  void update(void Function(InitiativeCommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitiativeComment build() {
    final _$result = _$v ??
        new _$InitiativeComment._(
            id: id,
            userName: userName,
            contents: contents,
            createdAt: createdAt,
            canEdit: canEdit,
            canDelete: canDelete);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
