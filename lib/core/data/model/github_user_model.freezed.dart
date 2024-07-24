// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubUserModel _$GithubUserModelFromJson(Map<String, dynamic> json) {
  return _GithubUserModel.fromJson(json);
}

/// @nodoc
mixin _$GithubUserModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'login')
  String? get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'bio')
  String? get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubUserModelCopyWith<GithubUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUserModelCopyWith<$Res> {
  factory $GithubUserModelCopyWith(
          GithubUserModel value, $Res Function(GithubUserModel) then) =
      _$GithubUserModelCopyWithImpl<$Res, GithubUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'login') String? login,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'bio') String? bio});
}

/// @nodoc
class _$GithubUserModelCopyWithImpl<$Res, $Val extends GithubUserModel>
    implements $GithubUserModelCopyWith<$Res> {
  _$GithubUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? login = freezed,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubUserModelImplCopyWith<$Res>
    implements $GithubUserModelCopyWith<$Res> {
  factory _$$GithubUserModelImplCopyWith(_$GithubUserModelImpl value,
          $Res Function(_$GithubUserModelImpl) then) =
      __$$GithubUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'login') String? login,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'bio') String? bio});
}

/// @nodoc
class __$$GithubUserModelImplCopyWithImpl<$Res>
    extends _$GithubUserModelCopyWithImpl<$Res, _$GithubUserModelImpl>
    implements _$$GithubUserModelImplCopyWith<$Res> {
  __$$GithubUserModelImplCopyWithImpl(
      _$GithubUserModelImpl _value, $Res Function(_$GithubUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? login = freezed,
    Object? avatarUrl = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$GithubUserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
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
class _$GithubUserModelImpl implements _GithubUserModel {
  const _$GithubUserModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'login') this.login,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'bio') this.bio});

  factory _$GithubUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'login')
  final String? login;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'bio')
  final String? bio;

  @override
  String toString() {
    return 'GithubUserModel(id: $id, login: $login, avatarUrl: $avatarUrl, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl, bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubUserModelImplCopyWith<_$GithubUserModelImpl> get copyWith =>
      __$$GithubUserModelImplCopyWithImpl<_$GithubUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubUserModelImplToJson(
      this,
    );
  }
}

abstract class _GithubUserModel implements GithubUserModel {
  const factory _GithubUserModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'login') final String? login,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'bio') final String? bio}) = _$GithubUserModelImpl;

  factory _GithubUserModel.fromJson(Map<String, dynamic> json) =
      _$GithubUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'login')
  String? get login;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'bio')
  String? get bio;
  @override
  @JsonKey(ignore: true)
  _$$GithubUserModelImplCopyWith<_$GithubUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
