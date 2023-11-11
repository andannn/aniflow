// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_deletion_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaDeletionNotificationDto _$MediaDeletionNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _MediaDeletionNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$MediaDeletionNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'deletedMediaTitle')
  String? get deletedMediaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'context')
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaDeletionNotificationDtoCopyWith<MediaDeletionNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDeletionNotificationDtoCopyWith<$Res> {
  factory $MediaDeletionNotificationDtoCopyWith(
          MediaDeletionNotificationDto value,
          $Res Function(MediaDeletionNotificationDto) then) =
      _$MediaDeletionNotificationDtoCopyWithImpl<$Res,
          MediaDeletionNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'deletedMediaTitle') String? deletedMediaTitle,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt});
}

/// @nodoc
class _$MediaDeletionNotificationDtoCopyWithImpl<$Res,
        $Val extends MediaDeletionNotificationDto>
    implements $MediaDeletionNotificationDtoCopyWith<$Res> {
  _$MediaDeletionNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? deletedMediaTitle = freezed,
    Object? reason = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
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
      deletedMediaTitle: freezed == deletedMediaTitle
          ? _value.deletedMediaTitle
          : deletedMediaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaDeletionNotificationDtoCopyWith<$Res>
    implements $MediaDeletionNotificationDtoCopyWith<$Res> {
  factory _$$_MediaDeletionNotificationDtoCopyWith(
          _$_MediaDeletionNotificationDto value,
          $Res Function(_$_MediaDeletionNotificationDto) then) =
      __$$_MediaDeletionNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'deletedMediaTitle') String? deletedMediaTitle,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt});
}

/// @nodoc
class __$$_MediaDeletionNotificationDtoCopyWithImpl<$Res>
    extends _$MediaDeletionNotificationDtoCopyWithImpl<$Res,
        _$_MediaDeletionNotificationDto>
    implements _$$_MediaDeletionNotificationDtoCopyWith<$Res> {
  __$$_MediaDeletionNotificationDtoCopyWithImpl(
      _$_MediaDeletionNotificationDto _value,
      $Res Function(_$_MediaDeletionNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? deletedMediaTitle = freezed,
    Object? reason = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MediaDeletionNotificationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      deletedMediaTitle: freezed == deletedMediaTitle
          ? _value.deletedMediaTitle
          : deletedMediaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaDeletionNotificationDto implements _MediaDeletionNotificationDto {
  _$_MediaDeletionNotificationDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'deletedMediaTitle') this.deletedMediaTitle,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt});

  factory _$_MediaDeletionNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaDeletionNotificationDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'deletedMediaTitle')
  final String? deletedMediaTitle;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'context')
  final String? context;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;

  @override
  String toString() {
    return 'MediaDeletionNotificationDto(id: $id, type: $type, deletedMediaTitle: $deletedMediaTitle, reason: $reason, context: $context, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaDeletionNotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.deletedMediaTitle, deletedMediaTitle) ||
                other.deletedMediaTitle == deletedMediaTitle) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, deletedMediaTitle, reason, context, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaDeletionNotificationDtoCopyWith<_$_MediaDeletionNotificationDto>
      get copyWith => __$$_MediaDeletionNotificationDtoCopyWithImpl<
          _$_MediaDeletionNotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaDeletionNotificationDtoToJson(
      this,
    );
  }
}

abstract class _MediaDeletionNotificationDto
    implements MediaDeletionNotificationDto {
  factory _MediaDeletionNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'deletedMediaTitle') final String? deletedMediaTitle,
          @JsonKey(name: 'reason') final String? reason,
          @JsonKey(name: 'context') final String? context,
          @JsonKey(name: 'createdAt') final int? createdAt}) =
      _$_MediaDeletionNotificationDto;

  factory _MediaDeletionNotificationDto.fromJson(Map<String, dynamic> json) =
      _$_MediaDeletionNotificationDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'deletedMediaTitle')
  String? get deletedMediaTitle;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'context')
  String? get context;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MediaDeletionNotificationDtoCopyWith<_$_MediaDeletionNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}
