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
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'context')
  String? get context => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'context') String? context,
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
    Object? createdAt = freezed,
    Object? reason = freezed,
    Object? context = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$MediaMergeNotificationDtoImplCopyWith<$Res>
    implements $MediaMergeNotificationDtoCopyWith<$Res> {
  factory _$$MediaMergeNotificationDtoImplCopyWith(
          _$MediaMergeNotificationDtoImpl value,
          $Res Function(_$MediaMergeNotificationDtoImpl) then) =
      __$$MediaMergeNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') String? mediaId,
      @JsonKey(name: 'deletedMediaTitle') List<String>? deletedMediaTitle,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$MediaMergeNotificationDtoImplCopyWithImpl<$Res>
    extends _$MediaMergeNotificationDtoCopyWithImpl<$Res,
        _$MediaMergeNotificationDtoImpl>
    implements _$$MediaMergeNotificationDtoImplCopyWith<$Res> {
  __$$MediaMergeNotificationDtoImplCopyWithImpl(
      _$MediaMergeNotificationDtoImpl _value,
      $Res Function(_$MediaMergeNotificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? deletedMediaTitle = freezed,
    Object? createdAt = freezed,
    Object? reason = freezed,
    Object? context = freezed,
    Object? media = freezed,
  }) {
    return _then(_$MediaMergeNotificationDtoImpl(
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaMergeNotificationDtoImpl implements _MediaMergeNotificationDto {
  _$MediaMergeNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'deletedMediaTitle') final List<String>? deletedMediaTitle,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'media') this.media})
      : _deletedMediaTitle = deletedMediaTitle;

  factory _$MediaMergeNotificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaMergeNotificationDtoImplFromJson(json);

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
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'context')
  final String? context;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaMergeNotificationDto(id: $id, type: $type, mediaId: $mediaId, deletedMediaTitle: $deletedMediaTitle, createdAt: $createdAt, reason: $reason, context: $context, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaMergeNotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            const DeepCollectionEquality()
                .equals(other._deletedMediaTitle, _deletedMediaTitle) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.context, context) || other.context == context) &&
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
      createdAt,
      reason,
      context,
      media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaMergeNotificationDtoImplCopyWith<_$MediaMergeNotificationDtoImpl>
      get copyWith => __$$MediaMergeNotificationDtoImplCopyWithImpl<
          _$MediaMergeNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaMergeNotificationDtoImplToJson(
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
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'reason') final String? reason,
      @JsonKey(name: 'context') final String? context,
      @JsonKey(name: 'media')
      final MediaDto? media}) = _$MediaMergeNotificationDtoImpl;

  factory _MediaMergeNotificationDto.fromJson(Map<String, dynamic> json) =
      _$MediaMergeNotificationDtoImpl.fromJson;

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
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'context')
  String? get context;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$MediaMergeNotificationDtoImplCopyWith<_$MediaMergeNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
