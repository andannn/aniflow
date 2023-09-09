// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataDto _$UserDataDtoFromJson(Map<String, dynamic> json) {
  return _UserDataDto.fromJson(json);
}

/// @nodoc
mixin _$UserDataDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  Map<String, String> get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'bannerImage')
  String? get bannerImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDtoCopyWith<UserDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDtoCopyWith<$Res> {
  factory $UserDataDtoCopyWith(
          UserDataDto value, $Res Function(UserDataDto) then) =
      _$UserDataDtoCopyWithImpl<$Res, UserDataDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'avatar') Map<String, String> avatar,
      @JsonKey(name: 'bannerImage') String? bannerImage});
}

/// @nodoc
class _$UserDataDtoCopyWithImpl<$Res, $Val extends UserDataDto>
    implements $UserDataDtoCopyWith<$Res> {
  _$UserDataDtoCopyWithImpl(this._value, this._then);

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
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDataDtoCopyWith<$Res>
    implements $UserDataDtoCopyWith<$Res> {
  factory _$$_UserDataDtoCopyWith(
          _$_UserDataDto value, $Res Function(_$_UserDataDto) then) =
      __$$_UserDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'avatar') Map<String, String> avatar,
      @JsonKey(name: 'bannerImage') String? bannerImage});
}

/// @nodoc
class __$$_UserDataDtoCopyWithImpl<$Res>
    extends _$UserDataDtoCopyWithImpl<$Res, _$_UserDataDto>
    implements _$$_UserDataDtoCopyWith<$Res> {
  __$$_UserDataDtoCopyWithImpl(
      _$_UserDataDto _value, $Res Function(_$_UserDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
  }) {
    return _then(_$_UserDataDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value._avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataDto implements _UserDataDto {
  _$_UserDataDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'avatar') final Map<String, String> avatar = const {},
      @JsonKey(name: 'bannerImage') this.bannerImage = ''})
      : _avatar = avatar;

  factory _$_UserDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  final Map<String, String> _avatar;
  @override
  @JsonKey(name: 'avatar')
  Map<String, String> get avatar {
    if (_avatar is EqualUnmodifiableMapView) return _avatar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_avatar);
  }

  @override
  @JsonKey(name: 'bannerImage')
  final String? bannerImage;

  @override
  String toString() {
    return 'UserDataDto(id: $id, name: $name, avatar: $avatar, bannerImage: $bannerImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._avatar, _avatar) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_avatar), bannerImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataDtoCopyWith<_$_UserDataDto> get copyWith =>
      __$$_UserDataDtoCopyWithImpl<_$_UserDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataDtoToJson(
      this,
    );
  }
}

abstract class _UserDataDto implements UserDataDto {
  factory _UserDataDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'avatar') final Map<String, String> avatar,
          @JsonKey(name: 'bannerImage') final String? bannerImage}) =
      _$_UserDataDto;

  factory _UserDataDto.fromJson(Map<String, dynamic> json) =
      _$_UserDataDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'avatar')
  Map<String, String> get avatar;
  @override
  @JsonKey(name: 'bannerImage')
  String? get bannerImage;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataDtoCopyWith<_$_UserDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
