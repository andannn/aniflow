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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  ShortcutAnimeDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'media') ShortcutAnimeDto? media});

  $ShortcutAnimeDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$AiringScheduleDtoCopyWithImpl<$Res, $Val extends AiringScheduleDto>
    implements $AiringScheduleDtoCopyWith<$Res> {
  _$AiringScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as ShortcutAnimeDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortcutAnimeDtoCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $ShortcutAnimeDtoCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AiringScheduleDtoCopyWith<$Res>
    implements $AiringScheduleDtoCopyWith<$Res> {
  factory _$$_AiringScheduleDtoCopyWith(_$_AiringScheduleDto value,
          $Res Function(_$_AiringScheduleDto) then) =
      __$$_AiringScheduleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'airingAt') int? airingAt,
      @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
      @JsonKey(name: 'episode') int? episode,
      @JsonKey(name: 'media') ShortcutAnimeDto? media});

  @override
  $ShortcutAnimeDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_AiringScheduleDtoCopyWithImpl<$Res>
    extends _$AiringScheduleDtoCopyWithImpl<$Res, _$_AiringScheduleDto>
    implements _$$_AiringScheduleDtoCopyWith<$Res> {
  __$$_AiringScheduleDtoCopyWithImpl(
      _$_AiringScheduleDto _value, $Res Function(_$_AiringScheduleDto) _then)
      : super(_value, _then);

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
    return _then(_$_AiringScheduleDto(
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
              as ShortcutAnimeDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AiringScheduleDto implements _AiringScheduleDto {
  _$_AiringScheduleDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'airingAt') this.airingAt,
      @JsonKey(name: 'timeUntilAiring') this.timeUntilAiring,
      @JsonKey(name: 'episode') this.episode,
      @JsonKey(name: 'media') this.media});

  factory _$_AiringScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$$_AiringScheduleDtoFromJson(json);

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
  final ShortcutAnimeDto? media;

  @override
  String toString() {
    return 'AiringScheduleDto(id: $id, mediaId: $mediaId, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiringScheduleDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, mediaId, airingAt, timeUntilAiring, episode, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiringScheduleDtoCopyWith<_$_AiringScheduleDto> get copyWith =>
      __$$_AiringScheduleDtoCopyWithImpl<_$_AiringScheduleDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiringScheduleDtoToJson(
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
          @JsonKey(name: 'media') final ShortcutAnimeDto? media}) =
      _$_AiringScheduleDto;

  factory _AiringScheduleDto.fromJson(Map<String, dynamic> json) =
      _$_AiringScheduleDto.fromJson;

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
  ShortcutAnimeDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_AiringScheduleDtoCopyWith<_$_AiringScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
