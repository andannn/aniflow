// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_reply_like_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityReplyLikeNotificationDto _$ActivityReplyLikeNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _ActivityReplyLikeNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityReplyLikeNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityId')
  int? get activityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contexts')
  List<String> get contexts => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDataDto? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityReplyLikeNotificationDtoCopyWith<ActivityReplyLikeNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReplyLikeNotificationDtoCopyWith<$Res> {
  factory $ActivityReplyLikeNotificationDtoCopyWith(
          ActivityReplyLikeNotificationDto value,
          $Res Function(ActivityReplyLikeNotificationDto) then) =
      _$ActivityReplyLikeNotificationDtoCopyWithImpl<$Res,
          ActivityReplyLikeNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'activityId') int? activityId,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDataDto? user});

  $UserDataDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivityReplyLikeNotificationDtoCopyWithImpl<$Res,
        $Val extends ActivityReplyLikeNotificationDto>
    implements $ActivityReplyLikeNotificationDtoCopyWith<$Res> {
  _$ActivityReplyLikeNotificationDtoCopyWithImpl(this._value, this._then);

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
    Object? contexts = null,
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
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      contexts: null == contexts
          ? _value.contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ActivityReplyLikeNotificationDtoCopyWith<$Res>
    implements $ActivityReplyLikeNotificationDtoCopyWith<$Res> {
  factory _$$_ActivityReplyLikeNotificationDtoCopyWith(
          _$_ActivityReplyLikeNotificationDto value,
          $Res Function(_$_ActivityReplyLikeNotificationDto) then) =
      __$$_ActivityReplyLikeNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'activityId') int? activityId,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDataDto? user});

  @override
  $UserDataDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ActivityReplyLikeNotificationDtoCopyWithImpl<$Res>
    extends _$ActivityReplyLikeNotificationDtoCopyWithImpl<$Res,
        _$_ActivityReplyLikeNotificationDto>
    implements _$$_ActivityReplyLikeNotificationDtoCopyWith<$Res> {
  __$$_ActivityReplyLikeNotificationDtoCopyWithImpl(
      _$_ActivityReplyLikeNotificationDto _value,
      $Res Function(_$_ActivityReplyLikeNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? activityId = freezed,
    Object? contexts = null,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ActivityReplyLikeNotificationDto(
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
      contexts: null == contexts
          ? _value._contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivityReplyLikeNotificationDto
    implements _ActivityReplyLikeNotificationDto {
  _$_ActivityReplyLikeNotificationDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'activityId') this.activityId,
      @JsonKey(name: 'contexts') final List<String> contexts = const [],
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user})
      : _contexts = contexts;

  factory _$_ActivityReplyLikeNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ActivityReplyLikeNotificationDtoFromJson(json);

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
  @JsonKey(name: 'user')
  final UserDataDto? user;

  @override
  String toString() {
    return 'ActivityReplyLikeNotificationDto(id: $id, type: $type, userId: $userId, activityId: $activityId, contexts: $contexts, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActivityReplyLikeNotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, userId, activityId,
      const DeepCollectionEquality().hash(_contexts), createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivityReplyLikeNotificationDtoCopyWith<
          _$_ActivityReplyLikeNotificationDto>
      get copyWith => __$$_ActivityReplyLikeNotificationDtoCopyWithImpl<
          _$_ActivityReplyLikeNotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityReplyLikeNotificationDtoToJson(
      this,
    );
  }
}

abstract class _ActivityReplyLikeNotificationDto
    implements ActivityReplyLikeNotificationDto {
  factory _ActivityReplyLikeNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'userId') final int? userId,
          @JsonKey(name: 'activityId') final int? activityId,
          @JsonKey(name: 'contexts') final List<String> contexts,
          @JsonKey(name: 'createdAt') final int? createdAt,
          @JsonKey(name: 'user') final UserDataDto? user}) =
      _$_ActivityReplyLikeNotificationDto;

  factory _ActivityReplyLikeNotificationDto.fromJson(
      Map<String, dynamic> json) = _$_ActivityReplyLikeNotificationDto.fromJson;

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
  @JsonKey(name: 'contexts')
  List<String> get contexts;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'user')
  UserDataDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ActivityReplyLikeNotificationDtoCopyWith<
          _$_ActivityReplyLikeNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}