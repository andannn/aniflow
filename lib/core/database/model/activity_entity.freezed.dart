// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityEntity _$ActivityEntityFromJson(Map<String, dynamic> json) {
  return _ActivityEntity.fromJson(json);
}

/// @nodoc
mixin _$ActivityEntity {
  @JsonKey(name: ActivityTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.userId)
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.mediaId)
  String? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.text)
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.status)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.progress)
  String? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.type)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.replyCount)
  int? get replyCount => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.siteUrl)
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.isLocked)
  int? get isLocked => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.isLiked)
  int? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.likeCount)
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.isPinned)
  int? get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: ActivityTableColumns.createdAt)
  int? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityEntityCopyWith<ActivityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityEntityCopyWith<$Res> {
  factory $ActivityEntityCopyWith(
          ActivityEntity value, $Res Function(ActivityEntity) then) =
      _$ActivityEntityCopyWithImpl<$Res, ActivityEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: ActivityTableColumns.id) String id,
      @JsonKey(name: ActivityTableColumns.userId) String userId,
      @JsonKey(name: ActivityTableColumns.mediaId) String? mediaId,
      @JsonKey(name: ActivityTableColumns.text) String? text,
      @JsonKey(name: ActivityTableColumns.status) String? status,
      @JsonKey(name: ActivityTableColumns.progress) String? progress,
      @JsonKey(name: ActivityTableColumns.type) String? type,
      @JsonKey(name: ActivityTableColumns.replyCount) int? replyCount,
      @JsonKey(name: ActivityTableColumns.siteUrl) String? siteUrl,
      @JsonKey(name: ActivityTableColumns.isLocked) int? isLocked,
      @JsonKey(name: ActivityTableColumns.isLiked) int? isLiked,
      @JsonKey(name: ActivityTableColumns.likeCount) int? likeCount,
      @JsonKey(name: ActivityTableColumns.isPinned) int? isPinned,
      @JsonKey(name: ActivityTableColumns.createdAt) int? createdAt});
}

/// @nodoc
class _$ActivityEntityCopyWithImpl<$Res, $Val extends ActivityEntity>
    implements $ActivityEntityCopyWith<$Res> {
  _$ActivityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mediaId = freezed,
    Object? text = freezed,
    Object? status = freezed,
    Object? progress = freezed,
    Object? type = freezed,
    Object? replyCount = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
    Object? isLiked = freezed,
    Object? likeCount = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActivityEntityCopyWith<$Res>
    implements $ActivityEntityCopyWith<$Res> {
  factory _$$_ActivityEntityCopyWith(
          _$_ActivityEntity value, $Res Function(_$_ActivityEntity) then) =
      __$$_ActivityEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: ActivityTableColumns.id) String id,
      @JsonKey(name: ActivityTableColumns.userId) String userId,
      @JsonKey(name: ActivityTableColumns.mediaId) String? mediaId,
      @JsonKey(name: ActivityTableColumns.text) String? text,
      @JsonKey(name: ActivityTableColumns.status) String? status,
      @JsonKey(name: ActivityTableColumns.progress) String? progress,
      @JsonKey(name: ActivityTableColumns.type) String? type,
      @JsonKey(name: ActivityTableColumns.replyCount) int? replyCount,
      @JsonKey(name: ActivityTableColumns.siteUrl) String? siteUrl,
      @JsonKey(name: ActivityTableColumns.isLocked) int? isLocked,
      @JsonKey(name: ActivityTableColumns.isLiked) int? isLiked,
      @JsonKey(name: ActivityTableColumns.likeCount) int? likeCount,
      @JsonKey(name: ActivityTableColumns.isPinned) int? isPinned,
      @JsonKey(name: ActivityTableColumns.createdAt) int? createdAt});
}

/// @nodoc
class __$$_ActivityEntityCopyWithImpl<$Res>
    extends _$ActivityEntityCopyWithImpl<$Res, _$_ActivityEntity>
    implements _$$_ActivityEntityCopyWith<$Res> {
  __$$_ActivityEntityCopyWithImpl(
      _$_ActivityEntity _value, $Res Function(_$_ActivityEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mediaId = freezed,
    Object? text = freezed,
    Object? status = freezed,
    Object? progress = freezed,
    Object? type = freezed,
    Object? replyCount = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
    Object? isLiked = freezed,
    Object? likeCount = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ActivityEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivityEntity implements _ActivityEntity {
  _$_ActivityEntity(
      {@JsonKey(name: ActivityTableColumns.id) this.id = '',
      @JsonKey(name: ActivityTableColumns.userId) this.userId = '',
      @JsonKey(name: ActivityTableColumns.mediaId) this.mediaId,
      @JsonKey(name: ActivityTableColumns.text) this.text,
      @JsonKey(name: ActivityTableColumns.status) this.status,
      @JsonKey(name: ActivityTableColumns.progress) this.progress,
      @JsonKey(name: ActivityTableColumns.type) this.type,
      @JsonKey(name: ActivityTableColumns.replyCount) this.replyCount,
      @JsonKey(name: ActivityTableColumns.siteUrl) this.siteUrl,
      @JsonKey(name: ActivityTableColumns.isLocked) this.isLocked,
      @JsonKey(name: ActivityTableColumns.isLiked) this.isLiked,
      @JsonKey(name: ActivityTableColumns.likeCount) this.likeCount,
      @JsonKey(name: ActivityTableColumns.isPinned) this.isPinned,
      @JsonKey(name: ActivityTableColumns.createdAt) this.createdAt});

  factory _$_ActivityEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityEntityFromJson(json);

  @override
  @JsonKey(name: ActivityTableColumns.id)
  final String id;
  @override
  @JsonKey(name: ActivityTableColumns.userId)
  final String userId;
  @override
  @JsonKey(name: ActivityTableColumns.mediaId)
  final String? mediaId;
  @override
  @JsonKey(name: ActivityTableColumns.text)
  final String? text;
  @override
  @JsonKey(name: ActivityTableColumns.status)
  final String? status;
  @override
  @JsonKey(name: ActivityTableColumns.progress)
  final String? progress;
  @override
  @JsonKey(name: ActivityTableColumns.type)
  final String? type;
  @override
  @JsonKey(name: ActivityTableColumns.replyCount)
  final int? replyCount;
  @override
  @JsonKey(name: ActivityTableColumns.siteUrl)
  final String? siteUrl;
  @override
  @JsonKey(name: ActivityTableColumns.isLocked)
  final int? isLocked;
  @override
  @JsonKey(name: ActivityTableColumns.isLiked)
  final int? isLiked;
  @override
  @JsonKey(name: ActivityTableColumns.likeCount)
  final int? likeCount;
  @override
  @JsonKey(name: ActivityTableColumns.isPinned)
  final int? isPinned;
  @override
  @JsonKey(name: ActivityTableColumns.createdAt)
  final int? createdAt;

  @override
  String toString() {
    return 'ActivityEntity(id: $id, userId: $userId, mediaId: $mediaId, text: $text, status: $status, progress: $progress, type: $type, replyCount: $replyCount, siteUrl: $siteUrl, isLocked: $isLocked, isLiked: $isLiked, likeCount: $likeCount, isPinned: $isPinned, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActivityEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      mediaId,
      text,
      status,
      progress,
      type,
      replyCount,
      siteUrl,
      isLocked,
      isLiked,
      likeCount,
      isPinned,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivityEntityCopyWith<_$_ActivityEntity> get copyWith =>
      __$$_ActivityEntityCopyWithImpl<_$_ActivityEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityEntityToJson(
      this,
    );
  }
}

abstract class _ActivityEntity implements ActivityEntity {
  factory _ActivityEntity(
      {@JsonKey(name: ActivityTableColumns.id) final String id,
      @JsonKey(name: ActivityTableColumns.userId) final String userId,
      @JsonKey(name: ActivityTableColumns.mediaId) final String? mediaId,
      @JsonKey(name: ActivityTableColumns.text) final String? text,
      @JsonKey(name: ActivityTableColumns.status) final String? status,
      @JsonKey(name: ActivityTableColumns.progress) final String? progress,
      @JsonKey(name: ActivityTableColumns.type) final String? type,
      @JsonKey(name: ActivityTableColumns.replyCount) final int? replyCount,
      @JsonKey(name: ActivityTableColumns.siteUrl) final String? siteUrl,
      @JsonKey(name: ActivityTableColumns.isLocked) final int? isLocked,
      @JsonKey(name: ActivityTableColumns.isLiked) final int? isLiked,
      @JsonKey(name: ActivityTableColumns.likeCount) final int? likeCount,
      @JsonKey(name: ActivityTableColumns.isPinned) final int? isPinned,
      @JsonKey(name: ActivityTableColumns.createdAt)
      final int? createdAt}) = _$_ActivityEntity;

  factory _ActivityEntity.fromJson(Map<String, dynamic> json) =
      _$_ActivityEntity.fromJson;

  @override
  @JsonKey(name: ActivityTableColumns.id)
  String get id;
  @override
  @JsonKey(name: ActivityTableColumns.userId)
  String get userId;
  @override
  @JsonKey(name: ActivityTableColumns.mediaId)
  String? get mediaId;
  @override
  @JsonKey(name: ActivityTableColumns.text)
  String? get text;
  @override
  @JsonKey(name: ActivityTableColumns.status)
  String? get status;
  @override
  @JsonKey(name: ActivityTableColumns.progress)
  String? get progress;
  @override
  @JsonKey(name: ActivityTableColumns.type)
  String? get type;
  @override
  @JsonKey(name: ActivityTableColumns.replyCount)
  int? get replyCount;
  @override
  @JsonKey(name: ActivityTableColumns.siteUrl)
  String? get siteUrl;
  @override
  @JsonKey(name: ActivityTableColumns.isLocked)
  int? get isLocked;
  @override
  @JsonKey(name: ActivityTableColumns.isLiked)
  int? get isLiked;
  @override
  @JsonKey(name: ActivityTableColumns.likeCount)
  int? get likeCount;
  @override
  @JsonKey(name: ActivityTableColumns.isPinned)
  int? get isPinned;
  @override
  @JsonKey(name: ActivityTableColumns.createdAt)
  int? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ActivityEntityCopyWith<_$_ActivityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
