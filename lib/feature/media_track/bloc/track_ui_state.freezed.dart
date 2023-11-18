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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrackUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showReleasedOnly => throw _privateConstructorUsedError;
  MediaType get currentMediaType => throw _privateConstructorUsedError;
  MediaListLoadState get animeLoadState => throw _privateConstructorUsedError;
  AniListSettings? get settings => throw _privateConstructorUsedError;

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
      MediaListLoadState animeLoadState,
      AniListSettings? settings});

  $AniListSettingsCopyWith<$Res>? get settings;
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
    Object? animeLoadState = null,
    Object? settings = freezed,
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
      animeLoadState: null == animeLoadState
          ? _value.animeLoadState
          : animeLoadState // ignore: cast_nullable_to_non_nullable
              as MediaListLoadState,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
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
      MediaListLoadState animeLoadState,
      AniListSettings? settings});

  @override
  $AniListSettingsCopyWith<$Res>? get settings;
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
    Object? animeLoadState = null,
    Object? settings = freezed,
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
      animeLoadState: null == animeLoadState
          ? _value.animeLoadState
          : animeLoadState // ignore: cast_nullable_to_non_nullable
              as MediaListLoadState,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
    ));
  }
}

/// @nodoc

class _$TrackUiStateImpl implements _TrackUiState {
  _$TrackUiStateImpl(
      {this.isLoading = false,
      this.showReleasedOnly = false,
      this.currentMediaType = MediaType.anime,
      this.animeLoadState = const MediaStateInitState(),
      this.settings});

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
  @JsonKey()
  final MediaListLoadState animeLoadState;
  @override
  final AniListSettings? settings;

  @override
  String toString() {
    return 'TrackUiState(isLoading: $isLoading, showReleasedOnly: $showReleasedOnly, currentMediaType: $currentMediaType, animeLoadState: $animeLoadState, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showReleasedOnly, showReleasedOnly) ||
                other.showReleasedOnly == showReleasedOnly) &&
            (identical(other.currentMediaType, currentMediaType) ||
                other.currentMediaType == currentMediaType) &&
            (identical(other.animeLoadState, animeLoadState) ||
                other.animeLoadState == animeLoadState) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, showReleasedOnly,
      currentMediaType, animeLoadState, settings);

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
      final MediaListLoadState animeLoadState,
      final AniListSettings? settings}) = _$TrackUiStateImpl;

  @override
  bool get isLoading;
  @override
  bool get showReleasedOnly;
  @override
  MediaType get currentMediaType;
  @override
  MediaListLoadState get animeLoadState;
  @override
  AniListSettings? get settings;
  @override
  @JsonKey(ignore: true)
  _$$TrackUiStateImplCopyWith<_$TrackUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
