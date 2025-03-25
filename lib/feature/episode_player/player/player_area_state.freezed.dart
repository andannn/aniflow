// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_area_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerAreaState {
  PlayerState? get searchState => throw _privateConstructorUsedError;

  /// Create a copy of PlayerAreaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerAreaStateCopyWith<PlayerAreaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerAreaStateCopyWith<$Res> {
  factory $PlayerAreaStateCopyWith(
          PlayerAreaState value, $Res Function(PlayerAreaState) then) =
      _$PlayerAreaStateCopyWithImpl<$Res, PlayerAreaState>;
  @useResult
  $Res call({PlayerState? searchState});
}

/// @nodoc
class _$PlayerAreaStateCopyWithImpl<$Res, $Val extends PlayerAreaState>
    implements $PlayerAreaStateCopyWith<$Res> {
  _$PlayerAreaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerAreaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = freezed,
  }) {
    return _then(_value.copyWith(
      searchState: freezed == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerAreaStateImplCopyWith<$Res>
    implements $PlayerAreaStateCopyWith<$Res> {
  factory _$$PlayerAreaStateImplCopyWith(_$PlayerAreaStateImpl value,
          $Res Function(_$PlayerAreaStateImpl) then) =
      __$$PlayerAreaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlayerState? searchState});
}

/// @nodoc
class __$$PlayerAreaStateImplCopyWithImpl<$Res>
    extends _$PlayerAreaStateCopyWithImpl<$Res, _$PlayerAreaStateImpl>
    implements _$$PlayerAreaStateImplCopyWith<$Res> {
  __$$PlayerAreaStateImplCopyWithImpl(
      _$PlayerAreaStateImpl _value, $Res Function(_$PlayerAreaStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerAreaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchState = freezed,
  }) {
    return _then(_$PlayerAreaStateImpl(
      searchState: freezed == searchState
          ? _value.searchState
          : searchState // ignore: cast_nullable_to_non_nullable
              as PlayerState?,
    ));
  }
}

/// @nodoc

class _$PlayerAreaStateImpl implements _PlayerAreaState {
  const _$PlayerAreaStateImpl({this.searchState});

  @override
  final PlayerState? searchState;

  @override
  String toString() {
    return 'PlayerAreaState(searchState: $searchState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerAreaStateImpl &&
            (identical(other.searchState, searchState) ||
                other.searchState == searchState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchState);

  /// Create a copy of PlayerAreaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerAreaStateImplCopyWith<_$PlayerAreaStateImpl> get copyWith =>
      __$$PlayerAreaStateImplCopyWithImpl<_$PlayerAreaStateImpl>(
          this, _$identity);
}

abstract class _PlayerAreaState implements PlayerAreaState {
  const factory _PlayerAreaState({final PlayerState? searchState}) =
      _$PlayerAreaStateImpl;

  @override
  PlayerState? get searchState;

  /// Create a copy of PlayerAreaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerAreaStateImplCopyWith<_$PlayerAreaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
