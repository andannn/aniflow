// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiringScheduleDto _$AiringScheduleDtoFromJson(Map<String, dynamic> json) {
  return _AiringScheduleDto.fromJson(json);
}

/// @nodoc
mixin _$AiringScheduleDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaId')
  int? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'airingAt')
  int? get airingAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeUntilAiring')
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode')
  int? get episode => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  /// Serializes this AiringScheduleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiringScheduleDtoCopyWith<AiringScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringScheduleDtoCopyWith<$Res> {
  factory $AiringScheduleDtoCopyWith(
          AiringScheduleDto value, $Res Function(AiringScheduleDto) then) =
      _$AiringScheduleDtoCopyWithImpl<$Res, AiringScheduleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'airingAt') int? airingAt,
      @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
      @JsonKey(name: 'episode') int? episode,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$AiringScheduleDtoCopyWithImpl<$Res, $Val extends AiringScheduleDto>
    implements $AiringScheduleDtoCopyWith<$Res> {
  _$AiringScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = freezed,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ) as $Val);
  }

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$AiringScheduleDtoImplCopyWith<$Res>
    implements $AiringScheduleDtoCopyWith<$Res> {
  factory _$$AiringScheduleDtoImplCopyWith(_$AiringScheduleDtoImpl value,
          $Res Function(_$AiringScheduleDtoImpl) then) =
      __$$AiringScheduleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'airingAt') int? airingAt,
      @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
      @JsonKey(name: 'episode') int? episode,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$AiringScheduleDtoImplCopyWithImpl<$Res>
    extends _$AiringScheduleDtoCopyWithImpl<$Res, _$AiringScheduleDtoImpl>
    implements _$$AiringScheduleDtoImplCopyWith<$Res> {
  __$$AiringScheduleDtoImplCopyWithImpl(_$AiringScheduleDtoImpl _value,
      $Res Function(_$AiringScheduleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = freezed,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
    Object? media = freezed,
  }) {
    return _then(_$AiringScheduleDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiringScheduleDtoImpl implements _AiringScheduleDto {
  _$AiringScheduleDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'airingAt') this.airingAt,
      @JsonKey(name: 'timeUntilAiring') this.timeUntilAiring,
      @JsonKey(name: 'episode') this.episode,
      @JsonKey(name: 'media') this.media});

  factory _$AiringScheduleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiringScheduleDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'mediaId')
  final int? mediaId;
  @override
  @JsonKey(name: 'airingAt')
  final int? airingAt;
  @override
  @JsonKey(name: 'timeUntilAiring')
  final int? timeUntilAiring;
  @override
  @JsonKey(name: 'episode')
  final int? episode;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'AiringScheduleDto(id: $id, mediaId: $mediaId, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiringScheduleDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, mediaId, airingAt, timeUntilAiring, episode, media);

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiringScheduleDtoImplCopyWith<_$AiringScheduleDtoImpl> get copyWith =>
      __$$AiringScheduleDtoImplCopyWithImpl<_$AiringScheduleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiringScheduleDtoImplToJson(
      this,
    );
  }
}

abstract class _AiringScheduleDto implements AiringScheduleDto {
  factory _AiringScheduleDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'mediaId') final int? mediaId,
      @JsonKey(name: 'airingAt') final int? airingAt,
      @JsonKey(name: 'timeUntilAiring') final int? timeUntilAiring,
      @JsonKey(name: 'episode') final int? episode,
      @JsonKey(name: 'media') final MediaDto? media}) = _$AiringScheduleDtoImpl;

  factory _AiringScheduleDto.fromJson(Map<String, dynamic> json) =
      _$AiringScheduleDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'mediaId')
  int? get mediaId;
  @override
  @JsonKey(name: 'airingAt')
  int? get airingAt;
  @override
  @JsonKey(name: 'timeUntilAiring')
  int? get timeUntilAiring;
  @override
  @JsonKey(name: 'episode')
  int? get episode;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;

  /// Create a copy of AiringScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiringScheduleDtoImplCopyWith<_$AiringScheduleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
