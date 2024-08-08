// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  MediaType get currentMediaType => throw _privateConstructorUsedError;
  UserModel? get userData => throw _privateConstructorUsedError;
  List<HomeSectorCategory> get sectors => throw _privateConstructorUsedError;

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverUiStateCopyWith<DiscoverUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverUiStateCopyWith<$Res> {
  factory $DiscoverUiStateCopyWith(
          DiscoverUiState value, $Res Function(DiscoverUiState) then) =
      _$DiscoverUiStateCopyWithImpl<$Res, DiscoverUiState>;
  @useResult
  $Res call(
      {bool isLoading,
      MediaType currentMediaType,
      UserModel? userData,
      List<HomeSectorCategory> sectors});

  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$DiscoverUiStateCopyWithImpl<$Res, $Val extends DiscoverUiState>
    implements $DiscoverUiStateCopyWith<$Res> {
  _$DiscoverUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentMediaType = null,
    Object? userData = freezed,
    Object? sectors = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      sectors: null == sectors
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
    ) as $Val);
  }

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$DiscoverUiStateImplCopyWith<$Res>
    implements $DiscoverUiStateCopyWith<$Res> {
  factory _$$DiscoverUiStateImplCopyWith(_$DiscoverUiStateImpl value,
          $Res Function(_$DiscoverUiStateImpl) then) =
      __$$DiscoverUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      MediaType currentMediaType,
      UserModel? userData,
      List<HomeSectorCategory> sectors});

  @override
  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$DiscoverUiStateImplCopyWithImpl<$Res>
    extends _$DiscoverUiStateCopyWithImpl<$Res, _$DiscoverUiStateImpl>
    implements _$$DiscoverUiStateImplCopyWith<$Res> {
  __$$DiscoverUiStateImplCopyWithImpl(
      _$DiscoverUiStateImpl _value, $Res Function(_$DiscoverUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentMediaType = null,
    Object? userData = freezed,
    Object? sectors = null,
  }) {
    return _then(_$DiscoverUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      sectors: null == sectors
          ? _value._sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
    ));
  }
}

/// @nodoc

class _$DiscoverUiStateImpl implements _DiscoverUiState {
  _$DiscoverUiStateImpl(
      {this.isLoading = false,
      this.currentMediaType = MediaType.anime,
      this.userData,
      final List<HomeSectorCategory> sectors = const []})
      : _sectors = sectors;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final MediaType currentMediaType;
  @override
  final UserModel? userData;
  final List<HomeSectorCategory> _sectors;
  @override
  @JsonKey()
  List<HomeSectorCategory> get sectors {
    if (_sectors is EqualUnmodifiableListView) return _sectors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sectors);
  }

  @override
  String toString() {
    return 'DiscoverUiState(isLoading: $isLoading, currentMediaType: $currentMediaType, userData: $userData, sectors: $sectors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentMediaType, currentMediaType) ||
                other.currentMediaType == currentMediaType) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality().equals(other._sectors, _sectors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentMediaType,
      userData, const DeepCollectionEquality().hash(_sectors));

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverUiStateImplCopyWith<_$DiscoverUiStateImpl> get copyWith =>
      __$$DiscoverUiStateImplCopyWithImpl<_$DiscoverUiStateImpl>(
          this, _$identity);
}

abstract class _DiscoverUiState implements DiscoverUiState {
  factory _DiscoverUiState(
      {final bool isLoading,
      final MediaType currentMediaType,
      final UserModel? userData,
      final List<HomeSectorCategory> sectors}) = _$DiscoverUiStateImpl;

  @override
  bool get isLoading;
  @override
  MediaType get currentMediaType;
  @override
  UserModel? get userData;
  @override
  List<HomeSectorCategory> get sectors;

  /// Create a copy of DiscoverUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverUiStateImplCopyWith<_$DiscoverUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
