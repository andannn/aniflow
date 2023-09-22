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
  @JsonKey(name: 'status')
  AnimeListStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress')
  int get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  int get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  ShortcutAnimeDto? get media => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'status') AnimeListStatus? status,
      @JsonKey(name: 'progress') int progress,
      @JsonKey(name: 'updatedAt') int updatedAt,
      @JsonKey(name: 'media') ShortcutAnimeDto? media});

  $ShortcutAnimeDtoCopyWith<$Res>? get media;
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeListStatus?,
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
abstract class _$$_MediaListDtoCopyWith<$Res>
    implements $MediaListDtoCopyWith<$Res> {
  factory _$$_MediaListDtoCopyWith(
          _$_MediaListDto value, $Res Function(_$_MediaListDto) then) =
      __$$_MediaListDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'status') AnimeListStatus? status,
      @JsonKey(name: 'progress') int progress,
      @JsonKey(name: 'updatedAt') int updatedAt,
      @JsonKey(name: 'media') ShortcutAnimeDto? media});

  @override
  $ShortcutAnimeDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_MediaListDtoCopyWithImpl<$Res>
    extends _$MediaListDtoCopyWithImpl<$Res, _$_MediaListDto>
    implements _$$_MediaListDtoCopyWith<$Res> {
  __$$_MediaListDtoCopyWithImpl(
      _$_MediaListDto _value, $Res Function(_$_MediaListDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? progress = null,
    Object? updatedAt = null,
    Object? media = freezed,
  }) {
    return _then(_$_MediaListDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeListStatus?,
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
              as ShortcutAnimeDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaListDto implements _MediaListDto {
  _$_MediaListDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'progress') this.progress = -1,
      @JsonKey(name: 'updatedAt') this.updatedAt = -1,
      @JsonKey(name: 'media') this.media});

  factory _$_MediaListDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaListDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'status')
  final AnimeListStatus? status;
  @override
  @JsonKey(name: 'progress')
  final int progress;
  @override
  @JsonKey(name: 'updatedAt')
  final int updatedAt;
  @override
  @JsonKey(name: 'media')
  final ShortcutAnimeDto? media;

  @override
  String toString() {
    return 'MediaListDto(id: $id, status: $status, progress: $progress, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaListDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, progress, updatedAt, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaListDtoCopyWith<_$_MediaListDto> get copyWith =>
      __$$_MediaListDtoCopyWithImpl<_$_MediaListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaListDtoToJson(
      this,
    );
  }
}

abstract class _MediaListDto implements MediaListDto {
  factory _MediaListDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'status') final AnimeListStatus? status,
      @JsonKey(name: 'progress') final int progress,
      @JsonKey(name: 'updatedAt') final int updatedAt,
      @JsonKey(name: 'media') final ShortcutAnimeDto? media}) = _$_MediaListDto;

  factory _MediaListDto.fromJson(Map<String, dynamic> json) =
      _$_MediaListDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'status')
  AnimeListStatus? get status;
  @override
  @JsonKey(name: 'progress')
  int get progress;
  @override
  @JsonKey(name: 'updatedAt')
  int get updatedAt;
  @override
  @JsonKey(name: 'media')
  ShortcutAnimeDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_MediaListDtoCopyWith<_$_MediaListDto> get copyWith =>
      throw _privateConstructorUsedError;
}