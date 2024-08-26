// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_media_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileMediaListState {
  Map<MediaListSectorParam, List<MediaWithListModel>> get sectorMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileMediaListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileMediaListStateCopyWith<ProfileMediaListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileMediaListStateCopyWith<$Res> {
  factory $ProfileMediaListStateCopyWith(ProfileMediaListState value,
          $Res Function(ProfileMediaListState) then) =
      _$ProfileMediaListStateCopyWithImpl<$Res, ProfileMediaListState>;
  @useResult
  $Res call({Map<MediaListSectorParam, List<MediaWithListModel>> sectorMap});
}

/// @nodoc
class _$ProfileMediaListStateCopyWithImpl<$Res,
        $Val extends ProfileMediaListState>
    implements $ProfileMediaListStateCopyWith<$Res> {
  _$ProfileMediaListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileMediaListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorMap = null,
  }) {
    return _then(_value.copyWith(
      sectorMap: null == sectorMap
          ? _value.sectorMap
          : sectorMap // ignore: cast_nullable_to_non_nullable
              as Map<MediaListSectorParam, List<MediaWithListModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileMediaListStateImplCopyWith<$Res>
    implements $ProfileMediaListStateCopyWith<$Res> {
  factory _$$ProfileMediaListStateImplCopyWith(
          _$ProfileMediaListStateImpl value,
          $Res Function(_$ProfileMediaListStateImpl) then) =
      __$$ProfileMediaListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<MediaListSectorParam, List<MediaWithListModel>> sectorMap});
}

/// @nodoc
class __$$ProfileMediaListStateImplCopyWithImpl<$Res>
    extends _$ProfileMediaListStateCopyWithImpl<$Res,
        _$ProfileMediaListStateImpl>
    implements _$$ProfileMediaListStateImplCopyWith<$Res> {
  __$$ProfileMediaListStateImplCopyWithImpl(_$ProfileMediaListStateImpl _value,
      $Res Function(_$ProfileMediaListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileMediaListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorMap = null,
  }) {
    return _then(_$ProfileMediaListStateImpl(
      sectorMap: null == sectorMap
          ? _value._sectorMap
          : sectorMap // ignore: cast_nullable_to_non_nullable
              as Map<MediaListSectorParam, List<MediaWithListModel>>,
    ));
  }
}

/// @nodoc

class _$ProfileMediaListStateImpl implements _ProfileMediaListState {
  const _$ProfileMediaListStateImpl(
      {final Map<MediaListSectorParam, List<MediaWithListModel>> sectorMap =
          const {}})
      : _sectorMap = sectorMap;

  final Map<MediaListSectorParam, List<MediaWithListModel>> _sectorMap;
  @override
  @JsonKey()
  Map<MediaListSectorParam, List<MediaWithListModel>> get sectorMap {
    if (_sectorMap is EqualUnmodifiableMapView) return _sectorMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sectorMap);
  }

  @override
  String toString() {
    return 'ProfileMediaListState(sectorMap: $sectorMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileMediaListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._sectorMap, _sectorMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sectorMap));

  /// Create a copy of ProfileMediaListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileMediaListStateImplCopyWith<_$ProfileMediaListStateImpl>
      get copyWith => __$$ProfileMediaListStateImplCopyWithImpl<
          _$ProfileMediaListStateImpl>(this, _$identity);
}

abstract class _ProfileMediaListState implements ProfileMediaListState {
  const factory _ProfileMediaListState(
      {final Map<MediaListSectorParam, List<MediaWithListModel>>
          sectorMap}) = _$ProfileMediaListStateImpl;

  @override
  Map<MediaListSectorParam, List<MediaWithListModel>> get sectorMap;

  /// Create a copy of ProfileMediaListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileMediaListStateImplCopyWith<_$ProfileMediaListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
