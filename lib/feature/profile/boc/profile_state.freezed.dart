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
  bool get isLoading => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;
  Map<FavoriteType, PagingState<List>> get favoriteDataMap =>
      throw _privateConstructorUsedError;

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
      {bool isLoading,
      UserData? userData,
      Map<FavoriteType, PagingState<List>> favoriteDataMap});

  $UserDataCopyWith<$Res>? get userData;
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
    Object? isLoading = null,
    Object? userData = freezed,
    Object? favoriteDataMap = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      favoriteDataMap: null == favoriteDataMap
          ? _value.favoriteDataMap
          : favoriteDataMap // ignore: cast_nullable_to_non_nullable
              as Map<FavoriteType, PagingState<List>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
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
      {bool isLoading,
      UserData? userData,
      Map<FavoriteType, PagingState<List>> favoriteDataMap});

  @override
  $UserDataCopyWith<$Res>? get userData;
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
    Object? isLoading = null,
    Object? userData = freezed,
    Object? favoriteDataMap = null,
  }) {
    return _then(_$_ProfileState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      favoriteDataMap: null == favoriteDataMap
          ? _value._favoriteDataMap
          : favoriteDataMap // ignore: cast_nullable_to_non_nullable
              as Map<FavoriteType, PagingState<List>>,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  _$_ProfileState(
      {this.isLoading = false,
      this.userData,
      final Map<FavoriteType, PagingState<List>> favoriteDataMap = const {
        FavoriteType.anime: PageLoading(data: [], page: 1),
        FavoriteType.manga: PageLoading(data: [], page: 1),
        FavoriteType.staff: PageLoading(data: [], page: 1),
        FavoriteType.character: PageLoading(data: [], page: 1)
      }})
      : _favoriteDataMap = favoriteDataMap;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserData? userData;
  final Map<FavoriteType, PagingState<List>> _favoriteDataMap;
  @override
  @JsonKey()
  Map<FavoriteType, PagingState<List>> get favoriteDataMap {
    if (_favoriteDataMap is EqualUnmodifiableMapView) return _favoriteDataMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_favoriteDataMap);
  }

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, userData: $userData, favoriteDataMap: $favoriteDataMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality()
                .equals(other._favoriteDataMap, _favoriteDataMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userData,
      const DeepCollectionEquality().hash(_favoriteDataMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  factory _ProfileState(
          {final bool isLoading,
          final UserData? userData,
          final Map<FavoriteType, PagingState<List>> favoriteDataMap}) =
      _$_ProfileState;

  @override
  bool get isLoading;
  @override
  UserData? get userData;
  @override
  Map<FavoriteType, PagingState<List>> get favoriteDataMap;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
