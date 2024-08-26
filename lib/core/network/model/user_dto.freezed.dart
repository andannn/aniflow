// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  Map<String, String> get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'bannerImage')
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'unreadNotificationCount')
  int get unreadNotificationCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  UserOptions? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaListOptions')
  MediaListOptionDto? get mediaListOptions =>
      throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'avatar') Map<String, String> avatar,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'unreadNotificationCount') int unreadNotificationCount,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'options') UserOptions? options,
      @JsonKey(name: 'mediaListOptions') MediaListOptionDto? mediaListOptions});

  $UserOptionsCopyWith<$Res>? get options;
  $MediaListOptionDtoCopyWith<$Res>? get mediaListOptions;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
    Object? unreadNotificationCount = null,
    Object? siteUrl = freezed,
    Object? options = freezed,
    Object? mediaListOptions = freezed,
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
      unreadNotificationCount: null == unreadNotificationCount
          ? _value.unreadNotificationCount
          : unreadNotificationCount // ignore: cast_nullable_to_non_nullable
              as int,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as UserOptions?,
      mediaListOptions: freezed == mediaListOptions
          ? _value.mediaListOptions
          : mediaListOptions // ignore: cast_nullable_to_non_nullable
              as MediaListOptionDto?,
    ) as $Val);
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserOptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $UserOptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaListOptionDtoCopyWith<$Res>? get mediaListOptions {
    if (_value.mediaListOptions == null) {
      return null;
    }

    return $MediaListOptionDtoCopyWith<$Res>(_value.mediaListOptions!, (value) {
      return _then(_value.copyWith(mediaListOptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'avatar') Map<String, String> avatar,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'unreadNotificationCount') int unreadNotificationCount,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'options') UserOptions? options,
      @JsonKey(name: 'mediaListOptions') MediaListOptionDto? mediaListOptions});

  @override
  $UserOptionsCopyWith<$Res>? get options;
  @override
  $MediaListOptionDtoCopyWith<$Res>? get mediaListOptions;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? bannerImage = freezed,
    Object? unreadNotificationCount = null,
    Object? siteUrl = freezed,
    Object? options = freezed,
    Object? mediaListOptions = freezed,
  }) {
    return _then(_$UserDtoImpl(
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
      unreadNotificationCount: null == unreadNotificationCount
          ? _value.unreadNotificationCount
          : unreadNotificationCount // ignore: cast_nullable_to_non_nullable
              as int,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as UserOptions?,
      mediaListOptions: freezed == mediaListOptions
          ? _value.mediaListOptions
          : mediaListOptions // ignore: cast_nullable_to_non_nullable
              as MediaListOptionDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  _$UserDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'avatar') final Map<String, String> avatar = const {},
      @JsonKey(name: 'bannerImage') this.bannerImage = '',
      @JsonKey(name: 'unreadNotificationCount')
      this.unreadNotificationCount = 0,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'options') this.options,
      @JsonKey(name: 'mediaListOptions') this.mediaListOptions})
      : _avatar = avatar;

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

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
  @JsonKey(name: 'unreadNotificationCount')
  final int unreadNotificationCount;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'options')
  final UserOptions? options;
  @override
  @JsonKey(name: 'mediaListOptions')
  final MediaListOptionDto? mediaListOptions;

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, avatar: $avatar, bannerImage: $bannerImage, unreadNotificationCount: $unreadNotificationCount, siteUrl: $siteUrl, options: $options, mediaListOptions: $mediaListOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._avatar, _avatar) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(
                    other.unreadNotificationCount, unreadNotificationCount) ||
                other.unreadNotificationCount == unreadNotificationCount) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.mediaListOptions, mediaListOptions) ||
                other.mediaListOptions == mediaListOptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_avatar),
      bannerImage,
      unreadNotificationCount,
      siteUrl,
      options,
      mediaListOptions);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  factory _UserDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'avatar') final Map<String, String> avatar,
      @JsonKey(name: 'bannerImage') final String? bannerImage,
      @JsonKey(name: 'unreadNotificationCount')
      final int unreadNotificationCount,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'options') final UserOptions? options,
      @JsonKey(name: 'mediaListOptions')
      final MediaListOptionDto? mediaListOptions}) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

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
  @JsonKey(name: 'unreadNotificationCount')
  int get unreadNotificationCount;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'options')
  UserOptions? get options;
  @override
  @JsonKey(name: 'mediaListOptions')
  MediaListOptionDto? get mediaListOptions;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
