// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaListEntity _$MediaListEntityFromJson(Map<String, dynamic> json) {
  return _MediaListEntity.fromJson(json);
}

/// @nodoc
mixin _$MediaListEntity {
  @JsonKey(name: MediaListTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.mediaId)
  String? get animeId => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.status)
  MediaListStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.progress)
  int? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.score)
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaListEntityCopyWith<MediaListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListEntityCopyWith<$Res> {
  factory $MediaListEntityCopyWith(
          MediaListEntity value, $Res Function(MediaListEntity) then) =
      _$MediaListEntityCopyWithImpl<$Res, MediaListEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: MediaListTableColumns.id) String id,
      @JsonKey(name: MediaListTableColumns.userId) String? userId,
      @JsonKey(name: MediaListTableColumns.mediaId) String? animeId,
      @JsonKey(name: MediaListTableColumns.status) MediaListStatus? status,
      @JsonKey(name: MediaListTableColumns.progress) int? progress,
      @JsonKey(name: MediaListTableColumns.score) int? score,
      @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class _$MediaListEntityCopyWithImpl<$Res, $Val extends MediaListEntity>
    implements $MediaListEntityCopyWith<$Res> {
  _$MediaListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? animeId = freezed,
    Object? status = freezed,
    Object? progress = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaListEntityCopyWith<$Res>
    implements $MediaListEntityCopyWith<$Res> {
  factory _$$_MediaListEntityCopyWith(
          _$_MediaListEntity value, $Res Function(_$_MediaListEntity) then) =
      __$$_MediaListEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: MediaListTableColumns.id) String id,
      @JsonKey(name: MediaListTableColumns.userId) String? userId,
      @JsonKey(name: MediaListTableColumns.mediaId) String? animeId,
      @JsonKey(name: MediaListTableColumns.status) MediaListStatus? status,
      @JsonKey(name: MediaListTableColumns.progress) int? progress,
      @JsonKey(name: MediaListTableColumns.score) int? score,
      @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class __$$_MediaListEntityCopyWithImpl<$Res>
    extends _$MediaListEntityCopyWithImpl<$Res, _$_MediaListEntity>
    implements _$$_MediaListEntityCopyWith<$Res> {
  __$$_MediaListEntityCopyWithImpl(
      _$_MediaListEntity _value, $Res Function(_$_MediaListEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? animeId = freezed,
    Object? status = freezed,
    Object? progress = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_MediaListEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaListEntity implements _MediaListEntity {
  _$_MediaListEntity(
      {@JsonKey(name: MediaListTableColumns.id) this.id = '',
      @JsonKey(name: MediaListTableColumns.userId) this.userId,
      @JsonKey(name: MediaListTableColumns.mediaId) this.animeId,
      @JsonKey(name: MediaListTableColumns.status) this.status,
      @JsonKey(name: MediaListTableColumns.progress) this.progress,
      @JsonKey(name: MediaListTableColumns.score) this.score,
      @JsonKey(name: MediaListTableColumns.updatedAt) this.updatedAt});

  factory _$_MediaListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MediaListEntityFromJson(json);

  @override
  @JsonKey(name: MediaListTableColumns.id)
  final String id;
  @override
  @JsonKey(name: MediaListTableColumns.userId)
  final String? userId;
  @override
  @JsonKey(name: MediaListTableColumns.mediaId)
  final String? animeId;
  @override
  @JsonKey(name: MediaListTableColumns.status)
  final MediaListStatus? status;
  @override
  @JsonKey(name: MediaListTableColumns.progress)
  final int? progress;
  @override
  @JsonKey(name: MediaListTableColumns.score)
  final int? score;
  @override
  @JsonKey(name: MediaListTableColumns.updatedAt)
  final int? updatedAt;

  @override
  String toString() {
    return 'MediaListEntity(id: $id, userId: $userId, animeId: $animeId, status: $status, progress: $progress, score: $score, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaListEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.animeId, animeId) || other.animeId == animeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, animeId, status, progress, score, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaListEntityCopyWith<_$_MediaListEntity> get copyWith =>
      __$$_MediaListEntityCopyWithImpl<_$_MediaListEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaListEntityToJson(
      this,
    );
  }
}

abstract class _MediaListEntity implements MediaListEntity {
  factory _MediaListEntity(
      {@JsonKey(name: MediaListTableColumns.id) final String id,
      @JsonKey(name: MediaListTableColumns.userId) final String? userId,
      @JsonKey(name: MediaListTableColumns.mediaId) final String? animeId,
      @JsonKey(name: MediaListTableColumns.status)
      final MediaListStatus? status,
      @JsonKey(name: MediaListTableColumns.progress) final int? progress,
      @JsonKey(name: MediaListTableColumns.score) final int? score,
      @JsonKey(name: MediaListTableColumns.updatedAt)
      final int? updatedAt}) = _$_MediaListEntity;

  factory _MediaListEntity.fromJson(Map<String, dynamic> json) =
      _$_MediaListEntity.fromJson;

  @override
  @JsonKey(name: MediaListTableColumns.id)
  String get id;
  @override
  @JsonKey(name: MediaListTableColumns.userId)
  String? get userId;
  @override
  @JsonKey(name: MediaListTableColumns.mediaId)
  String? get animeId;
  @override
  @JsonKey(name: MediaListTableColumns.status)
  MediaListStatus? get status;
  @override
  @JsonKey(name: MediaListTableColumns.progress)
  int? get progress;
  @override
  @JsonKey(name: MediaListTableColumns.score)
  int? get score;
  @override
  @JsonKey(name: MediaListTableColumns.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MediaListEntityCopyWith<_$_MediaListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}