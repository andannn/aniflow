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
  @JsonKey(name: MediaListTableColumns.progressVolumes)
  int? get progressVolumes => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.notes)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.startedAt)
  int? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.completedAt)
  int? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.score)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.repeat)
  int? get repeat => throw _privateConstructorUsedError;
  @JsonKey(name: MediaListTableColumns.private)
  int? get private => throw _privateConstructorUsedError;

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
      @JsonKey(name: MediaListTableColumns.progressVolumes)
      int? progressVolumes,
      @JsonKey(name: MediaListTableColumns.notes) String? notes,
      @JsonKey(name: MediaListTableColumns.startedAt) int? startedAt,
      @JsonKey(name: MediaListTableColumns.completedAt) int? completedAt,
      @JsonKey(name: MediaListTableColumns.score) double? score,
      @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt,
      @JsonKey(name: MediaListTableColumns.repeat) int? repeat,
      @JsonKey(name: MediaListTableColumns.private) int? private});
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
    Object? progressVolumes = freezed,
    Object? notes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
    Object? repeat = freezed,
    Object? private = freezed,
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
      progressVolumes: freezed == progressVolumes
          ? _value.progressVolumes
          : progressVolumes // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaListEntityImplCopyWith<$Res>
    implements $MediaListEntityCopyWith<$Res> {
  factory _$$MediaListEntityImplCopyWith(_$MediaListEntityImpl value,
          $Res Function(_$MediaListEntityImpl) then) =
      __$$MediaListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: MediaListTableColumns.id) String id,
      @JsonKey(name: MediaListTableColumns.userId) String? userId,
      @JsonKey(name: MediaListTableColumns.mediaId) String? animeId,
      @JsonKey(name: MediaListTableColumns.status) MediaListStatus? status,
      @JsonKey(name: MediaListTableColumns.progress) int? progress,
      @JsonKey(name: MediaListTableColumns.progressVolumes)
      int? progressVolumes,
      @JsonKey(name: MediaListTableColumns.notes) String? notes,
      @JsonKey(name: MediaListTableColumns.startedAt) int? startedAt,
      @JsonKey(name: MediaListTableColumns.completedAt) int? completedAt,
      @JsonKey(name: MediaListTableColumns.score) double? score,
      @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt,
      @JsonKey(name: MediaListTableColumns.repeat) int? repeat,
      @JsonKey(name: MediaListTableColumns.private) int? private});
}

/// @nodoc
class __$$MediaListEntityImplCopyWithImpl<$Res>
    extends _$MediaListEntityCopyWithImpl<$Res, _$MediaListEntityImpl>
    implements _$$MediaListEntityImplCopyWith<$Res> {
  __$$MediaListEntityImplCopyWithImpl(
      _$MediaListEntityImpl _value, $Res Function(_$MediaListEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? animeId = freezed,
    Object? status = freezed,
    Object? progress = freezed,
    Object? progressVolumes = freezed,
    Object? notes = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
    Object? repeat = freezed,
    Object? private = freezed,
  }) {
    return _then(_$MediaListEntityImpl(
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
      progressVolumes: freezed == progressVolumes
          ? _value.progressVolumes
          : progressVolumes // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListEntityImpl implements _MediaListEntity {
  _$MediaListEntityImpl(
      {@JsonKey(name: MediaListTableColumns.id) this.id = '',
      @JsonKey(name: MediaListTableColumns.userId) this.userId,
      @JsonKey(name: MediaListTableColumns.mediaId) this.animeId,
      @JsonKey(name: MediaListTableColumns.status) this.status,
      @JsonKey(name: MediaListTableColumns.progress) this.progress,
      @JsonKey(name: MediaListTableColumns.progressVolumes)
      this.progressVolumes,
      @JsonKey(name: MediaListTableColumns.notes) this.notes,
      @JsonKey(name: MediaListTableColumns.startedAt) this.startedAt,
      @JsonKey(name: MediaListTableColumns.completedAt) this.completedAt,
      @JsonKey(name: MediaListTableColumns.score) this.score,
      @JsonKey(name: MediaListTableColumns.updatedAt) this.updatedAt,
      @JsonKey(name: MediaListTableColumns.repeat) this.repeat,
      @JsonKey(name: MediaListTableColumns.private) this.private});

  factory _$MediaListEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListEntityImplFromJson(json);

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
  @JsonKey(name: MediaListTableColumns.progressVolumes)
  final int? progressVolumes;
  @override
  @JsonKey(name: MediaListTableColumns.notes)
  final String? notes;
  @override
  @JsonKey(name: MediaListTableColumns.startedAt)
  final int? startedAt;
  @override
  @JsonKey(name: MediaListTableColumns.completedAt)
  final int? completedAt;
  @override
  @JsonKey(name: MediaListTableColumns.score)
  final double? score;
  @override
  @JsonKey(name: MediaListTableColumns.updatedAt)
  final int? updatedAt;
  @override
  @JsonKey(name: MediaListTableColumns.repeat)
  final int? repeat;
  @override
  @JsonKey(name: MediaListTableColumns.private)
  final int? private;

  @override
  String toString() {
    return 'MediaListEntity(id: $id, userId: $userId, animeId: $animeId, status: $status, progress: $progress, progressVolumes: $progressVolumes, notes: $notes, startedAt: $startedAt, completedAt: $completedAt, score: $score, updatedAt: $updatedAt, repeat: $repeat, private: $private)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.animeId, animeId) || other.animeId == animeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.progressVolumes, progressVolumes) ||
                other.progressVolumes == progressVolumes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.private, private) || other.private == private));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      animeId,
      status,
      progress,
      progressVolumes,
      notes,
      startedAt,
      completedAt,
      score,
      updatedAt,
      repeat,
      private);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListEntityImplCopyWith<_$MediaListEntityImpl> get copyWith =>
      __$$MediaListEntityImplCopyWithImpl<_$MediaListEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListEntityImplToJson(
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
      @JsonKey(name: MediaListTableColumns.progressVolumes)
      final int? progressVolumes,
      @JsonKey(name: MediaListTableColumns.notes) final String? notes,
      @JsonKey(name: MediaListTableColumns.startedAt) final int? startedAt,
      @JsonKey(name: MediaListTableColumns.completedAt) final int? completedAt,
      @JsonKey(name: MediaListTableColumns.score) final double? score,
      @JsonKey(name: MediaListTableColumns.updatedAt) final int? updatedAt,
      @JsonKey(name: MediaListTableColumns.repeat) final int? repeat,
      @JsonKey(name: MediaListTableColumns.private)
      final int? private}) = _$MediaListEntityImpl;

  factory _MediaListEntity.fromJson(Map<String, dynamic> json) =
      _$MediaListEntityImpl.fromJson;

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
  @JsonKey(name: MediaListTableColumns.progressVolumes)
  int? get progressVolumes;
  @override
  @JsonKey(name: MediaListTableColumns.notes)
  String? get notes;
  @override
  @JsonKey(name: MediaListTableColumns.startedAt)
  int? get startedAt;
  @override
  @JsonKey(name: MediaListTableColumns.completedAt)
  int? get completedAt;
  @override
  @JsonKey(name: MediaListTableColumns.score)
  double? get score;
  @override
  @JsonKey(name: MediaListTableColumns.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(name: MediaListTableColumns.repeat)
  int? get repeat;
  @override
  @JsonKey(name: MediaListTableColumns.private)
  int? get private;
  @override
  @JsonKey(ignore: true)
  _$$MediaListEntityImplCopyWith<_$MediaListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
