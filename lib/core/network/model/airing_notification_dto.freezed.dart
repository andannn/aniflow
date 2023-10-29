// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AiringNotificationDto _$AiringNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _AiringNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$AiringNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'animeId')
  int? get animeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode')
  int? get episode => throw _privateConstructorUsedError;
  @JsonKey(name: 'contexts')
  List<String> get contexts => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiringNotificationDtoCopyWith<AiringNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringNotificationDtoCopyWith<$Res> {
  factory $AiringNotificationDtoCopyWith(AiringNotificationDto value,
          $Res Function(AiringNotificationDto) then) =
      _$AiringNotificationDtoCopyWithImpl<$Res, AiringNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'animeId') int? animeId,
      @JsonKey(name: 'episode') int? episode,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$AiringNotificationDtoCopyWithImpl<$Res,
        $Val extends AiringNotificationDto>
    implements $AiringNotificationDtoCopyWith<$Res> {
  _$AiringNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? animeId = freezed,
    Object? episode = freezed,
    Object? contexts = null,
    Object? createdAt = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
      contexts: null == contexts
          ? _value.contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_AiringNotificationDtoCopyWith<$Res>
    implements $AiringNotificationDtoCopyWith<$Res> {
  factory _$$_AiringNotificationDtoCopyWith(_$_AiringNotificationDto value,
          $Res Function(_$_AiringNotificationDto) then) =
      __$$_AiringNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'animeId') int? animeId,
      @JsonKey(name: 'episode') int? episode,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_AiringNotificationDtoCopyWithImpl<$Res>
    extends _$AiringNotificationDtoCopyWithImpl<$Res, _$_AiringNotificationDto>
    implements _$$_AiringNotificationDtoCopyWith<$Res> {
  __$$_AiringNotificationDtoCopyWithImpl(_$_AiringNotificationDto _value,
      $Res Function(_$_AiringNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? animeId = freezed,
    Object? episode = freezed,
    Object? contexts = null,
    Object? createdAt = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_AiringNotificationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
      contexts: null == contexts
          ? _value._contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$_AiringNotificationDto implements _AiringNotificationDto {
  _$_AiringNotificationDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'animeId') this.animeId,
      @JsonKey(name: 'episode') this.episode,
      @JsonKey(name: 'contexts') final List<String> contexts = const [],
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'media') this.media})
      : _contexts = contexts;

  factory _$_AiringNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_AiringNotificationDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'animeId')
  final int? animeId;
  @override
  @JsonKey(name: 'episode')
  final int? episode;
  final List<String> _contexts;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'AiringNotificationDto(id: $id, type: $type, animeId: $animeId, episode: $episode, contexts: $contexts, createdAt: $createdAt, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiringNotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.animeId, animeId) || other.animeId == animeId) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, animeId, episode,
      const DeepCollectionEquality().hash(_contexts), createdAt, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiringNotificationDtoCopyWith<_$_AiringNotificationDto> get copyWith =>
      __$$_AiringNotificationDtoCopyWithImpl<_$_AiringNotificationDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiringNotificationDtoToJson(
      this,
    );
  }
}

abstract class _AiringNotificationDto implements AiringNotificationDto {
  factory _AiringNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'animeId') final int? animeId,
          @JsonKey(name: 'episode') final int? episode,
          @JsonKey(name: 'contexts') final List<String> contexts,
          @JsonKey(name: 'createdAt') final int? createdAt,
          @JsonKey(name: 'media') final MediaDto? media}) =
      _$_AiringNotificationDto;

  factory _AiringNotificationDto.fromJson(Map<String, dynamic> json) =
      _$_AiringNotificationDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'animeId')
  int? get animeId;
  @override
  @JsonKey(name: 'episode')
  int? get episode;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_AiringNotificationDtoCopyWith<_$_AiringNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
