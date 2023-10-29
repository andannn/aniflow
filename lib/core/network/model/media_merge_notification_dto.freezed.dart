// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_merge_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaMergeNotificationDto _$MediaMergeNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _MediaMergeNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$MediaMergeNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaId')
  String? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deletedMediaTitle')
  List<String>? get deletedMediaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'contexts')
  List<String> get contexts => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaMergeNotificationDtoCopyWith<MediaMergeNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaMergeNotificationDtoCopyWith<$Res> {
  factory $MediaMergeNotificationDtoCopyWith(MediaMergeNotificationDto value,
          $Res Function(MediaMergeNotificationDto) then) =
      _$MediaMergeNotificationDtoCopyWithImpl<$Res, MediaMergeNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') String? mediaId,
      @JsonKey(name: 'deletedMediaTitle') List<String>? deletedMediaTitle,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$MediaMergeNotificationDtoCopyWithImpl<$Res,
        $Val extends MediaMergeNotificationDto>
    implements $MediaMergeNotificationDtoCopyWith<$Res> {
  _$MediaMergeNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? deletedMediaTitle = freezed,
    Object? reason = freezed,
    Object? contexts = null,
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
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedMediaTitle: freezed == deletedMediaTitle
          ? _value.deletedMediaTitle
          : deletedMediaTitle // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      contexts: null == contexts
          ? _value.contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_MediaMergeNotificationDtoCopyWith<$Res>
    implements $MediaMergeNotificationDtoCopyWith<$Res> {
  factory _$$_MediaMergeNotificationDtoCopyWith(
          _$_MediaMergeNotificationDto value,
          $Res Function(_$_MediaMergeNotificationDto) then) =
      __$$_MediaMergeNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') String? mediaId,
      @JsonKey(name: 'deletedMediaTitle') List<String>? deletedMediaTitle,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_MediaMergeNotificationDtoCopyWithImpl<$Res>
    extends _$MediaMergeNotificationDtoCopyWithImpl<$Res,
        _$_MediaMergeNotificationDto>
    implements _$$_MediaMergeNotificationDtoCopyWith<$Res> {
  __$$_MediaMergeNotificationDtoCopyWithImpl(
      _$_MediaMergeNotificationDto _value,
      $Res Function(_$_MediaMergeNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? deletedMediaTitle = freezed,
    Object? reason = freezed,
    Object? contexts = null,
    Object? media = freezed,
  }) {
    return _then(_$_MediaMergeNotificationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedMediaTitle: freezed == deletedMediaTitle
          ? _value._deletedMediaTitle
          : deletedMediaTitle // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      contexts: null == contexts
          ? _value._contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaMergeNotificationDto implements _MediaMergeNotificationDto {
  _$_MediaMergeNotificationDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'deletedMediaTitle') final List<String>? deletedMediaTitle,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'contexts') final List<String> contexts = const [],
      @JsonKey(name: 'media') this.media})
      : _deletedMediaTitle = deletedMediaTitle,
        _contexts = contexts;

  factory _$_MediaMergeNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaMergeNotificationDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'mediaId')
  final String? mediaId;
  final List<String>? _deletedMediaTitle;
  @override
  @JsonKey(name: 'deletedMediaTitle')
  List<String>? get deletedMediaTitle {
    final value = _deletedMediaTitle;
    if (value == null) return null;
    if (_deletedMediaTitle is EqualUnmodifiableListView)
      return _deletedMediaTitle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'reason')
  final String? reason;
  final List<String> _contexts;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaMergeNotificationDto(id: $id, type: $type, mediaId: $mediaId, deletedMediaTitle: $deletedMediaTitle, reason: $reason, contexts: $contexts, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaMergeNotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            const DeepCollectionEquality()
                .equals(other._deletedMediaTitle, _deletedMediaTitle) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      mediaId,
      const DeepCollectionEquality().hash(_deletedMediaTitle),
      reason,
      const DeepCollectionEquality().hash(_contexts),
      media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaMergeNotificationDtoCopyWith<_$_MediaMergeNotificationDto>
      get copyWith => __$$_MediaMergeNotificationDtoCopyWithImpl<
          _$_MediaMergeNotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaMergeNotificationDtoToJson(
      this,
    );
  }
}

abstract class _MediaMergeNotificationDto implements MediaMergeNotificationDto {
  factory _MediaMergeNotificationDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'type') final NotificationType? type,
      @JsonKey(name: 'mediaId') final String? mediaId,
      @JsonKey(name: 'deletedMediaTitle') final List<String>? deletedMediaTitle,
      @JsonKey(name: 'reason') final String? reason,
      @JsonKey(name: 'contexts') final List<String> contexts,
      @JsonKey(name: 'media')
      final MediaDto? media}) = _$_MediaMergeNotificationDto;

  factory _MediaMergeNotificationDto.fromJson(Map<String, dynamic> json) =
      _$_MediaMergeNotificationDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'mediaId')
  String? get mediaId;
  @override
  @JsonKey(name: 'deletedMediaTitle')
  List<String>? get deletedMediaTitle;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_MediaMergeNotificationDtoCopyWith<_$_MediaMergeNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}
