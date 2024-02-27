// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_like_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityLikeNotificationDto _$ActivityLikeNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _ActivityLikeNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityLikeNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
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
  $ActivityLikeNotificationDtoCopyWith<ActivityLikeNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityLikeNotificationDtoCopyWith<$Res> {
  factory $ActivityLikeNotificationDtoCopyWith(
          ActivityLikeNotificationDto value,
          $Res Function(ActivityLikeNotificationDto) then) =
      _$ActivityLikeNotificationDtoCopyWithImpl<$Res,
          ActivityLikeNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AniActivity? activity});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivityLikeNotificationDtoCopyWithImpl<$Res,
        $Val extends ActivityLikeNotificationDto>
    implements $ActivityLikeNotificationDtoCopyWith<$Res> {
  _$ActivityLikeNotificationDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$ActivityLikeNotificationDtoImplCopyWith<$Res>
    implements $ActivityLikeNotificationDtoCopyWith<$Res> {
  factory _$$ActivityLikeNotificationDtoImplCopyWith(
          _$ActivityLikeNotificationDtoImpl value,
          $Res Function(_$ActivityLikeNotificationDtoImpl) then) =
      __$$ActivityLikeNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      AniActivity? activity});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ActivityLikeNotificationDtoImplCopyWithImpl<$Res>
    extends _$ActivityLikeNotificationDtoCopyWithImpl<$Res,
        _$ActivityLikeNotificationDtoImpl>
    implements _$$ActivityLikeNotificationDtoImplCopyWith<$Res> {
  __$$ActivityLikeNotificationDtoImplCopyWithImpl(
      _$ActivityLikeNotificationDtoImpl _value,
      $Res Function(_$ActivityLikeNotificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? context = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
    Object? activity = freezed,
  }) {
    return _then(_$ActivityLikeNotificationDtoImpl(
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
class _$ActivityLikeNotificationDtoImpl
    implements _ActivityLikeNotificationDto {
  _$ActivityLikeNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user,
      @JsonKey(includeFromJson: false, includeToJson: false) this.activity});

  factory _$ActivityLikeNotificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActivityLikeNotificationDtoImplFromJson(json);

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
    return 'ActivityLikeNotificationDto(id: $id, type: $type, userId: $userId, context: $context, createdAt: $createdAt, user: $user, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLikeNotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.activity, activity) ||
                other.activity == activity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, userId, context, createdAt, user, activity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLikeNotificationDtoImplCopyWith<_$ActivityLikeNotificationDtoImpl>
      get copyWith => __$$ActivityLikeNotificationDtoImplCopyWithImpl<
          _$ActivityLikeNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityLikeNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityLikeNotificationDto
    implements ActivityLikeNotificationDto {
  factory _ActivityLikeNotificationDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'type') final NotificationType? type,
      @JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'context') final String? context,
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'user') final UserDto? user,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final AniActivity? activity}) = _$ActivityLikeNotificationDtoImpl;

  factory _ActivityLikeNotificationDto.fromJson(Map<String, dynamic> json) =
      _$ActivityLikeNotificationDtoImpl.fromJson;

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
  _$$ActivityLikeNotificationDtoImplCopyWith<_$ActivityLikeNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
