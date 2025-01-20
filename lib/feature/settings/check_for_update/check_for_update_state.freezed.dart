// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_for_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckForUpdateState {
  bool get isLoading => throw _privateConstructorUsedError;
  AppVersion? get currentVersion => throw _privateConstructorUsedError;
  ReleasePackageModel? get latestReleasedPackage =>
      throw _privateConstructorUsedError;

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckForUpdateStateCopyWith<CheckForUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckForUpdateStateCopyWith<$Res> {
  factory $CheckForUpdateStateCopyWith(
          CheckForUpdateState value, $Res Function(CheckForUpdateState) then) =
      _$CheckForUpdateStateCopyWithImpl<$Res, CheckForUpdateState>;
  @useResult
  $Res call(
      {bool isLoading,
      AppVersion? currentVersion,
      ReleasePackageModel? latestReleasedPackage});

  $ReleasePackageModelCopyWith<$Res>? get latestReleasedPackage;
}

/// @nodoc
class _$CheckForUpdateStateCopyWithImpl<$Res, $Val extends CheckForUpdateState>
    implements $CheckForUpdateStateCopyWith<$Res> {
  _$CheckForUpdateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentVersion = freezed,
    Object? latestReleasedPackage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVersion: freezed == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      latestReleasedPackage: freezed == latestReleasedPackage
          ? _value.latestReleasedPackage
          : latestReleasedPackage // ignore: cast_nullable_to_non_nullable
              as ReleasePackageModel?,
    ) as $Val);
  }

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReleasePackageModelCopyWith<$Res>? get latestReleasedPackage {
    if (_value.latestReleasedPackage == null) {
      return null;
    }

    return $ReleasePackageModelCopyWith<$Res>(_value.latestReleasedPackage!,
        (value) {
      return _then(_value.copyWith(latestReleasedPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckForUpdateStateImplCopyWith<$Res>
    implements $CheckForUpdateStateCopyWith<$Res> {
  factory _$$CheckForUpdateStateImplCopyWith(_$CheckForUpdateStateImpl value,
          $Res Function(_$CheckForUpdateStateImpl) then) =
      __$$CheckForUpdateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AppVersion? currentVersion,
      ReleasePackageModel? latestReleasedPackage});

  @override
  $ReleasePackageModelCopyWith<$Res>? get latestReleasedPackage;
}

/// @nodoc
class __$$CheckForUpdateStateImplCopyWithImpl<$Res>
    extends _$CheckForUpdateStateCopyWithImpl<$Res, _$CheckForUpdateStateImpl>
    implements _$$CheckForUpdateStateImplCopyWith<$Res> {
  __$$CheckForUpdateStateImplCopyWithImpl(_$CheckForUpdateStateImpl _value,
      $Res Function(_$CheckForUpdateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentVersion = freezed,
    Object? latestReleasedPackage = freezed,
  }) {
    return _then(_$CheckForUpdateStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVersion: freezed == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as AppVersion?,
      latestReleasedPackage: freezed == latestReleasedPackage
          ? _value.latestReleasedPackage
          : latestReleasedPackage // ignore: cast_nullable_to_non_nullable
              as ReleasePackageModel?,
    ));
  }
}

/// @nodoc

class _$CheckForUpdateStateImpl implements _CheckForUpdateState {
  const _$CheckForUpdateStateImpl(
      {this.isLoading = false,
      this.currentVersion,
      this.latestReleasedPackage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AppVersion? currentVersion;
  @override
  final ReleasePackageModel? latestReleasedPackage;

  @override
  String toString() {
    return 'CheckForUpdateState(isLoading: $isLoading, currentVersion: $currentVersion, latestReleasedPackage: $latestReleasedPackage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckForUpdateStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentVersion, currentVersion) ||
                other.currentVersion == currentVersion) &&
            (identical(other.latestReleasedPackage, latestReleasedPackage) ||
                other.latestReleasedPackage == latestReleasedPackage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, currentVersion, latestReleasedPackage);

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckForUpdateStateImplCopyWith<_$CheckForUpdateStateImpl> get copyWith =>
      __$$CheckForUpdateStateImplCopyWithImpl<_$CheckForUpdateStateImpl>(
          this, _$identity);
}

abstract class _CheckForUpdateState implements CheckForUpdateState {
  const factory _CheckForUpdateState(
          {final bool isLoading,
          final AppVersion? currentVersion,
          final ReleasePackageModel? latestReleasedPackage}) =
      _$CheckForUpdateStateImpl;

  @override
  bool get isLoading;
  @override
  AppVersion? get currentVersion;
  @override
  ReleasePackageModel? get latestReleasedPackage;

  /// Create a copy of CheckForUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckForUpdateStateImplCopyWith<_$CheckForUpdateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
