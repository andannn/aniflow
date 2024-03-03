// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_message_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityMessageNotificationDto _$ActivityMessageNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _ActivityMessageNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityMessageNotificationDto {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityMessageNotificationDtoCopyWith<ActivityMessageNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityMessageNotificationDtoCopyWith<$Res> {
  factory $ActivityMessageNotificationDtoCopyWith(
          ActivityMessageNotificationDto value,
          $Res Function(ActivityMessageNotificationDto) then) =
      _$ActivityMessageNotificationDtoCopyWithImpl<$Res,
          ActivityMessageNotificationDto>;
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
class _$ActivityMessageNotificationDtoCopyWithImpl<$Res,
        $Val extends ActivityMessageNotificationDto>
    implements $ActivityMessageNotificationDtoCopyWith<$Res> {
  _$ActivityMessageNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$ActivityMessageNotificationDtoImplCopyWith<$Res>
    implements $ActivityMessageNotificationDtoCopyWith<$Res> {
  factory _$$ActivityMessageNotificationDtoImplCopyWith(
          _$ActivityMessageNotificationDtoImpl value,
          $Res Function(_$ActivityMessageNotificationDtoImpl) then) =
      __$$ActivityMessageNotificationDtoImplCopyWithImpl<$Res>;
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
class __$$ActivityMessageNotificationDtoImplCopyWithImpl<$Res>
    extends _$ActivityMessageNotificationDtoCopyWithImpl<$Res,
        _$ActivityMessageNotificationDtoImpl>
    implements _$$ActivityMessageNotificationDtoImplCopyWith<$Res> {
  __$$ActivityMessageNotificationDtoImplCopyWithImpl(
      _$ActivityMessageNotificationDtoImpl _value,
      $Res Function(_$ActivityMessageNotificationDtoImpl) _then)
      : super(_value, _then);

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
    return _then(_$ActivityMessageNotificationDtoImpl(
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
class _$ActivityMessageNotificationDtoImpl
    implements _ActivityMessageNotificationDto {
  _$ActivityMessageNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'activityId') this.activityId,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user,
      @JsonKey(includeFromJson: false, includeToJson: false) this.activity});

  factory _$ActivityMessageNotificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActivityMessageNotificationDtoImplFromJson(json);

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
    return 'ActivityMessageNotificationDto(id: $id, type: $type, userId: $userId, activityId: $activityId, context: $context, createdAt: $createdAt, user: $user, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityMessageNotificationDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, userId, activityId,
      context, createdAt, user, activity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityMessageNotificationDtoImplCopyWith<
          _$ActivityMessageNotificationDtoImpl>
      get copyWith => __$$ActivityMessageNotificationDtoImplCopyWithImpl<
          _$ActivityMessageNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityMessageNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityMessageNotificationDto
    implements ActivityMessageNotificationDto {
  factory _ActivityMessageNotificationDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'type') final NotificationType? type,
      @JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'activityId') final int? activityId,
      @JsonKey(name: 'context') final String? context,
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'user') final UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AniActivity? activity}) = _$ActivityMessageNotificationDtoImpl;

  factory _ActivityMessageNotificationDto.fromJson(Map<String, dynamic> json) =
      _$ActivityMessageNotificationDtoImpl.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$ActivityMessageNotificationDtoImplCopyWith<
          _$ActivityMessageNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
