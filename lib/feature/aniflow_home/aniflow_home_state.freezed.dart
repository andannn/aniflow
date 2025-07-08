// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aniflow_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AniflowHomeState {
  bool get isSocialFeatureEnabled => throw _privateConstructorUsedError;
  bool get isPresentationMode => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AniflowHomeStateCopyWith<AniflowHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AniflowHomeStateCopyWith<$Res> {
  factory $AniflowHomeStateCopyWith(
          AniflowHomeState value, $Res Function(AniflowHomeState) then) =
      _$AniflowHomeStateCopyWithImpl<$Res, AniflowHomeState>;
  @useResult
  $Res call(
      {bool isSocialFeatureEnabled,
      bool isPresentationMode,
      UserModel? userModel});

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$AniflowHomeStateCopyWithImpl<$Res, $Val extends AniflowHomeState>
    implements $AniflowHomeStateCopyWith<$Res> {
  _$AniflowHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSocialFeatureEnabled = null,
    Object? isPresentationMode = null,
    Object? userModel = freezed,
  }) {
    return _then(_value.copyWith(
      isSocialFeatureEnabled: null == isSocialFeatureEnabled
          ? _value.isSocialFeatureEnabled
          : isSocialFeatureEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPresentationMode: null == isPresentationMode
          ? _value.isPresentationMode
          : isPresentationMode // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AniflowHomeStateImplCopyWith<$Res>
    implements $AniflowHomeStateCopyWith<$Res> {
  factory _$$AniflowHomeStateImplCopyWith(_$AniflowHomeStateImpl value,
          $Res Function(_$AniflowHomeStateImpl) then) =
      __$$AniflowHomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSocialFeatureEnabled,
      bool isPresentationMode,
      UserModel? userModel});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$AniflowHomeStateImplCopyWithImpl<$Res>
    extends _$AniflowHomeStateCopyWithImpl<$Res, _$AniflowHomeStateImpl>
    implements _$$AniflowHomeStateImplCopyWith<$Res> {
  __$$AniflowHomeStateImplCopyWithImpl(_$AniflowHomeStateImpl _value,
      $Res Function(_$AniflowHomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSocialFeatureEnabled = null,
    Object? isPresentationMode = null,
    Object? userModel = freezed,
  }) {
    return _then(_$AniflowHomeStateImpl(
      isSocialFeatureEnabled: null == isSocialFeatureEnabled
          ? _value.isSocialFeatureEnabled
          : isSocialFeatureEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPresentationMode: null == isPresentationMode
          ? _value.isPresentationMode
          : isPresentationMode // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$AniflowHomeStateImpl implements _AniflowHomeState {
  const _$AniflowHomeStateImpl(
      {this.isSocialFeatureEnabled = false,
      this.isPresentationMode = false,
      this.userModel});

  @override
  @JsonKey()
  final bool isSocialFeatureEnabled;
  @override
  @JsonKey()
  final bool isPresentationMode;
  @override
  final UserModel? userModel;

  @override
  String toString() {
    return 'AniflowHomeState(isSocialFeatureEnabled: $isSocialFeatureEnabled, isPresentationMode: $isPresentationMode, userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AniflowHomeStateImpl &&
            (identical(other.isSocialFeatureEnabled, isSocialFeatureEnabled) ||
                other.isSocialFeatureEnabled == isSocialFeatureEnabled) &&
            (identical(other.isPresentationMode, isPresentationMode) ||
                other.isPresentationMode == isPresentationMode) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSocialFeatureEnabled, isPresentationMode, userModel);

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AniflowHomeStateImplCopyWith<_$AniflowHomeStateImpl> get copyWith =>
      __$$AniflowHomeStateImplCopyWithImpl<_$AniflowHomeStateImpl>(
          this, _$identity);
}

abstract class _AniflowHomeState implements AniflowHomeState {
  const factory _AniflowHomeState(
      {final bool isSocialFeatureEnabled,
      final bool isPresentationMode,
      final UserModel? userModel}) = _$AniflowHomeStateImpl;

  @override
  bool get isSocialFeatureEnabled;
  @override
  bool get isPresentationMode;
  @override
  UserModel? get userModel;

  /// Create a copy of AniflowHomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AniflowHomeStateImplCopyWith<_$AniflowHomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
