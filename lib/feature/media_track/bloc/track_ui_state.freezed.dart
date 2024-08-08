// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrackUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  TrackListFilter get trackListFilter => throw _privateConstructorUsedError;
  MediaType get currentMediaType => throw _privateConstructorUsedError;
  SortedGroupMediaListModel? get sortedGroupMediaListModel =>
      throw _privateConstructorUsedError;
  UserModel? get userData => throw _privateConstructorUsedError;

  /// Create a copy of TrackUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackUiStateCopyWith<TrackUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackUiStateCopyWith<$Res> {
  factory $TrackUiStateCopyWith(
          TrackUiState value, $Res Function(TrackUiState) then) =
      _$TrackUiStateCopyWithImpl<$Res, TrackUiState>;
  @useResult
  $Res call(
      {bool isLoading,
      TrackListFilter trackListFilter,
      MediaType currentMediaType,
      SortedGroupMediaListModel? sortedGroupMediaListModel,
      UserModel? userData});

  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$TrackUiStateCopyWithImpl<$Res, $Val extends TrackUiState>
    implements $TrackUiStateCopyWith<$Res> {
  _$TrackUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? trackListFilter = null,
    Object? currentMediaType = null,
    Object? sortedGroupMediaListModel = freezed,
    Object? userData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trackListFilter: null == trackListFilter
          ? _value.trackListFilter
          : trackListFilter // ignore: cast_nullable_to_non_nullable
              as TrackListFilter,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      sortedGroupMediaListModel: freezed == sortedGroupMediaListModel
          ? _value.sortedGroupMediaListModel
          : sortedGroupMediaListModel // ignore: cast_nullable_to_non_nullable
              as SortedGroupMediaListModel?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of TrackUiState
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
abstract class _$$TrackUiStateImplCopyWith<$Res>
    implements $TrackUiStateCopyWith<$Res> {
  factory _$$TrackUiStateImplCopyWith(
          _$TrackUiStateImpl value, $Res Function(_$TrackUiStateImpl) then) =
      __$$TrackUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TrackListFilter trackListFilter,
      MediaType currentMediaType,
      SortedGroupMediaListModel? sortedGroupMediaListModel,
      UserModel? userData});

  @override
  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$TrackUiStateImplCopyWithImpl<$Res>
    extends _$TrackUiStateCopyWithImpl<$Res, _$TrackUiStateImpl>
    implements _$$TrackUiStateImplCopyWith<$Res> {
  __$$TrackUiStateImplCopyWithImpl(
      _$TrackUiStateImpl _value, $Res Function(_$TrackUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? trackListFilter = null,
    Object? currentMediaType = null,
    Object? sortedGroupMediaListModel = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$TrackUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trackListFilter: null == trackListFilter
          ? _value.trackListFilter
          : trackListFilter // ignore: cast_nullable_to_non_nullable
              as TrackListFilter,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      sortedGroupMediaListModel: freezed == sortedGroupMediaListModel
          ? _value.sortedGroupMediaListModel
          : sortedGroupMediaListModel // ignore: cast_nullable_to_non_nullable
              as SortedGroupMediaListModel?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$TrackUiStateImpl implements _TrackUiState {
  _$TrackUiStateImpl(
      {this.isLoading = false,
      this.trackListFilter = TrackListFilter.all,
      this.currentMediaType = MediaType.anime,
      this.sortedGroupMediaListModel,
      this.userData});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final TrackListFilter trackListFilter;
  @override
  @JsonKey()
  final MediaType currentMediaType;
  @override
  final SortedGroupMediaListModel? sortedGroupMediaListModel;
  @override
  final UserModel? userData;

  @override
  String toString() {
    return 'TrackUiState(isLoading: $isLoading, trackListFilter: $trackListFilter, currentMediaType: $currentMediaType, sortedGroupMediaListModel: $sortedGroupMediaListModel, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.trackListFilter, trackListFilter) ||
                other.trackListFilter == trackListFilter) &&
            (identical(other.currentMediaType, currentMediaType) ||
                other.currentMediaType == currentMediaType) &&
            (identical(other.sortedGroupMediaListModel,
                    sortedGroupMediaListModel) ||
                other.sortedGroupMediaListModel == sortedGroupMediaListModel) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, trackListFilter,
      currentMediaType, sortedGroupMediaListModel, userData);

  /// Create a copy of TrackUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackUiStateImplCopyWith<_$TrackUiStateImpl> get copyWith =>
      __$$TrackUiStateImplCopyWithImpl<_$TrackUiStateImpl>(this, _$identity);
}

abstract class _TrackUiState implements TrackUiState {
  factory _TrackUiState(
      {final bool isLoading,
      final TrackListFilter trackListFilter,
      final MediaType currentMediaType,
      final SortedGroupMediaListModel? sortedGroupMediaListModel,
      final UserModel? userData}) = _$TrackUiStateImpl;

  @override
  bool get isLoading;
  @override
  TrackListFilter get trackListFilter;
  @override
  MediaType get currentMediaType;
  @override
  SortedGroupMediaListModel? get sortedGroupMediaListModel;
  @override
  UserModel? get userData;

  /// Create a copy of TrackUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackUiStateImplCopyWith<_$TrackUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
