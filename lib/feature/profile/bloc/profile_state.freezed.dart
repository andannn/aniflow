// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  UserModel? get userData => throw _privateConstructorUsedError;
  bool get isFavoriteLoading => throw _privateConstructorUsedError;
  bool get isMediaListPageLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {UserModel? userData,
      bool isFavoriteLoading,
      bool isMediaListPageLoading});

  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? isFavoriteLoading = null,
    Object? isMediaListPageLoading = null,
  }) {
    return _then(_value.copyWith(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isFavoriteLoading: null == isFavoriteLoading
          ? _value.isFavoriteLoading
          : isFavoriteLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMediaListPageLoading: null == isMediaListPageLoading
          ? _value.isMediaListPageLoading
          : isMediaListPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? userData,
      bool isFavoriteLoading,
      bool isMediaListPageLoading});

  @override
  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileState>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? isFavoriteLoading = null,
    Object? isMediaListPageLoading = null,
  }) {
    return _then(_$_ProfileState(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isFavoriteLoading: null == isFavoriteLoading
          ? _value.isFavoriteLoading
          : isFavoriteLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMediaListPageLoading: null == isMediaListPageLoading
          ? _value.isMediaListPageLoading
          : isMediaListPageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  _$_ProfileState(
      {this.userData,
      this.isFavoriteLoading = false,
      this.isMediaListPageLoading = false});

  @override
  final UserModel? userData;
  @override
  @JsonKey()
  final bool isFavoriteLoading;
  @override
  @JsonKey()
  final bool isMediaListPageLoading;

  @override
  String toString() {
    return 'ProfileState(userData: $userData, isFavoriteLoading: $isFavoriteLoading, isMediaListPageLoading: $isMediaListPageLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.isFavoriteLoading, isFavoriteLoading) ||
                other.isFavoriteLoading == isFavoriteLoading) &&
            (identical(other.isMediaListPageLoading, isMediaListPageLoading) ||
                other.isMediaListPageLoading == isMediaListPageLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userData, isFavoriteLoading, isMediaListPageLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  factory _ProfileState(
      {final UserModel? userData,
      final bool isFavoriteLoading,
      final bool isMediaListPageLoading}) = _$_ProfileState;

  @override
  UserModel? get userData;
  @override
  bool get isFavoriteLoading;
  @override
  bool get isMediaListPageLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
