// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubUserDto _$GithubUserDtoFromJson(Map<String, dynamic> json) {
  return _GithubUserDto.fromJson(json);
}

/// @nodoc
mixin _$GithubUserDto {
  @JsonKey(name: 'login')
  String? get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'bio')
  String? get bio => throw _privateConstructorUsedError;

  /// Serializes this GithubUserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubUserDtoCopyWith<GithubUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUserDtoCopyWith<$Res> {
  factory $GithubUserDtoCopyWith(
          GithubUserDto value, $Res Function(GithubUserDto) then) =
      _$GithubUserDtoCopyWithImpl<$Res, GithubUserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? login,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'bio') String? bio});
}

/// @nodoc
class _$GithubUserDtoCopyWithImpl<$Res, $Val extends GithubUserDto>
    implements $GithubUserDtoCopyWith<$Res> {
  _$GithubUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? avatarUrl = freezed,
    Object? url = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubUserDtoImplCopyWith<$Res>
    implements $GithubUserDtoCopyWith<$Res> {
  factory _$$GithubUserDtoImplCopyWith(
          _$GithubUserDtoImpl value, $Res Function(_$GithubUserDtoImpl) then) =
      __$$GithubUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? login,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'bio') String? bio});
}

/// @nodoc
class __$$GithubUserDtoImplCopyWithImpl<$Res>
    extends _$GithubUserDtoCopyWithImpl<$Res, _$GithubUserDtoImpl>
    implements _$$GithubUserDtoImplCopyWith<$Res> {
  __$$GithubUserDtoImplCopyWithImpl(
      _$GithubUserDtoImpl _value, $Res Function(_$GithubUserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? avatarUrl = freezed,
    Object? url = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$GithubUserDtoImpl(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubUserDtoImpl implements _GithubUserDto {
  const _$GithubUserDtoImpl(
      {@JsonKey(name: 'login') this.login,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'bio') this.bio});

  factory _$GithubUserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubUserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String? login;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'bio')
  final String? bio;

  @override
  String toString() {
    return 'GithubUserDto(login: $login, id: $id, avatarUrl: $avatarUrl, url: $url, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubUserDtoImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, id, avatarUrl, url, bio);

  /// Create a copy of GithubUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubUserDtoImplCopyWith<_$GithubUserDtoImpl> get copyWith =>
      __$$GithubUserDtoImplCopyWithImpl<_$GithubUserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubUserDtoImplToJson(
      this,
    );
  }
}

abstract class _GithubUserDto implements GithubUserDto {
  const factory _GithubUserDto(
      {@JsonKey(name: 'login') final String? login,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'bio') final String? bio}) = _$GithubUserDtoImpl;

  factory _GithubUserDto.fromJson(Map<String, dynamic> json) =
      _$GithubUserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String? get login;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'bio')
  String? get bio;

  /// Create a copy of GithubUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubUserDtoImplCopyWith<_$GithubUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
