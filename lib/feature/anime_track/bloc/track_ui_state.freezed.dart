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
  UserAnimeLoadState get animeLoadState => throw _privateConstructorUsedError;

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
  $Res call({bool isLoading, UserAnimeLoadState animeLoadState});
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
    Object? animeLoadState = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      animeLoadState: null == animeLoadState
          ? _value.animeLoadState
          : animeLoadState // ignore: cast_nullable_to_non_nullable
              as UserAnimeLoadState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrackUiStateCopyWith<$Res>
    implements $TrackUiStateCopyWith<$Res> {
  factory _$$_TrackUiStateCopyWith(
          _$_TrackUiState value, $Res Function(_$_TrackUiState) then) =
      __$$_TrackUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, UserAnimeLoadState animeLoadState});
}

/// @nodoc
class __$$_TrackUiStateCopyWithImpl<$Res>
    extends _$TrackUiStateCopyWithImpl<$Res, _$_TrackUiState>
    implements _$$_TrackUiStateCopyWith<$Res> {
  __$$_TrackUiStateCopyWithImpl(
      _$_TrackUiState _value, $Res Function(_$_TrackUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? animeLoadState = null,
  }) {
    return _then(_$_TrackUiState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      animeLoadState: null == animeLoadState
          ? _value.animeLoadState
          : animeLoadState // ignore: cast_nullable_to_non_nullable
              as UserAnimeLoadState,
    ));
  }
}

/// @nodoc

class _$_TrackUiState implements _TrackUiState {
  _$_TrackUiState(
      {this.isLoading = false,
      this.animeLoadState = const UserAnimeInitState()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserAnimeLoadState animeLoadState;

  @override
  String toString() {
    return 'TrackUiState(isLoading: $isLoading, animeLoadState: $animeLoadState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrackUiState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.animeLoadState, animeLoadState) ||
                other.animeLoadState == animeLoadState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, animeLoadState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackUiStateCopyWith<_$_TrackUiState> get copyWith =>
      __$$_TrackUiStateCopyWithImpl<_$_TrackUiState>(this, _$identity);
}

abstract class _TrackUiState implements TrackUiState {
  factory _TrackUiState(
      {final bool isLoading,
      final UserAnimeLoadState animeLoadState}) = _$_TrackUiState;

  @override
  bool get isLoading;
  @override
  UserAnimeLoadState get animeLoadState;
  @override
  @JsonKey(ignore: true)
  _$$_TrackUiStateCopyWith<_$_TrackUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
