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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileFavoriteState {
  Map<ProfileFavoriteType, List<FavoriteItemModel>> get favoriteItems =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileFavoriteStateCopyWith<ProfileFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileFavoriteStateCopyWith<$Res> {
  factory $ProfileFavoriteStateCopyWith(ProfileFavoriteState value,
          $Res Function(ProfileFavoriteState) then) =
      _$ProfileFavoriteStateCopyWithImpl<$Res, ProfileFavoriteState>;
  @useResult
  $Res call({Map<ProfileFavoriteType, List<FavoriteItemModel>> favoriteItems});
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

  /// Create a copy of ProfileFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteItems = null,
  }) {
    return _then(_value.copyWith(
      favoriteItems: null == favoriteItems
          ? _value.favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as Map<ProfileFavoriteType, List<FavoriteItemModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileFavoriteStateImplCopyWith<$Res>
    implements $ProfileFavoriteStateCopyWith<$Res> {
  factory _$$ProfileFavoriteStateImplCopyWith(_$ProfileFavoriteStateImpl value,
          $Res Function(_$ProfileFavoriteStateImpl) then) =
      __$$ProfileFavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<ProfileFavoriteType, List<FavoriteItemModel>> favoriteItems});
}

/// @nodoc
class __$$ProfileFavoriteStateImplCopyWithImpl<$Res>
    extends _$ProfileFavoriteStateCopyWithImpl<$Res, _$ProfileFavoriteStateImpl>
    implements _$$ProfileFavoriteStateImplCopyWith<$Res> {
  __$$ProfileFavoriteStateImplCopyWithImpl(_$ProfileFavoriteStateImpl _value,
      $Res Function(_$ProfileFavoriteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteItems = null,
  }) {
    return _then(_$ProfileFavoriteStateImpl(
      favoriteItems: null == favoriteItems
          ? _value._favoriteItems
          : favoriteItems // ignore: cast_nullable_to_non_nullable
              as Map<ProfileFavoriteType, List<FavoriteItemModel>>,
    ));
  }
}

/// @nodoc

class _$ProfileFavoriteStateImpl implements _ProfileFavoriteState {
  _$ProfileFavoriteStateImpl(
      {final Map<ProfileFavoriteType, List<FavoriteItemModel>> favoriteItems =
          const {}})
      : _favoriteItems = favoriteItems;

  final Map<ProfileFavoriteType, List<FavoriteItemModel>> _favoriteItems;
  @override
  @JsonKey()
  Map<ProfileFavoriteType, List<FavoriteItemModel>> get favoriteItems {
    if (_favoriteItems is EqualUnmodifiableMapView) return _favoriteItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_favoriteItems);
  }

  @override
  String toString() {
    return 'ProfileFavoriteState(favoriteItems: $favoriteItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileFavoriteStateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteItems, _favoriteItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteItems));

  /// Create a copy of ProfileFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileFavoriteStateImplCopyWith<_$ProfileFavoriteStateImpl>
      get copyWith =>
          __$$ProfileFavoriteStateImplCopyWithImpl<_$ProfileFavoriteStateImpl>(
              this, _$identity);
}

abstract class _ProfileFavoriteState implements ProfileFavoriteState {
  factory _ProfileFavoriteState(
      {final Map<ProfileFavoriteType, List<FavoriteItemModel>>
          favoriteItems}) = _$ProfileFavoriteStateImpl;

  @override
  Map<ProfileFavoriteType, List<FavoriteItemModel>> get favoriteItems;

  /// Create a copy of ProfileFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileFavoriteStateImplCopyWith<_$ProfileFavoriteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
