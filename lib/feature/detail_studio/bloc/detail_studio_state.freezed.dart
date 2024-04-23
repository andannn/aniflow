// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_studio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailStudioState {
  bool get isLoading => throw _privateConstructorUsedError;
  StudioModel? get studioModel => throw _privateConstructorUsedError;
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStudioStateCopyWith<DetailStudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStudioStateCopyWith<$Res> {
  factory $DetailStudioStateCopyWith(
          DetailStudioState value, $Res Function(DetailStudioState) then) =
      _$DetailStudioStateCopyWithImpl<$Res, DetailStudioState>;
  @useResult
  $Res call(
      {bool isLoading,
      StudioModel? studioModel,
      UserTitleLanguage userTitleLanguage});

  $StudioModelCopyWith<$Res>? get studioModel;
}

/// @nodoc
class _$DetailStudioStateCopyWithImpl<$Res, $Val extends DetailStudioState>
    implements $DetailStudioStateCopyWith<$Res> {
  _$DetailStudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? studioModel = freezed,
    Object? userTitleLanguage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      studioModel: freezed == studioModel
          ? _value.studioModel
          : studioModel // ignore: cast_nullable_to_non_nullable
              as StudioModel?,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudioModelCopyWith<$Res>? get studioModel {
    if (_value.studioModel == null) {
      return null;
    }

    return $StudioModelCopyWith<$Res>(_value.studioModel!, (value) {
      return _then(_value.copyWith(studioModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailStudioStateImplCopyWith<$Res>
    implements $DetailStudioStateCopyWith<$Res> {
  factory _$$DetailStudioStateImplCopyWith(_$DetailStudioStateImpl value,
          $Res Function(_$DetailStudioStateImpl) then) =
      __$$DetailStudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      StudioModel? studioModel,
      UserTitleLanguage userTitleLanguage});

  @override
  $StudioModelCopyWith<$Res>? get studioModel;
}

/// @nodoc
class __$$DetailStudioStateImplCopyWithImpl<$Res>
    extends _$DetailStudioStateCopyWithImpl<$Res, _$DetailStudioStateImpl>
    implements _$$DetailStudioStateImplCopyWith<$Res> {
  __$$DetailStudioStateImplCopyWithImpl(_$DetailStudioStateImpl _value,
      $Res Function(_$DetailStudioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? studioModel = freezed,
    Object? userTitleLanguage = null,
  }) {
    return _then(_$DetailStudioStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      studioModel: freezed == studioModel
          ? _value.studioModel
          : studioModel // ignore: cast_nullable_to_non_nullable
              as StudioModel?,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
    ));
  }
}

/// @nodoc

class _$DetailStudioStateImpl implements _DetailStudioState {
  _$DetailStudioStateImpl(
      {this.isLoading = false,
      this.studioModel,
      this.userTitleLanguage = UserTitleLanguage.native});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final StudioModel? studioModel;
  @override
  @JsonKey()
  final UserTitleLanguage userTitleLanguage;

  @override
  String toString() {
    return 'DetailStudioState(isLoading: $isLoading, studioModel: $studioModel, userTitleLanguage: $userTitleLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStudioStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.studioModel, studioModel) ||
                other.studioModel == studioModel) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, studioModel, userTitleLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStudioStateImplCopyWith<_$DetailStudioStateImpl> get copyWith =>
      __$$DetailStudioStateImplCopyWithImpl<_$DetailStudioStateImpl>(
          this, _$identity);
}

abstract class _DetailStudioState implements DetailStudioState {
  factory _DetailStudioState(
      {final bool isLoading,
      final StudioModel? studioModel,
      final UserTitleLanguage userTitleLanguage}) = _$DetailStudioStateImpl;

  @override
  bool get isLoading;
  @override
  StudioModel? get studioModel;
  @override
  UserTitleLanguage get userTitleLanguage;
  @override
  @JsonKey(ignore: true)
  _$$DetailStudioStateImplCopyWith<_$DetailStudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
