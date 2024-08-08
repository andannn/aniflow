// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_data_change_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaDataChangeNotificationDto _$MediaDataChangeNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _MediaDataChangeNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$MediaDataChangeNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaId')
  int? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'context')
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  /// Serializes this MediaDataChangeNotificationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaDataChangeNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaDataChangeNotificationDtoCopyWith<MediaDataChangeNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDataChangeNotificationDtoCopyWith<$Res> {
  factory $MediaDataChangeNotificationDtoCopyWith(
          MediaDataChangeNotificationDto value,
          $Res Function(MediaDataChangeNotificationDto) then) =
      _$MediaDataChangeNotificationDtoCopyWithImpl<$Res,
          MediaDataChangeNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$MediaDataChangeNotificationDtoCopyWithImpl<$Res,
        $Val extends MediaDataChangeNotificationDto>
    implements $MediaDataChangeNotificationDtoCopyWith<$Res> {
  _$MediaDataChangeNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaDataChangeNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
    Object? reason = freezed,
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
              as int?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ) as $Val);
  }

  /// Create a copy of MediaDataChangeNotificationDto
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
abstract class _$$MediaDataChangeNotificationDtoImplCopyWith<$Res>
    implements $MediaDataChangeNotificationDtoCopyWith<$Res> {
  factory _$$MediaDataChangeNotificationDtoImplCopyWith(
          _$MediaDataChangeNotificationDtoImpl value,
          $Res Function(_$MediaDataChangeNotificationDtoImpl) then) =
      __$$MediaDataChangeNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$MediaDataChangeNotificationDtoImplCopyWithImpl<$Res>
    extends _$MediaDataChangeNotificationDtoCopyWithImpl<$Res,
        _$MediaDataChangeNotificationDtoImpl>
    implements _$$MediaDataChangeNotificationDtoImplCopyWith<$Res> {
  __$$MediaDataChangeNotificationDtoImplCopyWithImpl(
      _$MediaDataChangeNotificationDtoImpl _value,
      $Res Function(_$MediaDataChangeNotificationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaDataChangeNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
    Object? reason = freezed,
    Object? media = freezed,
  }) {
    return _then(_$MediaDataChangeNotificationDtoImpl(
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
              as int?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
class _$MediaDataChangeNotificationDtoImpl
    implements _MediaDataChangeNotificationDto {
  _$MediaDataChangeNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'media') this.media});

  factory _$MediaDataChangeNotificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MediaDataChangeNotificationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'mediaId')
  final int? mediaId;
  @override
  @JsonKey(name: 'context')
  final String? context;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaDataChangeNotificationDto(id: $id, type: $type, mediaId: $mediaId, context: $context, createdAt: $createdAt, reason: $reason, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaDataChangeNotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, mediaId, context, createdAt, reason, media);

  /// Create a copy of MediaDataChangeNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaDataChangeNotificationDtoImplCopyWith<
          _$MediaDataChangeNotificationDtoImpl>
      get copyWith => __$$MediaDataChangeNotificationDtoImplCopyWithImpl<
          _$MediaDataChangeNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaDataChangeNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaDataChangeNotificationDto
    implements MediaDataChangeNotificationDto {
  factory _MediaDataChangeNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'mediaId') final int? mediaId,
          @JsonKey(name: 'context') final String? context,
          @JsonKey(name: 'createdAt') final int? createdAt,
          @JsonKey(name: 'reason') final String? reason,
          @JsonKey(name: 'media') final MediaDto? media}) =
      _$MediaDataChangeNotificationDtoImpl;

  factory _MediaDataChangeNotificationDto.fromJson(Map<String, dynamic> json) =
      _$MediaDataChangeNotificationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'mediaId')
  int? get mediaId;
  @override
  @JsonKey(name: 'context')
  String? get context;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;

  /// Create a copy of MediaDataChangeNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaDataChangeNotificationDtoImplCopyWith<
          _$MediaDataChangeNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
