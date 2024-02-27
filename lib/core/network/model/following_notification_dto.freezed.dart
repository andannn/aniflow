// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingNotificationDto _$FollowingNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _FollowingNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$FollowingNotificationDto {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingNotificationDtoCopyWith<FollowingNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingNotificationDtoCopyWith<$Res> {
  factory $FollowingNotificationDtoCopyWith(FollowingNotificationDto value,
          $Res Function(FollowingNotificationDto) then) =
      _$FollowingNotificationDtoCopyWithImpl<$Res, FollowingNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$FollowingNotificationDtoCopyWithImpl<$Res,
        $Val extends FollowingNotificationDto>
    implements $FollowingNotificationDtoCopyWith<$Res> {
  _$FollowingNotificationDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$FollowingNotificationDtoImplCopyWith<$Res>
    implements $FollowingNotificationDtoCopyWith<$Res> {
  factory _$$FollowingNotificationDtoImplCopyWith(
          _$FollowingNotificationDtoImpl value,
          $Res Function(_$FollowingNotificationDtoImpl) then) =
      __$$FollowingNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'context') String? context,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDto? user});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$FollowingNotificationDtoImplCopyWithImpl<$Res>
    extends _$FollowingNotificationDtoCopyWithImpl<$Res,
        _$FollowingNotificationDtoImpl>
    implements _$$FollowingNotificationDtoImplCopyWith<$Res> {
  __$$FollowingNotificationDtoImplCopyWithImpl(
      _$FollowingNotificationDtoImpl _value,
      $Res Function(_$FollowingNotificationDtoImpl) _then)
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
  }) {
    return _then(_$FollowingNotificationDtoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingNotificationDtoImpl implements _FollowingNotificationDto {
  _$FollowingNotificationDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'context') this.context,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user});

  factory _$FollowingNotificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingNotificationDtoImplFromJson(json);

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
  String toString() {
    return 'FollowingNotificationDto(id: $id, type: $type, userId: $userId, context: $context, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingNotificationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, userId, context, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingNotificationDtoImplCopyWith<_$FollowingNotificationDtoImpl>
      get copyWith => __$$FollowingNotificationDtoImplCopyWithImpl<
          _$FollowingNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _FollowingNotificationDto implements FollowingNotificationDto {
  factory _FollowingNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'userId') final int? userId,
          @JsonKey(name: 'context') final String? context,
          @JsonKey(name: 'createdAt') final int? createdAt,
          @JsonKey(name: 'user') final UserDto? user}) =
      _$FollowingNotificationDtoImpl;

  factory _FollowingNotificationDto.fromJson(Map<String, dynamic> json) =
      _$FollowingNotificationDtoImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$FollowingNotificationDtoImplCopyWith<_$FollowingNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
