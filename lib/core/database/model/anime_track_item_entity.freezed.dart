// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_track_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimeTrackItemEntity _$AnimeTrackItemEntityFromJson(Map<String, dynamic> json) {
  return _AnimeTrackItemEntity.fromJson(json);
}

/// @nodoc
mixin _$AnimeTrackItemEntity {
  @JsonKey(name: AnimeTrackItemTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.animeId)
  String? get animeId => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.status)
  AnimeListStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.progress)
  int? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.score)
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTrackItemTableColumns.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeTrackItemEntityCopyWith<AnimeTrackItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeTrackItemEntityCopyWith<$Res> {
  factory $AnimeTrackItemEntityCopyWith(AnimeTrackItemEntity value,
          $Res Function(AnimeTrackItemEntity) then) =
      _$AnimeTrackItemEntityCopyWithImpl<$Res, AnimeTrackItemEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTrackItemTableColumns.id) String id,
      @JsonKey(name: AnimeTrackItemTableColumns.userId) String? userId,
      @JsonKey(name: AnimeTrackItemTableColumns.animeId) String? animeId,
      @JsonKey(name: AnimeTrackItemTableColumns.status) AnimeListStatus? status,
      @JsonKey(name: AnimeTrackItemTableColumns.progress) int? progress,
      @JsonKey(name: AnimeTrackItemTableColumns.score) int? score,
      @JsonKey(name: AnimeTrackItemTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class _$AnimeTrackItemEntityCopyWithImpl<$Res,
        $Val extends AnimeTrackItemEntity>
    implements $AnimeTrackItemEntityCopyWith<$Res> {
  _$AnimeTrackItemEntityCopyWithImpl(this._value, this._then);

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
              as AnimeListStatus?,
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
abstract class _$$_AnimeTrackItemEntityCopyWith<$Res>
    implements $AnimeTrackItemEntityCopyWith<$Res> {
  factory _$$_AnimeTrackItemEntityCopyWith(_$_AnimeTrackItemEntity value,
          $Res Function(_$_AnimeTrackItemEntity) then) =
      __$$_AnimeTrackItemEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTrackItemTableColumns.id) String id,
      @JsonKey(name: AnimeTrackItemTableColumns.userId) String? userId,
      @JsonKey(name: AnimeTrackItemTableColumns.animeId) String? animeId,
      @JsonKey(name: AnimeTrackItemTableColumns.status) AnimeListStatus? status,
      @JsonKey(name: AnimeTrackItemTableColumns.progress) int? progress,
      @JsonKey(name: AnimeTrackItemTableColumns.score) int? score,
      @JsonKey(name: AnimeTrackItemTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class __$$_AnimeTrackItemEntityCopyWithImpl<$Res>
    extends _$AnimeTrackItemEntityCopyWithImpl<$Res, _$_AnimeTrackItemEntity>
    implements _$$_AnimeTrackItemEntityCopyWith<$Res> {
  __$$_AnimeTrackItemEntityCopyWithImpl(_$_AnimeTrackItemEntity _value,
      $Res Function(_$_AnimeTrackItemEntity) _then)
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
    return _then(_$_AnimeTrackItemEntity(
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
              as AnimeListStatus?,
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
class _$_AnimeTrackItemEntity implements _AnimeTrackItemEntity {
  _$_AnimeTrackItemEntity(
      {@JsonKey(name: AnimeTrackItemTableColumns.id) this.id = '',
      @JsonKey(name: AnimeTrackItemTableColumns.userId) this.userId,
      @JsonKey(name: AnimeTrackItemTableColumns.animeId) this.animeId,
      @JsonKey(name: AnimeTrackItemTableColumns.status) this.status,
      @JsonKey(name: AnimeTrackItemTableColumns.progress) this.progress,
      @JsonKey(name: AnimeTrackItemTableColumns.score) this.score,
      @JsonKey(name: AnimeTrackItemTableColumns.updatedAt) this.updatedAt});

  factory _$_AnimeTrackItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeTrackItemEntityFromJson(json);

  @override
  @JsonKey(name: AnimeTrackItemTableColumns.id)
  final String id;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.userId)
  final String? userId;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.animeId)
  final String? animeId;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.status)
  final AnimeListStatus? status;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.progress)
  final int? progress;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.score)
  final int? score;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.updatedAt)
  final int? updatedAt;

  @override
  String toString() {
    return 'AnimeTrackItemEntity(id: $id, userId: $userId, animeId: $animeId, status: $status, progress: $progress, score: $score, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeTrackItemEntity &&
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
  _$$_AnimeTrackItemEntityCopyWith<_$_AnimeTrackItemEntity> get copyWith =>
      __$$_AnimeTrackItemEntityCopyWithImpl<_$_AnimeTrackItemEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeTrackItemEntityToJson(
      this,
    );
  }
}

abstract class _AnimeTrackItemEntity implements AnimeTrackItemEntity {
  factory _AnimeTrackItemEntity(
      {@JsonKey(name: AnimeTrackItemTableColumns.id) final String id,
      @JsonKey(name: AnimeTrackItemTableColumns.userId) final String? userId,
      @JsonKey(name: AnimeTrackItemTableColumns.animeId) final String? animeId,
      @JsonKey(name: AnimeTrackItemTableColumns.status)
      final AnimeListStatus? status,
      @JsonKey(name: AnimeTrackItemTableColumns.progress) final int? progress,
      @JsonKey(name: AnimeTrackItemTableColumns.score) final int? score,
      @JsonKey(name: AnimeTrackItemTableColumns.updatedAt)
      final int? updatedAt}) = _$_AnimeTrackItemEntity;

  factory _AnimeTrackItemEntity.fromJson(Map<String, dynamic> json) =
      _$_AnimeTrackItemEntity.fromJson;

  @override
  @JsonKey(name: AnimeTrackItemTableColumns.id)
  String get id;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.userId)
  String? get userId;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.animeId)
  String? get animeId;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.status)
  AnimeListStatus? get status;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.progress)
  int? get progress;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.score)
  int? get score;
  @override
  @JsonKey(name: AnimeTrackItemTableColumns.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeTrackItemEntityCopyWith<_$_AnimeTrackItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
