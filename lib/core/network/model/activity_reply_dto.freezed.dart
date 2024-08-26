// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_reply_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityReplyDto _$ActivityReplyDtoFromJson(Map<String, dynamic> json) {
  return _ActivityReplyDto.fromJson(json);
}

/// @nodoc
mixin _$ActivityReplyDto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'likeCount')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDto? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLiked')
  bool? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ActivityReplyDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityReplyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityReplyDtoCopyWith<ActivityReplyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReplyDtoCopyWith<$Res> {
  factory $ActivityReplyDtoCopyWith(
          ActivityReplyDto value, $Res Function(ActivityReplyDto) then) =
      _$ActivityReplyDtoCopyWithImpl<$Res, ActivityReplyDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(name: 'isLiked') bool? isLiked,
      @JsonKey(name: 'createdAt') int? createdAt});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivityReplyDtoCopyWithImpl<$Res, $Val extends ActivityReplyDto>
    implements $ActivityReplyDtoCopyWith<$Res> {
  _$ActivityReplyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityReplyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? likeCount = freezed,
    Object? text = freezed,
    Object? user = freezed,
    Object? isLiked = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ActivityReplyDto
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
abstract class _$$ActivityReplyDtoImplCopyWith<$Res>
    implements $ActivityReplyDtoCopyWith<$Res> {
  factory _$$ActivityReplyDtoImplCopyWith(_$ActivityReplyDtoImpl value,
          $Res Function(_$ActivityReplyDtoImpl) then) =
      __$$ActivityReplyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(name: 'isLiked') bool? isLiked,
      @JsonKey(name: 'createdAt') int? createdAt});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ActivityReplyDtoImplCopyWithImpl<$Res>
    extends _$ActivityReplyDtoCopyWithImpl<$Res, _$ActivityReplyDtoImpl>
    implements _$$ActivityReplyDtoImplCopyWith<$Res> {
  __$$ActivityReplyDtoImplCopyWithImpl(_$ActivityReplyDtoImpl _value,
      $Res Function(_$ActivityReplyDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityReplyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? likeCount = freezed,
    Object? text = freezed,
    Object? user = freezed,
    Object? isLiked = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ActivityReplyDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityReplyDtoImpl implements _ActivityReplyDto {
  const _$ActivityReplyDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'likeCount') this.likeCount,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'isLiked') this.isLiked,
      @JsonKey(name: 'createdAt') this.createdAt});

  factory _$ActivityReplyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityReplyDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'likeCount')
  final int? likeCount;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'user')
  final UserDto? user;
  @override
  @JsonKey(name: 'isLiked')
  final bool? isLiked;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;

  @override
  String toString() {
    return 'ActivityReplyDto(id: $id, likeCount: $likeCount, text: $text, user: $user, isLiked: $isLiked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityReplyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, likeCount, text, user, isLiked, createdAt);

  /// Create a copy of ActivityReplyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityReplyDtoImplCopyWith<_$ActivityReplyDtoImpl> get copyWith =>
      __$$ActivityReplyDtoImplCopyWithImpl<_$ActivityReplyDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityReplyDtoImplToJson(
      this,
    );
  }
}

abstract class _ActivityReplyDto implements ActivityReplyDto {
  const factory _ActivityReplyDto(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'likeCount') final int? likeCount,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'user') final UserDto? user,
          @JsonKey(name: 'isLiked') final bool? isLiked,
          @JsonKey(name: 'createdAt') final int? createdAt}) =
      _$ActivityReplyDtoImpl;

  factory _ActivityReplyDto.fromJson(Map<String, dynamic> json) =
      _$ActivityReplyDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'likeCount')
  int? get likeCount;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'user')
  UserDto? get user;
  @override
  @JsonKey(name: 'isLiked')
  bool? get isLiked;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;

  /// Create a copy of ActivityReplyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityReplyDtoImplCopyWith<_$ActivityReplyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
