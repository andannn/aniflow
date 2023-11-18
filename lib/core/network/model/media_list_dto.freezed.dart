// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaListDto _$MediaListDtoFromJson(Map<String, dynamic> json) {
  return _MediaListDto.fromJson(json);
}

/// @nodoc
mixin _$MediaListDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  MediaListStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress')
  int get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  int get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaListDtoCopyWith<MediaListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListDtoCopyWith<$Res> {
  factory $MediaListDtoCopyWith(
          MediaListDto value, $Res Function(MediaListDto) then) =
      _$MediaListDtoCopyWithImpl<$Res, MediaListDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'status') MediaListStatus? status,
      @JsonKey(name: 'progress') int progress,
      @JsonKey(name: 'updatedAt') int updatedAt,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$MediaListDtoCopyWithImpl<$Res, $Val extends MediaListDto>
    implements $MediaListDtoCopyWith<$Res> {
  _$MediaListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? score = freezed,
    Object? status = freezed,
    Object? progress = null,
    Object? updatedAt = null,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaDtoCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaListDtoImplCopyWith<$Res>
    implements $MediaListDtoCopyWith<$Res> {
  factory _$$MediaListDtoImplCopyWith(
          _$MediaListDtoImpl value, $Res Function(_$MediaListDtoImpl) then) =
      __$$MediaListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'status') MediaListStatus? status,
      @JsonKey(name: 'progress') int progress,
      @JsonKey(name: 'updatedAt') int updatedAt,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$MediaListDtoImplCopyWithImpl<$Res>
    extends _$MediaListDtoCopyWithImpl<$Res, _$MediaListDtoImpl>
    implements _$$MediaListDtoImplCopyWith<$Res> {
  __$$MediaListDtoImplCopyWithImpl(
      _$MediaListDtoImpl _value, $Res Function(_$MediaListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? score = freezed,
    Object? status = freezed,
    Object? progress = null,
    Object? updatedAt = null,
    Object? media = freezed,
  }) {
    return _then(_$MediaListDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListDtoImpl implements _MediaListDto {
  _$MediaListDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'userId') this.userId = -1,
      @JsonKey(name: 'score') this.score,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'progress') this.progress = -1,
      @JsonKey(name: 'updatedAt') this.updatedAt = -1,
      @JsonKey(name: 'media') this.media});

  factory _$MediaListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'userId')
  final int userId;
  @override
  @JsonKey(name: 'score')
  final int? score;
  @override
  @JsonKey(name: 'status')
  final MediaListStatus? status;
  @override
  @JsonKey(name: 'progress')
  final int progress;
  @override
  @JsonKey(name: 'updatedAt')
  final int updatedAt;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaListDto(id: $id, userId: $userId, score: $score, status: $status, progress: $progress, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, score, status, progress, updatedAt, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListDtoImplCopyWith<_$MediaListDtoImpl> get copyWith =>
      __$$MediaListDtoImplCopyWithImpl<_$MediaListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaListDto implements MediaListDto {
  factory _MediaListDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'userId') final int userId,
      @JsonKey(name: 'score') final int? score,
      @JsonKey(name: 'status') final MediaListStatus? status,
      @JsonKey(name: 'progress') final int progress,
      @JsonKey(name: 'updatedAt') final int updatedAt,
      @JsonKey(name: 'media') final MediaDto? media}) = _$MediaListDtoImpl;

  factory _MediaListDto.fromJson(Map<String, dynamic> json) =
      _$MediaListDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'userId')
  int get userId;
  @override
  @JsonKey(name: 'score')
  int? get score;
  @override
  @JsonKey(name: 'status')
  MediaListStatus? get status;
  @override
  @JsonKey(name: 'progress')
  int get progress;
  @override
  @JsonKey(name: 'updatedAt')
  int get updatedAt;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$MediaListDtoImplCopyWith<_$MediaListDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
