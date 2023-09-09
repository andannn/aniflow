// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) {
  return _UserDataEntity.fromJson(json);
}

/// @nodoc
mixin _$UserDataEntity {
  @JsonKey(name: UserDataTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.name)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.avatarImage)
  String get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: UserDataTableColumns.bannerImage)
  String? get bannerImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataEntityCopyWith<UserDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataEntityCopyWith<$Res> {
  factory $UserDataEntityCopyWith(
          UserDataEntity value, $Res Function(UserDataEntity) then) =
      _$UserDataEntityCopyWithImpl<$Res, UserDataEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: UserDataTableColumns.id) String id,
      @JsonKey(name: UserDataTableColumns.name) String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage});
}

/// @nodoc
class _$UserDataEntityCopyWithImpl<$Res, $Val extends UserDataEntity>
    implements $UserDataEntityCopyWith<$Res> {
  _$UserDataEntityCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDataEntityCopyWith<$Res>
    implements $UserDataEntityCopyWith<$Res> {
  factory _$$_UserDataEntityCopyWith(
          _$_UserDataEntity value, $Res Function(_$_UserDataEntity) then) =
      __$$_UserDataEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: UserDataTableColumns.id) String id,
      @JsonKey(name: UserDataTableColumns.name) String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage});
}

/// @nodoc
class __$$_UserDataEntityCopyWithImpl<$Res>
    extends _$UserDataEntityCopyWithImpl<$Res, _$_UserDataEntity>
    implements _$$_UserDataEntityCopyWith<$Res> {
  __$$_UserDataEntityCopyWithImpl(
      _$_UserDataEntity _value, $Res Function(_$_UserDataEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
  }) {
    return _then(_$_UserDataEntity(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataEntity implements _UserDataEntity {
  _$_UserDataEntity(
      {@JsonKey(name: UserDataTableColumns.id) this.id = '',
      @JsonKey(name: UserDataTableColumns.name) this.name = '',
      @JsonKey(name: UserDataTableColumns.avatarImage) this.avatar = '',
      @JsonKey(name: UserDataTableColumns.bannerImage) this.bannerImage});

  factory _$_UserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataEntityFromJson(json);

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
  String toString() {
    return 'UserDataEntity(id: $id, name: $name, avatar: $avatar, bannerImage: $bannerImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, bannerImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataEntityCopyWith<_$_UserDataEntity> get copyWith =>
      __$$_UserDataEntityCopyWithImpl<_$_UserDataEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataEntityToJson(
      this,
    );
  }
}

abstract class _UserDataEntity implements UserDataEntity {
  factory _UserDataEntity(
      {@JsonKey(name: UserDataTableColumns.id) final String id,
      @JsonKey(name: UserDataTableColumns.name) final String name,
      @JsonKey(name: UserDataTableColumns.avatarImage) final String avatar,
      @JsonKey(name: UserDataTableColumns.bannerImage)
      final String? bannerImage}) = _$_UserDataEntity;

  factory _UserDataEntity.fromJson(Map<String, dynamic> json) =
      _$_UserDataEntity.fromJson;

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
  @JsonKey(ignore: true)
  _$$_UserDataEntityCopyWith<_$_UserDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
