// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileFavoriteState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<FavoriteType, PagingState<List>> get favoriteDataMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileFavoriteStateCopyWith<ProfileFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileFavoriteStateCopyWith<$Res> {
  factory $ProfileFavoriteStateCopyWith(ProfileFavoriteState value,
          $Res Function(ProfileFavoriteState) then) =
      _$ProfileFavoriteStateCopyWithImpl<$Res, ProfileFavoriteState>;
  @useResult
  $Res call(
      {bool isLoading, Map<FavoriteType, PagingState<List>> favoriteDataMap});
}

/// @nodoc
class _$ProfileFavoriteStateCopyWithImpl<$Res,
        $Val extends ProfileFavoriteState>
    implements $ProfileFavoriteStateCopyWith<$Res> {
  _$ProfileFavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoriteDataMap = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteDataMap: null == favoriteDataMap
          ? _value.favoriteDataMap
          : favoriteDataMap // ignore: cast_nullable_to_non_nullable
              as Map<FavoriteType, PagingState<List>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileFavoriteStateCopyWith<$Res>
    implements $ProfileFavoriteStateCopyWith<$Res> {
  factory _$$_ProfileFavoriteStateCopyWith(_$_ProfileFavoriteState value,
          $Res Function(_$_ProfileFavoriteState) then) =
      __$$_ProfileFavoriteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, Map<FavoriteType, PagingState<List>> favoriteDataMap});
}

/// @nodoc
class __$$_ProfileFavoriteStateCopyWithImpl<$Res>
    extends _$ProfileFavoriteStateCopyWithImpl<$Res, _$_ProfileFavoriteState>
    implements _$$_ProfileFavoriteStateCopyWith<$Res> {
  __$$_ProfileFavoriteStateCopyWithImpl(_$_ProfileFavoriteState _value,
      $Res Function(_$_ProfileFavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoriteDataMap = null,
  }) {
    return _then(_$_ProfileFavoriteState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteDataMap: null == favoriteDataMap
          ? _value._favoriteDataMap
          : favoriteDataMap // ignore: cast_nullable_to_non_nullable
              as Map<FavoriteType, PagingState<List>>,
    ));
  }
}

/// @nodoc

class _$_ProfileFavoriteState implements _ProfileFavoriteState {
  _$_ProfileFavoriteState(
      {this.isLoading = false,
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
    return 'ProfileFavoriteState(isLoading: $isLoading, favoriteDataMap: $favoriteDataMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileFavoriteState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._favoriteDataMap, _favoriteDataMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_favoriteDataMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileFavoriteStateCopyWith<_$_ProfileFavoriteState> get copyWith =>
      __$$_ProfileFavoriteStateCopyWithImpl<_$_ProfileFavoriteState>(
          this, _$identity);
}

abstract class _ProfileFavoriteState implements ProfileFavoriteState {
  factory _ProfileFavoriteState(
          {final bool isLoading,
          final Map<FavoriteType, PagingState<List>> favoriteDataMap}) =
      _$_ProfileFavoriteState;

  @override
  bool get isLoading;
  @override
  Map<FavoriteType, PagingState<List>> get favoriteDataMap;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileFavoriteStateCopyWith<_$_ProfileFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
