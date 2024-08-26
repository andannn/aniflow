// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_reply_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityReplyNotificationDto _$ActivityReplyNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _ActivityReplyNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityReplyNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityId')
  int? get activityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'context')
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDto? get user => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  AniActivity? get activity => throw _privateConstructorUsedError;

  /// Serializes this ActivityReplyNotificationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityReplyNotificationDtoCopyWith<ActivityReplyNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReplyNotificationDtoCopyWith<$Res> {
  factory $ActivityReplyNotificationDtoCopyWith(
          ActivityReplyNotificationDto value,
          $Res Function(ActivityReplyNotificationDto) then) =
      _$ActivityReplyNotificationDtoCopyWithImpl<$Res,
          ActivityReplyNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'activityId') int? activityId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AniActivity? activity});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivityReplyNotificationDtoCopyWithImpl<$Res,
        $Val extends ActivityReplyNotificationDto>
    implements $ActivityReplyNotificationDtoCopyWith<$Res> {
  _$ActivityReplyNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? activityId = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
    Object? activity = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as AniActivity?,
    ) as $Val);
  }

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityReplyNotificationDtoImplCopyWith<$Res>
    implements $ActivityReplyNotificationDtoCopyWith<$Res> {
  factory _$$ActivityReplyNotificationDtoImplCopyWith(
          _$ActivityReplyNotificationDtoImpl value,
          $Res Function(_$ActivityReplyNotificationDtoImpl) then) =
      __$$ActivityReplyNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'activityId') int? activityId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AniActivity? activity});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ActivityReplyNotificationDtoImplCopyWithImpl<$Res>
    extends _$ActivityReplyNotificationDtoCopyWithImpl<$Res,
        _$ActivityReplyNotificationDtoImpl>
    implements _$$ActivityReplyNotificationDtoImplCopyWith<$Res> {
  __$$ActivityReplyNotificationDtoImplCopyWithImpl(
      _$ActivityReplyNotificationDtoImpl _value,
      $Res Function(_$ActivityReplyNotificationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? activityId = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
    Object? activity = freezed,
  }) {
    return _then(_$ActivityReplyNotificationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as AniActivity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityReplyNotificationDtoImpl
    implements _ActivityReplyNotificationDto {
  _$ActivityReplyNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'activityId') this.activityId,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user,
      @JsonKey(includeFromJson: false, includeToJson: false) this.activity});

  factory _$ActivityReplyNotificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActivityReplyNotificationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'activityId')
  final int? activityId;
  @override
  @JsonKey(name: 'context')
  final String? context;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'user')
  final UserDto? user;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final AniActivity? activity;

  @override
  String toString() {
    return 'ActivityReplyNotificationDto(id: $id, type: $type, userId: $userId, activityId: $activityId, context: $context, createdAt: $createdAt, user: $user, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityReplyNotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.activity, activity) ||
                other.activity == activity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, userId, activityId,
      context, createdAt, user, activity);

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityReplyNotificationDtoImplCopyWith<
          _$ActivityReplyNotificationDtoImpl>
      get copyWith => __$$ActivityReplyNotificationDtoImplCopyWithImpl<
          _$ActivityReplyNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityReplyNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityReplyNotificationDto
    implements ActivityReplyNotificationDto {
  factory _ActivityReplyNotificationDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'type') final NotificationType? type,
      @JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'activityId') final int? activityId,
      @JsonKey(name: 'context') final String? context,
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'user') final UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AniActivity? activity}) = _$ActivityReplyNotificationDtoImpl;

  factory _ActivityReplyNotificationDto.fromJson(Map<String, dynamic> json) =
      _$ActivityReplyNotificationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'activityId')
  int? get activityId;
  @override
  @JsonKey(name: 'context')
  String? get context;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'user')
  UserDto? get user;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  AniActivity? get activity;

  /// Create a copy of ActivityReplyNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityReplyNotificationDtoImplCopyWith<
          _$ActivityReplyNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
