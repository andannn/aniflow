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
  bool get showReleasedOnly => throw _privateConstructorUsedError;
  MediaType get currentMediaType => throw _privateConstructorUsedError;
  SortedGroupMediaListModel? get sortedGroupMediaListModel =>
      throw _privateConstructorUsedError;
  AniListSettings? get settings => throw _privateConstructorUsedError;
  UserModel? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      bool showReleasedOnly,
      MediaType currentMediaType,
      SortedGroupMediaListModel? sortedGroupMediaListModel,
      AniListSettings? settings,
      UserModel? userData});

  $AniListSettingsCopyWith<$Res>? get settings;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showReleasedOnly = null,
    Object? currentMediaType = null,
    Object? sortedGroupMediaListModel = freezed,
    Object? settings = freezed,
    Object? userData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showReleasedOnly: null == showReleasedOnly
          ? _value.showReleasedOnly
          : showReleasedOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      sortedGroupMediaListModel: freezed == sortedGroupMediaListModel
          ? _value.sortedGroupMediaListModel
          : sortedGroupMediaListModel // ignore: cast_nullable_to_non_nullable
              as SortedGroupMediaListModel?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AniListSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $AniListSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

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
      bool showReleasedOnly,
      MediaType currentMediaType,
      SortedGroupMediaListModel? sortedGroupMediaListModel,
      AniListSettings? settings,
      UserModel? userData});

  @override
  $AniListSettingsCopyWith<$Res>? get settings;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showReleasedOnly = null,
    Object? currentMediaType = null,
    Object? sortedGroupMediaListModel = freezed,
    Object? settings = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$TrackUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showReleasedOnly: null == showReleasedOnly
          ? _value.showReleasedOnly
          : showReleasedOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      sortedGroupMediaListModel: freezed == sortedGroupMediaListModel
          ? _value.sortedGroupMediaListModel
          : sortedGroupMediaListModel // ignore: cast_nullable_to_non_nullable
              as SortedGroupMediaListModel?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
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
      this.showReleasedOnly = false,
      this.currentMediaType = MediaType.anime,
      this.sortedGroupMediaListModel,
      this.settings,
      this.userData});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool showReleasedOnly;
  @override
  @JsonKey()
  final MediaType currentMediaType;
  @override
  final SortedGroupMediaListModel? sortedGroupMediaListModel;
  @override
  final AniListSettings? settings;
  @override
  final UserModel? userData;

  @override
  String toString() {
    return 'TrackUiState(isLoading: $isLoading, showReleasedOnly: $showReleasedOnly, currentMediaType: $currentMediaType, sortedGroupMediaListModel: $sortedGroupMediaListModel, settings: $settings, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showReleasedOnly, showReleasedOnly) ||
                other.showReleasedOnly == showReleasedOnly) &&
            (identical(other.currentMediaType, currentMediaType) ||
                other.currentMediaType == currentMediaType) &&
            (identical(other.sortedGroupMediaListModel,
                    sortedGroupMediaListModel) ||
                other.sortedGroupMediaListModel == sortedGroupMediaListModel) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, showReleasedOnly,
      currentMediaType, sortedGroupMediaListModel, settings, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackUiStateImplCopyWith<_$TrackUiStateImpl> get copyWith =>
      __$$TrackUiStateImplCopyWithImpl<_$TrackUiStateImpl>(this, _$identity);
}

abstract class _TrackUiState implements TrackUiState {
  factory _TrackUiState(
      {final bool isLoading,
      final bool showReleasedOnly,
      final MediaType currentMediaType,
      final SortedGroupMediaListModel? sortedGroupMediaListModel,
      final AniListSettings? settings,
      final UserModel? userData}) = _$TrackUiStateImpl;

  @override
  bool get isLoading;
  @override
  bool get showReleasedOnly;
  @override
  MediaType get currentMediaType;
  @override
  SortedGroupMediaListModel? get sortedGroupMediaListModel;
  @override
  AniListSettings? get settings;
  @override
  UserModel? get userData;
  @override
  @JsonKey(ignore: true)
  _$$TrackUiStateImplCopyWith<_$TrackUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
