// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  @JsonKey(name: UserDataTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.name)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.avatarImage)
  String get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.bannerImage)
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.profileColor)
  String? get profileColor => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
  int? get unreadNotificationCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: UserDataTableColumns.id) String id,
      @JsonKey(name: UserDataTableColumns.name) String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage,
      @JsonKey(name: UserDataTableColumns.profileColor) String? profileColor,
      @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
      int? unreadNotificationCount});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
    Object? profileColor = freezed,
    Object? unreadNotificationCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileColor: freezed == profileColor
          ? _value.profileColor
          : profileColor // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadNotificationCount: freezed == unreadNotificationCount
          ? _value.unreadNotificationCount
          : unreadNotificationCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: UserDataTableColumns.id) String id,
      @JsonKey(name: UserDataTableColumns.name) String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage,
      @JsonKey(name: UserDataTableColumns.profileColor) String? profileColor,
      @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
      int? unreadNotificationCount});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
    Object? profileColor = freezed,
    Object? unreadNotificationCount = freezed,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileColor: freezed == profileColor
          ? _value.profileColor
          : profileColor // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadNotificationCount: freezed == unreadNotificationCount
          ? _value.unreadNotificationCount
          : unreadNotificationCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  _$UserEntityImpl(
      {@JsonKey(name: UserDataTableColumns.id) this.id = '',
      @JsonKey(name: UserDataTableColumns.name) this.name = '',
      @JsonKey(name: UserDataTableColumns.avatarImage) this.avatar = '',
      @JsonKey(name: UserDataTableColumns.bannerImage) this.bannerImage,
      @JsonKey(name: UserDataTableColumns.profileColor) this.profileColor,
      @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
      this.unreadNotificationCount});

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  @JsonKey(name: UserDataTableColumns.id)
  final String id;
  @override
  @JsonKey(name: UserDataTableColumns.name)
  final String name;
  @override
  @JsonKey(name: UserDataTableColumns.avatarImage)
  final String avatar;
  @override
  @JsonKey(name: UserDataTableColumns.bannerImage)
  final String? bannerImage;
  @override
  @JsonKey(name: UserDataTableColumns.profileColor)
  final String? profileColor;
  @override
  @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
  final int? unreadNotificationCount;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, avatar: $avatar, bannerImage: $bannerImage, profileColor: $profileColor, unreadNotificationCount: $unreadNotificationCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.profileColor, profileColor) ||
                other.profileColor == profileColor) &&
            (identical(
                    other.unreadNotificationCount, unreadNotificationCount) ||
                other.unreadNotificationCount == unreadNotificationCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, bannerImage,
      profileColor, unreadNotificationCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity implements UserEntity {
  factory _UserEntity(
      {@JsonKey(name: UserDataTableColumns.id) final String id,
      @JsonKey(name: UserDataTableColumns.name) final String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) final String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage)
      final String? bannerImage,
      @JsonKey(name: UserDataTableColumns.profileColor)
      final String? profileColor,
      @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
      final int? unreadNotificationCount}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  @JsonKey(name: UserDataTableColumns.id)
  String get id;
  @override
  @JsonKey(name: UserDataTableColumns.name)
  String get name;
  @override
  @JsonKey(name: UserDataTableColumns.avatarImage)
  String get avatar;
  @override
  @JsonKey(name: UserDataTableColumns.bannerImage)
  String? get bannerImage;
  @override
  @JsonKey(name: UserDataTableColumns.profileColor)
  String? get profileColor;
  @override
  @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
  int? get unreadNotificationCount;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
